DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171125011235');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171125011235');
-- Add your query below.

-- https://github.com/LightsHope/server/issues/204
UPDATE `item_template` SET `spellppmRate_1`=1 WHERE `entry`=11684;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
