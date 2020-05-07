DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200506172006');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200506172006');
-- Add your query below.


-- add correct reputation requirement for harpy hide quiver
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (500, 5, 730, 6, 0, 0, 0);
UPDATE `npc_vendor` SET `condition_id` = 500 WHERE `item` = 19319 AND `entry` IN (13217, 13216);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
