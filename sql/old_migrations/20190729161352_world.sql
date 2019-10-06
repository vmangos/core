DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190729161352');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190729161352');
-- Add your query below.


-- Azurous: Immune to Arcane. Immune to Fear.
UPDATE `creature_template` SET `school_immune_mask`=64, `mechanic_immune_mask`=16 WHERE `entry`=10202;

-- Spellmaw: Immune to Arcane. Immune to Fear, Silence, Snare, Stun.
UPDATE `creature_template` SET `school_immune_mask`=64, `mechanic_immune_mask`=16+256+1024+2048 WHERE `entry`=10662;

-- Manaclaw: Immune to Arcane. Immune to Root, Snare, Freeze.
UPDATE `creature_template` SET `school_immune_mask`=64, `mechanic_immune_mask`=64+1024+4096 WHERE `entry`=10663;
UPDATE `creature_template_addon` SET `auras` = '17010' WHERE `entry` = 10663;

-- Scryer: Immune to Arcane.
UPDATE `creature_template` SET `school_immune_mask`=64 WHERE `entry`=10664;
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (10664, 0, 0, 0, 1, 16, 0, 0, '8279 18943');
DELETE FROM `creature_addon` WHERE `guid`=42267;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
