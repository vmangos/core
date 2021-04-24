DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200811173020');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200811173020');
-- Add your query below.


-- add emote none to quest end script 931 the shimmering frond
DELETE FROM `quest_end_scripts` WHERE `id`=931;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (931, 5, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 9504.74, 717.48, 1256.45, 2.57, 0, 'Denalan - Move');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (931, 7, 1, 28, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Denalan - Emote Work');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (931, 10, 9, 30276, 600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Denalan - Respawn Object');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (931, 10, 1, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Denalan - Emote None');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (931, 12, 3, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 9506.92, 713.766, 1255.89, 0.279253, 0, 'Denalan - Move');

-- Object ID: 6752 - add gossip text
DELETE FROM `gossip_menu` WHERE `entry` = 542 AND `text_id` = 1059;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(542, 1059, 0);

-- Object ID: 6751 - add gossip text
DELETE FROM `gossip_menu` WHERE `entry` = 543 AND `text_id` = 1060;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(543, 1060, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
