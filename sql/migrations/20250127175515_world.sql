DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250127175515');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250127175515');
-- Add your query below.


SET @PTEMPLATE = 8101;
-- Dustwallow Marsh
-- Darkmist Cavern
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6047, 6051, 6058, 6020, 6052, 6053, 6048, 6046, 6006, 6007, 6001));
DELETE FROM `pool_pool` WHERE `pool_id` IN (6047, 6051, 6058, 6020, 6052, 6053, 6048, 6046, 6006, 6007, 6001);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `entry` IN (6020);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `pool_entry` IN (6020);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `entry` IN (6047, 6051, 6058, 6048, 6053, 6052, 6046);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `pool_entry` IN (6047, 6051, 6058, 6048, 6053, 6052, 6046);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `entry` IN (6006, 6007, 6001);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Darkmist Cavern' WHERE `pool_entry` IN (6006, 6007, 6001);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Dustwallow Marsh - Darkmist Cavern - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6020, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit', 0),
(6006, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6007, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6001, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6048, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6046, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6047, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6051, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6058, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6053, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6052, @PTEMPLATE+1, 0, 'Dustwallow Marsh - Darkmist Cavern - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

-- Bloodfen Burrow
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6030, 6011, 6034));
DELETE FROM `pool_pool` WHERE `pool_id` IN (6030, 6011, 6034);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow' WHERE `entry` IN (6030, 6011, 6034);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Dustwallow Marsh - Bloodfen Burrow' WHERE `pool_entry` IN (6030, 6011, 6034);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Dustwallow Marsh - Bloodfen Burrow - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6030, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Bloodfen Burrow - Silver Vein / Gold Vein / Iron Deposit', 0),
(6011, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Bloodfen Burrow - Silver Vein / Gold Vein / Iron Deposit', 0),
(6034, @PTEMPLATE+2, 0, 'Dustwallow Marsh - Bloodfen Burrow - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Den of Flame
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (6004, 6008, 6009, 6010, 6002, 6056, 6054, 6049, 6050, 6055));
DELETE FROM `pool_pool` WHERE `pool_id` IN (6004, 6008, 6009, 6010, 6002, 6056, 6054, 6049, 6050, 6055);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Den of Flame' WHERE `entry` IN (6004, 6008, 6009, 6010, 6002);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Den of Flame' WHERE `pool_entry` IN (6004, 6008, 6009, 6010, 6002);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Den of Flame' WHERE `entry` IN (6056, 6054, 6049, 6050, 6055);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Dustwallow Marsh - Den of Flame' WHERE `pool_entry` IN (6056, 6054, 6049, 6050, 6055);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 3, 'Dustwallow Marsh - Den of Flame - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(6004, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6008, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6009, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6010, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6002, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(6056, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6054, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6049, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6050, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(6055, @PTEMPLATE+3, 0, 'Dustwallow Marsh - Den of Flame - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry`=9905;
UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry`=9904;

-- Alterac Mountains
-- Growless Cave
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (5037, 5073, 5050, 5074, 5069, 5022));
DELETE FROM `pool_pool` WHERE `pool_id` IN (5037, 5073, 5050, 5074, 5069, 5022);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Growless Cave' WHERE `entry` IN (5037, 5073, 5050, 5074, 5069, 5022);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Growless Cave' WHERE `pool_entry` IN (5037, 5073, 5050, 5074, 5069, 5022);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Alterac Mountains - Growless Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5037, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(5073, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(5050, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(5074, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(5069, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(5022, @PTEMPLATE+4, 0, 'Alterac Mountains - Growless Cave - Silver Vein / Gold Vein / Iron Deposit', 0);

-- Slaughter Hollow
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (5060, 5047, 5061, 5049, 5013, 5009));
DELETE FROM `pool_pool` WHERE `pool_id` IN (5060, 5047, 5061, 5049, 5013, 5009);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow' WHERE `entry` IN (5060, 5047, 5061, 5049);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Slaughter Hollow' WHERE `pool_entry` IN (5060, 5047, 5061, 5049);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow' WHERE `entry` IN (5013, 5009);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Slaughter Hollow' WHERE `pool_entry` IN (5013, 5009);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Alterac Mountains - Slaughter Hollow - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5060, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0),
(5047, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0),
(5061, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0),
(5049, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Silver Vein / Gold Vein / Iron Deposit', 0),
(5013, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5009, @PTEMPLATE+5, 0, 'Alterac Mountains - Slaughter Hollow - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Crushridge Hold
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (5023, 5043, 5084, 5035, 5083, 5082, 5029, 5081, 5034, 5054, 5028, 5044, 5021, 5004, 5010, 5015, 5014, 5012, 5007, 5019, 5017));
DELETE FROM `pool_pool` WHERE `pool_id` IN (5023, 5043, 5084, 5035, 5083, 5082, 5029, 5081, 5034, 5054, 5028, 5044, 5021, 5004, 5010, 5015, 5014, 5012, 5007, 5019, 5017);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold' WHERE `entry` IN (5023, 5043, 5084, 5035, 5083, 5082, 5029, 5081, 5034, 5054, 5028, 5044);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Alterac Mountains - Crushridge Hold' WHERE `pool_entry` IN (5023, 5043, 5084, 5035, 5083, 5082, 5029, 5081, 5034, 5054, 5028, 5044);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Crushridge Hold' WHERE `entry` IN (5021, 5004, 5010, 5015, 5014, 5012, 5007, 5019, 5017);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Alterac Mountains - Crushridge Hold' WHERE `pool_entry` IN (5021, 5004, 5010, 5015, 5014, 5012, 5007, 5019, 5017);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 3, 'Alterac Mountains - Crushridge Hold - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(5023, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5043, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5084, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5035, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5083, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5082, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5029, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5081, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5034, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5054, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5028, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5044, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Silver Vein / Gold Vein / Iron Deposit', 0),
(5021, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5004, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5010, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5015, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5014, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5012, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5007, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5019, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5017, @PTEMPLATE+6, 0, 'Alterac Mountains - Crushridge Hold - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

UPDATE `pool_template` SET `max_limit` = 10 WHERE `entry` = 9900;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 9901;
UPDATE `pool_template` SET `max_limit` = 3 WHERE `entry` = 9902;

-- Badlands
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Tin Vein / Silver Vein - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1732);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Tin Vein / Silver Vein - Badlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);

-- Excavation Center
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1755, 1754, 1761, 1762, 1758, 1757, 1759, 5555, 1760, 5556, 5553, 5554));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1755, 1754, 1761, 1762, 1758, 1757, 1759, 5555, 1760, 5556, 5553, 5554);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center' WHERE `entry` IN (1755, 1754, 1761, 1762, 1758, 1757, 1759);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Excavation Center' WHERE `pool_entry` IN (1755, 1754, 1761, 1762, 1758, 1757, 1759);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Excavation Center' WHERE `entry` IN (5555, 1760, 5556, 5553, 5554);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Excavation Center' WHERE `pool_entry` IN (5555, 1760, 5556, 5553, 5554);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 3, 'Badlands - Excavation Center - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1755, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1754, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1761, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1762, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1758, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1757, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(1759, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Silver Vein / Gold Vein / Iron Deposit', 0),
(5555, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(1760, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5556, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5553, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5554, @PTEMPLATE+7, 0, 'Badlands - Excavation Center - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Dustbelch Grotto
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1708, 1706, 1705, 1707, 5508, 5507, 5502, 5501, 5506, 5509, 5503, 5511));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1708, 1706, 1705, 1707, 5508, 5507, 5502, 5501, 5506, 5509, 5503, 5511);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Dustbelch Grotto' WHERE `entry` IN (1708, 1706, 1705, 1707);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Dustbelch Grotto' WHERE `pool_entry` IN (1708, 1706, 1705, 1707);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Dustbelch Grotto' WHERE `entry` IN (5508, 5507, 5502, 5501, 5506, 5509, 5503, 5511);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Badlands - Dustbelch Grotto' WHERE `pool_entry` IN (5508, 5507, 5502, 5501, 5506, 5509, 5503, 5511);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 3, 'Badlands - Dustbelch Grotto - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1708, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Silver Vein / Gold Vein / Iron Deposit', 0),
(1706, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Silver Vein / Gold Vein / Iron Deposit', 0),
(1705, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Silver Vein / Gold Vein / Iron Deposit', 0),
(1707, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Silver Vein / Gold Vein / Iron Deposit', 0),
(5508, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5507, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5502, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5501, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5506, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5509, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5503, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(5511, @PTEMPLATE+8, 0, 'Badlands - Dustbelch Grotto - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Misc Cave
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1747, 1748, 1749));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1747, 1748, 1749);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Misc Cave' WHERE `entry` IN (1747, 1748, 1749);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Badlands - Misc Cave' WHERE `pool_entry` IN (1747, 1748, 1749);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Badlands - Misc Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1747, @PTEMPLATE+9, 0, 'Badlands - Misc Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(1748, @PTEMPLATE+9, 0, 'Badlands - Misc Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(1749, @PTEMPLATE+9, 0, 'Badlands - Misc Cave - Silver Vein / Gold Vein / Iron Deposit', 0);

UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1287;
UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1288;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
