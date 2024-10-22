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

#ifndef __SPELL_H
#define __SPELL_H

#include "Common.h"
#include "SharedDefines.h"
#include "DBCEnums.h"
#include "ObjectGuid.h"
#include "LootMgr.h"
#include "Player.h"

#ifdef USE_STANDARD_MALLOC
#include <vector>
#else
#include "tbb/concurrent_vector.h"
#endif

#include <memory>

class WorldSession;
class WorldPacket;
class DynamicObj;
class Item;
class GameObject;
class Group;
class Aura;

enum SpellCastFlags
{
    CAST_FLAG_NONE              = 0x00000000,
    CAST_FLAG_HIDDEN_COMBATLOG  = 0x00000001,               // hide in combat log?
    CAST_FLAG_UNKNOWN2          = 0x00000002,
    CAST_FLAG_UNKNOWN3          = 0x00000004,
    CAST_FLAG_UNKNOWN4          = 0x00000008,
    CAST_FLAG_UNKNOWN5          = 0x00000010,
    CAST_FLAG_AMMO              = 0x00000020,               // Projectiles visual
    CAST_FLAG_UNKNOWN7          = 0x00000040,               // !0x41 mask used to call CGTradeSkillInfo::DoRecast
    CAST_FLAG_UNKNOWN8          = 0x00000080,
    CAST_FLAG_UNKNOWN9          = 0x00000100,
};

enum SpellNotifyPushType
{
    PUSH_IN_FRONT,
    PUSH_IN_FRONT_90,
    PUSH_IN_FRONT_15,
    PUSH_IN_BACK,
    PUSH_SELF_CENTER,
    PUSH_SRC_CENTER,
    PUSH_DEST_CENTER,
    PUSH_TARGET_CENTER
};

namespace MaNGOS
{
    struct SpellNotifierPlayer;
    struct SpellNotifierCreatureAndPlayer;
}

class SpellCastTargets;

struct SpellCastTargetsReader
{
    explicit SpellCastTargetsReader(SpellCastTargets& _targets, Unit* _caster) : targets(_targets), caster(_caster) {}

    SpellCastTargets& targets;
    Unit* caster;
};

class SpellCastTargets
{
    public:
        SpellCastTargets();
        ~SpellCastTargets();

        void read(ByteBuffer& data, Unit* caster);
        void write(ByteBuffer& data) const;

        SpellCastTargetsReader ReadForCaster(Unit* caster) { return SpellCastTargetsReader(*this,caster); }

        SpellCastTargets& operator=(SpellCastTargets const& target)
        {
            m_unitTarget = target.m_unitTarget;
            m_itemTarget = target.m_itemTarget;
            m_GOTarget   = target.m_GOTarget;

            m_unitTargetGUID    = target.m_unitTargetGUID;
            m_GOTargetGUID      = target.m_GOTargetGUID;
            m_CorpseTargetGUID  = target.m_CorpseTargetGUID;
            m_itemTargetGUID    = target.m_itemTargetGUID;

            m_itemTargetEntry  = target.m_itemTargetEntry;

            m_srcX = target.m_srcX;
            m_srcY = target.m_srcY;
            m_srcZ = target.m_srcZ;

            m_destX = target.m_destX;
            m_destY = target.m_destY;
            m_destZ = target.m_destZ;

            m_strTarget = target.m_strTarget;

            m_targetMask = target.m_targetMask;

            return *this;
        }

        ObjectGuid getUnitTargetGuid() const { return m_unitTargetGUID; }
        Unit* getUnitTarget() const { return m_unitTarget; }
        void setUnitTarget(Unit* target);
        void setDestination(float x, float y, float z);
        void setSource(float x, float y, float z);
        void getDestination(float& x, float& y, float& z) const { x = m_destX; y = m_destY; z = m_destZ; }
        void getSource(float& x, float& y, float& z) const { x = m_srcX; y = m_srcY, z = m_srcZ; }

        ObjectGuid getGOTargetGuid() const { return m_GOTargetGUID; }
        GameObject* getGOTarget() const { return m_GOTarget; }
        void setGOTarget(GameObject* target);

        ObjectGuid getCorpseTargetGuid() const { return m_CorpseTargetGUID; }
        void setCorpseTarget(Corpse* corpse);

