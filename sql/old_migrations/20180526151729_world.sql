DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180526151729');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180526151729');
-- Add your query below.

UPDATE `creature_template` SET `minlevel`='62' WHERE `entry`='11673'; -- Ancient Core Hound
UPDATE `creature_template` SET `minlevel`='61' WHERE `entry`='11668'; -- Firelord
UPDATE `creature_template` SET `minlevel`='62' WHERE `entry`='11658'; -- Molten Giant
UPDATE `creature_template` SET `minlevel`='63' WHERE `entry`='11659'; -- Molten Destroyer
UPDATE `creature_template` SET `minlevel`='62' WHERE `entry`='11664'; -- Flamewaker Elite

DELETE FROM `gameobject` WHERE `guid` IN (43162, 43164); -- duplicates

UPDATE `gameobject_template` SET `name`='Molten Core Circle BARON' WHERE `entry`='178188';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
