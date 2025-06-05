DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250503193733');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250503193733');
-- Add your query below.


-- Mulgore
SET @GGUID = 1851;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -2764.152587890625, 298.55645751953125, 125.961090087890625, 3.124123096466064453, 0, 0, 0.99996185302734375, 0.008734640665352344, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -941.59429931640625, 513.99005126953125, 64.92406463623046875, 5.044002056121826171, 0, 0, -0.58070278167724609, 0.814115643501281738, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -930.8631591796875, 549.41107177734375, 97.13104248046875, 4.834563255310058593, 0, 0, -0.66261959075927734, 0.748956084251403808, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 1, -2533.37158203125, 325.92327880859375, 114.996978759765625, 0.27925160527229309, 0, 0, 0.139172554016113281, 0.990268170833587646, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 1, -1348.03466796875, -1001.79132080078125, 89.12102508544921875, 2.007128477096557617, 0, 0, 0.84339141845703125, 0.537299633026123046, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 1, -1474.0426025390625, -901.73028564453125, 39.83301544189453125, 5.131268978118896484, 0, 0, -0.54463863372802734, 0.838670849800109863, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+1, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+2, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+3, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+4, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10),
(@GGUID+5, 1028, 0, 'Copper Vein - Mulgore', 0, 0, 10);

-- Frostmane Hold
DELETE FROM `gameobject` WHERE `guid` = 3998690;
SET @GGUID = 632;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -5554.98779296875, 697.9521484375, 388.94793701171875, 2.44346022605895996, 0, 0, 0.939692497253417968, 0.34202045202255249, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8004, 0, 'Copper Vein - Dun Morogh - Frostmane Hold', 0, 0, 10);

-- Silver Stream Mine
SET @GGUID = 634;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -4940.0595703125, -3002.582275390625, 321.303985595703125, 0.366517573595046997, 0, 0, 0.182234764099121093, 0.98325502872467041, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8073, 0, 'Copper Veins - Loch Modan - Silver Stream Mine', 0, 0, 10);

-- Loch Modan
SET @GGUID = 639;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -5044.72265625, -2695.839111328125, 320.68377685546875, 3.892086982727050781, 0, 0, -0.93041706085205078, 0.366502493619918823, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1166, 0, 'Copper Vein - Loch Modan', 0, 0, 10);

-- Durotar
SET @GGUID = 989;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 11.73697853088378906, -4641.78857421875, 49.22844696044921875, 3.054326534271240234, 0, 0, 0.999048233032226562, 0.043619260191917419, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1024, 0, 'Copper Vein - Durotar', 0, 0, 10);

-- Ashenvale
SET @GGUID = 1011;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, 2885.829345703125, -797.08038330078125, 172.2617645263671875, 5.166176319122314453, 0, 0, -0.52991867065429687, 0.84804844856262207, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, 3049.15673828125, -221.963760375976562, 124.7168121337890625, 1.221729278564453125, 0, 0, 0.573575973510742187, 0.819152355194091796, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1075, 0, 'Copper Vein - Ashenvale', 0, 0, 10),
(@GGUID+1, 1075, 0, 'Copper Vein - Ashenvale', 0, 0, 10);

-- Barrens
SET @GGUID = 1051;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -1782.8179931640625, -1659.6414794921875, 113.753753662109375, 1.605701684951782226, 0, 0, 0.719339370727539062, 0.694658815860748291, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -425.896270751953125, -3245.8740234375, 158.913909912109375, 0.959929943084716796, 0, 0, 0.461748123168945312, 0.887011110782623291, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10),
(@GGUID+1, 4303, 0, 'Copper Vein - Barrens', 0, 0, 10);

