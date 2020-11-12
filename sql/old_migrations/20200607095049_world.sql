DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200607095049');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200607095049');
-- Add your query below.


-- remove a simple request from anishar
DELETE FROM `creature_questrelation` WHERE `id` = 4215 AND `quest` = 8233;

-- remove a simple request from ormyr flinteye
DELETE FROM `creature_questrelation` WHERE `id` = 5166 AND `quest` = 8233;

-- remove a simple request from Lord Tony Romano
DELETE FROM `creature_questrelation` WHERE `id` = 13283 AND `quest` = 8233;

-- add a simple request to the correct trainers
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(918, 8233, 5, 10),
(4163, 8233, 5, 10),
(5165, 8233, 5, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