        ObjectGuid getItemTargetGuid() const { return m_itemTargetGUID; }
        Item* getItemTarget() const { return m_itemTarget; }
        uint32 getItemTargetEntry() const { return m_itemTargetEntry; }
        void setItemTarget(Item* item);
        void setTradeItemTarget(Player* caster);
        void updateTradeSlotItem()
        {
            if (m_itemTarget && (m_targetMask & TARGET_FLAG_TRADE_ITEM))
            {
                m_itemTargetGUID = m_itemTarget->GetObjectGuid();
                m_itemTargetEntry = m_itemTarget->GetEntry();
            }
        }

        bool IsEmpty() const { return !m_GOTargetGUID && !m_unitTargetGUID && !m_itemTarget && !m_CorpseTargetGUID; }

        void Update(SpellCaster* caster);

        float m_srcX, m_srcY, m_srcZ;
        float m_destX, m_destY, m_destZ;
        std::string m_strTarget;

        uint16 m_targetMask;
    private:
        // objects (can be used at spell creating and after Update at casting
        Unit* m_unitTarget;
        GameObject* m_GOTarget;
        Item *m_itemTarget;

        // object GUID/etc, can be used always
        ObjectGuid m_unitTargetGUID;
        ObjectGuid m_GOTargetGUID;
        ObjectGuid m_CorpseTargetGUID;
        ObjectGuid m_itemTargetGUID;
        uint32 m_itemTargetEntry;
};

inline ByteBuffer& operator<< (ByteBuffer& buf, SpellCastTargets const& targets)
{
    targets.write(buf);
    return buf;
}

inline ByteBuffer& operator>> (ByteBuffer& buf, SpellCastTargetsReader const& targets)
{
    targets.targets.read(buf,targets.caster);
    return buf;
}

enum SpellState
{
    SPELL_STATE_NULL      = 0,
    SPELL_STATE_PREPARING = 1,
    SPELL_STATE_CASTING   = 2,
    SPELL_STATE_FINISHED  = 3,
    SPELL_STATE_IDLE      = 4,
    SPELL_STATE_DELAYED   = 5
};

enum SpellTargets
{
    SPELL_TARGETS_HOSTILE,
    SPELL_TARGETS_NOT_FRIENDLY,
    SPELL_TARGETS_NOT_HOSTILE,
    SPELL_TARGETS_FRIENDLY,
    SPELL_TARGETS_AOE_DAMAGE,
    SPELL_TARGETS_ALL
};

#define SPELL_SPELL_CHANNEL_UPDATE_INTERVAL (1*IN_MILLISECONDS)

typedef std::multimap<uint64, uint64> SpellTargetTimeMap;
struct SpellModifier;

class Spell
{
    friend struct MaNGOS::SpellNotifierPlayer;
    friend struct MaNGOS::SpellNotifierCreatureAndPlayer;
    friend void SpellCaster::SetCurrentCastedSpell(Spell* pSpell);
    friend void SpellCaster::MoveChannelledSpellWithCastTime(Spell* pSpell);
    public:

