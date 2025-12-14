DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240323204227');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240323204227');
-- Add your query below.


-- Add spawns for the fake warpwood pods that trigger traps.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325544, 179526, 429, 64.6404, -406.651, -4.21737, 3.72287, 0, 0, 0.958061, -0.286564, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325545, 179526, 429, -49.6266, -411.794, -4.2219, 3.15974, 0, 0, 0.999959, -0.00907258, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325546, 179526, 429, -83.263, -458.39, -58.613, 2.88642, 0, 0, 0.991872, 0.12724, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325547, 179526, 429, -88.0239, -395.291, -58.5457, 3.0545, 0, 0, 0.999052, 0.0435348, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325548, 179526, 429, 49.9055, -640.41, -25.1377, 4.63157, 0, 0, 0.735097, -0.677962, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325549, 179526, 429, 21.2012, -675.806, -25.1616, 3.65666, 0, 0, 0.967021, -0.254695, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325550, 179526, 429, 60.5734, -683.427, -25.1616, 2.22095, 0, 0, 0.89591, 0.444236, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325551, 179526, 429, 66.8207, -756.981, -25.1594, 2.49741, 0, 0, 0.948575, 0.316551, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325552, 179526, 429, 31.5754, -762.035, -25.1523, 6.20056, 0, 0, 0.041299, -0.999147, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325553, 179526, 429, 4.01237, -716.593, -12.6426, 1.02165, 0, 0, 0.488898, 0.872341, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325554, 179532, 429, 64.6404, -406.651, -4.21737, 3.72287, 0, 0, 0.958061, -0.286564, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325555, 179532, 429, -49.6266, -411.794, -4.2219, 3.15974, 0, 0, 0.999959, -0.00907258, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325556, 179532, 429, -83.263, -458.39, -58.613, 2.88642, 0, 0, 0.991872, 0.12724, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325557, 179532, 429, -88.0239, -395.291, -58.5457, 3.0545, 0, 0, 0.999052, 0.0435348, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325558, 179532, 429, 49.9055, -640.41, -25.1377, 4.63157, 0, 0, 0.735097, -0.677962, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325559, 179532, 429, 21.2012, -675.806, -25.1616, 3.65666, 0, 0, 0.967021, -0.254695, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325560, 179532, 429, 60.5734, -683.427, -25.1616, 2.22095, 0, 0, 0.89591, 0.444236, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325561, 179532, 429, 66.8207, -756.981, -25.1594, 2.49741, 0, 0, 0.948575, 0.316551, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325562, 179532, 429, 31.5754, -762.035, -25.1523, 6.20056, 0, 0, 0.041299, -0.999147, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325563, 179532, 429, 4.01237, -716.593, -12.6426, 1.02165, 0, 0, 0.488898, 0.872341, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325564, 179533, 429, 64.6404, -406.651, -4.21737, 3.72287, 0, 0, 0.958061, -0.286564, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325565, 179533, 429, -49.6266, -411.794, -4.2219, 3.15974, 0, 0, 0.999959, -0.00907258, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325566, 179533, 429, -83.263, -458.39, -58.613, 2.88642, 0, 0, 0.991872, 0.12724, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325567, 179533, 429, -88.0239, -395.291, -58.5457, 3.0545, 0, 0, 0.999052, 0.0435348, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325568, 179533, 429, 49.9055, -640.41, -25.1377, 4.63157, 0, 0, 0.735097, -0.677962, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325569, 179533, 429, 21.2012, -675.806, -25.1616, 3.65666, 0, 0, 0.967021, -0.254695, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325570, 179533, 429, 60.5734, -683.427, -25.1616, 2.22095, 0, 0, 0.89591, 0.444236, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325571, 179533, 429, 66.8207, -756.981, -25.1594, 2.49741, 0, 0, 0.948575, 0.316551, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325572, 179533, 429, 31.5754, -762.035, -25.1523, 6.20056, 0, 0, 0.041299, -0.999147, 86400, 86400, 100, 1, 0, 0, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`) VALUES (325573, 179533, 429, 4.01237, -716.593, -12.6426, 1.02165, 0, 0, 0.488898, 0.872341, 86400, 86400, 100, 1, 0, 0, 1);

-- Add pools for each spawn position.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3969, 1, 'Dire Mail - Warpwood Pod 1', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3970, 1, 'Dire Mail - Warpwood Pod 2', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3971, 1, 'Dire Mail - Warpwood Pod 3', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3972, 1, 'Dire Mail - Warpwood Pod 4', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3973, 1, 'Dire Mail - Warpwood Pod 5', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3974, 1, 'Dire Mail - Warpwood Pod 6', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3975, 1, 'Dire Mail - Warpwood Pod 7', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3976, 1, 'Dire Mail - Warpwood Pod 8', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3977, 1, 'Dire Mail - Warpwood Pod 9', 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`) VALUES (3978, 1, 'Dire Mail - Warpwood Pod 10', 0, 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325481, 3969, 25, 'Dire Mail - Warpwood Pod 1 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325499, 3970, 25, 'Dire Mail - Warpwood Pod 2 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325519, 3971, 25, 'Dire Mail - Warpwood Pod 3 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325522, 3972, 25, 'Dire Mail - Warpwood Pod 4 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325532, 3973, 25, 'Dire Mail - Warpwood Pod 5 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325534, 3974, 25, 'Dire Mail - Warpwood Pod 6 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325536, 3975, 25, 'Dire Mail - Warpwood Pod 7 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325538, 3976, 25, 'Dire Mail - Warpwood Pod 8 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325540, 3977, 25, 'Dire Mail - Warpwood Pod 9 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325543, 3978, 25, 'Dire Mail - Warpwood Pod 10 - Normal', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325544, 3969, 25, 'Dire Mail - Warpwood Pod 1 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325545, 3970, 25, 'Dire Mail - Warpwood Pod 2 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325546, 3971, 25, 'Dire Mail - Warpwood Pod 3 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325547, 3972, 25, 'Dire Mail - Warpwood Pod 4 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325548, 3973, 25, 'Dire Mail - Warpwood Pod 5 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325549, 3974, 25, 'Dire Mail - Warpwood Pod 6 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325550, 3975, 25, 'Dire Mail - Warpwood Pod 7 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325551, 3976, 25, 'Dire Mail - Warpwood Pod 8 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325552, 3977, 25, 'Dire Mail - Warpwood Pod 9 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325553, 3978, 25, 'Dire Mail - Warpwood Pod 10 - Root', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325554, 3969, 25, 'Dire Mail - Warpwood Pod 1 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325555, 3970, 25, 'Dire Mail - Warpwood Pod 2 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325556, 3971, 25, 'Dire Mail - Warpwood Pod 3 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325557, 3972, 25, 'Dire Mail - Warpwood Pod 4 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325558, 3973, 25, 'Dire Mail - Warpwood Pod 5 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325559, 3974, 25, 'Dire Mail - Warpwood Pod 6 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325560, 3975, 25, 'Dire Mail - Warpwood Pod 7 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325561, 3976, 25, 'Dire Mail - Warpwood Pod 8 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325562, 3977, 25, 'Dire Mail - Warpwood Pod 9 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325563, 3978, 25, 'Dire Mail - Warpwood Pod 10 - Spore', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325564, 3969, 25, 'Dire Mail - Warpwood Pod 1 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325565, 3970, 25, 'Dire Mail - Warpwood Pod 2 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325566, 3971, 25, 'Dire Mail - Warpwood Pod 3 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325567, 3972, 25, 'Dire Mail - Warpwood Pod 4 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325568, 3973, 25, 'Dire Mail - Warpwood Pod 5 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325569, 3974, 25, 'Dire Mail - Warpwood Pod 6 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325570, 3975, 25, 'Dire Mail - Warpwood Pod 7 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325571, 3976, 25, 'Dire Mail - Warpwood Pod 8 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325572, 3977, 25, 'Dire Mail - Warpwood Pod 9 - Summon', 0);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`) VALUES (325573, 3978, 25, 'Dire Mail - Warpwood Pod 10 - Summon', 0);
UPDATE `pool_template` SET `patch_min`=1 WHERE `entry` IN (3969, 3970, 3971, 3972, 3973, 3974, 3975, 3976, 3977, 3978);
UPDATE `pool_gameobject` SET `patch_min`=1 WHERE `pool_entry` IN (3969, 3970, 3971, 3972, 3973, 3974, 3975, 3976, 3977, 3978);

-- Assign AI to the fake pods so I don't have to spawn every kind of trap at every position.
UPDATE `gameobject_template` SET `script_name`='go_warpwood_pod' WHERE `entry` IN (179526, 179532, 179533);

-- Events list for Warpwood Spores
DELETE FROM `creature_ai_events` WHERE `creature_id`=14366;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1436601, 14366, 0, 11, 0, 100, 0, 0, 0, 0, 0, 1436601, 0, 0, 'Warpwood Spores - Cast Spell Choking Spores on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=1436601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1436601, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Spores - Disable Melee Attack'),
(1436601, 0, 1, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Spores - Disable Combat Movement'),
(1436601, 0, 2, 15, 22802, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Spores - Cast Spell Choking Spores'),
(1436601, 0, 3, 18, 11000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warpwood Spores - Despawn after 11 seconds');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=14366;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
