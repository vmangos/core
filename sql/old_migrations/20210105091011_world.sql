DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210105091011');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210105091011');
-- Add your query below.


-- Fix gameobjects
UPDATE `gameobject_template` SET `size`='0.3', `data10`='29518' WHERE  `entry`=181597 AND `patch`=10;
UPDATE `gameobject_template` SET `data10`='29518' WHERE  `entry`=181598 AND `patch`=10;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
