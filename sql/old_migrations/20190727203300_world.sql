DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190727203300');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190727203300');
-- Add your query below.


-- Correct name of pvp vendor rooms.
UPDATE `map_template` SET `map_name`='Champions\' Hall' WHERE `entry`=449;
UPDATE `map_template` SET `map_name`='Hall of Legends' WHERE `entry`=450;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
