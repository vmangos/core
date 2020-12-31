DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201031190701');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201031190701');
-- Add your query below.


-- Delete some bad creature addon entries.
DELETE FROM `creature_addon` WHERE `guid`=80419;
DELETE FROM `creature_template_addon` WHERE `entry` IN (157, 454, 728, 731, 3862, 5427, 7384, 7456, 8960, 9696, 10200, 11361, 14832, 16117, 7550, 7560);
DELETE FROM `creature_template_addon` WHERE `mount`=0 && `bytes1`=0 && `b2_0_sheath`=0 && `b2_1_flags`=0 && `emote`=0 && `moveflags`=0 && ((`auras`='') || (`auras` IS NULL));


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
