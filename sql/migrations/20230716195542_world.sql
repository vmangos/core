DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230716195542');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230716195542');
-- Add your query below.


-- Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands
DELETE FROM `pool_gameobject` WHERE `guid` = 25331;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(324, 1735, 0, -864.812, -3980.47, 149.623, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2218, 1, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(324, 2218, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10),
(25331, 2218, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);

DELETE FROM `pool_gameobject` WHERE `guid` = 25330;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(325, 1735, 0, -847.617, -3965.75, 150.471, 0.226892, 0, 0, 0.113203, 0.993572, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2219, 1, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(325, 2219, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10),
(25330, 2219, 'Lesser Bloodstone Deposit / Iron Deposit - Arathi Highlands', 10);

DELETE FROM `pool_gameobject` WHERE `guid` = 25339;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(326, 2040, 0, -874.558, -3911.16, 134.068, 5.3058, 0, 0, -0.469471, 0.882948, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2220, 1, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(326, 2220, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10),
(25339, 2220, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10);

DELETE FROM `pool_gameobject` WHERE `guid` = 25340;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(327, 2040, 0, -857.528, -3931.43, 149.044, 6.07375, 0, 0, -0.104528, 0.994522, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2221, 1, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(327, 2221, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10),
(25340, 2221, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(2222, 1, 'Arathi Highlands - Lesser Bloodstone Deposit / Mithril Deposit / Iron Deposit (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2218, 2222, 0, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 0),
(2219, 2222, 0, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 0),
(2220, 2222, 0, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 0),
(2221, 2222, 0, 'Lesser Bloodstone Deposit / Mithril Deposit - Arathi Highlands', 0);

UPDATE `gameobject` SET `id` = 1735 WHERE `guid` = 20295;

-- Iron Deposit / Mithril Deposit - Dustwallow Marsh
DELETE FROM `pool_gameobject` WHERE `guid` = 220415;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(328, 1735, 1, -4346.2, -3005.47, 35.1079, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(2223, 1, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(328, 2223, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10),
(220415, 2223, 'Iron Deposit / Mithril Deposit - Dustwallow Marsh', 10);

UPDATE `gameobject` SET `id` = 2047 WHERE `guid` = 28017;

UPDATE `gameobject` SET `id` = 324 WHERE `guid` = 261642;

-- Correct position of Mageroyal in Durotar (position is off by 0.270046 yards).
UPDATE `gameobject` SET `position_x`=1001.31, `position_y`=-4820.73, `position_z`=16.7528, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=2097;

-- Missing Mageroyal spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33491, 1620, 0, -10918.7, -1349.68, 54.6477, 2.32129, 0, 0, 0.91706, 0.39875, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 33486 at 115.718697 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33491, 1116, 0, 'Mageroyal', 0, 10); -- Mageroyal in Duskwood

-- Missing Mageroyal spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(2325, 1620, 0, -11040.9, 663.256, 34.9821, 1.83259, 0, 0, 0.793353, 0.608762, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 2320 at 130.184174 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(2325, 1116, 0, 'Mageroyal', 0, 10); -- Mageroyal in Westfall

-- Missing Kingsblood spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(43648, 1624, 0, -11865, 232.543, 16.3644, 4.04917, 0, 0, -0.898793, 0.438373, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 43451 at 5.431407 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(43648, 1170, 0, 'Kingsblood', 0, 10);

-- Missing Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(3281, 1921, 1, 4639.52, 147.078, 58.1845, 3.14322, -0.0174499, -0.0174494, -0.999695, 0.00111879, 180, 180, 100, 1, 0, 0, 0, 10);

-- Missing Signs
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2711, 2128, 0, -8843.62, 922.388, 101.183, 3.63901, 0, 0, -0.969231, 0.246154, 180, 180, 100, 1, 0, 0, 0, 10),
(2712, 2165, 0, -8899.29, 971.613, 122.171, 3.06302, 0, 0, 0.999228, 0.039274, 180, 180, 100, 1, 0, 0, 0, 10),
(2713, 2178, 0, -8845.38, 922.911, 101.783, 2.06822, 0, 0, 0.859406, 0.511293, 180, 180, 100, 1, 0, 0, 0, 10),
(2714, 2171, 0, -8827.23, 957.502, 99.847, 2.2602, 0, 0, 0.904454, 0.426571, 180, 180, 100, 1, 0, 0, 0, 10),
(2715, 2186, 0, -8726.22, 892.581, 100.563, 3.831, 0, 0, -0.941175, 0.337918, 180, 180, 100, 1, 0, 0, 0, 10),
(2716, 2191, 0, -8706.76, 865.956, 97.3634, 2.2602, 0, 0, 0.904454, 0.426571, 180, 180, 100, 1, 0, 0, 0, 10),
(2717, 2179, 0, -8704.93, 865.779, 96.7633, 3.831, 0, 0, -0.941175, 0.337918, 180, 180, 100, 1, 0, 0, 0, 10),
(2718, 2157, 0, -8616.12, 872.506, 99.485, 5.38434, 0, 0, -0.434444, 0.900699, 180, 180, 100, 1, 0, 0, 0, 10),
(2719, 2131, 0, -8508.36, 659.892, 99.9641, 0.60214, 0, 0, 0.296542, 0.95502, 180, 180, 100, 1, 0, 0, 0, 10);
DELETE FROM `gameobject` WHERE `guid` IN (12084, 5198, 5517, 4958, 5136, 4718, 10674, 26299);

DELETE FROM `gameobject` WHERE  `guid`=10254;
DELETE FROM `gameobject` WHERE  `guid`=10292;
DELETE FROM `gameobject` WHERE  `guid`=12313;
UPDATE `gameobject` SET `spawntimesecsmin` = 10, `spawntimesecsmax` = 10 WHERE `id` IN (176142, 2086, 175785, 176116, 176143, 2087, 179908, 1727, 175966, 176249, 181053, 175708, 11713, 176630, 177785, 13360, 142191, 154357, 12654, 13872, 141931, 175334, 175928, 152620, 152621, 140911);
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` IN (89634, 271, 11714, 28604, 177926, 178184, 178185, 178186, 2712, 22246, 180658, 89635, 19016, 3290, 17282);
UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `id` = 180215;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 164662;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 24798;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21603, 4, 'Azshara - Azsharite Formation', 10, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(152620, 21603, 0, 'Azshara - Azsharite Formation', 10, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21604, 4, 'Azshara - Azsharite Formation', 10, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(152621, 21604, 0, 'Azshara - Azsharite Formation', 10, 10);

UPDATE `pool_gameobject_template` SET `description`='Artificial Extrapolator - Gnomeregan' WHERE  `id`=142344;

UPDATE `gameobject` SET `spawntimesecsmin` = 0, `spawntimesecsmax` = 0 WHERE `guid` IN (142076, 6083, 10868, 10027, 9417);

SET @OGUID = 4892;
-- Missing Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3201, 0, -4667.15, -1715.61, 503.324, 2.59181, 0, 0, 0.962455, 0.271442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3797, 529, 824.073, 843.036, -56.6029, 1.61443, 0, 0, 0.722363, 0.691514, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3798, 529, 824.056, 842.141, -56.6029, 0.322884, 0, 0, 0.160742, 0.986997, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3799, 0, -10021.2, 36.2398, 35.1069, 4.11025, 0, 0, -0.884987, 0.465616, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3799, 0, -9053.04, 150.941, 114.97, 0.305433, 0, 0, 0.152123, 0.988361, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 3800, 0, -10020.7, 35.5148, 35.1069, 5.40179, 0, 0, -0.426569, 0.904455, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3800, 0, -9275.17, 677.059, 132.779, 1.91113, 0, 0, 0.816641, 0.577146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3800, 0, -9053.01, 151.835, 114.97, 1.59697, 0, 0, 0.716301, 0.697791, 180, 180, 100, 1, 0, 0, 0, 10);

-- Missing Chairs
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+9, 10221, 0, -8860.13, 866.013, 99.6228, 5.37562, 0, 0, -0.43837, 0.898795, 180, 180, 100, 1, 0, 0, 0, 10);

-- Missing Food In Gnomeregan
SET @OGUID = 2435;
SET @PTEMPLATE = 3582;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3659, 90, -571.492, 510.91, -216.81, -2.61799, 0, 0, 0.965926, -0.258819, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 3659, 90, -910.038, 357.305, -272.596, -1.76278, 0, 0, 0.771625, -0.636078, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3695, 90, -571.492, 510.91, -216.81, -2.61799, 0, 0, 0.965926, -0.258819, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3695, 90, -910.038, 357.305, -272.596, -1.76278, 0, 0, 0.771625, -0.636078, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10),
(@PTEMPLATE+2, 1, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10),
(@OGUID+3, @PTEMPLATE+1, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10),
(@OGUID+4, @PTEMPLATE+2, 'Barrel of Melon Juice / Food Crate - Gnomeregan', 0, 10);

DELETE FROM `gameobject` WHERE `guid` IN (32398, 32410);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
