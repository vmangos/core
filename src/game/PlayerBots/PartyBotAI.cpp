#include "PartyBotAI.h"
#include "Player.h"
#include "Log.h"
#include "MotionMaster.h"
#include "ObjectMgr.h"
#include "PlayerBotMgr.h"
#include "WorldPacket.h"
#include "Spell.h"
#include "SpellAuras.h"
#include "Chat.h"
#include <random>

enum PartyBotSpells
{
    PB_SPELL_FOOD = 1131,
    PB_SPELL_DRINK = 1137,
    PB_SPELL_AUTO_SHOT = 75,
    PB_SPELL_TAME_BEAST = 13481,

    PB_SPELL_SUMMON_IMP = 688,
    PB_SPELL_SUMMON_VOIDWALKER = 697,
    PB_SPELL_SUMMON_FELHUNTER = 691,
    PB_SPELL_SUMMON_SUCCUBUS = 712,

    PB_PET_WOLF    = 565,
    PB_PET_CAT     = 681,
    PB_PET_BEAR    = 822,
    PB_PET_CRAB    = 831,
    PB_PET_GORILLA = 1108,
    PB_PET_BIRD    = 1109,
    PB_PET_BOAR    = 1190,
    PB_PET_BAT     = 1554,
    PB_PET_CROC    = 1693,
    PB_PET_SPIDER  = 1781,
    PB_PET_OWL     = 1997,
    PB_PET_STRIDER = 2322,
    PB_PET_SCORPID = 3127,
    PB_PET_SERPENT = 3247,
    PB_PET_RAPTOR  = 3254,
    PB_PET_TURTLE  = 3461,
    PB_PET_HYENA   = 4127,
};

#define PB_UPDATE_INTERVAL 1000
#define PB_MIN_FOLLOW_DIST 3.0f
#define PB_MAX_FOLLOW_DIST 6.0f
#define PB_MIN_FOLLOW_ANGLE 0.0f
#define PB_MAX_FOLLOW_ANGLE 6.0f

void PartyBotAI::AutoAssignRole()
{
    switch (me->GetClass())
    {
        case CLASS_WARRIOR:
            m_role = PB_ROLE_TANK;
            return;
        case CLASS_HUNTER:
        case CLASS_ROGUE:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            m_role = PB_ROLE_DPS;
            return;
    }

    // Remaining classes are healers.
    m_role = PB_ROLE_HEALER;
}

void PartyBotAI::ResetSpellData()
{
    m_selfBuffSpell = nullptr;
    m_partyBuffSpell = nullptr;
    m_resurrectionSpell = nullptr;
    spellListDamageAura.clear();
    spellListSpellDamage.clear();
    spellListWeaponDamage.clear();
    spellListAuraBar.clear();
    spellListTaunt.clear();
    spellListInterrupt.clear();
    spellListHealAura.clear();
    spellListHeal.clear();
    spellListCrowdControlAura.clear();
}

