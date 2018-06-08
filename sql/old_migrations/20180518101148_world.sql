DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180518101148');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180518101148');
-- Add your query below.


-- Fix quest givers becoming uninteractable.
UPDATE `quest_end_scripts` SET `target_param1`=0, `target_param2`=0, `target_type`=0, `data_flags`=0 WHERE (`target_param1` != 0) && (`command` = 4) && (`id` != 308);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
