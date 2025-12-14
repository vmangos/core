/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Log.h"
#include "Opcodes.h"
#include "Spell.h"
#include "CreatureAI.h"
#include "Util.h"
#include "Pet.h"
#include "Group.h"

void WorldSession::HandlePetAction(WorldPacket& recv_data)
{
    ObjectGuid petGuid;
    uint32 data;
    ObjectGuid targetGuid;
    recv_data >> petGuid;
    recv_data >> data;
    recv_data >> targetGuid;

    uint32 spellid = UNIT_ACTION_BUTTON_ACTION(data);
    uint8 flag = UNIT_ACTION_BUTTON_TYPE(data);             // delete = 0x07 CastSpell = C1

    // used also for charmed creature/player
    Unit* pCharmedUnit = _player->GetMap()->GetUnit(petGuid);
    if (!pCharmedUnit)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetAction: %s not exist.", petGuid.GetString().c_str());
        return;
    }

    if (GetPlayer()->GetObjectGuid() != pCharmedUnit->GetCharmerOrOwnerGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetAction: %s isn't controlled by %s.", petGuid.GetString().c_str(), GetPlayer()->GetGuidStr().c_str());
        return;
    }

    if (!pCharmedUnit->IsAlive())
        return;

    Creature* pCharmedCreature = pCharmedUnit->ToCreature();

    if (!pCharmedCreature)
    {
        // controller player can only do melee attack
        if (!(flag == ACT_REACTION || flag == ACT_COMMAND))
            return;
    }
    else if (pCharmedCreature->IsPet())
    {
        // pet can have action bar disabled
        if (!((Pet*)pCharmedUnit)->IsEnabled())
            return;
    }

    CharmInfo* charmInfo = pCharmedUnit->GetCharmInfo();
    if (!charmInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandlePetAction: object (GUID: %u TypeId: %u) is considered pet-like but doesn't have a charminfo!", pCharmedUnit->GetGUIDLow(), pCharmedUnit->GetTypeId());
        return;
    }

    switch (flag)
    {
        case ACT_COMMAND:                                   // 0x07
        {
            Unit* pTarget = targetGuid.IsEmpty() ? nullptr : _player->GetMap()->GetUnit(targetGuid);
            pCharmedUnit->HandlePetCommand((CommandStates)spellid, pTarget);
            break;
        }
        case ACT_REACTION:                                  // 0x6
            switch (spellid)
            {
                case REACT_PASSIVE:                         //passive
                    pCharmedUnit->InterruptNonMeleeSpells(false);
                    pCharmedUnit->AttackStop();
                // no break
                case REACT_DEFENSIVE:                       //recovery
                case REACT_AGGRESSIVE:                      //activete
                    charmInfo->SetReactState(ReactStates(spellid));
                    break;
            }
            break;
        case ACT_DISABLED:                                  // 0x81    spell (disabled), ignore
        case ACT_PASSIVE:                                   // 0x01
        case ACT_ENABLED:                                   // 0xC1    spell
        {
            Unit* pUnitTarget = nullptr;
            if (targetGuid)
                pUnitTarget = _player->GetMap()->GetUnit(targetGuid);

            // do not cast unknown spells
            SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellid);
            if (!spellInfo)
            {
                sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WORLD: unknown PET spell id %i", spellid);
                return;
            }

            if (!pCharmedUnit->IsSpellReady(*spellInfo))
            {
                pCharmedUnit->SendPetCastFail(spellid, SPELL_FAILED_NOT_READY);
                return;
            }

            // do not cast not learned spells
            if (!pCharmedUnit->HasSpell(spellid) || spellInfo->IsPassiveSpell())
            {
                pCharmedUnit->SendPetCastFail(spellid, SPELL_FAILED_NOT_KNOWN);
                return;
            }

            bool const explicitlySelectedTarget = Spells::IsExplicitlySelectedUnitTarget(spellInfo->EffectImplicitTargetA[0]);

            if (!pUnitTarget && explicitlySelectedTarget)
            {
                pCharmedUnit->SendPetCastFail(spellid, SPELL_FAILED_BAD_IMPLICIT_TARGETS);
                return;
            }
            
            if (pUnitTarget == pCharmedUnit && 
                // Cannot cast negative spells on yourself. Handle it here since casting negative
                // spells on yourself is frequently used within the core itself for certain mechanics.
                ((explicitlySelectedTarget && !spellInfo->IsPositiveSpell(pCharmedUnit, pUnitTarget)) ||
                // spells not castable on self like Fire Shield
                spellInfo->HasAttribute(SPELL_ATTR_EX_EXCLUDE_CASTER)))
            {
                pCharmedUnit->SendPetCastFail(spellid, SPELL_FAILED_BAD_TARGETS);
                return;
            }

            // remove not needed target
            if (pUnitTarget && pUnitTarget != pCharmedUnit && !explicitlySelectedTarget)
                pUnitTarget = nullptr;

            // make sure pet is facing target
            if (pUnitTarget && pUnitTarget != pCharmedUnit && !pCharmedUnit->HasUnitState(UNIT_STATE_CAN_NOT_REACT) &&
                spellInfo->IsNeedFaceTarget() && !pCharmedUnit->IsFacingTarget(pUnitTarget))
            {
                float orientation = pCharmedUnit->GetAngle(pUnitTarget);
                pCharmedUnit->SetFacingTo(orientation);
                pCharmedUnit->SetOrientation(orientation);
            }

            pCharmedUnit->ClearUnitState(UNIT_STATE_MOVING);
            SpellCastResult result = pCharmedUnit->CastSpell(pUnitTarget, spellInfo, false);

            if (result == SPELL_CAST_OK)
            {
                if (pCharmedUnit->IsPet())
                    ((Pet*)pCharmedUnit)->CheckLearning(spellid);

                if (pCharmedUnit->IsMoving() && pCharmedUnit->IsNoMovementSpellCasted())
                    pCharmedUnit->StopMoving();
            }
            else
                pCharmedUnit->SendPetCastFail(spellid, result);


            break;
        }
        default:
            sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WORLD: unknown PET flag Action %i and spellid %i.", uint32(flag), spellid);
    }
}

