DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250212174816');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250212174816');
-- Add your query below.


-- Blasted Lands
SET @OGUID = 69117;
SET @PTEMPLATE = 9435;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, -11033.6298828125, -2686.33251953125, 24.82550621032714843, 4.136432647705078125, 0, 0, -0.87881660461425781, 0.477159708738327026, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 0, -11881.15625, -3089.71728515625, 25.06882476806640625, 3.071766138076782226, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -11033.6298828125, -2686.33251953125, 24.82550621032714843, 4.136432647705078125, 0, 0, -0.87881660461425781, 0.477159708738327026, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, -11881.15625, -3089.71728515625, 25.06882476806640625, 3.071766138076782226, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1359, 0, 'Blasted Lands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1359, 0, 'Blasted Lands - Truesilver Deposit / Small Thorium Vein', 0);

-- EPL
SET @OGUID = 69121;
SET @PTEMPLATE = 9437;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, 3229.7766113281250, -3876.384033203125, 148.5171356201171875, 6.108653545379638671, 0, 0, -0.08715534210205078, 0.996194720268249511, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 3229.7766113281250, -3876.384033203125, 148.5171356201171875, 6.108653545379638671, 0, 0, -0.08715534210205078, 0.996194720268249511, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1264, 0, 'Eastern Plaguelands - Truesilver Deposit / Small Thorium Vein', 0);

-- Feralas
SET @OGUID = 69123;
SET @PTEMPLATE = 9438;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -5030.425292968750, 2119.411865234375, 33.15780258178710937, 0.733038187026977539, 0, 0, 0.358367919921875000, 0.933580458164215087, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -5030.425292968750, 2119.411865234375, 33.15780258178710937, 0.733038187026977539, 0, 0, 0.358367919921875000, 0.933580458164215087, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Feralas', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 985, 0, 'Feralas - Truesilver Deposit / Small Thorium Vein', 0);

-- Hinterlands
SET @OGUID = 69125;
SET @PTEMPLATE = 9439;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, -714.287597656250000, -3791.046142578125, 227.1372833251953125, 0.000000000000000000, 0, 0, 0.000000000000000000, 1.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 0, -671.735473632812500, -3811.949707031250, 223.0373535156250000, 3.996806621551513671, 0, 0, -0.90996074676513671, 0.414694398641586303, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -714.287597656250000, -3791.046142578125, 227.1372833251953125, 0.000000000000000000, 0, 0, 0.000000000000000000, 1.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, -671.735473632812500, -3811.949707031250, 223.0373535156250000, 3.996806621551513671, 0, 0, -0.90996074676513671, 0.414694398641586303, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Hinterlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1070, 0, 'Hinterlands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1070, 0, 'Hinterlands - Truesilver Deposit / Small Thorium Vein', 0);

UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands' WHERE `entry` = 3031;
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Hinterlands' WHERE `guid` IN (22951, 23024, 23097);
DELETE FROM `pool_gameobject` WHERE `guid` = 22951;
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `guid` = 23024;
UPDATE `pool_pool` SET `mother_pool` = 1070, `description` = 'Hinterlands - Truesilver Deposit / Small Thorium Vein' WHERE `pool_id` = 3031;
UPDATE `gameobject` SET `id` = 324 WHERE `guid` = 23024;
DELETE FROM `gameobject` WHERE `guid` = 22951;
DELETE FROM `gameobject` WHERE `guid` = 427576;

-- Tanaris
SET @OGUID = 69129;
SET @PTEMPLATE = 9441;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -8280.00000000000, -4738.137207031250, 19.26671600341796875, 3.036838293075561523, 0, 0, 0.998628616333007812, 0.052353221923112869, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -8280.00000000000, -4738.137207031250, 19.26671600341796875, 3.036838293075561523, 0, 0, 0.998628616333007812, 0.052353221923112869, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9915, 0, 'Tanaris - Truesilver Deposit / Small Thorium Vein', 0);

-- Tanaris - Noxious Lair
SET @OGUID = 69131;
SET @PTEMPLATE = 9442;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -7881.10253906250, -2427.859375000000, -21.8910598754882812, 5.986480236053466796, 0, 0, -0.14780902862548828, 0.989015936851501464, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 1, -7881.10253906250, -2427.859375000000, -21.8910598754882812, 5.986480236053466796, 0, 0, -0.14780902862548828, 0.989015936851501464, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Noxious Lair Hive 1', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Noxious Lair Hive 1', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Noxious Lair Hive 1', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8139, 0, 'Tanaris - Noxious Lair Hive 1 - Truesilver Deposit / Small Thorium Vein', 0);

-- Tanaris - Gaping Chasm
SET @OGUID = 69133;
SET @PTEMPLATE = 9443;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -9233.19238281250, -4113.346191406250, -41.2940254211425781, 1.326448202133178710, 0, 0, 0.615660667419433593, 0.788011372089385986, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 1, -9047.06542968750, -4229.500976562500, -31.8620510101318359, 0.575957298278808593, 0, 0, 0.284014701843261718, 0.958819925785064697, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, -9233.19238281250, -4113.346191406250, -41.2940254211425781, 1.326448202133178710, 0, 0, 0.615660667419433593, 0.788011372089385986, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 1, -9047.06542968750, -4229.500976562500, -31.8620510101318359, 0.575957298278808593, 0, 0, 0.284014701843261718, 0.958819925785064697, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8141, 0, 'Tanaris - Gaping Chasm - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 8141, 0, 'Tanaris - Gaping Chasm - Truesilver Deposit / Small Thorium Vein', 0);