void PartyBotAI::PopulateSpellData()
{
    for (const auto& spell : me->GetSpellMap())
    {
        if (spell.second.disabled)
            continue;

        if (spell.second.state == PLAYERSPELL_REMOVED)
            continue;

        SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spell.first);
        if (!pSpellEntry)
            continue;

        if (pSpellEntry->HasAttribute(SPELL_ATTR_PASSIVE))
            continue;

        if (pSpellEntry->HasAttribute(SPELL_ATTR_HIDDEN_CLIENTSIDE))
            continue;

        if (pSpellEntry->HasAttribute(SPELL_ATTR_EX2_DISPLAY_IN_STANCE_BAR))
            spellListAuraBar.push_back(pSpellEntry);

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (pSpellEntry->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spellListHeal.insert(pSpellEntry);
                case SPELL_EFFECT_SCHOOL_DAMAGE:
                case SPELL_EFFECT_HEALTH_LEECH:
                    spellListSpellDamage.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
                case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
                case SPELL_EFFECT_WEAPON_DAMAGE:
                case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:
                    spellListWeaponDamage.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_ATTACK_ME:
                    spellListTaunt.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_INTERRUPT_CAST:
                    spellListInterrupt.push_back(pSpellEntry);
                    break;
                case SPELL_EFFECT_RESURRECT:
                case SPELL_EFFECT_RESURRECT_NEW:
                    m_resurrectionSpell = pSpellEntry;
                    break;
                case SPELL_EFFECT_HEAL_MAX_HEALTH:
                    m_fullHealSpell = pSpellEntry;
                    break;
                case SPELL_EFFECT_THREAT:
                case SPELL_EFFECT_THREAT_ALL:
                    if (pSpellEntry->EffectBasePoints[i] < 0 &&
                        (!m_panicSpell || m_panicSpell->Id < pSpellEntry->Id))
                        m_panicSpell = pSpellEntry;
                case SPELL_EFFECT_APPLY_AURA:
                {
                    switch (pSpellEntry->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_PERIODIC_DAMAGE:
                            spellListDamageAura.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_PERIODIC_HEAL:
                            spellListHealAura.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_SHAPESHIFT:
                        {
                            if (m_role == PB_ROLE_TANK)
                            {
                                switch (pSpellEntry->EffectMiscValue[i])
                                {
                                    case FORM_BEAR:
                                    case FORM_DIREBEAR:
                                    case FORM_CREATUREBEAR:
                                    case FORM_DEFENSIVESTANCE:
                                        spellListAuraBar.push_back(pSpellEntry);
                                        break;
                                }
                            }
                            else if (m_role == PB_ROLE_DPS)
                            {
                                switch (pSpellEntry->EffectMiscValue[i])
                                {
                                    case FORM_MOONKIN:
                                    case FORM_CAT:
                                    case FORM_SHADOW:
                                    case FORM_BATTLESTANCE:
                                    case FORM_BERSERKERSTANCE:
                                        spellListAuraBar.push_back(pSpellEntry);
                                        break;
                                }
                            }
                            break;
                        }
                        case SPELL_AURA_MOD_CONFUSE:
                        case SPELL_AURA_MOD_FEAR:
                        case SPELL_AURA_MOD_STUN:
                            spellListCrowdControlAura.insert(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_TAUNT:
                            spellListTaunt.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_SILENCE:
                            spellListInterrupt.push_back(pSpellEntry);
                            break;
                        case SPELL_AURA_MOD_THREAT:
                            if (m_role == PB_ROLE_TANK &&
                                pSpellEntry->EffectBasePoints[i] > 0)
                                m_selfBuffSpell = pSpellEntry;
                            else if (pSpellEntry->EffectBasePoints[i] < 0)
                                m_panicSpell = pSpellEntry;
                            break;
                        case SPELL_AURA_MOD_TOTAL_THREAT:
                            if (pSpellEntry->EffectBasePoints[i] < 0)
                                m_panicSpell = pSpellEntry;
                            break;
                        case SPELL_AURA_SCHOOL_IMMUNITY:
                        case SPELL_AURA_FEIGN_DEATH:
                            m_panicSpell = pSpellEntry;
                            break;
                        case SPELL_AURA_EMPATHY:
                        case SPELL_AURA_MOD_POSSESS_PET:
                        case SPELL_AURA_NO_PVP_CREDIT:
                        case SPELL_AURA_DUMMY:
                            break;
                        default:
                            if (pSpellEntry->IsPositiveSpell() &&
                                pSpellEntry->GetMaxDuration() >= 30000 &&
                               !pSpellEntry->Reagent[0])
                            {
                                SpellEntry const** pCurrentBuff = Spells::IsExplicitPositiveTarget(pSpellEntry->EffectImplicitTargetA[i]) ?
                                                                  &m_partyBuffSpell : &m_selfBuffSpell;
                                if (!(*pCurrentBuff) || (pSpellEntry->Id > (*pCurrentBuff)->Id) ||
                                    !sSpellMgr.IsRankSpellDueToSpell(pSpellEntry, (*pCurrentBuff)->Id))
                                    *pCurrentBuff = pSpellEntry;
                            }
                            break;
                    }
                    break;
                }
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                    spellListAuraBar.push_back(pSpellEntry);
                    break;
            }
        }
    }

    uint64 seed = time(nullptr);
    std::shuffle(spellListHealAura.begin(), spellListHealAura.end(), std::default_random_engine(seed));
    std::shuffle(spellListDamageAura.begin(), spellListDamageAura.end(), std::default_random_engine(seed));
    std::shuffle(spellListSpellDamage.begin(), spellListSpellDamage.end(), std::default_random_engine(seed));
    std::shuffle(spellListWeaponDamage.begin(), spellListWeaponDamage.end(), std::default_random_engine(seed));
}

void PartyBotAI::CloneFromPlayer(Player const* pPlayer)
{
    if (pPlayer->GetLevel() != me->GetLevel())
    {
        me->GiveLevel(pPlayer->GetLevel());
        me->InitTalentForLevel();
        me->SetUInt32Value(PLAYER_XP, 0);
    }

    // Learn all of the target's spells.
    for (const auto& spell : pPlayer->GetSpellMap())
    {
        if (spell.second.disabled)
            continue;

        if (spell.second.state == PLAYERSPELL_REMOVED)
            continue;

        SpellEntry const* pSpellEntry = sSpellMgr.GetSpellEntry(spell.first);
        if (!pSpellEntry)
            continue;

        uint32 const firstRankId = sSpellMgr.GetFirstSpellInChain(spell.first);
        if (!me->HasSpell(spell.first))
            me->LearnSpell(spell.first, false, (firstRankId == spell.first && GetTalentSpellPos(firstRankId)));
    }

    // Unequip current gear
    for (int i = EQUIPMENT_SLOT_START; i < EQUIPMENT_SLOT_END; ++i)
        me->AutoUnequipItemFromSlot(i);

    // Copy gear from target.
    for (int i = EQUIPMENT_SLOT_START; i < EQUIPMENT_SLOT_END; ++i)
    {
        if (Item* pItem = pPlayer->GetItemByPos(INVENTORY_SLOT_BAG_0, i))
            me->StoreNewItemInBestSlots(pItem->GetEntry(), 1);
    }
}