        void EffectEmpty(SpellEffectIndex effIdx);
        void EffectNULL(SpellEffectIndex effIdx);
        void EffectUnused(SpellEffectIndex effIdx);
        void EffectDistract(SpellEffectIndex effIdx);
        void EffectPull(SpellEffectIndex effIdx);
        void EffectSchoolDMG(SpellEffectIndex effIdx);
        void EffectEnvironmentalDMG(SpellEffectIndex effIdx);
        void EffectInstaKill(SpellEffectIndex effIdx);
        void EffectDummy(SpellEffectIndex effIdx);
        void EffectTeleportUnits(SpellEffectIndex effIdx);
        void EffectApplyAura(SpellEffectIndex effIdx);
        void EffectSendEvent(SpellEffectIndex effIdx);
        void EffectPowerBurn(SpellEffectIndex effIdx);
        void EffectPowerDrain(SpellEffectIndex effIdx);
        void EffectHeal(SpellEffectIndex effIdx);
        void EffectBind(SpellEffectIndex effIdx);
        void EffectHealthLeech(SpellEffectIndex effIdx);
        void EffectQuestComplete(SpellEffectIndex effIdx);
        void EffectCreateItem(SpellEffectIndex effIdx);
        void EffectPersistentAA(SpellEffectIndex effIdx);
        void EffectEnergize(SpellEffectIndex effIdx);
        void EffectOpenLock(SpellEffectIndex effIdx);
        void EffectSummonChangeItem(SpellEffectIndex effIdx);
        void EffectProficiency(SpellEffectIndex effIdx);
        void EffectApplyAreaAura(SpellEffectIndex effIdx);
        void EffectSummon(SpellEffectIndex effIdx);
        void EffectLearnSpell(SpellEffectIndex effIdx);
        void EffectDispel(SpellEffectIndex effIdx);
        void EffectLanguage(SpellEffectIndex effIdx);
        void EffectDualWield(SpellEffectIndex effIdx);
        void EffectPickPocket(SpellEffectIndex effIdx);
        void EffectAddFarsight(SpellEffectIndex effIdx);
        void EffectSummonWild(SpellEffectIndex effIdx);
        void EffectSummonGuardian(SpellEffectIndex effIdx);
        void EffectSummonPossessed(SpellEffectIndex effIdx);
        void EffectHealMechanical(SpellEffectIndex effIdx);
        void EffectTeleUnitsFaceCaster(SpellEffectIndex effIdx);
        void EffectLearnSkill(SpellEffectIndex effIdx);
        void EffectAddHonor(SpellEffectIndex effIdx);
        void EffectSpawn(SpellEffectIndex effIdx);
        void EffectTradeSkill(SpellEffectIndex effIdx);
        void EffectEnchantItemPerm(SpellEffectIndex effIdx);
        void EffectEnchantItemTmp(SpellEffectIndex effIdx);
        void EffectTameCreature(SpellEffectIndex effIdx);
        void EffectSummonPet(SpellEffectIndex effIdx);
        void EffectLearnPetSpell(SpellEffectIndex effIdx);
        void EffectWeaponDmg(SpellEffectIndex effIdx);
        void EffectTriggerSpell(SpellEffectIndex effIdx);
        void EffectTriggerMissileSpell(SpellEffectIndex effIdx);
        void EffectThreat(SpellEffectIndex effIdx);
        void EffectHealMaxHealth(SpellEffectIndex effIdx);
        void EffectInterruptCast(SpellEffectIndex effIdx);
        void EffectSummonObjectWild(SpellEffectIndex effIdx);
        void EffectScriptEffect(SpellEffectIndex effIdx);
        void EffectSanctuary(SpellEffectIndex effIdx);
        void EffectAddComboPoints(SpellEffectIndex effIdx);
        void EffectCreateHouse(SpellEffectIndex effIdx);
        void EffectDuel(SpellEffectIndex effIdx);
        void EffectStuck(SpellEffectIndex effIdx);
        void EffectSummonPlayer(SpellEffectIndex effIdx);
        void EffectActivateObject(SpellEffectIndex effIdx);
        void EffectSummonTotem(SpellEffectIndex effIdx);
        void EffectEnchantHeldItem(SpellEffectIndex effIdx);
        void EffectSummonObject(SpellEffectIndex effIdx);
        void EffectResurrect(SpellEffectIndex effIdx);
        void EffectParry(SpellEffectIndex effIdx);
        void EffectBlock(SpellEffectIndex effIdx);
        void EffectLeapForward(SpellEffectIndex effIdx);
        void EffectTransmitted(SpellEffectIndex effIdx);
        void EffectDisEnchant(SpellEffectIndex effIdx);
        void EffectInebriate(SpellEffectIndex effIdx);
        void EffectFeedPet(SpellEffectIndex effIdx);
        void EffectDismissPet(SpellEffectIndex effIdx);
        void EffectReputation(SpellEffectIndex effIdx);
        void EffectSelfResurrect(SpellEffectIndex effIdx);
        void EffectSkinning(SpellEffectIndex effIdx);
        void EffectCharge(SpellEffectIndex effIdx);
        void EffectSendTaxi(SpellEffectIndex effIdx);
        void EffectSummonCritter(SpellEffectIndex effIdx);
        void EffectKnockBack(SpellEffectIndex effIdx);
        void EffectPlayerPull(SpellEffectIndex effIdx);
        void EffectDispelMechanic(SpellEffectIndex effIdx);
        void EffectSummonDeadPet(SpellEffectIndex effIdx);
        void EffectDestroyAllTotems(SpellEffectIndex effIdx);
        void EffectDurabilityDamage(SpellEffectIndex effIdx);
        void EffectSkill(SpellEffectIndex effIdx);
        void EffectTaunt(SpellEffectIndex effIdx);
        void EffectDurabilityDamagePCT(SpellEffectIndex effIdx);
        void EffectModifyThreatPercent(SpellEffectIndex effIdx);
        void EffectResurrectNew(SpellEffectIndex effIdx);
        void EffectAddExtraAttacks(SpellEffectIndex effIdx);
        void EffectSpiritHeal(SpellEffectIndex effIdx);
        void EffectSkinPlayerCorpse(SpellEffectIndex effIdx);
        void EffectSummonDemon(SpellEffectIndex effIdx);
        // Nostalrius
        void EffectDespawnObject(SpellEffectIndex effIdx);
        void EffectNostalrius(SpellEffectIndex effIdx);
        void HandleAddTargetTriggerAuras();

