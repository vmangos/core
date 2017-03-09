/*
Nostalrius custom header.
Used for :
- Configuration defines
*/
//#define CONFIG_NOSTALRIUS_MAX 3

#ifndef NOSTALRIUS_HEADER
#define NOSTALRIUS_HEADER

enum WorldMasks
{
    // Ne voit absolument rien
    WORLD_ALONE            = 0x00,
    WORLD_DEFAULT_MASK     = 0x01,
    // Helpeurs
    WORLD_DEFAULT_OBJECT   = (WORLD_DEFAULT_MASK),
    WORLD_DEFAULT_UNIT     = (WORLD_DEFAULT_MASK),
    WORLD_DEFAULT_CREATURE = (WORLD_DEFAULT_MASK),
    WORLD_DEFAULT_CHAR     = (WORLD_DEFAULT_MASK),
    WORLD_SEE_ALL          = 0xF,
};
enum customFlag
{
    // Anciennement les phases
    CUSTOM_FLAG_IN_PEX            = 0x0001,
    CUSTOM_FLAG_PEX_FINISHED      = 0x0002,
    CUSTOM_FLAG_HL                = 0x0004,
    CUSTOM_FLAG_SPEECH_OK         = 0x0008, // Check Speech pnj de bienvenue (cf npc_welcome.cpp)
    CUSTOM_FLAG_TRANSITION_HL     = 0x0400, // Transition pnj de bienvenue > Chef de faction pour up 55
    CUSTOM_FLAG_NO_JOB            = 0x0800, // Maxinus : flag pour interdire le métier lors du up 45 ou 55
    CUSTOM_FLAG_INSTANT60         = 0x1000,

    CUSTOM_FLAG_FROM_NOSTALRIUS   = 0x0010,
    CUSTOM_FLAG_FROM_BLACKROCK    = 0x0020,
    CUSTOM_FLAG_FROM_NOSTALRIUS_2 = 0x0040,
    CUSTOM_FLAG_FROM_PRISMATIA    = 0x0080,
    CUSTOM_FLAG_FROM_NOSTALRIUS_3 = 0x0100,

    CUSTOM_FLAG_PRISMATIA_BETA    = 0x0200,
    CUSTOM_FLAG_FIRST_GAMEPLAY    = CUSTOM_FLAG_IN_PEX,
    CUSTOM_FLAG_LAST_GAMEPLAY     = CUSTOM_FLAG_HL,
    CUSTOM_FLAG_FIRST_ORIGIN      = CUSTOM_FLAG_FROM_NOSTALRIUS,
    CUSTOM_FLAG_LAST_ORIGIN       = CUSTOM_FLAG_FROM_NOSTALRIUS_3,
};

std::string GetCustomFlagName(customFlag flagId);
#endif
