DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230703190626');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230703190626');
-- Add your query below.


SET @OGUID = 17034;
SET @PTEMPLATE = 76;

-- 3 Badlands 3706 / 3707 Barrel of Sweet Nectar / Food Crate
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (11476, 11448, 11441, 11439, 11430, 11426));
DELETE FROM `gameobject` WHERE `guid` IN (11476, 11448, 11441, 11439, 11430, 11426);
DELETE FROM `pool_gameobject` WHERE `guid` IN (11476, 11448, 11441, 11439, 11430, 11426);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3706, 0, -7003.62, -3349.16, 241.669, 0.174533, 0, 0, 0.087156, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3706, 0, -6909.22, -2463.66, 245.296, -0.593412, 0, 0, 0.292372, -0.956305, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3706, 0, -6620.87, -2736.17, 244.859, 2.56563, 0, 0, 0.95882, 0.284015, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3706, 0, -6453.15, -3382.33, 241.694, -0.349066, 0, 0, 0.173648, -0.984808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3706, 0, -6364.81, -3079.97, 300.279, -0.558505, 0, 0, 0.275637, -0.961262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3706, 0, -6335.1, -3072.2, 310.834, 1.0821, 0, 0, 0.515038, 0.857167, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3706, 0, -7313.35, -2288.05, 255.595, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3706, 0, -7139.74, -2424.63, 240.539, 3.21142, 0, 0, -0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 3706, 0, -6835.26, -3643.86, 253.034, 4.01426, 0, 0, -0.906307, 0.422619, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 3706, 0, -6823.95, -2806.37, 242.512, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 3706, 0, -6762.43, -3132.37, 241.163, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 3706, 0, -6606.04, -3416.66, 279.3, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 3706, 0, -6394.96, -3419.59, 241.667, 0.314158, 0, 0, 0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 3706, 0, -6385.35, -3105.95, 310.836, 4.10153, 0, 0, -0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 3706, 0, -6377.72, -3127.71, 283.889, 4.59022, 0, 0, -0.748956, 0.66262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 3706, 0, -6351.81, -3106.18, 285.277, 2.3911, 0, 0, 0.930417, 0.366502, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 3706, 0, -6333.82, -3113.54, 299.723, 0.95993, 0, 0, 0.461748, 0.887011, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 3707, 0, -7003.62, -3349.16, 241.669, 0.174533, 0, 0, 0.087156, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 3707, 0, -6909.22, -2463.66, 245.296, -0.593412, 0, 0, 0.292372, -0.956305, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 3707, 0, -6620.87, -2736.17, 244.859, 2.56563, 0, 0, 0.95882, 0.284015, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 3707, 0, -6453.15, -3382.33, 241.694, -0.349066, 0, 0, 0.173648, -0.984808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 3707, 0, -6364.81, -3079.97, 300.279, -0.558505, 0, 0, 0.275637, -0.961262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 3707, 0, -6335.1, -3072.2, 310.834, 1.0821, 0, 0, 0.515038, 0.857167, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 3707, 0, -7313.35, -2288.05, 255.595, 3.80482, 0, 0, -0.945518, 0.325568, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 3707, 0, -7139.74, -2424.63, 240.539, 3.21142, 0, 0, -0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 3707, 0, -6835.26, -3643.86, 253.034, 4.01426, 0, 0, -0.906307, 0.422619, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 3707, 0, -6823.95, -2806.37, 242.512, 1.29154, 0, 0, 0.601814, 0.798636, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 3707, 0, -6762.43, -3132.37, 241.163, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 3707, 0, -6606.04, -3416.66, 279.3, 3.03684, 0, 0, 0.998629, 0.0523532, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 3707, 0, -6394.96, -3419.59, 241.667, 0.314158, 0, 0, 0.156434, 0.987688, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 3707, 0, -6385.35, -3105.95, 310.836, 4.10153, 0, 0, -0.887011, 0.461749, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 3707, 0, -6377.72, -3127.71, 283.889, 4.59022, 0, 0, -0.748956, 0.66262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 3707, 0, -6351.81, -3106.18, 285.277, 2.3911, 0, 0, 0.930417, 0.366502, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 3707, 0, -6333.82, -3113.54, 299.723, 0.95993, 0, 0, 0.461748, 0.887011, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+3, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+4, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+5, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+6, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+7, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+8, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+9, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+10, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+11, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+12, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+13, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+14, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+15, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+16, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@PTEMPLATE+17, 1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+6, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+7, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+8, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+9, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+10, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+11, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+12, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+13, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+14, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+15, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+16, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+17, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+18, @PTEMPLATE+1, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+19, @PTEMPLATE+2, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+20, @PTEMPLATE+3, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+21, @PTEMPLATE+4, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+22, @PTEMPLATE+5, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+23, @PTEMPLATE+6, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+24, @PTEMPLATE+7, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+25, @PTEMPLATE+8, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+26, @PTEMPLATE+9, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+27, @PTEMPLATE+10, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+28, @PTEMPLATE+11, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+29, @PTEMPLATE+12, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+30, @PTEMPLATE+13, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+31, @PTEMPLATE+14, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+32, @PTEMPLATE+15, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+33, @PTEMPLATE+16, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10),
(@OGUID+34, @PTEMPLATE+17, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 7, 'Badlands - Barrel of Sweet Nectar / Food Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+2, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+3, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+4, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+5, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+6, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+7, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+8, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+9, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+10, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+11, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+12, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+13, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+14, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+15, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+16, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0),
(@PTEMPLATE+17, @PTEMPLATE+18, 0, 'Barrel of Sweet Nectar / Food Crate - Badlands', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
