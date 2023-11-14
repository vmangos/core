DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231005233649');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231005233649');
-- Add your query below.


-- Fix Tranquility and Starshards channeling visual disappearing.
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 0x800) WHERE `entry` IN (10797, 19296, 19299, 19302, 19303, 19304, 19305, 22822, 22823, 27636, 740, 8918, 9862, 9863, 21791, 25817, 21793);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
