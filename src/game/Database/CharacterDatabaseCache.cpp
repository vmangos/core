#include "CharacterDatabaseCache.h"
#include "Log.h"
#include "Database/DatabaseEnv.h"
#include "Pet.h"


CharacterDatabaseCache::~CharacterDatabaseCache()
{
}

CharacterDatabaseCache::CharacterDatabaseCache()
{
}

void CharacterDatabaseCache::LoadAll(uint32 singlePetId)
{
    if (singlePetId)
        DeleteCharacterPetById(singlePetId);

    LoadCharacterPet(singlePetId);
    LoadPetSpell(singlePetId);
    LoadPetSpellCooldown(singlePetId);
    LoadPetAura(singlePetId);
}

void CharacterDatabaseCache::LoadCharacterPet(uint32 singlePetId)
{
    std::unique_ptr<QueryResult> result;
    if (singlePetId)
    {
        result.reset(CharacterDatabase.PQuery(
                     "SELECT `id`, `entry`, `owner`, `modelid`, `level`, `exp`, `Reactstate`, `loyaltypoints`, `loyalty`, `trainpoint`, "
                     "`slot`, `name`, `renamed`, `curhealth`, `curmana`, `curhappiness`, `abdata`, `TeachSpelldata`, `savetime`, `resettalents_cost`, "
                     "`resettalents_time`, `CreatedBySpell`, `PetType` FROM `character_pet` WHERE `id`=%u", singlePetId
                 ));
    }
    else if (!singlePetId)
    {
        m_petsByCharacter.clear();
        sLog.outString("* Loading table `character_pet`");
        result.reset(CharacterDatabase.Query(
                     "SELECT `id`, `entry`, `owner`, `modelid`, `level`, `exp`, `Reactstate`, `loyaltypoints`, `loyalty`, `trainpoint`, "
                     "`slot`, `name`, `renamed`, `curhealth`, `curmana`, `curhappiness`, `abdata`, `TeachSpelldata`, `savetime`, `resettalents_cost`, "
                     "`resettalents_time`, `CreatedBySpell`, `PetType` FROM `character_pet`"
                 ));
    }

    if (!result)
        return;

    uint32 count = 0;
    do
    {
        Field* fields = result->Fetch();
        CharacterPetCache* pCache = new CharacterPetCache;
        pCache->id = fields[0].GetUInt32();
        pCache->entry = fields[1].GetUInt32();
        pCache->owner = fields[2].GetUInt32();
        pCache->modelid = fields[3].GetUInt32();
        pCache->level = fields[4].GetUInt32();
        pCache->exp = fields[5].GetUInt32();
        pCache->Reactstate = fields[6].GetUInt8();
        pCache->loyaltypoints = fields[7].GetInt32();
        pCache->loyalty = fields[8].GetUInt32();
        pCache->trainpoint = fields[9].GetInt32();
        pCache->slot = fields[10].GetUInt32();
        pCache->name = fields[11].GetCppString();
        pCache->renamed = fields[12].GetBool();
        pCache->curhealth = fields[13].GetUInt32();
        pCache->curmana = fields[14].GetUInt32();
        pCache->curhappiness = fields[15].GetUInt32();
        pCache->abdata = fields[16].GetCppString();
        pCache->TeachSpelldata = fields[17].GetCppString();
        pCache->savetime = fields[18].GetUInt64();
        pCache->resettalents_cost = fields[19].GetUInt32();
        pCache->resettalents_time = fields[20].GetUInt32();
        pCache->CreatedBySpell = fields[21].GetUInt32();
        pCache->PetType = fields[22].GetUInt32();
        ++count;
        InsertCharacterPet(pCache);
    }
    while (result->NextRow());
    
    if (!singlePetId)
        sLog.outString("-> %u rows loaded.", count);
}

void CharacterDatabaseCache::LoadPetSpell(uint32 singlePetId)
{
    std::unique_ptr<QueryResult> result;
    if (singlePetId)
    {
        result.reset(CharacterDatabase.PQuery(
                     "SELECT `guid`, `spell`, `active` "
                     "FROM `pet_spell` WHERE `guid`=%u", singlePetId
                 ));
    }
    else
    {
        // Clear previously stored spells
        for (const auto& it : m_petsByGuid)
            it.second->spells.clear();

        sLog.outString("* Loading `pet_spell`");
        result.reset(CharacterDatabase.Query(
                     "SELECT `guid`, `spell`, `active` "
                     "FROM `pet_spell` ORDER BY `guid` ASC"
                 ));
    }

    if (!result)
        return;

    uint32 count = 0;
    CharacterPetCache* lastPetCache = nullptr;
    do
    {
        Field* fields = result->Fetch();
        uint32 lowGuid = fields[0].GetUInt32();
        uint32 spellId = fields[1].GetUInt32();
        uint8  active  = fields[2].GetUInt32();
        if (!lastPetCache || lastPetCache->id != lowGuid)
            lastPetCache = GetCharacterPetById(lowGuid);
        if (!lastPetCache)
            continue;
        PetSpellCache _spellStruct;
        _spellStruct.spell = spellId;
        _spellStruct.active = active;
        lastPetCache->spells.push_back(_spellStruct);
        ++count;
    }
    while (result->NextRow());
    
    if (!singlePetId)
        sLog.outString("-> %u rows loaded.", count);
}

