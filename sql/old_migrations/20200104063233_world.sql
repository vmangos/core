DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200104063233');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200104063233');
-- Add your query below.


-- Add missing Holiday Snow spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES 
(42013, 178609, 0, 661.045, -738.719, 168.735, 2.07133, 0, 0, 0.860202, 0.509953, 60, 60, 100, 1, 0, 0, 0, 10),
(42095, 178609, 0, 720.502, -561.526, 163.923, 3.97826, 0, 0, 0.913767, -0.406238, 60, 60, 100, 1, 0, 0, 0, 10),
(42096, 178609, 0, 757.241, -641.389, 148.618, 2.47972, 0, 0, 0.945739, 0.324928, 60, 60, 100, 1, 0, 0, 0, 10),
(42099, 178609, 0, 820.255, -510.763, 141.258, 5.70222, 0, 0, 0.286415, -0.958106, 60, 60, 100, 1, 0, 0, 0, 10),
(42100, 178609, 0, 816.769, -448.034, 134.027, 0.173806, 0, 0, 0.0867936, 0.996226, 60, 60, 100, 1, 0, 0, 0, 10),
(42101, 178609, 0, 882.519, -504.546, 134.552, 4.24296, 0, 0, 0.852167, -0.52327, 60, 60, 100, 1, 0, 0, 0, 10),
(42102, 178609, 0, 658.46, -556.084, 171.215, 4.7733, 0, 0, 0.685245, -0.728312, 60, 60, 100, 1, 0, 0, 0, 10);
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(42013, 2),
(42095, 2),
(42096, 2),
(42099, 2),
(42100, 2),
(42101, 2),
(42102, 2);

-- Correct count of Snowballs in Holiday Snow.
UPDATE `gameobject_loot_template` SET `mincountOrRef`=3, `maxcount`=6 WHERE `entry`=15540 && `item`=17202;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
