#ifndef MANGOS_PARTYBOTAI_H
#define MANGOS_PARTYBOTAI_H

#include "PlayerBotAI.h"

struct AuraDurationCompare
{
    bool operator() (SpellEntry const* const lhs, SpellEntry const* const rhs) const
    {
        return lhs->GetMaxDuration() < rhs->GetMaxDuration();
    }
};

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

enum PartyBotRole : uint8
{
    PB_ROLE_DPS,
    PB_ROLE_HEALER,
    PB_ROLE_TANK,
    PB_ROLE_INVALID
};

class PartyBotAI : public PlayerCreatorAI
{
public:

    PartyBotAI(Player* pLeader, Player* pPlayer, uint8 _race_, uint8 _class_, uint32 mapId, uint32 instanceId, float x, float y, float z, float o)
        : PlayerCreatorAI(pPlayer, _race_, _class_, mapId, instanceId, x, y, z, o)
    {
        m_leaderGuid = pLeader->GetObjectGuid();
        m_updateTimer.Reset(2000);
    }

    void OnPlayerLogin() override;
    void UpdateAI(uint32 const diff) override;
    void OnPacketSent(WorldPacket const* packet) override;
    void HandlePacketResponse(uint16 opcode) override;

    void AddToPlayerGroup();
    void LearnPremadeSpecForClass();
    void PopulateSpellData();
    void AutoAssignRole();
    Player* GetPartyLeader() const;
    Unit* SelectAttackTarget(Player* pLeader) const;
    Unit* SelectHealTarget(Player* pLeader) const;
    bool IsValidHealTarget(Unit* pTarget) const;
    bool IsValidHostileTarget(Unit* pTarget) const;
    void CastRandomDamageSpell(Unit* pVictim);
    SpellCastResult DoCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool CanTryToCastSpell(Unit* pTarget, SpellEntry const* pSpellEntry);
    bool DrinkAndEat();
    void EquipOrUseNewItem();

    std::vector<SpellEntry const*> spellListDamageAura;
    std::vector<SpellEntry const*> spellListSpellDamage;
    std::vector<SpellEntry const*> spellListWeaponDamage;
    std::vector<SpellEntry const*> spellListAuraBar;
    std::vector<SpellEntry const*> spellListTaunt;
    std::vector<SpellEntry const*> spellListHealAura;
    std::set<SpellEntry const*, HealSpellCompare> spellListHeal;
    std::set<SpellEntry const*, AuraDurationCompare> spellListCrowdControlAura;

    bool m_initialized = false;
    PartyBotRole m_role = PB_ROLE_INVALID;
    ShortTimeTracker m_updateTimer;
    ObjectGuid m_leaderGuid;
};


#endif
