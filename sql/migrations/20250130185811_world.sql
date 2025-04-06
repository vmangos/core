DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250130185811');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250130185811');
-- Add your query below.


SET @PTEMPLATE = 8117;
-- Un'Goro Crater
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123309);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Ooze Covered Truesilver Deposit / Ooze Covered Thorium Vein - Un\'Goro Crater" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 123848);
-- Fungal Rock
DELETE FROM `gameobject` WHERE `guid` = 23840;
DELETE FROM `pool_gameobject` WHERE `guid` = 23840;
UPDATE `gameobject` SET `id` = 324 WHERE `guid` = 23857;
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `guid` = 23857;
UPDATE `pool_gameobject` SET `description`='Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater' WHERE `guid` = 23857;
UPDATE `pool_gameobject` SET `description`='Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater' WHERE `guid` = 23874;
UPDATE `pool_template` SET `description`='Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater' WHERE `entry` = 1400;
UPDATE `pool_pool` SET `description`='Un\'Goro Crater - Truesilver Deposit / Small Thorium Vein' WHERE `pool_id` = 1400;
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1400, 1802, 1791, 1801, 1794, 1803, 1790, 1792, 1793, 1804, 14416));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1400, 1802, 1791, 1801, 1794, 1803, 1790, 1792, 1793, 1804, 14416);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Fungal Rock' WHERE `entry` IN (1400, 1802, 1791, 1801, 1794, 1803, 1790, 1792, 1793, 1804, 14416);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Un\'Goro Crater - Fungal Rock' WHERE `pool_entry` IN (1400, 1802, 1791, 1801, 1794, 1803, 1790, 1792, 1793, 1804, 14416);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 3, 'Un\'Goro Crater - Fungal Rock - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1400, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1802, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1791, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1801, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1794, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1803, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1790, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1792, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1793, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(1804, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0),
(14416, @PTEMPLATE+1, 0, 'Un\'Goro Crater - Fungal Rock - Truesilver Deposit / Small Thorium Vein', 0);

UPDATE `pool_template` SET `max_limit` = 7 WHERE `entry` = 1211;
UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1210;

-- Swamp of Sorrows
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1733);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 40 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1735);
UPDATE `pool_gameobject` SET `chance` = 45 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
-- Stagalbog Cave
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (21574, 17064, 21572, 17063, 4259, 4256, 4255, 4257, 4258, 9801, 17145, 23036));
DELETE FROM `pool_pool` WHERE `pool_id` IN (21574, 17064, 21572, 17063, 4259, 4256, 4255, 4257, 4258, 9801, 17145, 23036);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `entry` IN (21574, 17064, 21572, 17063);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `pool_entry` IN (21574, 17064, 21572, 17063);
UPDATE `pool_template` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `entry` IN (4259, 4256, 4255, 4257, 4258);
UPDATE `pool_gameobject` SET `description` = 'Gold Vein / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `pool_entry` IN (4259, 4256, 4255, 4257, 4258);
UPDATE `pool_template` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `entry` IN (9801, 17145, 23036);
UPDATE `pool_gameobject` SET `description` = 'Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit - Swamp of Sorrows - Stagalbog Cave' WHERE `pool_entry` IN (9801, 17145, 23036);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 3, 'Swamp of Sorrows - Stagalbog Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21574, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(17064, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(21572, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(17063, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit', 0),
(4259, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4256, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4255, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4257, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(4258, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(9801, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(17145, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0),
(23036, @PTEMPLATE+2, 0, 'Swamp of Sorrows - Stagalbog Cave - Silver Vein / Gold Vein / Iron Deposit / Mithril Deposit / Truesilver Deposit', 0);

UPDATE `pool_template` SET `max_limit` = 4 WHERE `entry` = 1318;

-- Western Plaguelands
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Western Plaguelands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);
-- Hearthglen Mine
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (21659, 14432, 14431));
DELETE FROM `pool_pool` WHERE `pool_id` IN (21659, 14432, 14431);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine' WHERE `entry` IN (21659, 14432, 14431);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Hearthglen Mine' WHERE `pool_entry` IN (21659, 14432, 14431);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Western Plaguelands - Hearthglen Mine - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21659, @PTEMPLATE+3, 0, 'Western Plaguelands - Hearthglen Mine - Truesilver Deposit / Rich Thorium Vein', 0),
(14432, @PTEMPLATE+3, 0, 'Western Plaguelands - Hearthglen Mine - Truesilver Deposit / Rich Thorium Vein', 0),
(14431, @PTEMPLATE+3, 0, 'Western Plaguelands - Hearthglen Mine - Truesilver Deposit / Rich Thorium Vein', 0);

