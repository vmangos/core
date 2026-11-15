DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261107212919');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261107212919');
-- Add your query below.

-- Add EPL Alternative Spawns
-- Corins Crossing
-- remove duplicate creatures
DELETE FROM `creature` WHERE `guid` IN (92609, 92373, 92369, 92841, 92597);

-- Dark Caster / Hate Shrieker / Vile Tutor / Dark Summoner
UPDATE `creature` SET `id` = 8526, `id2` = 8541, `id3` = 8548, `id4` = 8551 WHERE `id` IN (8526, 8548);
UPDATE `creature` SET `id` = 8526, `id2` = 8541, `id3` = 8548, `id4` = 8551 WHERE `guid` IN (92843, 92842, 92240, 92528, 92523, 92368, 92844, 92372, 92540, 92536);

-- Scourge Warder / Gibbering Ghoul / Hate Shrieker / Stitched Horror
UPDATE `creature` SET `id` = 8525, `id2` = 8531, `id3` = 8541, `id4` = 8543 WHERE `id` IN (8531);
UPDATE `creature` SET `id` = 8525, `id2` = 8531, `id3` = 8541, `id4` = 8543 WHERE `guid` IN ( 92604, 92602, 92605, 92603, 92703, 92718, 92718, 92779, 92613, 92840, 92525, 92835, 92640, 92635, 92636, 92645, 92595, 92596, 92599, 92608);

-- Scourge Guard / Diseased Flayer
UPDATE `creature` SET `id` = 8527, `id2` = 8532 WHERE `id` IN (8527);
UPDATE `creature` SET `id` = 8527, `id2` = 8532 WHERE `guid` IN (92202, 92185, 92194, 92189, 92186, 92182, 92197, 92195);

-- Plaguewood
-- Scourge Soldier / Cursed Mage / Cannibal Ghoul / Torn Screamer
UPDATE `creature` SET `id` = 8523, `id2` = 8524, `id3` = 8530, `id4` = 8540 WHERE `id` IN (8523, 8524, 8530, 8540);

-- Hate Shrieker / Stitched Horror
UPDATE `creature` SET `id` = 8541, `id2` = 8543 WHERE `guid` IN (85493, 91854, 92001, 92007, 92164, 92210, 92250, 92259, 92839, 54624, 69691, 78682, 84955, 85495, 86294, 86295, 86404, 86865, 90488, 91833, 91847, 91852, 91873, 91894, 91901, 91909, 91943, 91945, 92006, 92009, 92012, 92013, 92015, 92068, 92071, 92165, 92168, 92229, 92243, 92267, 92272, 92275, 92278, 92371, 92630);

-- Zul Mashar
-- Mossflayer Scout / Mossflayer Cannibal / Mossflayer Shadowhunter
UPDATE `creature` SET `id` = 8560, `id2` = 8561, `id3` = 8562 WHERE `id` IN (8560, 8561, 8562) AND `guid` NOT IN ( 91965, 69710, 53742, 92124, 91966, 91964, 56696, 91959, 53743, 91962, 91963, 54594);
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Tinkee Steamboil Missing Gossip
-- 273: Target Has Done Quest 4734
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (273, 8, 4734, 0, 0, 0, 0);
-- 274:  Not (Target Has 1 Stacks of Item 12144 In Inventory Or Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (274, 23, 12144, 1, 0, 0, 1);
-- 275: (273: Target Has Done Quest 4734) And (274:  Not (Target Has 1 Stacks of Item 12144 In Inventory Or Bank))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (275, -1, 273, 274, 0, 0, 0);

INSERT INTO gossip_menu (entry, text_id, script_id, condition_id) VALUES
(2602, 3295, 0, 273);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(2602, 0, 0, 'I\'m going back to the Rookery, Tinkee.  I need an Eggscilliscope!', 5553, 1, 1, -1, 0, 2602, 0, 0, '', 0, 275);

INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2602, 0, 0, 15, 16029, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tinkee Steamboil - Cast Create Eggscilliscope');
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Add Catalogue of the Wayward Start Script
 UPDATE `quest_template` SET `StartScript`=5164 WHERE  `entry`=5164 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id`=5164;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5164, 1, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.174533, 0, 'Catalogue of the Wayward: Jeziba - Orientation'),
(5164, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6332, 0, 0, 0, 0, 0, 0, 0, 0, 'Catalogue of the Wayward: Jeziba - Talk'),
(5164, 3, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Catalogue of the Wayward: Jeziba - Emote'),
(5164, 5, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.38594, 0, 'Catalogue of the Wayward: Jeziba - Orientation');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
