DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230221132045');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230221132045');
-- Add your query below.


-- Correct faction for Larva Spewer.
UPDATE `gameobject_template` SET `faction`=14, `script_name`='' WHERE `entry`=178559;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
