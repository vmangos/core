DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629164240');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629164240');
-- Add your query below.


-- Create new pool to hold Waterlogged Footlocker spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(461, 6, 'Waterlogged Footlockers in Desolace', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30152, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30153, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30155, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30156, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30157, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30158, 461, 0, 'Waterlogged Footlocker', 1, 10),
(30159, 461, 0, 'Waterlogged Footlocker', 1, 10);

-- Missing Waterlogged Footlocker spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(30160, 179491, 1, -213.577, 2509.56, -18.2651, 0.191985, 0, 0, 0.0958452, 0.995396, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30157 at 38.195759 yards.
(30215, 179491, 1, -204.397, 2678.29, -46.1863, 0.418879, 0, 0, 0.207911, 0.978148, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30158 at 48.600788 yards.
(30216, 179491, 1, -333.115, 2659.91, -21.4116, 2.04204, 0, 0, 0.85264, 0.522499, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30153 at 141.714478 yards.
(30217, 179491, 1, -278.164, 2651.21, -22.2244, 3.76991, 0, 0, -0.951056, 0.309017, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30153 at 92.062836 yards.
(30218, 179491, 1, -246.346, 2691.61, -36.5265, 4.81711, 0, 0, -0.66913, 0.743145, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30158 at 84.716812 yards.
(30219, 179491, 1, -146.758, 2667.33, -67.9032, 0.872664, 0, 0, 0.422618, 0.906308, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30159 at 39.694176 yards.
(30220, 179491, 1, -155.009, 2517.72, -33.9085, 2.9845, 0, 0, 0.996917, 0.0784664, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30156 at 44.074993 yards.
(30221, 179491, 1, -301.695, 2686.36, -21.6071, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 30153 at 133.382843 yards.
(30222, 179491, 1, -143.389, 2474.55, -35.9769, 3.28124, 0, 0, -0.997563, 0.0697661, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 30156 at 85.724800 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(30160, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30215, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30216, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30217, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30218, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30219, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30220, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30221, 461, 0, 'Waterlogged Footlocker', 1, 10), -- Waterlogged Footlockers in Desolace
(30222, 461, 0, 'Waterlogged Footlocker', 1, 10); -- Waterlogged Footlockers in Desolace

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179491;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
