/* Copyright (C) 2009 - 2010 ScriptDevZero <http://github.com/scriptdevzero/scriptdevzero>
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

#include "scriptPCH.h"
#include "custom.h"
#include "ScriptedAI.h"
#include <ctime>

#if defined(_MSC_VER) && (_MSC_VER >= 1900)
# pragma execution_character_set("utf-8")
#endif

// TELEPORT NPC

bool GossipHello_TeleportNPC(Player *player, Creature *_Creature)   
{
    // HORDE
    if (player->GetTeam() == HORDE)
    {
		player->ADD_GOSSIP_ITEM(5, "★世界主城★", GOSSIP_SENDER_MAIN, 628);
		player->ADD_GOSSIP_ITEM(5, "〖阵营城市〗", GOSSIP_SENDER_MAIN, 1);
		player->ADD_GOSSIP_ITEM(5, "〖新人副本〗", GOSSIP_SENDER_MAIN, 5);
		player->ADD_GOSSIP_ITEM(5, "【团队副本】", GOSSIP_SENDER_MAIN, 101);
		player->ADD_GOSSIP_ITEM(5, "一号场地刷暮光信徒<新人成长>", GOSSIP_SENDER_MAIN, 629);
		player->ADD_GOSSIP_ITEM(5, "二号场地刷瘟疫锅周边怪<新人成长>", GOSSIP_SENDER_MAIN, 630);
		player->ADD_GOSSIP_ITEM(5, ">>古巴竞技场 - 叶文洁" , GOSSIP_SENDER_MAIN, 4015);
		player->ADD_GOSSIP_ITEM(5, ">>海加尔山的战役1 - 三体长老", GOSSIP_SENDER_MAIN, 631);

        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
    }
    // ALLIANCE
    else
    {
		player->ADD_GOSSIP_ITEM(5, "★世界主城★", GOSSIP_SENDER_MAIN, 628);
		player->ADD_GOSSIP_ITEM(5, "〖阵营城市〗", GOSSIP_SENDER_MAIN, 2);
		player->ADD_GOSSIP_ITEM(5, "〖新人副本〗", GOSSIP_SENDER_MAIN, 5);
		player->ADD_GOSSIP_ITEM(5, "【团队副本】", GOSSIP_SENDER_MAIN, 101);
		player->ADD_GOSSIP_ITEM(5, "一号场地刷暮光信徒<新人成长>", GOSSIP_SENDER_MAIN, 629);
		player->ADD_GOSSIP_ITEM(5, "二号场地刷瘟疫锅周边怪<新人成长>", GOSSIP_SENDER_MAIN, 630);
		player->ADD_GOSSIP_ITEM(5, ">>古巴竞技场 - 叶文洁", GOSSIP_SENDER_MAIN, 4015);
		player->ADD_GOSSIP_ITEM(5, ">>海加尔山的战役1 - 三体长老", GOSSIP_SENDER_MAIN, 631);

        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
    }
    return true;
}

void SendDefaultMenu_TeleportNPC(Player *player, Creature *_Creature, uint32 action)
{
    switch (action)
    {
        case 1: // Cities [HORDE]
            player->ADD_GOSSIP_ITEM(5, "奥格瑞玛"             , GOSSIP_SENDER_MAIN, 20);
            player->ADD_GOSSIP_ITEM(5, "幽暗城"             , GOSSIP_SENDER_MAIN, 21);
            player->ADD_GOSSIP_ITEM(5, "雷霆崖"          , GOSSIP_SENDER_MAIN, 22);
            //player->ADD_GOSSIP_ITEM(5, "Goldshire (Stormwind)" , GOSSIP_SENDER_MAIN, 4018);
            player->ADD_GOSSIP_ITEM(5, "<-[返回主菜单]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 2: // Cities [ALLIANCE]
            player->ADD_GOSSIP_ITEM(5, "暴风城"        , GOSSIP_SENDER_MAIN, 23);
            player->ADD_GOSSIP_ITEM(5, "铁炉堡"             , GOSSIP_SENDER_MAIN, 24);
            player->ADD_GOSSIP_ITEM(5, "达纳苏斯"             , GOSSIP_SENDER_MAIN, 25);
            //player->ADD_GOSSIP_ITEM(5, "Razor Hill(Orgrimmar)" , GOSSIP_SENDER_MAIN, 4017);
            player->ADD_GOSSIP_ITEM(5, "<-[返回主菜单]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 3: // Starting Places [HORDE]
            player->ADD_GOSSIP_ITEM(5, "Shadow Grave"          , GOSSIP_SENDER_MAIN, 40);
            player->ADD_GOSSIP_ITEM(5, "Valley of Trials"      , GOSSIP_SENDER_MAIN, 41);
            player->ADD_GOSSIP_ITEM(5, "Camp Narache"          , GOSSIP_SENDER_MAIN, 42);
            player->ADD_GOSSIP_ITEM(5, "<-[Main Menu]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 4: // Starting Places [ALLIANCE]
            player->ADD_GOSSIP_ITEM(5, "Northshire Valley"     , GOSSIP_SENDER_MAIN, 43);
            player->ADD_GOSSIP_ITEM(5, "Coldridge Valley"      , GOSSIP_SENDER_MAIN, 44);
            player->ADD_GOSSIP_ITEM(5, "Shadowglen"            , GOSSIP_SENDER_MAIN, 45);
            player->ADD_GOSSIP_ITEM(5, "<-[Main Menu]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 5: // Instances [PAGE 1]
            player->ADD_GOSSIP_ITEM(5, "哀号洞穴" , GOSSIP_SENDER_MAIN, 1249);
            player->ADD_GOSSIP_ITEM(5, "死亡矿井" , GOSSIP_SENDER_MAIN, 1250);
            player->ADD_GOSSIP_ITEM(5, "影牙城堡" , GOSSIP_SENDER_MAIN, 1251);
            player->ADD_GOSSIP_ITEM(5, "黑暗深渊" , GOSSIP_SENDER_MAIN, 1252);
            player->ADD_GOSSIP_ITEM(5, "剃刀沼泽" , GOSSIP_SENDER_MAIN, 1254);
            player->ADD_GOSSIP_ITEM(5, "剃刀高地" , GOSSIP_SENDER_MAIN, 1256);
            player->ADD_GOSSIP_ITEM(5, "血色修道院" , GOSSIP_SENDER_MAIN, 1257);
            player->ADD_GOSSIP_ITEM(7, "[更多] ->" , GOSSIP_SENDER_MAIN, 5551);
            player->ADD_GOSSIP_ITEM(5, "<-[返回主菜单]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 5551: // Instances [PAGE 2]
			player->ADD_GOSSIP_ITEM(5, "奥达曼", GOSSIP_SENDER_MAIN, 1258);
			player->ADD_GOSSIP_ITEM(5, "祖尔法拉克", GOSSIP_SENDER_MAIN, 1259);
			player->ADD_GOSSIP_ITEM(5, "玛拉顿", GOSSIP_SENDER_MAIN, 1260);
			player->ADD_GOSSIP_ITEM(5, "黑暗神庙", GOSSIP_SENDER_MAIN, 1261);
			player->ADD_GOSSIP_ITEM(5, "黑石深渊", GOSSIP_SENDER_MAIN, 1262);
			player->ADD_GOSSIP_ITEM(5, "厄运之槌", GOSSIP_SENDER_MAIN, 1263);
			player->ADD_GOSSIP_ITEM(5, "黑石塔", GOSSIP_SENDER_MAIN, 1264);
			player->ADD_GOSSIP_ITEM(5, "斯坦索姆", GOSSIP_SENDER_MAIN, 1265);
			player->ADD_GOSSIP_ITEM(5, "通灵学院", GOSSIP_SENDER_MAIN, 1266);
			player->ADD_GOSSIP_ITEM(7, "<- [返回]", GOSSIP_SENDER_MAIN, 5);
			player->ADD_GOSSIP_ITEM(5, "<-[返回主菜单]", GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 101: // Raids
			player->ADD_GOSSIP_ITEM(5, "祖尔格拉布 - ZUG", GOSSIP_SENDER_MAIN, 4000);
			player->ADD_GOSSIP_ITEM(5, "安其拉废墟 - FX", GOSSIP_SENDER_MAIN, 4004);
			player->ADD_GOSSIP_ITEM(5, "奥妮克希亚的巢穴 - 黑龙MM", GOSSIP_SENDER_MAIN, 4001);
			player->ADD_GOSSIP_ITEM(5, "熔火之心 - MC", GOSSIP_SENDER_MAIN, 4002);
			player->ADD_GOSSIP_ITEM(5, "黑翼之巢 - BWL", GOSSIP_SENDER_MAIN, 4003);
			player->ADD_GOSSIP_ITEM(5, "安其拉 - TAQ", GOSSIP_SENDER_MAIN, 4005);
			player->ADD_GOSSIP_ITEM(5, "纳克萨玛斯 - NAXX", GOSSIP_SENDER_MAIN, 4006);
			player->ADD_GOSSIP_ITEM(5, "<-[返回主菜单]", GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 6010: // Kalimdor
            player->ADD_GOSSIP_ITEM(5, "Ashenvale" , GOSSIP_SENDER_MAIN, 601);
            player->ADD_GOSSIP_ITEM(5, "Darkshore" , GOSSIP_SENDER_MAIN, 602);
            player->ADD_GOSSIP_ITEM(5, "Desolace" , GOSSIP_SENDER_MAIN, 603);
            player->ADD_GOSSIP_ITEM(5, "Durotar" , GOSSIP_SENDER_MAIN, 604);
            player->ADD_GOSSIP_ITEM(5, "Dustwallow Marsh" , GOSSIP_SENDER_MAIN, 605);
            player->ADD_GOSSIP_ITEM(5, "Feralas" , GOSSIP_SENDER_MAIN, 606);
            player->ADD_GOSSIP_ITEM(5, "Silithus" , GOSSIP_SENDER_MAIN, 607);
            player->ADD_GOSSIP_ITEM(5, "Stonetalon Mountains" , GOSSIP_SENDER_MAIN, 608);
            player->ADD_GOSSIP_ITEM(5, "Tanaris" , GOSSIP_SENDER_MAIN, 609);
            player->ADD_GOSSIP_ITEM(5, "The Barrens" , GOSSIP_SENDER_MAIN, 610);
            player->ADD_GOSSIP_ITEM(5, "Thousand Needles" , GOSSIP_SENDER_MAIN, 611);
            player->ADD_GOSSIP_ITEM(5, "Winterspring" , GOSSIP_SENDER_MAIN, 612);
            player->ADD_GOSSIP_ITEM(5, "<-[Main Menu]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;
        case 6020: // Eastern Kingdoms
            player->ADD_GOSSIP_ITEM(5, "Arathi Highlands" , GOSSIP_SENDER_MAIN, 613);
            player->ADD_GOSSIP_ITEM(5, "Badlands" , GOSSIP_SENDER_MAIN, 614);
            player->ADD_GOSSIP_ITEM(5, "Dun Morogh" , GOSSIP_SENDER_MAIN, 615);
            player->ADD_GOSSIP_ITEM(5, "Duskwood" , GOSSIP_SENDER_MAIN, 616);
            player->ADD_GOSSIP_ITEM(5, "Eastern Plaguelands" , GOSSIP_SENDER_MAIN, 617);
            player->ADD_GOSSIP_ITEM(5, "Elwynn Forest" , GOSSIP_SENDER_MAIN, 618);
            player->ADD_GOSSIP_ITEM(5, "Hillsbrad Foothills" , GOSSIP_SENDER_MAIN, 619);
            player->ADD_GOSSIP_ITEM(5, "Redridge Mountains" , GOSSIP_SENDER_MAIN, 620);
            player->ADD_GOSSIP_ITEM(5, "Silverpine Forest" , GOSSIP_SENDER_MAIN, 621);
            player->ADD_GOSSIP_ITEM(5, "Stranglethorn Vale" , GOSSIP_SENDER_MAIN, 622);
            player->ADD_GOSSIP_ITEM(5, "Swamp of Sorrows" , GOSSIP_SENDER_MAIN, 623);
            player->ADD_GOSSIP_ITEM(5, "The Hinterlands" , GOSSIP_SENDER_MAIN, 624);
            player->ADD_GOSSIP_ITEM(5, "Tirisfal Glades" , GOSSIP_SENDER_MAIN, 625);
            player->ADD_GOSSIP_ITEM(5, "Westfall" , GOSSIP_SENDER_MAIN, 626);
            player->ADD_GOSSIP_ITEM(5, "Wetlands" , GOSSIP_SENDER_MAIN, 627);
            player->ADD_GOSSIP_ITEM(5, "<-[Main Menu]"                  , GOSSIP_SENDER_MAIN, 100);

            player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            break;



// ----### CITIES ###----

// ### HORDE ###

        case 20: // Orgrimmar
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 1437.0f, -4421.0f, 25.24f, 1.65f);
            break;
        case 21: // Undercity
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 1822.0999f, 238.638855f, 60.694809f, 0.0f);
            break;
        case 22: // Thunderbluff
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -1272.703735f, 116.886490f, 131.016861f, 0.0f);
            break;

// ### ALLIANCE ###

        case 23: // Stormwind
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -8828.231445f, 627.927490f, 94.055664f, 0.0f);
            break;
        case 24: // Ironforge
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -4917.0f, -955.0f, 502.0f, 0.0f);
            break;
        case 25: // Darnassus
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 9962.712891f, 2280.142822f, 1341.394409f, 0.0f);
            break;

// ----### STARTING PLACES ####----

// ### HORDE ###
        case 40: // Shadow Grave
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 1663.517f, 1678.187744f, 120.5303f, 0.0f);
            break;
        case 41: // Valley of Trials
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -602.1253f, -4262.4208f, 38.956341f, 0.0f);
            break;
        case 42: // Camp Narache
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -2914.16992f, -266.061798f, 53.658211f, 0.0f);
            break;

// ### ALLIANCE ###

        case 43: // Nortshire Valley
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -8943.133789f, -132.934921f, 83.704269f, 0.0f);
            break;
        case 44: // Coldridge Valley
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -6231.106445f, 332.270477f, 383.153931f, 0.0f);
            break;
        case 45: // Shadowglen
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 10329.918945f, 833.500305f, 1326.260620f, 0.0f);
            break;

// ----### INSTANCES ###----

        case 50: // Dire Maul
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -3762.340820f, 1216.537598f, 127.434608f, 0.0f);
            break;
        case 51: // Blackrock Spire
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -7528.554688f, -1222.907227f, 285.732941f, 0.0f);
            break;
        case 52: // Zul'Gurub
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -11916.179688f, -1190.977051f, 85.137901f, 0.0f);
            break;
        case 53: // Onyxia's Lair
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4682.391602f, -3709.857422f, 46.792862f, 0.0f);
            break;
        case 54: // Searing Gorge (Moltencore, Blackwinglair)
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -7342.270020f, -1096.863892f, 277.06930f, 0.0f);
            break;
        case 55: // Naxxramas
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 3121.061768f, -3689.973389f, 133.458786f, 0.0f);
            break;
        case 56: // Stratholme Backdoor Entrance
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 3160.416992f, -4038.750244f, 104.177376f, 0.0f);
            break;
        case 57: // Stratholme Main Entrance
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 3357.214355f, -3379.713135f, 144.780853f, 0.0f);
            break;
        case 58: // Scholomance
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 1252.319824f, -2587.151123f, 92.886772f, 0.0f);
            break;

// ---### ZONES ###---

        case 70: // Silithus
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -7430.070313f, 1002.554565f, 1.249787f, 0.0f);
            break;
        case 71: // Durotar
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 1006.426819f, -4439.258789f, 11.352882f, 0.0f);
            break;
        case 72: // Ashenvale
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 1922.842651f, -2169.429688f, 94.327400f, 0.0f);
            break;
        case 73: // Tanaris
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -7180.401367f, -3773.328369f, 8.728320f, 0.0f);
            break;
        case 74: // Pretbc Mall
            //player->CLOSE_GOSSIP_MENU();
            //player->TeleportTo(1, 16201.107422f, 16205.1875f, 0.140072f, 1.630427f);
            break;
        case 4015:// Gurubashi
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -13261.3f, 168.294f, 35.0792f, 1.00688f);
            break;
        case 4017:// Razor Hill
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 315.721f, -4743.4f, 10.4867f, 0.0f);
            break;
        case 4018:// Goldshire
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -9464.0f, 62.0f, 56.0f, 0.0f);
            break;
        case 1249://teleport player to the Wailing Caverns
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -722.53f, -2226.30f, 16.94f, 2.71f);
            break;
        case 1250://teleport player to the Deadmines
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -11212.04f, 1658.58f, 25.67f, 1.45f);
            break;
        case 1251://teleport player to Shadowfang Keep
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -254.47f, 1524.68f, 76.89f, 1.56f);
            break;
        case 1252://teleport player to Blackfathom Deeps
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 4254.58f, 664.74f, -29.04f, 1.97f);
            break;
        case 1254://teleport player to Razorfen Kraul
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4484.04f, -1739.40f, 86.47f, 1.23f);
            break;
        case 1256://teleport player to Razorfen Downs
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4645.08f, -2470.85f, 85.53f, 4.39f);
            break;
        case 1257://teleport player to the Scarlet Monastery
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 2843.89f, -693.74f, 139.32f, 5.11f);
            break;
        case 1258://teleport player to Uldaman
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -6119.70f, -2957.30f, 204.11f, 0.03f);
            break;
        case 1259://teleport player to Zul'Farrak
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -6839.39f, -2911.03f, 8.87f, 0.41f);
            break;
        case 1260://teleport player to Maraudon
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -1433.33f, 2955.34f, 96.21f, 4.82f);
            break;
        case 1261://teleport player to the Sunken Temple
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -10346.92f, -3851.90f, -43.41f, 6.09f);
            break;
        case 1262://teleport player to Blackrock Depths
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -7301.03f, -913.19f, 165.37f, 0.08f);
            break;
        case 1263://teleport player to Dire Maul
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -3982.47f, 1127.79f, 161.02f, 0.05f);
            break;
        case 1264://teleport player to Blackrock Spire
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -7535.43f, -1212.04f, 285.45f, 5.29f);
            break;
        case 1265://teleport player to Stratholme
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 3263.54f, -3379.46f, 143.59f, 0.00f);
            break;
        case 1266://teleport player to Scholomance
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 1219.01f, -2604.66f, 85.61f, 0.50f);
            break;
        case 4000:// Teleport to Zul'Gurub
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -11916.7f, -1212.82f, 92.2868f, 4.6095f);
            break;
        case 4001:// Teleport to Onyxia's Lair
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4707.44f, -3726.82f, 54.6723f, 3.8f);
            break;
        case 4002:// Teleport to Molten Core
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(230, 1121.451172f, -454.316772f, -101.329536f, 3.5f);
            break;
        case 4003:// Teleport to Blackwing Lair
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(469, -7665.55f, -1102.49f, 400.679f, 0.0f);
            break;
        case 4004:// Ruins of Ahn'Qiraj
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -8409.032227f, 1498.830933f, 27.361542f, 2.497567f);
            break;
        case 4005:// Temple of Ahn'Qiraj
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -8245.837891f, 1983.736206f, 129.071686f, 0.936195f);
            break;
        case 4006:// Naxxramas
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(533, 3005.87f, -3435.0f, 293.89f, 0.0f);
            break;
        case 601: // Kalimdor -> Ashenvale
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 3469.43f, 847.62f, 6.36476f, 0.0f);
            break;
        case 602: // Kalimdor -> Darkshore
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 6207.5f, -152.833f, 80.8185f, 0.0f);
            break;
        case 603: // Kalimdor -> Desolace
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -93.1614f, 1691.15f, 90.0649f, 0.0f);
            break;
        case 604: // Kalimdor -> Durotar
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 341.42f, -4684.7f, 31.9493f, 0.0f);
            break;
        case 605: // Kalimdor -> Duswallow Marsh
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -3463.26f, -4123.13f, 18.1043f, 0.0f);
            break;
        case 606: // Kalimdor -> Ferelas
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4458.93f, 243.415f, 65.6136f, 0.0f);
            break;
        case 607: // Kalimdor -> Silithus
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -6824.15f, 821.273f, 50.6675f, 0.0f);
            break;
        case 608: // Kalimdor -> Stonetalon Mountains
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 1145.00f, 85.664f, -6.64f, 0.0f);
            break;
        case 609: // Kalimdor -> Tanaris
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -7373.69f, -2950.2f, 11.7598f, 0.0f);
            break;
        case 610: // Kalimdor -> The Barrens
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -456.263f, -2652.7f, 96.615f, 0.0f);
            break;
        case 611: // Kalimdor -> Thousand Needles
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, -4941.66f, -1595.42f, -33.07f, 0.0f);
            break;
        case 612: // Kalimdor -> Winterspring
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(1, 6107.62f, -4181.6f, 853.322f, 0.0f);
            break;
        case 613: // Eastern Kingdoms -> Arathi Highlands
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -1544.93f, -2495.01f, 54.11f, 0.0f);
            break;
        case 614: // Eastern Kingdoms -> Badlands
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -6084.95f, -3328.44f, 253.76f, 0.0f);
            break;
        case 615: // Eastern Kingdoms -> Dun Morogh
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -5660.33f, 755.299f, 390.605f, 0.0f);
            break;
        case 616: // Eastern Kingdoms -> Duskwood
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -10879.85f, -327.06f, 37.78f, 0.0f);
            break;
        case 617: // Eastern Kingdoms -> Eastern Plaguelands
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 2280.12f, -5313.16f, 87.74f, 0.0f);
            break;
        case 618: // Eastern Kingdoms -> Elwynn Forest
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -9545.78f, -51.81f, 56.72f, 0.0f);
            break;
        case 619: // Eastern Kingdoms -> Hillsbrad Foothills
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -436.03f, -583.27f, 53.58f, 0.0f);
            break;
        case 620: // Eastern Kingdoms -> Reridge Mountains
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -9633.80f, -1875.09f, 68.39f, 0.0f);
            break;
        case 621: // Eastern Kingdoms -> Silverpine Forest
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 641.48f, 1297.84f, 85.45f, 0.0f);
            break;
        case 622: // Eastern Kingdoms -> Stranglethorn Vale
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -11393.77f, -288.94f, 58.99f, 0.0f);
            break;
        case 623: // Eastern Kingdoms -> Swamp of Sorrows
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -10522.55f, -3028.30f, 21.79f, 0.0f);
            break;
        case 624: // Eastern Kingdoms -> The Hinterlands
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 155.14f, -2014.95f, 122.55f, 0.0f);
            break;
        case 625: // Eastern Kingdoms -> Tirishfal Glades
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, 2255.5f, 288.511f, 35.1138f, 0.0f);
            break;
        case 626: // Eastern Kingdoms -> Westfall
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -10919.09f, 998.47f, 35.47f, 0.0f);
            break;
        case 627: // Eastern Kingdoms -> Wetlands
            player->CLOSE_GOSSIP_MENU();
            player->TeleportTo(0, -4086.36f, -2610.95f, 47.0143f, 0.0f);
            break;
		case 628: // 加基森
			player->CLOSE_GOSSIP_MENU();
			player->TeleportTo(1, -7177.10f, -3786.08f, 8.38f, 0.0f);
			break;
		case 629: // 塞拉里奥要塞
			player->CLOSE_GOSSIP_MENU();
			player->TeleportTo(1, -6831.10f, 748.80f, 42.50f, 0.0f);
			break;
		case 630: // 西瘟疫之地
			player->CLOSE_GOSSIP_MENU();
			player->TeleportTo(0, 981.47f, -1821.84f, 80.48f, 0.0f);
			break;
		case 631: // 海尔加山入口
			player->CLOSE_GOSSIP_MENU();
			player->TeleportTo(1, 4603.94f, -3879.25f, 944.18f, 0.0f);
			break;

        case 100: // Main Menu
            // HORDE
            if (player->GetTeam() == HORDE)
            {
				player->ADD_GOSSIP_ITEM(5, "★世界主城★", GOSSIP_SENDER_MAIN, 628);
				player->ADD_GOSSIP_ITEM(5, "〖阵营城市〗", GOSSIP_SENDER_MAIN, 1);
				player->ADD_GOSSIP_ITEM(5, "〖新人副本〗", GOSSIP_SENDER_MAIN, 5);
				player->ADD_GOSSIP_ITEM(5, "【团队副本】", GOSSIP_SENDER_MAIN, 101);
				player->ADD_GOSSIP_ITEM(5, "一号场地刷暮光信徒<新人成长>", GOSSIP_SENDER_MAIN, 629);
				player->ADD_GOSSIP_ITEM(5, "二号场地刷瘟疫锅周边怪<新人成长>", GOSSIP_SENDER_MAIN, 630);
				player->ADD_GOSSIP_ITEM(5, ">>古巴竞技场 - 叶文洁", GOSSIP_SENDER_MAIN, 4015);
				player->ADD_GOSSIP_ITEM(5, ">>海加尔山的战役1 - 三体长老", GOSSIP_SENDER_MAIN, 631);

                player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            }
            // ALLIANCE
            else
            {
				player->ADD_GOSSIP_ITEM(5, "★世界主城★", GOSSIP_SENDER_MAIN, 628);
				player->ADD_GOSSIP_ITEM(5, "〖阵营城市〗", GOSSIP_SENDER_MAIN, 2);
				player->ADD_GOSSIP_ITEM(5, "〖新人副本〗", GOSSIP_SENDER_MAIN, 5);
				player->ADD_GOSSIP_ITEM(5, "【团队副本】", GOSSIP_SENDER_MAIN, 101);
				player->ADD_GOSSIP_ITEM(5, "一号场地刷暮光信徒<新人成长>", GOSSIP_SENDER_MAIN, 629);
				player->ADD_GOSSIP_ITEM(5, "二号场地刷瘟疫锅周边怪<新人成长>", GOSSIP_SENDER_MAIN, 630);
				player->ADD_GOSSIP_ITEM(5, ">>古巴竞技场 - 叶文洁", GOSSIP_SENDER_MAIN, 4015);
				player->ADD_GOSSIP_ITEM(5, ">>海加尔山的战役1 - 三体长老", GOSSIP_SENDER_MAIN, 631);

                player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, _Creature->GetGUID());
            }
            break;
    }
}
bool GossipSelect_TeleportNPC(Player *player, Creature *_Creature, uint32 sender, uint32 action)
{
    // Main menu
    if (sender == GOSSIP_SENDER_MAIN)
        SendDefaultMenu_TeleportNPC(player, _Creature, action);

    return true;
}

enum Enchants
{
    WEP2H_SUPERIOR_IMPACT = 20,
    WEP2H_AGILITY,
    WEP_CRUSADER,
    WEP1H_AGILITY,
    WEP_SPELLPOWER,
    WEP_HEAL,
    OFFHAND_SPIRIT,
    OFFHAND_STAM,
    OFFHAND_FROSTRES,
    CHEST_STATS,
    CLOAK_DODGE,
    CLOAK_SUB,
    CLOAK_ARMOR,
    CLOAK_AGILITY,
    BRACER_STAM,
    BRACER_STR,
    BRACER_HEAL,
    BRACER_INT,
    GLOVES_AGI,
    GLOVES_FIRE,
    GLOVES_FROST,
    GLOVES_SHADOW,
    GLOVES_HEALING,
    BOOTS_AGI,
    BOOTS_SPEED,
    BOOTS_STAM,
};

void Enchant(Player* player, Item* item, uint32 enchantid)
{
    if (!item)
    {
        player->GetSession()->SendNotification("你必须先装备你要附魔的物品。");
        return;
    }

    if (!enchantid)
    {
        player->GetSession()->SendNotification("未完成。");
        return;
    }

    item->ClearEnchantment(PERM_ENCHANTMENT_SLOT);
    item->SetEnchantment(PERM_ENCHANTMENT_SLOT, enchantid, 0, 0);
    player->GetSession()->SendNotification("%s 成功被附魔", item->GetProto()->Name1);
}

bool GossipHello_EnchantNPC(Player* player, Creature* creature)
{

    player->ADD_GOSSIP_ITEM(5, "胸部", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_CHEST);
    player->ADD_GOSSIP_ITEM(5, "披风", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_BACK);
    player->ADD_GOSSIP_ITEM(5, "护腕", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_WRISTS);
    player->ADD_GOSSIP_ITEM(5, "手套", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_HANDS);
    player->ADD_GOSSIP_ITEM(5, "靴子", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_FEET);
    player->ADD_GOSSIP_ITEM(5, "主手武器", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_MAINHAND);
    player->ADD_GOSSIP_ITEM(5, "副手武器", GOSSIP_SENDER_MAIN, EQUIPMENT_SLOT_OFFHAND);

    player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
    return true;
}
bool GossipSelect_EnchantNPC(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    if (sender != GOSSIP_SENDER_MAIN)
        return true;

    if (action < 20)
    {
        switch (action)
        {
        case EQUIPMENT_SLOT_CHEST:
            player->ADD_GOSSIP_ITEM(5, "所有属性+4", GOSSIP_SENDER_MAIN, CHEST_STATS);
            break;
        case EQUIPMENT_SLOT_BACK:
            player->ADD_GOSSIP_ITEM(5, "敏捷+3", GOSSIP_SENDER_MAIN, CLOAK_AGILITY);
            player->ADD_GOSSIP_ITEM(5, "护甲+70", GOSSIP_SENDER_MAIN, CLOAK_ARMOR);
            player->ADD_GOSSIP_ITEM(5, "闪避+1%", GOSSIP_SENDER_MAIN, CLOAK_DODGE);
            player->ADD_GOSSIP_ITEM(5, "狡诈", GOSSIP_SENDER_MAIN, CLOAK_SUB);
        break;
        case EQUIPMENT_SLOT_WRISTS:
            player->ADD_GOSSIP_ITEM(5, "耐力+9", GOSSIP_SENDER_MAIN, BRACER_STAM);
            player->ADD_GOSSIP_ITEM(5, "力量+9", GOSSIP_SENDER_MAIN, BRACER_STR);
            player->ADD_GOSSIP_ITEM(5, "治疗法术+24", GOSSIP_SENDER_MAIN, BRACER_HEAL);
            player->ADD_GOSSIP_ITEM(5, "智力+7", GOSSIP_SENDER_MAIN, BRACER_INT);
            break;
        case EQUIPMENT_SLOT_HANDS:
            player->ADD_GOSSIP_ITEM(5, "敏捷+15", GOSSIP_SENDER_MAIN, GLOVES_AGI);
            player->ADD_GOSSIP_ITEM(5, "火焰伤害+20", GOSSIP_SENDER_MAIN, GLOVES_FIRE);
            player->ADD_GOSSIP_ITEM(5, "冰霜伤害+20", GOSSIP_SENDER_MAIN, GLOVES_FROST);
            player->ADD_GOSSIP_ITEM(5, "暗影伤害+20", GOSSIP_SENDER_MAIN, GLOVES_SHADOW);
            player->ADD_GOSSIP_ITEM(5, "治疗法术+30", GOSSIP_SENDER_MAIN, GLOVES_HEALING);
            break;
        case EQUIPMENT_SLOT_FEET:
            player->ADD_GOSSIP_ITEM(5, "耐力+7", GOSSIP_SENDER_MAIN, BOOTS_STAM);
            player->ADD_GOSSIP_ITEM(5, "移动速度略微提升", GOSSIP_SENDER_MAIN, BOOTS_SPEED);
            player->ADD_GOSSIP_ITEM(5, "敏捷+5", GOSSIP_SENDER_MAIN, BOOTS_AGI);
            break;
        case EQUIPMENT_SLOT_MAINHAND:
            player->ADD_GOSSIP_ITEM(5, "十字军", GOSSIP_SENDER_MAIN, WEP_CRUSADER);
            player->ADD_GOSSIP_ITEM(5, "单手武器敏捷+15", GOSSIP_SENDER_MAIN, WEP1H_AGILITY);
            player->ADD_GOSSIP_ITEM(5, "双手武器敏捷+15", GOSSIP_SENDER_MAIN, WEP2H_AGILITY);
            player->ADD_GOSSIP_ITEM(5, "法术伤害+30r", GOSSIP_SENDER_MAIN, WEP_SPELLPOWER);
            player->ADD_GOSSIP_ITEM(5, "治疗法术+55", GOSSIP_SENDER_MAIN, WEP_HEAL);
            break;
        case EQUIPMENT_SLOT_OFFHAND:
            player->ADD_GOSSIP_ITEM(5, "精神+9", GOSSIP_SENDER_MAIN, OFFHAND_SPIRIT);
            player->ADD_GOSSIP_ITEM(5, "耐力+7", GOSSIP_SENDER_MAIN, OFFHAND_STAM);
            player->ADD_GOSSIP_ITEM(5, "冰霜抗性+8", GOSSIP_SENDER_MAIN, OFFHAND_FROSTRES);
            break;
        }
        player->SEND_GOSSIP_MENU(DEFAULT_GOSSIP_MESSAGE, creature->GetGUID());
    }
    else
    {
        Item* item = nullptr;
        uint32 id = 0;
        switch (action)
        {
            case WEP2H_SUPERIOR_IMPACT:
            case WEP2H_AGILITY:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                if (item && (action == WEP2H_AGILITY || action == WEP2H_SUPERIOR_IMPACT))
                {
                    if (item->GetProto()->SubClass != ITEM_SUBCLASS_WEAPON_AXE2 && item->GetProto()->SubClass != ITEM_SUBCLASS_WEAPON_MACE2
                        && item->GetProto()->SubClass != ITEM_SUBCLASS_WEAPON_SWORD2 && item->GetProto()->SubClass != ITEM_SUBCLASS_WEAPON_POLEARM
                        && item->GetProto()->SubClass != ITEM_SUBCLASS_WEAPON_STAFF)
                    {
                        player->GetSession()->SendNotification("需要双手武器");
                        player->CLOSE_GOSSIP_MENU();
                        return true;
                    }
                }
                if (action == WEP2H_SUPERIOR_IMPACT)
                    id = 1896;
                else if (action == WEP2H_AGILITY)
                    id = 2646;
                break;

            case WEP_CRUSADER:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                id = 1900;
                break;
            case WEP1H_AGILITY:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                id = 2564;
                break;
            case WEP_SPELLPOWER:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                id = 2504;
                break;
            case WEP_HEAL:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_MAINHAND);
                id = 2505;
                break;

            case OFFHAND_SPIRIT:
            case OFFHAND_STAM:
            case OFFHAND_FROSTRES:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_OFFHAND);
                if (item && item->GetProto()->SubClass != ITEM_SUBCLASS_ARMOR_SHIELD)
                {
                    player->GetSession()->SendNotification("需要盾牌");
                    player->CLOSE_GOSSIP_MENU();
                    return true;
                }
                if (action == OFFHAND_SPIRIT)
                    id = 1890;
                else if (action == OFFHAND_FROSTRES)
                    id = 926;
                else if (action == OFFHAND_STAM)
                    id = 929;
                break;
            case CHEST_STATS:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_CHEST);
                id = 1891;
                break;
            case CLOAK_DODGE:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_BACK);
                id = 2622;
                break;
            case CLOAK_SUB:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_BACK);
                id = 2621;
                break;
            case CLOAK_ARMOR:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_BACK);
                id = 1889;
                break;
            case CLOAK_AGILITY:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_BACK);
                id = 849;
                break;
            case BRACER_STAM:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_WRISTS);
                id = 1886;
                break;
            case BRACER_STR:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_WRISTS);
                id = 1885;
                break;
            case BRACER_HEAL:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_WRISTS);
                id = 2566;
                break;
            case BRACER_INT:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_WRISTS);
                id = 1883;
                break;
            case GLOVES_AGI:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HANDS);
                id = 2564;
                break;
            case GLOVES_FIRE:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HANDS);
                id = 2616;
                break;
            case GLOVES_FROST:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HANDS);
                id = 2615;
                break;
            case GLOVES_SHADOW:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HANDS);
                id = 2614;
                break;
            case GLOVES_HEALING:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_HANDS);
                id = 2617;
                break;
            case BOOTS_AGI:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FEET);
                id = 904;
                break;
            case BOOTS_SPEED:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FEET);
                id = 911;
                break;
            case BOOTS_STAM:
                item = player->GetItemByPos(INVENTORY_SLOT_BAG_0, EQUIPMENT_SLOT_FEET);
                id = 929;
                break;
        }
        Enchant(player, item, id);
        player->CLOSE_GOSSIP_MENU();
    }
    return true;
}

void LearnSkillRecipesHelper(Player *player, uint32 skill_id)
{
    uint32 classmask = player->GetClassMask();

    for (uint32 j = 0; j < sObjectMgr.GetMaxSkillLineAbilityId(); ++j)
    {
        SkillLineAbilityEntry const *skillLine = sObjectMgr.GetSkillLineAbility(j);
        if (!skillLine)
            continue;

        // wrong skill
        if (skillLine->skillId != skill_id)
            continue;

        // not high rank
        if (skillLine->forward_spellid)
            continue;

        // skip racial skills
        if (skillLine->racemask != 0)
            continue;

        // skip wrong class skills
        if (skillLine->classmask && (skillLine->classmask & classmask) == 0)
            continue;

        SpellEntry const* spellEntry = sSpellMgr.GetSpellEntry(skillLine->spellId);
        if (!spellEntry || !SpellMgr::IsSpellValid(spellEntry, player, false))
            continue;

        player->LearnSpell(skillLine->spellId, false);
    }
}
bool LearnAllRecipesInProfession(Player *pPlayer, SkillType skill)
{
    ChatHandler handler(pPlayer->GetSession());
    char* skill_name;

    SkillLineEntry const *SkillInfo = sSkillLineStore.LookupEntry(skill);
    skill_name = SkillInfo->name[sWorld.GetDefaultDbcLocale()];

    if (!SkillInfo)
    {
        sLog.outError("Profession NPC: received non-valid skill ID");
        return false;
    }

    pPlayer->SetSkill(SkillInfo->id, 300, 300);
    LearnSkillRecipesHelper(pPlayer, SkillInfo->id);
    pPlayer->GetSession()->SendNotification("All recipes for %s learned", skill_name);
    return true;
}

bool GossipHello_ProfessionNPC(Player* player, Creature* creature)
{

    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Alchemy",              GOSSIP_SENDER_MAIN, 1);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Blacksmithing",        GOSSIP_SENDER_MAIN, 2);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Leatherworking",       GOSSIP_SENDER_MAIN, 3);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Tailoring",            GOSSIP_SENDER_MAIN, 4);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Engineering",          GOSSIP_SENDER_MAIN, 5);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Enchanting",           GOSSIP_SENDER_MAIN, 6);
    //player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Jewelcrafting",      GOSSIP_SENDER_MAIN, 7);
    //player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Inscription",        GOSSIP_SENDER_MAIN, 8);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Herbalism",            GOSSIP_SENDER_MAIN, 9);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Skinning",             GOSSIP_SENDER_MAIN, 10);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Mining",               GOSSIP_SENDER_MAIN, 11);

    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "First Aid",            GOSSIP_SENDER_MAIN, 12);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Fishing",              GOSSIP_SENDER_MAIN, 13);
    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, "Cooking",              GOSSIP_SENDER_MAIN, 14);

    player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
    return true;
}
void CompleteLearnProfession(Player *pPlayer, Creature *pCreature, SkillType skill)
{
    if (pPlayer->GetFreePrimaryProfessionPoints() == 0 && !(skill == SKILL_COOKING || skill == SKILL_FIRST_AID))
    {
        pPlayer->GetSession()->SendNotification("You already know two primary professions.");
    }
    else
    {
        if (!LearnAllRecipesInProfession(pPlayer, skill))
            pPlayer->GetSession()->SendNotification("Internal error.");
    }
}
bool GossipSelect_ProfessionNPC(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    switch (action)
    {
    case 1:
        if (!player->HasSkill(SKILL_ALCHEMY))
            CompleteLearnProfession(player, creature, SKILL_ALCHEMY);
        break;
    case 2:
        if (!player->HasSkill(SKILL_BLACKSMITHING))
            CompleteLearnProfession(player, creature, SKILL_BLACKSMITHING);
        break;
    case 3:
        if (!player->HasSkill(SKILL_LEATHERWORKING))
            CompleteLearnProfession(player, creature, SKILL_LEATHERWORKING);
        break;
    case 4:
        if (!player->HasSkill(SKILL_TAILORING))
            CompleteLearnProfession(player, creature, SKILL_TAILORING);
        break;
    case 5:
        if (!player->HasSkill(SKILL_ENGINEERING))
            CompleteLearnProfession(player, creature, SKILL_ENGINEERING);
        break;
    case 6:
        if (!player->HasSkill(SKILL_ENCHANTING))
            CompleteLearnProfession(player, creature, SKILL_ENCHANTING);
        break;
    case 7:
    case 8:
        break;
    case 9:
        if (!player->HasSkill(SKILL_HERBALISM))
            CompleteLearnProfession(player, creature, SKILL_HERBALISM);
        break;
    case 10:
        if (!player->HasSkill(SKILL_SKINNING))
            CompleteLearnProfession(player, creature, SKILL_SKINNING);
        break;
    case 11:
        if (!player->HasSkill(SKILL_MINING))
            CompleteLearnProfession(player, creature, SKILL_MINING);
        break;
    case 12:
        if (!player->HasSkill(SKILL_FIRST_AID))
            CompleteLearnProfession(player, creature, SKILL_FIRST_AID);
        break;
    case 13:
        if (!player->HasSkill(SKILL_FISHING))
            CompleteLearnProfession(player, creature, SKILL_FISHING);
        break;
    case 14:
        if (!player->HasSkill(SKILL_COOKING))
            CompleteLearnProfession(player, creature, SKILL_COOKING);
        break;
    }

    player->CLOSE_GOSSIP_MENU();
    return true;
}

/*
* Custom premade gear and spec scripts
*/

