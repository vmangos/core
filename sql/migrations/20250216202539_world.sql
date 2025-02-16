DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250216202539');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250216202539');
-- Add your query below.


-- Arathi Highlands
-- Drywhisker Gorge
SET @PTEMPLATE = 145;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (17087, 17088, 17089, 21554, 1692, 1693, 1694, 1695, 1637, 1638, 5330, 4652, 4655, 4653, 4658, 4656, 4657, 4659, 4654));
DELETE FROM `pool_pool` WHERE `pool_id` IN (17087, 17088, 17089, 21554, 1692, 1693, 1694, 1695, 1637, 1638, 5330, 4652, 4655, 4653, 4658, 4656, 4657, 4659, 4654);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge' WHERE `entry` IN (17087, 17088, 17089, 21554, 1692, 1693, 1694, 1695, 1637, 1638);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Drywhisker Gorge' WHERE `pool_entry` IN (17087, 17088, 17089, 21554, 1692, 1693, 1694, 1695, 1637, 1638);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Drywhisker Gorge' WHERE `entry` IN (5330, 4652, 4655, 4653, 4658, 4656, 4657, 4659, 4654);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Drywhisker Gorge' WHERE `pool_entry` IN (5330, 4652, 4655, 4653, 4658, 4656, 4657, 4659, 4654);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Arathi Highlands - Drywhisker Gorge - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17087, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(17088, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(17089, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(21554, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1692, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1693, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1694, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1695, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1637, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(1638, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Silver Vein / Gold Vein / Iron Deposit', 0),
(5330, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4652, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4655, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4653, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4658, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4656, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4657, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4659, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4654, @PTEMPLATE+1, 0, 'Arathi Highlands - Drywhisker Gorge - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Witherbark Village
SET @PTEMPLATE = 151;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (17077, 17039, 17050, 17075, 17072, 1648, 1650, 4630, 4648, 4647, 4643));
DELETE FROM `pool_pool` WHERE `pool_id` IN (17077, 17039, 17050, 17075, 17072, 1648, 1650, 4630, 4648, 4647, 4643);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village' WHERE `entry` IN (17077, 17039, 17050, 17075, 17072, 1648, 1650);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Witherbark Village' WHERE `pool_entry` IN (17077, 17039, 17050, 17075, 17072, 1648, 1650);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Witherbark Village' WHERE `entry` IN (4630, 4648, 4647, 4643);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Arathi Highlands - Witherbark Village' WHERE `pool_entry` IN (4630, 4648, 4647, 4643);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Arathi Highlands - Witherbark Village - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17077, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(17039, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(17050, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(17075, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(17072, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(1648, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(1650, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Silver Vein / Gold Vein / Iron Deposit', 0),
(4630, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4648, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4647, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4643, @PTEMPLATE+1, 0, 'Arathi Highlands - Witherbark Village - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Boulderfist Hall
SET @PTEMPLATE = 161;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1652, 1649, 1647, 17071, 17073, 23052, 21673, 21674, 17074, 17040));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1652, 1649, 1647, 17071, 17073, 23052, 21673, 21674, 17074, 17040);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Boulderfist Hall' WHERE `entry` IN (1652, 1649, 1647, 17071, 17073, 23052, 21673, 21674, 17074, 17040);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Boulderfist Hall' WHERE `pool_entry` IN (1652, 1649, 1647, 17071, 17073, 23052, 21673, 21674, 17074, 17040);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Arathi Highlands - Boulderfist Hall - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1652, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(1649, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(1647, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(17071, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(17073, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(23052, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(21673, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(21674, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(17074, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0),
(17040, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Hall - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Boulderfist Outpost
SET @PTEMPLATE = 251;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (17084, 21675, 1667, 1668, 1669, 1671, 1670, 1674));
DELETE FROM `pool_pool` WHERE `pool_id` IN (17084, 21675, 1667, 1668, 1669, 1671, 1670, 1674);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Boulderfist Outpost' WHERE `entry` IN (17084, 21675, 1667, 1668, 1669, 1671, 1670, 1674);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands - Boulderfist Outpost' WHERE `pool_entry` IN (17084, 21675, 1667, 1668, 1669, 1671, 1670, 1674);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Arathi Highlands - Boulderfist Outpost - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(17084, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(21675, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1667, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1668, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1669, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1671, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1670, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0),
(1674, @PTEMPLATE+1, 0, 'Arathi Highlands - Boulderfist Outpost - Silver Vein / Gold Vein / Iron Deposit', 0);
UPDATE `pool_template` SET `max_limit` = 6 WHERE `entry` = 406;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1358;
UPDATE `pool_template` SET `max_limit` = 14 WHERE `entry` = 323;

-- Ashenvale
-- Thistlefur Hold
SET @PTEMPLATE = 263;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6066, 6086, 6085, 7064, 6067, 6090));
DELETE FROM `pool_pool` WHERE `pool_id` IN (6066, 6086, 6085, 7064, 6067, 6090);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold' WHERE `entry` IN (6066, 6086, 6085, 7064, 6067, 6090);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Ashenvale - Thistlefur Hold' WHERE `pool_entry` IN (6066, 6086, 6085, 7064, 6067, 6090);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Ashenvale - Thistlefur Hold - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6066, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(6086, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(6085, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(7064, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(6067, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0),
(6090, @PTEMPLATE+1, 0, 'Ashenvale - Thistlefur Hold - Tin Vein / Silver Vein', 0);

-- Demon Fall Canyon
SET @PTEMPLATE = 264;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (9282, 6079, 9283, 9284, 6094, 6080, 9286, 9285, 6069));
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6182, 2865, 6185, 6186, 6184, 6187, 17127));
DELETE FROM `pool_pool` WHERE `pool_id` IN (9282, 6079, 9283, 9284, 6094, 6080, 9286, 9285, 6069, 6182, 2865, 6185, 6186, 6184, 6187, 17127);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon' WHERE `entry` IN (9282, 6079, 9283, 9284, 6094, 6080, 9286, 9285, 6069);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Ashenvale - Demon Fall Canyon' WHERE `pool_entry` IN (9282, 6079, 9283, 9284, 6094, 6080, 9286, 9285, 6069);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon' WHERE `entry` IN (6182, 2865, 6185, 6186, 6184, 6187, 17127);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Ashenvale - Demon Fall Canyon' WHERE `pool_entry` IN (6182, 2865, 6185, 6186, 6184, 6187, 17127);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Ashenvale - Demon Fall Canyon - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(9282, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(6079, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(9283, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(9284, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(6094, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(6080, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(9286, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(9285, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(6069, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Tin Vein / Silver Vein', 0),
(6182, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(2865, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(6185, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(6186, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(6184, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(6187, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0),
(17127, @PTEMPLATE+1, 0, 'Ashenvale - Demon Fall Canyon - Silver Vein / Gold Vein / Iron Deposit', 0);
UPDATE `pool_template` SET `max_limit` = 13 WHERE `entry` = 1075;
UPDATE `pool_template` SET `max_limit` = 15 WHERE `entry` = 1080;
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1351;

-- Duskwood
-- Vul'Gol Ogre Mound
SET @PTEMPLATE = 265;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2477, 2500, 2497, 2495, 2501));
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6352, 6348, 6342, 6344));
DELETE FROM `pool_pool` WHERE `pool_id` IN (2477, 2500, 2497, 2495, 2501, 6352, 6348, 6342, 6344);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound' WHERE `entry` IN (2477, 2500, 2497, 2495, 2501);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Vul\'Gol Ogre Mound' WHERE `pool_entry` IN (2477, 2500, 2497, 2495, 2501);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound' WHERE `entry` IN (6352, 6348, 6342, 6344);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Vul\'Gol Ogre Mound' WHERE `pool_entry` IN (6352, 6348, 6342, 6344);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Duskwood - Vul\'Gol Ogre Mound - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2477, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(2500, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(2497, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(2495, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(2501, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Tin Vein / Silver Vein', 0),
(6352, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(6348, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(6342, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0),
(6344, @PTEMPLATE+1, 0, 'Duskwood - Vul\'Gol Ogre Mound - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Roland\'s Doom
SET @PTEMPLATE = 266;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (7003, 2503, 2502, 2475));
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6354, 6346, 6330, 6350));
DELETE FROM `pool_pool` WHERE `pool_id` IN (7003, 2503, 2502, 2475, 6354, 6346, 6330, 6350);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Roland\'s Doom' WHERE `entry` IN (7003, 2503, 2502, 2475);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Roland\'s Doom' WHERE `pool_entry` IN (7003, 2503, 2502, 2475);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom' WHERE `entry` IN (6354, 6346, 6330, 6350);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Roland\'s Doom' WHERE `pool_entry` IN (6354, 6346, 6330, 6350);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Duskwood - Roland\'s Doom - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2475, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Tin Vein / Silver Vein', 0),
(7003, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Tin Vein / Silver Vein', 0),
(2503, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Tin Vein / Silver Vein', 0),
(2502, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Tin Vein / Silver Vein', 0),
(6354, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Silver Vein / Gold Vein / Iron Deposit', 0),
(6346, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Silver Vein / Gold Vein / Iron Deposit', 0),
(6330, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Silver Vein / Gold Vein / Iron Deposit', 0),
(6350, @PTEMPLATE+1, 0, 'Duskwood - Roland\'s Doom - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Misc Cave
SET @PTEMPLATE = 267;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2487, 2490));
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6334, 6335));
DELETE FROM `pool_pool` WHERE `pool_id` IN (2487, 2490, 6334, 6335);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Misc Cave' WHERE `entry` IN (2487, 2490);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Duskwood - Misc Cave' WHERE `pool_entry` IN (2487, 2490);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Misc Cave' WHERE `entry` IN (6334, 6335);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Duskwood - Misc Cave' WHERE `pool_entry` IN (6334, 6335);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Duskwood - Misc Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2487, @PTEMPLATE+1, 0, 'Duskwood - Misc Cave - Tin Vein / Silver Vein', 0),
(2490, @PTEMPLATE+1, 0, 'Duskwood - Misc Cave - Tin Vein / Silver Vein', 0),
(6334, @PTEMPLATE+1, 0, 'Duskwood - Misc Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(6335, @PTEMPLATE+1, 0, 'Duskwood - Misc Cave - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Wetlands
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Wetlands - Thelgen Rock' WHERE  `guid` IN (251658, 251655);
-- Raptor Ridge
SET @PTEMPLATE = 268;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (23022, 2808, 2819, 2818));
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (17025, 6117, 6130, 6133, 6121, 6123, 6122, 6118, 6120, 2820, 6119, 6132));
DELETE FROM `pool_pool` WHERE `pool_id` IN (23022, 2808, 2819, 2818, 17025, 6117, 6130, 6133, 6121, 6123, 6122, 6118, 6120, 2820, 6119, 6132);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Wetlands - Raptor Ridge' WHERE `entry` IN (23022, 2808, 2819, 2818);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Wetlands - Raptor Ridge' WHERE `pool_entry` IN (23022, 2808, 2819, 2818);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Raptor Ridge' WHERE `entry` IN (17025, 6117, 6130, 6133, 6121, 6123, 6122, 6118, 6120, 2820, 6119, 6132);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Wetlands - Raptor Ridge' WHERE `pool_entry` IN (17025, 6117, 6130, 6133, 6121, 6123, 6122, 6118, 6120, 2820, 6119, 6132);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Wetlands - Raptor Ridge - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(23022, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Tin Vein / Silver Vein', 0),
(2808, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Tin Vein / Silver Vein', 0),
(2819, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Tin Vein / Silver Vein', 0),
(2818, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Tin Vein / Silver Vein', 0),
(17025, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6117, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6130, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6133, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6121, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6123, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6122, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6118, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6120, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(2820, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6119, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0),
(6132, @PTEMPLATE+1, 0, 'Wetlands - Raptor Ridge - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Misc Cave
SET @PTEMPLATE = 269;
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (2785, 23020));
UPDATE `gameobject` SET `spawntimesecsmin` = 300, `spawntimesecsmax` = 900 WHERE `guid` = 14920;
DELETE FROM `pool_pool` WHERE `pool_id` IN (2785, 23020);
DELETE FROM `pool_gameobject` WHERE `guid` IN (14920);
UPDATE `pool_template` SET `description` = 'Tin Vein / Silver Vein - Wetlands - Misc Cave' WHERE `entry` IN (2785, 23020);
UPDATE `pool_gameobject` SET `description` = 'Tin Vein / Silver Vein - Wetlands - Misc Cave' WHERE `pool_entry` IN (2785, 23020);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Copper Veins - Wetlands - Misc Cave', 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES
(14920, @PTEMPLATE+1, 'Copper Veins - Wetlands - Misc Cave', 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Wetlands - Misc Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+2, 0, 'Wetlands - Misc Cave - Copper Veins', 0),
(2785, @PTEMPLATE+2, 0, 'Wetlands - Misc Cave - Tin Vein / Silver Vein', 0),
(23020, @PTEMPLATE+2, 0, 'Wetlands - Misc Cave - Tin Vein / Silver Vein', 0);
UPDATE `pool_template` SET `max_limit` = 9 WHERE `entry` = 1156;

UPDATE `pool_template` SET `description` = 'Hinterlands - Silver Vein / Gold Vein / Iron Deposit (Master Pool)' WHERE `entry` = 1349;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