        Spell(Unit* caster, SpellEntry const* info, bool triggered, ObjectGuid originalCasterGUID = ObjectGuid(), SpellEntry const* triggeredBy = nullptr, Unit* victim = nullptr, SpellEntry const* triggeredByParent = nullptr);
        Spell(GameObject* caster, SpellEntry const* info, bool triggered, ObjectGuid originalCasterGUID = ObjectGuid(), SpellEntry const* triggeredBy = nullptr, Unit* victim = nullptr, SpellEntry const* triggeredByParent = nullptr);
        ~Spell();

        SpellCastResult prepare(SpellCastTargets targets, Aura* triggeredByAura = nullptr, uint32 chance = 0);
        SpellCastResult prepare(Aura* triggeredByAura = nullptr, uint32 chance = 0);

        void cancel();

        void update(uint32 difftime);
        void cast(bool skipCheck = false);
        void finish(bool ok = true);
        void TakePower();
        void TakeReagents();
        void TakeCastItem();
        void TakeAmmo();

        SpellCastResult CheckCast(bool strict);
        SpellCastResult CheckPetCast(Unit* target);

        bool isSuccessCast() const { return m_successCast; }

        // handlers
        void handle_immediate();
        uint64 handle_delayed(uint64 t_offset);
        // handler helpers
        void _handle_immediate_phase();
        void _handle_finish_phase();
        // Nostalrius
        void OnSpellLaunch();

        SpellCastResult CheckItems();
        SpellCastResult CheckRange(bool strict);
        SpellCastResult CheckPower() const;
        SpellCastResult CheckCasterAuras() const;

        float CalculateDamage(SpellEffectIndex i, Unit* target) { return m_caster->CalculateSpellEffectValue(target, m_spellInfo, i, &m_currentBasePoints[i], this); }
        static uint32 CalculatePowerCost(SpellEntry const* spellInfo, Unit* caster, Spell* spell = nullptr, Item* castItem = nullptr, bool casting = true);

        bool HaveTargetsForEffect(SpellEffectIndex effect) const;
        void Delayed();
        void DelayedChannel();
        uint32 getState() const { return m_spellState; }
        void setState(uint32 state) { m_spellState = state; }

        void DoCreateItem(SpellEffectIndex effIdx, uint32 itemtype);

        void WriteSpellGoTargets(WorldPacket* data);
        void WriteAmmoToPacket(WorldPacket* data);

        typedef std::list<Unit*> UnitList;
        void FillTargetMap();
        void SetTargetMap(SpellEffectIndex effIndex, uint32 targetMode, UnitList &targetUnitMap);

        void FillAreaTargets(UnitList &targetUnitMap, float radius, SpellNotifyPushType pushType, SpellTargets spellTargets, SpellCaster* originalCaster = nullptr);
        void FillRaidOrPartyTargets(UnitList &TagUnitMap, Unit* target, float radius, bool raid, bool withPets, bool withcaster) const;

        template<typename T> WorldObject* FindCorpseUsing();

        bool CheckTarget(Unit* target, SpellEffectIndex eff);
        bool CanAutoCast(Unit* target);

        static void SendCastResult(Player* caster, SpellEntry const* spellInfo, SpellCastResult result);
        void SendCastResult(SpellCastResult result);
        void SendSpellStart();
        void SendSpellGo();
        void SendSpellCooldown();
        void SendLogExecute();
        void SendInterrupted(uint8 result);
        void SendAllTargetsMiss();
        void SendChannelUpdate(uint32 time, bool interrupted = false);
        void SendChannelStart(uint32 duration);
        void SendResurrectRequest(Player* target, bool sickness);