#define SPELL_LIGHTNING_VISUAL 24240

bool GossipHello_PremadeGearNPC(Player* player, Creature* creature)
{
    for (auto itr : sObjectMgr.GetPlayerPremadeGearTemplates())
    {
        if (itr.second.requiredClass == player->GetClass())
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, itr.second.name.c_str(), GOSSIP_SENDER_MAIN, itr.first);
        }
    }

    player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
    return true;
}

bool GossipSelect_PremadeGearNPC(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    player->SendSpellGo(player, SPELL_LIGHTNING_VISUAL);
    sObjectMgr.ApplyPremadeGearTemplateToPlayer(action, player);
    player->CLOSE_GOSSIP_MENU();
    return true;
}

bool GossipHello_PremadeSpecNPC(Player* player, Creature* creature)
{
    for (auto itr : sObjectMgr.GetPlayerPremadeSpecTemplates())
    {
        if (itr.second.requiredClass == player->GetClass())
        {
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_2, itr.second.name.c_str(), GOSSIP_SENDER_MAIN, itr.first);
        }
    }

    player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
    return true;
}

bool GossipSelect_PremadeSpecNPC(Player* player, Creature* creature, uint32 sender, uint32 action)
{
    player->SendSpellGo(player, SPELL_LIGHTNING_VISUAL);
    sObjectMgr.ApplyPremadeSpecTemplateToPlayer(action, player);
    player->CLOSE_GOSSIP_MENU();
    return true;
}

