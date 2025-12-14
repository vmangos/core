DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230629175522');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230629175522');
-- Add your query below.


-- Misc
UPDATE `pool_template` SET `instance` = 0 WHERE `entry`=4000;
UPDATE `pool_template` SET `instance` = 0 WHERE `entry`=14006;

DELETE FROM `pool_template` WHERE `entry` IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 145, 146, 147, 148, 149, 153, 154, 155, 156, 157, 158, 159, 160, 161, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 330, 331, 333, 334, 1347, 34931, 43519, 43523);

-- Correct position of Large Mithril Bound Chest in Western Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2939.02, `position_y`=-1376.04, `position_z`=167.237, `orientation`=5.09636, `rotation0`=0, `rotation1`=0, `rotation2`=-0.559193, `rotation3`=0.829038 WHERE `guid`=45493;

-- Correct position of Large Mithril Bound Chest in Western Plaguelands (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2851.74, `position_y`=-1403.16, `position_z`=148.907, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=45553;

-- Missing Scarlet Footlocker spawns in Eastern Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45751, 179498, 0, 1712.16, -5212.28, 95.6143, 5.42797, 0, 0, -0.414693, 0.909961, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45741 at 38.074177 yards.
(45752, 179498, 0, 1726.13, -5329.35, 73.8507, 3.31614, 0, 0, -0.996194, 0.087165, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45747 at 32.008621 yards.
(45783, 179498, 0, 1589.12, -5312.56, 68.7325, 1.22173, 0, 0, 0.573576, 0.819152, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45748 at 38.508904 yards.
(45792, 179498, 0, 1705.79, -5393.54, 73.7189, 2.9845, 0, 0, 0.996917, 0.0784664, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45747 at 45.560032 yards.
(45832, 179498, 0, 1620.92, -5389.97, 73.6975, 1.37881, 0, 0, 0.636078, 0.771625, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 23.235523 yards.
(45837, 179498, 0, 1579.43, -5495.92, 100.959, 2.16421, 0, 0, 0.882947, 0.469473, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45744 at 92.398315 yards.
(45843, 179498, 0, 1651.6, -5541.67, 100.761, 0.401425, 0, 0, 0.199368, 0.979925, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45745 at 51.971249 yards.
(45846, 179498, 0, 1752.45, -5428.04, 113.526, 1.41372, 0, 0, 0.649447, 0.760406, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45749 at 43.867523 yards.
(45847, 179498, 0, 1598.2, -5276.86, 88.9153, 5.84685, 0, 0, -0.216439, 0.976296, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45748 at 35.697124 yards.
(45854, 179498, 0, 1777.93, -5310.02, 106.816, 3.97935, 0, 0, -0.913545, 0.406738, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45747 at 72.523460 yards.
(45863, 179498, 0, 1619.86, -5356.99, 74.204, 5.55015, 0, 0, -0.358368, 0.93358, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 44.134396 yards.
(45864, 179498, 0, 1616.11, -5395.36, 75.7045, 4.81711, 0, 0, -0.66913, 0.743145, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 27.732952 yards.
(45869, 179498, 0, 1599.63, -5407.32, 76.3989, 0.610863, 0, 0, 0.300705, 0.953717, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 46.138191 yards.
(45880, 179498, 0, 1552.42, -5384.27, 80.0347, 3.97935, 0, 0, -0.913545, 0.406738, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 92.061134 yards.
(45882, 179498, 0, 1536.36, -5390.14, 79.886, 3.97935, 0, 0, -0.913545, 0.406738, 10, 10, 1, 100, 1, 10), -- Closest existing guid is 45742 at 107.634979 yards.
(45883, 179498, 0, 1774.65, -5406.2, 80.9366, 1.36136, 0, 0, 0.62932, 0.777146, 10, 10, 1, 100, 1, 10); -- Closest existing guid is 45747 at 60.645321 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45751, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45752, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45783, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45792, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45832, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45837, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45843, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45846, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45847, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45854, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45863, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45864, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45869, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45880, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45882, 3011, 0, 'Scarlet Footlocker', 1, 10), -- Scarlet Footlocker (EPL - Tyr)
(45883, 3011, 0, 'Scarlet Footlocker', 1, 10); -- Scarlet Footlocker (EPL - Tyr)

UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 300 WHERE `id` = 179498;

UPDATE `pool_template` SET `max_limit` = 9, `description`='Scarlet Footlockers In Eastern Plaguelands' WHERE  `entry`=3011;

-- Correct position of Blood of Heroes in Tirisfal Glades (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1645.17, `position_y`=-710.922, `position_z`=55.3112, `orientation`=0.471238, `rotation0`=0, `rotation1`=0, `rotation2`=0.233445, `rotation3`=0.97237 WHERE `guid`=25931;

-- Correct position of Blood of Heroes in Eastern Plaguelands (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=1832.91, `position_y`=-4374.05, `position_z`=98.3339, `orientation`=5.75959, `rotation0`=0, `rotation1`=0, `rotation2`=-0.258819, `rotation3`=0.965926 WHERE `guid`=25956;

-- Correct position of Blood of Heroes in Eastern Plaguelands (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=2494.31, `position_y`=-5134.03, `position_z`=75.2775, `orientation`=3.9619, `rotation0`=0, `rotation1`=0, `rotation2`=-0.91706, `rotation3`=0.39875 WHERE `guid`=25995;

-- Correct position of Blood of Heroes in Eastern Plaguelands (position is off by 0.000100136 yards).
UPDATE `gameobject` SET `position_x`=1987.43, `position_y`=-4193.23, `position_z`=11.9174, `orientation`=2.11185, `rotation0`=0, `rotation1`=0, `rotation2`=0.870356, `rotation3`=0.492424 WHERE `guid`=25973;

-- Correct position of Blood of Heroes in Eastern Plaguelands (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=1748.16, `position_y`=-4453.14, `position_z`=74.2627, `orientation`=4.2237, `rotation0`=0, `rotation1`=0, `rotation2`=-0.857167, `rotation3`=0.515038 WHERE `guid`=25944;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