        void HandleEffects(Unit* pUnitTarget,Item *pItemTarget,GameObject* pGOTarget,SpellEffectIndex i, float DamageMultiplier = 1.0);
        void HandleThreatSpells();
        //void HandleAddAura(Unit* Target);

        SpellEntry const* m_spellInfo;
        SpellEntry const* m_originalSpellInfo = nullptr;    // For auto down-ranking aura case, we send this in cast result packet
        SpellEntry const* m_triggeredBySpellInfo;
        SpellEntry const* m_triggeredByParentSpellInfo;     // Spell that triggered the spell that triggered this
        int32 m_currentBasePoints[MAX_EFFECT_INDEX];        // cache SpellEntry::CalculateSimpleValue and use for set custom base points
        Item* m_CastItem = nullptr;
        SpellCastTargets m_targets;

        int32 GetCastTime() const { return m_casttime; }
        uint32 GetCastedTime() { return m_timer; }
        bool IsChanneled() const { return m_channeled; }
        bool IsAutoRepeat() const { return m_autoRepeat; }
        void SetAutoRepeat(bool rep) { m_autoRepeat = rep; }
        void ReSetTimer() { m_timer = m_casttime > 0 ? m_casttime : 0; }
        bool IsChannelActive() const { return m_casterUnit ? m_casterUnit->GetUInt32Value(UNIT_CHANNEL_SPELL) != 0 : false; }
        bool IsMeleeAttackResetSpell() const { return !m_IsTriggeredSpell && m_spellInfo->HasSpellInterruptFlag(SPELL_INTERRUPT_FLAG_COMBAT);  }
        bool IsRangedAttackResetSpell() const { return !m_IsTriggeredSpell && m_spellInfo->IsRangedSpell() && m_spellInfo->HasSpellInterruptFlag(SPELL_INTERRUPT_FLAG_COMBAT); }

        bool IsDeletable() const { return !m_referencedFromCurrentSpell && !m_executeStack; }
        void SetReferencedFromCurrent(bool yes) { m_referencedFromCurrentSpell = yes; }
        void SetExecutedCurrently(bool yes) { if (yes) ++m_executeStack; else --m_executeStack; }
        uint64 GetDelayStart() const { return m_delayStart; }
        void SetDelayStart(uint64 m_time) { m_delayStart = m_time; }
        uint64 GetDelayMoment() const { return m_delayMoment; }

        bool IsNeedSendToClient() const;                    // use for hide spell cast for client in case when cast not have client side affect (animation or log entries)
        bool IsTriggeredSpellWithRedundentData() const;     // use for ignore some spell data for triggered spells like cast time, some triggered spells have redundent copy data from main spell for client use purpose

        CurrentSpellTypes GetCurrentContainer() const;

        // caster types:
        // formal spell caster, in game source of spell affects cast
        SpellCaster* GetCaster() const { return m_caster; }
        // real source of cast affects, explicit caster, or DoT/HoT applier, or GO owner, or wild GO itself. Can be nullptr
        SpellCaster* GetAffectiveCasterObject() const;
        // limited version returning nullptr in cases wild gameobject caster object, need for Aura (auras currently not support non-Unit caster)
        Unit* GetAffectiveCaster() const { return m_originalCasterGUID ? m_originalCaster : m_casterUnit; }
        // m_originalCasterGUID can store GO guid, and in this case this is visual caster
        SpellCaster* GetCastingObject() const;
        ObjectGuid GetOriginalCasterGuid() const { return m_originalCasterGUID; }

        uint32 GetPowerCost() const { return m_powerCost; }

        void UpdatePointers();                              // must be used at call Spell code after time delay (non triggered spell cast/update spell call/etc)

        bool CheckTargetCreatureType(Unit* target) const;

        void AddTriggeredSpell(SpellEntry const* spellInfo) { m_TriggerSpells.push_back(spellInfo); }
        void AddPrecastSpell(SpellEntry const* spellInfo) { m_preCastSpells.push_back(spellInfo); }
        void AddTriggeredSpell(uint32 spellId);
        void AddPrecastSpell(uint32 spellId);
        void CastPreCastSpells(Unit* target);
        void CastTriggerSpells();

        void CleanupTargetList();
        void ClearCastItem();

