/*
 * Copyright (C) 2010-2014 Anathema Script Engine project <http://valkyrie-wow.com/>
 */

#ifndef BOSS_OMEN_H
#define BOSS_OMEN_H

enum
{
    NPC_OMEN                = 15467,

    SPELL_FIREWORK_EFFECT   = 25495,
    SPELL_CLEAVE            = 26350,
    SPELL_ELUNES_CANDLE     = 26374,
    SPELL_OMENS_MOONLIGHT   = 26392,
    SPELL_STARFALL          = 26540,
    SPELL_SELF_DAMAGE       = 26544,
};

struct Coords
{
    float x, y, z, o;
};

struct OmenDataStruct
{
    uint8 m_uiFireworksCount;
    time_t m_uiNextRespawn;
    bool m_bOmenAlive;
};

const Coords OmenSummon = { 7561.63f, -2837.43f, 448.759f, 3.96964f };
const Coords OmenHome = { 7543.84f, -2871.88f, 459.604f, 1.13905f };

static OmenDataStruct OmenData = { 0, 0, false };

struct boss_omenAI : ScriptedAI
{
    explicit boss_omenAI(Creature* creature);

    uint32 m_uiCleaveTimer;
    uint32 m_uiStarfallTimer;

    void Reset() override;
    void UpdateAI(uint32 const uiDiff) override;
    void SpellHit(Unit* pCaster, SpellEntry const* pSpell) override;
    void JustDied(Unit* pKiller) override;
    
    static void OnFireworkLaunch(Unit* pSummoner);
};

#endif