void PartyBotAI::LearnPremadeSpecForClass()
{
    for (const auto& itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
    {
        if (itr.second.requiredClass == me->GetClass())
        {
            sObjectMgr.ApplyPremadeSpecTemplateToPlayer(itr.first, me);
            break;
        }
    }
}

Player* PartyBotAI::GetPartyLeader() const
{
    Group* pGroup = me->GetGroup();
    if (!pGroup)
        return nullptr;

    ObjectGuid leaderGuid = pGroup->GetLeaderGuid();
    if (leaderGuid == me->GetObjectGuid() && !me->InBattleGround())
        return nullptr;

    return ObjectAccessor::FindPlayerNotInWorld(m_leaderGuid);
}

bool PartyBotAI::DrinkAndEat()
{
    bool const needToEat = me->GetHealthPercent() < 100.0f;
    bool const needToDrink = (me->GetPowerType() == POWER_MANA) && (me->GetPowerPercent(POWER_MANA) < 100.0f);

    if (!needToEat && !needToDrink)
        return false;

    bool const isEating = me->HasAura(PB_SPELL_FOOD);
    bool const isDrinking = me->HasAura(PB_SPELL_DRINK);

    if (!isEating && needToEat)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, PB_SPELL_FOOD, true);
        return true;
    }

    if (!isDrinking && needToDrink)
    {
        if (me->GetMotionMaster()->GetCurrentMovementGeneratorType())
        {
            me->StopMoving();
            me->GetMotionMaster()->MoveIdle();
        }
        me->CastSpell(me, PB_SPELL_DRINK, true);
        return true;
    }

    return needToEat || needToDrink;
}

bool PartyBotAI::IsValidHealTarget(Unit const* pTarget) const
{
    return (pTarget->GetHealthPercent() < 100.0f) &&
            pTarget->IsAlive() &&
            me->IsWithinLOSInMap(pTarget) &&
            me->IsWithinDist(pTarget, 30.0f);
}

Unit* PartyBotAI::SelectHealTarget(Player* pLeader) const
{
    if (IsValidHealTarget(me))
        return me;

    if (IsValidHealTarget(pLeader))
        return pLeader;

    if (Pet* pPet = pLeader->GetPet())
        if (IsValidHealTarget(pPet))
            return pPet;

    Unit* pTarget = nullptr;
    float healthPercent = 100.0f;

    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Unit* pMember = itr->getSource())
        {
            // We already checked self and leader.
            if (pMember == me || pMember == pLeader)
                continue;

            // Avoid all healers picking same target.
            if (pTarget && !urand(0, 4))
                return pTarget;

            // Check if we should heal party member.
            if ((IsValidHealTarget(pMember) &&
                healthPercent > pMember->GetHealthPercent()) ||
            // Or a pet if there are no injured players.
                (!pTarget && (pMember = pMember->GetPet()) &&
                 IsValidHealTarget(pMember)))
            {
                healthPercent = pMember->GetHealthPercent();
                pTarget = pMember;
            }
        }
    }

    if (healthPercent == 100.0f)
        return nullptr;

    return pTarget;
}

bool PartyBotAI::IsValidHostileTarget(Unit const* pTarget) const
{
    return pTarget->IsTargetableForAttack(false, true) &&
           me->IsValidAttackTarget(pTarget) &&
           !pTarget->HasBreakableByDamageCrowdControlAura();
}

Unit* PartyBotAI::SelectAttackTarget(Player* pLeader) const
{
    // Who is the leader attacking.
    if (Unit* pVictim = pLeader->GetVictim())
    {
        if (IsValidHostileTarget(pVictim))
            return pVictim;
    }

    // Who is attacking the leader.
    for (const auto pAttacker : pLeader->GetAttackers())
    {
        if (IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Who is attacking me.
    for (const auto pAttacker : me->GetAttackers())
    {
        if (IsValidHostileTarget(pAttacker))
            return pAttacker;
    }

    // Check if other group members are under attack.
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // We already checked self and leader.
            if (pMember == me || pMember == pLeader)
                continue;

            for (const auto pAttacker : pMember->GetAttackers())
            {
                if (IsValidHostileTarget(pAttacker))
                    return pAttacker;
            }
        }
    }

    return nullptr;
}

Player* PartyBotAI::SelectResurrectionTarget() const
{
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            // Can't resurrect self.
            if (pMember == me)
                continue;

            if (pMember->GetDeathState() == CORPSE)
                return pMember;
        }
    }

    return nullptr;
}

