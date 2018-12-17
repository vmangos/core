DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181217223252');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181217223252');
-- Add your query below.


-- Correct faction of Fenros.
-- http://photobucket.com/gallery/user/AnJaeger/media/cGF0aDovZmVucm9zLmpwZw==/?ref=
UPDATE `creature_template` SET `faction`=24 WHERE `entry`=507;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
