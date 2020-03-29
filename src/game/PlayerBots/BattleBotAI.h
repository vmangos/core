#ifndef MANGOS_BattleBotAI_H
#define MANGOS_BattleBotAI_H

#include "PlayerBotAI.h"
#include "PartyBotAI.h"
#include "BattleBotWaypoints.h"

enum BattleBotBGQueues : uint8
{
    BB_BG_WS,
    BB_BG_AB,
    BB_BG_AV,
    BB_BG_INVALID
};

enum BattleBotWsgWaitSpot
{
    BB_WSG_WAIT_SPOT_SPAWN,
    BB_WSG_WAIT_SPOT_LEFT,
    BB_WSG_WAIT_SPOT_RIGHT
};

#define AT_SILVERWING_FLAG 3646
#define GO_SILVERWING_FLAG 179830
#define AURA_SILVERWING_FLAG 23335

#define AT_WARSONG_FLAG 3647
#define GO_WARSONG_FLAG 179831
#define AURA_WARSONG_FLAG 23333

class BattleBotAI : public PlayerBotAI
{
public:

    BattleBotAI(uint8 race, uint8 class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o, BattleBotBGQueues bgId)
        : PlayerBotAI(nullptr),  m_race(race), m_class(class_), m_mapId(mapId), m_instanceId(instanceId), m_x(x), m_y(y), m_z(z), m_o(o), m_battlegroundId(bgId)
    {
        m_updateTimer.Reset(2000);
    }
    bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) override
    {
        return SpawnNewPlayer(sess, m_class, m_race, m_mapId, m_instanceId, m_x, m_y, m_z, m_o);
    }

    void OnPlayerLogin() override;
    void UpdateAI(uint32 const diff) override;
    void OnPacketReceived(WorldPacket const* packet) override;
    void SendFakePacket(uint16 opcode) override;
    void MovementInform(uint32 MovementType, uint32 Data = 0) override;

    void AddPremadeGearAndSpells();
    void PopulateSpellData();
    void ResetSpellData();

    void SummonPetIfNeeded();
    void AttackStart(Unit* pVictim);
    uint8 GetAttackersInRangeCount(float range) const;
    Unit* SelectAttackerDifferentFrom(Unit const* pExcept) const;
    Unit* SelectAttackTarget() const;
    Unit* SelectFollowTarget() const;
    Unit* SelectHealTarget(float selfHealPercent = 100.0f) const;
    Player* SelectBuffTarget(SpellEntry const* pSpellEntry) const;
    bool IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool IsValidHealTarget(Unit const* pTarget) const;
    bool IsValidHostileTarget(Unit const* pTarget) const;
    bool IsValidDispelTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool HealInjuredAlly(float selfHealPercent = 100.0f);

    SpellCastResult DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool DrinkAndEat();
    void EquipOrUseNewItem();

    void OnJustRevived();
    void OnJustDied();
    void OnEnterBattleGround();
    void OnLeaveBattleGround();

    void UpdateInCombatAI();
    void UpdateOutOfCombatAI();

    void UpdateInCombatAI_Paladin();
    void UpdateOutOfCombatAI_Paladin();
    void UpdateInCombatAI_Hunter();
    void UpdateOutOfCombatAI_Hunter();
    void UpdateInCombatAI_Mage();
    void UpdateOutOfCombatAI_Mage();
    void UpdateInCombatAI_Priest();
    void UpdateOutOfCombatAI_Priest();
    void UpdateInCombatAI_Warlock();
    void UpdateOutOfCombatAI_Warlock();
    void UpdateInCombatAI_Warrior();
    void UpdateOutOfCombatAI_Warrior();
    void UpdateInCombatAI_Rogue();
    void UpdateOutOfCombatAI_Rogue();

    std::vector<SpellEntry const*> spellListHealAura;
    std::set<SpellEntry const*, HealSpellCompare> spellListHeal;
    union
    {
        struct
        {
            SpellEntry const* spells[67];
        } raw;
        struct
        {
            SpellEntry const* pAura;
            SpellEntry const* pBlessingBuff;
            SpellEntry const* pBlessingOfProtection;
            SpellEntry const* pBlessingOfFreedom;
            SpellEntry const* pBlessingOfSacrifice;
            SpellEntry const* pHammerOfJustice;
            SpellEntry const* pSealOfCommand;
            SpellEntry const* pSealOfRighteousness;
            SpellEntry const* pJudgement;
            SpellEntry const* pExorcism;
            SpellEntry const* pConsecration;
            SpellEntry const* pHammerOfWrath;
            SpellEntry const* pCleanse;
            SpellEntry const* pDivineShield;
            SpellEntry const* pLayOnHands;
        } paladin;
        struct
        {
            SpellEntry const* pAspectOfTheCheetah;
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
        } hunter;
        struct
        {
            SpellEntry const* pIceArmor;
            SpellEntry const* pArcaneIntellect;
            SpellEntry const* pArcaneBrilliance;
            SpellEntry const* pIceBarrier;
            SpellEntry const* pManaShield;
            SpellEntry const* pPolymorph;
            SpellEntry const* pFrostbolt;
            SpellEntry const* pFireBlast;
            SpellEntry const* pFireball;
            SpellEntry const* pArcaneExplosion;
            SpellEntry const* pFrostNova;
            SpellEntry const* pConeofCold;
            SpellEntry const* pBlink;
        } mage;
        struct
        {
            SpellEntry const* pPowerWordFortitude;
            SpellEntry const* pDivineSpirit;
            SpellEntry const* pPrayerofSpirit;
            SpellEntry const* pPrayerofFortitude;
            SpellEntry const* pInnerFire;
            SpellEntry const* pShadowProtection;
            SpellEntry const* pPowerWordShield;
            SpellEntry const* pHolyNova;
            SpellEntry const* pHolyFire;
            SpellEntry const* pMindBlast;
            SpellEntry const* pShadowWordPain;
            SpellEntry const* pInnerFocus;
            SpellEntry const* pAbolishDisease;
            SpellEntry const* pDispelMagic;
            SpellEntry const* pManaBurn;
            SpellEntry const* pDevouringPlague;
            SpellEntry const* pPsychicScream;
        } priest;
        struct
        {
            SpellEntry const* pDemonArmor;
            SpellEntry const* pDeathCoil;
            SpellEntry const* pDetectInvisibility;
            SpellEntry const* pShadowWard;
            SpellEntry const* pShadowBolt;
            SpellEntry const* pCorruption;
            SpellEntry const* pShadowburn;
            SpellEntry const* pSearingPain;
            SpellEntry const* pImmolate;
            SpellEntry const* pDrainLife;
            SpellEntry const* pSiphonLife;
            SpellEntry const* pFear;
            SpellEntry const* pHowlofTerror;
            SpellEntry const* pCurseofAgony;
            SpellEntry const* pCurseofDoom;
            SpellEntry const* pCurseoftheElements;
            SpellEntry const* pCurseofShadow;
            SpellEntry const* pCurseofRecklessness;
            SpellEntry const* pCurseofTongues;
            SpellEntry const* pCurseofExhaustion;
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
            SpellEntry const* pExecute;
            SpellEntry const* pMortalStrike;
            SpellEntry const* pBloodrage;
            SpellEntry const* pBerserkerRage;
            SpellEntry const* pPummel;
            SpellEntry const* pRend;
            SpellEntry const* pDisarm;
            SpellEntry const* pWhirlwind;
            SpellEntry const* pBattleShout;
            SpellEntry const* pHamstring;
        } warrior;
        struct
        {
            SpellEntry const* pSliceandDice;
            SpellEntry const* pSinisterStrike;
            SpellEntry const* pAdrenalineRush;
            SpellEntry const* pEviscerate;
            SpellEntry const* pStealth;
            SpellEntry const* pGarrote;
            SpellEntry const* pAmbush;
            SpellEntry const* pCheapShot;
            SpellEntry const* pSap;
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
            SpellEntry const* pFeint;
            SpellEntry const* pDistract;
            SpellEntry const* pKick;
            SpellEntry const* pSprint;
        } rogue;
    } m_spells;

    std::vector<LootResponseData> m_lootResponses;
    bool m_initialized = false;
    bool m_receivedBgInvite = false;
    int m_battlegroundId = 0;
    ShortTimeTracker m_updateTimer;
    uint8 m_race = 0;
    uint8 m_class = 0;
    uint32 m_mapId = 0;
    uint32 m_instanceId = 0;
    float m_x = 0.0f;
    float m_y = 0.0f;
    float m_z = 0.0f;
    float m_o = 0.0f;
    bool m_hasGear = false;
    bool m_wasDead = false;
    bool m_wasInBG = false;
    bool m_isBuffing = false;

    // Movement System
    void UpdateMovement();
    void DoGraveyardJump();
    void MoveToNextPoint();
    bool StartNewPathFromBeginning();
    void StartNewPathFromAnywhere();
    void ClearPath();
    bool m_doingGraveyardJump = false;
    bool m_movingInReverse = false;
    uint32 m_currentPoint = 0;
    BattleBotPath* m_currentPath = nullptr;
    uint8 m_waitingSpot = BB_WSG_WAIT_SPOT_SPAWN;
};

#endif
