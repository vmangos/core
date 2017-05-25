#define DEBUG_WORLD_EVENT = true;

enum ScourgeInvasion
{
    /** SPELLS */
    SPELL_COMMUNICATION_NAXXRAMAS = 28395, // Periodically triggers SPELL_COMMUNICATION_TRIGGER
    SPELL_COMMUNICATION_TRIGGER = 28373, // Send visual on all nearby targets
    SPELL_DUMMY_PYLON = 28351, // [Communication Camp-Relais, Mort]. Effect DUMMY
    SPELL_DAMAGE_PYLON = 28032, // [Zapper Cristal]. 15 de degats.
    SPELL_COM_RECEPTION = 28449, // [Camp reçoit communication]. Effect DUMMY.
    SPELL_ENGINEER_REPAIR = 28078,
    SPELL_PURPLE_VISUAL = 28126,

    // Unused ?
    SPELL_SUMMON_CRYSTAL = 28344,
    SPELL_SUMMON_BROKEN_CRYSTAL = 28424,
    SPELL_SUMMON_NAXXRAMAS_GHOST = 28389,
    SPELL_VISUAL_VOILE_TENEBRES = 28350,

    // Sorts des trashs
    SPELL_ENRAGE = 8599,
    SPELL_CONTAGION_OF_ROT = 7102,
    SPELL_SUNDER_ARMOR = 11971,
    SPELL_DEMORALIZING_SHOUT = 27579,
    SPELL_BONE_SHARDS = 17014,
    SPELL_CLEAVE = 15496,
    SPELL_SHADOW_WORD_PAIN = 589,

    SPELL_CREATE_INF_MARK = 28319,
    SPELL_CREATE_MARK = 28320,
    SPELL_CREATE_SUP_MARK = 28321,

    SPELL_DMG_BOOST_AT_PYLON_DEATH = 28681,

    /** NPC */
    NPC_PYLON_ENTRY = 16136,
    NPC_DAMAGED_PYLON = 16172,
    NPC_CULTIST_ENGINEER = 16230,
    NPC_SHADOW_DOOM = 16143,
    NPC_NECROPOLIS_RELAY = 16386,

    NPC_SKELETAL_SHOCKTROOPER = 16299,
    NPC_GHOUL_BERSERKER = 16141,
    NPC_SPECTRAL_SOLDIER = 16298,

    NPC_PYLON_RARE_1 = 16379,
    NPC_PYLON_RARE_2 = 16380,
    NPC_PYLON_RARE_3 = 14697,

    NPC_ARGENT_DAWN_REW_GIVER_1H = 16384,
    NPC_ARGENT_DAWN_REW_GIVER_2H = 16435,
    NPC_ARGENT_DAWN_REW_GIVER_3H = 16436,
    NPC_ARGENT_DAWN_REW_GIVER_1A = 16395,
    NPC_ARGENT_DAWN_REW_GIVER_2A = 16433,
    NPC_ARGENT_DAWN_REW_GIVER_3A = 16434,

    /** OTHER */
    ITEM_NECROTIC_RUNE = 22484,

    GOBJ_SUMMON_CIRCLE = 181227,
    GOBJ_NECROPOLIS = 181223,
    MODELID_PYLON_RESET = 16135,
    MODELID_PYLON_DAMAGED = 16136,

    FACTIONID_GHOULS = 38,
    FACTIONID_FRIENDLY = 35,

    ENGINEER_MOD_HEALTH_PER_SEC = 15,

#ifdef DEBUG_WORLD_EVENT
    NECROPOLIS_RESPAWN_TIME = 60 * 5, // 5 min
    NECROPOLIS_ATTACK_TIMER = 10,
    DELAY_ELITE_RESPAWN = 10,
#else
    NECROPOLIS_RESPAWN_TIME = 4 * 24 * 60 * 60, // 4j
    // Le changement de zone prend 4h
    NECROPOLIS_ATTACK_TIMER = 4 * 60 * 60,
    DELAY_ELITE_RESPAWN = 1 * 60 * 60, // 1heure
#endif

    ZONEID_WINTERSPRING = 618,
    ZONEID_AZSHARA = 16,
    ZONEID_EASTERN_PLAGUELANDS = 139,
    ZONEID_BLASTED_LANDS = 4,
    ZONEID_BURNING_STEPPES = 46,
    ZONEID_TANARIS = 440,

    WORLDSTATE_WINTERSPRING = 0x08D3, // 2259
    WORLDSTATE_AZSHARA = 0x08D4, // 2260
    WORLDSTATE_EASTERN_PLAGUELANDS = 0x08D8, // 2264
    WORLDSTATE_BLASTED_LANDS = 0x08D5, // 2261
    WORLDSTATE_BURNING_STEPPES = 0x08D6, // 2262
    WORLDSTATE_TANARIS = 0x08D7, // 2263

    WORLDSTATE_SI_BATTLES_WON = 2219,

    WORLDSTATE_SI_AZSHARA_REMAINING = 2279, // The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W
    WORLDSTATE_SI_BLASTED_LANDS_REMAINING = 2280,// The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W
    WORLDSTATE_SI_BURNING_STEPPES_REMAINING = 2281, // If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W
    WORLDSTATE_SI_EASTERN_PLAGUELANDS = 2282, // The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W
    WORLDSTATE_SI_TANARIS = 2283, // It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W
    WORLDSTATE_SI_WINTERGRASP = 2284, // Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault. Your assistance would help them greatly.$B$BNumber of Necropolises remaining: $2284W
};

enum ScourgeInvasionEngineerAI
{
    ENGINEER_AI_ACTION_SET_PYLON,
    ENGINEER_AI_ACTION_ATTACK_START,
};