        bool m_isClientStarted = false;
        void SetClientStarted(bool isClientStarted);
        bool IsTriggered() const       { return m_IsTriggeredSpell; }
        bool IsTriggeredByAura() const { return m_triggeredByAuraSpell; }
        bool IsTriggeredByProc() const;
        bool IsCastByItem() const      { return m_CastItem; }
        void SetCastItem(Item* item)
        {
            m_CastItem = item;
        }
        bool ShouldRemoveStealthAuras();

        void AddChanneledAuraHolder(SpellAuraHolder* holder);
        void RemoveChanneledAuraHolder(SpellAuraHolder* holder, AuraRemoveMode mode);

        void Delete() const;

        bool HasModifierApplied(SpellModifier* mod);
        std::list<SpellModifier*> m_appliedMods;

        SpellSchoolMask m_spellSchoolMask;                  // Spell school (can be overwrite for some spells (wand shoot for example)

        // Stryg
        uint8 GetTargetNum() const { return m_targetNum; }

        // For summoning ritual helpers visual spell
        void SetChannelingVisual(bool value) { m_isChannelingVisual = value; }
        bool IsChannelingVisual() const { return m_isChannelingVisual; }

        int32 GetAbsorbedDamage() const { return m_absorbed; }
    protected:
        void SendLoot(ObjectGuid guid, LootType loottype, LockType lockType);
        bool IgnoreItemRequirements() const;                // some item use spells have unexpected reagent data
        void UpdateOriginalCasterPointer();
        void UpdateCastStartPosition();

        SpellCaster* const m_caster = nullptr;
        Unit* const m_casterUnit = nullptr;
        GameObject* const m_casterGo = nullptr;

        ObjectGuid m_originalCasterGUID;                    // real source of cast (aura caster/etc), used for spell targets selection
                                                            // e.g. damage around area spell trigered by victim aura and damage enemies of aura caster
        Unit* m_originalCaster = nullptr;                   // cached pointer for m_originalCaster, updated at Spell::UpdatePointers()

        Spell** m_selfContainer = nullptr;                  // pointer to our spell container (if applicable)

        //Spell data
        WeaponAttackType m_attackType;                      // For weapon based attack
        uint32 m_powerCost = 0;                             // Calculated spell cost     initialized only in Spell::prepare
        int32 m_casttime = 0;                               // Calculated spell cast time initialized only in Spell::prepare
        int32 m_duration = 0;
        bool m_canReflect = false;                          // can reflect this spell?
        bool m_autoRepeat = false;
        bool m_delayed = false;
        bool m_successCast = false;
        bool m_channeled = false;
        bool m_isChannelingVisual = false;                  // For summoning ritual helpers visual spell
                                                            // no effect handled, only channel start/update is sent

        bool m_setCreatureTarget = false;                   // Set for spell casts that need to make the creature face the target

        uint8 m_delayAtDamageCount = 0;
        int32 GetNextDelayAtDamageMsTime() { return m_delayAtDamageCount < 5 ? 1000 - (m_delayAtDamageCount++)* 200 : 200; }

        // Delayed spells system
        uint64 m_delayStart = 0;                            // time of spell delay start, filled by event handler, zero = just started
        uint64 m_delayMoment = 0;                           // moment of next delay call, used internally
        bool m_immediateHandled = false;                    // were immediate actions handled? (used by delayed spells only)

        // Channeled spells system
        typedef std::list<SpellAuraHolder*> SpellAuraHolderList;
        SpellAuraHolderList m_channeledHolders;             // aura holders of spell on targets for channeled spells. process in sync with spell
        SpellAuraHolderList::iterator m_channeledUpdateIterator; // maintain an iterator to the current update element so we can handle removal of multiple auras
        uint32 m_channeledVisualKit = 0;                    // id from SpellVisualKit.dbc that needs to be sent in SMSG_PLAY_SPELL_VISUAL periodically
        uint32 m_channeledVisualTimer = 0;                  // timer for sending the visual kit
        void InitializeChanneledVisualTimer();

        // These vars are used in both delayed spell system and modified immediate spell system
        bool m_referencedFromCurrentSpell = false;          // mark as references to prevent deleted and access by dead pointers
        uint32 m_executeStack = 0;                          // mark as executed to prevent deleted and access by dead pointers
        bool m_needSpellLog = false;                        // need to send spell log?
        uint8 m_applyMultiplierMask = 0;                    // by effect: damage multiplier needed?
        float m_damageMultipliers[3];                       // by effect: damage multiplier

