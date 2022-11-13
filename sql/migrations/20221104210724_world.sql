DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221104210724');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221104210724');
-- Add your query below.


-- Correct damage and auras for Explosive Sheep.
UPDATE `creature_template` SET `damage_multiplier`=1, `auras`='4051 8327' WHERE `entry`=2675;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
