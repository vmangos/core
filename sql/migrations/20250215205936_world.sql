DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250215205936');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250215205936');
-- Add your query below.


UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700, `animprogress` = 100 WHERE `guid` IN (100469, 18233, 18248, 18234, 18249, 18235, 18250, 18236, 18251, 18237, 18252, 18238, 18253, 18239, 18254, 18240, 18255, 18241, 18256, 18242, 18257, 18243, 18258, 18244, 18259, 18245, 18260, 18246, 18261, 18247, 18262, 84121, 84123, 84122, 84124);

-- Burning Steppes
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(96, 2040, 0, -8350.85, -1897.95, 179.341, 2.25147, 0, 0, 0.902585, 0.430512, 300, 300, 100, 1, 0, 0, 0, 10);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes' WHERE `entry` = 14258;
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes' WHERE `guid` IN (31179, 31215, 31251);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES (96, 14258, 'Gold Vein / Mithril Deposit / Truesilver Deposit / Dark Iron Deposit - Burning Steppes');
UPDATE `pool_pool` SET `mother_pool` = 1299, `description` = 'Burning Steppes - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE `pool_id` = 14258;
UPDATE `gameobject` SET `id` = 1734 WHERE `guid` = 31179;

-- Swamp of Sorrows
SET @OGUID = 51277;
SET @PTEMPLATE = 5284;

DELETE FROM `gameobject` WHERE `guid` IN (23190, 85039, 85041, 85043, 85045, 375042, 375044, 375046, 375048, 375050, 427410, 427412, 427414, 427416, 427418);
DELETE FROM `pool_gameobject` WHERE `guid` IN (23190, 85039, 85041, 85043, 85045, 375042, 375044, 375046, 375048, 375050, 427410, 427412, 427414, 427416, 427418);
DELETE FROM `pool_pool` WHERE `pool_id` IN (9802, 17146, 23037);
DELETE FROM `pool_template` WHERE `entry` IN (1332, 9802, 17146, 23037);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -10307.9, -3859.91, -15.8641, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -10307.9, -3859.91, -15.8641, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 0, -10307.9, -3859.91, -15.8641, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 0, -10384, -3932.75, -14.0203, 5.53269, 0, 0, -0.366501, 0.930418, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -10375.5, -3730.17, -14.7175, -2.33874, 0, 0, 0.920505, -0.390731, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1314, 0, 'Swamp of Sorrows - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1314, 0, 'Swamp of Sorrows - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1314, 0, 'Swamp of Sorrows - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Stagalbog Cave
SET @OGUID = 51286;
SET @PTEMPLATE = 5287;

