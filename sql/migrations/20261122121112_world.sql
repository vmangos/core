DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261122121112');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261122121112');
-- Add your query below.

SET @PTEMPLATE = 25700;
SET @GOGUID = 8442;

-- 1
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Zoram Strand West';
DELETE FROM `pool_pool` WHERE pool_id IN (2202, 6063, 6073, 6105, 6107);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2202, 6063, 6073, 6105, 6107);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2202, 6063, 6073, 6105, 6107);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2202, 6063, 6073, 6105, 6107));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2202, @PTEMPLATE, 0, @DESC, 0),
(6063, @PTEMPLATE, 0, @DESC, 0),
(6073, @PTEMPLATE, 0, @DESC, 0),
(6105, @PTEMPLATE, 0, @DESC, 0),
(6107, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 2
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Zoram Strand East';
DELETE FROM `pool_pool` WHERE pool_id IN (2200, 2203, 6087, 6089, 6108, 9320);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2200, 2203, 6087, 6089, 6108, 9320);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2200, 2203, 6087, 6089, 6108, 9320);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2200, 2203, 6087, 6089, 6108, 9320));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2200, @PTEMPLATE, 0, @DESC, 0),
(2203, @PTEMPLATE, 0, @DESC, 0),
(6087, @PTEMPLATE, 0, @DESC, 0),
(6089, @PTEMPLATE, 0, @DESC, 0),
(6108, @PTEMPLATE, 0, @DESC, 0),
(9320, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 3
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Lake Falathim';
DELETE FROM `pool_pool` WHERE pool_id IN (6062, 6075, 6104, 9319, 9322);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6062, 6075, 6104, 9319, 9322);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6062, 6075, 6104, 9319, 9322);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6062, 6075, 6104, 9319, 9322));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6062, @PTEMPLATE, 0, @DESC, 0),
(6075, @PTEMPLATE, 0, @DESC, 0),
(6104, @PTEMPLATE, 0, @DESC, 0),
(9319, @PTEMPLATE, 0, @DESC, 0),
(9322, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 4
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - The Ruins of Ordil\'Aran';
DELETE FROM `pool_pool` WHERE pool_id IN (2201, 6059, 6088, 6091, 6106);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2201, 6059, 6088, 6091, 6106);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2201, 6059, 6088, 6091, 6106);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2201, 6059, 6088, 6091, 6106));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2201, @PTEMPLATE, 0, @DESC, 0),
(6059, @PTEMPLATE, 0, @DESC, 0),
(6088, @PTEMPLATE, 0, @DESC, 0),
(6091, @PTEMPLATE, 0, @DESC, 0),
(6106, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 5
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Maestra\'s Post';
DELETE FROM `pool_pool` WHERE pool_id IN (6061, 6071, 6084, 6093, 9307, 9316);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6061, 6071, 6084, 9307, 9316);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6061, 6071, 6084, 9307, 9316);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6061, 6071, 6084, 9307, 9316));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6061, @PTEMPLATE, 0, @DESC, 0),
(6071, @PTEMPLATE, 0, @DESC, 0),
(6084, @PTEMPLATE, 0, @DESC, 0),
(9307, @PTEMPLATE, 0, @DESC, 0),
(9316, @PTEMPLATE, 0, @DESC, 0);
DELETE FROM `pool_template` WHERE `entry` = 6093;
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` = 6093);
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 6093;
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 6
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - The Shrine of Aessina';
DELETE FROM `pool_pool` WHERE pool_id IN (1571, 2193, 2195, 6065, 6078, 6111);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (1571, 2193, 2195, 6065, 6078, 6111);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (1571, 2193, 2195, 6065, 6078, 6111);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1571, 2193, 2195, 6065, 6078, 6111));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1571, @PTEMPLATE, 0, @DESC, 0),
(2193, @PTEMPLATE, 0, @DESC, 0),
(2195, @PTEMPLATE, 0, @DESC, 0),
(6065, @PTEMPLATE, 0, @DESC, 0),
(6078, @PTEMPLATE, 0, @DESC, 0),
(6111, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 7
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Astranaar';
DELETE FROM `pool_pool` WHERE pool_id IN (1293, 2194, 2198, 6068, 6077, 7063);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (1293, 2194, 2198, 6068, 6077, 7063);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (1293, 2194, 2198, 6068, 6077, 7063);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1293, 2194, 2198, 6068, 6077, 7063));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1293, @PTEMPLATE, 0, @DESC, 0),
(2194, @PTEMPLATE, 0, @DESC, 0),
(2198, @PTEMPLATE, 0, @DESC, 0),
(6068, @PTEMPLATE, 0, @DESC, 0),
(6077, @PTEMPLATE, 0, @DESC, 0),
(7063, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 8
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - The Ruins of Stardust';
DELETE FROM `pool_pool` WHERE pool_id IN (1294, 2186, 2190, 2191, 2192, 6112);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (1294, 2186, 2190, 2191, 2192, 6112);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (1294, 2186, 2190, 2191, 2192, 6112);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1294, 2186, 2190, 2191, 2192, 6112));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1294, @PTEMPLATE, 0, @DESC, 0),
(2186, @PTEMPLATE, 0, @DESC, 0),
(2190, @PTEMPLATE, 0, @DESC, 0),
(2191, @PTEMPLATE, 0, @DESC, 0),
(2192, @PTEMPLATE, 0, @DESC, 0),
(6112, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 9
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Thistlefur Hold North';
DELETE FROM `pool_pool` WHERE pool_id IN (2199, 2278, 2279, 6066, 6086);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2199, 2278, 2279, 6066, 6086);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2199, 2278, 2279, 6066, 6086);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2199, 2278, 2279, 6066, 6086));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2199, @PTEMPLATE, 0, @DESC, 0),
(2278, @PTEMPLATE, 0, @DESC, 0),
(2279, @PTEMPLATE, 0, @DESC, 0),
(6066, @PTEMPLATE, 0, @DESC, 0),
(6086, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 10
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Thistlefur Hold South';
DELETE FROM `pool_pool` WHERE pool_id IN (2277, 6067, 6085, 6090, 7064);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2277, 6067, 6085, 6090, 7064);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2277, 6067, 6085, 6090, 7064);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2277, 6067, 6085, 6090, 7064));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2277, @PTEMPLATE, 0, @DESC, 0),
(6067, @PTEMPLATE, 0, @DESC, 0),
(6085, @PTEMPLATE, 0, @DESC, 0),
(6090, @PTEMPLATE, 0, @DESC, 0),
(7064, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 11
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Iris Lake';
DELETE FROM `pool_pool` WHERE pool_id IN (2196, 2197, 6064, 6102, 6103, 6109);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2196, 2197, 6064, 6102, 6103, 6109);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2196, 2197, 6064, 6102, 6103, 6109);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2196, 2197, 6064, 6102, 6103, 6109));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2196, @PTEMPLATE, 0, @DESC, 0),
(2197, @PTEMPLATE, 0, @DESC, 0),
(6064, @PTEMPLATE, 0, @DESC, 0),
(6102, @PTEMPLATE, 0, @DESC, 0),
(6103, @PTEMPLATE, 0, @DESC, 0),
(6109, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 12
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Mystral Lake';
DELETE FROM `pool_pool` WHERE pool_id IN (2187, 2188, 2189, 6095, 6110, 9323);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2187, 2188, 2189, 6095, 6110, 9323);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2187, 2188, 2189, 6095, 6110, 9323);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2187, 2188, 2189, 6095, 6110, 9323));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2187, @PTEMPLATE, 0, @DESC, 0),
(2188, @PTEMPLATE, 0, @DESC, 0),
(2189, @PTEMPLATE, 0, @DESC, 0),
(6095, @PTEMPLATE, 0, @DESC, 0),
(6110, @PTEMPLATE, 0, @DESC, 0),
(9323, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 13
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Central';
DELETE FROM `pool_pool` WHERE pool_id IN (6082, 6083, 6099, 6100, 7062, 9300);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6082, 6083, 6099, 6100, 7062, 9300);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6082, 6083, 6099, 6100, 7062, 9300);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6082, 6083, 6099, 6100, 7062, 9300));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6082, @PTEMPLATE, 0, @DESC, 0),
(6083, @PTEMPLATE, 0, @DESC, 0),
(6099, @PTEMPLATE, 0, @DESC, 0),
(6100, @PTEMPLATE, 0, @DESC, 0),
(7062, @PTEMPLATE, 0, @DESC, 0),
(9300, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 14
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Night Run';
DELETE FROM `pool_pool` WHERE pool_id IN (6060, 6070, 6076, 6092, 6098, 9294);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6060, 6070, 6076, 6092, 6098);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6060, 6070, 6076, 6092, 6098);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6060, 6070, 6076, 6092, 6098));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6060, @PTEMPLATE, 0, @DESC, 0),
(6070, @PTEMPLATE, 0, @DESC, 0),
(6076, @PTEMPLATE, 0, @DESC, 0),
(6092, @PTEMPLATE, 0, @DESC, 0),
(6098, @PTEMPLATE, 0, @DESC, 0);
DELETE FROM `pool_template` WHERE `entry` = 9294;
DELETE FROM `gameobject` WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` = 9294);
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 9294;

