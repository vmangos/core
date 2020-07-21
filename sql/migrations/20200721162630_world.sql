DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200721162630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200721162630');
-- Add your query below.


-- correct faction for plague spreader (604)
UPDATE `creature_template` SET `faction` = 21 WHERE `entry` = 604;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
