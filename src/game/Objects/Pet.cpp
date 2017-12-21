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

#include "Pet.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Formulas.h"
#include "SpellAuras.h"
#include "CreatureAI.h"
#include "Unit.h"
#include "Util.h"
#include "CharacterDatabaseCache.h"

//numbers represent minutes * 100 while happy (you get 100 loyalty points per min while happy)
uint32 const LevelUpLoyalty[6] =
{
    5500,
    11500,
    17000,
    23500,
    31000,
    39500,
};

uint32 const LevelStartLoyalty[6] =
{
    2000,
    4500,
    7000,
    10000,
    13500,
    17500,
};

bool UnsummonPetDelayEvent::Execute(uint64 /*e_time*/, uint32 /*p_time*/)
{
    m_pet.Unsummon(m_mode);
    return true;
}

Pet::Pet(PetType type) :
    Creature(CREATURE_SUBTYPE_PET),
    m_TrainingPoints(0), m_resetTalentsCost(0), m_resetTalentsTime(0),
    m_removed(false), m_happinessTimer(7500), m_loyaltyTimer(12000), m_petType(type), m_duration(0),
    m_loyaltyPoints(0), m_bonusdamage(0), m_auraUpdateMask(0), m_loading(false),
    m_enabled(true), m_unSummoned(false)
{
    m_name = "Pet";
    m_regenTimer = 4000;

    // pets always have a charminfo, even if they are not actually charmed
    InitCharmInfo(this);

    if (type == MINI_PET)                                   // always passive
        SetReactState(REACT_PASSIVE);
    else if (type == GUARDIAN_PET)                          // always aggressive
        SetReactState(REACT_AGGRESSIVE);

    m_pTmpCache = nullptr;
}

Pet::~Pet()
{
}

void Pet::AddToWorld()
{
    ///- Register the pet for guid lookup
    if (!IsInWorld())
        GetMap()->InsertObject<Pet>(GetObjectGuid(), this);

    Unit::AddToWorld();

    // Prevent stuck pets when zoning. Pets default to "follow" when added to world
    // so we'll reset flags and let the AI handle things
    if (GetCharmInfo() && GetCharmInfo()->HasCommandState(COMMAND_FOLLOW))
    {
        GetCharmInfo()->SetIsCommandAttack(false);
        GetCharmInfo()->SetIsCommandFollow(true);
        GetCharmInfo()->SetIsAtStay(false);
        GetCharmInfo()->SetIsFollowing(false);
        GetCharmInfo()->SetIsReturning(false);
    }
}

void Pet::RemoveFromWorld()
{
    ///- Remove the pet from the accessor
    if (IsInWorld())
        GetMap()->EraseObject<Pet>(GetObjectGuid());

    ///- Don't call the function for Creature, normal mobs + totems go in a different storage
    Unit::RemoveFromWorld();
}

bool Pet::LoadPetFromDB(Player* owner, uint32 petentry, uint32 petnumber, bool current)
{
    m_loading = true;
    m_isActiveObject = true;

    uint32 ownerid = owner->GetGUIDLow();

    //QueryResult *result;

    if (petnumber)
    {
        // known petnumber entry                  0   1      2      3        4      5    6           7              8        9           10    11    12       13         14       15            16      17              18        19                 20                 21              22
        /*result = CharacterDatabase.PQuery("SELECT id, entry, owner, modelid, level, exp, Reactstate, loyaltypoints, loyalty, trainpoint, slot, name, renamed, curhealth, curmana, curhappiness, abdata, TeachSpelldata, savetime, resettalents_cost, resettalents_time, CreatedBySpell, PetType "
            "FROM character_pet WHERE owner = '%u' AND id = '%u'",
            ownerid, petnumber); */
        m_pTmpCache = sCharacterDatabaseCache.GetCharacterPetCacheByOwnerAndId(ownerid, petnumber);
    }
    else if (current)
    {
        // current pet (slot 0)                   0   1      2      3        4      5    6           7              8        9           10    11    12       13         14       15            16      17              18        19                 20                 21              22
        /*result = CharacterDatabase.PQuery("SELECT id, entry, owner, modelid, level, exp, Reactstate, loyaltypoints, loyalty, trainpoint, slot, name, renamed, curhealth, curmana, curhappiness, abdata, TeachSpelldata, savetime, resettalents_cost, resettalents_time, CreatedBySpell, PetType "
            "FROM character_pet WHERE owner = '%u' AND slot = '%u'",
            ownerid, PET_SAVE_AS_CURRENT );*/
        m_pTmpCache = sCharacterDatabaseCache.GetCharacterCurrentPet(ownerid);
    }
    else if (petentry)
    {
        // known petentry entry (unique for summoned pet, but non unique for hunter pet (only from current or not stabled pets)
        //                                        0   1      2      3        4      5    6           7              8        9           10    11    12       13         14       15            16      17              18        19                 20                 21              22
        /*result = CharacterDatabase.PQuery("SELECT id, entry, owner, modelid, level, exp, Reactstate, loyaltypoints, loyalty, trainpoint, slot, name, renamed, curhealth, curmana, curhappiness, abdata, TeachSpelldata, savetime, resettalents_cost, resettalents_time, CreatedBySpell, PetType "
            "FROM character_pet WHERE owner = '%u' AND entry = '%u' AND (slot = '%u' OR slot > '%u') ",
            ownerid, petentry,PET_SAVE_AS_CURRENT,PET_SAVE_LAST_STABLE_SLOT);*/
        m_pTmpCache = sCharacterDatabaseCache.GetCharacterPetByOwnerAndEntry(ownerid, petentry);
    }
    else
    {
        // any current or other non-stabled pet (for hunter "call pet")
        //                                        0   1      2      3        4      5    6           7              8        9           10    11    12       13         14       15            16      17              18        19                 20                 21              22
        /*result = CharacterDatabase.PQuery("SELECT id, entry, owner, modelid, level, exp, Reactstate, loyaltypoints, loyalty, trainpoint, slot, name, renamed, curhealth, curmana, curhappiness, abdata, TeachSpelldata, savetime, resettalents_cost, resettalents_time, CreatedBySpell, PetType "
            "FROM character_pet WHERE owner = '%u' AND (slot = '%u' OR slot > '%u') ",
            ownerid,PET_SAVE_AS_CURRENT,PET_SAVE_LAST_STABLE_SLOT);*/
        m_pTmpCache = sCharacterDatabaseCache.GetCharacterPetByOwner(ownerid);
    }

    if (!m_pTmpCache)
    {
        m_loading = false;
        return false;
    }

    //Field *fields = result->Fetch();

    // update for case of current pet "slot = 0"
    petentry = m_pTmpCache->entry;
    if (!petentry)
    {
        m_pTmpCache = nullptr;
        m_loading = false;
        return false;
    }

    CreatureInfo const *creatureInfo = ObjectMgr::GetCreatureTemplate(petentry);
    if (!creatureInfo)
    {
        sLog.outError("Pet entry %u does not exist but used at pet load (owner: %s).", petentry, owner->GetGuidStr().c_str());
        m_pTmpCache = nullptr;
        m_loading = false;
        return false;
    }


    uint32 summon_spell_id = m_pTmpCache->CreatedBySpell;
    SpellEntry const* spellInfo = sSpellMgr.GetSpellEntry(summon_spell_id);

    bool is_temporary_summoned = spellInfo && GetSpellDuration(spellInfo) > 0;

    // check temporary summoned pets like mage water elemental
    if (current && is_temporary_summoned)
    {
        m_pTmpCache = nullptr;
        m_loading = false;
        return false;
    }

    PetType pet_type = PetType(m_pTmpCache->PetType);
    if (pet_type == HUNTER_PET)
    {
        if (!creatureInfo->isTameable())
        {
            m_pTmpCache = nullptr;
            m_loading = false;
            return false;
        }
    }

    uint32 pet_number = m_pTmpCache->id;

    if (current && owner->IsPetNeedBeTemporaryUnsummoned())
    {
        owner->SetTemporaryUnsummonedPetNumber(pet_number);
        m_pTmpCache = nullptr;
        m_loading = false;
        return false;
    }

    if (owner->GetTransport())
    {
        owner->GetTransport()->AddPassenger(this);
        m_movementInfo.t_pos.x = owner->m_movementInfo.t_pos.x;
        m_movementInfo.t_pos.y = owner->m_movementInfo.t_pos.y;
        m_movementInfo.t_pos.z = owner->m_movementInfo.t_pos.z;
    }

    Map *map = owner->GetMap();
    CreatureCreatePos pos(owner, owner->GetOrientation(), PET_FOLLOW_DIST, PET_FOLLOW_ANGLE);

    uint32 guid = map->GenerateLocalLowGuid(HIGHGUID_PET);
    if (!Create(guid, pos, creatureInfo, pet_number))
    {
        sLog.outError("Pet (guidlow %d, entry %d) not loaded. Suggested coordinates isn't valid (X: %f Y: %f)",
                      GetGUIDLow(), GetEntry(), GetPositionX(), GetPositionY());
        m_pTmpCache = nullptr;
        m_loading = false;
        return false;
    }
    if (owner->GetTransport() && GetTransport())
    {
        m_movementInfo.t_pos.x = owner->m_movementInfo.t_pos.x;
        m_movementInfo.t_pos.y = owner->m_movementInfo.t_pos.y;
        m_movementInfo.t_pos.z = owner->m_movementInfo.t_pos.z;
        GetTransport()->UpdatePassengerPosition(this);
    }

    setPetType(pet_type);
    setFaction(owner->getFaction());
    SetUInt32Value(UNIT_CREATED_BY_SPELL, summon_spell_id);

    // reget for sure use real creature info selected for Pet at load/creating
    CreatureInfo const *cinfo = GetCreatureInfo();
    if (cinfo->type == CREATURE_TYPE_CRITTER)
    {
        AIM_Initialize();
        m_pTmpCache = nullptr;
        m_loading = false;
        map->Add((Creature*)this);
        return true;
    }

    m_charmInfo->SetPetNumber(pet_number, IsPermanentPetFor(owner));

    SetOwnerGuid(owner->GetObjectGuid());
    SetDisplayId(m_pTmpCache->modelid);
    SetNativeDisplayId(m_pTmpCache->modelid);
    uint32 petlevel = m_pTmpCache->level;
    SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);

    if (pet_type == SUMMON_PET && !m_pTmpCache->renamed)
    {
        // generate new name for summon pet
        std::string new_name = sObjectMgr.GeneratePetName(petentry);
        if (!new_name.empty())
            m_pTmpCache->name = new_name;
    }

    SetName(m_pTmpCache->name);

    if (getPetType() == SUMMON_PET)
        petlevel = owner->getLevel();

    if (owner->IsPvP())
        SetPvP(true);

    SetCanModifyStats(true);
    InitStatsForLevel(petlevel);
    SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, uint32(time(nullptr)));
    SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, m_pTmpCache->exp);
    SetCreatorGuid(owner->GetObjectGuid());

    SetReactState(ReactStates(m_pTmpCache->Reactstate));
    m_loyaltyPoints = m_pTmpCache->loyaltypoints;

    uint32 savedhealth = m_pTmpCache->curhealth;
    uint32 savedmana = m_pTmpCache->curmana;

    // set current pet as current
    // 0=current
    // 1..MAX_PET_STABLES in stable slot
    // PET_SAVE_NOT_IN_SLOT(100) = not stable slot (summoning))
    if (m_pTmpCache->slot != 0)
    {
        CharacterDatabase.BeginTransaction();

        static SqlStatementID id_1;
        static SqlStatementID id_2;

        SqlStatement stmt = CharacterDatabase.CreateStatement(id_1, "UPDATE character_pet SET slot = ? WHERE owner = ? AND slot = ? AND id <> ?");
        stmt.PExecute(uint32(PET_SAVE_NOT_IN_SLOT), ownerid, uint32(PET_SAVE_AS_CURRENT), m_charmInfo->GetPetNumber());

        stmt = CharacterDatabase.CreateStatement(id_2, "UPDATE character_pet SET slot = ? WHERE owner = ? AND id = ?");
        stmt.PExecute(uint32(PET_SAVE_AS_CURRENT), ownerid, m_charmInfo->GetPetNumber());

        CharacterDatabase.CommitTransaction();

        m_pTmpCache->slot = PET_SAVE_AS_CURRENT;
        sCharacterDatabaseCache.CharacterPetSetOthersNotInSlot(m_pTmpCache);
    }

    // load action bar, if data broken will fill later by default spells.
    if (!is_temporary_summoned)
    {
        m_charmInfo->LoadPetActionBar(m_pTmpCache->abdata);

        //init teach spells
        Tokens tokens = StrSplit(m_pTmpCache->TeachSpelldata, " ");
        Tokens::const_iterator iter;
        int index;
        // Spells are in pairs. First is the ability, second is what teaches it to the hunter
        // Pets can have a max of 4 spells.
        for (iter = tokens.begin(), index = 0; index < 4 && iter != tokens.end(); ++iter, ++index)
        {
            uint32 tmp = atol((*iter).c_str());

            ++iter;

            if (tmp)
                AddTeachSpell(tmp, atol((*iter).c_str()));
            else
                break;
        }
    }

    // since last save (in seconds)
    uint32 timediff = uint32(time(nullptr) - m_pTmpCache->savetime);

    //load spells/cooldowns/auras
    _LoadAuras(timediff);

    //init AB
    if (is_temporary_summoned)
    {
        // Temporary summoned pets always have initial spell list at load
        InitPetCreateSpells();
    }
    else
    {
        LearnPetPassives();
        CastPetAuras(current);
    }

    if (getPetType() == SUMMON_PET && !current)             //all (?) summon pets come with full health when called, but not when they are current
    {
        SetHealth(GetMaxHealth());
        SetPower(POWER_MANA, GetMaxPower(POWER_MANA));
    }
    else
    {
        SetHealth(savedhealth > GetMaxHealth() ? GetMaxHealth() : savedhealth);
        SetPower(POWER_MANA, savedmana > GetMaxPower(POWER_MANA) ? GetMaxPower(POWER_MANA) : savedmana);
    }

    AIM_Initialize();
    map->Add((Creature*)this);

    // Spells should be loaded after pet is added to map, because in CheckCast is check on it
    _LoadSpells();
    CleanupActionBar();                                     // remove unknown spells from action bar after load

    _LoadSpellCooldowns();

    owner->SetPet(this);                                    // in DB stored only full controlled creature
    DEBUG_LOG("New Pet has guid %u", GetGUIDLow());

    if (owner->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)owner)->PetSpellInitialize();
        if (((Player*)owner)->GetGroup())
            ((Player*)owner)->SetGroupUpdateFlag(GROUP_UPDATE_PET);
    }

    m_loading = false;

    SynchronizeLevelWithOwner();

    if ((getPetType() != SUMMON_PET || current) && !savedhealth)
        SetDeathState(JUST_DIED);

    if (getPetType() == HUNTER_PET)
    {
        SetByteValue(UNIT_FIELD_BYTES_1, 1, m_pTmpCache->loyalty);

        SetUInt32Value(UNIT_FIELD_FLAGS, m_pTmpCache->renamed ? UNIT_FLAG_PET_ABANDON : UNIT_FLAG_PET_RENAME | UNIT_FLAG_PET_ABANDON);

        SetTP(m_pTmpCache->trainpoint);

        SetMaxPower(POWER_HAPPINESS, GetCreatePowers(POWER_HAPPINESS));
        SetPower(POWER_HAPPINESS, m_pTmpCache->curhappiness);
        setPowerType(POWER_FOCUS);
    }

    if (getPetType() != MINI_PET)
    {
        if (owner->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE))
            SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
        else
            RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
    }

    // Save pet for resurrection by spirit healer.
    if (IsPermanentPetFor(owner))
    {
        owner->m_petEntry = GetEntry();
        owner->m_petSpell = GetUInt32Value(UNIT_CREATED_BY_SPELL);
    }

    m_pTmpCache = nullptr;
    return true;
}

