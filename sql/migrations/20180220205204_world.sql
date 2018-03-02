DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180220205204');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180220205204');
-- Add your query below.


-- Melon in a moonwell
-- https://github.com/LightsHope/server/issues/800

-- Lowered on Z pos from 1299.41
UPDATE `gameobject` SET `position_z`=1298 WHERE  `guid`=50359;


-- Quest: Call of Earth (cosmetic)
-- https://github.com/elysium-project/bug-tracker/issues/61

-- These 3s NPC can use the creature_template_addon entry that the other NPCs are using
-- Removing individual incorrect ones from creature_addon
DELETE FROM `creature_addon` WHERE `guid`=12172 AND `patch`=0;
DELETE FROM `creature_addon` WHERE `guid`=12171 AND `patch`=0;
DELETE FROM `creature_addon` WHERE `guid`=12174 AND `patch`=0;


-- Quest: Call of Fire (cosmetic) 
-- https://github.com/elysium-project/bug-tracker/issues/62

-- Moving NPC back slightly
UPDATE `creature` SET `position_x`=-244.55, `position_y`=-4016.33, `position_z`=187.304413 WHERE `guid`=1184060;

-- Adding same template for this npc entry as for NPCs in the previous issue
INSERT INTO `creature_template_addon` (`entry`, `b2_0_sheath`, `b2_1_flags`, `auras`) VALUES (5893, 1, 16, 8203);


-- Misplaced Quest Objects: Atal'ai Artifact
-- https://github.com/elysium-project/bug-tracker/issues/253

-- 11 locations made reachable
UPDATE `gameobject` SET `position_z`=-10.6 WHERE `guid`=30375;
UPDATE `gameobject` SET `position_z`=-8.5 WHERE `guid`=30378;
UPDATE `gameobject` SET `position_z`=31.54 WHERE `guid`=30380;
UPDATE `gameobject` SET `position_z`=19.86 WHERE `guid`=30383;
UPDATE `gameobject` SET `position_z`=10.63 WHERE `guid`=30541;
UPDATE `gameobject` SET `position_z`=-19.2 WHERE `guid`=30542;
UPDATE `gameobject` SET `position_z`=-17.1 WHERE `guid`=30543;
UPDATE `gameobject` SET `position_z`=-70.65 WHERE `guid`=30559;
UPDATE `gameobject` SET `position_z`=20.20 WHERE `guid`=30587;
UPDATE `gameobject` SET `position_x`=-10536, `position_y`=-3821, `position_z`=-16.58 WHERE `guid`=30593;
UPDATE `gameobject` SET `position_z`=10.55 WHERE `guid`=30594;

-- Gloom weed in air
UPDATE `gameobject` SET `position_z`=44.42 WHERE `guid`=45150;


-- Earthcaller Halmgar is missing the rare tag and hostility.
-- https://github.com/LightsHope/server/issues/948

-- Adding same faction as other NPCs in instance
UPDATE `creature_template` SET `faction_A`=152, `faction_H`=152 WHERE `entry`=4842 AND `patch`=0;
UPDATE `creature_template` SET `rank`=2 WHERE `entry`=4842 AND `patch`=0;


-- Dark Iron Ambassador minions issue
-- https://github.com/LightsHope/server/issues/1060

-- Remove one of the burning servant summons
DELETE FROM `creature_ai_scripts` WHERE `id`=622812;

-- Add mana to Dark Iron Ambassador 
UPDATE `creature_template` SET `minmana`=2457, `maxmana`=2457 WHERE `entry`=6228 AND `patch`=0;

-- Increase the initial delay before the summons in turn summon 3 more mobs, was 2 sec. Now random 5-15 sec
UPDATE `creature_ai_scripts` SET `event_param1`=5000, `event_param2`=15000 WHERE `id`=773801;

-- Reduced the level of npc 7266 (Ember) to be more inline with a level 30 mob (was level 54)
UPDATE `creature_template` SET `minlevel`=30, `maxlevel`=30, `minhealth`=1605, `maxhealth`=1605, `armor`=1061 WHERE `entry`=7266 AND `patch`=0;


