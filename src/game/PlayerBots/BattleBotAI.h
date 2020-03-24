#ifndef MANGOS_BattleBotAI_H
#define MANGOS_BattleBotAI_H

#include "PlayerBotAI.h"
#include "PartyBotAI.h"
#include "BattleBotWaypoints.h"

enum BattleBotRole : uint8
{
    BB_ROLE_DPS,
    BB_ROLE_HEALER,
    BB_ROLE_TANK,
    BB_ROLE_INVALID
};

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

class BattleBotAI : public PlayerBotAI
{
public:

    BattleBotAI(BattleBotRole role, uint8 race, uint8 class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o, BattleBotBGQueues bgId)
        : PlayerBotAI(nullptr), m_role(role), m_race(race), m_class(class_), m_mapId(mapId), m_instanceId(instanceId), m_x(x), m_y(y), m_z(z), m_o(o), m_battlegroundId(bgId)
    {
        m_updateTimer.Reset(2000);
    }
    bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) override
    {
        return SpawnNewPlayer(sess, m_class, m_race, m_mapId, m_instanceId, m_x, m_y, m_z, m_o, sObjectAccessor.FindPlayer(m_cloneGuid));
    }

    void OnPlayerLogin() override;
    void UpdateAI(uint32 const diff) override;
    void OnPacketReceived(WorldPacket const* packet) override;
    void SendFakePacket(uint16 opcode) override;
    void MovementInform(uint32 MovementType, uint32 Data = 0) override;

    void CloneFromPlayer(Player const* pPlayer);
    void LearnPremadeSpecForClass();
    void PopulateSpellData();
    void ResetSpellData();
    void AutoAssignRole();
    void SummonPetIfNeeded();
    Unit* SelectAttackTarget() const;
    Unit* SelectHealTarget() const;
    Player* SelectResurrectionTarget() const;
    Player* SelectBuffTarget(SpellEntry const* pSpellEntry) const;
    bool IsValidBuffTarget(Unit const* pTarget, SpellEntry const* pSpellEntry) const;
    bool IsValidHealTarget(Unit const* pTarget) const;
    bool IsValidHostileTarget(Unit const* pTarget) const;
    void CastRandomDamageSpell(Unit* pVictim);
    SpellCastResult DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool DrinkAndEat();
    void EquipOrUseNewItem();
    bool IsPhysicalDamageClass(uint8 playerClass);
    bool IsRangedDamageClass(uint8 playerClass);

    void OnJustRevived();
    void OnJustDied();
    void OnEnterBattleGround();
    void OnLeaveBattleGround();

    SpellEntry const* m_fullHealSpell = nullptr;
    SpellEntry const* m_panicSpell = nullptr;
    SpellEntry const* m_selfBuffSpell = nullptr;
    SpellEntry const* m_partyBuffSpell = nullptr;
    SpellEntry const* m_resurrectionSpell = nullptr;
    std::vector<SpellEntry const*> spellListDamageAura;
    std::vector<SpellEntry const*> spellListSpellDamage;
    std::vector<SpellEntry const*> spellListWeaponDamage;
    std::vector<SpellEntry const*> spellListAuraBar;
    std::vector<SpellEntry const*> spellListTaunt;
    std::vector<SpellEntry const*> spellListInterrupt;
    std::vector<SpellEntry const*> spellListHealAura;
    std::set<SpellEntry const*, HealSpellCompare> spellListHeal;
    std::set<SpellEntry const*, AuraDurationCompare> spellListCrowdControlAura;

    std::vector<LootResponseData> m_lootResponses;
    bool m_initialized = false;
    bool m_receivedBgInvite = false;
    bool m_checkBuffs = true;
    int m_battlegroundId = 0;
    BattleBotRole m_role = BB_ROLE_INVALID;
    ShortTimeTracker m_updateTimer;
    ObjectGuid m_leaderGuid;
    ObjectGuid m_cloneGuid;
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
