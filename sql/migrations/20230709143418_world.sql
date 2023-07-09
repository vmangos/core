DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230709143418');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230709143418');
-- Add your query below.


-- Correctly Pool Scarlet Monastery Graveyard
SET @OGUID = 220252;
SET @PTEMPLATE = 14309;

DELETE FROM `gameobject` WHERE `guid` IN (25434, 25448, 25435, 11870, 25449, 25436, 11872);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75296, 189, 1748.22, 1252.28, 18.1573, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75296, 189, 1762.11, 1153.56, 7.49028, 4.72984, 0, 0, -0.700909, 0.713251, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75296, 189, 1788.14, 1394.66, -0.455138, 2.63544, 0, 0, 0.968147, 0.250381, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75296, 189, 1847.77, 1276.34, 18.1573, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75299, 189, 1748.22, 1252.28, 18.1573, 5.70723, 0, 0, -0.284015, 0.95882, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75299, 189, 1762.11, 1153.56, 7.49028, 4.72984, 0, 0, -0.700909, 0.713251, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75299, 189, 1788.14, 1394.66, -0.455138, 2.63544, 0, 0, 0.968147, 0.250381, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75299, 189, 1847.77, 1276.34, 18.1573, 2.80998, 0, 0, 0.986285, 0.16505, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+5, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+6, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+7, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10),
(@OGUID+8, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Scarlet Monastery Graveyard - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 0),
(@PTEMPLATE+2, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 0),
(@PTEMPLATE+3, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 0),
(@PTEMPLATE+4, @PTEMPLATE+5, 0, 'Large Iron Bound Chest / Large Solid Chest - Scarlet Monastery Graveyard', 0);

-- Correctly Pool Stockades
SET @OGUID = 5764;
SET @PTEMPLATE = 21500;

DELETE FROM `pool_template` WHERE `entry` = 21500;
DELETE FROM `pool_pool` WHERE `mother_pool` = 21500;
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (31963, 32162, 25464, 25465, 25466, 25467, 26178, 26179, 31964, 25468, 25469, 25470));
DELETE FROM `gameobject` WHERE `guid` IN (31963, 32162, 25464, 25465, 25466, 25467, 26178, 26179, 31964, 25468, 25469, 25470);
DELETE FROM `pool_gameobject` WHERE `guid` IN (31963, 32162, 25464, 25465, 25466, 25467, 26178, 26179, 31964, 25468, 25469, 25470);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75298, 34, 104.455, 77.2554, -34.8562, -0.366519, 0, 0, 0.182236, -0.983255, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75298, 34, 165.322, 57.6663, -34.8562, 2.9147, 0, 0, 0.993572, 0.113203, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75298, 34, 90.5921, -145.882, -33.9396, 1.44862, 0, 0, 0.66262, 0.748956, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75298, 34, 92.3032, -56.1773, -34.8562, 6.07375, 0, 0, -0.104528, 0.994522, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75298, 34, 146.967, -121.079, -33.9396, 3.50812, 0, 0, -0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75298, 34, 151.69, -65.131, -34.8562, 5.09636, 0, 0, -0.559193, 0.829038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75298, 34, 188.603, 81.585, -33.9396, 2.47837, 0, 0, 0.945519, 0.325568, 36000, 36000, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75298, 34, 173.185, 146.955, -33.9396, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 75295, 34, 104.455, 77.2554, -34.8562, -0.366519, 0, 0, 0.182236, -0.983255, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 75295, 34, 165.322, 57.6663, -34.8562, 2.9147, 0, 0, 0.993572, 0.113203, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 75295, 34, 90.5921, -145.882, -33.9396, 1.44862, 0, 0, 0.66262, 0.748956, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 75295, 34, 92.3032, -56.1773, -34.8562, 6.07375, 0, 0, -0.104528, 0.994522, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 75295, 34, 146.967, -121.079, -33.9396, 3.50812, 0, 0, -0.983254, 0.182238, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 75295, 34, 151.69, -65.131, -34.8562, 5.09636, 0, 0, -0.559193, 0.829038, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 75295, 34, 188.603, 81.585, -33.9396, 2.47837, 0, 0, 0.945519, 0.325568, 36000, 36000, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 75295, 34, 173.185, 146.955, -33.9396, 4.2237, 0, 0, -0.857167, 0.515038, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+5, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+6, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+7, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@PTEMPLATE+8, 1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+6, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+7, @PTEMPLATE+7, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+8, @PTEMPLATE+8, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+9, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+10, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+11, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+12, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+13, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+14, @PTEMPLATE+6, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+15, @PTEMPLATE+7, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10),
(@OGUID+16, @PTEMPLATE+8, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 3, 'Stockades - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+2, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+3, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+4, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+5, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+6, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+7, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0),
(@PTEMPLATE+8, @PTEMPLATE+9, 0, 'Large Iron Bound Chest / Large Solid Chest - Stockades', 0);

-- Remove Empty Pool Pools
DELETE FROM `pool_pool` WHERE `mother_pool` IN ( 21401, 21410, 21411, 21412, 21413, 21414, 21415, 21402, 21403, 21404, 21405, 21406, 21407, 21408, 21409, 21551, 21560, 21561, 21562, 21563, 21564, 21565, 21566, 21567, 21568, 21569, 21552, 21570, 21553, 21554, 21555, 21556, 21557, 21558, 21559, 21451, 21460, 21461, 21462, 21463, 21464, 21465, 21466, 21467, 21468, 21469, 21452, 21470, 21471, 21472, 21473, 21474, 21475, 21476, 21477, 21478, 21453, 21454, 21455, 21456, 21457, 21458, 21459, 21601, 21610, 21611, 21612, 21613, 21614, 21615, 21602, 21603, 21604, 21605, 21606, 21607, 21608, 21609, 21651, 21652, 21653, 21654, 21655, 21656, 21657);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
