DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200521043151');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200521043151');
-- Add your query below.


-- Fix size of a few Tauren NPCs so they match other Tauren size
UPDATE `creature_template` SET `scale`=1.35 WHERE `entry` IN (7725, 7726, 7727, 10758, 10759, 11911, 11912, 11913);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
