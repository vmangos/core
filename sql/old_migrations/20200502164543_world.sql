DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200502164543');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200502164543');
-- Add your query below.


-- Cenarion Emissary Blackhoof correct location
UPDATE `creature` SET `position_x` = 1658.711, `position_y` = -4348.799, `position_z` = 29.25742, `orientation` = 4.39823 WHERE `guid` = 6504;

-- Grinkle correct location
UPDATE `creature` SET `position_x` = 1592.611, `position_y` = -4416.818, `position_z` = 9.398685, `orientation` = 2.949606 WHERE `guid` = 54742;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