-- Palemane Rock
SET @GGUID = 1734;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -2436.42138671875, 417.177947998046875, 61.88895797729492187, 4.660029888153076171, 0, 0, -0.72537422180175781, 0.688354730606079101, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -2387.725341796875, 472.77691650390625, 52.19904327392578125, 2.199114561080932617, 0, 0, 0.8910064697265625, 0.453990638256072998, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -2357.587158203125, 426.899749755859375, 63.69086456298828125, 6.213373661041259765, 0, 0, -0.03489875793457031, 0.999390840530395507, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 1, -2397.2158203125, 287.1873779296875, 64.21442413330078125, 5.026549339294433593, 0, 0, -0.5877847671508789, 0.809017360210418701, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(@GGUID+1, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(@GGUID+2, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10),
(@GGUID+3, 8009, 0, 'Copper Vein - Mulgore - Palemane Rock', 0, 0, 10);

-- Venture Co Mine
SET @GGUID = 2877;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 1, -1763.6119384765625, -1330.0208740234375, 115.6490097045898437, 2.129300594329833984, 0, 0, 0.874619483947753906, 0.484810054302215576, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 1, -1684.7083740234375, -1318.9755859375, 135.0934295654296875, 2.146752834320068359, 0, 0, 0.878816604614257812, 0.477159708738327026, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 1731, 1, -1703.6162109375, -1120.6170654296875, 120.6224517822265625, 2.199114561080932617, 0, 0, 0.8910064697265625, 0.453990638256072998, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 1731, 1, -1599.2470703125, -1157.5693359375, 103.8949432373046875, 1.518436193466186523, 0, 0, 0.6883544921875, 0.725374460220336914, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 1731, 1, -1556.89990234375, -1176.919921875, 104.9747390747070312, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 1731, 1, -1604.2156982421875, -1256.9676513671875, 136.3194122314453125, 5.619962215423583984, 0, 0, -0.32556724548339843, 0.945518851280212402, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+6, 1731, 1, -1604.0338134765625, -1327.9566650390625, 133.940460205078125, 1.151916384696960449, 0, 0, 0.544638633728027343, 0.838670849800109863, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+7, 1731, 1, -1676.3170166015625, -1152.9951171875, 113.5476303100585937, 5.84685373306274414, 0, 0, -0.21643924713134765, 0.976296067237854003, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+8, 1731, 1, -1531.1478271484375, -1136.310791015625, 105.623016357421875, 1.378809213638305664, 0, 0, 0.636077880859375, 0.771624863147735595, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+9, 1731, 1, -1493.6695556640625, -1060.4564208984375, 156.16241455078125, 5.462882041931152343, 0, 0, -0.39874839782714843, 0.917060375213623046, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+1, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+2, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+3, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+4, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+5, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+6, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+7, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+8, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10),
(@GGUID+9, 8008, 0, 'Copper Vein - Mulgore - Venture Co. Mine', 0, 0, 10);

-- Westfall
DELETE FROM `gameobject` WHERE `guid` IN (31078);
DELETE FROM `pool_gameobject` WHERE `guid` IN (31078);

-- Berens Peril
SET @GGUID = 990;
SET @PTEMPLATE = 1159;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -300.8878173828125, 965.22332763671875, 130.78680419921875, 4.886923789978027343, 0, 0, -0.64278697967529296, 0.766044974327087402, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Silverpine Forest - Beren\'s Peril', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8101, 0, 'Silverpine Forest - Beren\'s Peril - Copper Veins', 0);

-- Stonesplinter Valley
SET @GGUID = 1053;
SET @PTEMPLATE = 1244;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1731, 0, -6083.6396484375, -2957.113525390625, 402.088134765625, 2.129300594329833984, 0, 0, 0.874619483947753906, 0.484810054302215576, 300, 900, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1731, 0, -6111.3134765625, -3044.75537109375, 404.388641357421875, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 300, 900, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 0, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Copper Veins - Loch Modan - Stonesplinter Valley', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8072, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0),
(@PTEMPLATE+1, 8072, 0, 'Loch Modan - Stonesplinter Valley - Copper Veins', 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