        uint8 m_targetNum = 0;                              // the target number for each bounce in a spell

        // Current targets, to be used in SpellEffects (MUST BE USED ONLY IN SPELL EFFECTS)
        Unit* unitTarget = nullptr;
        Item* itemTarget = nullptr;
        Corpse* corpseTarget = nullptr;
        GameObject* gameObjTarget = nullptr;
        SpellAuraHolder* m_spellAuraHolder = nullptr;       // spell aura holder for current target, created only if spell has aura applying effect
        float damage = 0;
        bool isReflected = false;

        // this is set in Spell Hit, but used in Apply Aura handler
        DiminishingLevels m_diminishLevel;
        DiminishingGroup m_diminishGroup;

        // -------------------------------------------
        GameObject* focusObject = nullptr;

        // Damage and healing in effects need just calculate
        float m_damage = 0;                                 // Damage   in effects count here
        float m_healing = 0;                                // Healing in effects count here
        int32 m_absorbed = 0;

        //******************************************
        // Spell trigger system
        //******************************************
        bool   m_canTrigger = false;                        // Can start trigger (m_IsTriggeredSpell can`t use for this)
        uint8  m_negativeEffectMask = 0;                    // Use for avoid sent negative spell procs for additional positive effects only targets
        uint32 m_procAttacker = 0;                          // Attacker trigger flags
        uint32 m_procVictim = 0;                            // Victim   trigger flags
        void   prepareDataForTriggerSystem();

        //*****************************************
        // Spell target subsystem
        //*****************************************
        // Targets store structures and data
        struct TargetInfo
        {
            ObjectGuid targetGUID;
            uint64 timeDelay;
            uint32 HitInfo;
            uint32 damage;
            SpellMissInfo missCondition:8;
            SpellMissInfo reflectResult:8;
            uint8  effectMask:8;
            bool   processed:1;
            bool   isCrit:1;
            bool   deleted:1;
        };
        uint8 m_needAliveTargetMask = 0;                    // Mask req. alive targets

        struct GOTargetInfo
        {
            ObjectGuid targetGUID;
            uint64 timeDelay;
            uint8  effectMask:8;
            bool   processed:1;
            bool   deleted:1;
        };

        struct ItemTargetInfo
        {
            Item  *item;
            uint8 effectMask;
            bool   deleted:1;
        };
        bool m_destroyed = false;

        SpellCastResult CheckScriptTargeting(SpellEffectIndex effIndex, uint32 chainTargets, float radius, uint32 targetMode, UnitList& tempUnitList);

#ifndef USE_STANDARD_MALLOC
        typedef tbb::concurrent_vector<TargetInfo>     TargetList;
        typedef tbb::concurrent_vector<GOTargetInfo>   GOTargetList;
        typedef tbb::concurrent_vector<ItemTargetInfo> ItemTargetList;
#else
        typedef std::vector<TargetInfo> TargetList;
        typedef std::vector<GOTargetInfo> GOTargetList;
        typedef std::vector<ItemTargetInfo> ItemTargetList;
#endif

        TargetList     m_UniqueTargetInfo;
        GOTargetList   m_UniqueGOTargetInfo;
        ItemTargetList m_UniqueItemInfo;

        void AddUnitTarget(Unit* target, SpellEffectIndex effIndex);
        void CheckAtDelay(TargetInfo* pInf);
        void AddUnitTarget(ObjectGuid unitGuid, SpellEffectIndex effIndex);
        void AddGOTarget(GameObject* target, SpellEffectIndex effIndex);
        void AddGOTarget(ObjectGuid goGuid, SpellEffectIndex effIndex);
        void AddItemTarget(Item* target, SpellEffectIndex effIndex);
        void DoAllEffectOnTarget(TargetInfo *target);
        void HandleDelayedSpellLaunch(TargetInfo *target);
        void InitializeDamageMultipliers();
        void ResetEffectDamageAndHeal();
        void DoSpellHitOnUnit(Unit* unit, uint32 effectMask);
        void DoAllEffectOnTarget(GOTargetInfo *target);
        void DoAllEffectOnTarget(ItemTargetInfo *target);
        bool HasValidUnitPresentInTargetList();
        SpellCastResult CanOpenLock(SpellEffectIndex effIndex, uint32 lockid, SkillType& skillid, int32& reqSkillValue, int32& skillValue);
        uint32 GetSpellBatchingEffectDelay(SpellCaster const* pTarget) const;
        // -------------------------------------------

