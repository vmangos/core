DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240413115356');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240413115356');
-- Add your query below.


/*
 World of Warcraft Client Patch 1.7.0 (2005-09-13)
 - Shield Slam - Threat caused increased.
*/
-- No data for previous threat values, so just diving them by 2.
-- Tooltip changed from mederate amount to high amount of threat.
DELETE FROM `spell_threat` WHERE `entry` IN (23922, 23923, 23924, 23925);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23922, 89, 1, 0, 4544, 4544);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23923, 101, 1, 0, 4544, 4544);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23924, 114, 1, 0, 4544, 4544);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23925, 127, 1, 0, 4544, 4544);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23922, 178, 1, 0, 4695, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23923, 203, 1, 0, 4695, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23924, 229, 1, 0, 4695, 5875);
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`, `build_min`, `build_max`) VALUES (23925, 254, 1, 0, 4695, 5875);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
