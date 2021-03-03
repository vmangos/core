DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210201011631');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210201011631');
-- Add your query below.

-- Add nature immunity to some lava elementals.
-- Rumbling Exile
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=2592;
-- Magma Lord Bokk
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=16043;
-- Smoldar
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=8278;
-- Molten elemental
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=11321;
-- Magma elemental
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=5855;
-- Enraged Stone Spirit
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=4034;
-- Furious Stone Spirit
UPDATE `creature_template` SET `school_immune_mask`='8' WHERE  `entry`=4035;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
