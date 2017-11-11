DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171101200054');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171101200054');
-- Add your query below.


-- Lunar Wand
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15283, 7, 2, 19, 'Lunar Wand', 28577, 2, 186826, 37365, 26, 64, 59, 67, 126, 6, 1700, 100, 0, 0, 2, 2, 5860, 55, 31);
UPDATE `item_enchantment_template` SET `ench`=2042 WHERE `entry`=5850 AND `ench`=2035;
UPDATE `item_enchantment_template` SET `ench`=1966 WHERE `entry`=5850 AND `ench`=1959;
UPDATE `item_enchantment_template` SET `ench`=1890 WHERE `entry`=5850 AND `ench`=1883;
UPDATE `item_enchantment_template` SET `ench`=1852 WHERE `entry`=5850 AND `ench`=1845;
UPDATE `item_enchantment_template` SET `ench`=1814 WHERE `entry`=5850 AND `ench`=1807;
REPLACE INTO `item_enchantment_template` VALUES
 (5860, 175, 5.7),
 (5860, 180, 4.2),
 (5860, 185, 6.7),
 (5860, 247, 2.22),
 (5860, 250, 2.22),
 (5860, 251, 2.22),
 (5860, 252, 2.22),
 (5860, 511, 2.28),
 (5860, 512, 2.28),
 (5860, 513, 2.28),
 (5860, 514, 2.28),
 (5860, 683, 0.1),
 (5860, 766, 2.3),
 (5860, 767, 2.3),
 (5860, 768, 2.3),
 (5860, 769, 2.3),
 (5860, 851, 2.7),
 (5860, 852, 2.7),
 (5860, 853, 2.7),
 (5860, 854, 2.7),
 (5860, 936, 2),
 (5860, 937, 2),
 (5860, 938, 2),
 (5860, 939, 2),
 (5860, 1021, 2.25),
 (5860, 1022, 2.25),
 (5860, 1023, 2.25),
 (5860, 1024, 2.25),
 (5860, 1106, 1.95),
 (5860, 1107, 1.95),
 (5860, 1108, 1.95),
 (5860, 1109, 1.95),
 (5860, 1361, 0.1),
 (5860, 1552, 0.1),
 (5860, 1807, 2.6),
 (5860, 1845, 3.5),
 (5860, 1883, 4.7),
 (5860, 1959, 4.1),
 (5860, 2035, 5.6);
 
-- Dragon Finger
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15282, 7, 2, 19, 'Dragon Finger', 28518, 2, 153143, 30628, 26, 60, 55, 52, 97, 2, 1400, 100, 0, 0, 2, 2, 5861, 55, 30);
UPDATE `item_enchantment_template` SET `chance`=3.44 WHERE  `entry`=5307 AND `ench` IN (2040,2041);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5307 AND `ench` IN (2034,2035,2036,2037,2038,2039);
UPDATE `item_enchantment_template` SET `chance`=1.76 WHERE  `entry`=5307 AND `ench` IN (1964,1965);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5307 AND `ench` IN (1958,1959,1960,1961,1962,1963);
UPDATE `item_enchantment_template` SET `chance`=2.16 WHERE  `entry`=5307 AND `ench` IN (1888,1889);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5307 AND `ench` IN (1882,1883,1884,1885,1886,1887);
UPDATE `item_enchantment_template` SET `chance`=1 WHERE `entry`=5307 AND `ench` IN (1850,1851);
DELETE FROM `item_enchantment_template` WHERE `entry`=5307 AND `ench` IN (1844,1845,1846,1847,1848,1849);
UPDATE `item_enchantment_template` SET `chance`=1.64 WHERE `entry`=5307 AND `ench` IN (1812,1813);
DELETE FROM `item_enchantment_template` WHERE `entry`=5307 AND `ench` IN (1806,1807,1808,1809,1810,1811);
REPLACE INTO `item_enchantment_template` VALUES 
(5861, 174, 4.8),
(5861, 179, 5.1),
(5861, 184, 5),
(5861, 247, 9.8),
(5861, 511, 8.9),
(5861, 766, 9.5),
(5861, 851, 9),
(5861, 936, 9.2),
(5861, 1021, 9.5),
(5861, 1106, 9.1),
(5861, 1498, 0.1),
(5861, 1805, 1.64),
(5861, 1806, 1.64),
(5861, 1843, 1),
(5861, 1844, 1),
(5861, 1881, 2.16),
(5861, 1882, 2.16),
(5861, 1957, 1.76),
(5861, 1958, 1.76),
(5861, 2033, 3.44),
(5861, 2034, 3.44);