-- Quest: Journey to the Crossroads race requirement
-- https://github.com/elysium-project/bug-tracker/issues/379
-- Source: http://web.archive.org/web/20070509115335/http://www.thottbot.com:80/q854
UPDATE `quest_template` SET `RequiredRaces`=32 WHERE `entry`=854 AND `patch`=0;


-- Quest / Mob Bug: Hezrul Bloodmark Cosmetic
-- https://github.com/elysium-project/bug-tracker/issues/170
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES (13992, 13990, 131);
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES (13991, 13990, 131);


-- Dire maul - WEST: Arcane abberration to close
-- https://github.com/elysium-project/bug-tracker/issues/160
-- Source seems legit: https://www.youtube.com/watch?v=PlAfxb1Bfnw&t=23s
-- Diameter of circle from 15y - 22y Also all NPCs now orient outwards

-- Courtyard: mob type swapped positions to match source. 
-- Center coordinate 17.1 277.3
UPDATE `creature` SET `position_x`=28.10, `position_y`=277.30, `orientation`=0.00 WHERE `guid`=84235;
UPDATE `creature` SET `position_x`=24.88, `position_y`=285.08, `orientation`=0.79 WHERE `guid`=84234;
UPDATE `creature` SET `position_x`=17.10, `position_y`=288.30, `orientation`=1.60 WHERE `guid`=84240;
UPDATE `creature` SET `position_x`=9.320, `position_y`=285.08, `orientation`=2.36 WHERE `guid`=84231;
UPDATE `creature` SET `position_x`=6.100, `position_y`=277.30, `orientation`=3.14 WHERE `guid`=84239;
UPDATE `creature` SET `position_x`=9.320, `position_y`=269.52, `orientation`=3.93 WHERE `guid`=339621;
UPDATE `creature` SET `position_x`=17.10, `position_y`=266.30, `position_z`=-6.50, `orientation`=4.71 WHERE `guid`=339622;
UPDATE `creature` SET `position_x`=24.88, `position_y`=269.52, `position_z`=-7.84, `orientation`=5.50 WHERE `guid`=84230;

-- Above stairs
-- Center coordinate 111.5 435.8
UPDATE `creature` SET `position_x`=122.5, `position_y`=435.80, `orientation`=0.00 WHERE `guid`=386945;
UPDATE `creature` SET `position_x`=119.3, `position_y`=443.58, `orientation`=0.79 WHERE `guid`=84221;
UPDATE `creature` SET `position_x`=111.5, `position_y`=446.80, `orientation`=1.57 WHERE `guid`=386943;
UPDATE `creature` SET `position_x`=103.7, `position_y`=443.58, `orientation`=2.36 WHERE `guid`=84222;
UPDATE `creature` SET `position_x`=100.5, `position_y`=435.80, `orientation`=3.14 WHERE `guid`=386202;
UPDATE `creature` SET `position_x`=103.7, `position_y`=428.02, `orientation`=3.93 WHERE `guid`=84219;
UPDATE `creature` SET `position_x`=111.5, `position_y`=424.80, `orientation`=4.71 WHERE `guid`=386200;
UPDATE `creature` SET `position_x`=119.3, `position_y`=428.02, `orientation`=5.50 WHERE `guid`=84220;

-- Other side
-- Center coordinate -85.3 445.0
UPDATE `creature` SET `position_x`=-74.30, `position_y`=445.00, `orientation`=0.00 WHERE `guid`=339619;
UPDATE `creature` SET `position_x`=-77.52, `position_y`=452.78, `orientation`=0.79 WHERE `guid`=84223;
UPDATE `creature` SET `position_x`=-85.30, `position_y`=456.00, `orientation`=1.57 WHERE `guid`=386947;
UPDATE `creature` SET `position_x`=-93.08, `position_y`=452.78, `orientation`=2.36 WHERE `guid`=84224;
UPDATE `creature` SET `position_x`=-96.30, `position_y`=445.00, `orientation`=3.14 WHERE `guid`=339617;
UPDATE `creature` SET `position_x`=-93.08, `position_y`=437.22, `orientation`=3.93 WHERE `guid`=84225;
UPDATE `creature` SET `position_x`=-85.30, `position_y`=434.00, `orientation`=4.71 WHERE `guid`=340122;
UPDATE `creature` SET `position_x`=-77.52, `position_y`=437.22, `orientation`=5.50 WHERE `guid`=84227;