-- 15
SET @PTEMPLATE = @PTEMPLATE + 1;
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Felfire Hill';
DELETE FROM `pool_pool` WHERE pool_id IN (2185, 6072, 6079, 6081, 6097);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2185, 6072, 6079, 6081, 6097);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2185, 6072, 6079, 6081, 6097);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2185, 6072, 6079, 6081, 6097));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2185, @PTEMPLATE, 0, @DESC, 0),
(6072, @PTEMPLATE, 0, @DESC, 0),
(6079, @PTEMPLATE, 0, @DESC, 0),
(6081, @PTEMPLATE, 0, @DESC, 0),
(6097, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 16
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Demon Fall Canyon';
DELETE FROM `pool_pool` WHERE pool_id IN (1312, 1566, 6069, 6080, 6094);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (1312, 1566, 6069, 6080, 6094);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (1312, 1566, 6069, 6080, 6094);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1312, 1566, 6069, 6080, 6094));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1312, @PTEMPLATE, 0, @DESC, 0),
(1566, @PTEMPLATE, 0, @DESC, 0),
(6069, @PTEMPLATE, 0, @DESC, 0),
(6080, @PTEMPLATE, 0, @DESC, 0),
(6094, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 17
SET @DESC = 'Ashenvale - Tin Vein / Silver Vein - Warsong Lumber Camp';
DELETE FROM `pool_pool` WHERE pool_id IN (6074, 6096, 6101, 9317, 9318, 9321);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6074, 6096, 6101, 9317, 9318, 9321);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6074, 6096, 6101, 9317, 9318, 9321);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6074, 6096, 6101, 9317, 9318, 9321));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6074, @PTEMPLATE, 0, @DESC, 0),
(6096, @PTEMPLATE, 0, @DESC, 0),
(6101, @PTEMPLATE, 0, @DESC, 0),
(9317, @PTEMPLATE, 0, @DESC, 0),
(9318, @PTEMPLATE, 0, @DESC, 0),
(9321, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 18
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Raynewood Retreat East';
DELETE FROM `pool_pool` WHERE pool_id IN (6170, 6174, 9326, 9327, 9338);
DELETE FROM `pool_gameobject` WHERE `guid` = 57436; -- remove non iron/silver/gold nodes
DELETE FROM `gameobject` WHERE `guid` = 57436; -- remove non iron/silver/gold nodes
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6170, 6174, 9326, 9327, 9338);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6170, 6174, 9326, 9327, 9338);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `pool_entry` = 9338 AND `chance` = 40;
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6170, 6174, 9326, 9327, 9338));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6170, @PTEMPLATE, 0, @DESC, 0),
(6174, @PTEMPLATE, 0, @DESC, 0),
(9326, @PTEMPLATE, 0, @DESC, 0),
(9327, @PTEMPLATE, 0, @DESC, 0),
(9338, @PTEMPLATE, 0, @DESC, 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`)
VALUES (@GOGUID, 1734, 1, 2855.24, -2027.55, 169.05, 0.785397, 0, 0, 0.382683, 0.92388, 120, 900, 100, 1, 0, 0, 0, 10); -- add missing gold vein
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`)
VALUES (@GOGUID, 9338, 5, @DESC, 0, 0, 10);
SET @GOGUID = @GOGUID + 1;
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 19
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Raynewood Retreat North';
DELETE FROM `pool_pool` WHERE pool_id IN (2864, 6173, 6175, 6176, 9336, 17056);
DELETE FROM `pool_gameobject` WHERE `guid` = 57434; -- remove non iron/silver/gold nodes
DELETE FROM `gameobject` WHERE `guid` = 57434; -- remove non iron/silver/gold nodes
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2864, 6173, 6175, 6176, 9336, 17056);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2864, 6173, 6175, 6176, 9336, 17056);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `pool_entry` = 9336 AND chance = 40;
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2864, 6173, 6175, 6176, 9336, 17056));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2864, @PTEMPLATE, 0, @DESC, 0),
(6173, @PTEMPLATE, 0, @DESC, 0),
(6175, @PTEMPLATE, 0, @DESC, 0),
(6176, @PTEMPLATE, 0, @DESC, 0),
(9336, @PTEMPLATE, 0, @DESC, 0),
(17056, @PTEMPLATE, 0, @DESC, 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`)
VALUES (@GOGUID, 1734, 1, 2690.09, -2019.96, 169.427, 2.25147, 0, 0, 0.902585, 0.430512, 120, 900, 100, 1, 0, 0, 0, 10); -- add missing gold vein
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`)
VALUES (@GOGUID, 9336, 5, @DESC, 0, 0, 10);
SET @GOGUID = @GOGUID + 1;
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 20
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Night Run South';
DELETE FROM `pool_pool` WHERE pool_id IN (1329, 6177, 6178, 6190, 9324, 17130);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (1329, 6177, 6178, 6190, 9324, 17130);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (1329, 6177, 6178, 6190, 9324, 17130);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1329, 6177, 6178, 6190, 9324, 17130));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1329, @PTEMPLATE, 0, @DESC, 0),
(6177, @PTEMPLATE, 0, @DESC, 0),
(6178, @PTEMPLATE, 0, @DESC, 0),
(6190, @PTEMPLATE, 0, @DESC, 0),
(9324, @PTEMPLATE, 0, @DESC, 0),
(17130, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 21
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Satyrnaar West';
DELETE FROM `pool_pool` WHERE pool_id IN (9328, 9330, 9331, 17131, 17133);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (9328, 9330, 9331, 17131, 17133);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (9328, 9330, 9331, 17131, 17133);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (9328, 9330, 9331, 17131, 17133));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9328, @PTEMPLATE, 0, @DESC, 0),
(9330, @PTEMPLATE, 0, @DESC, 0),
(9331, @PTEMPLATE, 0, @DESC, 0),
(17131, @PTEMPLATE, 0, @DESC, 0),
(17133, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 22
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Splintertree Post';
DELETE FROM `pool_pool` WHERE pool_id IN (2861, 2862, 6167, 9325, 17129, 17132);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2861, 2862, 6167, 9325, 17129, 17132);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2861, 2862, 6167, 9325, 17129, 17132);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2861, 2862, 6167, 9325, 17129, 17132));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2861, @PTEMPLATE, 0, @DESC, 0),
(2862, @PTEMPLATE, 0, @DESC, 0),
(6167, @PTEMPLATE, 0, @DESC, 0),
(9325, @PTEMPLATE, 0, @DESC, 0),
(17129, @PTEMPLATE, 0, @DESC, 0),
(17132, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 23
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Fallen Sky Lake';
DELETE FROM `pool_pool` WHERE pool_id IN (2863, 6169, 9329, 9333, 9334, 17126);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2863, 6169, 9329, 9333, 9334, 17126);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2863, 6169, 9329, 9333, 9334, 17126);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2863, 6169, 9329, 9333, 9334, 17126));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2863, @PTEMPLATE, 0, @DESC, 0),
(6169, @PTEMPLATE, 0, @DESC, 0),
(9329, @PTEMPLATE, 0, @DESC, 0),
(9333, @PTEMPLATE, 0, @DESC, 0),
(9334, @PTEMPLATE, 0, @DESC, 0),
(17126, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 24
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Warsong Labor Camp';
DELETE FROM `pool_pool` WHERE pool_id IN (6183, 6188, 6189, 6191, 9335, 17125);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6183, 6188, 6189, 6191, 9335, 17125);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6183, 6188, 6189, 6191, 9335, 17125);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6183, 6188, 6189, 6191, 9335, 17125));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6183, @PTEMPLATE, 0, @DESC, 0),
(6188, @PTEMPLATE, 0, @DESC, 0),
(6189, @PTEMPLATE, 0, @DESC, 0),
(6191, @PTEMPLATE, 0, @DESC, 0),
(9335, @PTEMPLATE, 0, @DESC, 0),
(17125, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 25
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Felfire Hill';
DELETE FROM `pool_pool` WHERE pool_id IN (6172, 6180, 6181, 17036, 17128);
DELETE FROM `pool_gameobject` WHERE `guid` = 427020; -- remove non iron/silver/gold nodes
DELETE FROM `gameobject` WHERE `guid` = 427020; -- remove non iron/silver/gold nodes
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6172, 6180, 6181, 17036, 17128);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6172, 6180, 6181, 17036, 17128);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `pool_entry` = 17036 AND chance = 40;
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6172, 6180, 6181, 17036, 17128));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6172, @PTEMPLATE, 0, @DESC, 0),
(6180, @PTEMPLATE, 0, @DESC, 0),
(6181, @PTEMPLATE, 0, @DESC, 0),
(17036, @PTEMPLATE, 0, @DESC, 0),
(17128, @PTEMPLATE, 0, @DESC, 0);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`)
VALUES (@GOGUID, 1734, 1, 2238.02, -2863.79, 132.181, 2.02458, 0, 0, 0.848047, 0.529921, 120, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) -- add missing gold vein
VALUES (@GOGUID, 17036, 5, @DESC, 0, 0, 10);
SET @GOGUID = @GOGUID + 1;
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 26
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Demon Fall Canyon West';
DELETE FROM `pool_pool` WHERE pool_id IN (2580, 6184, 6186, 6187, 17127);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2580, 6184, 6186, 6187, 17127);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2580, 6184, 6186, 6187, 17127);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2580, 6184, 6186, 6187, 17127));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2580, @PTEMPLATE, 0, @DESC, 0),
(6184, @PTEMPLATE, 0, @DESC, 0),
(6186, @PTEMPLATE, 0, @DESC, 0),
(6187, @PTEMPLATE, 0, @DESC, 0),
(17127, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 27
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Demon Fall Canyon East';
DELETE FROM `pool_pool` WHERE pool_id IN (2581, 2582, 2865, 6171, 6182, 6185);
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (2581, 2582, 2865, 6171, 6182, 6185);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (2581, 2582, 2865, 6171, 6182, 6185);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2581, 2582, 2865, 6171, 6182, 6185));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2581, @PTEMPLATE, 0, @DESC, 0),
(2582, @PTEMPLATE, 0, @DESC, 0),
(2865, @PTEMPLATE, 0, @DESC, 0),
(6171, @PTEMPLATE, 0, @DESC, 0),
(6182, @PTEMPLATE, 0, @DESC, 0),
(6185, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

-- 28
SET @DESC = 'Ashenvale - Iron Deposit / Silver Vein / Gold Vein - Warsong Lumber Camp';
DELETE FROM `pool_pool` WHERE pool_id IN (6168, 6179, 9332, 9337);
DELETE FROM `pool_gameobject` WHERE `guid` IN (57361, 57438, 94254, 94265); -- remove non iron/gold nodes
DELETE FROM `gameobject` WHERE `guid` IN (57361, 57438, 94254, 94265); -- remove non iron/gold nodes
UPDATE `pool_template` SET `description` = @DESC WHERE `entry` IN (6168, 6179, 9332, 9337);
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `pool_entry` IN (6168, 6179, 9332, 9337);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `pool_entry` IN (6168, 6179, 9332, 9337) AND chance IN (40, 90);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6168, 6179, 9332, 9337));
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 1, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6168, @PTEMPLATE, 0, @DESC, 0),
(6179, @PTEMPLATE, 0, @DESC, 0),
(9332, @PTEMPLATE, 0, @DESC, 0),
(9337, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 1;

DELETE FROM `pool_template` WHERE `entry` = 1075; -- delete old ashenvale copper master pool

-- 29
SET @DESC = 'Ashenvale - Copper Vein - Splintertree Post';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (55557, 55561, 55563, 55583, 55585, 55586);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (55557, 55561, 55563, 55583, 55585, 55586);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 6, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 55557;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 55561;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55563;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 55583;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55585;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 6 WHERE `guid` = 55586;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 6, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 7;

-- 30
SET @DESC = 'Ashenvale - Copper Vein - Iris Lake';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (1011, 55565, 55567, 55570, 55564, 55571);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (1011, 55565, 55567, 55570, 55564, 55571);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 6, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 1011;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 55565;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55567;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 55570;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55564;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 6 WHERE `guid` = 55571;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 6, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 7;

-- 31
SET @DESC = 'Ashenvale - Copper Vein - Astranaar';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (112708, 55582, 55578, 55577, 55574);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (112708, 55582, 55578, 55577, 55574);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 112708;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 55582;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55578;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 55577;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55574;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 6;

-- 32
SET @DESC = 'Ashenvale - Copper Vein - The Shrine of Aessina';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (55575, 1634, 55568, 1633, 55581);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (55575, 1634, 55568, 1633, 55581);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 55575;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 1634;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55568;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 1633;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55581;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 6;

-- 33
SET @DESC = 'Ashenvale - Copper Vein - Thistlefur Village';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (55548, 1012, 55543, 55542, 55550, 55558);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (55548, 1012, 55543, 55542, 55550, 55558);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 6, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 55548;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 1012;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55543;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 55542;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55550;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 6 WHERE `guid` = 55558;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 6, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 7;

-- 34
SET @DESC = 'Ashenvale - Copper Vein - Maestra\'s Post';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (112707, 55540, 55555, 55587, 55551);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (112707, 55540, 55555, 55587, 55551);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 112707;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 55540;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55555;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 55587;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55551;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0);
SET @PTEMPLATE = @PTEMPLATE + 6;

-- 35
SET @DESC = 'Ashenvale - Copper Vein - The Ruins of Ordil\'Aran';
UPDATE `pool_gameobject` SET `description` = @DESC WHERE `guid` IN (55537, 55535, 55546, 112706, 55588);
UPDATE `gameobject` SET `spawntimesecsmin` = 120, `spawntimesecsmax` = 900 WHERE `guid` IN (55537, 55535, 55546, 112706, 55588);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE, 2, CONCAT(@DESC, ' - Master'), 0, 0, 0, 10),
(@PTEMPLATE + 1, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 2, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 3, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 4, 1, @DESC, 0, 0, 0, 10),
(@PTEMPLATE + 5, 1, @DESC, 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 1 WHERE `guid` = 55537;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 2 WHERE `guid` = 55535;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 3 WHERE `guid` = 55546;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 4 WHERE `guid` = 112706;
UPDATE `pool_gameobject` SET `pool_entry` = @PTEMPLATE + 5 WHERE `guid` = 55588;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE + 1, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 2, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 3, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 4, @PTEMPLATE, 0, @DESC, 0),
(@PTEMPLATE + 5, @PTEMPLATE, 0, @DESC, 0);

-- delete incorrect ashenvale gameobjects & pool records - copper veins
DELETE FROM `pool_pool` WHERE `pool_id` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55544, 55539, 55554, 55536, 55549, 55572, 55545, 55547, 55576, 55541, 55538, 55580, 55553, 55552, 55573, 55579, 55556, 55559, 55566, 55569, 55534, 55584, 55562, 55560));
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55544, 55539, 55554, 55536, 55549, 55572, 55545, 55547, 55576, 55541, 55538, 55580, 55553, 55552, 55573, 55579, 55556, 55559, 55566, 55569, 55534, 55584, 55562, 55560));
DELETE FROM `pool_gameobject` WHERE `guid` IN (55544, 55539, 55554, 55536, 55549, 55572, 55545, 55547, 55576, 55541, 55538, 55580, 55553, 55552, 55573, 55579, 55556, 55559, 55566, 55569, 55534, 55584, 55562, 55560);
DELETE FROM `gameobject` WHERE `guid` IN (55544, 55539, 55554, 55536, 55549, 55572, 55545, 55547, 55576, 55541, 55538, 55580, 55553, 55552, 55573, 55579, 55556, 55559, 55566, 55569, 55534, 55584, 55562, 55560);

-- delete incorrect ashenvale gameobjects & pool records - tin veins
DELETE FROM `pool_pool` WHERE `pool_id` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55792, 55791, 55793, 55794, 55790, 55789, 55788, 94435, 55784, 55782, 55783, 55785, 55786, 55781, 55779, 55772, 57434, 57436, 55771, 55795, 55770, 55773, 55769, 55775, 55774, 55776, 55768, 55777, 55767, 55778, 55756, 55755, 427020, 55759, 55758, 55760, 55757, 55765, 55766, 55764, 55762, 55763, 55761));
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55792, 55791, 55793, 55794, 55790, 55789, 55788, 94435, 55784, 55782, 55783, 55785, 55786, 55781, 55779, 55772, 57434, 57436, 55771, 55795, 55770, 55773, 55769, 55775, 55774, 55776, 55768, 55777, 55767, 55778, 55756, 55755, 427020, 55759, 55758, 55760, 55757, 55765, 55766, 55764, 55762, 55763, 55761));
DELETE FROM `pool_gameobject` WHERE `guid` IN (55792, 55791, 55793, 55794, 55790, 55789, 55788, 94435, 55784, 55782, 55783, 55785, 55786, 55781, 55779, 55772, 57434, 57436, 55771, 55795, 55770, 55773, 55769, 55775, 55774, 55776, 55768, 55777, 55767, 55778, 55756, 55755, 427020, 55759, 55758, 55760, 55757, 55765, 55766, 55764, 55762, 55763, 55761);
DELETE FROM `gameobject` WHERE `guid` IN (55792, 55791, 55793, 55794, 55790, 55789, 55788, 94435, 55784, 55782, 55783, 55785, 55786, 55781, 55779, 55772, 57434, 57436, 55771, 55795, 55770, 55773, 55769, 55775, 55774, 55776, 55768, 55777, 55767, 55778, 55756, 55755, 427020, 55759, 55758, 55760, 55757, 55765, 55766, 55764, 55762, 55763, 55761);

-- delete incorrect ashenvale gameobjects & pool records - silver veins
DELETE FROM `pool_pool` WHERE `pool_id` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55841, 55840, 55842, 55843, 55839, 55838, 55837, 94489, 55833, 55831, 55832, 55834, 55835, 55830, 55828, 55821, 55820, 55844, 55819, 55822, 55818, 55824, 55823, 55825, 55817, 55826, 55816, 55827, 55805, 55804, 55808, 55807, 55809, 55806, 55814, 55815, 55813, 55811, 55812, 55810));
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (55841, 55840, 55842, 55843, 55839, 55838, 55837, 94489, 55833, 55831, 55832, 55834, 55835, 55830, 55828, 55821, 55820, 55844, 55819, 55822, 55818, 55824, 55823, 55825, 55817, 55826, 55816, 55827, 55805, 55804, 55808, 55807, 55809, 55806, 55814, 55815, 55813, 55811, 55812, 55810));
DELETE FROM `pool_gameobject` WHERE `guid` IN (55841, 55840, 55842, 55843, 55839, 55838, 55837, 94489, 55833, 55831, 55832, 55834, 55835, 55830, 55828, 55821, 55820, 55844, 55819, 55822, 55818, 55824, 55823, 55825, 55817, 55826, 55816, 55827, 55805, 55804, 55808, 55807, 55809, 55806, 55814, 55815, 55813, 55811, 55812, 55810);
DELETE FROM `gameobject` WHERE `guid` IN (55841, 55840, 55842, 55843, 55839, 55838, 55837, 94489, 55833, 55831, 55832, 55834, 55835, 55830, 55828, 55821, 55820, 55844, 55819, 55822, 55818, 55824, 55823, 55825, 55817, 55826, 55816, 55827, 55805, 55804, 55808, 55807, 55809, 55806, 55814, 55815, 55813, 55811, 55812, 55810);

-- remove incorrect ashenvale pool templates
DELETE FROM `pool_template` WHERE `entry` IN (264, 265, 1080, 10005);

-- fix name of desolace pool template that references ashenvale
UPDATE `pool_template` SET `description` = 'Desolace - Silver Vein / Gold Vein / Iron Deposit (Master Pool)' WHERE `entry` = 1351;

-- check correctness of all ashenvale vein/deposit pools
-- select pt.*, (select count(*) from pool_pool pp where pp.mother_pool = pt.entry) as pool_children, (select pp.mother_pool from pool_pool pp where pp.pool_id = pt.entry) as parent_pool from pool_template pt where upper(pt.description) like '%ASHENVALE%' and (upper(description) like '%VEIN%' or Upper(description) like '%DEPOSIT%' or UPPER(DESCRIPTION) LIKE '%MINERAL%') order by description

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;