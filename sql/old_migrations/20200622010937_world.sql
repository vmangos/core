DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200622010937');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200622010937');
-- Add your query below.


-- Taim Ragetotem <Alterac Valley Battlemaster>, Thunderbluff
UPDATE `creature` SET `position_x`=-1384.38, `position_y`=-98.4701, `position_z`=159.018, `orientation`=2.93215 WHERE `guid`=24670; 

-- Horde Warbringer, Thunderbluff
UPDATE `creature` SET `position_x`=-1381.13, `position_y`=-87.0034, `position_z`=159.532, `orientation`=3.14159 WHERE `guid`=26901; 


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