-- Left side inside
-- Center coordinate -130.2 712.8
UPDATE `creature` SET `position_x`=-119.20, `position_y`=712.80, `orientation`=0.00 WHERE `guid`=84215;
UPDATE `creature` SET `position_x`=-122.42, `position_y`=720.58, `orientation`=0.79 WHERE `guid`=386959;
UPDATE `creature` SET `position_x`=-130.20, `position_y`=723.80, `orientation`=1.57 WHERE `guid`=84216;
UPDATE `creature` SET `position_x`=-137.98, `position_y`=720.58, `orientation`=2.36 WHERE `guid`=386961;
UPDATE `creature` SET `position_x`=-141.20, `position_y`=712.80, `orientation`=3.14 WHERE `guid`=84218;
UPDATE `creature` SET `position_x`=-137.98, `position_y`=705.02, `orientation`=3.93 WHERE `guid`=386957;
UPDATE `creature` SET `position_x`=-130.20, `position_y`=701.80, `orientation`=4.71 WHERE `guid`=84214;
UPDATE `creature` SET `position_x`=-122.42, `position_y`=705.02, `orientation`=5.50 WHERE `guid`=386963;

-- Right side inside
-- Center coordinate 70.7 874.6
UPDATE `creature` SET `position_x`=81.70, `position_y`=874.60, `orientation`=0.00 WHERE `guid`=386951;
UPDATE `creature` SET `position_x`=78.48, `position_y`=882.38, `orientation`=0.79 WHERE `guid`=84213;
UPDATE `creature` SET `position_x`=70.70, `position_y`=885.60, `orientation`=1.57 WHERE `guid`=386953;
UPDATE `creature` SET `position_x`=62.92, `position_y`=882.38, `orientation`=2.36 WHERE `guid`=84210;
UPDATE `creature` SET `position_x`=59.70, `position_y`=874.60, `orientation`=3.14 WHERE `guid`=386949;
UPDATE `creature` SET `position_x`=62.92, `position_y`=866.82, `orientation`=3.93 WHERE `guid`=84211;
UPDATE `creature` SET `position_x`=70.70, `position_y`=863.60, `orientation`=4.71 WHERE `guid`=386955;
UPDATE `creature` SET `position_x`=78.48, `position_y`=866.82, `orientation`=5.50 WHERE `guid`=84212;


-- Spawn Huntress Skymane closer to first waypont to remove weird movement
UPDATE `creature` SET `position_x`=9782, `position_y`=2527, `position_z`=1319.3, `orientation`=3.14 WHERE `guid`=46216;


-- Plate and misc. DB issues
-- https://github.com/LightsHope/issues/issues/1

-- Belt of Valor
DELETE FROM `creature_loot_template` WHERE `item` = 16736;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(9268, 16736, 2.0, 0, 1, 1, 0),
(10416, 16736, 2.25, 0, 1, 1, 0),
(10414, 16736, 3.0, 0, 1, 1, 0),
(10417, 16736, 2.25, 0, 1, 1, 0);

-- Lightforge Belt
DELETE FROM `creature_loot_template` WHERE `item` = 16723;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10424, 16723, 1.75, 0, 1, 1, 0),
(10418, 16723, 1.75, 0, 1, 1, 0),
(10408, 16723, 2.25, 0, 1, 1, 0),
(10409, 16723, 2.25, 0, 1, 1, 0);

-- Bracers of Valor
DELETE FROM `creature_loot_template` WHERE `item` = 16735;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10319, 16735, 3, 0, 1, 1, 0),
(9716, 16735, 1.25, 0, 1, 1, 0),
(9259, 16735, 0.75, 0, 1, 1, 0),
(9260, 16735, 1.25, 0, 1, 1, 0),
(9736, 16735, 1.5, 0, 1, 1, 0),	
(9097, 16735, 1.0, 0, 1, 1, 0),
(9267, 16735, 2.0, 0, 1, 1, 0);

