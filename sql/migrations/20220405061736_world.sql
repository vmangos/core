DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220405061736');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220405061736');
-- Add your query below.


 DELETE FROM `gameobject` WHERE `guid`= 99805;
 
 
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
