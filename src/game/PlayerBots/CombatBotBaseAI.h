#ifndef MANGOS_COMBAT_BOT_BASE_H
#define MANGOS_COMBAT_BOT_BASE_H

#include "PlayerBotAI.h"
#include "SpellEntry.h"
#include "Player.h"

struct HealSpellCompare
{
    bool operator() (SpellEntry const* const lhs, SpellEntry const* const rhs) const
    {
        uint32 spell1dmg = 0;
        uint32 spell2dmg = 0;

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (lhs->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spell1dmg += lhs->EffectBasePoints[i];
                    break;
            }
        }
        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (rhs->Effect[i])
            {
                case SPELL_EFFECT_HEAL:
                    spell2dmg += rhs->EffectBasePoints[i];
                    break;
            }
        }

        return spell1dmg > spell2dmg;
    }
};

struct HealAuraCompare
{
    bool operator() (SpellEntry const* const lhs, SpellEntry const* const rhs) const
    {
        uint32 spell1dmg = 0;
        uint32 spell2dmg = 0;

        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (lhs->Effect[i])
            {
                case SPELL_EFFECT_APPLY_AURA:
                case SPELL_EFFECT_PERSISTENT_AREA_AURA:
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                    if (lhs->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_HEAL)
                        spell1dmg += lhs->EffectBasePoints[i];
                    break;
            }
        }
        for (uint32 i = 0; i < MAX_SPELL_EFFECTS; i++)
        {
            switch (rhs->Effect[i])
            {
                case SPELL_EFFECT_APPLY_AURA:
                case SPELL_EFFECT_PERSISTENT_AREA_AURA:
                case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
                    if (rhs->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_HEAL)
                        spell2dmg += rhs->EffectBasePoints[i];
                    break;
            }
        }

        return spell1dmg > spell2dmg;
    }
};

class CombatBotBaseAI : public PlayerBotAI
{
public:

    CombatBotBaseAI() : PlayerBotAI(nullptr)
    {
        for (auto& ptr : m_spells.raw.spells)
            ptr = nullptr;
    }

    virtual void OnPacketReceived(WorldPacket const* packet) override;
    virtual void OnPacketSentFromClient(WorldPacket const* packet);
    void SendBattlefieldPortPacket();
    void SendBattlemasterJoinPacket(uint8 battlegroundId);
    void SendAreaTriggerPacket(uint32 areaTriggerId);
    void ActivateNearbyAreaTrigger();

    CombatBotRoles GuessRole(Player* pPlayer) const;
    void AutoAssignRole();
    void PopulateSpellData();
    void ResetSpellData();
    void AddAllSpellReagents();
    void SummonPetIfNeeded();
    void LearnArmorProficiencies();
    void LearnPremadeSpecForClass();
    void EquipPremadeGearTemplate();
    void EquipRandomGearInEmptySlots();
    void AutoEquipGear(uint32 option);
    void LearnRandomTalents();

    template <typename Func>
    void ForEachCombatBotInGroup(bool mustBeAlive, Func&& func) const;
    template <typename Func>
    CombatBotBaseAI* FindFirstCombatBotInGroupByCondition(bool mustBeAlive, Func&& func) const;
    bool RecentSpellExistsForGroup(uint32 targetId, uint32 spellEntryId) const;

    void RecentSpellsUpdate(uint32 diff);
    bool RecentSpellsContains(uint32 targetId, uint32 spellEntryId) const;
    void RecentSpellsAdd(uint32 targetId, uint32 spellEntryId);
    void SafeSpotsUpdate();
    bool SafeSpotsFind(Unit* pUnit, float distance, float& outX, float& outY, float& outZ);
    bool SafeSpotsFind(float fromX, float fromY, float distance, float& outX, float& outY, float& outZ);