void CharacterDatabaseCache::LoadPetSpellCooldown(uint32 singlePetId)
{
    std::unique_ptr<QueryResult> result;
    if (singlePetId)
    {
        result.reset(CharacterDatabase.PQuery(
                     "SELECT `guid`, `spell`, `time` "
                     "FROM `pet_spell_cooldown` WHERE `guid`=%u", singlePetId
                 ));
    }
    else
    {
        // Clear previously stored cooldowns
        for (const auto& it : m_petsByGuid)
            it.second->spellCooldown.clear();

        sLog.outString("* Loading `pet_spell_cooldown`");
        result.reset(CharacterDatabase.Query(
                     "SELECT `guid`, `spell`, `time` "
                     "FROM `pet_spell_cooldown` ORDER BY `guid` ASC"
                 ));
    }

    if (!result)
        return;

    uint32 count = 0;
    CharacterPetCache* lastPetCache = nullptr;

    do
    {
        Field* fields = result->Fetch();
        uint32 lowGuid = fields[0].GetUInt32();
        uint32 spellId = fields[1].GetUInt32();
        uint64 time    = fields[2].GetUInt64();
        if (!lastPetCache || lastPetCache->id != lowGuid)
            lastPetCache = GetCharacterPetById(lowGuid);
        if (!lastPetCache)
            continue;
        PetSpellCoodown _spellStruct;
        _spellStruct.spell = spellId;
        _spellStruct.time  = time;
        lastPetCache->spellCooldown.push_back(_spellStruct);
        ++count;
    }
    while (result->NextRow());

    if (!singlePetId)
        sLog.outString("-> %u rows loaded.", count);
}

void CharacterDatabaseCache::LoadPetAura(uint32 singlePetId)
{
    std::unique_ptr<QueryResult> result;
    if (singlePetId)
    {
        result.reset(CharacterDatabase.PQuery(
                     "SELECT `guid`, `caster_guid`, `item_guid`, `spell`, `stackcount`, `remaincharges`, `maxduration`, `remaintime`, `effIndexMask`, "
                     "`basepoints0`, `basepoints1`, `basepoints2`, `periodictime0`, `periodictime1`, `periodictime2` "
                     "FROM `pet_aura` WHERE `guid`=%u", singlePetId
                 ));
    }
    else
    {
        // Clear previously stored auras
        for (const auto& it : m_petsByGuid)
            it.second->auras.clear();

        sLog.outString("* Loading table `pet_aura`");
        result.reset(CharacterDatabase.Query(
                                  //          0     1             2            3         4                 5              6            7              8
                                  "SELECT `guid`, `caster_guid`, `item_guid`, `spell`, `stackcount`, `remaincharges`, `maxduration`, `remaintime`, `effIndexMask`, "
                                  // 9 -> 11                                     12 -> 14
                                  "`basepoints0`, `basepoints1`, `basepoints2`, `periodictime0`, `periodictime1`, `periodictime2` "
                                  "FROM `pet_aura` ORDER BY `guid` ASC"
                              ));
    }

    if (!result)
        return;

    uint32 count = 0;
    CharacterPetCache* lastPetCache = nullptr;

    do
    {
        Field* fields = result->Fetch();
        uint32 lowGuid = fields[0].GetUInt32();

        if (!lastPetCache || lastPetCache->id != lowGuid)
            lastPetCache = GetCharacterPetById(lowGuid);
        if (!lastPetCache)
            continue;

        PetAuraCache _auraStruct;
        _auraStruct.caster_guid   = fields[1].GetUInt64();
        _auraStruct.item_guid = fields[2].GetUInt32();
        _auraStruct.spell = fields[3].GetUInt32();
        _auraStruct.stackcount = fields[4].GetUInt32();
        _auraStruct.remaincharges = fields[5].GetUInt32();
        _auraStruct.maxduration = fields[6].GetInt32();
        _auraStruct.remaintime = fields[7].GetInt32();
        _auraStruct.effIndexMask = fields[8].GetUInt32();

        for (int i = 0; i < 3; ++i)
        {
            _auraStruct.basepoints[i]   = fields[9 + i].GetInt32();
            _auraStruct.periodictime[i]  = fields[12 + i].GetUInt32();
        }

        if (!_auraStruct.spell)
            continue;

        lastPetCache->auras.push_back(_auraStruct);
        ++count;
    }
    while (result->NextRow());
    
    if (!singlePetId)
        sLog.outString("-> %u rows loaded.", count);
}

