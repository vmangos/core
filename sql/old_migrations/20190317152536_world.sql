DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190317152536');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190317152536');
-- Add your query below.


-- Add waypoints for Motega Firemane.
-- https://github.com/vmangos/core/issues/162
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE `guid` = 21693 AND `id` = 10428;
DELETE FROM `creature_movement` WHERE `id` = 21693;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `emote`) VALUES
(21693, 1, -4915.57, -1381.18, -52.6008, 5.14872, 60000, 23),
(21693, 2, -4913.27, -1379.59, -52.6119, 0, 0, 0),
(21693, 3, -4911.95, -1376.93, -52.6119, 0, 0, 0),
(21693, 4, -4913.82, -1376.04, -52.6119, 3.044563, 15000, 0),
(21693, 5, -4915.75, -1378.4, -52.6119, 0, 0, 0),
(21693, 6, -4918.77, -1378.01, -52.6119, 0, 0, 0);

-- Add missing gossip menu for Earthcaller Franzahl.
-- https://github.com/cmangos/classic-db/commit/303f5d05d8c76dfbaeea9db9b38c0c5e8f267e12
-- Target has item Bindings of the Windseeker.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(306, 2, 18563, 1),
(307, 2, 18564, 1),
(311, -2, 306, 307);
-- Missing npc text entries.
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES
(6986, 9577, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6987, 9579, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6988, 9581, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6989, 9583, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Use temporary gossip entry as actual one is not known
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(50309, 6985, 0),
(50310, 6986, 0),
(50311, 6987, 0),
(50312, 6988, 0),
(50313, 6989, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES
(50309, 0, 0, 'Are you the Earthshaper capable of creating Elementium?', 9576, 1, 1, 50310, 0, 0, 0, 0, NULL, 0, 311),
(50310, 0, 0, 'What do you know of it, Franzahl?', 9578, 1, 1, 50311, 0, 0, 0, 0, NULL, 0, 0),
(50311, 0, 0, 'A fissure?', 9580, 1, 1, 50312, 0, 0, 0, 0, NULL, 0, 0),
(50312, 0, 0, 'So what happened?', 9582, 1, 1, 50313, 0, 0, 0, 0, NULL, 0, 0);
-- Assign gossip menu to creature.
DELETE FROM npc_gossip WHERE npc_guid=40995;
UPDATE `creature_template` SET `gossip_menu_id`=50309 WHERE `entry`=14348;

-- Remove Spirit Healers for graveyards added in TBC.
-- https://github.com/cmangos/classic-db/commit/eafcb028d37dce93652ab6e97fb8d130a5d7a2f7
DELETE FROM `creature` WHERE `guid` IN (6876, 5752);
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (6876, 5752);

-- Correct drop chance and assign conditions for first two chapters of Draconic for Dummies.
-- https://github.com/cmangos/classic-db/commit/36e46578f44c910ddd6e9848fda258c346e6dcb1
-- Draconic for Dummies Chapter I
UPDATE `creature_loot_template` SET `condition_id`=9 WHERE `item`=21103;
-- Draconic for Dummies Chapter II
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=6 WHERE `item`=21104 AND `entry`=12396;

-- Add missing passive auras for Tutenkash.
-- https://github.com/cmangos/classic-db/commit/c02a5131930c04e7b0a0fa2fca6ad726c025cac9
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (73550, 'Razorfen Downs - Tuten\'kash', 12252, 100, 4, 0, 0, 32, 3, 5, 6, 8, 0, 12255, 100, 0, 0, 0, 1, 9, 14, 15, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (7355, '8876 12254');
-- Add missing passive aura to Ribbly's Crony.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-94cb51e8696d9a81da1121b65c9fc71bR13998
UPDATE `creature_addon` SET `auras`='13299' WHERE `guid`=46616;
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (10043, '13299');
-- Add missing passive aura to Cave Creeper.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-94cb51e8696d9a81da1121b65c9fc71bR13786
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (8933, '13299');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (89330, 'Blackrock Depths - Cave Creeper', 745, 90, 4, 0, 0, 0, 3, 7, 8, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- Add missing passive aura to Witherbark Venomblood.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-331be05cc93f4d4e39beed217c820dc6R2
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=2652);
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (2652, 0, 0, 0, 1, 16, 0, 0, '3235 10022');
-- Add missing passive aura to Wildspawn Rogue.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-331be05cc93f4d4e39beed217c820dc6R6
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (11452, '13299');
-- Add missing passive aura to Putridus Trickster.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-331be05cc93f4d4e39beed217c820dc6R7
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1179102);
DELETE FROM `creature_ai_events` WHERE `creature_id`=11791;
UPDATE `creature_template_addon` SET `auras`='3417 13299' WHERE `entry`=11791;
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=11791);
REPLACE INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (54647, 0, 0, 0, 1, 16, 0, 0, '3417 13299 21157');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (117910, 'Maraudon - Putridus Trickster', 15657, 100, 1, 0, 0, 0, 5, 8, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=11791;
-- Add missing passive aura to Deathclasp.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-331be05cc93f4d4e39beed217c820dc6R8
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=15196);
INSERT INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (15196, 6, 0, 0, 1, 16, 0, 0, '13299');
-- Add missing passive aura to Undead Scarab.
-- https://github.com/cmangos/classic-db/commit/f88b5f653281c19cd25429a0f9c42873989f0b91#diff-331be05cc93f4d4e39beed217c820dc6R13
INSERT INTO `creature_template_addon` (`entry`, `auras`) VALUES (10876, '13299');

-- Make Doctor Weavil's Flying Machine able to fly.
-- https://github.com/cmangos/classic-db/commit/8eafb14041c507c5cf39cb1536578e202a051fc5
UPDATE `creature_template` SET `inhabit_type`=4 WHERE entry=15553;

-- Add missing gossip text for Narain Soothfancy.
-- https://github.com/cmangos/classic-db/commit/8eafb14041c507c5cf39cb1536578e202a051fc5
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1972, 2, 21130, 1, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1973, -1, 9, 1972, 0, 0, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES (7884, 11116, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO gossip_menu VALUES (6646, 7884, 1973);
DELETE FROM `npc_gossip` WHERE `npc_guid`=21822;
UPDATE `creature_template` SET `gossip_menu_id`=6646 WHERE `entry`=11811;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