void WorldSession::HandlePetStopAttack(WorldPacket& recv_data)
{
    ObjectGuid petGuid;
    recv_data >> petGuid;

    Unit* pet = GetPlayer()->GetMap()->GetUnit(petGuid);    // pet or controlled creature/player
    if (!pet)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetStopAttack: %s doesn't exist.", petGuid.GetString().c_str());
        return;
    }

    if (GetPlayer()->GetObjectGuid() != pet->GetCharmerOrOwnerGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetStopAttack: %s isn't charm/pet of %s.", petGuid.GetString().c_str(), GetPlayer()->GetGuidStr().c_str());
        return;
    }

    if (!pet->IsAlive())
        return;

    pet->AttackStop();
}

void WorldSession::HandlePetNameQueryOpcode(WorldPacket& recv_data)
{
    uint32 petNumber;
    ObjectGuid petGuid;

    recv_data >> petNumber;
    recv_data >> petGuid;

    SendPetNameQuery(petGuid, petNumber);
}

void WorldSession::SendPetNameQuery(ObjectGuid petGuid, uint32 petNumber)
{
    Creature* pet = _player->GetMap()->GetAnyTypeCreature(petGuid);
    if (!pet || !pet->GetCharmInfo() || pet->GetCharmInfo()->GetPetNumber() != petNumber)
        return;

    std::string name = pet->GetName();

    WorldPacket data(SMSG_PET_NAME_QUERY_RESPONSE, (4 + 4 + name.size() + 1));
    data << uint32(petNumber);
    data << name.c_str();
    data << uint32(pet->GetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP));

    _player->GetSession()->SendPacket(&data);
}