void Pet::SavePetToDB(PetSaveMode mode)
{
    if (!GetEntry())
        return;

    // save only fully controlled creature
    if (!isControlled())
        return;

    // not save not player pets
    if (!GetOwnerGuid().IsPlayer())
        return;

    Player* pOwner = (Player*)GetOwner();
    if (!pOwner)
        return;

    // current/stable/not_in_slot
    if (mode >= PET_SAVE_AS_CURRENT)
    {
        // reagents must be returned before save call
        if (mode == PET_SAVE_REAGENTS)
            mode = PET_SAVE_NOT_IN_SLOT;
        // not save pet as current if another pet temporary unsummoned
        else if (mode == PET_SAVE_AS_CURRENT && pOwner->GetTemporaryUnsummonedPetNumber() &&
                 pOwner->GetTemporaryUnsummonedPetNumber() != m_charmInfo->GetPetNumber())
        {
            // pet will lost anyway at restore temporary unsummoned
            if (getPetType() == HUNTER_PET)
                return;

            // for warlock case
            mode = PET_SAVE_NOT_IN_SLOT;
        }

        // pet is dead so it doesn't have to be shown at character login
        if (mode == PET_SAVE_AS_CURRENT && !isAlive())
            mode = PET_SAVE_NOT_IN_SLOT;

        // On recup l'info dans le cache
        uint32 ownerLow = GetOwnerGuid().GetCounter();
        m_pTmpCache = sCharacterDatabaseCache.GetCharacterPetCacheByOwnerAndId(ownerLow, m_charmInfo->GetPetNumber());
        bool bInCache = (m_pTmpCache != nullptr);
        if (!bInCache)
            m_pTmpCache = new CharacterPetCache;

        uint32 curhealth = GetHealth();
        uint32 curmana = GetPower(POWER_MANA);

        // stable and not in slot saves
        if ( (mode != PET_SAVE_AS_CURRENT && getPetType() != HUNTER_PET) ||
              mode == PET_SAVE_FIRST_STABLE_SLOT || mode == PET_SAVE_LAST_STABLE_SLOT )
            RemoveAllAuras();

        //save pet's data as one single transaction
        CharacterDatabase.BeginTransaction();
        _SaveSpells();
        _SaveSpellCooldowns();
        _SaveAuras();

        uint32 loyalty = 1;
        if (getPetType() != HUNTER_PET)
            loyalty = GetLoyaltyLevel();

        // remove current data
        static SqlStatementID delPet ;
        static SqlStatementID insPet ;

        SqlStatement stmt = CharacterDatabase.CreateStatement(delPet, "DELETE FROM character_pet WHERE owner = ? AND id = ?");
        stmt.PExecute(ownerLow, m_charmInfo->GetPetNumber());

        // prevent duplicate using slot (except PET_SAVE_NOT_IN_SLOT)
        if (mode <= PET_SAVE_LAST_STABLE_SLOT)
        {
            static SqlStatementID updPet ;

            stmt = CharacterDatabase.CreateStatement(updPet, "UPDATE character_pet SET slot = ? WHERE owner = ? AND slot = ?");
            stmt.PExecute(uint32(PET_SAVE_NOT_IN_SLOT), ownerLow, uint32(mode));
        }

        // prevent existence another hunter pet in PET_SAVE_AS_CURRENT and PET_SAVE_NOT_IN_SLOT
        if (getPetType() == HUNTER_PET && (mode == PET_SAVE_AS_CURRENT || mode > PET_SAVE_LAST_STABLE_SLOT))
        {
            static SqlStatementID del ;

            stmt = CharacterDatabase.CreateStatement(del, "DELETE FROM character_pet WHERE owner = ? AND (slot = ? OR slot > ?)");
            stmt.PExecute(ownerLow, uint32(PET_SAVE_AS_CURRENT), uint32(PET_SAVE_LAST_STABLE_SLOT));
        }

        // save pet
        // On sauvegarde dans le cache
        m_pTmpCache->id = m_charmInfo->GetPetNumber();
        m_pTmpCache->owner = ownerLow;
        m_pTmpCache->entry = GetEntry();
        m_pTmpCache->modelid = GetNativeDisplayId();
        m_pTmpCache->level = getLevel();
        m_pTmpCache->exp = GetUInt32Value(UNIT_FIELD_PETEXPERIENCE);
        m_pTmpCache->Reactstate = GetReactState();
        m_pTmpCache->loyaltypoints = m_loyaltyPoints;
        m_pTmpCache->loyalty = GetLoyaltyLevel();
        m_pTmpCache->trainpoint = m_TrainingPoints;
        m_pTmpCache->slot = mode;
        m_pTmpCache->name = m_name;
        m_pTmpCache->renamed = uint32(HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME) ? 0 : 1);
        m_pTmpCache->curhealth = curhealth;
        m_pTmpCache->curmana = curmana;
        m_pTmpCache->curhappiness = GetPower(POWER_HAPPINESS);
        m_pTmpCache->savetime = time(nullptr);
        m_pTmpCache->resettalents_cost = m_resetTalentsCost;
        m_pTmpCache->resettalents_time = m_resetTalentsTime;
        m_pTmpCache->CreatedBySpell = GetUInt32Value(UNIT_CREATED_BY_SPELL);
        m_pTmpCache->PetType = getPetType();

        SqlStatement savePet = CharacterDatabase.CreateStatement(insPet, "INSERT INTO character_pet "
                               "( id, entry,  owner, modelid, level, exp, Reactstate, loyaltypoints, loyalty, trainpoint, slot, name, renamed, curhealth, curmana, curhappiness, abdata, TeachSpelldata, savetime, resettalents_cost, resettalents_time, CreatedBySpell, PetType) "
                               "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

        savePet.addUInt32(m_charmInfo->GetPetNumber());
        savePet.addUInt32(GetEntry());
        savePet.addUInt32(ownerLow);
        savePet.addUInt32(GetNativeDisplayId());
        savePet.addUInt32(getLevel());
        savePet.addUInt32(GetUInt32Value(UNIT_FIELD_PETEXPERIENCE));
        savePet.addUInt32(uint32(GetReactState()));
        savePet.addInt32(m_loyaltyPoints);
        savePet.addUInt32(GetLoyaltyLevel());
        savePet.addInt32(m_TrainingPoints);
        savePet.addUInt32(uint32(mode));
        savePet.addString(m_name);
        savePet.addUInt32(uint32(HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME) ? 0 : 1));
        savePet.addUInt32((curhealth < 1 ? 1 : curhealth));
        savePet.addUInt32(curmana);
        savePet.addUInt32(GetPower(POWER_HAPPINESS));

        std::ostringstream ss;
        for (uint32 i = ACTION_BAR_INDEX_START; i < ACTION_BAR_INDEX_END; ++i)
        {
            ss << uint32(m_charmInfo->GetActionBarEntry(i)->GetType()) << " "
               << uint32(m_charmInfo->GetActionBarEntry(i)->GetAction()) << " ";
        };
        m_pTmpCache->abdata = ss.str();
        savePet.addString(ss);

        ss.str("");
        //save spells the pet can teach to it's Master
        {
            int i = 0;
            for (TeachSpellMap::const_iterator itr = m_teachspells.begin(); i < 4 && itr != m_teachspells.end(); ++i, ++itr)
                ss << itr->first << " " << itr->second << " ";
            for (; i < 4; ++i)
                ss << uint32(0) << " " << uint32(0) << " ";
        }
        m_pTmpCache->TeachSpelldata = ss.str();
        savePet.addString(ss);

        savePet.addUInt64(uint64(time(nullptr)));
        savePet.addUInt32(uint32(m_resetTalentsCost));
        savePet.addUInt64(uint64(m_resetTalentsTime));
        savePet.addUInt32(GetUInt32Value(UNIT_CREATED_BY_SPELL));
        savePet.addUInt32(uint32(getPetType()));

        savePet.Execute();

        CharacterDatabase.CommitTransaction();
        if (!bInCache) // Nouveau dans le cache.
        {
            sCharacterDatabaseCache.InsertCharacterPet(m_pTmpCache);
            m_pTmpCache = nullptr;
        }
        // On ne doit pas l'utiliser comme ca.
        m_pTmpCache = nullptr;
    }
    else
    {
        RemoveAllAuras(AURA_REMOVE_BY_DELETE);
        DeleteFromDB(m_charmInfo->GetPetNumber());
    }
}

