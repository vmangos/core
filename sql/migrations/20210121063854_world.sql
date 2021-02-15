DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210121063854');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210121063854');
-- Add your query below.


-- Add threat for paladin blessings equal to their level.
-- Blessing of Wisdom never generates any threat.
-- https://classic.wowhead.com/guides/lights-bulwark-protection-paladin-tanking
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19740, 4, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19834, 12, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19835, 22, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19836, 32, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19837, 42, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19838, 52, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25291, 60, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19850, 0, 0, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19852, 0, 0, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19853, 0, 0, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19854, 0, 0, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25290, 0, 0, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (20911, 30, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (20912, 40, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (20913, 50, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (20914, 60, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19977, 40, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19978, 50, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (19979, 60, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (1022, 10, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (5599, 24, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (10278, 38, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (6940, 46, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (20729, 54, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (1038, 26, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (1044, 18, 1, 0, 0, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25782, 52, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25916, 60, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25899, 60, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25894, 0, 0, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25918, 0, 0, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25890, 60, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25895, 60, 1, 0, 5086, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (25898, 60, 1, 0, 5086, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
