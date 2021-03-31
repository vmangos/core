DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210306215029');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210306215029');
-- Add your query below.


-- Aggro range for mobs in starting zones is lower than normal.
UPDATE `creature_template` SET `detection_range`=9.5 WHERE `entry` IN (6, 38, 69, 80, 103, 257, 299, 704, 705, 706, 707, 708, 724, 808, 946, 1501, 1502, 1504, 1505, 1506, 1507, 1508, 1509, 1512, 1513, 1667, 1688, 1890, 1916, 1917, 1918, 1919, 1984, 1985, 1986, 1988, 1989, 1994, 2031, 2032, 2952, 2953, 2954, 2955, 2961, 2966, 3098, 3101, 3102, 3124, 3183, 3229, 3281, 3300, 8554);

-- Aggro range for most mobs in classic is around 3-4 yards lower than our current default.
UPDATE `creature_template` SET `detection_range`=16 WHERE `detection_range`=20 && `rank`=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
