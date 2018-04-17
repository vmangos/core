DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180417090744');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180417090744');
-- Add your query below.


-- Spawns of first pack in DM North should be randomized.
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4295, 4294, 20, 'DM North : First Pack v1', 0);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4296, 4294, 16, 'DM North : First Pack v2', 0);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4297, 4294, 16, 'DM North : First Pack v3', 0);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4298, 4294, 16, 'DM North : First Pack v4', 0);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4299, 4294, 16, 'DM North : First Pack v5', 0);
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (4300, 4294, 16, 'DM North : First Pack v6', 0);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4294, 1, 'Dire Maul North - First Pack Pool of Pools', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4295, 4, 'Dire Maul North - First Pack Variant 1', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4296, 4, 'Dire Maul North - First Pack Variant 2', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4297, 3, 'Dire Maul North - First Pack Variant 3', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4298, 4, 'Dire Maul North - First Pack Variant 4', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4299, 3, 'Dire Maul North - First Pack Variant 5', 0, 0, 1, 10);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (4300, 3, 'Dire Maul North - First Pack Variant 6', 0, 0, 1, 10);

-- Variant 1
-- These are the current spawns.
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (134825, 4295, 100, 'DM North: First Pack v1 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (134827, 4295, 100, 'DM North: First Pack v1 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (134838, 4295, 100, 'DM North: First Pack v1 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (134865, 4295, 100, 'DM North: First Pack v1 Brute', 0, 1, 10);

-- Variant 2
-- Based on screenshot posted on Discord.
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136150, 11441, 429, 0, 0, 293.43, 22.6771, -3.83323, 1.71042, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (136150, 0, 0, 1, 1, 16, 0, 0, NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136151, 11444, 429, 0, 0, 290, 43.9366, -3.84639, 4.88692, 43200, 43200, 0, 0, 14000, 10922, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136152, 11444, 429, 0, 0, 278.29, 32.931, -2.46346, 0.05236, 43200, 43200, 0, 0, 9900, 10680, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136153, 13036, 429, 0, 0, 299.916, 40.0648, -3.8728, 3.80482, 43200, 43200, 0, 0, 4053, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136150, 4296, 100, 'DM North: First Pack v2 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136151, 4296, 100, 'DM North: First Pack v2 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136152, 4296, 100, 'DM North: First Pack v2 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136153, 4296, 100, 'DM North: First Pack v2 Mastiff', 0, 1, 10);

-- Variant 3
-- https://youtu.be/4jBE4TGYc8w?t=1m50s
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136154, 11444, 429, 0, 0, 290, 43.9366, -3.84639, 4.88692, 43200, 43200, 0, 0, 14000, 10922, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (136154, 0, 0, 1, 1, 16, 0, 0, NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136155, 11441, 429, 0, 0, 278.29, 32.931, -2.46346, 0.05236, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136156, 11444, 429, 0, 0, 299.916, 40.0648, -3.8728, 3.80482, 43200, 43200, 0, 0, 14000, 10922, 0, 0, 0, 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136154, 4297, 100, 'DM North: First Pack v3 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136155, 4297, 100, 'DM North: First Pack v3 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136156, 4297, 100, 'DM North: First Pack v3 Mage', 0, 1, 10);

-- Variant 4
-- https://youtu.be/mJkKL1XPdGQ?t=2m42s
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136157, 11444, 429, 0, 0, 293.43, 22.6771, -3.83323, 1.71042, 43200, 43200, 0, 0, 14000, 10922, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (136157, 0, 0, 1, 1, 16, 0, 0, NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136158, 11441, 429, 0, 0, 290, 43.9366, -3.84639, 4.88692, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136159, 11444, 429, 0, 0, 278.29, 32.931, -2.46346, 0.05236, 43200, 43200, 0, 0, 9900, 10680, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (136159, 0, 0, 1, 1, 16, 0, 0, NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136160, 11441, 429, 0, 0, 299.916, 40.0648, -3.8728, 3.80482, 43200, 43200, 0, 0, 14194, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136157, 4298, 100, 'DM North: First Pack v4 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136158, 4298, 100, 'DM North: First Pack v4 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136159, 4298, 100, 'DM North: First Pack v4 Mage', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136160, 4298, 100, 'DM North: First Pack v4 Brute', 0, 1, 10);

-- v5
-- https://youtu.be/AND-5oZBPc4?t=26s
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136161, 13036, 429, 0, 0, 293.43, 22.6771, -3.83323, 1.71042, 43200, 43200, 0, 0, 4053, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136162, 11441, 429, 0, 0, 278.29, 32.931, -2.46346, 0.05236, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136163, 11444, 429, 0, 0, 299.916, 40.0648, -3.8728, 3.80482, 43200, 43200, 0, 0, 9900, 10680, 0, 0, 0, 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136161, 4299, 100, 'DM North: First Pack v5 Mastiff', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136162, 4299, 100, 'DM North: First Pack v5 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136163, 4299, 100, 'DM North: First Pack v5 Mage', 0, 1, 10);

-- v6
-- https://www.youtube.com/watch?v=d8vflNfYe_g
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136164, 11441, 429, 0, 0, 293.43, 22.6771, -3.83323, 1.71042, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136165, 11441, 429, 0, 0, 290, 43.9366, -3.84639, 4.88692, 43200, 43200, 0, 0, 14000, 0, 0, 0, 0, 0, 1, 10);
REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (136166, 11444, 429, 0, 0, 299.916, 40.0648, -3.8728, 3.80482, 43200, 43200, 0, 0, 9900, 10680, 0, 0, 0, 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136164, 4300, 100, 'DM North: First Pack v6 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136165, 4300, 100, 'DM North: First Pack v6 Brute', 0, 1, 10);
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES (136166, 4300, 100, 'DM North: First Pack v6 Mage', 0, 1, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