bool PartyBotAI::IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const
{
    std::list<uint32> morePowerfullSpells;
    sSpellMgr.ListMorePowerfullSpells(pSpellEntry->Id, morePowerfullSpells);

    for (const auto& i : pTarget->GetSpellAuraHolderMap())
    {
        if (i.first == pSpellEntry->Id)
            return false;

        if (sSpellMgr.IsRankSpellDueToSpell(pSpellEntry, i.first))
            return false;

        for (const auto& it : morePowerfullSpells)
            if (it == i.first)
                return false;
    }
        
    return true;
}

Player* PartyBotAI::SelectBuffTarget(SpellEntry const* pSpellEntry) const
{
    Group* pGroup = me->GetGroup();
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != nullptr; itr = itr->next())
    {
        if (Player* pMember = itr->getSource())
        {
            if (pMember->IsAlive() &&
                IsValidBuffTarget(pMember, pSpellEntry) &&
                me->IsWithinLOSInMap(pMember) &&
                me->IsWithinDist(pMember, 30.0f))
                return pMember;
        }
    }

    return nullptr;
}

void PartyBotAI::SummonPetIfNeeded()
{
    if (me->GetClass() == CLASS_HUNTER)
    {
        if (me->GetPetGuid())
            return;

        if (me->GetLevel() < 10)
            return;

        std::vector<uint32> vPets = { PB_PET_WOLF, PB_PET_CAT, PB_PET_BEAR, PB_PET_CRAB, PB_PET_GORILLA, PB_PET_BIRD,
                                      PB_PET_BOAR, PB_PET_BAT, PB_PET_CROC, PB_PET_SPIDER, PB_PET_OWL, PB_PET_STRIDER,
                                      PB_PET_SCORPID, PB_PET_SERPENT, PB_PET_RAPTOR, PB_PET_TURTLE, PB_PET_HYENA };
        if (Creature* pCreature = me->SummonCreature(SelectRandomContainerElement(vPets),
            me->GetPositionX(), me->GetPositionY(), me->GetPositionZ(), 0.0f,
            TEMPSUMMON_TIMED_COMBAT_OR_DEAD_DESPAWN, 3000, false, 3000))
        {
            pCreature->SetLevel(me->GetLevel());
            me->CastSpell(pCreature, PB_SPELL_TAME_BEAST, true);
        }
    }
    else if (me->GetClass() == CLASS_WARLOCK)
    {
        if (me->GetPetGuid())
            return;

        std::vector<uint32> vSummons;
        if (me->HasSpell(PB_SPELL_SUMMON_IMP))
            vSummons.push_back(PB_SPELL_SUMMON_IMP);
        if (me->HasSpell(PB_SPELL_SUMMON_VOIDWALKER))
            vSummons.push_back(PB_SPELL_SUMMON_VOIDWALKER);
        if (me->HasSpell(PB_SPELL_SUMMON_FELHUNTER))
            vSummons.push_back(PB_SPELL_SUMMON_FELHUNTER);
        if (me->HasSpell(PB_SPELL_SUMMON_SUCCUBUS))
            vSummons.push_back(PB_SPELL_SUMMON_SUCCUBUS);
        if (!vSummons.empty())
            me->CastSpell(me, SelectRandomContainerElement(vSummons), true);
    }
}

bool IsPhysicalDamageClass(uint8 playerClass)
{
    switch (playerClass)
    {
        case CLASS_WARRIOR:
        case CLASS_ROGUE:
        case CLASS_HUNTER:
            return true;
    }
    return false;
}

bool IsRangedDamageClass(uint8 playerClass)
{
    switch (playerClass)
    {
        case CLASS_HUNTER:
        case CLASS_PRIEST:
        case CLASS_MAGE:
        case CLASS_WARLOCK:
            return true;
    }
    return false;
}

void PartyBotAI::CastRandomDamageSpell(Unit* pVictim)
{
    if (IsPhysicalDamageClass(me->GetClass()))
    {
        for (const auto pSpellEntry : spellListWeaponDamage)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    if (urand(0, 1) && !spellListDamageAura.empty())
    {
        for (const auto pSpellEntry : spellListDamageAura)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
    else
    {
        for (const auto pSpellEntry : spellListSpellDamage)
        {
            if (CanTryToCastSpell(pVictim, pSpellEntry))
            {
                if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                    return;
            }
        }
    }
}

bool PartyBotAI::CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (me->HasSpellCooldown(pSpellEntry->Id))
        return false;

    uint32 const powerCost = Spell::CalculatePowerCost(pSpellEntry, me);
    Powers const powerType = Powers(pSpellEntry->powerType);

    if (powerType == POWER_HEALTH)
    {
        if (me->GetHealth() <= powerCost)
            return false;
        return true;
    }

    if (me->GetPower(powerType) < powerCost)
        return false;

    if (pTarget->IsImmuneToSpell(pSpellEntry, false))
        return false;

    if (pSpellEntry->IsSpellAppliesAura() && pTarget->HasAura(pSpellEntry->Id))
        return false;

    SpellRangeEntry const* srange = sSpellRangeStore.LookupEntry(pSpellEntry->rangeIndex);
    if (me != pTarget && pSpellEntry->EffectImplicitTargetA[0] != TARGET_UNIT_CASTER)
    {
        float const dist = me->GetCombatDistance(pTarget);

        if (dist > srange->maxRange)
            return false;
        if (srange->minRange && dist < srange->minRange)
            return false;
    }

    return true;
}

SpellCastResult PartyBotAI::DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry)
{
    if (me != pTarget &&
       !me->HasInArc(2 * M_PI_F / 3, pTarget))
        me->SetFacingToObject(pTarget);

    if (me->IsMounted())
        me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

    me->SetTargetGuid(pTarget->GetObjectGuid());
    auto result = me->CastSpell(pTarget, pSpellEntry, false);

    if ((result == SPELL_FAILED_MOVING ||
        result == SPELL_CAST_OK) &&
        (pSpellEntry->GetCastTime() > 0) &&
        (me->IsMoving() || !me->IsStopped()))
        me->StopMoving();

    return result;
}

