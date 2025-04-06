DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250211183533');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250211183533');
-- Add your query below.


-- Western Plaguelands
UPDATE `pool_template` SET `description` = 'Western Plaguelands - Hearthglen Mine - Truesilver Deposit / Rich Thorium Vein (Master Pool)' WHERE `entry` = 8120;
UPDATE `pool_template` SET `description` = 'Western Plaguelands - Hearthglen - Truesilver Deposits / Rich Thorium Veins (Master Pool)' WHERE `entry` = 1262;
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands' WHERE `guid`=261642;
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands' WHERE `guid`=261648;
UPDATE `pool_pool` SET `mother_pool` = 1331, `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands' WHERE `pool_id` = 21662;
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands' WHERE `entry` = 21662;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (261638, 261644, 261643, 261649, 58163, 58166, 24996, 25025, 25000, 25029, 25002, 25031, 25003, 25032, 25008, 25037, 58168, 58172, 58169, 58173, 58170, 58174);

-- Small Thorium
-- Zone
SET @OGUID = 90724;
SET @PTEMPLATE = 9416;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, 2579.3515625000000, -1876.9407958984375, 109.8852233886718750, 0.541050612926483154, 0, 0, 0.267237663269042968, 0.963630676269531250, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 0, 2094.3222656250000, -2304.0217285156250, 80.33908081054687500, 5.148722648620605468, 0, 0, -0.53729915618896484, 0.843391716480255126, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 2579.3515625000000, -1876.9407958984375, 109.8852233886718750, 0.541050612926483154, 0, 0, 0.267237663269042968, 0.963630676269531250, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 2094.3222656250000, -2304.0217285156250, 80.33908081054687500, 5.148722648620605468, 0, 0, -0.53729915618896484, 0.843391716480255126, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1331, 0, 'Western Plaguelands - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 1331, 0, 'Western Plaguelands - Truesilver Deposit / Small Thorium Vein', 0);

-- Weeping Cave
SET @OGUID = 90728;
SET @PTEMPLATE = 9418;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 324, 0, 2267.7963867187500, -2381.159423828125, 61.828571319580078120, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 324, 0, 2411.2111816406250, -2236.753906250000, 53.699970245361328120, 2.600535154342651367, 0, 0, 0.963629722595214843, 0.267241001129150390, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 324, 0, 2348.9191894531250, -2319.702636718750, 48.787776947021484370, 1.972219824790954589, 0, 0, 0.833885192871093750, 0.551937937736511230, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 2267.7963867187500, -2381.159423828125, 61.828571319580078120, 2.565631866455078125, 0, 0, 0.958819389343261718, 0.284016460180282592, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 2411.2111816406250, -2236.753906250000, 53.699970245361328120, 2.600535154342651367, 0, 0, 0.963629722595214843, 0.267241001129150390, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 2348.9191894531250, -2319.702636718750, 48.787776947021484370, 1.972219824790954589, 0, 0, 0.833885192871093750, 0.551937937736511230, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8121, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+2, 8121, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Small Thorium Vein', 0),
(@PTEMPLATE+3, 8121, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Small Thorium Vein', 0);

-- Rich Thorium
-- Hearthglen Mine
SET @OGUID = 90734;
SET @PTEMPLATE = 9421;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 3056.531005859375, -1543.2446289062500, 149.8952026367187500, 2.164205789566040039, 0, 0, 0.882946968078613281, 0.469472706317901611, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 3056.531005859375, -1543.2446289062500, 149.8952026367187500, 2.164205789566040039, 0, 0, 0.882946968078613281, 0.469472706317901611, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8120, 0, 'Western Plaguelands - Hearthglen Mine - Truesilver Deposit / Rich Thorium Vein', 0);

-- Hearthglen
SET @OGUID = 90736;
SET @PTEMPLATE = 9422;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 2979.148193359375, -1661.4227294921875, 151.5873870849609375, 0.925023794174194335, 0, 0, 0.446197509765625000, 0.894934535026550292, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 2779.762939453125, -1391.1530761718750, 153.4921417236328125, 3.822272777557373046, 0, 0, -0.94264125823974609, 0.333807557821273803, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 2979.148193359375, -1661.4227294921875, 151.5873870849609375, 0.925023794174194335, 0, 0, 0.446197509765625000, 0.894934535026550292, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 2779.762939453125, -1391.1530761718750, 153.4921417236328125, 3.822272777557373046, 0, 0, -0.94264125823974609, 0.333807557821273803, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1262, 0, 'Western Plaguelands - Hearthglen - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 1262, 0, 'Western Plaguelands - Hearthglen - Truesilver Deposit / Rich Thorium Vein', 0);

-- Weeping Cave
SET @OGUID = 90740;
SET @PTEMPLATE = 9424;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 2374.702392578125, -2272.6809082031250, 48.89876556396484375, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 2406.240722656250, -2344.4458007812500, 53.68817138671875000, 5.532694816589355468, 0, 0, -0.36650085449218750, 0.930417716503143310, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 2374.702392578125, -2272.6809082031250, 48.89876556396484375, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 2406.240722656250, -2344.4458007812500, 53.68817138671875000, 5.532694816589355468, 0, 0, -0.36650085449218750, 0.930417716503143310, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8138, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8138, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Rich Thorium Vein', 0);

DELETE FROM `gameobject` WHERE `guid` IN (261643, 261649);
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 21663;
DELETE FROM `pool_template` WHERE `entry` = 21663;
DELETE FROM `pool_pool` WHERE pool_id = 21663;

DELETE FROM `pool_pool` WHERE pool_id = 1368;
UPDATE `gameobject` SET `id` = 175404 WHERE  `guid` = 33565;
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Infectis Scar' WHERE `entry` IN (1368);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Infectis Scar' WHERE `pool_entry` IN (1368);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1368, 8133, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0);

UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen' WHERE `guid` IN (261638, 261644, 58163, 58166);
UPDATE `pool_pool` SET `description` = 'Western Plaguelands - Hearthglen - Truesilver Deposit / Rich Thorium Vein' WHERE `pool_id` IN (14433, 21658);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen' WHERE  `entry` IN (14433, 21658);
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE  `guid` IN (33565, 33587);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);

-- Eastern Plaguelands
UPDATE `gameobject` SET `position_x` = 1782.0367431640625, `position_y` = -5235.03515625, `position_z` = 102.9293899536132812, `orientation` = 1.134462952613830566, `rotation0` = 0, `rotation1` = 0, `rotation2` = 0.537299156188964843, `rotation3` = 0.843391716480255126 WHERE `guid` IN (25012, 24983);
UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 325;
-- Fungal Vale
SET @OGUID = 88234;
SET @PTEMPLATE = 9426;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 2350.802001953125, -3592.835205078125, 180.112762451171875, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 2372.41748046875, -3797.15185546875, 187.3764190673828125, 3.90954136848449707, 0, 0, -0.92718315124511718, 0.37460830807685852, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 2350.802001953125, -3592.835205078125, 180.112762451171875, 1.692969322204589843, 0, 0, 0.748955726623535156, 0.662620067596435546, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 2372.41748046875, -3797.15185546875, 187.3764190673828125, 3.90954136848449707, 0, 0, -0.92718315124511718, 0.37460830807685852, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8135, 0, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8135, 0, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein', 0);

-- Tyr's Hand
SET @OGUID = 88238;
SET @PTEMPLATE = 9428;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 1736.9683837890625, -5562.36376953125, 117.916656494140625, 4.694936752319335937, 0, 0, -0.71325016021728515, 0.700909554958343505, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 1736.9683837890625, -5562.36376953125, 117.916656494140625, 4.694936752319335937, 0, 0, -0.71325016021728515, 0.700909554958343505, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8132, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0);

-- Noxious Glade
SET @OGUID = 88240;
SET @PTEMPLATE = 9429;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 2583.73291015625, -5453.4697265625, 167.7483367919921875, 2.303830623626708984, 0, 0, 0.913544654846191406, 0.406738430261611938, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2047, 0, 2583.73291015625, -5453.4697265625, 167.7483367919921875, 2.303830623626708984, 0, 0, 0.913544654846191406, 0.406738430261611938, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade', 10),
(@OGUID+2, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8136, 0, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein', 0);

-- Zul'Mashar
SET @OGUID = 88242;
SET @PTEMPLATE = 9430;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 3284.799560546875, -4898.39111328125, 184.1357421875, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 3476.348876953125, -4890.65087890625, 178.4742584228515625, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.87462007999420166, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, 3284.799560546875, -4898.39111328125, 184.1357421875, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 3476.348876953125, -4890.65087890625, 178.4742584228515625, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.87462007999420166, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10),
(@OGUID+3, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10),
(@OGUID+4, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8137, 0, 'Eastern Plaguelands - Zul\'Mashar - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 8137, 0, 'Eastern Plaguelands - Zul\'Mashar - Truesilver Deposit / Rich Thorium Vein', 0);

-- Zone
SET @OGUID = 88246;
SET @PTEMPLATE = 9432;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 175404, 0, 3093.264404296875, -4309.64794921875, 110.2749710083007812, 1.274088263511657714, 0, 0, 0.594821929931640625, 0.80385744571685791, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 175404, 0, 2890.416259765625, -5142.46533203125, 115.659576416015625, 2.094393253326416015, 0, 0, 0.866024971008300781, 0.50000077486038208, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 175404, 0, 3059.275390625, -5024.908203125, 100.4284820556640625, 2.391098499298095703, 0, 0, 0.930417060852050781, 0.366502493619918823, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2047, 0, 3093.264404296875, -4309.64794921875, 110.2749710083007812, 1.274088263511657714, 0, 0, 0.594821929931640625, 0.80385744571685791, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 2890.416259765625, -5142.46533203125, 115.659576416015625, 2.094393253326416015, 0, 0, 0.866024971008300781, 0.50000077486038208, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 3059.275390625, -5024.908203125, 100.4284820556640625, 2.391098499298095703, 0, 0, 0.930417060852050781, 0.366502493619918823, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@PTEMPLATE+3, 1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+1, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+2, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+3, 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+2, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0),
(@PTEMPLATE+3, 325, 0, 'Eastern Plaguelands - Truesilver Deposit / Rich Thorium Vein', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