    uint8 GetAttackersInRangeCount(float range) const;
    Unit* SelectAttackerDifferentFrom(Unit const* pExcept) const;
    Unit* SelectHealTarget(float selfHealPercent = 100.0f, float groupHealPercent = 100.0f) const;
    Unit* SelectPeriodicHealTarget(float selfHealPercent = 100.0f, float groupHealPercent = 100.0f) const;
    Unit* SelectBuffTarget(SpellEntry const* pSpellEntry) const;
    Unit* SelectRebuffTarget(SpellEntry const* pSpellEntry) const;
    Unit* SelectDispelTarget(SpellEntry const* pSpellEntry) const;
    bool IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool IsValidSelectBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry, bool rebuff = false) const;
    bool IsValidHealTarget(Unit const* pTarget, float healthPercent = 100.0f) const;
    bool IsValidHostileTarget(Unit const* pTarget) const;
    bool IsValidDispelFriendlyTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool IsValidDispelTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool FindAndPreHealTarget();
    bool FindAndHealInjuredAlly(float selfHealPercent = 100.0f, float groupHealPercent = 100.0f);
    float CalculateHealValue(Player const* me, Unit const* pVictim, SpellEntry const* pSpellEntry, bool ignorePeriodic = false) const;
    bool HealInjuredTarget(Unit* pTarget);
    bool HealInjuredTargetDirect(Unit* pTarget, std::set<SpellEntry const*, HealSpellCompare> spells);
    bool HealInjuredTargetDirect(Unit* pTarget);
    bool HealInjuredTargetDirectFast(Unit* pTarget);
    bool HealInjuredTargetDirectSlow(Unit* pTarget);
    bool HealInjuredTargetPeriodic(Unit* pTarget);
    template <class T>
    SpellEntry const* SelectMostEfficientHealingSpell(Unit const* pTarget, std::set<SpellEntry const*, T>& spellList) const;
    template <class T>
    SpellEntry const* SelectMostEfficientHealingSpell(Unit const* pTarget, int32 missingHealth, std::set<SpellEntry const*, T>& spellList) const;
    int32 GetIncomingdamage(Unit const* pTarget) const;
    bool AreOthersOnSameTarget(ObjectGuid guid, bool checkMelee = true, bool checkSpells = true) const;

    bool DoNotRotate();
    bool FaceObject(WorldObject const* pObject);
    SpellCastResult DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    virtual bool CanTryToCastSpell(Unit const* pTarget, SpellEntry const* pSpellEntry, bool reapplyAura = false, bool checkAuraCaster = false, bool ignoreStacks = false) const;
    bool IsWearingShield(Player* pPlayer) const;
    bool IsInDuel() const;
    CombatBotRoles GetRole() const;
    CombatBotRoles GetRoleByMember(Player* pMember) const;
    CombatBotRoles GetRoleByPet(Player* pMember, Pet* pPet) const;

    void EquipOrUseNewItem();
    void AddItemToInventory(uint32 itemId, uint32 count = 1);
    void AddHunterAmmo();
    Item* GetHealthStone();
    uint32 CountInventoryItem(uint32 entry);
    uint32 CountInventoryItem(SpellEntry const* spellEntry);
    Item* GetInventoryItem(uint32 entry);
    Item* GetInventoryItem(SpellEntry const* spellEntry);
    bool CanTryToCastItemUseSpell(Item* pItem);
    bool CanTryToCastItemUseSpell(Item* pItem, Unit* pTarget);
    void UseConsumable(Item* pItem, Unit* pTarget);
    uint8 GetHighestHonorRankFromEquippedItems() const;
    void UpdateVisualHonorRankBasedOnItems();

    bool SummonShamanTotems();
    SpellCastResult CastWeaponBuff(SpellEntry const* pSpellEntry, EquipmentSlots slot);
    void UseTrinketEffects();
    bool UseItemEffect(Item* pItem);

    virtual void UpdateInCombatAI() = 0;
    virtual void UpdateOutOfCombatAI() = 0;
    virtual void UpdateInCombatAI_Paladin() = 0;
    virtual void UpdateOutOfCombatAI_Paladin() = 0;
    virtual void UpdateInCombatAI_Shaman() = 0;
    virtual void UpdateOutOfCombatAI_Shaman() = 0;
    virtual void UpdateInCombatAI_Hunter() = 0;
    virtual void UpdateOutOfCombatAI_Hunter() = 0;
    virtual void UpdateInCombatAI_Mage() = 0;
    virtual void UpdateOutOfCombatAI_Mage() = 0;
    virtual void UpdateInCombatAI_Priest() = 0;
    virtual void UpdateOutOfCombatAI_Priest() = 0;
    virtual void UpdateInCombatAI_Warlock() = 0;
    virtual void UpdateOutOfCombatAI_Warlock() = 0;
    virtual void UpdateInCombatAI_Warrior() = 0;
    virtual void UpdateOutOfCombatAI_Warrior() = 0;
    virtual void UpdateInCombatAI_Rogue() = 0;
    virtual void UpdateOutOfCombatAI_Rogue() = 0;
    virtual void UpdateInCombatAI_Druid() = 0;
    virtual void UpdateOutOfCombatAI_Druid() = 0;

    static bool IsPhysicalDamageClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_WARRIOR:
            case CLASS_PALADIN:
            case CLASS_ROGUE:
            case CLASS_HUNTER:
            case CLASS_SHAMAN:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }
    static bool IsRangedDamageClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_HUNTER:
            case CLASS_PRIEST:
            case CLASS_SHAMAN:
            case CLASS_MAGE:
            case CLASS_WARLOCK:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }
    static bool IsMeleeDamageClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_WARRIOR:
            case CLASS_PALADIN:
            case CLASS_ROGUE:
            case CLASS_SHAMAN:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }
    static bool IsMeleeWeaponClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_WARRIOR:
            case CLASS_PALADIN:
            case CLASS_ROGUE:
            case CLASS_SHAMAN:
                return true;
        }
        return false;
    }
    static bool IsShieldClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_WARRIOR:
            case CLASS_PALADIN:
            case CLASS_SHAMAN:
                return true;
        }
        return false;
    }
    static bool IsTankClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_WARRIOR:
            case CLASS_PALADIN:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }
    static bool IsHealerClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_PALADIN:
            case CLASS_PRIEST:
            case CLASS_SHAMAN:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }
    static bool IsStealthClass(uint8 playerClass)
    {
        switch (playerClass)
        {
            case CLASS_ROGUE:
            case CLASS_DRUID:
                return true;
        }
        return false;
    }

    SpellEntry const* GetCrowdControlSpell() const
    {
        switch (me->GetClass())
        {
            case CLASS_PALADIN:
                return m_spells.paladin.pHammerOfJustice;
            case CLASS_MAGE:
                return m_spells.mage.pPolymorph;
            case CLASS_PRIEST:
                return m_spells.priest.pShackleUndead;
            case CLASS_WARLOCK:
                return m_spells.warlock.pBanish;
            case CLASS_ROGUE:
                return m_spells.rogue.pBlind;
            case CLASS_DRUID:
                return m_spells.druid.pHibernate;
        }
        return nullptr;
    }

    SpellEntry const* m_resurrectionSpell = nullptr;
    SpellEntry const* m_tauntSpell = nullptr;   // Full
    std::vector<SpellEntry const*> m_spellListTaunt;    // Full & temporary
    std::set<SpellEntry const*, HealAuraCompare> m_spellListPeriodicHeal;
    std::set<SpellEntry const*, HealSpellCompare> m_spellListDirectHeal;
    std::set<SpellEntry const*, HealSpellCompare> m_spellListDirectHealFast;
    std::set<SpellEntry const*, HealSpellCompare> m_spellListDirectHealSlow;
    std::set<SpellEntry const*, HealSpellCompare> m_spellListGroupHeal;
    union
    {
        struct
        {
            SpellEntry const* spells[50];
        } raw;
        struct
        {
            SpellEntry const* pAura;
            SpellEntry const* pSeal;
            SpellEntry const* pBlessingBuff;
            SpellEntry const* pBlessingBuffMelee;
            SpellEntry const* pBlessingBuffRanged;
            SpellEntry const* pBlessingBuffTank;
            SpellEntry const* pBlessingOfProtection;
            SpellEntry const* pBlessingOfFreedom;
            SpellEntry const* pBlessingOfSacrifice;
            SpellEntry const* pHammerOfJustice;
            SpellEntry const* pJudgement;
            SpellEntry const* pExorcism;
            SpellEntry const* pConsecration;
            SpellEntry const* pHammerOfWrath;
            SpellEntry const* pPurify;
            SpellEntry const* pCleanse;
            SpellEntry const* pDivineShield;
            SpellEntry const* pLayOnHands;
            SpellEntry const* pRighteousFury;
            SpellEntry const* pHolyShock;
            SpellEntry const* pDivineFavor;
            SpellEntry const* pHolyWrath;
            SpellEntry const* pTurnEvil;
            SpellEntry const* pHolyShield;
            // Paladin Seals
            SpellEntry const* pSealOfRighteousness;
            SpellEntry const* pSealOfCommand;
            SpellEntry const* pSealOfFury;
            SpellEntry const* pSealOfLight;
            SpellEntry const* pSealOfWisdom;
            // Paladin Blessings
            SpellEntry const* pBlessingOfLight;
            SpellEntry const* pBlessingOfMight;
            SpellEntry const* pBlessingOfWisdom;
            SpellEntry const* pBlessingOfKings;
            SpellEntry const* pBlessingOfSanctuary;
            SpellEntry const* pBlessingOfSalvation;
            SpellEntry const* pGreaterBlessingOfLight;
            SpellEntry const* pGreaterBlessingOfMight;
            SpellEntry const* pGreaterBlessingOfWisdom;
            SpellEntry const* pGreaterBlessingOfKings;
            SpellEntry const* pGreaterBlessingOfSanctuary;
            SpellEntry const* pGreaterBlessingOfSalvation;
            // Paladin Auras
            SpellEntry const* pDevotionAura;
            SpellEntry const* pConcentrationAura;
            SpellEntry const* pRetributionAura;
            SpellEntry const* pSanctityAura;
            SpellEntry const* pShadowResistanceAura;
            SpellEntry const* pFrostResistanceAura;
            SpellEntry const* pFireResistanceAura;
        } paladin;
        struct
        {
            SpellEntry const* pLightningBolt;
            SpellEntry const* pChainLightning;
            SpellEntry const* pEarthShock;
            SpellEntry const* pFlameShock;
            SpellEntry const* pFrostShock;
            SpellEntry const* pPurge;
            SpellEntry const* pStormstrike;
            SpellEntry const* pElementalMastery;
            SpellEntry const* pLightningShield;
            SpellEntry const* pGhostWolf;
            SpellEntry const* pCureDisease;
            SpellEntry const* pCurePoison;
            SpellEntry const* pAirTotem;
            SpellEntry const* pEarthTotem;
            SpellEntry const* pFireTotem;
            SpellEntry const* pWaterTotem;
            SpellEntry const* pManaTideTotem;
            SpellEntry const* pWeaponBuff;
        } shaman;
        struct
        {
            SpellEntry const* pTrueshotAura;
            SpellEntry const* pAspectOfTheCheetah;
            SpellEntry const* pAspectOfThePack;
            SpellEntry const* pAspectOfTheMonkey;
            SpellEntry const* pAspectOfTheHawk;
            SpellEntry const* pSerpentSting;
            SpellEntry const* pArcaneShot;
            SpellEntry const* pAimedShot;
            SpellEntry const* pMultiShot;
            SpellEntry const* pConcussiveShot;
            SpellEntry const* pWingClip;
            SpellEntry const* pHuntersMark;
            SpellEntry const* pMongooseBite;
            SpellEntry const* pRaptorStrike;
            SpellEntry const* pDisengage;
            SpellEntry const* pFeignDeath;
            SpellEntry const* pScareBeast;
            SpellEntry const* pVolley;
            SpellEntry const* pDismissPet;
            SpellEntry const* pTranquilizingShot;
            SpellEntry const* pRapidFire;
            SpellEntry const* pViperSting;
        } hunter;
        struct
        {
            SpellEntry const* pIceArmor;
            SpellEntry const* pMageArmor;
            SpellEntry const* pArcaneIntellect;
            SpellEntry const* pArcaneBrilliance;
            SpellEntry const* pIceBarrier;
            SpellEntry const* pManaShield;
            SpellEntry const* pPolymorph;
            SpellEntry const* pFrostbolt;
            SpellEntry const* pFrostboltLow;
            SpellEntry const* pFireBlast;
            SpellEntry const* pFireball;
            SpellEntry const* pArcaneExplosion;
            SpellEntry const* pFrostNova;
            SpellEntry const* pConeofCold;
            SpellEntry const* pBlink;
            SpellEntry const* pCounterspell;
            SpellEntry const* pPresenceOfMind;
            SpellEntry const* pArcanePower;
            SpellEntry const* pRemoveLesserCurse;
            SpellEntry const* pScorch;
            SpellEntry const* pPyroblast;
            SpellEntry const* pEvocation;
            SpellEntry const* pIceBlock;
            SpellEntry const* pBlizzard;
            SpellEntry const* pBlizzardLow;
            SpellEntry const* pBlastWave;
            SpellEntry const* pCombustion;
            SpellEntry const* pAmplifyMagic;
            SpellEntry const* pFireWard;
            SpellEntry const* pFrostWard;
            SpellEntry const* pConjureManaAgate;
            SpellEntry const* pConjureManaJade;
            SpellEntry const* pConjureManaCitrine;
            SpellEntry const* pConjureManaRuby;
            SpellEntry const* pConjureWater;
            SpellEntry const* pConjureFood;
            SpellEntry const* pArcaneMissiles;
        } mage;
        struct
        {
            SpellEntry const* pPowerWordFortitude;
            SpellEntry const* pDivineSpirit;
            SpellEntry const* pPrayerofHealing;
            SpellEntry const* pPrayerofSpirit;
            SpellEntry const* pPrayerofFortitude;
            SpellEntry const* pPrayerofShadowProtection;
            SpellEntry const* pInnerFire;
            SpellEntry const* pShadowProtection;
            SpellEntry const* pPowerWordShield;
            SpellEntry const* pHolyNova;
            SpellEntry const* pHolyFire;
            SpellEntry const* pMindBlast;
            SpellEntry const* pMindFlay;
            SpellEntry const* pShadowWordPain;
            SpellEntry const* pInnerFocus;
            SpellEntry const* pCureDisease;
            SpellEntry const* pAbolishDisease;
            SpellEntry const* pDispelMagic;
            SpellEntry const* pManaBurn;
            SpellEntry const* pDevouringPlague;
            SpellEntry const* pPsychicScream;
            SpellEntry const* pShadowform;
            SpellEntry const* pVampiricEmbrace;
            SpellEntry const* pSilence;
            SpellEntry const* pFade;
            SpellEntry const* pShackleUndead;
            SpellEntry const* pSmite;
            SpellEntry const* pFearWard;
            SpellEntry const* pRenew;
        } priest;
        struct
        {
            SpellEntry const* pDemonSkin;
            SpellEntry const* pDemonArmor;
            SpellEntry const* pDeathCoil;
            SpellEntry const* pUnendingBreath;
            SpellEntry const* pDetectLesserInvisibility;
            SpellEntry const* pDetectInvisibility;
            SpellEntry const* pShadowWard;
            SpellEntry const* pShadowBolt;
            SpellEntry const* pCorruption;
            SpellEntry const* pConflagrate;
            SpellEntry const* pShadowburn;
            SpellEntry const* pSearingPain;
            SpellEntry const* pImmolate;
            SpellEntry const* pRainOfFire;
            SpellEntry const* pDemonicSacrifice;
            SpellEntry const* pDrainSoul;
            SpellEntry const* pDrainLife;
            SpellEntry const* pSiphonLife;
            SpellEntry const* pDrainMana;
            SpellEntry const* pBanish;
            SpellEntry const* pFear;
            SpellEntry const* pHowlofTerror;
            SpellEntry const* pCurseofWeakness;
            SpellEntry const* pCurseofAgony;
            SpellEntry const* pCurseofDoom;
            SpellEntry const* pCurseoftheElements;
            SpellEntry const* pCurseofShadow;
            SpellEntry const* pCurseofRecklessness;
            SpellEntry const* pCurseofTongues;
            SpellEntry const* pCurseofExhaustion;
            SpellEntry const* pLifeTap;
            SpellEntry const* pRitualOfSummoning;
            SpellEntry const* pCreateSoulstone;
            SpellEntry const* pCreateHealthstone;
        } warlock;
        struct
        {
            SpellEntry const* pBattleStance;
            SpellEntry const* pBerserkerStance;
            SpellEntry const* pDefensiveStance;
            SpellEntry const* pCharge;
            SpellEntry const* pIntercept;
            SpellEntry const* pOverpower;
            SpellEntry const* pHeroicStrike;
            SpellEntry const* pCleave;
            SpellEntry const* pExecute;
            SpellEntry const* pMortalStrike;
            SpellEntry const* pBloodthirst;
            SpellEntry const* pBloodrage;
            SpellEntry const* pBerserkerRage;
            SpellEntry const* pRecklessness;
            SpellEntry const* pRetaliation;
            SpellEntry const* pDeathWish;
            SpellEntry const* pIntimidatingShout;
            SpellEntry const* pPummel;
            SpellEntry const* pRend;
            SpellEntry const* pDisarm;
            SpellEntry const* pWhirlwind;
            SpellEntry const* pBattleShout;
            SpellEntry const* pDemoralizingShout;
            SpellEntry const* pHamstring;
            SpellEntry const* pThunderClap;
            SpellEntry const* pSweepingStrikes;
            SpellEntry const* pLastStand;
            SpellEntry const* pShieldBlock;
            SpellEntry const* pShieldWall;
            SpellEntry const* pShieldBash;
            SpellEntry const* pShieldSlam;
            SpellEntry const* pSunderArmor;
            SpellEntry const* pConcussionBlow;
            SpellEntry const* pPiercingHowl;
            SpellEntry const* pRevenge;
            SpellEntry const* pShootGun;
            SpellEntry const* pShootBow;
            SpellEntry const* pShootCrossbow;
        } warrior;
        struct
        {
            SpellEntry const* pSliceAndDice;
            SpellEntry const* pSinisterStrike;
            SpellEntry const* pAdrenalineRush;
            SpellEntry const* pEviscerate;
            SpellEntry const* pStealth;
            SpellEntry const* pGarrote;
            SpellEntry const* pAmbush;
            SpellEntry const* pCheapShot;
            SpellEntry const* pPremeditation;
            SpellEntry const* pBackstab;
            SpellEntry const* pHemorrhage;
            SpellEntry const* pGhostlyStrike;
            SpellEntry const* pGouge;
            SpellEntry const* pRupture;
            SpellEntry const* pExposeArmor;
            SpellEntry const* pKidneyShot;
            SpellEntry const* pColdBlood;
            SpellEntry const* pBladeFlurry;
            SpellEntry const* pVanish;
            SpellEntry const* pBlind;
            SpellEntry const* pPreparation;
            SpellEntry const* pEvasion;
            SpellEntry const* pRiposte;
            SpellEntry const* pKick;
            SpellEntry const* pSprint;
            SpellEntry const* pFeint;
            SpellEntry const* pPickPocket;
            SpellEntry const* pMainHandPoison;
            SpellEntry const* pOffHandPoison;
        } rogue;
        struct
        {
            SpellEntry const* pBearForm;
            SpellEntry const* pCatForm;
            SpellEntry const* pTravelForm;
            SpellEntry const* pAquaticForm;
            SpellEntry const* pMoonkinForm;
            SpellEntry const* pWrath;
            SpellEntry const* pMoonfire;
            SpellEntry const* pStarfire;
            SpellEntry const* pHurricane;
            SpellEntry const* pInsectSwarm;
            SpellEntry const* pBarkskin;
            SpellEntry const* pNaturesGrasp;
            SpellEntry const* pMarkoftheWild;
            SpellEntry const* pGiftoftheWild;
            SpellEntry const* pThorns;
            SpellEntry const* pRemoveCurse;
            SpellEntry const* pCurePoison;
            SpellEntry const* pAbolishPoison;
            SpellEntry const* pRebirth;
            SpellEntry const* pFaerieFire;
            SpellEntry const* pInnervate;
            SpellEntry const* pNaturesSwiftness;
            SpellEntry const* pEntanglingRoots;
            SpellEntry const* pHibernate;
            // Cat
            SpellEntry const* pProwl;
            SpellEntry const* pPounce;
            SpellEntry const* pRavage;
            SpellEntry const* pClaw;
            SpellEntry const* pShred;
            SpellEntry const* pRake;
            SpellEntry const* pRip;
            SpellEntry const* pFerociousBite;
            SpellEntry const* pTigersFury;
            SpellEntry const* pDash;
            SpellEntry const* pFaerieFireFeral;
            SpellEntry const* pCower;
            // Bear
            SpellEntry const* pGrowl;
            SpellEntry const* pChallengingRoar;
            SpellEntry const* pDemoralizingRoar;
            SpellEntry const* pEnrage;
            SpellEntry const* pFrenziedRegeneration;
            SpellEntry const* pSwipe;
            SpellEntry const* pMaul;
            SpellEntry const* pBash;
            SpellEntry const* pFeralCharge;
        } druid;
    } m_spells;

    bool m_initialized = false;
    ObjectGuid m_leaderGuid;
    bool m_temporaryCharacter = true;
    bool m_noClient = true;
    bool m_noGenerateItems = false;
    bool m_noTeleport = false;
    bool m_isBuffing = false;
    bool m_receivedBgInvite = false;
    uint8 m_visualHonorRank = 0;
    CombatBotRoles m_role = ROLE_INVALID;
    ShortTimeTracker m_clientMovementTimer;

    struct RecentSpell
    {
        uint32 spellEntryId; // pSpellEntry->Id
        uint32 targetId; // pTarget->GetGUIDLow()
        uint32 age;
        RecentSpell() = default;
        RecentSpell(uint32 s, uint32 t) : spellEntryId(s), targetId(t), age(0) {}
    };
    static constexpr uint8 RECENT_SPELLS_SIZE = 3;
    static constexpr uint32 RECENT_SPELLS_THRESHOLD_MS = 2000; // 2 seconds
    std::array<RecentSpell, RECENT_SPELLS_SIZE> m_recentSpells; // TODO: Generic circular buffer

    struct RecentSafeSpot
    {
        bool valid;
        float x, y, z;
        RecentSafeSpot() : valid(false), x(0.0f), y(0.0f), z(0.0f) {}
        RecentSafeSpot(float x, float y, float z) : valid(true), x(x), y(y), z(z) {}
    };
    static constexpr uint8 RECENT_SAFE_SPOT_SIZE = 30;
    static constexpr float RECENT_SAFE_SPOT_DISTANCE_STORE = 2.0f;
    std::array<RecentSafeSpot, RECENT_SAFE_SPOT_SIZE> m_recentSafeSpots; // TODO: Generic circular buffer
    uint8 m_recentSafeSpotsIndex = 0;

    struct GroupData
    {
        Position losPosition;
    };
    static std::map<uint32, GroupData> groupIdToDataMap;
    static GroupData* GetGroupData(Player* player);
    GroupData* m_groupData;
};

#endif