void PartyBotAI::EquipOrUseNewItem()
{
    for (int i = INVENTORY_SLOT_ITEM_START; i < INVENTORY_SLOT_ITEM_END; ++i)
    {
        Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, i);
        if (pItem && !pItem->IsEquipped())
        {
            switch (pItem->GetProto()->Class)
            {
                case ITEM_CLASS_CONSUMABLE:
                {
                    SpellCastTargets targets;
                    targets.setUnitTarget(me);
                    me->CastItemUseSpell(pItem, targets);
                    break;
                }
                case ITEM_CLASS_WEAPON:
                case ITEM_CLASS_ARMOR:
                {
                    uint32 slot = me->FindEquipSlot(pItem->GetProto(), NULL_SLOT, true);
                    if (slot != NULL_SLOT)
                    {
                        if (Item* pItem2 = me->GetItemByPos(INVENTORY_SLOT_BAG_0, slot))
                            me->DestroyItem(INVENTORY_SLOT_BAG_0, slot, true);

                        // Learn required proficiency
                        if (uint32 proficiencySpellId = pItem->GetProto()->GetProficiencySpell())
                            if (!me->HasSpell(proficiencySpellId))
                                me->LearnSpell(proficiencySpellId, false, false);

                        me->RemoveItem(INVENTORY_SLOT_BAG_0, i, false);
                        me->EquipItem(slot, pItem, true);
                    }
                    break;
                }
            }
        }
    }
}

void PartyBotAI::AddToPlayerGroup()
{
    Player* pPlayer = ObjectAccessor::FindPlayer(m_leaderGuid);
    if (!pPlayer)
        return;

    Group* group = pPlayer->GetGroup();
    if (!group)
    {
        group = new Group;
        // new group: if can't add then delete
        if (!group->Create(pPlayer->GetObjectGuid(), pPlayer->GetName()))
        {
            delete group;
            return;
        }
        sObjectMgr.AddGroup(group);
    }

    group->AddMember(me->GetObjectGuid(), me->GetName());
}

void PartyBotAI::SendFakePacket(uint16 opcode)
{
    switch (opcode)
    {
        case MSG_MOVE_WORLDPORT_ACK:
        {
            me->GetSession()->HandleMoveWorldportAckOpcode();
            m_checkBuffs = true;
            break;
        }
        case MSG_MOVE_TELEPORT_ACK:
        {
            WorldPacket data(MSG_MOVE_TELEPORT_ACK);
            data << me->GetObjectGuid();
    #if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_9_4
            data << uint32(0) << uint32(time(nullptr));
    #else
            data << uint32(time(nullptr));
    #endif
            me->GetSession()->HandleMoveTeleportAckOpcode(data);
            break;
        }
        case CMSG_BATTLEFIELD_PORT:
        {
            for (uint32 i = BATTLEGROUND_QUEUE_AV; i <= BATTLEGROUND_QUEUE_AB; i++)
            {
                if (me->IsInvitedForBattleGroundQueueType(BattleGroundQueueTypeId(i)))
                {
                    WorldPacket data(CMSG_BATTLEFIELD_PORT);
#if SUPPORTED_CLIENT_BUILD > CLIENT_BUILD_1_8_4
                    data << uint32(GetBattleGrounMapIdByTypeId(BattleGroundTypeId(i)));
#endif
                    data << uint8(1);
                    me->GetSession()->HandleBattleFieldPortOpcode(data);
                    break;
                }
            }
            break;
        }
        case CMSG_LOOT_ROLL:
        {
            if (m_lootResponses.empty())
                return;

            auto loot = m_lootResponses.begin();
            WorldPacket data(CMSG_LOOT_ROLL);
            data << uint64((*loot).guid);
            data << uint32((*loot).slot);
            data << uint8(0); // pass
            m_lootResponses.erase(loot);
            me->GetSession()->HandleLootRoll(data);
        }
    }
}

