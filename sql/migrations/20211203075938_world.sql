DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211203075938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211203075938');
-- Add your query below.


-- Start script for quest Azsharite.
DELETE FROM `quest_start_scripts` WHERE `id`=3602;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4576, 0, 0, 0, 0, 0, 0, 0, 0, 'Azsharite: Loramus Thalipedes - Say Text');
UPDATE `quest_template` SET `StartScript`=3602 WHERE `entry`=3602;

-- This text should be whispered.
UPDATE `broadcast_text` SET `chat_type`=4 WHERE `entry`=4576;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
