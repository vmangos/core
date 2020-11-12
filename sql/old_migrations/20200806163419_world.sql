DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200806163419');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200806163419');
-- Add your query below.


-- Revert data from patch 1.13 that were using non-(yet)-existing content. Use patch 1.12 and later expansion values
UPDATE `gameobject_template` SET `data0`=4, `data2`=2061 WHERE `entry` IN (126337, 126338, 126339, 126340, 126341, 126342, 126345, 151951);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