void WorldSession::HandlePetSetAction(WorldPacket& recv_data)
{
    ObjectGuid petGuid;
    uint8  count;

    recv_data >> petGuid;

    Creature* pet = _player->GetMap()->GetAnyTypeCreature(petGuid);

    if (!pet || (pet != _player->GetPet() && pet != _player->GetCharm()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetSetAction: Unknown pet or pet owner.");
        return;
    }

    // pet can have action bar disabled
    if (pet->IsPet() && !((Pet*)pet)->IsEnabled())
        return;

    CharmInfo* charmInfo = pet->GetCharmInfo();
    if (!charmInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandlePetSetAction: object (GUID: %u TypeId: %u) is considered pet-like but doesn't have a charminfo!", pet->GetGUIDLow(), pet->GetTypeId());
        return;
    }

    count = (recv_data.size() == 24) ? 2 : 1;

    uint32 position[2];
    uint32 data[2];
    bool move_command = false;

    for (uint8 i = 0; i < count; ++i)
    {
        recv_data >> position[i];
        recv_data >> data[i];

        uint8 act_state = UNIT_ACTION_BUTTON_TYPE(data[i]);

        // ignore invalid position
        if (position[i] >= MAX_UNIT_ACTION_BAR_INDEX)
            return;

        // in the normal case, command and reaction buttons can only be moved, not removed
        // at moving count ==2, at removing count == 1
        // ignore attempt to remove command|reaction buttons (not possible at normal case)
        if (act_state == ACT_COMMAND || act_state == ACT_REACTION)
        {
            if (count == 1)
                return;

            move_command = true;
        }
    }

    // check swap (at command->spell swap client remove spell first in another packet, so check only command move correctness)
    if (move_command)
    {
        uint8 act_state_0 = UNIT_ACTION_BUTTON_TYPE(data[0]);
        if (act_state_0 == ACT_COMMAND || act_state_0 == ACT_REACTION)
        {
            uint32 spell_id_0 = UNIT_ACTION_BUTTON_ACTION(data[0]);
            UnitActionBarEntry const* actionEntry_1 = charmInfo->GetActionBarEntry(position[1]);
            if (!actionEntry_1 || spell_id_0 != actionEntry_1->GetAction() ||
                    act_state_0 != actionEntry_1->GetType())
                return;
        }

        uint8 act_state_1 = UNIT_ACTION_BUTTON_TYPE(data[1]);
        if (act_state_1 == ACT_COMMAND || act_state_1 == ACT_REACTION)
        {
            uint32 spell_id_1 = UNIT_ACTION_BUTTON_ACTION(data[1]);
            UnitActionBarEntry const* actionEntry_0 = charmInfo->GetActionBarEntry(position[0]);
            if (!actionEntry_0 || spell_id_1 != actionEntry_0->GetAction() ||
                    act_state_1 != actionEntry_0->GetType())
                return;
        }
    }

    for (uint8 i = 0; i < count; ++i)
    {
        uint32 spellId = UNIT_ACTION_BUTTON_ACTION(data[i]);
        uint8 act_state = UNIT_ACTION_BUTTON_TYPE(data[i]);

        sLog.Out(LOG_BASIC, LOG_LVL_DETAIL, "Player %s has changed pet spell action. Position: %u, Spell: %u, State: 0x%X", _player->GetName(), position[i], spellId, uint32(act_state));

        // if it's act for spell (en/disable/cast) and there is a spell given (0 = remove spell) which pet doesn't know, don't add
        if (!((act_state == ACT_ENABLED || act_state == ACT_DISABLED || act_state == ACT_PASSIVE) && spellId && !pet->HasSpell(spellId)))
        {
            // sign for autocast
            if (act_state == ACT_ENABLED && spellId)
            {
                if (pet->IsCharmed())
                    charmInfo->ToggleCreatureAutocast(spellId, true);
                else
                    ((Pet*)pet)->ToggleAutocast(spellId, true);
            }
            // sign for no/turn off autocast
            else if (act_state == ACT_DISABLED && spellId)
            {
                if (pet->IsCharmed())
                    charmInfo->ToggleCreatureAutocast(spellId, false);
                else
                    ((Pet*)pet)->ToggleAutocast(spellId, false);
            }

            charmInfo->SetActionBar(position[i], spellId, ActiveStates(act_state));
        }
    }
}

void WorldSession::HandlePetRename(WorldPacket& recv_data)
{
    ObjectGuid petGuid;
    std::string name;

    recv_data >> petGuid;
    recv_data >> name;

    Pet* pet = _player->GetMap()->GetPet(petGuid);
    // check it!
    if (!pet || pet->GetPetType() != HUNTER_PET ||
            !pet->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME) ||
            pet->GetOwnerGuid() != _player->GetObjectGuid() || !pet->GetCharmInfo())
        return;

    // World of Warcraft Client Patch 1.7.0 (2005-09-13)
    // - Hunters are now able to rename their pets while mounted.
#if SUPPORTED_CLIENT_BUILD <= CLIENT_BUILD_1_6_1
    if (_player->IsMounted())
        return;
#endif

    PetNameInvalidReason res = ObjectMgr::CheckPetName(name);
    if (res != PET_NAME_SUCCESS)
    {
        SendPetNameInvalid(res, name);
        return;
    }

    if (sObjectMgr.IsReservedName(name))
    {
        SendPetNameInvalid(PET_NAME_RESERVED, name);
        return;
    }

    pet->SetName(name);

    if (_player->GetGroup())
        _player->SetGroupUpdateFlag(GROUP_UPDATE_FLAG_PET_NAME);

    pet->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME);

    CharacterDatabase.BeginTransaction();
    CharacterDatabase.escape_string(name);
    CharacterDatabase.PExecute("UPDATE `character_pet` SET `name` = '%s', `renamed` = '1' WHERE `owner_guid` = '%u' AND `id` = '%u'", name.c_str(), _player->GetGUIDLow(), pet->GetCharmInfo()->GetPetNumber());
    CharacterDatabase.CommitTransaction();

    pet->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, uint32(time(nullptr)));
}

