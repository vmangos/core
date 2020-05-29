DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200513164519');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200513164519');
-- Add your query below.


-- Correct spawn position of Grel'borg the Miser.
UPDATE `creature` SET `position_x`=484.117, `position_y`=-212.956, `position_z`=145.449, `orientation`=1.34361 WHERE `id`=2417;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
