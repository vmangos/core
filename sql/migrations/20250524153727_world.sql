DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250524153727');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250524153727');
-- Add your query below.

-- Fix missing loot for Jade
INSERT INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id, patch_min, patch_max) 
VALUES (1063, 30072, 39, 0, -30072, 1, 0, 0, 10);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
