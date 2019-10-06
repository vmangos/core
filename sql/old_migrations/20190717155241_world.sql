DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190717155241');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190717155241');
-- Add your query below.


-- Remove incorrect resistances for the Kolkar Clan.
UPDATE `creature_template` SET `fire_res` = 0, `shadow_res` = 0 WHERE `entry` IN (12977, 4636, 3397, 4637, 3119, 9524, 3275, 4634, 3120, 3274, 4633, 3273, 9523, 12976, 4635, 4632);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
