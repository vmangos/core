DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250504130011');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250504130011');
-- Add your query below.

-- 1.3.0 Patchnotes: Reagent Vendors have been added to Feathermoon Stronghold and Camp Mojache in Feralas.
-- Tarhus <Reagent Vendor> and Jadenvis Seawatcher <Reagent Vendor>
UPDATE `creature_template` SET `patch`=1 WHERE  `entry`=3700 AND `patch`=0;
UPDATE `creature_template` SET `patch`=1 WHERE  `entry`=3500 AND `patch`=0;

UPDATE `creature` SET `patch_min`=1 WHERE  `guid`=50234;
UPDATE `creature` SET `patch_min`=1 WHERE  `guid`=50967;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
