DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171012210802');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171012210802');
-- Add your query below.


-- Your Fortune Awaits quest chests
-- https://github.com/elysium-project/server/issues/2776
REPLACE INTO `gameobject_template` VALUES (180055, 2, 51, 'Mysterious Wailing Caverns Chest', 0, 4, 0.3, 93, 7944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `gameobject_involvedrelation` (`id`, `quest`, `patch`) VALUES (180055, 7944, 4);
REPLACE INTO `gameobject` VALUES (18926, 180055, 43, -105.449, 166.904, -78.9907, 4.91957, 0, 0, 0.966546, -0.256494, 0, 100, 1, 0, 0);
REPLACE INTO `gameobject` VALUES (18927, 180024, 36, -32.736, -374.034, 59, 3, 0, 0, 0.997495, 0.0707372, 0, 100, 1, 0, 0);
UPDATE `gameobject_template` SET `size`=0.3 WHERE  `entry`=180024;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