void Pet::DeleteFromDB(uint32 guidlow, bool separate_transaction)
{
    if (separate_transaction)
        CharacterDatabase.BeginTransaction();

    static SqlStatementID delPet ;
    static SqlStatementID delAuras ;
    static SqlStatementID delSpells ;
    static SqlStatementID delSpellCD ;

    SqlStatement stmt = CharacterDatabase.CreateStatement(delPet, "DELETE FROM character_pet WHERE id = ?");
    stmt.PExecute(guidlow);

    stmt = CharacterDatabase.CreateStatement(delAuras, "DELETE FROM pet_aura WHERE guid = ?");
    stmt.PExecute(guidlow);

    stmt = CharacterDatabase.CreateStatement(delSpells, "DELETE FROM pet_spell WHERE guid = ?");
    stmt.PExecute(guidlow);

    stmt = CharacterDatabase.CreateStatement(delSpellCD, "DELETE FROM pet_spell_cooldown WHERE guid = ?");
    stmt.PExecute(guidlow);
    sCharacterDatabaseCache.DeleteCharacterPetById(guidlow);

    if (separate_transaction)
        CharacterDatabase.CommitTransaction();
}

void Pet::SetDeathState(DeathState s)                       // overwrite virtual Creature::SetDeathState and Unit::SetDeathState
{
    Creature::SetDeathState(s);
    if (getDeathState() == CORPSE)
        //remove summoned pet (no corpse)
    {
        // pet corpse non lootable and non skinnable
        SetUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_NONE);
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SKINNABLE);

        //lose happiness when died and not in BG
        const MapEntry *mapEntry = GetMap()->GetMapEntry();
        if (!mapEntry || (mapEntry->mapType != MAP_BATTLEGROUND))
            ModifyPower(POWER_HAPPINESS, -HAPPINESS_LEVEL_SIZE);

        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        m_corpseDecayTimer = 3600000; // Chakor : Despawn du corps au bout d'1h
        // Despawn after 15 sec for warlock pets.
        if (getPetType() == SUMMON_PET)
            m_corpseDecayTimer = 15000;
    }
    else if (getDeathState() == ALIVE)
    {
        RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED);
        CastPetAuras(true);
    }
}

void Pet::Update(uint32 update_diff, uint32 diff)
{
    if (m_removed || m_loading)                                           // pet already removed, just wait in remove queue, no updates
        return;

    // Unsummon pets that lost owner
    Unit* owner = GetOwner();
    if (!owner ||
            ((!GetTransport() || GetTransport() != owner->GetTransport()) && !IsWithinDistInMap(owner, 120.0f) && !(owner->GetCharmGuid() && (owner->GetCharmGuid() == GetObjectGuid()))) ||
            (isControlled() && !owner->GetPetGuid()))
    {
        Unsummon(PET_SAVE_REAGENTS);
        return;
    }

    switch (m_deathState)
    {
        case CORPSE:
        {
            if (m_corpseDecayTimer <= update_diff)
            {
                Unsummon(PET_SAVE_NOT_IN_SLOT);             //hunters' pets never get removed because of death, NEVER!
                return;
            }
            break;
        }
        case ALIVE:
        {
            if (isControlled())
            {
                if (owner->GetPetGuid() != GetObjectGuid())
                {
                    Unsummon(getPetType() == HUNTER_PET ? PET_SAVE_AS_DELETED : PET_SAVE_NOT_IN_SLOT, owner);
                    return;
                }
            }

            // Despawn if owner is dead and out of combat
            if (owner->isDead() && !getAttackerForHelper())
            {
                Unsummon(getPetType() != SUMMON_PET ? PET_SAVE_AS_DELETED : PET_SAVE_NOT_IN_SLOT, owner);
                return;
            }

            if (m_duration > 0)
            {
                if (m_duration > (int32)update_diff)
                    m_duration -= (int32)update_diff;
                else
                {
                    Unsummon(getPetType() != SUMMON_PET ? PET_SAVE_AS_DELETED : PET_SAVE_NOT_IN_SLOT, owner);
                    return;
                }
            }
            break;
        }
        default:
            break;
    }
    Creature::Update(update_diff, diff);
}

void Pet::RegenerateAll(uint32 update_diff, bool skipCombatCheck)
{
    //regenerate Focus
    if (m_regenTimer <= update_diff)
    {
        if (getPetType() == HUNTER_PET)
            RegenerateFocus();

        if (!isInCombat() || IsPolymorphed())
            RegenerateHealth();

        RegenerateMana();

        m_regenTimer = REGEN_TIME_FULL;
    }
    else
        m_regenTimer -= update_diff;

    if (getPetType() != HUNTER_PET)
        return;

    if (m_happinessTimer <= update_diff)
    {
        LooseHappiness();
        m_happinessTimer = 7500;
    }
    else
        m_happinessTimer -= update_diff;

    if (m_loyaltyTimer <= update_diff)
    {
        TickLoyaltyChange();
        m_loyaltyTimer = 12000;
    }
    else
        m_loyaltyTimer -= update_diff;

}

void Pet::RegenerateFocus()
{
    uint32 curValue = GetPower(POWER_FOCUS);
    uint32 maxValue = GetMaxPower(POWER_FOCUS);

    if (curValue >= maxValue)
        return;

    float addvalue = 24 * sWorld.getConfig(CONFIG_FLOAT_RATE_POWER_FOCUS);

    AuraList const& ModPowerRegenPCTAuras = GetAurasByType(SPELL_AURA_MOD_POWER_REGEN_PERCENT);
    for (AuraList::const_iterator i = ModPowerRegenPCTAuras.begin(); i != ModPowerRegenPCTAuras.end(); ++i)
        if ((*i)->GetModifier()->m_miscvalue == int32(POWER_FOCUS))
            addvalue *= ((*i)->GetModifier()->m_amount + 100) / 100.0f;

    ModifyPower(POWER_FOCUS, (int32)addvalue);
}

void Pet::LooseHappiness()
{
    uint32 curValue = GetPower(POWER_HAPPINESS);
    if (curValue <= 0)
        return;
    int32 addvalue = (140 >> GetLoyaltyLevel()) * 125;      //value is 70/35/17/8/4 (per min) * 1000 / 8 (timer 7.5 secs)
    if (isInCombat())                                       //we know in combat happiness fades faster, multiplier guess
        addvalue = int32(addvalue * 1.5);
    ModifyPower(POWER_HAPPINESS, -addvalue);
}

void Pet::ModifyLoyalty(int32 addvalue)
{
    uint32 loyaltylevel = GetLoyaltyLevel();

    if (addvalue > 0)                                       //only gain influenced, not loss
        addvalue = int32((float)addvalue * sWorld.getConfig(CONFIG_FLOAT_RATE_LOYALTY));

    if (loyaltylevel >= BEST_FRIEND && (addvalue + m_loyaltyPoints) > int32(GetMaxLoyaltyPoints(loyaltylevel)))
        return;

    m_loyaltyPoints += addvalue;

    if (m_loyaltyPoints < 0)
    {
        if (loyaltylevel > REBELLIOUS)
        {
            //level down
            --loyaltylevel;
            SetLoyaltyLevel(LoyaltyLevel(loyaltylevel));
            m_loyaltyPoints = GetStartLoyaltyPoints(loyaltylevel);
            SetTP(m_TrainingPoints - int32(getLevel()));
        }
        else
        {
            m_loyaltyPoints = 0;
            Unit* owner = GetOwner();
            if (owner && owner->GetTypeId() == TYPEID_PLAYER)
            {
                WorldPacket data(SMSG_PET_BROKEN, 0);
                ((Player*)owner)->GetSession()->SendPacket(&data);

                //run away
                Unsummon(PET_SAVE_AS_DELETED, owner);
            }
        }
    }
    //level up
    else if (m_loyaltyPoints > int32(GetMaxLoyaltyPoints(loyaltylevel)))
    {
        ++loyaltylevel;
        SetLoyaltyLevel(LoyaltyLevel(loyaltylevel));
        m_loyaltyPoints = GetStartLoyaltyPoints(loyaltylevel);
        SetTP(m_TrainingPoints + getLevel());
    }
}

