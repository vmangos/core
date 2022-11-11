DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221111192115');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221111192115');
-- Add your query below.

-- Add checks for autoloot hacks.
INSERT INTO `warden_scans` (`id`, `type`, `str`, `data`, `address`, `length`, `result`, `flags`, `penalty`, `comment`) VALUES
	(92, 0, NULL, NULL, 4988623, 4, '741033C9', 6, -1, 'AutoLoot'),
	(93, 0, NULL, NULL, 4992191, 4, '741033C9', 8, -1, 'AutoLoot');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
