DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241015082928');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241015082928');
-- Add your query below.


-- Add missing relations for quest Mortal Champions.
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`) VALUES (15503, 8579, 7);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`) VALUES (15503, 8579, 7);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