-- Weeping Cave
-- Weeping Cave
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (25485, 23011, 21660, 21661));
DELETE FROM `pool_pool` WHERE `pool_id` IN (25485, 23011, 21660, 21661);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave' WHERE `entry` IN (25485, 23011);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Western Plaguelands - Weeping Cave' WHERE `pool_entry` IN (25485, 23011);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave' WHERE `entry` IN (21660, 21661);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Western Plaguelands - Weeping Cave' WHERE `pool_entry` IN (21660, 21661);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Western Plaguelands - Weeping Cave - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(25485, @PTEMPLATE+4, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Small Thorium Vein', 0),
(23011, @PTEMPLATE+4, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Small Thorium Vein', 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+21, 1, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(21660, @PTEMPLATE+21, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Rich Thorium Vein', 0),
(21661, @PTEMPLATE+21, 0, 'Western Plaguelands - Weeping Cave - Truesilver Deposit / Rich Thorium Vein', 0);

UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 1262;

-- Winterspring
UPDATE `pool_pool` SET `description` = 'Winterspring - Gold Vein / Mithril Deposit / Truesilver Deposit' WHERE `pool_id` IN (17183, 17184, 17185, 17186);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring' WHERE `guid` IN (24055, 24056);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 1734);
UPDATE `pool_gameobject` SET `chance` = 90 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2040);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Gold Vein / Mithril Deposit / Truesilver Deposit - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Rich Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 175404);
UPDATE `pool_gameobject` SET `chance` = 5 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 2047);
UPDATE `pool_gameobject` SET `chance` = 95 WHERE `description` = "Truesilver Deposit / Small Thorium Vein - Winterspring" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 324);

