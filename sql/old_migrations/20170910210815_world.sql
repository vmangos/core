DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170910210815');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170910210815');
-- Add your query below.


-- Renamed from french
UPDATE `creature_template`
   SET `ScriptName` = 'npc_crimson_guardsman'
 WHERE `entry` = 10418;

-- Add movement to Timmy
UPDATE `creature_template`
   SET `MovementType` = 2
 WHERE `entry` = 10808;

INSERT INTO `creature_movement_template`(`entry`, `point`,
                                         `position_x`, `position_y`, `position_z`,
                                         `script_id`, `orientation`)
VALUES (10808, 1, 3614.7, -3187.64, 131.406, 11, 100),
       (10808, 2, 3614.7, -3187.64, 131.406, 0, 100),
       (10808, 3, 3643.04, -3202.96, 128.386, 0, 100),
       (10808, 4, 3667.77, -3207.47, 126.829, 13, 100),
       (10808, 5, 3687.95, -3196.14, 127.191, 0, 100),
       (10808, 6, 3698.67, -3175.77, 127.238, 0, 100),
       (10808, 7, 3696.27, -3155.81, 127.465, 0, 100),
       (10808, 8, 3681.1, -3154.65, 127.124, 0, 100),
       (10808, 9, 3672.27, -3166.2, 126.668, 0, 100),
       (10808, 10, 3677.42, -3174.55, 126.343, 0, 100),
       (10808, 11, 3684.80, -3176.73, 126.586, 0, 100),
       (10808, 12, 3692.54, -3177.11, 126.922, 0, 100),
       (10808, 13, 3697.09, -3165.99, 127.209, 0, 100),
       (10808, 14, 3693.52, -3156.76, 127.294, 0, 100),
       (10808, 15, 3682.33, -3156.29, 127.009, 0, 100),
       (10808, 16, 3672.98, -3168.33, 126.499, 0, 100),
       (10808, 17, 3678.39, -3174.43, 126.348, 0, 100),
       (10808, 18, 3692.2, -3176.01, 126.915, 0, 100),
       (10808, 19, 3694.37, -3153.05, 127.531, 1026404, 100);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

