DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230320180317');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230320180317');
-- Add your query below.

UPDATE `quest_template` SET `CompleteScript` = 1719 WHERE `entry` = 1719;

DELETE FROM `quest_end_scripts` WHERE `id`=1719;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1719, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 2354, 0, 0, 0, 0, 0, 0, 0, 0, 'Klannoc Macleod - Zone Yell - Champion of The Affray');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