DELETE FROM `gameobject` WHERE `guid` IN (375041, 375043, 375045, 375047, 375049, 427409, 427411, 427413, 427415, 427417, 85038, 85040, 85042, 85044, 23189);
DELETE FROM `pool_gameobject` WHERE `guid` IN (375041, 375043, 375045, 375047, 375049, 427409, 427411, 427413, 427415, 427417, 85038, 85040, 85042, 85044, 23189);
DELETE FROM `pool_pool` WHERE `pool_id` IN (9801, 17145, 23036);
DELETE FROM `pool_template` WHERE `entry` IN (9801, 17145, 23036);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -10831.1, -3691.35, 23.2697, 3.83973, 0, 0, -0.939692, 0.34202, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -10831.1, -3691.35, 23.2697, 3.83973, 0, 0, -0.939692, 0.34202, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 0, -10992.9, -3674.35, 25.4381, -2.67035, 0, 0, 0.97237, -0.233445, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 0, -10831.1, -3691.35, 23.2697, 3.83973, 0, 0, -0.939692, 0.34202, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -10913.6, -3648.29, 9.39929, 4.69494, 0, 0, -0.71325, 0.70091, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8119, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 8119, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 8119, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- STV
-- Zone
SET @OGUID = 51295;
SET @PTEMPLATE = 5290;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -14089.419921875, -102.480583190917968, 6.934264183044433593, 1.204277276992797851, 0, 0, 0.56640625, 0.824126183986663818, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -13766.9326171875, -237.310989379882812, 9.459273338317871093, 4.502951622009277343, 0, 0, -0.7771453857421875, 0.629321098327636718, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -13896.1611328125, 458.6011962890625, 108.9813079833984375, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -13389.4775390625, -251.859817504882812, 17.50629615783691406, 1.239183306694030761, 0, 0, 0.580702781677246093, 0.814115643501281738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 0, -12929.7421875, 2.95280003547668457, 30.89986801147460937, 5.969027042388916015, 0, 0, -0.1564340591430664, 0.987688362598419189, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 1734, 0, -12939.9384765625, -887.410400390625, 73.31673431396484375, 3.351046562194824218, 0, 0, -0.99452114105224609, 0.104535527527332305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -14089.419921875, -102.480583190917968, 6.934264183044433593, 1.204277276992797851, 0, 0, 0.56640625, 0.824126183986663818, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -13766.9326171875, -237.310989379882812, 9.459273338317871093, 4.502951622009277343, 0, 0, -0.7771453857421875, 0.629321098327636718, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 0, -13896.1611328125, 458.6011962890625, 108.9813079833984375, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 0, -13389.4775390625, -251.859817504882812, 17.50629615783691406, 1.239183306694030761, 0, 0, 0.580702781677246093, 0.814115643501281738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2040, 0, -12929.7421875, 2.95280003547668457, 30.89986801147460937, 5.969027042388916015, 0, 0, -0.1564340591430664, 0.987688362598419189, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2040, 0, -12939.9384765625, -887.410400390625, 73.31673431396484375, 3.351046562194824218, 0, 0, -0.99452114105224609, 0.104535527527332305, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 0, -14089.419921875, -102.480583190917968, 6.934264183044433593, 1.204277276992797851, 0, 0, 0.56640625, 0.824126183986663818, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 0, -13766.9326171875, -237.310989379882812, 9.459273338317871093, 4.502951622009277343, 0, 0, -0.7771453857421875, 0.629321098327636718, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 0, -13896.1611328125, 458.6011962890625, 108.9813079833984375, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 2047, 0, -13389.4775390625, -251.859817504882812, 17.50629615783691406, 1.239183306694030761, 0, 0, 0.580702781677246093, 0.814115643501281738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 2047, 0, -12929.7421875, 2.95280003547668457, 30.89986801147460937, 5.969027042388916015, 0, 0, -0.1564340591430664, 0.987688362598419189, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 2047, 0, -12939.9384765625, -887.410400390625, 73.31673431396484375, 3.351046562194824218, 0, 0, -0.99452114105224609, 0.104535527527332305, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@PTEMPLATE+6, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+6, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+10, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+11, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+12, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+13, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+14, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+15, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+16, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+17, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10),
(@OGUID+18, @PTEMPLATE+6, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+6, 9910, 0, 'Stranglethorn Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Crystalvein Mine
SET @OGUID = 51325;
SET @PTEMPLATE = 5296;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -13105.73046875, -506.415252685546875, 8.608036041259765625, 5.550147056579589843, 0, 0, -0.358367919921875, 0.933580458164215087, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -13197.9228515625, -458.838226318359375, 10.45659828186035156, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -13155.2373046875, -551.0018310546875, 4.781670093536376953, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 0, -13214.25390625, -616.3885498046875, 4.807421207427978515, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -13105.73046875, -506.415252685546875, 8.608036041259765625, 5.550147056579589843, 0, 0, -0.358367919921875, 0.933580458164215087, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -13197.9228515625, -458.838226318359375, 10.45659828186035156, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 0, -13155.2373046875, -551.0018310546875, 4.781670093536376953, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 0, -13214.25390625, -616.3885498046875, 4.807421207427978515, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -13105.73046875, -506.415252685546875, 8.608036041259765625, 5.550147056579589843, 0, 0, -0.358367919921875, 0.933580458164215087, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2047, 0, -13197.9228515625, -458.838226318359375, 10.45659828186035156, 4.084071159362792968, 0, 0, -0.8910064697265625, 0.453990638256072998, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2047, 0, -13155.2373046875, -551.0018310546875, 4.781670093536376953, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 0, -13214.25390625, -616.3885498046875, 4.807421207427978515, 5.777040958404541015, 0, 0, -0.25037956237792968, 0.968147754669189453, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+5, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+6, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+7, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+8, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+9, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+10, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+11, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10),
(@OGUID+12, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 8142, 0, 'Stranglethorn Vale - Crystalvein Mine - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Mosh'Ogg
SET @OGUID = 51337;
SET @PTEMPLATE = 5300;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -12344.4833984375, -1087.3170166015625, 3.178427934646606445, 3.595378875732421875, 0, 0, -0.97437000274658203, 0.224951311945915222, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -12374.3134765625, -1146.684326171875, 3.525089979171752929, 5.497788906097412109, 0, 0, -0.38268280029296875, 0.923879802227020263, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -12337.3876953125, -1156.7122802734375, 3.99737405776977539, 1.32644820213317871, 0, 0, 0.615660667419433593, 0.788011372089385986, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -12344.4833984375, -1087.3170166015625, 3.178427934646606445, 3.595378875732421875, 0, 0, -0.97437000274658203, 0.224951311945915222, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -12374.3134765625, -1146.684326171875, 3.525089979171752929, 5.497788906097412109, 0, 0, -0.38268280029296875, 0.923879802227020263, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -12337.3876953125, -1156.7122802734375, 3.99737405776977539, 1.32644820213317871, 0, 0, 0.615660667419433593, 0.788011372089385986, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 0, -12344.4833984375, -1087.3170166015625, 3.178427934646606445, 3.595378875732421875, 0, 0, -0.97437000274658203, 0.224951311945915222, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 0, -12374.3134765625, -1146.684326171875, 3.525089979171752929, 5.497788906097412109, 0, 0, -0.38268280029296875, 0.923879802227020263, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -12337.3876953125, -1156.7122802734375, 3.99737405776977539, 1.32644820213317871, 0, 0, 0.615660667419433593, 0.788011372089385986, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 8143, 0, 'Stranglethorn Vale - Mosh\'Ogg Ogre Mound - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Stockpile
SET @OGUID = 51346;
SET @PTEMPLATE = 5309;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11394.4736328125, -878.48077392578125, 20.57818603515625, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -11346.421875, -962.4852294921875, 33.11478424072265625, 0.925023794174194335, 0, 0, 0.446197509765625, 0.894934535026550292, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 0, -11337.7783203125, -994.74932861328125, 31.29687118530273437, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, -11394.4736328125, -878.48077392578125, 20.57818603515625, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 0, -11346.421875, -962.4852294921875, 33.11478424072265625, 0.925023794174194335, 0, 0, 0.446197509765625, 0.894934535026550292, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 0, -11337.7783203125, -994.74932861328125, 31.29687118530273437, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 0, -11394.4736328125, -878.48077392578125, 20.57818603515625, 2.530723094940185546, 0, 0, 0.953716278076171875, 0.300707906484603881, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 0, -11346.421875, -962.4852294921875, 33.11478424072265625, 0.925023794174194335, 0, 0, 0.446197509765625, 0.894934535026550292, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 0, -11337.7783203125, -994.74932861328125, 31.29687118530273437, 4.206246376037597656, 0, 0, -0.86162853240966796, 0.50753939151763916, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8144, 0, 'Stranglethorn Vale - Stockpile - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 8144, 0, 'Stranglethorn Vale - Stockpile - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 8144, 0, 'Stranglethorn Vale - Stockpile - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Blasted Lands
SET @OGUID = 51355;
SET @PTEMPLATE = 5312;

DELETE FROM `gameobject` WHERE `guid` IN (27673, 27656, 34795, 34794);
DELETE FROM `pool_gameobject` WHERE `guid` IN (27673, 27656, 34795, 34794);
DELETE FROM `pool_pool` WHERE `pool_id` IN (21527, 34920);
DELETE FROM `pool_template` WHERE `entry` IN (21527, 34920);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -10942.8, -2822.68, 27.2863, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -10942.8, -2822.68, 27.2863, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -10942.8, -2822.68, 27.2863, 4.76475, 0, 0, -0.688354, 0.725374, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1279, 0, 'Blasted Lands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Zone
SET @OGUID = 51358;
SET @PTEMPLATE = 5313;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11526.7480468750, -2673.916992187500, 16.12965965270996093, 0.157079011201858520, 0, 0, 0.078458786010742187, 0.996917366981506347, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -11526.7480468750, -2673.916992187500, 16.12965965270996093, 0.157079011201858520, 0, 0, 0.078458786010742187, 0.996917366981506347, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -11526.7480468750, -2673.916992187500, 16.12965965270996093, 0.157079011201858520, 0, 0, 0.078458786010742187, 0.996917366981506347, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1279, 0, 'Blasted Lands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Serpents Coil
SET @OGUID = 51361;
SET @PTEMPLATE = 5314;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -11210.5654296875, -3524.074218750000, 6.147635936737060546, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -11210.5654296875, -3524.074218750000, 6.147635936737060546, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -11210.5654296875, -3524.074218750000, 6.147635936737060546, 5.864306926727294921, 0, 0, -0.20791149139404296, 0.978147625923156738, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 8112, 0, 'Blasted Lands - Serpent\'s Coil - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Silithus
SET @OGUID = 51364;
SET @PTEMPLATE = 5315;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -6273.09912109375, 791.249572753906250, 18.360862731933593750, 2.076939344406127929, 0, 0, 0.861628532409667968, 0.507539391517639160, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -6402.55273437500, 581.806091308593750, 2.7852749824523925780, 1.082102894783020019, 0, 0, 0.515037536621093750, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -7149.12939453125, 489.4420471191406250, 6.869507789611816406, 3.071766138076782226, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 1734, 1, -6209.18603515625, 1580.28039550781250, 17.112623214721679680, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.874620079994201660, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 1734, 1, -6215.61181640625, 1863.73156738281250, 39.809772491455078120, 2.879789113998413085, 0, 0, 0.991444587707519531, 0.130528271198272705, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 1, -6273.09912109375, 791.249572753906250, 18.360862731933593750, 2.076939344406127929, 0, 0, 0.861628532409667968, 0.507539391517639160, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2040, 1, -6402.55273437500, 581.806091308593750, 2.7852749824523925780, 1.082102894783020019, 0, 0, 0.515037536621093750, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2040, 1, -7149.12939453125, 489.4420471191406250, 6.869507789611816406, 3.071766138076782226, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2040, 1, -6209.18603515625, 1580.28039550781250, 17.112623214721679680, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.874620079994201660, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 2040, 1, -6215.61181640625, 1863.73156738281250, 39.809772491455078120, 2.879789113998413085, 0, 0, 0.991444587707519531, 0.130528271198272705, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 2047, 1, -6273.09912109375, 791.249572753906250, 18.360862731933593750, 2.076939344406127929, 0, 0, 0.861628532409667968, 0.507539391517639160, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 2047, 1, -6402.55273437500, 581.806091308593750, 2.7852749824523925780, 1.082102894783020019, 0, 0, 0.515037536621093750, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 2047, 1, -7149.12939453125, 489.4420471191406250, 6.869507789611816406, 3.071766138076782226, 0, 0, 0.999390602111816406, 0.034906134009361267, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 2047, 1, -6209.18603515625, 1580.28039550781250, 17.112623214721679680, 1.012289404869079589, 0, 0, 0.484808921813964843, 0.874620079994201660, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 2047, 1, -6215.61181640625, 1863.73156738281250, 39.809772491455078120, 2.879789113998413085, 0, 0, 0.991444587707519531, 0.130528271198272705, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+4, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@PTEMPLATE+5, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+4, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+5, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+6, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+7, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+8, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+9, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+10, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+11, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+12, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+13, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+14, @PTEMPLATE+4, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10),
(@OGUID+15, @PTEMPLATE+5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 326, 0, 'Silithus - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 326, 0, 'Silithus - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 326, 0, 'Silithus - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+4, 326, 0, 'Silithus - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+5, 326, 0, 'Silithus - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Thousand Needles
SET @OGUID = 51379;
SET @PTEMPLATE = 5320;

UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles' WHERE  `entry` = 5826;
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles' WHERE  `guid` IN (94755, 94885, 94820);
UPDATE `pool_pool` SET `mother_pool` = 1132, `description` = 'Thousand Needles - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE `pool_id` = 5826;
UPDATE `gameobject` SET `id` = 2040 WHERE `guid` = 94885;
UPDATE `gameobject` SET `id` = 2047 WHERE `guid` = 94755;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, -5132.91601562500, -1050.3582763671875, 2.170691013336181640, 4.049167633056640625, 0, 0, -0.89879322052001953, 0.438372820615768432, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, -5138.89306640625, -910.05358886718750, -4.12245702743530273, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, -5047.21240234375, -952.89355468750000, -3.82195305824279785, 0.226892471313476562, 0, 0, 0.113203048706054687, 0.993571877479553222, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 1, -5132.91601562500, -1050.3582763671875, 2.170691013336181640, 4.049167633056640625, 0, 0, -0.89879322052001953, 0.438372820615768432, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 1, -5138.89306640625, -910.05358886718750, -4.12245702743530273, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 1, -5047.21240234375, -952.89355468750000, -3.82195305824279785, 0.226892471313476562, 0, 0, 0.113203048706054687, 0.993571877479553222, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 1, -5132.91601562500, -1050.3582763671875, 2.170691013336181640, 4.049167633056640625, 0, 0, -0.89879322052001953, 0.438372820615768432, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 1, -5138.89306640625, -910.05358886718750, -4.12245702743530273, 2.949595451354980468, 0, 0, 0.995395660400390625, 0.095851235091686248, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, -5047.21240234375, -952.89355468750000, -3.82195305824279785, 0.226892471313476562, 0, 0, 0.113203048706054687, 0.993571877479553222, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1132, 0, 'Thousand Needles - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1132, 0, 'Thousand Needles - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1132, 0, 'Thousand Needles - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Stonetalon Mountains
SET @OGUID = 51388;
SET @PTEMPLATE = 5323;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, 540.059265136718750, 1410.3339843750000, 19.14920997619628906, 4.031712055206298828, 0, 0, -0.90258502960205078, 0.430511653423309326, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 1, 733.572082519531250, 1935.6286621093750, 30.16183471679687500, 5.794494152069091796, 0, 0, -0.24192142486572265, 0.970295846462249755, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1734, 1, 609.827026367187500, 1981.1754150390625, 6.856464862823486328, 5.201082706451416015, 0, 0, -0.51503753662109375, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 1, 540.059265136718750, 1410.3339843750000, 19.14920997619628906, 4.031712055206298828, 0, 0, -0.90258502960205078, 0.430511653423309326, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2040, 1, 733.572082519531250, 1935.6286621093750, 30.16183471679687500, 5.794494152069091796, 0, 0, -0.24192142486572265, 0.970295846462249755, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2040, 1, 609.827026367187500, 1981.1754150390625, 6.856464862823486328, 5.201082706451416015, 0, 0, -0.51503753662109375, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 2047, 1, 540.059265136718750, 1410.3339843750000, 19.14920997619628906, 4.031712055206298828, 0, 0, -0.90258502960205078, 0.430511653423309326, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 2047, 1, 733.572082519531250, 1935.6286621093750, 30.16183471679687500, 5.794494152069091796, 0, 0, -0.24192142486572265, 0.970295846462249755, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 2047, 1, 609.827026367187500, 1981.1754150390625, 6.856464862823486328, 5.201082706451416015, 0, 0, -0.51503753662109375, 0.857167601585388183, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@PTEMPLATE+3, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+4, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+5, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+6, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+7, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+8, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10),
(@OGUID+9, @PTEMPLATE+3, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+3, 1927, 0, 'Stonetalon Mountains - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- WPL
SET @OGUID = 51397;
SET @PTEMPLATE = 5326;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, 2017.4509277343750, -1409.10156250000000, 93.83660125732421875, 5.096362113952636718, 0, 0, -0.55919265747070312, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, 1321.8610839843750, -898.631530761718750, 73.31448364257812500, 5.881760597223003906, 0, 0, -0.19936752319335937, 0.979924798011779785, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2040, 0, 2017.4509277343750, -1409.10156250000000, 93.83660125732421875, 5.096362113952636718, 0, 0, -0.55919265747070312, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 2040, 0, 1321.8610839843750, -898.631530761718750, 73.31448364257812500, 5.881760597223003906, 0, 0, -0.19936752319335937, 0.979924798011779785, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 2047, 0, 2017.4509277343750, -1409.10156250000000, 93.83660125732421875, 5.096362113952636718, 0, 0, -0.55919265747070312, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 2047, 0, 1321.8610839843750, -898.631530761718750, 73.31448364257812500, 5.881760597223003906, 0, 0, -0.19936752319335937, 0.979924798011779785, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@PTEMPLATE+2, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+2, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+4, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+5, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10),
(@OGUID+6, @PTEMPLATE+2, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1271, 0, 'Western Plaguelands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+2, 1271, 0, 'Western Plaguelands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Winterspring
SET @OGUID = 51403;
SET @PTEMPLATE = 5328;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 1, 6499.18652343750, -3715.036376953125, 708.69512939453125, 0.000000000000000000, 0, 0, 0.000000000000000000, 1.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 1, 6499.18652343750, -3715.036376953125, 708.69512939453125, 0.000000000000000000, 0, 0, 0.000000000000000000, 1.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 1, 6499.18652343750, -3715.036376953125, 708.69512939453125, 0.000000000000000000, 0, 0, 0.000000000000000000, 1.000000000000000000, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1234, 0, 'Winterspring - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Arathi
SET @OGUID = 51406;
SET @PTEMPLATE = 5329;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -984.55926513671875, -3889.457519531250, 148.8631134033203125, 1.710421562194824218, 0, 0, 0.754709243774414062, 0.656059443950653076, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -984.55926513671875, -3889.457519531250, 148.8631134033203125, 1.710421562194824218, 0, 0, 0.754709243774414062, 0.656059443950653076, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -984.55926513671875, -3889.457519531250, 148.8631134033203125, 1.710421562194824218, 0, 0, 0.754709243774414062, 0.656059443950653076, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1358, 0, 'Arathi Highlands - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Swamp of Sorrows
SET @OGUID = 51409;
SET @PTEMPLATE = 5330;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -10560.533203125, -3810.099365234375, -13.062748908996582, 5.270895957946777343, 0, 0, -0.48480892181396484, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -10560.533203125, -3810.099365234375, -13.062748908996582, 5.270895957946777343, 0, 0, -0.48480892181396484, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -10560.533203125, -3810.099365234375, -13.062748908996582, 5.270895957946777343, 0, 0, -0.48480892181396484, 0.87462007999420166, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 1314, 0, 'Swamp of Sorrows - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Hillsbrad - Darrow
SET @OGUID = 51412;
SET @PTEMPLATE = 5331;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1734, 0, -275.034088134765625, -384.038635253906250, 65.84112548828125000, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 2040, 0, -275.034088134765625, -384.038635253906250, 65.84112548828125000, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 600, 2700, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 2047, 0, -275.034088134765625, -384.038635253906250, 65.84112548828125000, 1.937312245368957519, 0, 0, 0.824125289916992187, 0.566407561302185058, 600, 2700, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+2, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10),
(@OGUID+3, @PTEMPLATE+1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 322, 0, 'Hillsbrad Foothills - Darrow Hill - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Add Chance
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Crystalvein Mine" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Mosh\'Ogg Ogre Mound" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stranglethorn Vale - Stockpile" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Blasted Lands - Serpent\'s Coil" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Silithus" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Thousand Needles" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Stonetalon Mountains" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` =  "Gold Vein / Mithril Deposit / Truesilver Deposit - Hillsbrad Foothills - Darrow Hill" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
