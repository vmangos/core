DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230320180317');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230320180317');
-- Add your query below.


-- Add missing completion script for quest The Affray.
DELETE FROM `quest_end_scripts` WHERE `id`=1719;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2354, 0, 0, 0, 0, 0, 0, 0, 0, 'The Affray: Klannoc Macleod - Yell Text');
UPDATE `quest_template` SET `CompleteScript` = 1719 WHERE `entry` = 1719;
UPDATE `broadcast_text` SET `chat_type`=1, `emote_id1`=22 WHERE `entry`=2354;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
