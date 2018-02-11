DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180209015604');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180209015604');
-- Add your query below.


-- Event introduced in February 2006 - Patch 1.9
UPDATE `quest_template` SET `patch`=7 WHERE `entry` in (9029,8898,8899,8901,8902,8897,8903,9024,9025,9026,9027,9028,8900,8904,8979,8980,8982,8983,8984,8981);
UPDATE `creature_questrelation` SET `patch`=7 WHERE `quest` in (9029,8898,8899,8901,8902,8897,8903,9024,9025,9026,9027,9028,8900,8904,8979,8980,8982,8983,8984,8981);
UPDATE `creature_involvedrelation` SET `patch`=7 WHERE quest in (9029,8898,8899,8901,8902,8897,8903,9024,9025,9026,9027,9028,8900,8904,8979,8980,8982,8983,8984,8981);
UPDATE `item_template` SET `patch`=7 WHERE `entry` in (22281,22282,22277,22278,22280,22276,22279);

-- Alliance quest chain
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (16105, 9027, 7);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (279, 9025, 7);
DELETE FROM `creature_questrelation` WHERE `quest`=9027;
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (6740, 9027, 7);
UPDATE `quest_template` SET `PrevQuestId`=8903 WHERE  `entry`=9024 AND `patch`=7;
UPDATE `quest_template` SET `PrevQuestId`=9024, `NextQuestInChain`=9026 WHERE  `entry`=9025 AND `patch`=7;
UPDATE `quest_template` SET `RequiredRaces`=77, `PrevQuestId`=9025 WHERE  `entry`=9026 AND `patch`=7;
UPDATE `quest_template` SET `PrevQuestId`=9026 WHERE  `entry`=9027 AND `patch`=7;
UPDATE `quest_template` SET `NextQuestId`=9029, `ExclusiveGroup`=9028, `NextQuestInChain`=0 WHERE  `entry`=9028 AND `patch`=7;
UPDATE `item_template` SET `spellcharges_1`=-10 WHERE  `entry`=21829;


-- Cauldron and quest
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) 
VALUES (181073, 2, 216, 'Fragrant Cauldron', 35, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) 
VALUES (121618, 181073, 0, 87.6351, -1724.96, 220.192, 1.88655, 0, 0, 0.809484, 0.587141, 25, 25, 0, 1);
REPLACE INTO `gameobject_questrelation` (`id`, `quest`, `patch`) VALUES (181073, 9029, 7);
REPLACE INTO `gameobject_involvedrelation` (`id`, `quest`, `patch`) VALUES (181073, 9029, 7);