void Pet::TickLoyaltyChange()
{
    int32 addvalue;

    switch (GetHappinessState())
    {
        case HAPPY:
            addvalue =  20;
            break;
        case CONTENT:
            addvalue =  10;
            break;
        case UNHAPPY:
            addvalue = -20;
            break;
        default:
            return;
    }
    ModifyLoyalty(addvalue);
}

void Pet::KillLoyaltyBonus(uint32 level)
{
    if (level > 100)
        return;

    //at lower levels gain is faster | the lower loyalty the more loyalty is gained
    uint32 bonus = uint32(((100 - level) / 10) + (6 - GetLoyaltyLevel()));
    ModifyLoyalty(bonus);
}

HappinessState Pet::GetHappinessState() const
{
    if (GetPower(POWER_HAPPINESS) < HAPPINESS_LEVEL_SIZE)
        return UNHAPPY;
    if (GetPower(POWER_HAPPINESS) >= HAPPINESS_LEVEL_SIZE * 2)
        return HAPPY;
    return CONTENT;
}

void Pet::SetLoyaltyLevel(LoyaltyLevel level)
{
    SetByteValue(UNIT_FIELD_BYTES_1, 1, level);
}

bool Pet::CanTakeMoreActiveSpells(uint32 spellid)
{
    uint8  activecount = 1;
    uint32 chainstartstore[ACTIVE_SPELLS_MAX];

    if (IsPassiveSpell(spellid))
        return true;

    chainstartstore[0] = sSpellMgr.GetFirstSpellInChain(spellid);

    for (PetSpellMap::const_iterator itr = m_petSpells.begin(); itr != m_petSpells.end(); ++itr)
    {
        if (itr->second.state == PETSPELL_REMOVED)
            continue;

        if (IsPassiveSpell(itr->first))
            continue;

        uint32 chainstart = sSpellMgr.GetFirstSpellInChain(itr->first);

        uint8 x;

        for (x = 0; x < activecount; x++)
        {
            if (chainstart == chainstartstore[x])
                break;
        }

        if (x == activecount)                               //spellchain not yet saved -> add active count
        {
            ++activecount;
            if (activecount > ACTIVE_SPELLS_MAX)
                return false;
            chainstartstore[x] = chainstart;
        }
    }
    return true;
}

bool Pet::HasTPForSpell(uint32 spellid)
{
    int32 neededtrainp = GetTPForSpell(spellid);
    if ((m_TrainingPoints - neededtrainp < 0 || neededtrainp < 0) && neededtrainp != 0)
        return false;
    return true;
}

int32 Pet::GetTPForSpell(uint32 spellid)
{
    uint32 basetrainp = 0;

    SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(spellid);
    for (SkillLineAbilityMap::const_iterator _spell_idx = bounds.first; _spell_idx != bounds.second; ++_spell_idx)
    {
        if (!_spell_idx->second->reqtrainpoints)
            return 0;

        basetrainp = _spell_idx->second->reqtrainpoints;
        break;
    }

    uint32 spenttrainp = 0;
    uint32 chainstart = sSpellMgr.GetFirstSpellInChain(spellid);

    for (PetSpellMap::iterator itr = m_petSpells.begin(); itr != m_petSpells.end(); ++itr)
    {
        if (itr->second.state == PETSPELL_REMOVED)
            continue;

        if (sSpellMgr.GetFirstSpellInChain(itr->first) == chainstart)
        {
            SkillLineAbilityMapBounds _bounds = sSpellMgr.GetSkillLineAbilityMapBounds(itr->first);

            for (SkillLineAbilityMap::const_iterator _spell_idx2 = _bounds.first; _spell_idx2 != _bounds.second; ++_spell_idx2)
            {
                if (_spell_idx2->second->reqtrainpoints > spenttrainp)
                {
                    spenttrainp = _spell_idx2->second->reqtrainpoints;
                    break;
                }
            }
        }
    }

    return int32(basetrainp) - int32(spenttrainp);
}

uint32 Pet::GetMaxLoyaltyPoints(uint32 level)
{
    if (level < 1) level = 1; // prevent SIGSEGV (out of range)
    if (level > 6) level = 6; // prevent SIGSEGV (out of range)
    return LevelUpLoyalty[level - 1];
}

uint32 Pet::GetStartLoyaltyPoints(uint32 level)
{
    if (level < 1) level = 1; // prevent SIGSEGV (out of range)
    if (level > 6) level = 6; // prevent SIGSEGV (out of range)
    return LevelStartLoyalty[level - 1];
}

void Pet::SetTP(int32 TP)
{
    m_TrainingPoints = TP;
    SetUInt32Value(UNIT_TRAINING_POINTS, (uint32)GetDispTP());
}

int32 Pet::GetDispTP() const
{
    if (getPetType() != HUNTER_PET)
        return (0);
    if (m_TrainingPoints < 0)
        return -m_TrainingPoints;
    return -(m_TrainingPoints + 1);
}

void Pet::Unsummon(PetSaveMode mode, Unit* owner /*= NULL*/)
{
    if (m_removed || m_unSummoned)
        return;

    m_unSummoned = true;

    if (!owner)
        owner = GetOwner();

    CombatStop();

    if (owner)
    {
        if (GetOwnerGuid() != owner->GetObjectGuid())
        {
            m_unSummoned = false;
            return;
        }

        Player* p_owner = owner->GetTypeId() == TYPEID_PLAYER ? (Player*)owner : NULL;

        if (p_owner)
        {

            // not save secondary permanent pet as current
            if (mode == PET_SAVE_AS_CURRENT && p_owner->GetTemporaryUnsummonedPetNumber() &&
                    p_owner->GetTemporaryUnsummonedPetNumber() != GetCharmInfo()->GetPetNumber())
                mode = PET_SAVE_NOT_IN_SLOT;

            if (mode == PET_SAVE_REAGENTS)
            {
                //returning of reagents only for players, so best done here
                uint32 spellId = GetUInt32Value(UNIT_CREATED_BY_SPELL);
                SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spellId);

                if (spellInfo)
                {
                    for (uint32 i = 0; i < MAX_SPELL_REAGENTS; ++i)
                    {
                        if (spellInfo->Reagent[i] > 0)
                        {
                            ItemPosCountVec dest;           //for succubus, voidwalker, felhunter and felguard credit soulshard when despawn reason other than death (out of range, logout)
                            uint8 msg = p_owner->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, spellInfo->Reagent[i], spellInfo->ReagentCount[i]);
                            if (msg == EQUIP_ERR_OK)
                            {
                                Item* item = p_owner->StoreNewItem(dest, spellInfo->Reagent[i], true);
                                if (p_owner->IsInWorld())
                                    p_owner->SendNewItem(item, spellInfo->ReagentCount[i], true, false);
                            }
                        }
                    }
                }
            }
            else if (mode == PET_SAVE_AS_DELETED || mode == PET_SAVE_FIRST_STABLE_SLOT || mode == PET_SAVE_LAST_STABLE_SLOT)
            {
                // Do not rez the pet in BG
                p_owner->m_petEntry = 0;
                p_owner->m_petSpell = 0;
            }

            if (isControlled())
            {
                p_owner->RemovePetActionBar();

                if (p_owner->GetGroup())
                    p_owner->SetGroupUpdateFlag(GROUP_UPDATE_PET);
            }
        }

        // only if current pet in slot
        switch (getPetType())
        {
            case MINI_PET:
                if (p_owner)
                    p_owner->_SetMiniPet(nullptr);
                break;
            case GUARDIAN_PET:
            {
                // Alert summoner that we're about to despawn. Do it before we clear
                // the guardian ref, so it can still be utilized if necessary
                if (Creature *creature = owner->ToCreature())
                {
                    if (creature->AI())
                        creature->AI()->SummonedCreatureDespawn(this);
                }

                owner->RemoveGuardian(this);
                break;
            }
            default:
                if (owner->GetPetGuid() == GetObjectGuid())
                    owner->SetPet(nullptr);
                break;
        }
    }

    // If we're being charmed, remove the charm
    if (Unit* charmer = GetUnit(*this, GetCharmerGuid()))
        charmer->RemoveCharmAuras();

    // If we're being possessed, remove the possesion. If we don't, and the caster
    // is a player, they are left with a dangling pointer for Player::m_mover
    if (Unit *possessor = GetUnit(*this, GetPossessorGuid()))
    {
        // Remove any auras due to the spell if they exist
        if (uint32 spellId = GetUInt32Value(UNIT_CREATED_BY_SPELL))
            possessor->RemoveAurasDueToSpell(spellId);

        if (Player *pPlayerPossessor = possessor->ToPlayer())
            pPlayerPossessor->ModPossessPet(this, false, AURA_REMOVE_BY_DEFAULT);
    }

    SavePetToDB(mode);
    AddObjectToRemoveList();
    m_removed = true;
}

void Pet::DelayedUnsummon(uint32 timeMSToDespawn, PetSaveMode mode)
{
    if (timeMSToDespawn)
    {
        UnsummonPetDelayEvent *pEvent = new UnsummonPetDelayEvent(*this, mode);
        
        m_Events.AddEvent(pEvent, m_Events.CalculateTime(timeMSToDespawn));
    }
}

void Pet::GivePetXP(uint32 xp)
{
    if (getPetType() != HUNTER_PET)
        return;

    if (xp < 1)
        return;

    if (!isAlive())
        return;

    uint32 level = getLevel();
    uint32 maxlevel = std::min(sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL), GetOwner()->getLevel());

    // pet not receive xp for level equal to owner level
    if (level >= maxlevel)
        return;

    uint32 nextLvlXP = GetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP);
    uint32 curXP = GetUInt32Value(UNIT_FIELD_PETEXPERIENCE);
    uint32 newXP = curXP + xp;

    while (newXP >= nextLvlXP && level < maxlevel)
    {
        newXP -= nextLvlXP;
        ++level;

        GivePetLevel(level);                              // also update UNIT_FIELD_PETNEXTLEVELEXP and UNIT_FIELD_PETEXPERIENCE to level start

        nextLvlXP = GetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP);
    }

    SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, level < maxlevel ? newXP : 0);

    if (getPetType() == HUNTER_PET)
        KillLoyaltyBonus(level);
}