        //List For Triggered Spells
        std::vector<SpellEntry const*> m_TriggerSpells;                      // casted by caster to same targets settings in m_targets at success finish of current spell
        std::vector<SpellEntry const*> m_preCastSpells;                      // casted by caster to each target at spell hit before spell effects apply

        uint32 m_spellState = SPELL_STATE_NULL;
        uint32 m_timer = 0;
        uint32 m_triggeredByAuraBasePoints = 0;

        Position m_castPosition;
        bool m_IsTriggeredSpell = false;

        // if need this can be replaced by Aura copy
        // we can't store original aura link to prevent access to deleted auras
        // and in same time need aura data and after aura deleting.
        SpellEntry const* m_triggeredByAuraSpell = nullptr;

        struct ExecuteLogInfo
        {
            ExecuteLogInfo() {}
            ExecuteLogInfo(ObjectGuid _targetGuid) : targetGuid(_targetGuid) {}

            ObjectGuid targetGuid;

            union
            {
                struct
                {
                    uint32 power;
                    uint32 amount;
                    float multiplier;
                } powerDrain;

                struct
                {
                    uint32 count;
                } extraAttacks;

                struct
                {
                    uint32 itemEntry;
                } createItem;

                struct
                {
                    uint32 spellId;
                } interruptCast;

                struct
                {
                    uint32 itemEntry;
                } feedPet;

                struct
                {
                    int32 itemEntry;
                    int32 unk;
                } durabilityDamage;

                struct
                {
                    uint32 amount;
                    uint8 critical;
                } heal;

                struct
                {
                    uint32 amount;
                    uint32 powerType;
                } energize;
            };
        };

        std::vector<ExecuteLogInfo> m_executeLogInfo[MAX_EFFECT_INDEX];

        void AddExecuteLogInfo(SpellEffectIndex i, ExecuteLogInfo info)
        {
            m_executeLogInfo[i].push_back(info);
        }
};

enum ReplenishType
{
    REPLENISH_UNDEFINED = 0,
    REPLENISH_HEALTH    = 20,
    REPLENISH_MANA      = 21,
    REPLENISH_RAGE      = 22
};

namespace MaNGOS
{
    struct SpellNotifierPlayer
    {
        Spell::UnitList &i_data;
        Spell &i_spell;
        uint32 const& i_index;
        float i_radius;
        SpellCaster* i_originalCaster;

        SpellNotifierPlayer(Spell &spell, Spell::UnitList &data, uint32 const& i, float radius)
            : i_data(data), i_spell(spell), i_index(i), i_radius(radius)
        {
            i_originalCaster = i_spell.GetAffectiveCasterObject();
        }

        void Visit(PlayerMapType& m)
        {
            if (!i_originalCaster)
                return;

            for(const auto & itr : m)
            {
                Player* pPlayer = itr.getSource();
                if (!pPlayer->IsAlive() || pPlayer->IsTaxiFlying())
                    continue;

                if (i_originalCaster->IsFriendlyTo(pPlayer))
                    continue;

                if (pPlayer->IsWithinDist3d(i_spell.m_targets.m_destX, i_spell.m_targets.m_destY, i_spell.m_targets.m_destZ,i_radius))
                    i_data.push_back(pPlayer);
            }
        }
        template<class SKIP> void Visit(GridRefManager<SKIP>&) {}
    };
}

typedef void(Spell::*pEffect)(SpellEffectIndex effIdx);

class SpellEvent : public BasicEvent
{
    public:
        SpellEvent(Spell* spell);
        ~SpellEvent() override;

        bool Execute(uint64 e_time, uint32 p_time) override;
        void Abort(uint64 e_time) override;
        bool IsDeletable() const override;
        Spell* GetSpell() { return m_Spell; }
    protected:
        Spell* m_Spell;
};

class ChannelResetEvent : public BasicEvent
{
    public:
        ChannelResetEvent(Unit* caster) : m_caster(caster)
        {
            caster->AddUnitState(UNIT_STAT_PENDING_CHANNEL_RESET);
        }
        ~ChannelResetEvent() override {}

        bool Execute(uint64 e_time, uint32 p_time) override;
        void Abort(uint64 e_time) override;
    protected:
        Unit* m_caster;
};
#endif
