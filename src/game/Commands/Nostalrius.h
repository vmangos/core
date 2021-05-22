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

#endif
