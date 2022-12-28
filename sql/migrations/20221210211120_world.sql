DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221210211120');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221210211120');
-- Add your query below.


-- J'eevee should be immune to both players and creatures.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=14500;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