-- Horde quest chain
REPLACE INTO `quest_template` (`entry`, `patch`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredRaces`, `QuestFlags`, `NextQuestInChain`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `ReqItemId1`, `ReqItemCount1`) 
VALUES (8904, 7, -22, 1, 60, 178, 8, 8979, 'Dangerous Love', 'There\'s something unnatural about this epidemic of love. It\'s disgusting, and as it lowers our defenses, it could be a threat to the all of us.$B$BIt\'s bad enough that so many of our people are caught up in this ridiculous behavior. But I think that it has spread even to our guardians, who should be immune to such things.$B$BFind one of our guardians and see if they\'ve been caught up in this foolishness.', 'Get a Guardian\'s Moldy Card and bring it to Fenstad Argyle in the Undercity.', 'So it is true. This is unbelievable. How could this have happened? Let me think for a moment. There must be a reason behind this.', 'Was I right to worry? Have our idiot guardians been overcome?', 22145, 1);
UPDATE `quest_template` SET `PrevQuestId`=8904, `NextQuestInChain`=8980 WHERE  `entry`=8979 AND `patch`=7;
UPDATE `quest_template` SET `RequiredRaces`=178, `PrevQuestId`=8979 WHERE  `entry`=8980 AND `patch`=7;
UPDATE `quest_template` SET `PrevQuestId`=8980 WHERE  `entry`=8982 AND `patch`=7;
UPDATE `quest_template` SET `PrevQuestId`=8982 WHERE  `entry`=8983 AND `patch`=7;
UPDATE `quest_template` SET `NextQuestId`=9029, `ExclusiveGroup`=9028, `NextQuestInChain`=0 WHERE  `entry`=8984 AND `patch`=7;
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (16108, 8904, 7);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (16108, 8904, 7);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (5204, 8980, 7);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (6741, 8983, 7);

-- Innkeeper Seasonal items
UPDATE `npc_vendor` SET `maxcount`=0, `incrtime`=0 WHERE `entry`=5111 AND `item`=21815;
REPLACE INTO `npc_vendor` (`entry`, `item`) VALUES 
(6741, 21833),(6741, 21815),(6741, 21829),(6929, 21833),(6929, 21815),(6929, 21829),
(6740, 21833),(6740, 21815),(6740, 21829),(6746, 21833),(6746, 21815),(6746, 21829),
(6735, 21833),(6735, 21815),(6735, 21829);


-- Kwee Peddlefeet and Gift Giving
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(60100, 16075, 0, 0, 0, -8441.77, 328.147, 122.58, 2.27215, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10),
(60101, 16075, 0, 0, 0, -4862.71, -1018.52, 505.715, 5.36062, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10),
(60102, 16075, 1, 0, 0, 9664.87, 2527.76, 1360, 5.60141, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10),
(60103, 16075, 1, 0, 0, 1915.43, -4126.12, 42.9818, 5.43255, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10),
(60104, 16075, 1, 0, 0, -1217.04, -108.192, 163.443, 1.44889, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10),
(60105, 16075, 0, 0, 0, 1288.51, 316.449, -57.3209, 1.34163, 604800, 604800, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 10);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES 
(60100, 8),(60101, 8),(60102, 8),(60103, 8),(60104, 8),(60105, 8);
UPDATE `quest_template` SET `RequiredRaces`=178, `OfferRewardText`='Wonderful! Wonderful! I will add this to the pile of other gifts.$B$BI didn\'t expect so many! You must truly love your leaders.$B$BNow, let me just add one more to the count...', `RequestItemsText`='Have you come to deliver a present of love and adoration to your favorite leader?' WHERE `entry`=8981;
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredRaces`, `QuestFlags`, `Title`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ReqItemId1`, `ReqItemCount1`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewItemId1`, `RewItemCount1`, `RewSpellCast`, `CompleteEmote`) 
VALUES (8993, 7, 0, -22, 1, 60, 77, 8, 'Gift Giving', 'Wonderful! Wonderful! I will add this to the pile of other gifts.$B$BI didn\'t expect so many! You must truly love your leaders.$B$BNow, let me just add one more to the count...', 'Have you come to deliver a present of love and adoration to your favorite leader?', NULL, 22262, 1, 22218, 22200, 5, 5, 21812, 1, 27663, 1);
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (16075, 8981, 7),(16075, 8993, 7);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (16075, 8981, 7),(16075, 8993, 7);
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry` in (8981,8993);
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (16075, 8312);
UPDATE `creature_template` SET `gossip_menu_id`=16075, `npcflag`=3, `ScriptName`='npc_kwee_peddlefeet' WHERE `entry`=16075;
UPDATE `quest_template` SET `RewChoiceItemCount2`=1, `RewSpellCast`=0 WHERE  `entry` in (8981,8993);


-- Pledges and Gifts
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE `item`=22259;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=25 WHERE `item`=21812;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=20 WHERE `item`=22218;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=10 WHERE `item`=22261;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=10 WHERE `item`=21813;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=1 WHERE `item`=22235;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=1 WHERE `item`=22279;
UPDATE `item_template` SET `spellcharges_1`=-5, `stackable`=1 WHERE `entry`=22200;
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES 
(21975, 22200, 15),(22154, 22200, 15),(22155, 22200, 15),(22156, 22200, 15),(22157, 22200, 15),(22158, 22200, 15),
(21981, 22200, 15),(21980, 22200, 15),(21979, 22200, 15),(22164, 22200, 15),(22166, 22200, 15),(22165, 22200, 15),
(21979, 22235, 1),(22155, 22235, 1),(22158, 22235, 1);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=50 WHERE `item` in (22119,22123,22117,22122,22121,22120);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=21979 AND `item`=21960;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=21980 AND `item`=22173;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=22164 AND `item`=22175;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=21981 AND `item`=22176;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=22165 AND `item`=22177;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=80 WHERE `entry`=22166 AND `item`=22174;
UPDATE `item_loot_template` SET `groupid`=1 WHERE `entry` in (22178,22160,22159,22161,22163,22162);
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`) VALUES 
(22178, 22143, 50, 1),(22160, 22141, 50, 1),(22159, 22140, 50, 1),
(22161, 22142, 50, 1),(22163, 22145, 50, 1),(22162, 22144, 50, 1);
UPDATE `item_template` SET `spellcharges_1`=-1 WHERE `entry`=22261;
UPDATE `creature_template` SET `ScriptName`='npc_target_dummy' WHERE `entry`=16111;
REPLACE INTO `spell_disabled` (`entry`) VALUES (27661); -- Disable Love Fool spell
UPDATE `creature_model_info` SET `gender`=1 WHERE `modelid`=5446;