-- Silithus 
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus' WHERE `entry` = 5617;
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Silithus' WHERE `guid` IN (94217, 94234, 94251);
DELETE FROM `pool_gameobject` WHERE `guid` =94217;
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `guid` = 94234;
UPDATE `pool_pool` SET `mother_pool` = 1219, `description` = 'Silithus - Truesilver Deposit / Small Thorium Vein' WHERE `pool_id` = 5617;
UPDATE `gameobject` SET `id` = 324 WHERE `guid` = 94234;
DELETE FROM `gameobject` WHERE `guid` = 94217;

UPDATE `gameobject` SET `position_x` = -7414.12255859375, `position_y` = 837.21594238281250, `position_z` = -1.64660298824310302, `orientation` = 1.972219824790954589, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.833885192871093750, `rotation3` = 0.551937937736511230 WHERE `guid` IN (23532, 23503);
UPDATE `gameobject` SET `position_x` = -6790.11962890625, `position_y` = 1860.2114257812500, `position_z` = 11.35343647003173828, `orientation` = 5.235987663269042968, `rotation0` = 0, `rotation1` = 0, `rotation2` = -0.50000000000000000, `rotation3` = 0.866025388240814208 WHERE `guid` IN (23527, 23498);

SET @OGUID = 69137;
SET @PTEMPLATE = 9445;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 1, -7050.06884765625, 1870.6997070312500, 17.87853813171386718, 3.176533222198486328, 0, 0, -0.99984741210937500, 0.017469281330704689, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 1, -6323.47900390625, 612.454772949218750, 0.548304975032806396, 4.084071159362792968, 0, 0, -0.89100646972656250, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 1, -7561.12158203125, 574.4451293945312500, -21.9861545562744140, 4.642575740814208984, 0, 0, -0.73135375976562500, 0.681998312473297119, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 324, 1, -6316.00390625000, 262.784515380859375, 11.23300170898437500, 4.031712055206298828, 0, 0, -0.90258502960205078, 0.430511653423309326, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 324, 1, -6207.97363281250, 485.200958251953125, 19.83262062072753906, 0.628316879272460937, 0, 0, 0.309016227722167968, 0.951056778430938720, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 324, 1, -6304.38623046875, 1120.18981933593750, 34.87728881835937500, 5.585053920745849609, 0, 0, -0.34202003479003906, 0.939692676067352294, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 324, 1, -8108.40966796875, 320.1177368164062500, -30.6177940368652343, 0.994837164878845214, 0, 0, 0.477158546447753906, 0.878817260265350341, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 324, 1, -8118.37353515625, 1002.7318115234375, 67.11762237548828125, 0.122172988951206207, 0, 0, 0.061048507690429687, 0.998134791851043701, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, -7050.06884765625, 1870.6997070312500, 17.87853813171386718, 3.176533222198486328, 0, 0, -0.99984741210937500, 0.017469281330704689, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 1, -6323.47900390625, 612.454772949218750, 0.548304975032806396, 4.084071159362792968, 0, 0, -0.89100646972656250, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2047, 1, -7561.12158203125, 574.4451293945312500, -21.9861545562744140, 4.642575740814208984, 0, 0, -0.73135375976562500, 0.681998312473297119, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 1, -6316.00390625000, 262.784515380859375, 11.23300170898437500, 4.031712055206298828, 0, 0, -0.90258502960205078, 0.430511653423309326, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 1, -6207.97363281250, 485.200958251953125, 19.83262062072753906, 0.628316879272460937, 0, 0, 0.309016227722167968, 0.951056778430938720, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 1, -6304.38623046875, 1120.18981933593750, 34.87728881835937500, 5.585053920745849609, 0, 0, -0.34202003479003906, 0.939692676067352294, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 1, -8108.40966796875, 320.1177368164062500, -30.6177940368652343, 0.994837164878845214, 0, 0, 0.477158546447753906, 0.878817260265350341, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2047, 1, -8118.37353515625, 1002.7318115234375, 67.11762237548828125, 0.122172988951206207, 0, 0, 0.061048507690429687, 0.998134791851043701, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+4, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+5, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+6, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+7, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@PTEMPLATE+8, 1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+4, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+5, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+6, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+7, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+8, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+9, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+10, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+11, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+12, @PTEMPLATE+4, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+13, @PTEMPLATE+5, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+14, @PTEMPLATE+6, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+15, @PTEMPLATE+7, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10),
(@OGUID+16, @PTEMPLATE+8, 'Truesilver Deposit / Small Thorium Vein - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+4, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+5, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+6, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+7, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+8, 1219, 0, 'Silithus - Truesilver Deposit / Small Thorium Vein', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Feralas" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Hinterlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris - Gaping Chasm" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris - Noxious Lair Hive 1" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Tanaris - Noxious Lair Hive 1" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
