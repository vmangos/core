DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230803012339');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230803012339');
-- Add your query below.

-- Correct spawn coordinate for Blackhand Dreadweaver (UBRS trash group)
UPDATE `creature` SET `position_x`=152.182144, `position_y`=-287.594177, `position_z`=70.949982, `orientation`=0.015293 WHERE `guid`=40265;
UPDATE `creature` SET `position_x`=158.586960, `position_y`=-287.489655, `position_z`=70.949532, `orientation`=3.170264 WHERE `guid`=40264;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