void WorldSession::HandlePetAbandon(WorldPacket& recv_data)
{
    ObjectGuid guid;
    recv_data >> guid;                                      // pet guid

    if (!_player->IsInWorld())
        return;

    // pet/charmed
    if (Unit* petUnit = _player->GetMap()->GetUnit(guid))
    {
        if (petUnit->GetOwnerGuid() != _player->GetObjectGuid() || !petUnit->GetCharmInfo())
            return;

        Creature* petCreature = petUnit->GetTypeId() == TYPEID_UNIT ? static_cast<Creature*>(petUnit) : nullptr;
        Pet* pet = petCreature && petCreature->IsPet() ? static_cast<Pet*>(petUnit) : nullptr;

        if (pet)
        {
            // Permanently abandon pet
            if (pet->GetPetType() == HUNTER_PET)
                pet->Unsummon(PET_SAVE_AS_DELETED, _player);
            // Simply dismiss
            else
                pet->Unsummon(PET_SAVE_NOT_IN_SLOT);
        }
        else if (petUnit->GetObjectGuid() == _player->GetCharmGuid())
        {
            _player->Uncharm();
        }
    }
}

void WorldSession::HandlePetUnlearnOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;
    recvPacket >> guid;                 // Pet guid

    Pet* pet = _player->GetPet();

    if (!pet || guid != pet->GetObjectGuid())
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetUnlearnOpcode. %s isn't pet of %s .", guid.GetString().c_str(), GetPlayer()->GetGuidStr().c_str());
        return;
    }

    if (pet->GetPetType() != HUNTER_PET || pet->m_petSpells.size() <= 1)
        return;

    CharmInfo* charmInfo = pet->GetCharmInfo();
    if (!charmInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandlePetUnlearnOpcode: %s is considered pet-like but doesn't have a charminfo!", pet->GetGuidStr().c_str());
        return;
    }

    uint32 cost = pet->GetResetTalentsCost();

    if (GetPlayer()->GetMoney() < cost)
    {
        GetPlayer()->SendBuyError(BUY_ERR_NOT_ENOUGHT_MONEY, 0, 0, 0);
        return;
    }

    for (PetSpellMap::iterator itr = pet->m_petSpells.begin(); itr != pet->m_petSpells.end();)
    {
        uint32 spellId = itr->first;                       // Pet::RemoveSpell can invalidate iterator at erase NEW spell
        ++itr;
        pet->UnlearnSpell(spellId, false);
    }

    pet->SetTP(pet->GetLevel() * (pet->GetLoyaltyLevel() - 1));

    for (int i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
        if (UnitActionBarEntry const* ab = charmInfo->GetActionBarEntry(i))
            if (ab->GetAction() && ab->IsActionBarForSpell())
                charmInfo->SetActionBar(i, 0, ACT_DISABLED);

    // relearn pet passives
    pet->LearnPetPassives();

    pet->m_resetTalentsTime = time(nullptr);
    pet->m_resetTalentsCost = cost;
    GetPlayer()->ModifyMoney(-(int32)cost);

    GetPlayer()->PetSpellInitialize();
}

void WorldSession::HandlePetSpellAutocastOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;
    uint32 spellid;
    uint8  state;                                           // 1 for on, 0 for off
    recvPacket >> guid >> spellid >> state;

    Creature* pet = _player->GetMap()->GetAnyTypeCreature(guid);
    if (!pet || (guid != _player->GetPetGuid() && guid != _player->GetCharmGuid()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetSpellAutocastOpcode. %s isn't pet of %s .", guid.GetString().c_str(), GetPlayer()->GetGuidStr().c_str());
        return;
    }

    // do not add not learned spells/ passive spells
    if (!pet->HasSpell(spellid) || !Spells::IsAutocastable(spellid))
        return;

    CharmInfo* charmInfo = pet->GetCharmInfo();
    if (!charmInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WorldSession::HandlePetSpellAutocastOpcod: %s is considered pet-like but doesn't have a charminfo!", guid.GetString().c_str());
        return;
    }

    if (pet->IsCharmed())
        // state can be used as boolean
        pet->GetCharmInfo()->ToggleCreatureAutocast(spellid, state);
    else
        ((Pet*)pet)->ToggleAutocast(spellid, state);

    charmInfo->SetSpellAutocast(spellid, state);
}

void WorldSession::HandlePetCastSpellOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;
    uint32 spellid;
    recvPacket >> guid >> spellid;

    Creature* pet = _player->GetMap()->GetAnyTypeCreature(guid);

    if (!pet || (guid != _player->GetPetGuid() && guid != _player->GetCharmGuid()))
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "HandlePetCastSpellOpcode: %s isn't pet of %s .", guid.GetString().c_str(), GetPlayer()->GetGuidStr().c_str());
        return;
    }

    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(spellid);
    if (!spellInfo)
    {
        sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "WORLD: unknown PET spell id %i", spellid);
        return;
    }

    if (!pet->IsSpellReady(*spellInfo))
        return;

    // do not cast not learned spells
    if (!pet->HasSpell(spellid) || spellInfo->IsPassiveSpell())
        return;

    SpellCastTargets targets;

    recvPacket >> targets.ReadForCaster(pet);

    pet->ClearUnitState(UNIT_STATE_MOVING);

    Spell* spell = new Spell(pet, spellInfo, false);
    spell->m_targets = targets;

    SpellCastResult result = spell->CheckPetCast(nullptr);
    if (result == SPELL_CAST_OK)
    {
        if (pet->IsPet())
        {
            ((Pet*)pet)->CheckLearning(spellid);

            //10% chance to play special pet attack talk, else growl
            //actually this only seems to happen on special spells, fire shield for imp, torment for voidwalker, but it's stupid to check every spell
            if (((Pet*)pet)->GetPetType() == SUMMON_PET && (urand(0, 100) < 10))
                pet->SendPetTalk((uint32)PET_TALK_SPECIAL_SPELL);
            else
                pet->SendPetAIReaction();
        }

        spell->prepare();
    }
    else
    {
        pet->SendPetCastFail(spellid, result);
        if (pet->IsSpellReady(spellid))
            GetPlayer()->SendClearCooldown(spellid, pet);

        spell->finish(false);
        spell->Delete();
    }
}

void WorldSession::SendPetNameInvalid(uint32 error, std::string const& name)
{
    WorldPacket data(SMSG_PET_NAME_INVALID, 0);
    SendPacket(&data);
}
