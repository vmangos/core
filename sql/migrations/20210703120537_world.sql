DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210703120537');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210703120537');
-- Add your query below.


-- Correct Gossip For Darnassus NPCs
UPDATE `gossip_menu` SET `text_id` = 8255 WHERE `entry` IN (
269,
347,
347,
347,
361,
436,
1007,
1293,
1403,
1482,
1581,
1581,
1581,
1630,
1662,
1922,
2021,
2404,
2541,
2561,
2662,
3072,
3131,
3185,
3643,
3923,
3924,
4008,
4009,
4019,
4019,
4046,
4092,
4113,
4114,
4124,
4125,
4131,
4133,
4155,
4163,
4164,
4174,
4181,
4204,
4211,
4241,
4263,
4269,
4301,
4302,
4303,
4304,
4305,
4308,
4308,
4349,
4571,
4572,
4573,
4576,
4576,
4576,
4578,
4579,
4581,
4621,
4688,
4689,
4691,
4691,
4693,
4694,
4697,
4744,
4783,
4783,
4783,
4783,
4821,
4821,
4863,
5273,
5665,
5665,
5741,
5782,
5853,
5855,
5855,
6044,
6563,
6787,
6803,
6803,
6944,
6944,
6944,
6944,
6944,
6944,
6944,
6944,
6944,
9096,
9198,
9199,
9200,
9209,
9214,
9215,
9216,
9217,
9218,
9219,
9220,
9221,
9222,
9223,
9224,
9225,
9226,
9227,
9231,
9232,
9233,
9234,
9235,
9236,
9237,
9238,
9239,
9240,
9241,
9242,
9243,
9244,
9245,
9246,
9247,
9315,
9439,
9453,
9458,
9468,
9489,
9492,
9494,
9505,
9524,
9538,
9574,
9575
)
AND `text_id` = 8244;


UPDATE `creature_template` SET `ai_name` = 'EventAI' WHERE `entry` IN (14378, 14379, 14380);
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437801, 14378, 0, 10, 0, 100, 1, 2, 30, 10000, 10000, 1437801, 0, 0, 'Huntress Skymane - Add Aura Love is in the Air on Enter Los');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437801, 0, 74, 27741, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 471, 'Huntress Skymane - Add Aura Love is in the Air');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1437901, 14379, 0, 10, 0, 100, 1, 2, 30, 10000, 10000, 1437901, 0, 0, 'Huntress Ravenoak - Add Aura Love is in the Air on Enter Los');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1437901, 0, 74, 27741, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 471, 'Huntress Ravenoak - Add Aura Love is in the Air');

INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1438001, 14380, 0, 10, 0, 100, 1, 2, 30, 10000, 10000, 1438001, 0, 0, 'Huntress Leafrunner - Add Aura Love is in the Air on Enter Los');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1438001, 0, 74, 27741, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 471, 'Huntress Leafrunner - Add Aura Love is in the Air');







UPDATE `creature_template` SET `ai_name`='' WHERE `entry` IN (4090, 11401, 7740, 7313, 4091, 4165);



-- Events list for Astarii Starseeker
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001262);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 4090;
DELETE FROM `gossip_menu` WHERE `entry` = 4691 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298, 4092);




-- Events list for Tyrande Whisperwind
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001639);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 7999;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (799901, 7999, 0, 4, 0, 100, 0, 0, 0, 0, 0, 799901, 0, 0, 'Tyrande Whisperwind - Play Sound 5885 on Aggro');




-- Events list for Priestess Alathea
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001715);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 11401;
DELETE FROM `gossip_menu` WHERE `entry` = 4691 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);





-- Events list for Gracina Spiritmight
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001629);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 7740;
DELETE FROM `gossip_menu` WHERE `entry` = 9494 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);


-- Events list for Priestess A'moora
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001626);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 7313;
DELETE FROM `gossip_menu` WHERE `entry` = 9492 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);





-- Events list for Lariia
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001264);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 4092;
DELETE FROM `gossip_menu` WHERE `entry` = 4572 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);



-- Events list for Jandria
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001263);
DELETE FROM `creature_ai_events` WHERE `creature_id` = 4091;
DELETE FROM `gossip_menu` WHERE `entry` = 4573 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);



-- Events list for Elissa Dumas
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3001273);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4165;
DELETE FROM `gossip_menu` WHERE `entry` = 4821 AND `text_id` IN (8255, 8283, 8285, 8291, 8296, 8298);




-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
