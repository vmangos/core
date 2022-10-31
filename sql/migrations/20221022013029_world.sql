DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221022013029');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221022013029');
-- Add your query below.


-- Correct position of Warsong Alliance Spirit Guide
UPDATE `creature` SET  `position_x` = 1423.22, `position_y` = 1554.66, `position_z` = 342.834, `orientation` = 3.12414 WHERE `guid` = 150000;
-- Correct position of Warsong Horde Spirit Guide
UPDATE `creature` SET  `position_x` = 1034.7, `position_y` = 1387.85, `position_z` = 340.694, `orientation` = 3.19395 WHERE `guid` = 150001;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
