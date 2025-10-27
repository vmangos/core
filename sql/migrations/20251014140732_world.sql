DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251014140732');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251014140732');
-- Add your query below.


-- Highperch Wyvern Egg
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1624, 175384, 1, -4869.81, -904.845, -4.81499, 0.593412, 0, 0, 0.292372, 0.956305, 180, 180, 100, 1, 0, 10); -- Thousand Needles

-- Gate of Ahn'Qiraj
-- Event 83: AQ Gate
UPDATE `gameobject` SET `position_x`=-8133.61, `position_y`=1525.3, `position_z`=17.9576, `orientation`=-0.0261799, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0130896, `rotation3`=0.999914 WHERE `guid`=66334;

-- Blood of Heroes
-- Pool 9: Western Plaguelands - Blood of Heroes
-- Pool 38: Eastern Plaguelands - Blood of Heroes
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1663, 176213, 0, 2159.84, -2442.75, 62.0804, -0.488692, 0, 0, 0.241922, -0.970296, 7200, 7200, 100, 1, 0, 10), -- Western Plaguelands
(1665, 176213, 0, 1111.51, -2569.18, 59.2519, -1.48353, 0, 0, 0.67559, -0.737277, 7200, 7200, 100, 1, 0, 10); -- Western Plaguelands
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (1663, 9, 0, 'Blood of Heroes', 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (1665, 38, 0, 'Blood of Heroes', 0, 0, 10);

-- Blood of Heroes
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1667, 176214, 0, 2159.84, -2442.75, 62.0804, -0.488692, 0, 0, 0.241922, -0.970296, 7200, 7200, 100, 1, 0, 10), -- Western Plaguelands
(1668, 176214, 0, 1111.51, -2569.18, 59.2519, -1.48353, 0, 0, 0.67559, -0.737277, 7200, 7200, 100, 1, 0, 10), -- Western Plaguelands
(1677, 176214, 0, 2063.55, -5230.85, 83.8689, -0.925024, 0, 0, 0.446198, -0.894934, 7200, 7200, 100, 1, 0, 10), -- Eastern Plaguelands
(1686, 176214, 0, 3111.05, -3684.29, 135.595, -2.35619, 0, 0, 0.92388, -0.382683, 7200, 7200, 100, 1, 0, 10); -- Eastern Plaguelands

-- Campfire
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1704, 176265, 0, 3145.1, -3752.52, 133.82, -0.820305, 0, 0, -0.398749, 0.91706, 180, 180, 100, 1, 0, 8); -- Eastern Plaguelands

-- Bubbly Fissure
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1864, 177524, 1, 203.143, 2559.87, -63.163, -3.05433, 0, 0, 0.999048, -0.0436194, 900, 900, 100, 1, 0, 10); -- Desolace

-- Tool Bucket
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1866, 177726, 0, 2925.03, -1536.47, 146.065, -1.01229, 0, 0, 0.48481, -0.87462, 180, 180, 100, 1, 0, 10); -- Western Plaguelands

-- Troll Chest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1868, 178144, 1, 3378.26, -708.838, 168.771, -2.77507, 0, 0, 0.983255, -0.182235, 180, 180, 100, 1, 0, 10); -- Ashenvale

-- Sapphire of Aku'Mai
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1871, 178184, 1, 4239.02, 828.636, -5.75034, -0.453786, 0, 0, 0.224951, -0.97437, 60, 60, 100, 1, 0, 10); -- Blackfathom Deeps

-- Warsong Oil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(1897, 178195, 1, 2955.89, -2817.05, 212.767, -3.00197, 0, 0, 0.997564, -0.0697565, 180, 180, 100, 1, 0, 10); -- Ashenvale

-- Water Elemental Rift
-- Event 71: Elemental Invasion: Water (Winterspring)
DELETE FROM `gameobject` WHERE `id`=179665;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(399365, 179665, 1, 6498.69, -4173.11, 658.959, 2.32129, 0, 0, 0.91706, 0.398749, 25, 25, 100, 1, 2, 10), -- Winterspring
(399366, 179665, 1, 6601.08, -4167.38, 658.598, -1.0472, 0, 0, 0.5, -0.866025, 25, 25, 100, 1, 2, 10), -- Winterspring
(399367, 179665, 1, 6541.6, -4061.05, 658.296, -3.05433, 0, 0, 0.999048, -0.0436194, 25, 25, 100, 1, 2, 10), -- Winterspring
(399368, 179665, 1, 6517.87, -3983.42, 658.337, -0.244346, 0, 0, 0.121869, -0.992546, 25, 25, 100, 1, 2, 10), -- Winterspring
(399369, 179665, 1, 6466.32, -4035.07, 658.459, 2.23402, 0, 0, 0.898794, 0.438371, 25, 25, 100, 1, 2, 10); -- Winterspring
DELETE FROM `game_event_gameobject` WHERE `guid` IN (399370, 399371, 3996149, 3996150, 3996151, 3996152, 3996153, 3996154, 3996155);

-- Air Elemental Rift
-- Event 69: Elemental Invasion: Air (Silithus)
DELETE FROM `gameobject` WHERE `id`=179667;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
(58000, 179667, 1, -6566.51, 1933.53, 6.48758, 5.11382, 0, 0, -0.551936, 0.833886, 25, 25, 100, 1, 2, 10),
(58001, 179667, 1, -6566.5, 1800.88, 3.25358, 4.29351, 0, 0, -0.83867, 0.54464, 25, 25, 100, 1, 2, 10),
(58002, 179667, 1, -6615.31, 1650.84, 3.63024, 5.95157, 0, 0, -0.165047, 0.986286, 25, 25, 100, 1, 2, 10),
(58003, 179667, 1, -6567.16, 1500.09, 3.49323, 6.05629, 0, 0, -0.113203, 0.993572, 25, 25, 100, 1, 2, 10),
(58004, 179667, 1, -6449.7, 1451.1, -1.33023, 5.75959, 0, 0, -0.258819, 0.965926, 25, 25, 100, 1, 2, 10),
(58005, 179667, 1, -6368.79, 1433.82, 4.54176, 5.72468, 0, 0, -0.275637, 0.961262, 25, 25, 100, 1, 2, 10),
(58006, 179667, 1, -6465.79, 1866.83, 3.8172, 3.14159, 0, 0, -1, 0, 25, 25, 100, 1, 2, 10);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (58007, 58008, 58009, 58010, 58011, 58012, 58013, 58014, 58015);

-- Aerie Peak Town Center
UPDATE `gameobject` SET `position_x`=235.175, `position_y`=-2127.88, `position_z`=118.753, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=-0.0436194 WHERE `guid`=21508;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
