DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200501192147');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200501192147');
-- Add your query below.


-- Onyxia
UPDATE `creature_template` SET `dmg_min`=1648, `dmg_max`=2184, `armor`=4691 WHERE `entry`=10184;
-- Lucifron
UPDATE `creature_template` SET `dmg_min`=1636, `dmg_max`=2165, `armor`=3795 WHERE `entry`=12118;
-- Magmadar
UPDATE `creature_template` SET `dmg_min`=1867, `dmg_max`=2475, `armor`=4691 WHERE `entry`=11982;
-- Gehennas
UPDATE `creature_template` SET `dmg_min`=1636, `dmg_max`=2165, `armor`=3795 WHERE `entry`=12259;
-- Garr
UPDATE `creature_template` SET `dmg_min`=1977, `dmg_max`=2621, `armor`=4691 WHERE `entry`=12057;
-- Shazzrah
UPDATE `creature_template` SET `dmg_min`=1636, `dmg_max`=2165, `armor`=3795 WHERE `entry`=12264;
-- Baron Geddon
UPDATE `creature_template` SET `dmg_min`=1538, `dmg_max`=2039, `armor`=4691 WHERE `entry`=12056;
-- Golemagg the Incinerator
UPDATE `creature_template` SET `dmg_min`=2197, `dmg_max`=2912, `armor`=4691 WHERE `entry`=11988;
-- Sulfuron Harbinger
UPDATE `creature_template` SET `dmg_min`=1757, `dmg_max`=2330, `armor`=5840 WHERE `entry`=12098;
-- Majordomo Executus
UPDATE `creature_template` SET `dmg_min`=1538, `dmg_max`=2039, `armor`=4691 WHERE `entry`=12018;
-- Ragnaros
UPDATE `creature_template` SET `dmg_min`=1999, `dmg_max`=2650, `armor`=4691 WHERE `entry`=11502;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
