/*
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

#ifndef MANGOS_PARTYBOTAI_H
#define MANGOS_PARTYBOTAI_H

#include "CombatBotBaseAI.h"
#include "Group.h"
#include "ObjectAccessor.h"

class PartyBotAI : public CombatBotBaseAI
{
public:

    PartyBotAI(Player* pLeader, Player* pClone, CombatBotRoles role, uint8 race, uint8 class_, uint8 level, uint32 mapId, uint32 instanceId, float x, float y, float z, float o)
        : CombatBotBaseAI(), m_race(race), m_class(class_), m_level(level), m_mapId(mapId), m_instanceId(instanceId), m_x(x), m_y(y), m_z(z), m_o(o)
    {
        m_role = role;
        m_leaderGuid = pLeader->GetObjectGuid();
        m_cloneGuid = pClone ? pClone->GetObjectGuid() : ObjectGuid();
        m_updateTimer.Reset(2000);
    }
    PartyBotAI(Player* pLeader, uint32 mapId, uint32 instanceId, float x, float y, float z, float o)
        : CombatBotBaseAI(), m_mapId(mapId), m_instanceId(instanceId), m_x(x), m_y(y), m_z(z), m_o(o)
    {
        m_role = ROLE_INVALID;
        m_leaderGuid = pLeader->GetObjectGuid();
        m_updateTimer.Reset(2000);
        m_temporaryCharacter = false;
    }

    struct RebuffCandidate
    {
        Unit* target = nullptr;
        SpellEntry const* spell = nullptr;
        int32 auraDuration = 0;
    };

    bool OnSessionLoaded(PlayerBotEntry* entry, WorldSession* sess) final;
    void OnPlayerLogin() final;
    void UpdateAI(uint32 const diff) final;
    void OnPacketReceived(WorldPacket const* packet) final;

    void CloneFromPlayer(Player const* pPlayer);
    void AddToPlayerGroup();

    bool IsTargetDeathWithinSeconds(Unit* pTarget, float seconds) const;
    template <typename Func>
    void ForEachPlayerInGroup(bool mustBeAlive, Func&& func) const;
    template <typename Func>
    Player* FindFirstPlayerInGroupByCondition(bool mustBeAlive, Func&& func) const;
    template <typename Func>
    std::set<Player*> FindAllPlayersInGroupByCondition(bool mustBeAlive, Func&& func) const;
    std::set<Player*> FindAllPlayersInGroup(bool mustBeAlive) const;
    std::set<Player*> FindAllPlayersInGroupByRole(CombatBotRoles role, bool mustBeAlive) const;
    std::set<Player*> FindAllPlayersInGroupByClass(Classes unitClass, bool mustBeAlive) const;
    Player* FindFirstPlayerInGroupByRole(CombatBotRoles role, bool mustBeAlive) const;
    Player* FindFirstPlayerInGroupByClass(Classes unitClass, bool mustBeAlive) const;
    bool ExistsAsPlayerInGroupByRole(CombatBotRoles role, bool mustBeAlive) const;
    bool ExistsAsTankInGroupForThreatCheck() const;
    bool ExistsAsHealerInGroupForOffHealCheck() const;
    CombatBotRoles FindMajorityRoleForClass(Classes unitClass) const;

    bool CheckThreatOK(Unit const* pTarget, SpellEntry const* pSpellEntry = nullptr) const;
    bool CanTryToCastSpell(Unit const* pTarget, SpellEntry const* pSpellEntry, bool ignoreAppliesAuraCheck = false, bool checkAuraCaster = false, bool ignoreStacks = false) const final;
    Player* GetPartyLeader() const;
    bool AttackStart(Unit* pVictim);
    Unit* SelectAttackTarget(Player* pLeader) const;
    Unit* SelectPartyAttackTarget() const;
    Unit* SelectDispelAttackerTarget(SpellEntry const* pSpellEntry) const;
    Unit* SelectPartyDefendTarget(Unit* pSelectingFor) const;
    Player* SelectResurrectionTarget() const;
    Player* SelectShieldTarget() const;
    Unit* SelectBuffTargetByRole(SpellEntry const* pSpellEntry, CombatBotRoles role) const;
    void EvaluateRebuffTarget(SpellEntry const* spell, RebuffCandidate& bestCandidate, bool asCaster = false, Unit* pTarget = nullptr);
    void EvaluateRebuffTargetForAuraHolder(SpellEntry const* pSpellEntry, RebuffCandidate& bestCandidate, SpellAuraHolder* auraHolder);
    Unit* GetMarkedTarget(RaidTargetIcon mark) const;
    bool CanUseCrowdControl(SpellEntry const* pSpellEntry, Unit* pTarget) const;
    bool CrowdControledMarkedTargetsExistNear(Unit const* pTarget, float radius = 15.0f) const;
    Aura* GetAura(AuraType type, int32 maxDuration);
    bool DrinkAndEat();
    bool ShouldAutoRevive() const;
    bool IsValidDistancingTarget(Unit* pTarget, Unit* pEnemy);
    Unit* GetDistancingTarget(Unit* pEnemy);
    bool RunAwayFromTarget(Unit* pEnemy, float distance);
    bool RunAwayFromTarget(Unit* pEnemy);
    bool DoNotMove();
    void MoveChase(Unit* target, float dist = 0.0f, float angle = 0.0f);
    void MoveFollow(Unit* pLeader);
    void MovePoint(float x, float y, float z, Unit* pVictim = nullptr);
    void MovePointNear(float x, float y, float z, Unit* pVictim = nullptr);
    bool StayBehind(Unit* pVictim);
    bool CrowdControlMarkedTargets();
    bool EnterCombatDruidForm();
    bool ShouldEnterStealth() const;
    bool EnterStealthIfNeeded(SpellEntry const* pStealthSpell);

    void UpdateInCombatAI() final;
    void UpdateOutOfCombatAI() final;
    void UpdateInCombatAI_Paladin() final;
    void UpdateOutOfCombatAI_Paladin() final;
    void UpdateInCombatAI_Shaman() final;
    void UpdateOutOfCombatAI_Shaman() final;
    void UpdateInCombatAI_Hunter() final;
    void UpdateOutOfCombatAI_Hunter() final;
    void UpdateInCombatAI_Mage() final;
    void UpdateOutOfCombatAI_Mage() final;
    void UpdateInCombatAI_Priest() final;
    void UpdateOutOfCombatAI_Priest() final;
    void UpdateInCombatAI_Warlock() final;
    void UpdateOutOfCombatAI_Warlock() final;
    void UpdateInCombatAI_Warrior() final;
    void UpdateOutOfCombatAI_Warrior() final;
    void UpdateInCombatAI_Rogue() final;
    void UpdateOutOfCombatAI_Rogue() final;
    void UpdateInCombatAI_Druid() final;
    void UpdateOutOfCombatAI_Druid() final;
    void UpdateInCombatPetAI();

    std::vector<RaidTargetIcon> m_marksToCC;
    std::vector<RaidTargetIcon> m_marksToFocus;
    ShortTimeTracker m_updateTimer;
    ShortTimeTracker m_buffTimer;
    ObjectGuid m_cloneGuid;
    uint8 m_race = 0;
    uint8 m_class = 0;
    uint8 m_level = 0;
    uint32 m_mapId = 0;
    uint32 m_instanceId = 0;
    float m_x = 0.0f;
    float m_y = 0.0f;
    float m_z = 0.0f;
    float m_o = 0.0f;
    bool m_resetSpellData = false;
    bool m_stay = false;
};

#endif
