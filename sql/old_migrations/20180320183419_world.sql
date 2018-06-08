DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180320183419');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180320183419');
-- Add your query below.

-- Correct error in previous quality fix 
UPDATE `creature_template_addon` SET `emote`=0 WHERE `entry`=705 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
