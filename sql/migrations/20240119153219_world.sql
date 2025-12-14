DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240119153219');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240119153219');
-- Add your query below.


-- Mark all totems as immune to aoe and taunt.
UPDATE `creature_template` SET `immunity_flags`=3 WHERE `type`=11;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
