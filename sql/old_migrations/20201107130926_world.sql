DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201107130926');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201107130926');
-- Add your query below.


-- Spirit Healer
UPDATE `creature_template_addon` SET `auras`='10848 9036' WHERE `entry`=6491;
-- Horde Spirit Guide
INSERT INTO `creature_template_addon` (`entry`, `patch`, `auras`) VALUES (13117, 3, '9036 9617');
-- Alliance Spirit Guide
INSERT INTO `creature_template_addon` (`entry`, `patch`, `auras`) VALUES (13116, 3, '9036 9617');
-- Kodo Spirit
INSERT INTO `creature_template_addon` (`entry`, `patch`, `auras`) VALUES (10988, 0, '9036');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
