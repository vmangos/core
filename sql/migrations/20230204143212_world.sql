DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230204143212');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230204143212');
-- Add your query below.


-- Remove wrong script to complete quest "The Attack!" after 45 seconds.
DELETE FROM `quest_start_scripts` WHERE `id`=434;
UPDATE `quest_template` SET `StartScript`=0 WHERE `entry`=434;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