-- Ironforge Citizens
UPDATE `creature_template` SET `ScriptName`='npc_ironforge_citizen' WHERE `entry` in (1246,1274,1356,1365,1466,1703,1901,2092,2489,2695,2737,2786,2790,2916,2918,2943,3842,3979,4081,4254,4256,4259,5049,5100,5101,5102,5103,5106,5107,5108,5109,5110,5112,5113,5114,5115,5116,5117,5119,5120,5121,5122,5123,5124,5125,5126,5127,5128,5129,5130,5132,5133,5137,5138,5140,5141,5142,5143,5144,5145,5146,5147,5148,5149,5150,5151,5152,5153,5154,5155,5156,5157,5158,5159,5160,5161,5162,5163,5165,5166,5167,5169,5170,5171,5172,5173,5174,5175,5177,5178,5570,5605,5637,6031,6114,6120,6169,6175,6178,6179,6291,6294,6382,7292,7298,7312,7936,7944,7976,7978,8256,8507,8517,8681,9099,9616,9984,10090,10276,10277,10455,10456,10877,11028,11029,11065,11406,11865,13084,13433,13434,13444,14183,14723,14724,14982,15119,16009,16013,16070);

-- Stormwind Citizens
UPDATE `creature_template` SET `ScriptName`='npc_stormwind_citizen' WHERE `entry` in (277,279,297,331,338,340,376,461,482,483,656,914,918,957,1141,1212,1257,1275,1285,1286,1287,1289,1291,1292,1294,1295,1297,1298,1299,1300,1301,1302,1303,1304,1305,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1318,1319,1320,1321,1323,1324,1325,1326,1327,1333,1339,1341,1346,1347,1348,1349,1350,1351,1413,1414,1415,1416,1427,1428,1431,1432,1435,1439,1440,1444,1472,1477,1478,1646,1721,1752,2198,2285,2327,2330,2485,2504,2708,2795,2879,3627,3629,4078,4960,4974,4981,5081,5193,5384,5386,5413,5479,5480,5482,5483,5484,5489,5491,5492,5493,5494,5495,5496,5497,5498,5499,5500,5502,5503,5504,5505,5506,5509,5510,5511,5512,5513,5514,5515,5516,5517,5518,5519,5520,5564,5565,5566,5567,6089,6122,6171,6173,6174,6267,6579,7232,9584,9977,10782,11026,11068,11069,11096,11397,11827,11828,11867,11916,13283,14450,14481,14497,14722);

-- Darnassus Citizens
UPDATE `creature_template` SET `ScriptName`='npc_darnassus_citizen' WHERE `entry` in (2796,2912,3517,3561,3562,4087,4088,4089,4090,4091,4092,4138,4146,4156,4159,4160,4161,4163,4164,4165,4167,4168,4169,4170,4171,4172,4173,4175,4177,4180,4181,4203,4204,4205,4210,4211,4212,4213,4214,4215,4216,4217,4218,4219,4220,4221,4222,4223,4225,4226,4228,4229,4230,4231,4232,4233,4234,4235,4236,4240,4241,4753,5047,5191,5782,6034,6142,6292,7296,7313,7315,7740,7999,8026,8665,10056,10089,11041,11042,11050,11070,11081,11083,11401,11700,11709,11866,14725);

-- Orgrimmar Citizen
UPDATE `creature_template` SET `ScriptName`='npc_orgrimmar_citizen' WHERE `entry` in (1383,2704,2855,2857,3189,3216,3312,3313,3314,3315,3316,3317,3319,3321,3322,3323,3324,3325,3326,3327,3328,3329,3330,3331,3332,3333,3334,3335,3342,3344,3345,3346,3347,3348,3349,3350,3352,3353,3354,3355,3356,3357,3358,3359,3360,3361,3363,3364,3365,3366,3367,3368,3369,3370,3371,3372,3373,3399,3400,3402,3403,3404,3405,3406,3407,3408,3409,3410,3412,3413,4043,4485,4752,5188,5597,5603,5606,5609,5610,5611,5613,5614,5639,5640,5811,5812,5815,5816,5817,5875,5882,5883,5885,5892,5909,5910,5958,5994,6014,6018,6446,6986,6987,7010,7088,7230,7231,7294,7311,7790,7792,7793,7951,8404,8659,9317,9550,9988,10088,10266,11017,11046,11066,11868,13417,14451,14480,14498,14726,14727,16007,16012,16076);