-- Ice Thistle Hills
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (14343, 14329, 14410));
DELETE FROM `pool_pool` WHERE `pool_id` IN (14343, 14329, 14410);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills' WHERE `entry` IN (14343, 14329, 14410);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Winterspring - Ice Thistle Hills' WHERE `pool_entry` IN (14343, 14329, 14410);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Winterspring - Ice Thistle Hills - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14343, @PTEMPLATE+5, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Small Thorium Vein', 0),
(14329, @PTEMPLATE+5, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Small Thorium Vein', 0),
(14410, @PTEMPLATE+5, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Small Thorium Vein', 0);

-- Mazthoril
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (14407, 14342, 14337, 14328, 14341));
DELETE FROM `pool_pool` WHERE `pool_id` IN (14407, 14342, 14337, 14328, 14341);
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Winterspring - Mazthoril' WHERE `entry` IN (14407, 14342, 14337, 14328, 14341);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Small Thorium Vein - Winterspring - Mazthoril' WHERE `pool_entry` IN (14407, 14342, 14337, 14328, 14341);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 2, 'Winterspring - Mazthoril - Minerals (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14407, @PTEMPLATE+6, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0),
(14342, @PTEMPLATE+6, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0),
(14337, @PTEMPLATE+6, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0),
(14328, @PTEMPLATE+6, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0),
(14341, @PTEMPLATE+6, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Small Thorium Vein', 0);

-- Rich Thorium Pools
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (14409, 3987, 14368, 14372, 14367, 14366, 14373, 14371, 14344, 14345, 14443, 14369, 14346, 14347, 14348, 14349, 14350, 14376, 14351, 14352, 14353, 14354, 14355, 14356, 14374, 14375, 14357, 14377, 14358, 14365, 14359, 14360, 14361, 14362, 14444, 14363, 14370, 14364));
DELETE FROM `pool_pool` WHERE `pool_id` IN (14409, 3987, 14368, 14372, 14367, 14366, 14373, 14371, 14344, 14345, 14443, 14369, 14346, 14347, 14348, 14349, 14350, 14376, 14351, 14352, 14353, 14354, 14355, 14356, 14374, 14375, 14357, 14377, 14358, 14365, 14359, 14360, 14361, 14362, 14444, 14363, 14370, 14364);
-- Darkwhisper Gorge
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge' WHERE `entry` IN (3987, 14368, 14372, 14367, 14366);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Darkwhisper Gorge' WHERE `pool_entry` IN (3987, 14368, 14372, 14367, 14366);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(3987, @PTEMPLATE+7, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(14368, @PTEMPLATE+7, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(14372, @PTEMPLATE+7, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(14367, @PTEMPLATE+7, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0),
(14366, @PTEMPLATE+7, 0, 'Winterspring - Darkwhisper Gorge - Truesilver Deposit / Rich Thorium Vein', 0);

-- Frostwhisper George
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostwhisper George' WHERE `entry` IN (14373, 14371, 14344, 14345, 14443, 14369);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostwhisper George' WHERE `pool_entry` IN (14373, 14371, 14344, 14345, 14443, 14369);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+8, 1, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14373, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0),
(14371, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0),
(14344, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0),
(14345, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0),
(14443, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0),
(14369, @PTEMPLATE+8, 0, 'Winterspring - Frostwhisper George - Truesilver Deposit / Rich Thorium Vein', 0);

-- Owl Wing Thicket
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Owl Wing Thicket' WHERE `entry` IN (14346, 14347, 14348, 14349);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Owl Wing Thicket' WHERE `pool_entry` IN (14346, 14347, 14348, 14349);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 1, 'Winterspring - Owl Wing Thicket - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14346, @PTEMPLATE+9, 0, 'Winterspring - Owl Wing Thicket - Truesilver Deposit / Rich Thorium Vein', 0),
(14347, @PTEMPLATE+9, 0, 'Winterspring - Owl Wing Thicket - Truesilver Deposit / Rich Thorium Vein', 0),
(14348, @PTEMPLATE+9, 0, 'Winterspring - Owl Wing Thicket - Truesilver Deposit / Rich Thorium Vein', 0),
(14349, @PTEMPLATE+9, 0, 'Winterspring - Owl Wing Thicket - Truesilver Deposit / Rich Thorium Vein', 0);

-- Mazthoril
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril' WHERE `entry` IN (14350, 14376);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Mazthoril' WHERE `pool_entry` IN (14350, 14376);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+10, 1, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14350, @PTEMPLATE+10, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein', 0),
(14376, @PTEMPLATE+10, 0, 'Winterspring - Mazthoril - Truesilver Deposit / Rich Thorium Vein', 0);

-- Lake of Kel'Theril
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Lake of Kel\'Theril' WHERE `entry` IN (14351, 14352, 14353, 14354, 14355, 14356);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Lake of Kel\'Theril' WHERE `pool_entry` IN (14351, 14352, 14353, 14354, 14355, 14356);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+11, 1, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14351, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0),
(14352, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0),
(14353, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0),
(14354, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0),
(14355, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0),
(14356, @PTEMPLATE+11, 0, 'Winterspring - Lake of Kel\'Theril - Truesilver Deposit / Rich Thorium Vein', 0);

-- Ice Thistle Hills
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills' WHERE `entry` IN (14409, 14374, 14375, 14357, 14377);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Ice Thistle Hills' WHERE `pool_entry` IN (14409, 14374, 14375, 14357, 14377);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+12, 1, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14409, @PTEMPLATE+12, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0),
(14374, @PTEMPLATE+12, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0),
(14375, @PTEMPLATE+12, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0),
(14357, @PTEMPLATE+12, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0),
(14377, @PTEMPLATE+12, 0, 'Winterspring - Ice Thistle Hills - Truesilver Deposit / Rich Thorium Vein', 0);

-- Winterfall Village
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Winterfall Village' WHERE `entry` IN (14358, 14365, 14359, 14360, 14361);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Winterfall Village' WHERE `pool_entry` IN (14358, 14365, 14359, 14360, 14361);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+13, 1, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14358, @PTEMPLATE+13, 0, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein', 0),
(14365, @PTEMPLATE+13, 0, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein', 0),
(14359, @PTEMPLATE+13, 0, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein', 0),
(14360, @PTEMPLATE+13, 0, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein', 0),
(14361, @PTEMPLATE+13, 0, 'Winterspring - Winterfall Village - Truesilver Deposit / Rich Thorium Vein', 0);

-- Frostsaber Rock
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostsaber Rock' WHERE `entry` IN (14362, 14444, 14363, 14370, 14364);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Winterspring - Frostsaber Rock' WHERE `pool_entry` IN (14362, 14444, 14363, 14370, 14364);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+14, 1, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(14362, @PTEMPLATE+14, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0),
(14444, @PTEMPLATE+14, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0),
(14363, @PTEMPLATE+14, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0),
(14370, @PTEMPLATE+14, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0),
(14364, @PTEMPLATE+14, 0, 'Winterspring - Frostsaber Rock - Truesilver Deposit / Rich Thorium Vein', 0);

UPDATE `pool_template` SET `max_limit` = 5 WHERE `entry` = 1233;
DELETE FROM `pool_template` WHERE `entry` = 1235;

-- Eastern Plaguelands
-- Rich Thorium Pools
UPDATE `gameobject` SET `spawntimesecsmin` = 600, `spawntimesecsmax` = 2700 WHERE `guid` IN (SELECT `guid` FROM `pool_gameobject` WHERE `pool_entry` IN (1429, 1408, 1409, 1410, 1411, 1412, 3985, 14438, 1413, 1415, 1417, 1434, 1435, 1414, 1416, 1418, 1419, 1420, 1421, 1422, 1423, 3986, 1425, 1426, 1427, 1269, 1432, 1433));
DELETE FROM `pool_pool` WHERE `pool_id` IN (1429, 1408, 1409, 1410, 1411, 1412, 3985, 14438, 1413, 1415, 1417, 1434, 1435, 1414, 1416, 1418, 1419, 1420, 1421, 1422, 1423, 3986, 1425, 1426, 1427, 1269, 1432, 1433);
-- Tyr's Hand
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand' WHERE `entry` IN (1408, 1409, 1410, 1411, 1412, 3985, 14438);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Tyr\'s Hand' WHERE `pool_entry` IN (1408, 1409, 1410, 1411, 1412, 3985, 14438);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+15, 1, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1408, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(1409, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(1410, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(1411, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(1412, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(3985, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0),
(14438, @PTEMPLATE+15, 0, 'Eastern Plaguelands - Tyr\'s Hand - Truesilver Deposit / Rich Thorium Vein', 0);

-- Infectis Scar
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Infectis Scar' WHERE `entry` IN (1413, 1415, 1417, 1434, 1435);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Infectis Scar' WHERE `pool_entry` IN (1413, 1415, 1417, 1434, 1435);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+16, 1, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1413, @PTEMPLATE+16, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1415, @PTEMPLATE+16, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1417, @PTEMPLATE+16, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1434, @PTEMPLATE+16, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1435, @PTEMPLATE+16, 0, 'Eastern Plaguelands - Infectis Scar - Truesilver Deposit / Rich Thorium Vein', 0);

-- Pestilent Scar
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Pestilent Scar' WHERE `entry` IN (1414, 1416, 1418, 1419, 1420, 1421);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Pestilent Scar' WHERE `pool_entry` IN (1414, 1416, 1418, 1419, 1420, 1421);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+17, 1, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1414, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1416, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1418, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1419, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1420, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0),
(1421, @PTEMPLATE+17, 0, 'Eastern Plaguelands - Pestilent Scar - Truesilver Deposit / Rich Thorium Vein', 0);

-- Fungal Vale
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale' WHERE `entry` IN (1422, 1423, 3986);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Fungal Vale' WHERE `pool_entry` IN (1422, 1423, 3986);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+18, 1, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1422, @PTEMPLATE+18, 0, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein', 0),
(1423, @PTEMPLATE+18, 0, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein', 0),
(3986, @PTEMPLATE+18, 0, 'Eastern Plaguelands - Fungal Vale - Truesilver Deposit / Rich Thorium Vein', 0);

-- Noxious Glade
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade' WHERE `entry` IN (1425, 1426, 1427, 1429);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Noxious Glade' WHERE `pool_entry` IN (1425, 1426, 1427, 1429);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+19, 1, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1425, @PTEMPLATE+19, 0, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein', 0),
(1426, @PTEMPLATE+19, 0, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein', 0),
(1427, @PTEMPLATE+19, 0, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein', 0),
(1429, @PTEMPLATE+19, 0, 'Eastern Plaguelands - Noxious Glade - Truesilver Deposit / Rich Thorium Vein', 0);

-- Zul'Mashar
UPDATE `pool_template` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar' WHERE `entry` IN (1432, 1433);
UPDATE `pool_gameobject` SET `description` = 'Truesilver Deposit / Rich Thorium Vein - Eastern Plaguelands - Zul\'Mashar' WHERE `pool_entry` IN (1432, 1433);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+20, 1, 'Eastern Plaguelands - Zul\'Mashar - Truesilver Deposit / Rich Thorium Vein (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1432, @PTEMPLATE+20, 0, 'Eastern Plaguelands - Zul\'Mashar - Truesilver Deposit / Rich Thorium Vein', 0),
(1433, @PTEMPLATE+20, 0, 'Eastern Plaguelands - Zul\'Mashar - Truesilver Deposit / Rich Thorium Vein', 0);

UPDATE `pool_template` SET `max_limit` = 1 WHERE `entry` = 325;

-- Tirisfal Glades
UPDATE `pool_template` SET `max_limit` = 33 WHERE `entry`=1008;
UPDATE `pool_template` SET `description` = 'Copper Veins (Master Pool)- Tirisfal Glades' WHERE `entry` = 1008;
UPDATE `pool_gameobject` SET `description` = 'Copper Vein - Tirisfal Glades' WHERE `guid` IN (112756, 35464);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