void PartyBotAI::OnPacketReceived(WorldPacket const* packet)
{
    //printf("Bot received %s\n", LookupOpcodeName(packet->GetOpcode()));
    switch (packet->GetOpcode())
    {
        case SMSG_NEW_WORLD:
        {
            botEntry->m_pendingResponses.push_back(MSG_MOVE_WORLDPORT_ACK);
            break;
        }
        case MSG_MOVE_TELEPORT_ACK:
        {
            botEntry->m_pendingResponses.push_back(MSG_MOVE_TELEPORT_ACK);
            break;
        }
        case SMSG_TRADE_STATUS:
        {
            uint32 status = *((uint32*)(*packet).contents());
            if (status == TRADE_STATUS_BEGIN_TRADE)
            {
                WorldPacket data(CMSG_BEGIN_TRADE);
                me->GetSession()->HandleBeginTradeOpcode(data);
            }
            else if (status == TRADE_STATUS_TRADE_ACCEPT)
            {
                if (Item* pItem = me->GetItemByPos(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START))
                    me->DestroyItem(INVENTORY_SLOT_BAG_0, INVENTORY_SLOT_ITEM_START, true);

                WorldPacket data(CMSG_ACCEPT_TRADE);
                data << uint32(1);
                me->GetSession()->HandleAcceptTradeOpcode(data);
            }
            else if (status == TRADE_STATUS_TRADE_COMPLETE)
            {
                EquipOrUseNewItem();
            }
            break;
        }
        case SMSG_RESURRECT_REQUEST:
        {
            me->ResurectUsingRequestData();
            break;
        }
        case SMSG_BATTLEFIELD_STATUS:
        {
            if (me->IsBeingTeleported() || me->InBattleGround())
                m_receivedBgInvite = false;
            else
            {
                for (uint32 i = BATTLEGROUND_QUEUE_AV; i <= BATTLEGROUND_QUEUE_AB; i++)
                {
                    if (me->IsInvitedForBattleGroundQueueType(BattleGroundQueueTypeId(i)))
                    {
                        m_receivedBgInvite = true;
                        break;
                    }
                }
            }
            break;
        }
        case SMSG_LOOT_START_ROLL:
        {
            uint64 guid = *((uint64*)(*packet).contents());
            uint32 slot = *(((uint32*)(*packet).contents())+2);
            m_lootResponses.emplace_back(LootResponseData(guid, slot ));
            botEntry->m_pendingResponses.push_back(CMSG_LOOT_ROLL);
            break;
        }
    }
}

void PartyBotAI::OnPlayerLogin()
{
    if (!m_initialized)
        me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
}