-- Glowstar Rod
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15281, 7, 2, 19, 'Glowstar Rod', 28538, 2, 130550, 26110, 26, 57, 52, 52, 98, 6, 1500, 100, 0, 0, 2, 2, 5862, 55, 30);
UPDATE `item_enchantment_template` SET `chance`=2.96 WHERE  `entry`=5298 AND `ench` IN (2039,2040);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5298 AND `ench` IN (2033,2034,2035,2036,2037,2038);
UPDATE `item_enchantment_template` SET `chance`=1.44 WHERE  `entry`=5298 AND `ench` IN (1963,1964);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5298 AND `ench` IN (1957,1958,1959,1960,1961,1962);
UPDATE `item_enchantment_template` SET `chance`=2.16 WHERE  `entry`=5298 AND `ench` IN (1887,1888);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5298 AND `ench` IN (1881,1882,1883,1884,1885,1886);
UPDATE `item_enchantment_template` SET `chance`=1 WHERE `entry`=5298 AND `ench` IN (1849,1850);
DELETE FROM `item_enchantment_template` WHERE `entry`=5298 AND `ench` IN (1843,1844,1845,1846,1847,1848);
UPDATE `item_enchantment_template` SET `chance`=1.72 WHERE `entry`=5298 AND `ench` IN (1811,1812);
DELETE FROM `item_enchantment_template` WHERE `entry`=5298 AND `ench` IN (1805,1806,1807,1808,1809,1810);
REPLACE INTO `item_enchantment_template` VALUES 
(5862, 152, 2.75),
(5862, 153, 2.55),
(5862, 154, 2.55),
(5862, 174, 2.75),
(5862, 179, 2.55),
(5862, 184, 2.55),
(5862, 237, 2.35),
(5862, 247, 2.35),
(5862, 248, 2.35),
(5862, 249, 2.35),
(5862, 508, 2.42),
(5862, 509, 2.42),
(5862, 510, 2.42),
(5862, 511, 2.42),
(5862, 763, 2.17),
(5862, 764, 2.17),
(5862, 765, 2.17),
(5862, 766, 2.17),
(5862, 848, 2),
(5862, 849, 2),
(5862, 850, 2),
(5862, 851, 2),
(5862, 933, 2.5),
(5862, 934, 2.5),
(5862, 935, 2.5),
(5862, 936, 2.5),
(5862, 1018, 2.4),
(5862, 1019, 2.4),
(5862, 1020, 2.4),
(5862, 1021, 2.4),
(5862, 1103, 2.53),
(5862, 1104, 2.53),
(5862, 1105, 2.53),
(5862, 1106, 2.53),
(5862, 1804, 1.72),
(5862, 1805, 1.72),
(5862, 1842, 1),
(5862, 1843, 1),
(5862, 1880, 2.16),
(5862, 1881, 2.16),
(5862, 1956, 1.44),
(5862, 1957, 1.44),
(5862, 2032, 2.96),
(5862, 2033, 2.96);

