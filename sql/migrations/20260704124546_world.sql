DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260704124546');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260704124546');
-- Add your query below.


-- Fix creatures not facing their target
UPDATE `creature_addon` SET `emote_state` = 0 WHERE `guid` IN (49199, 53247, 53282, 6854, 27675, 27681, 27683, 27684, 27685);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
