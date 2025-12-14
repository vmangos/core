DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240617091421');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240617091421');
-- Add your query below.


-- Remove skinning loot from Mother Smolderweb.
UPDATE `creature_template` SET `skinning_loot_id`=0 WHERE `entry`=10596;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
