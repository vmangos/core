DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221004145201');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221004145201');
-- Add your query below.


-- Correct PPM of Jeklik's Crusher.
-- https://old.reddit.com/r/classicwow/comments/gxsawo/jekliks_crusher_stats_2024_chanceonhit_4ppm_its/
UPDATE `item_template` SET `spellppmrate_1`=4 WHERE `entry`=19918;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
