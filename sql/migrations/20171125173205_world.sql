DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171125173205');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171125173205');
-- Add your query below.


-- https://github.com/LightsHope/server/issues/569
DELETE FROM `creature_groups` WHERE `memberGUID`=57025;

-- https://github.com/LightsHope/server/issues/617
UPDATE `creature` SET `spawntimesecs`=432000 WHERE `guid`=53086;

-- https://github.com/LightsHope/server/issues/634
UPDATE `spell_proc_event` SET `procFlags`=1024 WHERE `entry`=23582;

-- https://github.com/LightsHope/server/issues/638
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=35 WHERE `entry`=6212 AND `item`=9326;

-- Call of the Water: Start event when starting part 7
UPDATE `quest_template` SET `CompleteScript`=0 WHERE `entry`=63 AND `patch`=0;
UPDATE `quest_template` SET `StartScript`=100 WHERE `entry`=100 AND `patch`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=63;
DELETE FROM `quest_start_scripts` WHERE `id`=100;
REPLACE INTO `quest_start_scripts` VALUES (100, 15, 10, 5895, 180000, 0, 0, 2, 0, 0, 0, 0, 417.05, 1822.39, 13.007, 0.035, '');
REPLACE INTO `quest_start_scripts` VALUES (100, 15, 9, 15176, 180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `quest_start_scripts` VALUES (100, 0, 9, 15175, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- https://github.com/LightsHope/server/issues/671
REPLACE INTO `spell_effect_mod` (`Id`, `EffectMiscValue`, `Comment`) VALUES (19559, 3, 'Pathfinding Speed Increase : fix SpellMod (SPELLMOD_EFFECT1)');

-- https://github.com/LightsHope/server/issues/258
UPDATE `item_template` SET `AllowableClass`=-1 WHERE `entry`=12662;

-- MC window entrance for Alliance
UPDATE `areatrigger_teleport` SET `required_quest_done`=7848 WHERE `id`=3529;

-- https://github.com/LightsHope/server/issues/639
UPDATE `creature_template` SET `PetSpellDataId`=9477 WHERE  `entry`=3619 AND `patch`=0;

-- https://github.com/LightsHope/server/issues/663
UPDATE `creature` SET `position_x`=-7302.71, `position_y`=-373.976, `position_z`=-268.664 WHERE  `guid`=24506;

-- https://github.com/LightsHope/server/issues/701
REPLACE INTO `spell_chain` VALUES (3043, 0, 3043, 1, 0);
REPLACE INTO `spell_chain` VALUES (14275, 3043, 3043, 2, 0);
REPLACE INTO `spell_chain` VALUES (14276, 14275, 3043, 3, 0);
REPLACE INTO `spell_chain` VALUES (14277, 14276, 3043, 4, 0);

-- https://github.com/LightsHope/server/issues/598
UPDATE `creature_template` SET `rank`=2 WHERE  `entry`=14475;

-- https://github.com/LightsHope/server/issues/602
DELETE FROM `creature_movement` WHERE `id`=24767 AND `point`=1;
DELETE FROM `creature_movement` WHERE `id`=26625 AND `point`=1;
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=24767;
UPDATE `creature` SET `MovementType`=0 WHERE `guid`=26625;

-- https://github.com/LightsHope/server/issues/729
UPDATE `quest_template` SET `Title`='Savage Flora' WHERE `entry`=9136;

-- https://github.com/LightsHope/server/issues/756
UPDATE `quest_template` SET `Title`='The Principal Source' WHERE  `entry`=6127 AND `patch`=0;

-- https://github.com/LightsHope/server/issues/783
REPLACE INTO `quest_template` VALUES (8874, 7, 2, -366, 1, 0, 70, 0, 0, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 8870, 8867, 0, 0, 0, 'The Lunar Festival', 'It\'s that time of the year, $N!  The Cenarion Circle invites all denizens of Azeroth to partake in our celebration of the Lunar Festival.  You will find the Lunar Festival Harbinger in this very city at a location marked by a blessed circle of moonlight.  She can tell you more about the holiday.', 'Talk to the Lunar Festival Harbinger in the entrance to the Undercity. You can also talk to Lunar Festival Harbingers in other capital cities.', 'Welcome, $N. Are you here to join in the festivities?', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 609, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_questrelation` VALUES (15891, 8874, 7);
REPLACE INTO `creature_involvedrelation` VALUES (15895, 8874, 7);

-- https://github.com/LightsHope/server/issues/698
UPDATE `gameobject_template` SET `data2`=196608 WHERE `entry`=175369;

-- Spooky skelingtons no xp
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry`=14826;

-- ZHC proc flags
UPDATE `spell_proc_event` SET `procFlags`=81920, `procEx`=524291 WHERE `entry`=24658;

-- Remove Twilight Corrupter permanent spawn
DELETE FROM `creature` WHERE `guid`=1179144;

-- https://github.com/LightsHope/server/issues/541
UPDATE `game_graveyard_zone` SET `id`=429 WHERE `id`=853 AND `ghost_zone`=1497;
UPDATE `game_graveyard_zone` SET `id`=429 WHERE `id`=629 AND `ghost_zone`=85;

-- https://github.com/LightsHope/server/issues/721
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `condition_id`) VALUES (322083, 13148, 0, 1, 4027);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `condition_id`) VALUES (322083, 13164, 0, 1, 4027);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