/*
* Custom training dummy script
*/

struct npc_training_dummyAI : ScriptedAI
{
    explicit npc_training_dummyAI(Creature* pCreature) : ScriptedAI(pCreature)
    {
        npc_training_dummyAI::Reset();
    }

    uint32 m_uiCombatTimer;
    std::unordered_map<ObjectGuid, time_t> attackers;

    void Reset() override
    {
        m_uiCombatTimer = 15000;
        attackers.clear();
    }

    void AttackStart(Unit* /*pWho*/) override {}

    void Aggro(Unit* pWho) override
    {
        SetCombatMovement(false);
    }

    void AddAttackerToList(Unit* pWho)
    {
        auto itr = attackers.find(pWho->GetObjectGuid());
        if (itr != attackers.end())
        {
            itr->second = std::time(nullptr);
        }
        else
        {
            attackers.emplace(pWho->GetObjectGuid(), std::time(nullptr));
        }
    }

    void DamageTaken(Unit* pWho, uint32& /*uiDamage*/) override
    {
        if (pWho)
            AddAttackerToList(pWho);
    }

    void SpellHit(Unit* pWho, SpellEntry const* /*pSpell*/) override
    {
        if (pWho)
            AddAttackerToList(pWho);
    }

    void UpdateAI(uint32 const diff) override
    {
        if (m_creature->IsInCombat())
        {
            if (m_uiCombatTimer <= diff)
            {
                for (auto itr = attackers.begin(); itr != attackers.end();)
                {
                    Unit* pAttacker = m_creature->GetMap()->GetUnit(itr->first);

                    if (!pAttacker || !pAttacker->IsInWorld())
                    {
                        itr = attackers.erase(itr);
                        continue;
                    }
                    if (itr->second + 10 < std::time(nullptr))
                    {
                        m_creature->_removeAttacker(pAttacker);
                        m_creature->GetThreatManager().modifyThreatPercent(pAttacker, -101.0f);
                        itr = attackers.erase(itr);
                        continue;
                    }
                    ++itr;
                }

                if (m_creature->GetThreatManager().isThreatListEmpty())
                    EnterEvadeMode();

                m_uiCombatTimer = 15000;
            }
            else
                m_uiCombatTimer -= diff;
        }
    }
};

