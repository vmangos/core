DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200514201421');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200514201421');
-- Add your query below.


-- add missing quest Feathermoon Stronghold (7494) to Crier Goodman (2198) and Herald Moonstalker (10878)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(10878, 7494, 1, 10),
(2198, 7494, 1, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