-- Lightforge Bracers
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=4 WHERE `entry`=10504 AND `item`=323617 AND `groupid`=2;
DELETE FROM `creature_loot_template` WHERE `item` = 16722;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(10487, 16722, 3.0, 0, 1, 1, 0),
(10486, 16722, 2.0, 0, 1, 1, 0);

-- Imperfect Draenethyst Fragment
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=1 WHERE `item`=10593 AND `groupid`=0;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=5 WHERE `entry`=7664 AND `item`=10593 AND `groupid`=0;

-- Flawless Draenethyst Sphere
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=7666 AND `item`=8244 AND `groupid`=0;
REPLACE INTO `creature_loot_template` (`entry`,`item`,`ChanceOrQuestChance`,`groupid`,`mincountOrRef`,`maxcount`,`condition_id`) VALUES 
(7664, 8244, 0.5, 0, 1, 1, 0),
(8296, 8244, 0.2, 0, 1, 1, 0),
(7667, 8244, 0.2, 0, 1, 1, 0);

-- Ogre Forged Hauberk
DELETE FROM `creature_loot_template` WHERE `entry`=13036 AND `item`=18530 AND `groupid`=0;


-- Typo in Blood of Innocents
-- https://github.com/elysium-project/bug-tracker/issues/419
-- Source: http://web.archive.org/web/20070330051426/http://thottbot.com:80/q1066
UPDATE `quest_template` SET `RequestItemsText`='Did you find the Syndicate Shadow Mages, and collect from them the blood?' WHERE `entry`=1066 AND `patch`=0;


-- Incorrect kill criteria for quest "Job Opening: Guard Captain of Revantusk Village"
-- https://github.com/elysium-project/bug-tracker/issues/450
-- Source: https://web.archive.org/web/20060614155851/http://thottbot.com:80/?qu=7862
UPDATE `quest_template` SET `ReqCreatureOrGOCount1`=20, `ReqCreatureOrGOCount2`=20, `ReqCreatureOrGOCount3`=20, `ReqCreatureOrGOCount4`=20 WHERE `entry`=7862 AND `patch`=3;
UPDATE `quest_template` SET `Objectives`='You have been tasked with the decimation of 20 Vilebranch Berserkers, 20 Vilebranch Shadow Hunters, 20 Vilebranch Blood Drinkers, and 20 Vilebranch Soul Eaters.$B$BShould you complete this task, return to Primal Torntusk at Revantusk Village in the Hinterlands.' WHERE `entry`=7862 AND `patch`=3;


-- Correct static name - http://web.archive.org/web/20070315150520/http://www.thottbot.com:80/q6571
UPDATE `quest_template` SET `OfferRewardText`='Excellent, $N. You\'ve saved me a lot of work!$b$bBut don\'t think that I\'m not grateful!' WHERE `entry`=6571 AND `patch`=0;


-- Prereq for quests
-- https://github.com/cmangos/classic-db/commit/54d798b9c9d039c89c364b03a8d34a8d8d2d9a03
-- The Everstill Bridge Confirmed - http://web.archive.org/web/20070317172531/http://www.thottbot.com:80/q89
UPDATE `quest_template` SET `NextQuestInChain`=89 WHERE `entry`=125 AND `patch`=0;
UPDATE `quest_template` SET `PrevQuestId`=125 WHERE `entry`=89 AND `patch`=0;


-- https://github.com/classicdb/database/pull/485
-- Confirmed for npc: 14229 - Give NPC same sword as nearby Naga QAkvast
-- Add Accursed Slitherblade's missing weapon.
UPDATE `creature_template` SET `equipment_id`=639 WHERE entry=14229;


-- Quest item can only be obtained with pickpocketing
-- https://github.com/cmangos/classic-db/commit/6e501c3da4e03cd0568f3579cbeee93bedfa64c7
-- Confirmed: http://web.archive.org/web/20070315145928/http://www.thottbot.com:80/q2206
-- Still works well item is re-spawning  
DELETE FROM `creature_loot_template` WHERE `entry`=6846 AND `item`=7675 AND `groupid`=0;

-- Fix startup error introduced by this migration.
UPDATE `creature` SET `curmana`=1926 WHERE `guid`=590004;
DELETE FROM `creature_groups` WHERE `memberGUID`=1176471;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