CreatureAI* GetAI_npc_training_dummy(Creature* pCreature)
{
    return new npc_training_dummyAI(pCreature);
}

struct npc_summon_debugAI : ScriptedAI
{
    uint32 m_maxSummonCount = 200;
    uint32 m_summonCount = 0;
    Creature *m_summons[200];

    npc_summon_debugAI(Creature *pCreature) : ScriptedAI(pCreature)
    {
        m_summonCount = 0;
        for (uint32 i = 0; i < m_maxSummonCount; ++i)
            m_summons[i] = nullptr;

        Reset();
    }

    void Reset() override
    {
        m_summonCount = 0;
        for (uint32 i = 0; i < m_maxSummonCount; ++i)
        {
            if (m_summons[i])
                ((TemporarySummon*)m_summons[i])->UnSummon();

            m_summons[i] = nullptr;
        }
    }


    void JustDied(Unit* /* killer */) override
    {
        Reset();
    }

    void UpdateAI(uint32 const diff) override
    {
        if (!m_creature->GetVictim())
            return;

        if (m_summonCount >= m_maxSummonCount)
            return;

        m_summons[m_summonCount++] = m_creature->SummonCreature(12458, m_creature->GetPositionX(), m_creature->GetPositionY(), m_creature->GetPositionZ(), 0);
    }
};