void Pet::GivePetLevel(uint32 level)
{
    if (!level || level == getLevel())
        return;

    if (getPetType() == HUNTER_PET)
    {
        SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, 0);
        SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, sObjectMgr.GetXPForPetLevel(level));
    }

    InitStatsForLevel(level);
    SetTP(m_TrainingPoints + (GetLoyaltyLevel() - 1));
}

bool Pet::CreateBaseAtCreature(Creature* creature)
{
    if (!creature)
    {
        sLog.outError("CRITICAL: NULL pointer passed into CreateBaseAtCreature()");
        return false;
    }

    CreatureCreatePos pos(creature, creature->GetOrientation());

    uint32 guid = creature->GetMap()->GenerateLocalLowGuid(HIGHGUID_PET);

    BASIC_LOG("Create pet");
    uint32 pet_number = sObjectMgr.GeneratePetNumber();
    if (!Create(guid, pos, creature->GetCreatureInfo(), pet_number))
        return false;

    CreatureInfo const *cinfo = GetCreatureInfo();
    if (!cinfo)
    {
        sLog.outError("CreateBaseAtCreature() failed, creatureInfo is missing!");
        return false;
    }

    if (cinfo->type == CREATURE_TYPE_CRITTER)
    {
        setPetType(MINI_PET);
        return true;
    }
    SetDisplayId(creature->GetDisplayId());
    SetNativeDisplayId(creature->GetNativeDisplayId());
    SetMaxPower(POWER_HAPPINESS, GetCreatePowers(POWER_HAPPINESS));
    SetPower(POWER_HAPPINESS, 166500);
    setPowerType(POWER_FOCUS);
    SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, 0);
    SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, 0);
    SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, sObjectMgr.GetXPForPetLevel(creature->getLevel()));
    SetUInt32Value(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_NONE);

    if (CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(cinfo->family))
        SetName(cFamily->Name[sWorld.GetDefaultDbcLocale()]);
    else
        SetName(creature->GetNameForLocaleIdx(sObjectMgr.GetDBCLocaleIndex()));

    m_loyaltyPoints = 1000;
    if (cinfo->type == CREATURE_TYPE_BEAST)
    {
        SetByteValue(UNIT_FIELD_BYTES_0, 1, CLASS_WARRIOR);
        SetByteValue(UNIT_FIELD_BYTES_0, 2, GENDER_NONE);
        SetByteValue(UNIT_FIELD_BYTES_0, 3, POWER_FOCUS);
        SetSheath(SHEATH_STATE_MELEE);
        SetByteValue(UNIT_FIELD_BYTES_2, 1, UNIT_BYTE2_FLAG_UNK3 | UNIT_BYTE2_FLAG_AURAS | UNIT_BYTE2_FLAG_UNK5);
        SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_RENAME | UNIT_FLAG_PET_ABANDON);


        SetUInt32Value(UNIT_MOD_CAST_SPEED, creature->GetUInt32Value(UNIT_MOD_CAST_SPEED));
        SetLoyaltyLevel(REBELLIOUS);
    }
    return true;
}

bool Pet::InitStatsForLevel(uint32 petlevel, Unit* owner)
{
    CreatureInfo const *cinfo = GetCreatureInfo();
    MANGOS_ASSERT(cinfo);

    if (!owner)
    {
        owner = GetOwner();
        if (!owner)
        {
            sLog.outError("attempt to summon pet (Entry %u) without owner! Attempt terminated.", cinfo->Entry);
            return false;
        }
    }

    uint32 creature_ID = (getPetType() == HUNTER_PET) ? 1 : cinfo->Entry;

    switch (getPetType())
    {
        case SUMMON_PET:
            SetByteValue(UNIT_FIELD_BYTES_0, 1, CLASS_MAGE);
            SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NONE);
            break;
        case HUNTER_PET:
            SetByteValue(UNIT_FIELD_BYTES_0, 1, CLASS_WARRIOR);
            SetByteValue(UNIT_FIELD_BYTES_0, 2, GENDER_NONE);
            SetSheath(SHEATH_STATE_MELEE);
            SetByteValue(UNIT_FIELD_BYTES_2, 1, UNIT_BYTE2_FLAG_UNK3 | UNIT_BYTE2_FLAG_AURAS | UNIT_BYTE2_FLAG_UNK5);

            // this enables popup window (pet abandon, cancel), original value set in CreateBaseAtCreature
            SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PET_ABANDON);
            break;
        case GUARDIAN_PET:
        default:
            break;
    }

    SetLevel(petlevel);

    // Before 1.9 pets retain their wild damage type
    if (sWorld.GetWowPatch() < WOW_PATCH_109)
        SetMeleeDamageSchool(SpellSchools(cinfo->dmgschool));
    else
        SetMeleeDamageSchool(SPELL_SCHOOL_NORMAL);

    SetModifierValue(UNIT_MOD_ARMOR, BASE_VALUE, float(petlevel * 50));

    // Nostalrius: pre-2.0: normalisation de la vitesse d'attaque des pets.
    SetAttackTime(BASE_ATTACK, cinfo->baseattacktime); //BASE_ATTACK_TIME);
    SetAttackTime(OFF_ATTACK, cinfo->baseattacktime); //BASE_ATTACK_TIME);
    SetAttackTime(RANGED_ATTACK, cinfo->rangeattacktime); //BASE_ATTACK_TIME);

    SetFloatValue(UNIT_MOD_CAST_SPEED, 1.0);

    CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(cinfo->family);
    if (cFamily && cFamily->minScale > 0.0f && getPetType() == HUNTER_PET)
    {
        float scale;
        if (getLevel() >= cFamily->maxScaleLevel)
            scale = cFamily->maxScale;
        else if (getLevel() <= cFamily->minScaleLevel)
            scale = cFamily->minScale;
        else
            scale = cFamily->minScale + float(getLevel() - cFamily->minScaleLevel) / cFamily->maxScaleLevel * (cFamily->maxScale - cFamily->minScale);

        SetObjectScale(scale);
        UpdateModelData();
    }
    m_bonusdamage = 0;

    int32 createResistance[MAX_SPELL_SCHOOL] = {0, 0, 0, 0, 0, 0, 0};

    // Before 1.9 pets retain their wild resistances
    if (getPetType() != HUNTER_PET || sWorld.GetWowPatch() < WOW_PATCH_109)
    {
        createResistance[SPELL_SCHOOL_HOLY]   = cinfo->resistance1;
        createResistance[SPELL_SCHOOL_FIRE]   = cinfo->resistance2;
        createResistance[SPELL_SCHOOL_NATURE] = cinfo->resistance3;
        createResistance[SPELL_SCHOOL_FROST]  = cinfo->resistance4;
        createResistance[SPELL_SCHOOL_SHADOW] = cinfo->resistance5;
        createResistance[SPELL_SCHOOL_ARCANE] = cinfo->resistance6;
    }

    switch (getPetType())
    {
        case SUMMON_PET:
        {
            // Formulas reviewed by Clank <Nostalrius>, from vanilla hunter pet tab screenshots.
            SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, float((petlevel * 1.15 * 1.05) * (float)GetAttackTime(BASE_ATTACK) / 2000));
            SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, float((petlevel * 1.45 * 1.05) * (float)GetAttackTime(BASE_ATTACK) / 2000));

            //SetModifierValue(UNIT_MOD_ATTACK_POWER, BASE_VALUE, float(cinfo->attackpower));

            PetLevelInfo const* pInfo = sObjectMgr.GetPetLevelInfo(creature_ID, petlevel);
            if (pInfo)                                      // exist in DB
            {
                SetCreateHealth(pInfo->health);
                SetCreateMana(pInfo->mana);

                if (pInfo->armor > 0)
                    SetModifierValue(UNIT_MOD_ARMOR, BASE_VALUE, float(pInfo->armor));

                for (int stat = 0; stat < MAX_STATS; ++stat)
                    SetCreateStat(Stats(stat), float(pInfo->stats[stat]));
            }
            else                                            // not exist in DB, use some default fake data
            {
                // Erreur qui se declanche quand un mob invoque un add (squelette par exemple), et qui n'a
                // donc pas de stats de pet.
                DEBUG_LOG("Summoned pet (Entry: %u) not have pet stats data in DB", cinfo->Entry);

                // remove elite bonuses included in DB values
                SetCreateHealth(uint32(((float(cinfo->maxhealth) / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel));
                SetCreateMana(uint32(((float(cinfo->maxmana)   / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel));

                SetCreateStat(STAT_STRENGTH, 22);
                SetCreateStat(STAT_AGILITY, 22);
                SetCreateStat(STAT_STAMINA, 25);
                SetCreateStat(STAT_INTELLECT, 28);
                SetCreateStat(STAT_SPIRIT, 27);
            }
            break;
        }
        case HUNTER_PET:
        {
            SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, sObjectMgr.GetXPForPetLevel(petlevel));
            // Formulas reviewed by Clank <Nostalrius>, from vanilla pet tab screenshots.
            SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, float((petlevel * 1.15 * 1.05) * (float)GetAttackTime(BASE_ATTACK) / 2000));
            SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, float((petlevel * 1.45 * 1.05) * (float)GetAttackTime(BASE_ATTACK) / 2000));

            //stored standard pet stats are entry 1 in pet_levelinfo
            PetLevelInfo const* pInfo = sObjectMgr.GetPetLevelInfo(creature_ID, petlevel);
            if (pInfo)                                      // exist in DB
            {
                SetCreateHealth(pInfo->health);
                SetModifierValue(UNIT_MOD_ARMOR, BASE_VALUE, float(pInfo->armor));
                //SetModifierValue(UNIT_MOD_ATTACK_POWER, BASE_VALUE, float(cinfo->attackpower));

                for (int i = STAT_STRENGTH; i < MAX_STATS; ++i)
                    SetCreateStat(Stats(i),  float(pInfo->stats[i]));
            }
            else                                            // not exist in DB, use some default fake data
            {
                sLog.outErrorDb("Hunter pet levelstats missing in DB");

                // remove elite bonuses included in DB values
                SetCreateHealth(uint32(((float(cinfo->maxhealth) / cinfo->maxlevel) / (1 + 2 * cinfo->rank)) * petlevel));

                SetCreateStat(STAT_STRENGTH, 22);
                SetCreateStat(STAT_AGILITY, 22);
                SetCreateStat(STAT_STAMINA, 25);
                SetCreateStat(STAT_INTELLECT, 28);
                SetCreateStat(STAT_SPIRIT, 27);
            }
            break;
        }
        case GUARDIAN_PET:
        {
            SetUInt32Value(UNIT_FIELD_PETEXPERIENCE, 0);
            SetUInt32Value(UNIT_FIELD_PETNEXTLEVELEXP, 1000);

            SetUInt32Value(UNIT_FIELD_FLAGS, cinfo->unit_flags);

            SetCreateMana(cinfo->maxmana);
            SetCreateHealth(cinfo->maxhealth);

            SetAttackTime(BASE_ATTACK, cinfo->baseattacktime);
            SetAttackTime(OFF_ATTACK, cinfo->baseattacktime);
            SetAttackTime(RANGED_ATTACK, cinfo->rangeattacktime);

            SetBaseWeaponDamage(BASE_ATTACK, MINDAMAGE, cinfo->mindmg);
            SetBaseWeaponDamage(BASE_ATTACK, MAXDAMAGE, cinfo->maxdmg);
            break;
        }
        default:
            sLog.outError("Pet have incorrect type (%u) for levelup.", getPetType());
            break;
    }

    if (getPetType() != MINI_PET)
    {
        if (owner->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE))
            SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
        else
            RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PVP_ATTACKABLE);
    }

    for (int i = 0; i < 6; ++i)
    {
        if (createResistance[i] < 0)
        {
            SpellImmune immune;
            immune.type = (1 << (i + 1));
            immune.spellId = 642; // Any positive spell, for Unit::IsImmuneToSpell
            m_spellImmune[IMMUNITY_SCHOOL].push_back(immune);
        }
        else
            SetModifierValue(UnitMods(UNIT_MOD_RESISTANCE_HOLY + i), BASE_VALUE, createResistance[i]);
    }

    UpdateAllStats();

    SetHealth(GetMaxHealth());
    SetPower(POWER_MANA, GetMaxPower(POWER_MANA));

    return true;
}

