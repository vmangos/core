DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230628181319');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230628181319');
-- Add your query below.


-- Create new pool to hold Battered Footlocker spawns in Badlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(411, 1, 'Battered Footlockers in Badlands', 1, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11454, 411, 0, 'Battered Footlocker', 1, 10),
(11470, 411, 0, 'Battered Footlocker', 1, 10),
(11471, 411, 0, 'Battered Footlocker', 1, 10),
(11472, 411, 0, 'Battered Footlocker', 1, 10),
(11474, 411, 0, 'Battered Footlocker', 1, 10),
(11475, 411, 0, 'Battered Footlocker', 1, 10);

-- Missing Battered Footlocker spawns in Badlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11457, 179490, 0, -6366.63, -3155.48, 302.5, 0.872664, 0, 0, 0.422618, 0.906308, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11454 at 20.817059 yards.
(11473, 179490, 0, -6377.31, -3097.08, 293.056, 0.0349062, 0, 0, 0.0174522, 0.999848, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11472 at 20.251705 yards.
(11481, 179490, 0, -6345.96, -3079.82, 310.834, 0.401425, 0, 0, 0.199368, 0.979925, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11470 at 10.440856 yards.
(11483, 179490, 0, -6380.58, -3131.48, 301.111, 5.20108, 0, 0, -0.515038, 0.857168, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11475 at 23.541855 yards.
(11488, 179490, 0, -6345.52, -3077.57, 301.389, 5.55015, 0, 0, -0.358368, 0.93358, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11470 at 15.524481 yards.
(11491, 179490, 0, -6326.67, -3093.85, 301.389, 2.44346, 0, 0, 0.939692, 0.34202, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11474 at 17.731228 yards.
(11492, 179490, 0, -6349.29, -3122.93, 301.111, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11474 at 31.215763 yards.
(11494, 179490, 0, -6333.51, -3095.75, 310.834, 0.872664, 0, 0, 0.422618, 0.906308, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11474 at 16.276421 yards.
(11495, 179490, 0, -6342.15, -3131.68, 310.836, 2.40855, 0, 0, 0.93358, 0.358368, 180, 180, 1, 100, 1, 10), -- Closest existing guid is 11474 at 29.834326 yards.
(11502, 179490, 0, -6343.21, -3094.27, 301.111, 4.03171, 0, 0, -0.902585, 0.430512, 180, 180, 1, 100, 1, 10); -- Closest existing guid is 11470 at 16.360876 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(11457, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11473, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11481, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11483, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11488, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11491, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11492, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11494, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11495, 411, 0, 'Battered Footlocker', 1, 10), -- Battered Footlockers in Badlands
(11502, 411, 0, 'Battered Footlocker', 1, 10); -- Battered Footlockers in Badlands

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179490;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
