DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180724234049');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180724234049');
-- Add your query below.

-- Remove UNIT_FLAG_IMMUNE_TO_PLAYER from rest of Dungeon Set 2 Bosses
-- Lord Valthalak
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16042;
-- Mor Grayhoof
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16080;
-- Isalien
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16097;
-- Jarien
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16101;
-- Sothos
UPDATE `creature_template` SET `unit_flags`=`unit_flags` & ~0x100 WHERE `entry`=16102;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
