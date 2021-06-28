DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210327011645');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210327011645');
-- Add your query below.

-- Sirra Von'Indi shouldn't say anything on "Translation To Ello" start.
-- https://www.youtube.com/watch?v=L5KffZOUbCQ
DELETE FROM `quest_start_scripts` WHERE `id` = 252;
UPDATE `quest_template` SET `StartScript` = 0 WHERE `entry` = 252;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