bool Pet::HaveInDiet(ItemPrototype const* item) const
{
    if (!item->FoodType)
        return false;

    CreatureInfo const* cInfo = GetCreatureInfo();
    if (!cInfo)
        return false;

    CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(cInfo->family);
    if (!cFamily)
        return false;

    uint32 diet = cFamily->petFoodMask;
    uint32 FoodMask = 1 << (item->FoodType - 1);
    return diet & FoodMask;
}

uint32 Pet::GetCurrentFoodBenefitLevel(uint32 itemlevel) const
{
    // -5 or greater food level
    if (getLevel() <= itemlevel + 5)                        //possible to feed level 60 pet with level 55 level food for full effect
        return 35000;
    // -10..-6
    if (getLevel() <= itemlevel + 10)                  //pure guess, but sounds good
        return 17000;
    // -14..-11
    if (getLevel() <= itemlevel + 14)                  //level 55 food gets green on 70, makes sense to me
        return 8000;
    // -15 or less
    return 0;
    //food too low level
}

void Pet::ProhibitSpellSchool(SpellSchoolMask idSchoolMask, uint32 unTimeMs)
{
    // last check 1.12
    WorldPacket data(SMSG_SPELL_COOLDOWN, 8);
    data << GetObjectGuid();
    time_t curTime = time(nullptr);
    for (PetSpellMap::iterator itr = m_petSpells.begin(); itr != m_petSpells.end(); ++itr)
    {
        if (itr->second.state == PETSPELL_REMOVED)
            continue;
        uint32 unSpellId = itr->first;
        SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(unSpellId);
        if (!spellInfo)
        {
            MANGOS_ASSERT(spellInfo);
            continue;
        }

        // Not send cooldown for this spells
        if (spellInfo->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
            continue;

        if ((idSchoolMask & GetSpellSchoolMask(spellInfo)) && GetSpellCooldownDelay(unSpellId) < unTimeMs)
        {
            data << uint32(unSpellId);
            data << uint32(unTimeMs);                       // in m.secs
            AddSpellCooldown(unSpellId, 0, curTime + unTimeMs / IN_MILLISECONDS);
        }
    }
    if (Player* player = GetAffectingPlayer())
        player->GetSession()->SendPacket(&data);
    Unit::ProhibitSpellSchool(idSchoolMask, unTimeMs);
}

void Pet::_LoadSpellCooldowns()
{
    //QueryResult *result = CharacterDatabase.PQuery("SELECT spell,time FROM pet_spell_cooldown WHERE guid = '%u'",m_charmInfo->GetPetNumber());

    if (m_pTmpCache)
    {
        time_t curTime = time(nullptr);
        bool empty = true;

        WorldPacket data(SMSG_SPELL_COOLDOWN, (8 + size_t(m_pTmpCache->spellCooldown.size()) * 8));
        data << ObjectGuid(GetObjectGuid());
        //[-ZERO] data << uint8(0x0);                                 // flags (0x1, 0x2)

        for (PetSpellCDs::iterator it = m_pTmpCache->spellCooldown.begin(); it != m_pTmpCache->spellCooldown.end(); ++it)
        {
            //Field *fields = result->Fetch();

            uint32 spell_id = it->spell;//fields[0].GetUInt32();
            time_t db_time  = (time_t)it->time;//fields[1].GetUInt64();
            time_t db_cat_time = 0; // TODO ?
            SpellEntry const* spell = sSpellMgr.GetSpellEntry(spell_id);

            if (!spell)
            {
                sLog.outError("Pet %u have unknown spell %u in `pet_spell_cooldown`, skipping.", m_charmInfo->GetPetNumber(), spell_id);
                continue;
            }

            // skip outdated cooldown
            if (db_time <= curTime)
                continue;

            data << uint32(spell_id);
            uint32 timer = uint32(db_time - curTime) * IN_MILLISECONDS;
            data << uint32(uint32(db_time - curTime)*IN_MILLISECONDS);

            AddSpellCooldown(spell_id, 0, db_time, db_cat_time, spell->Category);
            empty = false;

            DEBUG_LOG("Pet (Number: %u) spell %u cooldown loaded (%u secs).", m_charmInfo->GetPetNumber(), spell_id, uint32(db_time - curTime));
        }
        //while( result->NextRow() );

        //delete result;

        if (!empty)
            if (Unit* owner = GetOwner())
                if (owner->ToPlayer())
                    owner->ToPlayer()->GetSession()->SendPacket(&data);
    }
}

void Pet::_SaveSpellCooldowns()
{
    if (m_pTmpCache)
        m_pTmpCache->spellCooldown.clear();

    static SqlStatementID delSpellCD ;
    static SqlStatementID insSpellCD ;

    SqlStatement stmt = CharacterDatabase.CreateStatement(delSpellCD, "DELETE FROM pet_spell_cooldown WHERE guid = ?");
    stmt.PExecute(m_charmInfo->GetPetNumber());

    time_t curTime = time(nullptr);
    time_t infTime = curTime + infinityCooldownDelayCheck;

    // remove outdated and save active
    for (SpellCooldowns::iterator itr = m_spellCooldowns.begin(); itr != m_spellCooldowns.end();)
    {
        if (itr->second.end <= curTime)
            m_spellCooldowns.erase(itr++);
        else if (itr->second.end <= infTime)                // not save locked cooldowns, it will be reset or set at reload
        {
            if (m_pTmpCache)
            {
                PetSpellCoodown cd;
                cd.spell = itr->first;
                cd.time  = itr->second.end;
                m_pTmpCache->spellCooldown.push_back(cd);
            }
            stmt = CharacterDatabase.CreateStatement(insSpellCD, "INSERT INTO pet_spell_cooldown (guid, spell, time) VALUES( ?, ?, ?)");
            stmt.PExecute(m_charmInfo->GetPetNumber(), itr->first, uint64(itr->second.end));
            ++itr;
        }
        else
            ++itr;
    }
}

void Pet::_LoadSpells()
{
    //QueryResult *result = CharacterDatabase.PQuery("SELECT spell,active FROM pet_spell WHERE guid = '%u'",m_charmInfo->GetPetNumber());

    if (m_pTmpCache)
    {
        for (PetSpells::iterator it = m_pTmpCache->spells.begin(); it != m_pTmpCache->spells.end(); ++it)
        {
            //Field *fields = result->Fetch();
            addSpell(it->spell, ActiveStates(it->active), PETSPELL_UNCHANGED);
        }
        //while( result->NextRow() );
        //delete result;
    }
}

void Pet::_SaveSpells()
{
    if (m_pTmpCache)
        m_pTmpCache->spells.clear();

    static SqlStatementID delSpell ;
    static SqlStatementID insSpell ;

    for (PetSpellMap::iterator itr = m_petSpells.begin(), next = m_petSpells.begin(); itr != m_petSpells.end(); itr = next)
    {
        ++next;

        // prevent saving family passives to DB
        if (itr->second.type == PETSPELL_FAMILY)
            continue;

        if (m_pTmpCache && itr->second.state != PETSPELL_REMOVED)
        {
            PetSpellCache c;
            c.spell  = itr->first;
            c.active = itr->second.active;
            m_pTmpCache->spells.push_back(c);
        }
        switch (itr->second.state)
        {
            case PETSPELL_REMOVED:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(delSpell, "DELETE FROM pet_spell WHERE guid = ? and spell = ?");
                stmt.PExecute(m_charmInfo->GetPetNumber(), itr->first);
                m_petSpells.erase(itr);
            }
            continue;
            case PETSPELL_CHANGED:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(delSpell, "DELETE FROM pet_spell WHERE guid = ? and spell = ?");
                stmt.PExecute(m_charmInfo->GetPetNumber(), itr->first);

                stmt = CharacterDatabase.CreateStatement(insSpell, "INSERT INTO pet_spell (guid,spell,active) VALUES (?, ?, ?)");
                stmt.PExecute(m_charmInfo->GetPetNumber(), itr->first, uint32(itr->second.active));
            }
            break;
            case PETSPELL_NEW:
            {
                SqlStatement stmt = CharacterDatabase.CreateStatement(insSpell, "INSERT INTO pet_spell (guid,spell,active) VALUES (?, ?, ?)");
                stmt.PExecute(m_charmInfo->GetPetNumber(), itr->first, uint32(itr->second.active));
            }
            break;
            case PETSPELL_UNCHANGED:
                continue;
        }

        itr->second.state = PETSPELL_UNCHANGED;
    }
}