-- Wizard's Hand
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15280, 7, 2, 19, 'Wizard\'s Hand', 28457, 2, 103018, 20603, 26, 53, 48, 56, 104, 6, 1800, 100, 0, 0, 2, 2, 5863, 55, 29);
UPDATE `item_enchantment_template` SET `chance`=2.345 WHERE  `entry`=5289 AND `ench` IN (2038,2039);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5289 AND `ench` IN (2033,2034,2035,2036,2037);
UPDATE `item_enchantment_template` SET `chance`=1.54 WHERE  `entry`=5289 AND `ench` IN (1962,1963);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5289 AND `ench` IN (1957,1958,1959,1960,1961);
UPDATE `item_enchantment_template` SET `chance`=1.855 WHERE  `entry`=5289 AND `ench` IN (1886,1887);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5289 AND `ench` IN (1881,1882,1883,1884,1885);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5289 AND `ench`=1843;
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`) VALUES (5289, 1848, 0.75);
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`) VALUES (5289, 1849, 0.75);
UPDATE `item_enchantment_template` SET `chance`=1.855 WHERE `entry`=5289 AND `ench` IN (1810,1811);
DELETE FROM `item_enchantment_template` WHERE `entry`=5289 AND `ench` IN (1805,1806,1807,1808,1809);
REPLACE INTO `item_enchantment_template` VALUES
 (5863, 152, 4.1),
 (5863, 153, 5.5),
 (5863, 154, 4.6),
 (5863, 237, 2.63),
 (5863, 247, 2.63),
 (5863, 248, 2.63),
 (5863, 249, 2.63),
 (5863, 508, 2.95),
 (5863, 509, 2.95),
 (5863, 510, 2.95),
 (5863, 511, 2.95),
 (5863, 763, 2.03),
 (5863, 764, 2.03),
 (5863, 765, 2.03),
 (5863, 766, 2.03),
 (5863, 848, 1.65),
 (5863, 849, 1.65),
 (5863, 850, 1.65),
 (5863, 851, 1.65),
 (5863, 933, 2.6),
 (5863, 934, 2.6),
 (5863, 935, 2.6),
 (5863, 936, 2.6),
 (5863, 1018, 2.4),
 (5863, 1019, 2.4),
 (5863, 1020, 2.4),
 (5863, 1021, 2.4),
 (5863, 1103, 3.05),
 (5863, 1104, 3.05),
 (5863, 1105, 3.05),
 (5863, 1106, 3.05),
 (5863, 1803, 1.855),
 (5863, 1804, 1.855),
 (5863, 1841, 0.75),
 (5863, 1842, 0.75),
 (5863, 1879, 1.855),
 (5863, 1880, 1.855),
 (5863, 1955, 1.54),
 (5863, 1956, 1.54),
 (5863, 2031, 2.345),
 (5863, 2032, 2.345);

