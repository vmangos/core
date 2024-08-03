/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2009-2011 MaNGOSZero <https://github.com/mangos/zero>
 * Copyright (C) 2011-2016 Nostalrius <https://nostalrius.org>
 * Copyright (C) 2016-2017 Elysium Project <https://github.com/elysium-project>
 *
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

#ifndef MANGOS_VALENTINE_H
#define MANGOS_VALENTINE_H

#include "SharedDefines.h"
#include "Log.h"

inline uint32 GetLoveIsInTheAirGossipForCreature(uint32 creatureId, uint32 gender)
{
    switch (creatureId)
    {
        case 3518: // Thomas Miller <Baker> (Gender: Male) (Faction: Stormwind)
            return 6954;
        case 11867: // Woo Ping <Weapon Master> (Gender: Male) (Faction: Stormwind)
            return 6955;
        case 68: // Stormwind City Guard (Faction: Stormwind)
        case 1976: // Stormwind City Patroller (Faction: Stormwind)
            if (gender == GENDER_MALE)
                return 6957;
            else
                return 6958;
        case 1402: // Topper McNabb (Gender: Male) (Faction: Stormwind)
            return 6959;
        case 1303: // Felicia Gump <Herbalism Supplier> (Gender: Female) (Faction: Stormwind)
            return 6960;
        case 5493: // Arnold Leland <Fishing Trainer> (Gender: Male) (Faction: Stormwind)
            return 6964;
        case 332: // Master Mathias Shaw <Leader of SI:7> (Gender: Male) (Faction: Stormwind)
            return 6971;
        case 297: // Caretaker Folsom (Gender: Male) (Faction: Stormwind)
        case 338: // Mazen Mac'Nadir <Academy of Arcane Arts and Sciences> (Gender: Male) (Faction: Stormwind)
        case 1405: // Morris Lawry (Gender: Male) (Faction: Stormwind)
        case 1432: // Renato Gallina (Gender: Male) (Faction: Stormwind)
        case 1440: // Milton Sheaf <Librarian> (Gender: Male) (Faction: Stormwind)
        case 1646: // Baros Alexston <City Architect> (Gender: Male) (Faction: Stormwind)
        case 1719: // Warden Thelwater (Gender: Male) (Faction: Stormwind)
        case 2285: // Count Remington Ridgewell <House of Nobles> (Gender: Male) (Faction: Stormwind)
        case 2795: // Lenny "Fingers" McCoy (Gender: Male) (Faction: Stormwind)
        case 3628: // Steven Lohan (Gender: Male) (Faction: Stormwind)
        case 4078: // Collin Mauren (Gender: Male) (Faction: Stormwind)
        case 6089: // Harry Burlguard (Gender: Male) (Faction: Stormwind)
        case 6175: // John Turner (Gender: Male) (Faction: Stormwind)
        case 7917: // Brother Sarno (Gender: Male) (Faction: Stormwind)
            return 6976;
        case 1305: // Jarel Moor <Bartender> (Gender: Male) (Faction: Stormwind)
            return 6977;
        case 5498: // Elsharin <Mage Trainer> (Gender: Female) (Faction: Stormwind)
            return 6978;
        case 5514: // Brooke Stonebraid <Mining Supplier> (Gender: Female) (Faction: Stormwind)
            return 6979;
        case 11026: // Sprite Jumpsprocket <Journeyman Engineer> (Gender: Female) (Faction: Gnomeregan Exiles)
            return 6980;
        case 1721: // Nikova Raskol (Gender: Female) (Faction: Stormwind)
        case 1750: // Grand Admiral Jes-Tereth (Gender: Female) (Faction: Stormwind)
        case 11916: // Imelda (Gender: Female) (Faction: Stormwind)
        case 14497: // Shellene <Orphanage Matron> (Gender: Female) (Faction: Stormwind)
        case 16002: // Colara Dean (Gender: Female) (Faction: Stormwind)
            return 6981;
        case 5509: // Kathrum Axehand <Axe Merchant> (Gender: Male) (Faction: Stormwind)
            return 6982;
        case 957: // Dane Lindgren <Journeyman Blacksmith> (Gender: Male) (Faction: Stormwind)
            return 6983;
        case 14450: // Orphan Matron Nightingale (Gender: Female) (Faction: Stormwind)
            return 6984;
        case 5502: // Shylamiir <Herbalism Trainer> (Gender: Female) (Faction: Stormwind)
            return 6985;
        case 5504: // Sheldras Moontree <Druid Trainer> (Gender: Male) (Faction: Stormwind)
            return 6986;
        case 3084: // Bluffwatcher (Faction: Thunder Bluff)
            if (gender == GENDER_MALE)
                return 6987;
            else
                return 6988;
        case 656: // Wilder Thistlenettle (Gender: Male) (Faction: Ironforge)
        case 2912: // Chief Archaeologist Greywhisker <Explorers' League> (Gender: Male) (Faction: Ironforge)
        case 3842: // Brombar Higgleby <The Keymaster> (Gender: Male) (Faction: Ironforge)
        case 7936: // Lyon Mountainheart (Gender: Male) (Faction: Ironforge)
        case 14363: // Thief Catcher Shadowdelve (Gender: Male) (Faction: Ironforge)
            return 6990;
        case 11028: // Jemma Quikswitch <Journeyman Engineer> (Gender: Female) (Faction: Gnomeregan Exiles)
            return 6991;
        case 14723: // Mistina Steelshield <Alliance Cloth Quartermaster> (Gender: Female) (Faction: Ironforge)
            return 6993;
        case 9099: // Sraaz <Pie Vendor> (Gender: Male) (Faction: Gnomeregan Exiles)
            return 6994;
        case 4256: // Golnir Bouldertoe <Mining Supplier> (Gender: Male) (Faction: Ironforge)
            return 6995;
        case 8517: // Xiggs Fuselighter (Gender: Male) (Faction: Ironforge)
            return 6996;
        case 5173: // Alexander Calder <Warlock Trainer> (Gender: Male) (Faction: Ironforge)
            return 6997;
        case 2489: // Milstaff Stormeye <Portal Trainer> (Gender: Male) (Faction: Ironforge)
            return 6998;
        case 4262: // Darnassus Sentinel (Gender: Female) (Faction: Darnassus)
            return 6999;
        case 2796: // Faelyssa (Gender: Female) (Faction: Darnassus)
        case 6034: // Lotherias (Gender: Female) (Faction: Darnassus)
        case 7313: // Priestess A'moora (Gender: Female) (Faction: Darnassus)
            return 7000;
        case 7315: // Darnath Bladesinger <Warrior Trainer> (Gender: Male) (Faction: Darnassus)
            return 7001;
        case 5782: // Crildor (Gender: Male) (Faction: Darnassus)
        case 7296: // Corand (Gender: Male) (Faction: Darnassus)
        case 11709: // Jareth Wildwoods (Gender: Male) (Faction: Darnassus)
            return 7002;
        case 4092: // Lariia <Priest Trainer> (Gender: Female) (Faction: Darnassus)
            return 7003;
        case 10878: // Herald Moonstalker (Gender: Female) (Faction: Darnassus)
            return 7004;
        case 4214: // Erion Shadewhisper <Rogue Trainer> (Gender: Male) (Faction: Darnassus)
            return 7005;
        case 3050: // Veren Tallstrider (Gender: Male) (Faction: Thunder Bluff)
        case 5599: // Kon Yelloweyes (Gender: Male) (Faction: Horde Generic)
        case 14182: // Bounty Hunter Kolark (Gender: Male) (Faction: Thunder Bluff)
        case 14440: // Hunter Sagewind (Gender: Male) (Faction: Thunder Bluff)
            return 7008;
        case 10881: // Bluff Runner Windstrider (Gender: Male) (Faction: Thunder Bluff)
            return 7009;
        case 8359: // Ahanu <Leather Armor Merchant> (Gender: Male) (Faction: Thunder Bluff)
            return 7010;
        case 3032: // Beram Skychaser <Shaman Trainer> (Gender: Male) (Faction: Thunder Bluff)
            return 7011;
        case 3045: // Malakai Cross <Priest Trainer> (Gender: Male) (Faction: Undercity)
            return 7012;
        case 3048: // Ursyn Ghull <Mage Trainer> (Gender: Female) (Faction: Undercity)
            return 7013;
        case 12198: // Martin Lindsey <Arathi Basin Battlemaster> (Gender: Male) (Faction: The Defilers)
            return 7014;
        case 3040: // Urek Thunderhorn <Hunter Trainer> (Gender: Male) (Faction: Thunder Bluff)
            return 7015;
        case 2802: // Susan Tillinghast (Gender: Female) (Faction: Undercity)
        case 5732: // Apothecary Katrina <Royal Apothecary Society> (Gender: Female) (Faction: Undercity)
            return 7016;
        case 2799: // Lucian Fenner (Gender: Male) (Faction: Undercity)
        case 5651: // Patrick Garrett (Gender: Male) (Faction: Undercity)
        case 6293: // Jorah Annison (Gender: Male) (Faction: Undercity)
        case 6522: // Andron Gant (Gender: Male) (Faction: Undercity)
        case 8390: // Chemist Cuely (Gender: Male) (Faction: Undercity)
        case 11750: // Ganoosh (Gender: Male) (Faction: Undercity)
            return 7017;
        case 8403: // Jeremiah Payson <Cockroach Vendor> (Gender: Male) (Faction: Undercity)
            return 7018;
        case 4595: // Baltus Fowler <Warrior Trainer> (Gender: Male) (Faction: Undercity)
            return 7019;
        case 4578: // Josephine Lister <Master Shadoweave Tailor> (Gender: Female) (Faction: Undercity)
            return 7020;
        case 4566: // Kaelystia Hatebringer <Mage Trainer> (Gender: Female) (Faction: Undercity)
            return 7021;
        case 3296: // Orgrimmar Grunt (Faction: Orgrimmar)
            if (gender == GENDER_MALE)
                return 7022;
            else
                return 7023;
        case 8664: // Saern Priderunner (Gender: Female) (Faction: Thunder Bluff)
            return 7024;
        case 13842: // Frostwolf Ambassador Rokhstrom (Gender: Female) (Faction: Frostwolf Clan)
            return 7025;
        case 5639: // Craven Drok (Gender: Male) (Faction: Horde Generic)
        case 14375: // Scout Stronghand (Gender: Male) (Faction: Orgrimmar)
            return 7026;
        case 6014: // X'yera <Priest Trainer> (Gender: Male) (Faction: Orgrimmar)
            return 7028;
        case 8659: // Jes'rimon (Gender: Male) (Faction: Darkspear Trolls)
            return 7029;
        case 10880: // Warcaller Gorlach (Gender: Male) (Faction: Orgrimmar)
            return 7030;
        case 13417: // Sagorne Creststrider <Shaman Trainer> (Gender: Male) (Faction: Thunder Bluff)
            return 7031;
        case 3408: // Zel'mak <Warrior Trainer> (Gender: Male) (Faction: Orgrimmar)
            return 7032;
        case 5624: // Undercity Guardian (Gender: None) (Faction: Undercity)
            return 7033;
        case 5595: // Ironforge Guard (Gender: Male) (Faction: Ironforge)
            return 7035;
        case 7087: // Killian Hagey <Skinning Trainer> (Gender: Male) (Faction: Undercity)
            return 7059;
        case 4600: // Geoffrey Hartwell <Weapon Merchant> (Gender: Male) (Faction: Undercity)
        case 4603: // Nicholas Atwood <Gun Merchant> (Gender: Male) (Faction: Undercity)
            return 7060;
        case 4554: // Tawny Grisette <Mushroom Vendor> (Gender: Female) (Faction: Undercity)
            return 7063;
        case 3312: // Olvia <Meat Vendor> (Gender: Female) (Faction: Orgrimmar)
        case 3333: // Shankys <Fishing Supplies> (Gender: Female) (Faction: Orgrimmar)
        case 3342: // Shan'ti <Fruit Vendor> (Gender: Female) (Faction: Orgrimmar)
        case 3346: // Kithas <Enchanting Supplies> (Gender: Female) (Faction: Orgrimmar)
        case 3367: // Felika <General Trade Goods Merchant> (Gender: Female) (Faction: Orgrimmar)
        case 5188: // Garyl <Tabard Vendor> (Gender: Female) (Faction: Orgrimmar)
        case 5816: // Katis <Wand Merchant> (Gender: Female) (Faction: Orgrimmar)
            return 7068;
        case 8404: // Xan'tish <Snake Vendor> (Gender: Male) (Faction: Orgrimmar)
            return 7069;
        case 3329: // Kor'jus <Mushroom Vendor> (Gender: Male) (Faction: Orgrimmar)
        case 3334: // Rekkul <Poison Vendor> (Gender: Male) (Faction: Orgrimmar)
        case 3368: // Borstan <Meat Vendor> (Gender: Male) (Faction: Orgrimmar)
            return 7072;
        case 3003: // Fyr Mistrunner <Bread Vendor> (Gender: Female) (Faction: Thunder Bluff)
        case 8361: // Chepi <Reagent Vendor> (Gender: Female) (Faction: Thunder Bluff)
            return 7074;
        case 3562: // Alaindia <Reagent Vendor> (Gender: Female) (Faction: Darnassus)
        case 4175: // Vinasia <Cloth Armor Merchant> (Gender: Female) (Faction: Darnassus)
        case 8665: // Shylenai <Owl Trainer> (Gender: Female) (Faction: Darnassus)
            return 7075;
        case 4235: // Turian <Thrown Weapons Merchant> (Gender: Male) (Faction: Darnassus)
        case 4236: // Cyridan <Leather Armor Merchant> (Gender: Male) (Faction: Darnassus)
            return 7076;
        case 5112: // Gwenna Firebrew <Barmaid> (Gender: Female) (Faction: Ironforge)
        case 5123: // Bretta Goldfury <Gun Merchant> (Gender: Female) (Faction: Ironforge)
        case 5155: // Ingrys Stonebrow <Cloth Armor Merchant> (Gender: Female) (Faction: Ironforge)
            return 7077;
        case 5102: // Dolman Steelfury <Weapon Merchant> (Gender: Male) (Faction: Ironforge)
        case 5124: // Sognar Cliffbeard <Meat Vendor> (Gender: Male) (Faction: Ironforge)
            return 7078;
        case 5158: // Tilli Thistlefuzz <Enchanting Supplies> (Gender: Female) (Faction: Gnomeregan Exiles)
        case 7978: // Bimble Longberry <Fruit Vendor> (Gender: Female) (Faction: Gnomeregan Exiles)
            return 7079;
        case 5169: // Tynnus Venomsprout <Shady Dealer> (Gender: Male) (Faction: Gnomeregan Exiles)
            return 7080;
        case 1328: // Elly Langston <Barmaid> (Gender: Female) (Faction: Stormwind)
        case 12805: // Officer Areyn <Accessories Quartermaster> (Gender: Female) (Faction: Stormwind)
            return 7081;
    }

    sLog.Out(LOG_BASIC, LOG_LVL_ERROR, "Unexpected creature id %u tried to get Love is in the Air gossip menu.", creatureId);
    return 0;
}

#endif
