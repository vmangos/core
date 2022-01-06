DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211203202918');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211203202918');
-- Add your query below.


-- Add Scripts to Quest Stones of Binding (credit cmangos)
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(15216, 0, 9, 443, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stones of Binding : Stone of East Binding - Respawn Gameobject'),
(16598, 0, 9, 444, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stones of Binding : Stone of Outer Binding - Respawn Gameobject'),
(15398, 0, 9, 445, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stones of Binding : Stone of West Binding - Respawn Gameobject');

INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(651, 0, 9, 446, 62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Stones of Binding : Stone of Inner Binding - Respawn Gameobject');
UPDATE `quest_template` SET `CompleteScript` = 651 WHERE `entry` = 651;

INSERT INTO `gameobject` (`guid`, `id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(30236, 2870, -846.38556, -3268.444, 78.038246, 2.8099754, -62, -62),
(30237, 2870, -1351.0742,-2740.2263, 59.40781, 4.520403, -62, -62),
(30238, 2870, -855.4827, -1783.2532, 39.629177, 4.3109655, -62, -62),
(30239, 2870, -1510.17, -2171.2039, 17.2624, 4.34587, -62, -62);

-- Add Scripts to Quest The Lost Fragments (credit cmangos)
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(692, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.2935, 0, 'The Lost Fragments : Theldurin - Set Orientation'),
(692, 0, 1, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Emote'),
(692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3004, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Talk'),
(692, 4, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.04719, 0, 'The Lost Fragments : Theldurin - Set Orientation');

INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 870, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Talk'),
(692, 4, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Set Stand State'),
(692, 4, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.18879, 0, 'The Lost Fragments : Theldurin - Set Orientation'),
(692, 6, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Set Stand State'),
(692, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 871, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Talk'),
(692, 10, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.168656, 0, 'The Lost Fragments : Theldurin - Set Orientation'),
(692, 10, 19, 0, 0, 0, 0, 0, 0, 0, 0, 1911, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Set Equipment'),
(692, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 872, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Talk'),
(692, 13, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Emote'),
(692, 16, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Lost Fragments : Theldurin - Set Equipment');

UPDATE `quest_template` SET `CompleteScript` = 692, `StartScript` = 692 WHERE `entry` = 692;

-- A Dark Threat Looms
UPDATE `quest_template` SET `CompleteScript` = 283 WHERE `entry` = 283;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (283, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 546, 0, 0, 0, 0, 0, 0, 0, 0, 'A Dark Threat Looms: Chief Engineer Hinderweir VII - Talk');
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 546;

-- The Brokering of Peace Alliance
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8484, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11308, 0, 0, 0, 0, 0, 0, 0, 0, 'The Brokering of Peace: King Magni Bronzebeard - Talk');
UPDATE `quest_template` SET `CompleteScript` = 8484 WHERE `entry` = 8484;
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 11308;

-- The Brokering of Peace Horde
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(8485, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11307, 0, 0, 0, 0, 0, 0, 0, 0, 'The Brokering of Peace: Thrall - Talk');
UPDATE `quest_template` SET `CompleteScript` = 8485 WHERE `entry` = 8485;
UPDATE `broadcast_text` SET `chat_type` = 6 WHERE `entry` = 11307;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