-- Ivory Wand
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (15279, 7, 2, 19, 'Ivory Wand', 28569, 2, 91339, 18267, 26, 51, 46, 41, 77, 6, 1400, 100, 0, 0, 2, 2, 5864, 55, 29);
UPDATE `item_enchantment_template` SET `chance`=2.31 WHERE  `entry`=5280 AND `ench` IN (2037,2038);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5280 AND `ench` IN (2032,2033,2034,2035,2036);
UPDATE `item_enchantment_template` SET `chance`=1.4 WHERE  `entry`=5280 AND `ench` IN (1961,1962);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5280 AND `ench` IN (1956,1957,1958,1959,1960);
UPDATE `item_enchantment_template` SET `chance`=1.89 WHERE  `entry`=5280 AND `ench` IN (1885,1886);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5280 AND `ench` IN (1880,1881,1882,1883,1884);
UPDATE `item_enchantment_template` SET `chance`=0.735 WHERE `entry`=5280 AND `ench` IN (1847,1848);
DELETE FROM `item_enchantment_template` WHERE `entry`=5280 AND `ench` IN (1842,1843,1844,1845,1846);
UPDATE `item_enchantment_template` SET `chance`=1.89 WHERE `entry`=5280 AND `ench` IN (1809,1810);
DELETE FROM `item_enchantment_template` WHERE `entry`=5280 AND `ench` IN (1804,1805,1806,1807,1808);
REPLACE INTO `item_enchantment_template` VALUES
 (5864, 133, 2.1),
 (5864, 134, 2.75),
 (5864, 135, 2.35),
 (5864, 152, 2.1),
 (5864, 153, 2.75),
 (5864, 154, 2.35),
 (5864, 237, 2.63),
 (5864, 247, 2.63),
 (5864, 248, 2.63),
 (5864, 249, 2.63),
 (5864, 508, 2.9),
 (5864, 509, 2.9),
 (5864, 510, 2.9),
 (5864, 511, 2.9),
 (5864, 763, 1.95),
 (5864, 764, 1.95),
 (5864, 765, 1.95),
 (5864, 766, 1.95),
 (5864, 848, 1.67),
 (5864, 849, 1.67),
 (5864, 850, 1.67),
 (5864, 851, 1.67),
 (5864, 933, 2.72),
 (5864, 934, 2.72),
 (5864, 935, 2.72),
 (5864, 936, 2.72),
 (5864, 1018, 2.4),
 (5864, 1019, 2.4),
 (5864, 1020, 2.4),
 (5864, 1021, 2.4),
 (5864, 1103, 3),
 (5864, 1104, 3),
 (5864, 1105, 3),
 (5864, 1106, 3),
 (5864, 1802, 1.89),
 (5864, 1803, 1.89),
 (5864, 1840, 0.735),
 (5864, 1841, 0.735),
 (5864, 1878, 1.89),
 (5864, 1879, 1.89),
 (5864, 1954, 1.4),
 (5864, 1955, 1.4),
 (5864, 2030, 2.31),
 (5864, 2031, 2.31);
 
-- Umbral Wand
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (5216, 7, 2, 19, 'Umbral Wand', 20790, 2, 59109, 11821, 26, 45, 40, 37, 70, 5, 1500, 100, 0, 0, 2, 2, 5865, 55, 27);
UPDATE `item_enchantment_template` SET `chance`=2.1 WHERE  `entry`=5262 AND `ench` IN (2035,2036);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5262 AND `ench` IN (2032,2033,2034);
UPDATE `item_enchantment_template` SET `chance`=1.75 WHERE  `entry`=5262 AND `ench` IN (1959,1960);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5262 AND `ench` IN (1956,1957,1958);
UPDATE `item_enchantment_template` SET `chance`=1.95 WHERE  `entry`=5262 AND `ench` IN (1883,1884);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5262 AND `ench` IN (1880,1881,1882);
UPDATE `item_enchantment_template` SET `chance`=0.6 WHERE `entry`=5262 AND `ench` IN (1845,1846);
DELETE FROM `item_enchantment_template` WHERE `entry`=5262 AND `ench` IN (1842,1843,1844);
UPDATE `item_enchantment_template` SET `chance`=2.05 WHERE `entry`=5262 AND `ench` IN (1807,1808);
DELETE FROM `item_enchantment_template` WHERE `entry`=5262 AND `ench` IN (1804,1805,1806);
REPLACE INTO `item_enchantment_template` VALUES
 (5865, 133, 3.8),
 (5865, 134, 5.3),
 (5865, 135, 4.6),
 (5865, 234, 2.63),
 (5865, 235, 2.63),
 (5865, 236, 2.63),
 (5865, 248, 2.63),
 (5865, 505, 3.17),
 (5865, 506, 3.17),
 (5865, 507, 3.17),
 (5865, 508, 3.17),
 (5865, 760, 1.92),
 (5865, 761, 1.92),
 (5865, 762, 1.92),
 (5865, 763, 1.92),
 (5865, 845, 1.55),
 (5865, 846, 1.55),
 (5865, 847, 1.55),
 (5865, 848, 1.55),
 (5865, 930, 2.6),
 (5865, 931, 2.6),
 (5865, 932, 2.6),
 (5865, 933, 2.6),
 (5865, 1015, 2.25),
 (5865, 1016, 2.25),
 (5865, 1017, 2.25),
 (5865, 1018, 2.25),
 (5865, 1100, 3.22),
 (5865, 1101, 3.22),
 (5865, 1102, 3.22),
 (5865, 1103, 3.22),
 (5865, 1800, 2.05),
 (5865, 1801, 2.05),
 (5865, 1838, 0.6),
 (5865, 1839, 0.6),
 (5865, 1876, 1.95),
 (5865, 1877, 1.95),
 (5865, 1952, 1.75),
 (5865, 1953, 1.75),
 (5865, 2028, 2.1),
 (5865, 2029, 2.1);

