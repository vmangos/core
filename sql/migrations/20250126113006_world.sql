DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250126113006');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250126113006');
-- Add your query below.


SET @PTEMPLATE = 8000;
-- Elwynn Forest
UPDATE `pool_template` SET `description` = 'Copper Veins - Elwynn Forest (Master Pool)' WHERE `entry` = 1015;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Elwynn Forest' WHERE `guid` = 27052;
-- Jasperlode Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (26972, 30940, 30943, 30787, 30780, 30707, 30941, 30676, 30782, 30674, 30783, 26975, 26984, 30942, 30945, 112630, 112631);
DELETE FROM `pool_gameobject` WHERE `guid` IN (26972, 30940, 30943, 30787, 30780, 30707, 30941, 30676, 30782, 30674, 30783, 26975, 26984, 30942, 30945, 112630, 112631);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Elwynn Forest - Jasperlode Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(30943, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30787, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30780, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30707, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30941, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30676, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30782, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30674, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30783, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(26975, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(26984, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30942, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30945, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(26972, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(30940, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(112630, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10),
(112631, @PTEMPLATE+1, 0, 'Copper Vein - Elwynn Forest - Jasperlode Mine', 0, 0, 10);

-- Fargodeep Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (32465, 32467, 60031, 32463, 30919, 26881, 30949, 30936, 30858, 30951, 30847, 26885, 32461, 32464, 30935, 30948, 30922, 30789, 112626, 112627);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32465, 32467, 60031, 32463, 30919, 26881, 30949, 30936, 30858, 30951, 30847, 26885, 32461, 32464, 30935, 30948, 30922, 30789, 112626, 112627);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 3, 'Elwynn Forest - Fargodeep Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(30919, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(26881, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30949, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30936, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30858, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30951, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30847, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(26885, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(32461, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(32465, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(32464, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(32463, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30935, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30948, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30922, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(30789, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(32467, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(60031, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(112626, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10),
(112627, @PTEMPLATE+2, 0, 'Copper Vein - Elwynn Forest - Fargodeep Mine', 0, 0, 10);

UPDATE `pool_template` SET `max_limit` = 35 WHERE `entry` = 1015;

-- Dun Morogh
UPDATE `pool_template` SET `description` = 'Copper Veins - Dun Morogh (Master Pool)' WHERE `entry` = 1019;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Dun Morogh' WHERE `guid` = 10282;
-- The Grizzled Den
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (29576, 29338, 10660, 10223, 29354, 10214, 10202, 29635, 10213, 29335, 29555, 29569, 29332, 112652);
DELETE FROM `pool_gameobject` WHERE `guid` IN (29576, 29338, 10660, 10223, 29354, 10214, 10202, 29635, 10213, 29335, 29555, 29569, 29332, 112652);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 3, 'Dun Morogh - Grizzled Den - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(29576, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29338, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(10660, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(10223, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29354, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(10214, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(10202, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29635, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(10213, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29335, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29555, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29569, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(29332, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10),
(112652, @PTEMPLATE+3, 0, 'Copper Vein - Dun Morogh - Grizzled Den', 0, 0, 10);

-- Frostmane Hold
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (9938, 9955, 9945, 10000, 10037, 112648, 112649);
DELETE FROM `pool_gameobject` WHERE `guid` IN (9938, 9955, 9945, 10000, 10037, 112648, 112649);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 3, 'Dun Morogh - Frostmane Hold - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(9938, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(9955, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(9945, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(10000, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(10037, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(112648, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10),
(112649, @PTEMPLATE+4, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10);

-- Gol'Bolar Quarry
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (43237, 11176, 10853, 11179, 11178, 11177, 29620, 29345, 10855, 29557, 10852, 29621, 29619, 112647, 112641, 112645, 112646, 112643);
DELETE FROM `pool_gameobject` WHERE `guid` IN (43237, 11176, 10853, 11179, 11178, 11177, 29620, 29345, 10855, 29557, 10852, 29621, 29619, 112647, 112641, 112645, 112646, 112643);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 3, 'Dun Morogh - Gol\'Bolar Quarry - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(11176, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(10853, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(11179, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(11178, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(11177, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(29620, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(29345, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(10855, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(29557, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(10852, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(29621, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(29619, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(43237, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(112647, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(112641, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(112645, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(112646, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10),
(112643, @PTEMPLATE+5, 0, 'Copper Vein - Dun Morogh - Gol\'Bolar Quarry', 0, 0, 10);

UPDATE `pool_template` SET `max_limit` = 28 WHERE `entry` = 1019;

-- Durotar
UPDATE `pool_template` SET `description` = 'Copper Veins - Durotar (Master Pool)' WHERE `entry` = 1024;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Durotar' WHERE `guid` IN (4992, 5204, 5345, 12918);
-- Skull Rock
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (12755, 12882, 12903, 12966, 12965, 12647, 12923, 12898, 12757, 12635, 12921, 12892, 12968, 12860, 12964);
DELETE FROM `pool_gameobject` WHERE `guid` IN (12755, 12882, 12903, 12966, 12965, 12647, 12923, 12898, 12757, 12635, 12921, 12892, 12968, 12860, 12964);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 3, 'Durotar - Skull Rock - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(12755, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12882, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12903, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12966, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12965, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12647, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12923, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12898, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12757, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12635, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12921, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12892, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12968, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12860, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10),
(12964, @PTEMPLATE+6, 0, 'Copper Vein - Durotar - Skull Rock', 0, 0, 10);

-- Dustwind Cave
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (12493, 12888, 12918, 12900, 12543, 112717, 112719, 112716, 112714);
DELETE FROM `pool_gameobject` WHERE `guid` IN (12493, 12888, 12918, 12900, 12543, 112717, 112719, 112716, 112714);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 2, 'Durotar - Dustwind Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(12888, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(12918, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(12900, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(12543, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(12493, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(112717, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(112719, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(112716, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10),
(112714, @PTEMPLATE+7, 0, 'Copper Vein - Durotar - Dustwind Cave', 0, 0, 10);

UPDATE `pool_template` SET `max_limit` = 40 WHERE `entry` = 1024;

-- Mulgore
UPDATE `pool_template` SET `description` = 'Copper Veins - Mulgore (Master Pool)' WHERE `entry` = 1028;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Mulgore' WHERE `guid` IN (20731, 20737, 20788, 20841, 20856, 20857, 5096, 5324, 112755, 20866);
-- Venture Co. Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (20722, 20731, 20744, 20669, 20710, 20672, 20856, 20841, 20670, 20671, 20737, 20788, 20721, 20648);
DELETE FROM `pool_gameobject` WHERE `guid` IN (20722, 20731, 20744, 20669, 20710, 20672, 20856, 20841, 20670, 20671, 20737, 20788, 20721, 20648);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 6, 'Mulgore - Venture Co. Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(20722, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20731, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20744, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20669, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20710, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20672, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20856, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20841, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20670, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20671, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20737, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20788, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20721, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(20648, @PTEMPLATE+8, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10);

-- Palemane Rock
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (20717, 20842, 20709, 20667, 20732, 20716, 20735, 20741, 20866, 20715, 20665, 112755, 112730);
DELETE FROM `pool_gameobject` WHERE `guid` IN (20717, 20842, 20709, 20667, 20732, 20716, 20735, 20741, 20866, 20715, 20665, 112755, 112730);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 3, 'Mulgore - Palemane Rock - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(20717, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20842, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20709, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20667, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20732, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20716, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20735, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20741, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20866, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20715, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(20665, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(112755, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(112730, @PTEMPLATE+9, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10);

UPDATE `pool_template` SET `max_limit` = 32 WHERE `entry` = 1028;

-- Westfall
UPDATE `pool_template` SET `description` = 'Copper Veins - Westfall (Master Pool)' WHERE `entry` = 1111;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Westfall' WHERE `guid` IN (42733, 30636);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Westfall" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
-- Jangolode Mine
-- Copper
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (5378, 42708, 31012, 34762, 31011, 31091, 30590, 30589, 30636, 112614, 23369, 23397, 23370, 23398, 23385, 23413, 23386, 23414, 23387, 23415, 251619, 251626, 251620, 251627);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5378, 42708, 31012, 34762, 31011, 31091, 30590, 30589, 30636, 112614);
DELETE FROM `pool_pool` WHERE `pool_id` IN (1462, 7013, 1463, 1464, 1446, 1447, 7014);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Jangolode Mine' WHERE `entry` IN (1462, 7013, 1463, 1464, 1446, 1447, 7014);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Jangolode Mine' WHERE `pool_entry` IN (1462, 7013, 1463, 1464, 1446, 1447, 7014);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+11, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+12, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+13, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+14, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+15, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+16, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+17, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+18, 1, 'Copper Veins - Westfall - Jangolode Mine', 10),
(@PTEMPLATE+19, 1, 'Copper Veins - Westfall - Jangolode Mine', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(5378, @PTEMPLATE+10, 'Copper Veins - Westfall - Jangolode Mine', 10),
(42708, @PTEMPLATE+11, 'Copper Veins - Westfall - Jangolode Mine', 10),
(31012, @PTEMPLATE+12, 'Copper Veins - Westfall - Jangolode Mine', 10),
(34762, @PTEMPLATE+13, 'Copper Veins - Westfall - Jangolode Mine', 10),
(31011, @PTEMPLATE+14, 'Copper Veins - Westfall - Jangolode Mine', 10),
(31091, @PTEMPLATE+15, 'Copper Veins - Westfall - Jangolode Mine', 10),
(30590, @PTEMPLATE+16, 'Copper Veins - Westfall - Jangolode Mine', 10),
(30589, @PTEMPLATE+17, 'Copper Veins - Westfall - Jangolode Mine', 10),
(30636, @PTEMPLATE+18, 'Copper Veins - Westfall - Jangolode Mine', 10),
(112614, @PTEMPLATE+19, 'Copper Veins - Westfall - Jangolode Mine', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+20, 3, 'Westfall - Jangolode Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+10, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+11, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+12, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+13, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+14, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+15, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+16, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+17, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+18, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(@PTEMPLATE+19, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Copper Veins', 0),
(1462, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(7013, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(1463, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(1464, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(1446, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(1447, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0),
(7014, @PTEMPLATE+20, 0, 'Westfall - Jangolode Mine - Tin Vein / Silver Vein', 0);

-- Gold Coast Quarry
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (23381, 5237, 5184, 5390, 5112, 5410, 5389, 31031, 30996, 42712, 31033, 30997, 112610, 112609, 112611, 112612, 23367, 23395, 23368, 23396, 23378, 23406, 23379, 23407, 251616, 251623, 251617, 251624);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5237, 5184, 5390, 5112, 5410, 5389, 31031, 30996, 42712, 31033, 30997, 112610, 112609, 112611, 112612);
DELETE FROM `pool_pool` WHERE `pool_id` IN (1458, 1456, 7011, 7010, 1455, 1444, 1445);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry' WHERE `entry` IN (1458, 1456, 7011, 7010, 1455, 1444, 1445);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Gold Coast Quarry' WHERE `pool_entry` IN (1458, 1456, 7011, 7010, 1455, 1444, 1445);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+21, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+22, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+23, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+24, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+25, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+26, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+27, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+28, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+29, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+30, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+31, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+32, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+33, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+34, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(@PTEMPLATE+35, 1, 'Copper Veins - Westfall - Gold Coast Quarry', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES
(5237, @PTEMPLATE+21, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(5184, @PTEMPLATE+22, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(5390, @PTEMPLATE+23, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(5112, @PTEMPLATE+24, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(5410, @PTEMPLATE+25, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(5389, @PTEMPLATE+26, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(31031, @PTEMPLATE+27, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(30996, @PTEMPLATE+28, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(42712, @PTEMPLATE+29, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(31033, @PTEMPLATE+30, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(30997, @PTEMPLATE+31, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(112610, @PTEMPLATE+32, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(112609, @PTEMPLATE+33, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(112611, @PTEMPLATE+34, 'Copper Veins - Westfall - Gold Coast Quarry', 10),
(112612, @PTEMPLATE+35, 'Copper Veins - Westfall - Gold Coast Quarry', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+36, 3, 'Westfall - Gold Coast Quarry - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+21, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+22, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+23, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+24, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+25, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+26, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+27, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+28, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+29, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+30, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+31, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+32, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+33, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+34, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(@PTEMPLATE+35, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Copper Veins', 0),
(1458, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(1456, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(7011, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(7010, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(1455, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(1444, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0),
(1445, @PTEMPLATE+36, 0, 'Westfall - Gold Coast Quarry - Tin Vein / Silver Vein', 0);

-- Deadmines Entrance
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (23409, 34829, 31952, 31946, 34832, 34835, 31947, 31951, 31950, 31956, 31953, 31948, 31077, 31053, 31088, 112607, 112604, 112602, 23361, 23389, 23362, 23390, 23363, 23391, 23364, 23392, 23365, 23393, 23372, 23400, 23373, 23401, 23374, 23402);
DELETE FROM `pool_gameobject` WHERE `guid` IN (34829, 31952, 31946, 34832, 34835, 31947, 31951, 31950, 31956, 31953, 31948, 31077, 31053, 31088, 112607, 112604, 112602);
DELETE FROM `pool_pool` WHERE `pool_id` IN (1451, 1450, 1449, 1442, 1440, 1438, 1439, 1441);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Westfall - Deadmines Entrance' WHERE `entry` IN (1451, 1450, 1449, 1442, 1440, 1438, 1439, 1441);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Westfall - Deadmines Entrance' WHERE `pool_entry` IN (1451, 1450, 1449, 1442, 1440, 1438, 1439, 1441);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+37, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+38, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+39, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+40, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+41, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+42, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+43, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+44, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+45, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+46, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+47, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+48, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+49, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+50, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+51, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+52, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(@PTEMPLATE+53, 1, 'Copper Veins - Westfall - Deadmines Entrance', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34829, @PTEMPLATE+37, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31952, @PTEMPLATE+38, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31946, @PTEMPLATE+39, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(34832, @PTEMPLATE+40, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(34835, @PTEMPLATE+41, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31947, @PTEMPLATE+42, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31951, @PTEMPLATE+43, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31950, @PTEMPLATE+44, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31956, @PTEMPLATE+45, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31953, @PTEMPLATE+46, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31948, @PTEMPLATE+47, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31077, @PTEMPLATE+48, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31053, @PTEMPLATE+49, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(31088, @PTEMPLATE+50, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(112607, @PTEMPLATE+51, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(112604, @PTEMPLATE+52, 'Copper Veins - Westfall - Deadmines Entrance', 10),
(112602, @PTEMPLATE+53, 'Copper Veins - Westfall - Deadmines Entrance', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+54, 4, 'Westfall - Deadmines Entrance - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+37, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+38, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+39, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+40, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+41, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+42, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+43, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+44, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+45, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+46, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+47, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+48, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+49, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+50, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+51, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+52, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(@PTEMPLATE+53, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Copper Veins', 0),
(1451, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1450, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1449, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1442, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1440, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1438, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1439, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0),
(1441, @PTEMPLATE+54, 0, 'Westfall - Deadmines Entrance - Tin Vein / Silver Vein', 0);

UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 1112;
UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry` = 1111;

-- Darkshore
UPDATE `pool_template` SET `description` = 'Copper Veins - Darkshore (Master Pool)' WHERE `entry` = 1098;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Darkshore' WHERE `guid` IN (363610, 363611, 363612, 363613);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Darkshore" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
-- Cliffspring Falls
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (363570, 363531, 363576, 363530, 363574, 112702, 363571, 365557, 365593, 251745, 251753);
DELETE FROM `pool_gameobject` WHERE `guid` IN (363570, 363531, 363576, 363530, 363574, 112702, 363571);
DELETE FROM `pool_pool` WHERE `pool_id` IN (2407, 7077);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls' WHERE `entry` IN (2407, 7077);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Darkshore - Cliffspring Falls' WHERE `pool_entry` IN (2407, 7077);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+55, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+56, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+57, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+58, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+59, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+60, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(@PTEMPLATE+61, 1, 'Copper Veins - Darkshore - Cliffspring Falls', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(363570, @PTEMPLATE+55, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(363531, @PTEMPLATE+56, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(363576, @PTEMPLATE+57, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(363530, @PTEMPLATE+58, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(363574, @PTEMPLATE+59, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(112702, @PTEMPLATE+60, 'Copper Veins - Darkshore - Cliffspring Falls', 10),
(363571, @PTEMPLATE+61, 'Copper Veins - Darkshore - Cliffspring Falls', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+62, 3, 'Darkshore - Cliffspring Falls - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+55, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+56, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+57, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+58, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+59, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+60, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(@PTEMPLATE+61, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Copper Veins', 0),
(2407, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Tin Vein / Silver Vein', 0),
(7077, @PTEMPLATE+62, 0, 'Darkshore - Cliffspring Falls - Tin Vein / Silver Vein', 0);

UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 1099;
UPDATE `pool_template` SET `max_limit` = 27 WHERE `entry` = 1098;

-- Loch Modan
UPDATE `pool_template` SET `description` = 'Copper Veins - Loch Modan (Master Pool)' WHERE `entry` = 1166;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Loch Modan' WHERE `guid` = 12919;
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Loch Modan" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
-- Stonesplinter Valley
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (112665, 112664, 30083, 30088, 30086, 30090, 43236, 112663, 112662, 251636, 251637, 251645, 251646);
DELETE FROM `pool_gameobject` WHERE `guid` IN (112665, 112664, 30083, 30088, 30086, 30090, 43236, 112663, 112662);
DELETE FROM `pool_pool` WHERE `pool_id` IN (7020, 7021);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley' WHERE `entry` IN (7020, 7021);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Stonesplinter Valley' WHERE `pool_entry` IN (7020, 7021);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+63, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+64, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+65, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+66, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+67, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+68, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+69, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+70, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(@PTEMPLATE+71, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(30083, @PTEMPLATE+63, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(30088, @PTEMPLATE+64, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(30086, @PTEMPLATE+65, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(30090, @PTEMPLATE+66, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(43236, @PTEMPLATE+67, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(112663, @PTEMPLATE+68, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(112664, @PTEMPLATE+69, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(112662, @PTEMPLATE+70, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10),
(112665, @PTEMPLATE+71, 'Copper Veins - Loch Modan - Stonesplinter Valley', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+72, 3, 'Loch Modan - Stonesplinter Valley - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+63, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+64, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+65, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+66, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+67, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+68, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+69, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+70, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+71, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(7021, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0),
(7020, @PTEMPLATE+72, 0, 'Loch Modan - Stonesplinter Valley - Tin Vein / Silver Vein', 0);

-- Silver Stream Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (30048, 30029, 13085, 13077, 30039, 30060, 13022, 13609, 112672, 112674);
DELETE FROM `pool_gameobject` WHERE `guid` IN (30048, 30029, 13085, 13077, 30039, 30060, 13022, 13609, 112672, 112674);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+73, 3, 'Loch Modan - Silver Stream Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(13085, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(13077, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(30039, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(30060, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(13022, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(13609, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(30048, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(30029, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(112672, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10),
(112674, @PTEMPLATE+73, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10);

-- Mo'Grosh Stronghold
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (23228, 23256, 23229, 23257, 23231, 23259, 23232, 23260, 23233, 23261, 23235, 23263, 251642, 251651);
DELETE FROM `pool_pool` WHERE `pool_id` IN (2547, 2548, 7026, 2551, 2554, 2552, 2550);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold' WHERE `entry` IN (2547, 2548, 7026, 2551, 2554, 2552, 2550);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Loch Modan - Mo\'Grosh Stronghold' WHERE `pool_entry` IN (2547, 2548, 7026, 2551, 2554, 2552, 2550);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+74, 3, 'Loch Modan - Mo\'Grosh Stronghold - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2547, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(2548, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(7026, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(2551, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(2554, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(2552, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0),
(2550, @PTEMPLATE+74, 0, 'Loch Modan - Mo\'Grosh Stronghold - Tin Vein / Silver Vein', 0);

UPDATE `pool_template` SET `max_limit` = 30 WHERE `entry` = 1166;
UPDATE `pool_template` SET `max_limit` = 8 WHERE `entry`=1186;

-- Redridge Mountains
UPDATE `pool_gameobject` SET `description`='Copper Vein - Redridge Mountains' WHERE  `guid` IN (3248, 3249, 5055);
-- Rethban Caverns
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (5512, 3248, 3249, 5508, 93001, 93006, 93002, 93007, 93003, 93008, 93004, 93009, 93005, 93010, 427008, 427009);
DELETE FROM `pool_gameobject` WHERE `guid` IN (5512, 3248, 3249, 5508);
DELETE FROM `pool_pool` WHERE `pool_id` IN (9402, 9403, 9399, 9401, 9400, 17028);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns' WHERE `entry` IN (9402, 9403, 9399, 9401, 9400, 17028);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Redridge Mountains - Rethban Caverns' WHERE `pool_entry` IN (9402, 9403, 9399, 9401, 9400, 17028);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+75, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(@PTEMPLATE+76, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(@PTEMPLATE+77, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(@PTEMPLATE+78, 1, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(5512, @PTEMPLATE+75, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(3248, @PTEMPLATE+76, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(3249, @PTEMPLATE+77, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10),
(5508, @PTEMPLATE+78, 'Copper Veins - Redridge Mountains - Rethban Caverns', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+79, 3, 'Redridge Mountains - Rethban Caverns - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+75, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+76, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+77, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(@PTEMPLATE+78, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Copper Veins', 0),
(9402, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(9403, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(9399, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(9401, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(9400, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0),
(17028, @PTEMPLATE+79, 0, 'Redridge Mountains - Rethban Caverns - Tin Vein / Silver Vein', 0);

-- Render's Rock
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(4663, 1732, 0, -8683.48, -2235.91, 155.424, 5.63741, 0, 0, -0.317305, 0.948324, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(151, 1, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_max`) VALUES 
(25453, 151, 5, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 10),
(4663, 151, 95, 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock', 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (34766, 20460, 20461, 18601, 34768, 34767, 18683, 112624, 112621, 112622, 112623, 25453, 4663, 34787, 34788, 93011, 93013, 151782, 151783, 151784, 151785, 151786, 151791, 151792, 151793, 151797, 151798, 151799, 151800, 151801, 151813, 151814, 151815, 151816, 151817, 151822, 151823, 151824, 151828, 151829, 151830, 151831, 151832, 389336, 389337, 389356, 389357);
DELETE FROM `pool_gameobject` WHERE `guid` IN (34766, 20460, 20461, 18601, 34768, 34767, 18683, 112624, 112621, 112622, 112623);
DELETE FROM `pool_pool` WHERE `pool_id` IN (151, 9389, 2245, 9381, 9382, 9380, 9379, 9397, 9395, 9396, 9394, 9393, 9404, 9387, 2244, 9388, 9378, 34918);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock' WHERE `entry` IN (151, 9389, 2245, 9381, 9382, 9380, 9379, 9397, 9395, 9396, 9394, 9393, 9404, 9387, 2244, 9388, 9378, 34918);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Redridge Mountains - Render\'s Rock' WHERE `pool_entry` IN (151, 9389, 2245, 9381, 9382, 9380, 9379, 9397, 9395, 9396, 9394, 9393, 9404, 9387, 2244, 9388, 9378, 34918);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+80, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+81, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+82, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+83, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+84, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+85, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+86, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+87, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+88, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+89, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(@PTEMPLATE+90, 1, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(34766, @PTEMPLATE+80, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(20460, @PTEMPLATE+81, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(20461, @PTEMPLATE+82, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(18601, @PTEMPLATE+83, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(34768, @PTEMPLATE+84, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(34767, @PTEMPLATE+85, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(18683, @PTEMPLATE+86, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(112624, @PTEMPLATE+87, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(112621, @PTEMPLATE+88, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(112622, @PTEMPLATE+89, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10),
(112623, @PTEMPLATE+90, 'Copper Veins - Redridge Mountains - Render\'s Rock', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+91, 3, 'Redridge Mountains - Render\'s Rock - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+80, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+81, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+82, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+83, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+84, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+85, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+86, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+87, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+88, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+89, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(@PTEMPLATE+90, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Copper Veins', 0),
(151, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9389, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(2245, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9381, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9382, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9380, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9379, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9397, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9395, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9396, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9394, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9393, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9404, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9387, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(2244, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9388, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(9378, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0),
(34918, @PTEMPLATE+91, 0, 'Redridge Mountains - Render\'s Rock - Tin Vein / Silver Vein', 0);

UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry`=1128;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=400;

-- Silverpine Forest
UPDATE `pool_template` SET `description` = 'Copper Veins - Silverpine Forest (Master Pool)' WHERE `entry` = 1044;
-- Skittering Dark
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (9767, 35490, 35534, 35540, 35549, 35535, 35616, 35443, 35617, 35536, 35596, 112682, 112680, 112679);
DELETE FROM `pool_gameobject` WHERE `guid` IN (9767, 35490, 35534, 35540, 35549, 35535, 35616, 35443, 35617, 35536, 35596, 112682, 112680, 112679);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+92, 3, 'Silverpine Forest - Skittering Dark - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(9767, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35490, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35534, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35540, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35549, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35535, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35616, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35443, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35617, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35536, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(35596, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(112682, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(112680, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10),
(112679, @PTEMPLATE+92, 0, 'Copper Vein - Silverpine Forest - Skittering Dark', 0, 0, 10);

-- Deep Elem Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (9793, 4979, 42063, 42072, 42071, 251530, 325629, 325672, 427069);
DELETE FROM `pool_gameobject` WHERE `guid` IN (9793, 4979, 42063, 42072, 42071);
DELETE FROM `pool_pool` WHERE `pool_id` IN (5858, 2859, 9729);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine' WHERE `entry` IN (5858, 2859, 9729);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Silverpine Forest - Deep Elem Mine' WHERE `pool_entry` IN (5858, 2859, 9729);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+93, 1, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(@PTEMPLATE+94, 1, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(@PTEMPLATE+95, 1, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(@PTEMPLATE+96, 1, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(@PTEMPLATE+97, 1, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(9793, @PTEMPLATE+93, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(4979, @PTEMPLATE+94, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(42063, @PTEMPLATE+95, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(42072, @PTEMPLATE+96, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10),
(42071, @PTEMPLATE+97, 'Copper Veins - Silverpine Forest - Deep Elem Mine', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+98, 2, 'Silverpine Forest - Deep Elem Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+93, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Copper Veins', 0),
(@PTEMPLATE+94, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Copper Veins', 0),
(@PTEMPLATE+95, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Copper Veins', 0),
(@PTEMPLATE+96, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Copper Veins', 0),
(@PTEMPLATE+97, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Copper Veins', 0),
(5858, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein', 0),
(2859, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein', 0),
(9729, @PTEMPLATE+98, 0, 'Silverpine Forest - Deep Elem Mine - Tin Vein / Silver Vein', 0);

-- Beren's Peril
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (35444, 112676, 16828, 16817, 16825, 16836, 16826, 16837, 325608, 325651, 325613, 325656, 325615, 325658, 325619, 325662, 325620, 325663, 325621, 325664, 325624, 325667, 325627, 325670, 325632, 325675, 325633, 325676, 325635, 325678, 325637, 325680, 325639, 325682);
DELETE FROM `pool_gameobject` WHERE `guid` IN (35444, 112676);
DELETE FROM `pool_pool` WHERE `pool_id` IN (452, 444, 453, 9732, 9735, 9721, 9737, 9720, 9724, 9733, 9719, 9727, 9739, 9715, 9713, 9708);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril' WHERE `entry` IN (452, 444, 453, 9732, 9735, 9721, 9737, 9720, 9724, 9733, 9719, 9727, 9739, 9715, 9713, 9708);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Silverpine Forest - Beren\'s Peril' WHERE `pool_entry` IN (452, 444, 453, 9732, 9735, 9721, 9737, 9720, 9724, 9733, 9719, 9727, 9739, 9715, 9713, 9708);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+99, 1, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 10),
(@PTEMPLATE+100, 1, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(35444, @PTEMPLATE+99, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 10),
(112676, @PTEMPLATE+100, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+101, 3, 'Silverpine Forest - Beren\'s Peril - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+99, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Copper Veins', 0),
(@PTEMPLATE+100, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Copper Veins', 0),
(452, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(444, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(453, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9732, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9735, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9721, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9737, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9720, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9724, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9733, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9719, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9727, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9739, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9715, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9713, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0),
(9708, @PTEMPLATE+101, 0, 'Silverpine Forest - Beren\'s Peril - Tin Vein / Silver Vein', 0);

UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1354;
UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry` = 1044;

UPDATE `pool_template` SET `description` = 'Copper Veins - Deadmines (Master Pool)' WHERE `entry` = 4486;
UPDATE `pool_template` SET `description` = 'Copper Veins - Wailing Caverns (Master Pool)' WHERE `entry` = 4794;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