-- Undercity Citizen
UPDATE `creature_template` SET `ScriptName`='npc_undercity_citizen' WHERE `entry` in (223,1498,2050,2055,2227,2308,2492,2799,2802,2934,4486,4488,4552,4553,4554,4555,4556,4557,4558,4559,4560,4561,4562,4563,4564,4565,4566,4567,4568,4569,4570,4571,4572,4573,4574,4575,4576,4577,4578,4580,4581,4582,4583,4584,4585,4586,4587,4588,4589,4590,4591,4592,4593,4594,4595,4596,4597,4598,4599,4600,4601,4602,4603,4604,4605,4606,4607,4608,4609,4610,4611,4613,4614,4615,4616,4617,4775,5052,5190,5204,5651,5661,5663,5664,5665,5668,5669,5670,5675,5679,5693,5696,5698,5699,5700,5701,5703,5704,5705,5706,5707,5731,5732,5733,5734,5744,5747,5753,5754,5819,5820,5821,6293,6411,6467,6522,6566,7087,7297,7683,7825,8390,8393,8403,10053,10136,10781,10879,11031,11044,11048,11049,11067,11835,11870,14729);

-- Thunder Bluff Citizen
UPDATE `creature_template` SET `ScriptName`='npc_thunderbluff_citizen' WHERE `entry` in (2798,2987,2997,2998,2999,3001,3002,3003,3004,3005,3007,3008,3009,3010,3011,3012,3013,3014,3015,3016,3017,3018,3019,3020,3021,3022,3023,3024,3025,3026,3027,3028,3029,3030,3031,3032,3033,3034,3036,3037,3038,3039,3040,3041,3042,3043,3044,3045,3046,3048,3049,3050,3092,3093,3095,3419,3441,3447,3978,4309,4310,4451,4721,4943,5054,5189,5543,5599,5769,5770,5906,5957,6393,6410,6491,7089,8358,8359,8360,8361,8362,8363,8364,8398,8401,8664,9076,9087,10054,10086,10278,11047,11051,11071,11084,11833,11869,14728);


-- Replace Varian with Bolvar
UPDATE `broadcast_text` SET `MaleText`='Who\'s the most popular hero of the realm, you ask?  Well here are the current standings!$B$BThrall: $2200w$BCairne: $2201w$BSylvanas: $2202w$BTotal Horde: $2207w$B$BBolvar: $2203w$BMagni: $2204w$BTyrande: $2205w$BTotal Alliance: $2206w$B$BIf you want to cast your vote, be sure to turn in your gift collections!', `FemaleText`='Who\'s the most popular hero of the realm, you ask?  Well here are the current standings!$B$BThrall: $2200w$BCairne: $2201w$BSylvanas: $2202w$BTotal Horde: $2207w$B$BBolvar: $2203w$BMagni: $2204w$BTyrande: $2205w$BTotal Alliance: $2206w$B$BIf you want to cast your vote, be sure to turn in your gift collections!' WHERE  `ID`=11833;

