DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231223014105');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231223014105');
-- Add your query below.


-- Remove unusued quest scripts.
DELETE FROM `quest_start_scripts` WHERE `id` IN (945, 3447);
DELETE FROM `quest_end_scripts` WHERE `id` IN (2952, 4603, 4604, 5058);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
