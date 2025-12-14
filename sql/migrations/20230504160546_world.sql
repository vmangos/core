DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230504160546');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230504160546');
-- Add your query below.


-- Remove AV start texts from mangos string table.
DELETE FROM `mangos_string` WHERE `entry` IN (784, 785, 786);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
