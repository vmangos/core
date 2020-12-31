DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200405011030');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200405011030');
-- Add your query below.


-- Increase reset time limit for OOX escort quests.
UPDATE `quest_start_scripts` SET `datalong2`=2400 WHERE `command`=61 && `id` IN (648, 836, 2767);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
