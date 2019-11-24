DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191124202846');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191124202846');
-- Add your query below.


-- Black Shield
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=20992;

-- Theramore Guard Badge
UPDATE `gameobject_template` SET `faction`=35 WHERE `entry`=21042;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
