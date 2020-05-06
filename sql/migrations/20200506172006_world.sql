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
UPDATE `item_template` SET `required_reputation_rank` = 6 WHERE `entry` = 19319;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
