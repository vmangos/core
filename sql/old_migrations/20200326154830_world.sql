DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326154830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326154830');
-- Add your query below.


-- Correct givers for quest Cenarion Aid.
DELETE FROM `creature_questrelation` WHERE `quest`=8254;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (5489, 8254, 5, 10);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (6018, 8254, 5, 10);
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (11406, 8254, 5, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