CreatureAI* GetAI_custom_summon_debug(Creature *creature)
{
    return new npc_summon_debugAI(creature);
}

// REWARD SHOP NPC

bool OnGossipHello_RewardShopNPC(Player* player, Creature* creature)
{
	if (player->IsInCombat())
		return false;

	std::string Text = "输入电子兑换券并点“接受”";
	player->ADD_GOSSIP_ITEM_EXTENDED(GOSSIP_ICON_DOT, ">>兑换我的电子兑换券", GOSSIP_SENDER_MAIN, 1, Text, true);
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, ">>我如何获得电子兑换券？", GOSSIP_SENDER_MAIN, 2);
	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "注：兑换券是奖励给捐赠服务器租赁的玩家的礼券。\n（礼券可兑换+150%速度坐骑、职业增益被动技能、属性增益包包等物品，详情请咨询游戏管理员）", GOSSIP_SENDER_MAIN, 3);
	if (player->IsGameMaster())
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "[GM]我想生成一个电子兑换券", GOSSIP_SENDER_MAIN, 4);

	player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
	return true;
}

bool OnGossipSelect_RewardShopNPC(Player* player, Creature* creature, uint32 sender, uint32 action)
{
	player->PlayerTalkClass->ClearMenus();
	std::string info("您可以通过访问淘虾网站（http://ka.taoxia.xyz）获取电子兑换券。");
	uint32 rnd1 = urand(10000, 90000);
	uint32 rnd2 = urand(10000, 90000);
	uint32 rnd3 = urand(10000, 90000);
	uint32 rnd4 = urand(10000, 90000);
	uint32 rnd5 = urand(10000, 90000);

	std::string CreatedBy = player->GetName();
	std::ostringstream randomcode;
	randomcode << "GM-" << rnd1 << "-" << rnd2 << "-" << rnd3 << "-" << rnd4 << "-" << rnd5;

	switch (action)
	{
	case 2:
		creature->MonsterWhisper(info.c_str(), player, false);
		player->CLOSE_GOSSIP_MENU();
		break;
	case 3:
		player->CLOSE_GOSSIP_MENU();
		break;
	case 4:
		player->PlayerTalkClass->ClearMenus();
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "我想生成一个名称更改电子兑换券。", GOSSIP_SENDER_MAIN, 6);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "我想生成一个派系变更电子兑换券。", GOSSIP_SENDER_MAIN, 7);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "我想生成一个种族变更电子兑换券。", GOSSIP_SENDER_MAIN, 8);
		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		break;
	case 6:
		CharacterDatabase.PQuery("INSERT INTO `reward_shop` (`action`, `action_data`, `quantity`, `code`, `status`, `PlayerGUID`, `PlayerIP`, `CreatedBy`) VALUES(3, 0, 0, '%s', 0, 0, '0', '%s')", randomcode.str().c_str(), CreatedBy.c_str());
		ChatHandler(player->GetSession()).PSendSysMessage("已成功创建您的卡密 %s", randomcode.str().c_str());
		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		break;
	case 7:
		CharacterDatabase.PQuery("INSERT INTO `reward_shop` (`action`, `action_data`, `quantity`, `code`, `status`, `PlayerGUID`, `PlayerIP`,`CreatedBy`) VALUES(4, 0, 0, '%s', 0, 0, '0', '%s')", randomcode.str().c_str(), CreatedBy.c_str());
		ChatHandler(player->GetSession()).PSendSysMessage("已成功创建您的卡密 %s", randomcode.str().c_str());
		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		break;
	case 8:
		CharacterDatabase.PQuery("INSERT INTO `reward_shop` (`action`, `action_data`, `quantity`, `code`, `status`, `PlayerGUID`, `PlayerIP`, `CreatedBy`) VALUES(5, 0, 0, '%s', 0, 0, '0', '%s')", randomcode.str().c_str(), CreatedBy.c_str());
		ChatHandler(player->GetSession()).PSendSysMessage("已成功创建您的卡密 %s", randomcode.str().c_str());
		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		break;
	}
	return true;
}

