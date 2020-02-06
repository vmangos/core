DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200110163203');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200110163203');
-- Add your query below.


-- Correct loot for Battered Chest (2843).
DELETE FROM `gameobject_loot_template` WHERE `entry`=2265;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(2265, 159, 36, 0, 1, 2, 0, 0, 10),
(2265, 117, 19, 1, 1, 2, 0, 0, 10),
(2265, 4536, 19, 1, 1, 2, 0, 0, 10),
(2265, 4540, 19, 1, 1, 2, 0, 0, 10),
(2265, 2070, 18, 1, 1, 2, 0, 0, 10),
(2265, 1364, 0, 2, 1, 1, 0, 0, 10),
(2265, 1366, 0, 2, 1, 1, 0, 0, 10),
(2265, 1367, 0, 2, 1, 1, 0, 0, 10),
(2265, 1368, 0, 2, 1, 1, 0, 0, 10),
(2265, 1369, 0, 2, 1, 1, 0, 0, 10),
(2265, 1370, 0, 2, 1, 1, 0, 0, 10),
(2265, 1372, 0, 2, 1, 1, 0, 0, 10),
(2265, 1374, 0, 2, 1, 1, 0, 0, 10),
(2265, 1376, 0, 2, 1, 1, 0, 0, 10),
(2265, 1377, 0, 2, 1, 1, 0, 0, 10),
(2265, 1378, 0, 2, 1, 1, 0, 0, 10),
(2265, 1380, 0, 2, 1, 1, 0, 0, 10),
(2265, 2210, 0, 2, 1, 1, 0, 0, 10),
(2265, 2211, 0, 2, 1, 1, 0, 0, 10),
(2265, 2649, 0, 2, 1, 1, 0, 0, 10),
(2265, 2650, 0, 2, 1, 1, 0, 0, 10),
(2265, 2651, 0, 2, 1, 1, 0, 0, 10),
(2265, 2652, 0, 2, 1, 1, 0, 0, 10),
(2265, 2653, 0, 2, 1, 1, 0, 0, 10),
(2265, 2654, 0, 2, 1, 1, 0, 0, 10),
(2265, 2656, 0, 2, 1, 1, 0, 0, 10),
(2265, 3363, 0, 2, 1, 1, 0, 0, 10),
(2265, 3365, 0, 2, 1, 1, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