-- Ember Wand
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `delay`, `RangedModRange`, `spellcooldown_1`, `spellcooldown_5`, `bonding`, `Material`, `RandomProperty`, `MaxDurability`, `DisenchantID`) 
VALUES (5215, 7, 2, 19, 'Ember Wand', 20815, 2, 43281, 8656, 26, 41, 36, 35, 66, 2, 1500, 100, 0, 0, 2, 2, 5866, 55, 27);
UPDATE `item_enchantment_template` SET `chance`=2.46 WHERE  `entry`=5253 AND `ench` IN (2035,2036);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5253 AND `ench` IN (2031,2032,2033,2034);
UPDATE `item_enchantment_template` SET `chance`=1.7 WHERE  `entry`=5253 AND `ench` IN (1958,1959);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5253 AND `ench` IN (1955,1956,1957);
DELETE FROM `item_enchantment_template` WHERE  `entry`=5253 AND `ench`=1879;
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`) VALUES (5253, 1883, 1.8);
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`) VALUES (5253, 1882, 1.8);
UPDATE `item_enchantment_template` SET `chance`=0.65 WHERE `entry`=5253 AND `ench` IN (1844,1845);
DELETE FROM `item_enchantment_template` WHERE `entry`=5253 AND `ench` IN (1841,1842,1843);
UPDATE `item_enchantment_template` SET `chance`=1.9 WHERE `entry`=5253 AND `ench` IN (1806,1807);
DELETE FROM `item_enchantment_template` WHERE `entry`=5253 AND `ench` IN (1803,1804,1805);
REPLACE INTO `item_enchantment_template` VALUES
 (5866, 112, 3.8),
 (5866, 113, 5.9),
 (5866, 114, 4.5),
 (5866, 234, 2.42),
 (5866, 235, 2.42),
 (5866, 236, 2.42),
 (5866, 248, 2.42),
 (5866, 505, 3.2),
 (5866, 506, 3.2),
 (5866, 507, 3.2),
 (5866, 508, 3.2),
 (5866, 760, 1.9),
 (5866, 761, 1.9),
 (5866, 762, 1.9),
 (5866, 763, 1.9),
 (5866, 845, 1.55),
 (5866, 846, 1.55),
 (5866, 847, 1.55),
 (5866, 848, 1.55),
 (5866, 930, 2.67),
 (5866, 931, 2.67),
 (5866, 932, 2.67),
 (5866, 933, 2.67),
 (5866, 1015, 2.3),
 (5866, 1016, 2.3),
 (5866, 1017, 2.3),
 (5866, 1018, 2.3),
 (5866, 1100, 3.13),
 (5866, 1101, 3.13),
 (5866, 1102, 3.13),
 (5866, 1103, 3.13),
 (5866, 1799, 1.9),
 (5866, 1800, 1.9),
 (5866, 1837, 0.65),
 (5866, 1838, 0.65),
 (5866, 1875, 1.8),
 (5866, 1876, 1.8),
 (5866, 1951, 1.7),
 (5866, 1952, 1.7),
 (5866, 2028, 2.46),
 (5866, 2029, 2.46);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