bool OnGossipSelectCode_RewardShopNPC(Player* player, Creature* creature, uint32 sender, uint32, const char* code)
{
	uint32 playerguid = player->GetGUID();
	std::string playerIP = player->GetSession()->GetRemoteAddress();
	std::string rewardcode = code;
	std::ostringstream messageCode;
	messageCode << "我很抱歉 " << player->GetName() << ", 这不是有效卡密或已被兑换。";

	//check for code
	QueryResult* result = CharacterDatabase.PQuery("SELECT id, action, action_data, quantity, status FROM reward_shop WHERE code = '%s'", rewardcode.c_str());

	std::size_t found = rewardcode.find_first_not_of("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890-");

	if (found != std::string::npos)
		return false;

	if (!result)
	{
		player->PlayDirectSound(9638); // No
		creature->MonsterWhisper(messageCode.str().c_str(), player);
		creature->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
		player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
		return false;
	}

	std::transform(rewardcode.begin(), rewardcode.end(), rewardcode.begin(), ::toupper);

	do
	{
		Field* fields = result->Fetch();
		uint32 id = fields[0].GetUInt32();
		uint32 action = fields[1].GetUInt32();
		uint32 action_data = fields[2].GetUInt32();
		uint32 quantity = fields[3].GetUInt32();
		uint32 status = fields[4].GetInt32();
		uint32 nospace = 0;
		int count = 1;
		uint32 noSpaceForCount = 0;
		ItemPosCountVec dest;
		InventoryResult msg = player->CanStoreNewItem(NULL_BAG, NULL_SLOT, dest, action_data, quantity, &noSpaceForCount);


		if (status == 1)
		{
			player->PlayDirectSound(9638); // No
			creature->MonsterWhisper(messageCode.str().c_str(), player);
			creature->HandleEmoteCommand(EMOTE_ONESHOT_QUESTION);
			player->SEND_GOSSIP_MENU(player->GetGossipTextId(creature), creature->GetGUID());
			return false;
		}
		switch (action)
		{

		case 1: /* Item */
			if (msg != EQUIP_ERR_OK)
				count -= noSpaceForCount;

			if (count == 0 || dest.empty())
			{
				ChatHandler(player->GetSession()).PSendSysMessage("兑换失败,不能携带更多此类物品或者您的背包空间不足。");
				//ChatHandler(player->GetSession()).PSendSysMessage(true);
				return false;
			}

			if (count > 0 && action_data)
			{
				player->AddItem(action_data, quantity);
			}
			break;
		case 2: /* Gold */
			player->ModifyMoney(action_data * 10000);
			ChatHandler(player->GetSession()).PSendSysMessage("兑换系统: 成功添加 [%u G币]", action_data);
			break;
		case 3: /* Name Change */
			player->SetAtLoginFlag(AT_LOGIN_RENAME);
			ChatHandler(player->GetSession()).PSendSysMessage("兑换系统: 请注销名称变更。");
			break;
		case 4: /* Faction Change */
			player->SetAtLoginFlag(AT_LOGIN_CHANGE_FACTION);
			ChatHandler(player->GetSession()).PSendSysMessage("兑换系统: 请注销阵营变更。");
			break;
		case 5: /* Race Change */
			player->SetAtLoginFlag(AT_LOGIN_CHANGE_RACE);
			ChatHandler(player->GetSession()).PSendSysMessage("兑换系统: 请注销种族变更。");
			break;
		}

	} while (result->NextRow());

	CharacterDatabase.PQuery("UPDATE reward_shop SET status = 1, PlayerGUID = '%u', PlayerIP = '%s' WHERE code = '%s'", playerguid, playerIP.c_str(), rewardcode.c_str());
	return true;
}

