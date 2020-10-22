DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200813180957');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200813180957');
-- Add your query below.

-- Set proper patch for Pattern: Heavy Leather Ball
UPDATE `item_template` SET `patch`=2 WHERE `entry`=18731;
INSERT INTO `forbidden_items` VALUES (18731, 1, 1);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
