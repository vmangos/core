/*
 * Copyright (C) 2006-2011 ScriptDev2 <http://www.scriptdev2.com/>
 * Copyright (C) 2010-2011 ScriptDev0 <http://github.com/mangos-zero/scriptdev0>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef DEF_ULDAMAN_H
#define DEF_ULDAMAN_H

enum
{
    TYPE_IRONAYA            = 4,
    GO_IRONAYA_SEAL_DOOR               = 124372,
    GO_ARCHAEDAS_TEMPLE_DOOR           = 141869,
    GO_ALTAR_OF_THE_KEEPER_TEMPLE_DOOR = 124367,
    GO_ANCIENT_VAULT_DOOR              = 124369,
    GO_KEYSTONE                        = 124371,
    SPELL_CSLUMBER          = 3636,
    NPC_STONE_KEEPER        = 4857,
};

enum eData
{
    DATA_ALTAR_DOORS        = 10,
    DATA_ANCIENT_DOOR       = 11,
    DATA_IRONAYA_DOOR       = 12,
    DATA_STONE_KEEPERS      = 13,
    DATA_MINIONS            = 14,
    DATA_IRONAYA_SEAL       = 15,
};

enum
{
    ULDAMAN_ENCOUNTER_ALTA_DOORS    = 0,
    ULDAMAN_ENCOUNTER_ANCIENT_DOOR  = 1,
    ULDAMAN_ENCOUNTER_IRONAYA_DOOR  = 2,
    ULDAMAN_MAX_ENCOUNTER,
};
#endif
