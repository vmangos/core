DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180304085813');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180304085813');
-- Add your query below.


-- Defias Enchanter is not an elite
UPDATE `creature_template` SET `rank`=0 WHERE `entry`=910;

-- Fix walk speed for Bloodvenom Post Brave
UPDATE `creature_template` SET `speed_walk`=1 WHERE `entry`=11180;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