void AddSC_custom_creatures()
{
    Script* newscript;

    newscript = new Script;
    newscript->Name = "custom_teleport_npc";
    newscript->pGossipHello = &GossipHello_TeleportNPC;
    newscript->pGossipSelect = &GossipSelect_TeleportNPC;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_enchant_npc";
    newscript->pGossipHello = &GossipHello_EnchantNPC;
    newscript->pGossipSelect = &GossipSelect_EnchantNPC;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_professions_npc";
    newscript->pGossipHello = &GossipHello_ProfessionNPC;
    newscript->pGossipSelect = &GossipSelect_ProfessionNPC;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_premade_gear_npc";
    newscript->pGossipHello = &GossipHello_PremadeGearNPC;
    newscript->pGossipSelect = &GossipSelect_PremadeGearNPC;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_premade_spec_npc";
    newscript->pGossipHello = &GossipHello_PremadeSpecNPC;
    newscript->pGossipSelect = &GossipSelect_PremadeSpecNPC;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_npc_training_dummy";
    newscript->GetAI = &GetAI_npc_training_dummy;
    newscript->RegisterSelf(false);

    newscript = new Script;
    newscript->Name = "custom_npc_summon_debugAI";
    newscript->GetAI = &GetAI_custom_summon_debug;
    newscript->RegisterSelf(false);

	newscript = new Script;
	newscript->Name = "reward_shop_npc";
	newscript->pGossipHello = &OnGossipHello_RewardShopNPC;
	newscript->pGossipSelect = &OnGossipSelect_RewardShopNPC;
	newscript->pGossipSelectWithCode = &OnGossipSelectCode_RewardShopNPC;
	newscript->RegisterSelf(false);
}
