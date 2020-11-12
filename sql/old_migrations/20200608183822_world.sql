DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200608183822');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200608183822');
-- Add your query below.


-- correct position of justine demalier
UPDATE `creature` SET `position_x` = -8825.5, `position_y` = 630.778, `position_z` = 94.1948, `orientation` = 3.82227 WHERE `id` = 12481;

-- correct position of melgris malagan
UPDATE `creature` SET `position_x` = -8824.71, `position_y` = 629.821, `position_z` = 94.1077, `orientation` = 4.03171 WHERE `id` = 12480;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
