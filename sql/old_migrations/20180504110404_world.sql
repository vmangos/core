DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180504110404');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180504110404');
-- Add your query below.

-- Necro Stalker immune to CC
UPDATE `creature_template` SET `MechanicImmuneMask` = 1023393531 WHERE `entry` = 16453;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
