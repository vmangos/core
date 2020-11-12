DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200510212037');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200510212037');
-- Add your query below.


-- Fix damage of Lava Annihilator.
UPDATE `creature_template` SET `dmg_multiplier`=1 WHERE `entry`=11665;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