CharacterPetCache* CharacterDatabaseCache::GetCharacterPetById(uint32 id)
{
    PetGuidToPetMap::iterator petStruct = m_petsByGuid.find(id);
    if (petStruct == m_petsByGuid.end())
        return nullptr;
    return petStruct->second;
}

CharacterPetCache* CharacterDatabaseCache::GetCharacterPetCacheByOwnerAndId(uint64 owner, uint32 id)
{
    // FROM character_pet WHERE owner = '%u' AND id = '%u'
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(owner);
    if (ownerPets == m_petsByCharacter.end())
        return nullptr;
    for (const auto& it : ownerPets->second)
        if (it->id == id)
            return it;

    return nullptr;
}

CharacterPetCache* CharacterDatabaseCache::GetCharacterCurrentPet(uint64 owner)
{
    // FROM character_pet WHERE owner = '%u' AND slot = 'PET_SAVE_AS_CURRENT'
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(owner);
    if (ownerPets == m_petsByCharacter.end())
        return nullptr;
    for (const auto& it : ownerPets->second)
        if (it->slot == PET_SAVE_AS_CURRENT)
            return it;

    return nullptr;
}

CharacterPetCache* CharacterDatabaseCache::GetCharacterPetByOwnerAndEntry(uint64 owner, uint32 entry)
{
    // FROM character_pet WHERE owner = '%u' AND entry = '%u' AND (slot = 'PET_SAVE_AS_CURRENT' OR slot > 'PET_SAVE_LAST_STABLE_SLOT')
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(owner);
    if (ownerPets == m_petsByCharacter.end())
        return nullptr;
    for (const auto& it : ownerPets->second)
        if (it->entry == entry && (it->slot == PET_SAVE_AS_CURRENT || it->slot > PET_SAVE_LAST_STABLE_SLOT))
            return it;

    return nullptr;
}

CharacterPetCache* CharacterDatabaseCache::GetCharacterPetByOwner(uint64 owner)
{
    // FROM character_pet WHERE owner = '%u' AND (slot = 'PET_SAVE_AS_CURRENT' OR slot > 'PET_SAVE_LAST_STABLE_SLOT')
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(owner);
    if (ownerPets == m_petsByCharacter.end())
        return nullptr;
    for (const auto& it : ownerPets->second)
        if (it->slot == PET_SAVE_AS_CURRENT || it->slot > PET_SAVE_LAST_STABLE_SLOT)
            return it;

    return nullptr;
}

void CharacterDatabaseCache::CharacterPetSetOthersNotInSlot(CharacterPetCache* pCache)
{
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(pCache->owner);
    if (ownerPets == m_petsByCharacter.end())
        return;
    for (const auto& it : ownerPets->second)
        if (it->id != pCache->id && it->slot == PET_SAVE_AS_CURRENT)
            it->slot = PET_SAVE_NOT_IN_SLOT;
}

void CharacterDatabaseCache::InsertCharacterPet(CharacterPetCache* cache)
{
    m_petsByCharacter[cache->owner].push_back(cache);
    m_petsByGuid[cache->id] = cache;
}

void CharacterDatabaseCache::DeleteCharacterPetById(uint32 id)
{
    PetGuidToPetMap::iterator petStruct = m_petsByGuid.find(id);
    if (petStruct == m_petsByGuid.end())
        return;
    CharPetMap::iterator ownerPets = m_petsByCharacter.find(petStruct->second->owner);
    for (CharPetVector::iterator it = ownerPets->second.begin(); it != ownerPets->second.end(); ++it)
        if ((*it)->id == id)
        {
            ownerPets->second.erase(it);
            break;
        }
    delete petStruct->second;
    m_petsByGuid.erase(petStruct);
}

uint32 CharacterDatabaseCache::GetNextAvailablePetNumber(uint32 minimumValue) const
{
    // Returns an iterator pointing to $minimumValue if exists, or greater than $minimumValue
    PetGuidToPetMap::const_iterator it = m_petsByGuid.lower_bound(minimumValue);
    while (it != m_petsByGuid.end() && it->first == minimumValue)
    {
        ++minimumValue;
        ++it;
    }
    return minimumValue;
}