void PartyBotAI::UpdateAI(uint32 const diff)
{
    m_updateTimer.Update(diff);
    if (m_updateTimer.Passed())
        m_updateTimer.Reset(PB_UPDATE_INTERVAL);
    else
        return;

    if (!me->IsInWorld() || me->IsBeingTeleported())
        return;

    if (!m_initialized)
    {
        AddToPlayerGroup();

        if (m_role == PB_ROLE_INVALID)
            AutoAssignRole();

        if (Player const* pPlayer = sObjectAccessor.FindPlayer(m_cloneGuid))
            CloneFromPlayer(pPlayer);
        else
            LearnPremadeSpecForClass();

        PopulateSpellData();
        me->UpdateSkillsToMaxSkillsForLevel();
        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
        SummonPetIfNeeded();
        m_initialized = true;
        return;
    }

    Player* pLeader = GetPartyLeader();
    if (!pLeader)
    {
        botEntry->requestRemoval = true;
        return;
    }

    if (!pLeader->IsInWorld())
        return;

    if (pLeader->InBattleGround() &&
        !me->InBattleGround())
    {
        if (m_receivedBgInvite)
        {
            SendFakePacket(CMSG_BATTLEFIELD_PORT);
            m_receivedBgInvite = false;
            return;
        }
        
        // Remain idle until we can join battleground.
        return;
    }

    if (me->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
        return;

    if (me->IsDead())
    {
        if (me->InBattleGround())
        {
            if (me->GetDeathState() == CORPSE)
            {
                me->BuildPlayerRepop();
                me->RepopAtGraveyard();
            }
        }
        else
        {
            if (me->GetDeathState() == DEAD)
            {
                me->ResurrectPlayer(0.5f);
                me->SpawnCorpseBones();
                me->SendCreateUpdateToPlayer(pLeader);
            }
        }
        
        return;
    }

    if (me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
    {
        // Stop auto shot if no target.
        if (!me->GetVictim())
            me->InterruptSpell(CURRENT_AUTOREPEAT_SPELL, true);

        return;
    }

    if (me->IsNonMeleeSpellCasted(false, false, true))
        return;

    if (!me->IsInCombat())
    {
        if (m_checkBuffs &&
            // dont interrupt drinking
            me->GetStandState() == UNIT_STAND_STATE_STAND &&
            // only buff if not low on mana
           ((me->GetPowerType() != POWER_MANA) || (me->GetPowerPercent(POWER_MANA) > 50.0f)))
        {
            if (m_selfBuffSpell && me->GetGlobalCooldownMgr().HasGlobalCooldown(m_selfBuffSpell))
                return;
            if (m_partyBuffSpell && me->GetGlobalCooldownMgr().HasGlobalCooldown(m_partyBuffSpell))
                return;

            if (m_selfBuffSpell)
                if (CanTryToCastSpell(me, m_selfBuffSpell))
                    if (DoCastSpell(me, m_selfBuffSpell) == SPELL_CAST_OK)
                        return;
                
            if (m_partyBuffSpell)
                if (Player* pTarget = SelectBuffTarget(m_partyBuffSpell))
                    if (CanTryToCastSpell(pTarget, m_partyBuffSpell))
                        if (DoCastSpell(pTarget, m_partyBuffSpell) == SPELL_CAST_OK)
                            return;

            SummonPetIfNeeded();
            m_checkBuffs = false;
            return;
        }

        if (DrinkAndEat())
            return;

        if (m_resurrectionSpell)
            if (Player* pTarget = SelectResurrectionTarget())
                if (CanTryToCastSpell(pTarget, m_resurrectionSpell))
                    if (DoCastSpell(pTarget, m_resurrectionSpell) == SPELL_CAST_OK)
                        return;

        // Teleport to leader if too far away.
        if (!me->IsWithinDistInMap(pLeader, 100.0f))
        {
            if (!me->IsStopped())
                me->StopMoving();
            me->GetMotionMaster()->Clear();
            me->GetMotionMaster()->MoveIdle();
            char name[128] = {};
            strcpy(name, pLeader->GetName());
            ChatHandler(me).HandleGonameCommand(name);
            return;
        }

        // Mount if leader is mounted.
        if (pLeader->IsMounted())
        {
            if (!me->IsMounted())
            {
                auto auraList = pLeader->GetAurasByType(SPELL_AURA_MOUNTED);
                if (!auraList.empty())
                {
                    bool oldState = me->HasCheatOption(PLAYER_CHEAT_NO_CAST_TIME);
                    me->SetCheatOption(PLAYER_CHEAT_NO_CAST_TIME, true);
                    me->CastSpell(me, (*auraList.begin())->GetId(), true);
                    me->SetCheatOption(PLAYER_CHEAT_NO_CAST_TIME, oldState);
                } 
            }
        }
        else if (me->IsMounted())
            me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
    }
    else
    {
        m_checkBuffs = true; // rebuff as soon as we leave combat
    }

    if (me->GetStandState() != UNIT_STAND_STATE_STAND)
        me->SetStandState(UNIT_STAND_STATE_STAND);

    if (!spellListAuraBar.empty())
    {
        bool noAura = true;
        for (auto spell : spellListAuraBar)
        {
            if (me->HasAura(spell->Id))
            {
                noAura = false;
                break;
            }
        }

        if (noAura)
            me->CastSpell(me, SelectRandomContainerElement(spellListAuraBar), false);
    }

    Unit* pVictim = me->GetVictim();

    if (m_role != PB_ROLE_HEALER)
    {
        if (!pVictim || pVictim->IsDead() || pVictim->HasBreakableByDamageCrowdControlAura())
        {
            if (pVictim = SelectAttackTarget(pLeader))
            {
                if (me->IsMounted())
                    me->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);

                if (me->Attack(pVictim, true))
                {
                    if (m_role == PB_ROLE_DPS && IsRangedDamageClass(me->GetClass()) &&
                        me->GetPowerPercent(POWER_MANA) > 10.0f && me->GetCombatDistance(pVictim) > 8.0f)
                        me->SetCasterChaseDistance(25.0f);

                    me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
                } 
            }
        }

        if (pVictim && !me->HasInArc(2 * M_PI_F / 3, pVictim) && !me->IsMoving())
        {
            me->SetInFront(pVictim);
            me->SetFacingToObject(pVictim);
            me->SendHeartBeat();
        }

        if (!pVictim)
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
                me->GetMotionMaster()->MoveFollow(pLeader, urand(PB_MIN_FOLLOW_DIST, PB_MAX_FOLLOW_DIST), frand(PB_MIN_FOLLOW_ANGLE, PB_MAX_FOLLOW_ANGLE));
        }
        else
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() == FOLLOW_MOTION_TYPE)
                me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
        }
    }

    // Combat Logic Below

    if (pVictim && me->HasDistanceCasterMovement() &&
        me->GetMotionMaster()->GetCurrentMovementGeneratorType() == CHASE_MOTION_TYPE &&
        ((me->GetPowerPercent(POWER_MANA) < 10.0f) ||
        (!me->CanReachWithMeleeAutoAttack(pVictim) && me->GetCombatDistance(pVictim) <= 8.0f)))
    {
        me->SetCasterChaseDistance(0.0f);
        me->GetMotionMaster()->MoveChase(pVictim, 1.0f);
    }

    // Crowd control and run from enemies.
    if (!me->GetAttackers().empty() &&
       (m_role != PB_ROLE_TANK))
    {
        Unit* pAttacker = *me->GetAttackers().begin();
        if (!pAttacker->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL))
        {
            if (m_panicSpell && me->GetHealthPercent() < 60.0f &&
                CanTryToCastSpell(pAttacker, m_panicSpell))
            {
                if (DoCastSpell(Spells::IsExplicitNegativeTarget(m_panicSpell->EffectImplicitTargetA[0]) ?
                    pAttacker : me, m_panicSpell) == SPELL_CAST_OK)
                    return;
            }
            if (!spellListCrowdControlAura.empty())
            {
                for (const auto pSpellEntry : spellListCrowdControlAura)
                {
                    if (CanTryToCastSpell(pAttacker, pSpellEntry))
                    {
                        if (DoCastSpell(pAttacker, pSpellEntry) == SPELL_CAST_OK)
                        {
                            if (pAttacker == me->GetVictim())
                                me->AttackStop(true);
                            return;
                        }
                    }
                }
            }
            if (me->IsCaster() && me->IsWithinDist(pAttacker, 15.0f) && me->GetHealthPercent() < 20.0f)
            {
                me->GetMotionMaster()->MoveDistance(pAttacker, 20.0f);
                return;
            }
        }
    }

    if (m_role != PB_ROLE_HEALER)
    {
        if (!pVictim)
            return;

        // If tank then taunt mobs attacking others.
        if (m_role == PB_ROLE_TANK &&
            me != pVictim->GetVictim() &&
            !spellListTaunt.empty())
        {
            for (const auto pSpellEntry : spellListTaunt)
            {
                if (!pVictim->HasBreakableByDamageCrowdControlAura() &&
                    !pVictim->HasUnitState(UNIT_STAT_CAN_NOT_REACT_OR_LOST_CONTROL) &&
                    CanTryToCastSpell(pVictim, pSpellEntry))
                {
                    if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        // Interrupt enemy spell casting.
        if (!spellListInterrupt.empty() &&
            pVictim->IsNonMeleeSpellCasted())
        {
            for (const auto pSpellEntry : spellListInterrupt)
            {
                if (CanTryToCastSpell(pVictim, pSpellEntry))
                {
                    if (DoCastSpell(pVictim, pSpellEntry) == SPELL_CAST_OK)
                        return;
                }
            }
        }

        // Make hunter use auto shot.
        if (me->HasSpell(PB_SPELL_AUTO_SHOT) &&
           (me->GetDistance(pVictim) > 8.0f) &&
           !me->GetCurrentSpell(CURRENT_AUTOREPEAT_SPELL))
            me->CastSpell(pVictim, PB_SPELL_AUTO_SHOT, false);

        CastRandomDamageSpell(pVictim);
    }
    else // Healer
    {
        Unit* pTarget = SelectHealTarget(pLeader);
        if (!pTarget)
        {
            if (me->GetMotionMaster()->GetCurrentMovementGeneratorType() != FOLLOW_MOTION_TYPE)
                me->GetMotionMaster()->MoveFollow(pLeader, frand(PB_MIN_FOLLOW_DIST, PB_MAX_FOLLOW_DIST), frand(PB_MIN_FOLLOW_ANGLE, PB_MAX_FOLLOW_ANGLE));
            return;
        }

        // Put a HoT on the target if only missing a little health.
        if (pTarget->GetHealthPercent() >= 80.0f)
        {
            for (const auto pSpellEntry : spellListHealAura)
            {
                if (CanTryToCastSpell(pTarget, pSpellEntry))
                {
                    if (DoCastSpell(pTarget, pSpellEntry) == SPELL_CAST_OK)
                        return;
                }
            }
        }
        // Use Lay on Hands if target is about to die.
        else if (m_fullHealSpell && pTarget->GetHealthPercent() <= 10.0f &&
                 CanTryToCastSpell(pTarget, m_fullHealSpell))
        {
            if (DoCastSpell(pTarget, m_fullHealSpell) == SPELL_CAST_OK)
                return;
        }

        SpellEntry const* pHealSpell = nullptr;
        int32 healthDiff = INT32_MAX;
        int32 const missingHealth = pTarget->GetMaxHealth() - pTarget->GetHealth();

        // Find most efficient healing spell.
        for (const auto pSpellEntry : spellListHeal)
        {
            if (CanTryToCastSpell(pTarget, pSpellEntry))
            {
                int32 const diff = pSpellEntry->EffectBasePoints[0] - missingHealth;
                if (std::abs(diff) < healthDiff)
                {
                    healthDiff = diff;
                    pHealSpell = pSpellEntry;
                }

                // Healing spells are sorted from strongest to weakest.
                if (diff < 0)
                    break;
            }
        }

        if (pHealSpell)
            DoCastSpell(pTarget, pHealSpell);
    }
}