void Pet::_LoadAuras(uint32 timediff)
{
    RemoveAllAuras();

    // all aura related fields
    for (int i = UNIT_FIELD_AURA; i <= UNIT_FIELD_AURASTATE; ++i)
        SetUInt32Value(i, 0);

    //QueryResult *result = CharacterDatabase.PQuery("SELECT caster_guid,item_guid,spell,stackcount,remaincharges,basepoints0,basepoints1,basepoints2,periodictime0,periodictime1,periodictime2,maxduration,remaintime,effIndexMask FROM pet_aura WHERE guid = '%u'",m_charmInfo->GetPetNumber());
    if (m_pTmpCache)
    {
        for (PetAuras::iterator it = m_pTmpCache->auras.begin(); it != m_pTmpCache->auras.end(); ++it)
        {
            ObjectGuid casterGuid  = ObjectGuid(it->caster_guid);
            uint32 item_lowguid = it->item_guid;
            uint32 spellid      = it->spell;

            uint32 stackcount   = it->stackcount;
            int32 remaincharges = (int32)it->remaincharges;
            int32 damage[MAX_EFFECT_INDEX];
            int32 periodicTime[MAX_EFFECT_INDEX];

            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                damage[i]      = it->basepoints[i];
                periodicTime[i] = it->periodictime[i];
            }
            int32 maxduration = it->maxduration;
            int32 remaintime = it->remaintime;
            uint32 effIndexMask = it->effIndexMask;

            SpellEntry const* spellproto = sSpellMgr.GetSpellEntry(spellid);
            if (!spellproto)
            {
                sLog.outError("Pet::_LoadAuras: Unknown spell (spellid %u), ignore.", spellid);
                continue;
            }

            // do not load single target auras (unless they were cast by the player)
            if (casterGuid != GetObjectGuid() && IsSingleTargetSpell(spellproto))
                continue;

            if (remaintime != -1 && !IsPositiveSpell(spellproto))
            {
                if (remaintime / IN_MILLISECONDS <= int32(timediff))
                    continue;

                remaintime -= timediff * IN_MILLISECONDS;
            }

            // prevent wrong values of remaincharges
            if (spellproto->procCharges == 0)
                remaincharges = 0;

            if (!spellproto->StackAmount)
                stackcount = 1;
            else if (spellproto->StackAmount < stackcount)
                stackcount = spellproto->StackAmount;
            else if (!stackcount)
                stackcount = 1;

            SpellAuraHolder *holder = CreateSpellAuraHolder(spellproto, this, nullptr);
            holder->SetLoadedState(casterGuid, ObjectGuid(HIGHGUID_ITEM, item_lowguid), stackcount, remaincharges, maxduration, remaintime);

            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if ((effIndexMask & (1 << i)) == 0)
                    continue;

                Aura* aura = CreateAura(spellproto, SpellEffectIndex(i), nullptr, holder, this);
                if (!damage[i])
                    damage[i] = aura->GetModifier()->m_amount;

                aura->SetLoadedState(damage[i], periodicTime[i]);
                holder->AddAura(aura, SpellEffectIndex(i));
            }

            if (!holder->IsEmptyHolder())
            {
                if (!AddSpellAuraHolder(holder))
                    holder = nullptr;
            }
            else
                delete holder;
        }
        //while( result->NextRow() );

        //delete result;
    }
}

void Pet::_SaveAuras()
{
    if (m_pTmpCache)
        m_pTmpCache->auras.clear();

    static SqlStatementID delAuras ;
    static SqlStatementID insAuras ;

    SqlStatement stmt = CharacterDatabase.CreateStatement(delAuras, "DELETE FROM pet_aura WHERE guid = ?");
    stmt.PExecute(m_charmInfo->GetPetNumber());

    SpellAuraHolderMap const& auraHolders = GetSpellAuraHolderMap();

    if (auraHolders.empty())
        return;

    stmt = CharacterDatabase.CreateStatement(insAuras, "INSERT INTO pet_aura (guid, caster_guid, item_guid, spell, stackcount, remaincharges, "
            "basepoints0, basepoints1, basepoints2, periodictime0, periodictime1, periodictime2, maxduration, remaintime, effIndexMask) "
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    for (SpellAuraHolderMap::const_iterator itr = auraHolders.begin(); itr != auraHolders.end(); ++itr)
    {
        SpellAuraHolder *holder = itr->second;

        bool save = true;
        for (int32 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            SpellEntry const* spellInfo = holder->GetSpellProto();
            if (spellInfo->EffectApplyAuraName[j] == SPELL_AURA_MOD_STEALTH ||
                    spellInfo->EffectApplyAuraName[j] == SPELL_AURA_MOD_POSSESS_PET || // Nostalrius : Fix crash avec "oeil de la bete"
                    spellInfo->Effect[j] == SPELL_EFFECT_APPLY_AREA_AURA_PET)
            {
                save = false;
                break;
            }
        }

        //skip all holders from spells that are passive or channeled
        //do not save single target holders (unless they were cast by the player)
        if (save && !holder->IsPassive() && !IsChanneledSpell(holder->GetSpellProto()) && (holder->GetCasterGuid() == GetObjectGuid() || !holder->IsSingleTarget()))
        {
            int32  damage[MAX_EFFECT_INDEX];
            uint32 periodicTime[MAX_EFFECT_INDEX];
            uint32 effIndexMask = 0;

            for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                damage[i] = 0;
                periodicTime[i] = 0;

                if (Aura *aur = holder->GetAuraByEffectIndex(SpellEffectIndex(i)))
                {
                    // don't save not own area auras
                    if (aur->IsAreaAura() && holder->GetCasterGuid() != GetObjectGuid())
                        continue;

                    damage[i] = aur->GetModifier()->m_amount;
                    periodicTime[i] = aur->GetModifier()->periodictime;
                    effIndexMask |= (1 << i);
                }
            }

            if (!effIndexMask)
                continue;

            if (m_pTmpCache)
            {
                PetAuraCache c;
                c.caster_guid    = holder->GetCasterGuid().GetRawValue();
                c.item_guid      = holder->GetCastItemGuid().GetCounter();
                c.spell          = holder->GetId();
                c.stackcount     = holder->GetStackAmount();
                c.remaincharges  = holder->GetAuraCharges();
                c.effIndexMask   = effIndexMask;
                c.maxduration    = holder->GetAuraMaxDuration();
                c.remaintime     = holder->GetAuraDuration();
                for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
                {
                    c.basepoints[i]   = damage[i];
                    c.periodictime[i]  = periodicTime[i];
                }
                m_pTmpCache->auras.push_back(c);
            }

            stmt.addUInt32(m_charmInfo->GetPetNumber());
            stmt.addUInt64(holder->GetCasterGuid().GetRawValue());
            stmt.addUInt32(holder->GetCastItemGuid().GetCounter());
            stmt.addUInt32(holder->GetId());
            stmt.addUInt32(holder->GetStackAmount());
            stmt.addUInt8(holder->GetAuraCharges());

            for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
                stmt.addInt32(damage[i]);

            for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
                stmt.addUInt32(periodicTime[i]);

            stmt.addInt32(holder->GetAuraMaxDuration());
            stmt.addInt32(holder->GetAuraDuration());
            stmt.addUInt32(effIndexMask);
            stmt.Execute();
        }
    }
}

bool Pet::addSpell(uint32 spell_id, ActiveStates active /*= ACT_DECIDE*/, PetSpellState state /*= PETSPELL_NEW*/, PetSpellType type /*= PETSPELL_NORMAL*/)
{
    SpellEntry const *spellInfo = sSpellMgr.GetSpellEntry(spell_id);
    if (!spellInfo)
    {
        // do pet spell book cleanup
        if (state == PETSPELL_UNCHANGED)                    // spell load case
        {
            sLog.outError("Pet::addSpell: nonexistent in SpellStore spell #%u request, deleting for all pets in `pet_spell`.", spell_id);
            CharacterDatabase.PExecute("DELETE FROM pet_spell WHERE spell = '%u'", spell_id);
        }
        else
            sLog.outError("Pet::addSpell: nonexistent in SpellStore spell #%u request.", spell_id);

        return false;
    }

    PetSpellMap::iterator itr = m_petSpells.find(spell_id);
    if (itr != m_petSpells.end())
    {
        if (itr->second.state == PETSPELL_REMOVED)
        {
            m_petSpells.erase(itr);
            state = PETSPELL_CHANGED;
        }
        else if (state == PETSPELL_UNCHANGED && itr->second.state != PETSPELL_UNCHANGED)
        {
            // can be in case spell loading but learned at some previous spell loading
            itr->second.state = PETSPELL_UNCHANGED;

            if (active == ACT_ENABLED)
                ToggleAutocast(spell_id, true);
            else if (active == ACT_DISABLED)
                ToggleAutocast(spell_id, false);

            return false;
        }
        else
            return false;
    }

    uint32 oldspell_id = 0;

    PetSpell newspell;
    newspell.state = state;
    newspell.type = type;

    if (active == ACT_DECIDE)                               //active was not used before, so we save it's autocast/passive state here
    {
        if (IsPassiveSpell(spellInfo))
            newspell.active = ACT_PASSIVE;
        else
            newspell.active = ACT_DISABLED;
    }
    else
        newspell.active = active;

    if (sSpellMgr.GetSpellRank(spell_id) != 0)
    {
        for (PetSpellMap::const_iterator itr2 = m_petSpells.begin(); itr2 != m_petSpells.end(); ++itr2)
        {
            if (itr2->second.state == PETSPELL_REMOVED) continue;

            if (sSpellMgr.IsRankSpellDueToSpell(spellInfo, itr2->first))
            {
                // replace by new high rank
                if (sSpellMgr.IsHighRankOfSpell(spell_id, itr2->first))
                {
                    newspell.active = itr2->second.active;

                    if (newspell.active == ACT_ENABLED)
                        ToggleAutocast(itr2->first, false);

                    oldspell_id = itr2->first;
                    unlearnSpell(itr2->first, false, false);
                    break;
                }
                // ignore new lesser rank
                else if (sSpellMgr.IsHighRankOfSpell(itr2->first, spell_id))
                    return false;
            }
        }
    }

    m_petSpells[spell_id] = newspell;

    if (IsPassiveSpell(spellInfo))
        CastSpell(this, spell_id, true);
    else
        m_charmInfo->AddSpellToActionBar(spell_id, ActiveStates(newspell.active));

    if (newspell.active == ACT_ENABLED)
        ToggleAutocast(spell_id, true);

    return true;
}

bool Pet::learnSpell(uint32 spell_id)
{
    // prevent duplicated entires in spell book
    if (!addSpell(spell_id))
        return false;

    if (!m_loading)
    {
        Unit* owner = GetOwner();
        if (owner && owner->GetTypeId() == TYPEID_PLAYER)
            ((Player*)owner)->PetSpellInitialize();
    }
    return true;
}

