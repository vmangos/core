DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251031173104');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251031173104');
-- Add your query below.


-- Remove wrong text said at the end of Skirmish at Echo Ridge.
-- This text should be said upon accepting Report to Goldshire.
-- Proof: https://www.youtube.com/watch?v=SH3HhIsDZ4k&t=373s
DELETE FROM `quest_end_scripts` WHERE `id`=21;
UPDATE `quest_template` SET `CompleteScript`=0 WHERE `entry`=21;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