-- Post Valentines event
REPLACE INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `description`, `hardcoded`, `patch_min`) VALUES (140, '2008-02-15 04:00:00', '2020-12-31 04:00:00', 525600, 10080, 'Love is in the Air - Kwee Peddlefeet Event', 0, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES 
(60100, 140),(60101, 140),(60102, 140),(60103, 140),(60104, 140),(60105, 140);
REPLACE INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (8316, 11857, 1),(8318, 11872, 1);

-- Amorous timer aura
REPLACE INTO `game_event_creature_data`
SELECT guid, id, 0, 0, 27742, 0, 8 FROM creature c  WHERE c.id in (
    SELECT distinct ct.entry FROM creature_template ct 
	WHERE ct.ScriptName LIKE 'npc%citizen' OR 
	      ct.ScriptName = 'guard_darnassus' OR
	      ct.ScriptName = 'guard_ironforge' OR
	      ct.ScriptName = 'guard_orgrimmar' OR
	      ct.ScriptName = 'guard_stormwind' OR
	      ct.ScriptName = 'guard_bluffwatcher' OR
	      ct.ScriptName = 'guard_undercity');
		  
-- Innkeeper Love Aura
REPLACE INTO `game_event_creature_data`
SELECT guid, id, 0, 0, 27741, 0, 8 FROM creature c  WHERE c.id in (
    SELECT distinct ct.entry FROM creature_template ct 
	WHERE ct.entry IN (6740,5111,6929,6741,6746,6735));
	
-- Innkeeper gossip
REPLACE INTO `conditions` VALUES (440, 12, 8, 0); -- Valentines Active
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES (5110,8306,0),(5111,8308,0),(5112,8307,0),(5113,8317,3),(5113,8319,2);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `box_text`, `condition_id`) VALUES 
(342, 5, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(344, 5, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(345, 5, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(1290, 6, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(1296, 6, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(1581, 5, 'Does that heart mean you\'re looking for love?', 11823, 1, 1, 5110, '', 440),
(5110, 0, 'You\'re selling cologne and perfume?', 11825, 1, 1, 5111, '', 0),
(5110, 1, 'What are love tokens?', 11824, 1, 1, 5112, '', 0),
(5110, 2, 'If I make a gift collection, what do I do with it?', 11866, 1, 1, 5113, '', 0),
(5111, 0, 'What can I do with these gifts?', 11828, 1, 1, 5113, '', 0),
(5111, 1, 'What are love tokens?', 11824, 1, 1, 5112, '', 0),
(5112, 0, 'What can I do with these gifts?', 11828, 1, 1, 5113, '', 0),	
(5112, 1, 'You\'re selling cologne and perfume?', 11825, 1, 1, 5111, '', 0),
(5113, 0, 'What are love tokens?', 11824, 1, 1, 5112, '', 0),
(5113, 1, 'You\'re selling cologne and perfume?', 11825, 1, 1, 5111, '', 0);

-- Revealing the Source RP event
UPDATE `quest_template` SET `CompleteScript`=9028 WHERE `entry` in (9028,8984);
REPLACE INTO `creature_template_addon` VALUES (16110, 0, 0, 0, 0, 0, 0, 0, '9617');
DELETE FROM `quest_end_scripts` WHERE `id`=9028;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: Remove Quest Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 1, 10, 16110, 53000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 86.0608, -1717.41, 221.571, 0, 'Apothecary Staffron Lerent: Summon Annalise Lerent');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 2, 0, 0, 0, 0, 0, 16110, 30, 0, 1, 11838, 0, 0, 0, 0, 0, 0, 0, 'Annalise Lerent: Staffron...');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11836, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: Annalise? Is that you?');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 4, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5314290, 'Apothecary Staffron Lerent: Face Annalise');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 8, 0, 0, 0, 0, 0, 16110, 30, 0, 1, 11837, 0, 0, 0, 0, 0, 0, 0, 'Annalise Lerent: My dear Staffron, have you forgotten what it is to love? The love that we once shared?');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11839, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: Have I forgotten? Of course I have... I have forgotten about love, happiness... of life itself.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11840, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: But I do know this - love makes the heart and body weak. It can be exploited. Without your love, I have only my work, Annalise.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 29, 0, 0, 0, 0, 0, 16110, 30, 0, 1, 11841, 0, 0, 0, 0, 0, 0, 0, 'Annalise Lerent: But of course I love you, Staffron. And it pains me to see you suffer so.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 36, 0, 0, 0, 0, 0, 16110, 30, 0, 1, 11842, 0, 0, 0, 0, 0, 0, 0, 'Annalise Lerent: I pledge my love to you forever. Death cannot erase that, even as I am sure that you still remember your love for me.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 43, 0, 0, 0, 0, 0, 16110, 30, 0, 1, 11843, 0, 0, 0, 0, 0, 0, 0, 'Annalise Lerent: And if you do not, then I am truly lost.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11844, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: How could you love me Annalise? Look at me. I am not the man you once knew.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11845, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent says: Annalise? Annalise! No, don\'t leave me!');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11846, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent says: Annalise... You\'re right. I-I can\'t do this. I must find another way.');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 67, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 363373, 'Apothecary Staffron Lerent: Face Cauldron');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 68, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent: Add Quest Flags');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `buddy_id`, `buddy_radius`, `buddy_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (9028, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11847, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Staffron Lerent says: You there. You\'re welcome to take the contents of my cauldron. It was to be the second stage of my plan - amorous clothing.');


-- Bouquet of Roses
REPLACE INTO `creature_loot_template` (`entry`, `item`, `condition_id`) VALUES 
(10811, 22206, 440),(11488, 22206, 440),(10901, 22206, 440),(8929, 22206, 440);



	

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