bool Pet::unlearnSpell(uint32 spell_id, bool learn_prev, bool clear_ab)
{
    if (removeSpell(spell_id, learn_prev, clear_ab))
        return true;
    return false;
}

bool Pet::removeSpell(uint32 spell_id, bool learn_prev, bool clear_ab)
{
    auto itr = m_petSpells.find(spell_id);
    if (itr == m_petSpells.end())
        return false;

    if (itr->second.state == PETSPELL_REMOVED)
        return false;

    if (itr->second.state == PETSPELL_NEW)
        m_petSpells.erase(itr);
    else
        itr->second.state = PETSPELL_REMOVED;

    RemoveAurasDueToSpell(spell_id);

    if (learn_prev)
    {
        if (uint32 prev_id = sSpellMgr.GetPrevSpellInChain(spell_id))
            learnSpell(prev_id);
        else
            learn_prev = false;
    }

    // if remove last rank or non-ranked then update action bar at server and client if need
    if (clear_ab && !learn_prev && m_charmInfo->RemoveSpellFromActionBar(spell_id))
    {
        if (!m_loading)
        {
            // need update action bar for last removed rank
            if (Unit* owner = GetOwner())
                if (owner->GetTypeId() == TYPEID_PLAYER)
                    ((Player*)owner)->PetSpellInitialize();
        }
    }

    return true;
}

void Pet::CleanupActionBar()
{
    for (int i = 0; i < MAX_UNIT_ACTION_BAR_INDEX; ++i)
        if (UnitActionBarEntry const* ab = m_charmInfo->GetActionBarEntry(i))
            if (uint32 action = ab->GetAction())
                if (ab->IsActionBarForSpell() && !HasSpell(action))
                    m_charmInfo->SetActionBar(i, 0, ACT_DISABLED);
}

void Pet::InitPetCreateSpells()
{
    m_charmInfo->InitPetActionBar();
    m_petSpells.clear();

    int32 usedtrainpoints = 0;

    uint32 petspellid;
    PetCreateSpellEntry const* CreateSpells = sObjectMgr.GetPetCreateSpellEntry(GetEntry());
    if (CreateSpells)
    {
        Unit* owner = GetOwner();
        Player* p_owner = owner && owner->GetTypeId() == TYPEID_PLAYER ? (Player*)owner : NULL;

        for (uint8 i = 0; i < 4; ++i)
        {
            if (!CreateSpells->spellid[i])
                break;

            SpellEntry const *learn_spellproto = sSpellMgr.GetSpellEntry(CreateSpells->spellid[i]);
            if (!learn_spellproto)
                continue;

            if (learn_spellproto->Effect[0] == SPELL_EFFECT_LEARN_SPELL || learn_spellproto->Effect[0] == SPELL_EFFECT_LEARN_PET_SPELL)
            {
                petspellid = learn_spellproto->EffectTriggerSpell[0];
                if (p_owner && !p_owner->HasSpell(learn_spellproto->Id))
                {
                    if (IsPassiveSpell(petspellid))         //learn passive skills when tamed, not sure if thats right
                        p_owner->learnSpell(learn_spellproto->Id, false);
                    else
                        AddTeachSpell(learn_spellproto->EffectTriggerSpell[0], learn_spellproto->Id);
                }
            }
            else
                petspellid = learn_spellproto->Id;

            addSpell(petspellid);

            SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(learn_spellproto->EffectTriggerSpell[0]);

            for (SkillLineAbilityMap::const_iterator _spell_idx = bounds.first; _spell_idx != bounds.second; ++_spell_idx)
            {
                usedtrainpoints += _spell_idx->second->reqtrainpoints;
                break;
            }
        }
    }

    LearnPetPassives();

    CastPetAuras(false);

    SetTP(-usedtrainpoints);
}

void Pet::CheckLearning(uint32 spellid)
{
    //charmed case -> prevent crash
    if (GetTypeId() == TYPEID_PLAYER || getPetType() != HUNTER_PET)
        return;

    Unit* owner = GetOwner();

    if (m_teachspells.empty() || !owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    TeachSpellMap::iterator itr = m_teachspells.find(spellid);
    if (itr == m_teachspells.end())
        return;

    if (urand(0, 100) < 10)
    {
        ((Player*)owner)->learnSpell(itr->second, false);
        m_teachspells.erase(itr);
    }
}

uint32 Pet::resetTalentsCost() const
{
    uint32 days = uint32(sWorld.GetGameTime() - m_resetTalentsTime) / DAY;

    // The first time reset costs 10 silver; after 1 day cost is reset to 10 silver
    if (m_resetTalentsCost < 10 * SILVER || days > 0)
        return 10 * SILVER;
    // then 50 silver
    else if (m_resetTalentsCost < 50 * SILVER)
        return 50 * SILVER;
    // then 1 gold
    else if (m_resetTalentsCost < 1 * GOLD)
        return 1 * GOLD;
    // then increasing at a rate of 1 gold; cap 10 gold
    else
        return (m_resetTalentsCost + 1 * GOLD > 10 * GOLD ? 10 * GOLD : m_resetTalentsCost + 1 * GOLD);
}

void Pet::ToggleAutocast(uint32 spellid, bool apply)
{
    if (IsPassiveSpell(spellid))
        return;

    PetSpellMap::iterator itr = m_petSpells.find(spellid);

    uint32 i;

    if (apply)
    {
        for (i = 0; i < m_autospells.size() && m_autospells[i] != spellid; ++i)
            ;                                               // just search

        if (i == m_autospells.size())
        {
            m_autospells.push_back(spellid);

            if (itr->second.active != ACT_ENABLED)
            {
                itr->second.active = ACT_ENABLED;
                if (itr->second.state != PETSPELL_NEW)
                    itr->second.state = PETSPELL_CHANGED;
            }
        }
    }
    else
    {
        AutoSpellList::iterator itr2 = m_autospells.begin();
        for (i = 0; i < m_autospells.size() && m_autospells[i] != spellid; ++i, itr2++)
            ;                                               // just search

        if (i < m_autospells.size())
        {
            m_autospells.erase(itr2);
            if (itr->second.active != ACT_DISABLED)
            {
                itr->second.active = ACT_DISABLED;
                if (itr->second.state != PETSPELL_NEW)
                    itr->second.state = PETSPELL_CHANGED;
            }
        }
    }
}

bool Pet::IsPermanentPetFor(Player* owner) const
{
    switch (getPetType())
    {
    case SUMMON_PET:
        switch (owner->getClass())
        {
            // oddly enough, Mage's Water Elemental is still treated as temporary pet with Glyph of Eternal Water
            // i.e. does not unsummon at mounting, gets dismissed at teleport etc.
            case CLASS_WARLOCK:
                return GetCreatureInfo()->type == CREATURE_TYPE_DEMON;
            default:
                return false;
        }
    case HUNTER_PET:
        return true;
    default:
        return false;
    }
}

bool Pet::Create(uint32 guidlow, CreatureCreatePos& cPos, CreatureInfo const* cinfo, uint32 pet_number)
{
    SetMap(cPos.GetMap());

    Object::_Create(guidlow, pet_number, HIGHGUID_PET);

    m_originalEntry = cinfo->Entry;

    if (!InitEntry(cinfo->Entry))
        return false;

    cPos.SelectFinalPoint(this);

    if (!cPos.Relocate(this))
        return false;

    SetSheath(SHEATH_STATE_MELEE);
    SetByteValue(UNIT_FIELD_BYTES_2, 1, UNIT_BYTE2_FLAG_UNK3 | UNIT_BYTE2_FLAG_AURAS | UNIT_BYTE2_FLAG_UNK5);

    if (getPetType() == MINI_PET)                           // always non-attackable
        SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

    return true;
}

bool Pet::HasSpell(uint32 spell) const
{
    PetSpellMap::const_iterator itr = m_petSpells.find(spell);
    return (itr != m_petSpells.end() && itr->second.state != PETSPELL_REMOVED);
}

// Get all passive spells in our skill line
void Pet::LearnPetPassives()
{
    CreatureInfo const* cInfo = GetCreatureInfo();
    if (!cInfo)
        return;

    CreatureFamilyEntry const* cFamily = sCreatureFamilyStore.LookupEntry(cInfo->family);
    if (!cFamily)
        return;

    PetFamilySpellsStore::const_iterator petStore = sPetFamilySpellsStore.find(cFamily->ID);
    if (petStore != sPetFamilySpellsStore.end())
    {
        for (PetFamilySpellsSet::const_iterator petSet = petStore->second.begin(); petSet != petStore->second.end(); ++petSet)
            addSpell(*petSet, ACT_DECIDE, PETSPELL_NEW, PETSPELL_FAMILY);
    }
}

void Pet::CastPetAuras(bool current)
{
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    if (!IsPermanentPetFor((Player*)owner))
        return;

    for (PetAuraSet::const_iterator itr = owner->m_petAuras.begin(); itr != owner->m_petAuras.end();)
    {
        PetAura const* pa = *itr;
        ++itr;

        if (!current && pa->IsRemovedOnChangePet())
            owner->RemovePetAura(pa);
        else
            CastPetAura(pa);
    }
}

void Pet::CastPetAura(PetAura const* aura)
{
    uint32 auraId = aura->GetAura(GetEntry());
    if (!auraId)
        return;

    if (auraId == 35696)                                      // Demonic Knowledge
    {
        int32 basePoints = int32(aura->GetDamage() * (GetStat(STAT_STAMINA) + GetStat(STAT_INTELLECT)) / 100);
        CastCustomSpell(this, auraId, &basePoints, nullptr, nullptr, true);
    }
    else
        CastSpell(this, auraId, true);
}

void Pet::SynchronizeLevelWithOwner()
{
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER)
        return;

    switch (getPetType())
    {
        // always same level
        case SUMMON_PET:
            GivePetLevel(owner->getLevel());
            break;
        // can't be greater owner level
        case HUNTER_PET:
            if (getLevel() > owner->getLevel())
                GivePetLevel(owner->getLevel());
            break;
        default:
            break;
    }
}

void Pet::SetEnabled(bool on)
{
    m_enabled = on;
    Unit* owner = GetOwner();
    if (!owner || owner->GetTypeId() != TYPEID_PLAYER || !GetCharmInfo())
        return;

    WorldPacket data(SMSG_PET_MODE, 12);
    data << GetObjectGuid();
    data << uint8(GetReactState());
    data << uint8(GetCharmInfo()->GetCommandState());
    data << uint8(0);
    data << uint8(m_enabled ? 0x0 : 0x8);
    ((Player*)owner)->GetSession()->SendPacket(&data);
}
