DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200720182006');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200720182006');
-- Add your query below.


-- remove quest warlords command (4903) from warlord goretooth (9077)
DELETE FROM `creature_questrelation` WHERE `quest` = 4903 AND `id` = 9077


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
