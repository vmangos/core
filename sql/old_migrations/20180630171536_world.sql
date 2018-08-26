DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180630171536');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180630171536');
-- Add your query below.


ALTER TABLE `item_enchantment_template`
	ADD COLUMN `patch_min` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `chance`,
	ADD COLUMN `patch_max` TINYINT(3) UNSIGNED NOT NULL DEFAULT '10' AFTER `patch_min`;
	
-- Refactor Wands
delete from item_enchantment_template where entry in (5860,5861,5862,5863,5864,5865,5866);
delete from item_template where randomproperty in (5860,5861,5862,5863,5864,5865,5866);
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`, `patch_min`, `patch_max`) VALUES 
('5850', '1807', '2.6', '7', '10'),
('5850', '1845', '3.5', '7', '10'),
('5850', '1883', '4.7', '7', '10'),
('5850', '1959', '4.1', '7', '10'),
('5850', '2035', '5.6', '7', '10'),
('5850', '1814', '2.6', '0', '6'),
('5850', '1852', '3.5', '0', '6'),
('5850', '1890', '4.7', '0', '6'),
('5850', '1966', '4.1', '0', '6'),
('5850', '2042', '5.6', '0', '6'),
('5307', '1805', '1.64', '7', '10'),
('5307', '1806', '1.64', '7', '10'),
('5307', '1843', '1', '7', '10'),
('5307', '1844', '1', '7', '10'),
('5307', '1881', '2.16', '7', '10'),
('5307', '1882', '2.16', '7', '10'),
('5307', '1957', '1.76', '7', '10'),
('5307', '1958', '1.76', '7', '10'),
('5307', '2033', '3.44', '7', '10'),
('5307', '2034', '3.44', '7', '10'),
('5307', '1812', '1.64', '0', '6'),
('5307', '1813', '1.64', '0', '6'),
('5307', '1850', '1', '0', '6'),
('5307', '1851', '1', '0', '6'),
('5307', '1888', '2.16', '0', '6'),
('5307', '1889', '2.16', '0', '6'),
('5307', '1964', '1.76', '0', '6'),
('5307', '1965', '1.76', '0', '6'),
('5307', '2040', '3.44', '0', '6'),
('5307', '2041', '3.44', '0', '6'),
('5298', '1804', '1.72', '7', '10'),
('5298', '1805', '1.72', '7', '10'),
('5298', '1842', '1', '7', '10'),
('5298', '1843', '1', '7', '10'),
('5298', '1880', '2.16', '7', '10'),
('5298', '1881', '2.16', '7', '10'),
('5298', '1956', '1.44', '7', '10'),
('5298', '1957', '1.44', '7', '10'),
('5298', '2032', '2.96', '7', '10'),
('5298', '2033', '2.96', '7', '10'),
('5298', '1811', '1.72', '0', '6'),
('5298', '1812', '1.72', '0', '6'),
('5298', '1849', '1', '0', '6'),
('5298', '1850', '1', '0', '6'),
('5298', '1887', '2.16', '0', '6'),
('5298', '1888', '2.16', '0', '6'),
('5298', '1963', '1.44', '0', '6'),
('5298', '1964', '1.44', '0', '6'),
('5298', '2039', '2.96', '0', '6'),
('5298', '2040', '2.96', '0', '6'),
('5289', '1803', '1.855', '7', '10'),
('5289', '1804', '1.855', '7', '10'),
('5289', '1841', '0.75', '7', '10'),
('5289', '1842', '0.75', '7', '10'),
('5289', '1879', '1.855', '7', '10'),
('5289', '1880', '1.855', '7', '10'),
('5289', '1955', '1.54', '7', '10'),
('5289', '1956', '1.54', '7', '10'),
('5289', '2031', '2.345', '7', '10'),
('5289', '2032', '2.345', '7', '10'),
('5289', '1810', '1.855', '0', '6'),
('5289', '1811', '1.855', '0', '6'),
('5289', '1848', '0.75', '0', '6'),
('5289', '1849', '0.75', '0', '6'),
('5289', '1886', '1.855', '0', '6'),
('5289', '1887', '1.855', '0', '6'),
('5289', '1962', '1.54', '0', '6'),
('5289', '1963', '1.54', '0', '6'),
('5289', '2038', '2.345', '0', '6'),
('5289', '2039', '2.345', '0', '6'),
('5280', '1802', '1.89', '7', '10'),
('5280', '1803', '1.89', '7', '10'),
('5280', '1840', '0.735', '7', '10'),
('5280', '1841', '0.735', '7', '10'),
('5280', '1878', '1.89', '7', '10'),
('5280', '1879', '1.89', '7', '10'),
('5280', '1954', '1.4', '7', '10'),
('5280', '1955', '1.4', '7', '10'),
('5280', '2030', '2.31', '7', '10'),
('5280', '2031', '2.31', '7', '10'),
('5280', '1809', '1.89', '0', '6'),
('5280', '1810', '1.89', '0', '6'),
('5280', '1847', '0.735', '0', '6'),
('5280', '1848', '0.735', '0', '6'),
('5280', '1885', '1.89', '0', '6'),
('5280', '1886', '1.89', '0', '6'),
('5280', '1961', '1.4', '0', '6'),
('5280', '1962', '1.4', '0', '6'),
('5280', '2037', '2.31', '0', '6'),
('5280', '2038', '2.31', '0', '6'),
('5262', '1800', '2.05', '7', '10'),
('5262', '1801', '2.05', '7', '10'),
('5262', '1838', '0.6', '7', '10'),
('5262', '1839', '0.6', '7', '10'),
('5262', '1876', '1.95', '7', '10'),
('5262', '1877', '1.95', '7', '10'),
('5262', '1952', '1.75', '7', '10'),
('5262', '1953', '1.75', '7', '10'),
('5262', '2028', '2.1', '7', '10'),
('5262', '2029', '2.1', '7', '10'),
('5262', '1807', '2.05', '0', '6'),
('5262', '1808', '2.05', '0', '6'),
('5262', '1845', '0.6', '0', '6'),
('5262', '1846', '0.6', '0', '6'),
('5262', '1883', '1.95', '0', '6'),
('5262', '1884', '1.95', '0', '6'),
('5262', '1959', '1.75', '0', '6'),
('5262', '1960', '1.75', '0', '6'),
('5262', '2035', '2.1', '0', '6'),
('5262', '2036', '2.1', '0', '6'),
('5253', '1799', '1.9', '7', '10'),
('5253', '1800', '1.9', '7', '10'),
('5253', '1837', '0.65', '7', '10'),
('5253', '1838', '0.65', '7', '10'),
('5253', '1875', '1.8', '7', '10'),
('5253', '1876', '1.8', '7', '10'),
('5253', '1951', '1.7', '7', '10'),
('5253', '1952', '1.7', '7', '10'),
('5253', '2028', '2.46', '7', '10'),
('5253', '2029', '2.46', '7', '10'),
('5253', '1806', '1.9', '0', '6'),
('5253', '1807', '1.9', '0', '6'),
('5253', '1844', '0.65', '0', '6'),
('5253', '1845', '0.65', '0', '6'),
('5253', '1882', '1.8', '0', '6'),
('5253', '1883', '1.8', '0', '6'),
('5253', '1958', '1.7', '0', '6'),
('5253', '1959', '1.7', '0', '6'),
('5253', '2035', '2.46', '0', '6'),
('5253', '2036', '2.46', '0', '6');

-- Holy damage
REPLACE INTO `item_enchantment_template` (`entry`, `ench`, `chance`, `patch_min`, `patch_max`) VALUES 
('454', '1913', '0.1', '0', '0'),
('455', '1913', '0.1', '0', '0'),
('470', '1939', '0.1', '0', '0'),
('472', '1941', '0.1', '0', '0'),
('480', '1922', '0.1', '0', '0'),
('488', '1933', '0.1', '0', '0'),
('490', '1938', '0.1', '0', '0'),
('491', '1939', '0.1', '0', '0'),
('492', '1941', '0.1', '0', '0'),
('497', '1916', '0.1', '0', '0'),
('531', '1935', '0.1', '0', '0'),
('534', '1940', '0.2', '0', '0'),
('539', '1913', '0.03', '0', '0'),
('539', '1914', '0.03', '0', '0'),
('539', '1915', '0.03', '0', '0'),
('542', '1920', '0.1', '0', '0'),
('545', '1924', '0.1', '0', '0'),
('547', '1928', '0.1', '0', '0'),
('560', '1917', '0.1', '0', '0'),
('575', '1937', '0.1', '0', '0'),
('576', '1940', '0.1', '0', '0'),
('581', '1913', '0.1', '0', '0'),
('619', '1941', '0.1', '0', '0'),
('631', '1927', '0.1', '0', '0'),
('633', '1930', '0.1', '0', '0'),
('639', '1941', '0.1', '0', '0'),
('660', '1940', '0.1', '0', '0'),
('714', '1922', '0.1', '0', '0'),
('716', '1924', '0.1', '0', '0'),
('716', '1925', '0.1', '0', '0'),
('721', '1931', '0.1', '0', '0'),
('722', '1932', '0.1', '0', '0'),
('722', '1933', '0.1', '0', '0'),
('744', '1933', '0.1', '0', '0'),
('785', '1932', '0.1', '0', '0'),
('791', '1913', '0.1', '0', '0'),
('820', '1913', '0.1', '0', '0'),
('821', '1913', '0.1', '0', '0'),
('877', '1918', '0.1', '0', '0'),
('879', '1919', '0.1', '0', '0'),
('881', '1921', '0.1', '0', '0'),
('884', '1924', '0.1', '0', '0'),
('920', '1918', '0.1', '0', '0'),
('952', '1931', '0.1', '0', '0'),
('959', '1913', '3.1', '0', '0'),
('959', '1914', '3.1', '0', '0'),
('964', '1913', '0.1', '0', '0'),
('964', '1918', '0.1', '0', '0'),
('969', '1922', '0.1', '0', '0'),
('1006', '1913', '0.1', '0', '0'),
('1043', '1913', '2.95', '0', '0'),
('1043', '1914', '2.95', '0', '0'),
('1045', '1915', '0.1', '0', '0'),
('1048', '1913', '0.1', '0', '0'),
('1051', '1920', '0.1', '0', '0'),
('1073', '1913', '0.1', '0', '0'),
('1093', '1913', '0.1', '0', '0'),
('1142', '1932', '0.05', '0', '0'),
('1142', '1933', '0.05', '0', '0'),
('1163', '1933', '0.1', '0', '0'),
('1185', '1934', '0.1', '0', '0'),
('2056', '1923', '0.1', '0', '0'),
('2068', '1925', '0.1', '0', '0'),
('2084', '1927', '0.1', '0', '0'),
('3272', '1928', '0.1', '0', '0'),
('3462', '1928', '0.05', '0', '0'),
('3462', '1929', '0.05', '0', '0'),
('5168', '1913', '0.1', '0', '0'),
('5169', '1913', '0.1', '0', '0'),
('5169', '1914', '0.1', '0', '0'),
('5170', '1914', '0.1', '0', '0'),
('5171', '1913', '2.88', '0', '0'),
('5171', '1914', '1.85', '0', '0'),
('5173', '1913', '0.1', '0', '0'),
('5174', '1914', '0.1', '0', '0'),
('5176', '1914', '0.1', '0', '0'),
('5188', '1915', '0.1', '0', '0'),
('5196', '1916', '0.1', '0', '0'),
('5216', '1918', '0.1', '0', '0'),
('5221', '1918', '0.01', '0', '0'),
('5221', '1919', '0.01', '0', '0'),
('5221', '1920', '0.01', '0', '0'),
('5221', '1921', '0.01', '0', '0'),
('5221', '1922', '0.01', '0', '0'),
('5221', '1923', '0.01', '0', '0'),
('5221', '1924', '0.01', '0', '0'),
('5224', '1918', '0.1', '0', '0'),
('5224', '1919', '0.1', '0', '0'),
('5232', '1918', '0.1', '0', '0'),
('5236', '1926', '0.1', '0', '0'),
('5238', '1927', '0.05', '0', '0'),
('5238', '1928', '0.05', '0', '0'),
('5240', '1919', '0.1', '0', '0'),
('5241', '1918', '0.05', '0', '0'),
('5241', '1919', '0.05', '0', '0'),
('5242', '1919', '0.1', '0', '0'),
('5242', '1920', '0.1', '0', '0'),
('5252', '1921', '0.1', '0', '0'),
('5254', '1930', '0.05', '0', '0'),
('5254', '1931', '0.05', '0', '0'),
('5257', '1930', '0.05', '0', '0'),
('5257', '1931', '0.05', '0', '0'),
('5266', '1930', '0.03', '0', '0'),
('5266', '1931', '0.03', '0', '0'),
('5266', '1932', '0.03', '0', '0'),
('5269', '1921', '0.1', '0', '0'),
('5274', '1932', '0.1', '0', '0'),
('5301', '1913', '0.1', '0', '0'),
('5312', '1924', '0.1', '0', '0'),
('6272', '1913', '1.9', '0', '0'),
('6272', '1914', '1.9', '0', '0');

-- Pre 1.4 decrease
ALTER TABLE `item_enchantment_template`
	DROP PRIMARY KEY,
	ADD PRIMARY KEY (`entry`, `ench`, `patch_min`, `patch_max`);
	
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 2026 and ench < 2064 and patch_min = 0;
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 1798 and ench < 1836 and patch_min = 0;
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 1874 and ench < 1912 and patch_min = 0;
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 1950 and ench < 1988 and patch_min = 0;
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 1988 and ench < 2026 and patch_min = 0;
UPDATE `item_enchantment_template` SET `patch_min`='2' WHERE ench > 1836 and ench < 1874 and patch_min = 0;


-- Healing
replace into item_enchantment_template select entry, 2027, SUM(chance), 0, 1 from item_enchantment_template where ench in (2027,2028,2029) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2028, SUM(chance), 0, 1 from item_enchantment_template where ench in (2030,2031,2032) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2029, SUM(chance), 0, 1 from item_enchantment_template where ench in (2033) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2030, SUM(chance), 0, 1 from item_enchantment_template where ench in (2034,2035,2036) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2031, SUM(chance), 0, 1 from item_enchantment_template where ench in (2037,2038) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2032, SUM(chance), 0, 1 from item_enchantment_template where ench in (2039) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2033, SUM(chance), 0, 1 from item_enchantment_template where ench in (2040,2041) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2034, SUM(chance), 0, 1 from item_enchantment_template where ench in (2042,2043,2044) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2035, SUM(chance), 0, 1 from item_enchantment_template where ench in (2045) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2036, SUM(chance), 0, 1 from item_enchantment_template where ench in (2046) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2037, SUM(chance), 0, 1 from item_enchantment_template where ench in (2047) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2038, SUM(chance), 0, 1 from item_enchantment_template where ench in (2048) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2039, SUM(chance), 0, 1 from item_enchantment_template where ench in (2049,2050) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2040, SUM(chance), 0, 1 from item_enchantment_template where ench in (2051) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2041, SUM(chance), 0, 1 from item_enchantment_template where ench in (2052) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2042, SUM(chance), 0, 1 from item_enchantment_template where ench in (2053) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2043, SUM(chance), 0, 1 from item_enchantment_template where ench in (2054) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2044, SUM(chance), 0, 1 from item_enchantment_template where ench in (2055) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2045, SUM(chance), 0, 1 from item_enchantment_template where ench in (2056) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2046, SUM(chance), 0, 1 from item_enchantment_template where ench in (2057) and patch_min = 2 group by entry;


-- Arcane
replace into item_enchantment_template select entry, 1799, SUM(chance), 0, 1 from item_enchantment_template where ench in (1799,1800) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1800, SUM(chance), 0, 1 from item_enchantment_template where ench in (1801) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1801, SUM(chance), 0, 1 from item_enchantment_template where ench in (1802,1803) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1802, SUM(chance), 0, 1 from item_enchantment_template where ench in (1804) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1803, SUM(chance), 0, 1 from item_enchantment_template where ench in (1805) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1804, SUM(chance), 0, 1 from item_enchantment_template where ench in (1806,1807) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1805, SUM(chance), 0, 1 from item_enchantment_template where ench in (1808) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1806, SUM(chance), 0, 1 from item_enchantment_template where ench in (1809,1810) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1807, SUM(chance), 0, 1 from item_enchantment_template where ench in (1811) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1808, SUM(chance), 0, 1 from item_enchantment_template where ench in (1812,1813) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1809, SUM(chance), 0, 1 from item_enchantment_template where ench in (1814) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1810, SUM(chance), 0, 1 from item_enchantment_template where ench in (1815) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1811, SUM(chance), 0, 1 from item_enchantment_template where ench in (1816) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1812, SUM(chance), 0, 1 from item_enchantment_template where ench in (1817) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1814, SUM(chance), 0, 1 from item_enchantment_template where ench in (1818) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1815, SUM(chance), 0, 1 from item_enchantment_template where ench in (1819) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1816, SUM(chance), 0, 1 from item_enchantment_template where ench in (1820) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1817, SUM(chance), 0, 1 from item_enchantment_template where ench in (1821) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1819, SUM(chance), 0, 1 from item_enchantment_template where ench in (1822) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1820, SUM(chance), 0, 1 from item_enchantment_template where ench in (1823) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1821, SUM(chance), 0, 1 from item_enchantment_template where ench in (1824) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1823, SUM(chance), 0, 1 from item_enchantment_template where ench in (1825) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1824, SUM(chance), 0, 1 from item_enchantment_template where ench in (1826) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1825, SUM(chance), 0, 1 from item_enchantment_template where ench in (1827) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1826, SUM(chance), 0, 1 from item_enchantment_template where ench in (1828) and patch_min = 2 group by entry;


-- Fire
replace into item_enchantment_template select entry, 1875, SUM(chance), 0, 1 from item_enchantment_template where ench in (1875,1876) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1876, SUM(chance), 0, 1 from item_enchantment_template where ench in (1877) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1877, SUM(chance), 0, 1 from item_enchantment_template where ench in (1878,1879) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1878, SUM(chance), 0, 1 from item_enchantment_template where ench in (1880) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1879, SUM(chance), 0, 1 from item_enchantment_template where ench in (1881) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1880, SUM(chance), 0, 1 from item_enchantment_template where ench in (1882,1883) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1881, SUM(chance), 0, 1 from item_enchantment_template where ench in (1884) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1882, SUM(chance), 0, 1 from item_enchantment_template where ench in (1885,1886) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1883, SUM(chance), 0, 1 from item_enchantment_template where ench in (1887) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1884, SUM(chance), 0, 1 from item_enchantment_template where ench in (1888,1889) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1885, SUM(chance), 0, 1 from item_enchantment_template where ench in (1890) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1886, SUM(chance), 0, 1 from item_enchantment_template where ench in (1891) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1887, SUM(chance), 0, 1 from item_enchantment_template where ench in (1892) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1888, SUM(chance), 0, 1 from item_enchantment_template where ench in (1893) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1890, SUM(chance), 0, 1 from item_enchantment_template where ench in (1894) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1891, SUM(chance), 0, 1 from item_enchantment_template where ench in (1895) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1892, SUM(chance), 0, 1 from item_enchantment_template where ench in (1896) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1893, SUM(chance), 0, 1 from item_enchantment_template where ench in (1897) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1895, SUM(chance), 0, 1 from item_enchantment_template where ench in (1898) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1896, SUM(chance), 0, 1 from item_enchantment_template where ench in (1899) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1897, SUM(chance), 0, 1 from item_enchantment_template where ench in (1900) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1899, SUM(chance), 0, 1 from item_enchantment_template where ench in (1901) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1900, SUM(chance), 0, 1 from item_enchantment_template where ench in (1902) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1901, SUM(chance), 0, 1 from item_enchantment_template where ench in (1903) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1902, SUM(chance), 0, 1 from item_enchantment_template where ench in (1904) and patch_min = 2 group by entry;


-- Frost
replace into item_enchantment_template select entry, 1951, SUM(chance), 0, 1 from item_enchantment_template where ench in (1951,1952) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1952, SUM(chance), 0, 1 from item_enchantment_template where ench in (1953) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1953, SUM(chance), 0, 1 from item_enchantment_template where ench in (1954,1955) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1954, SUM(chance), 0, 1 from item_enchantment_template where ench in (1956) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1955, SUM(chance), 0, 1 from item_enchantment_template where ench in (1957) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1956, SUM(chance), 0, 1 from item_enchantment_template where ench in (1958,1959) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1957, SUM(chance), 0, 1 from item_enchantment_template where ench in (1960) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1958, SUM(chance), 0, 1 from item_enchantment_template where ench in (1961,1962) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1959, SUM(chance), 0, 1 from item_enchantment_template where ench in (1963) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1960, SUM(chance), 0, 1 from item_enchantment_template where ench in (1964,1965) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1961, SUM(chance), 0, 1 from item_enchantment_template where ench in (1966) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1962, SUM(chance), 0, 1 from item_enchantment_template where ench in (1967) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1963, SUM(chance), 0, 1 from item_enchantment_template where ench in (1968) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1964, SUM(chance), 0, 1 from item_enchantment_template where ench in (1969) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1966, SUM(chance), 0, 1 from item_enchantment_template where ench in (1970) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1967, SUM(chance), 0, 1 from item_enchantment_template where ench in (1971) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1968, SUM(chance), 0, 1 from item_enchantment_template where ench in (1972) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1969, SUM(chance), 0, 1 from item_enchantment_template where ench in (1973) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1971, SUM(chance), 0, 1 from item_enchantment_template where ench in (1974) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1972, SUM(chance), 0, 1 from item_enchantment_template where ench in (1975) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1973, SUM(chance), 0, 1 from item_enchantment_template where ench in (1976) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1975, SUM(chance), 0, 1 from item_enchantment_template where ench in (1977) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1976, SUM(chance), 0, 1 from item_enchantment_template where ench in (1978) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1977, SUM(chance), 0, 1 from item_enchantment_template where ench in (1979) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1978, SUM(chance), 0, 1 from item_enchantment_template where ench in (1980) and patch_min = 2 group by entry;


-- Nature
replace into item_enchantment_template select entry, 1989, SUM(chance), 0, 1 from item_enchantment_template where ench in (1989,1990) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1990, SUM(chance), 0, 1 from item_enchantment_template where ench in (1991) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1991, SUM(chance), 0, 1 from item_enchantment_template where ench in (1992,1993) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1992, SUM(chance), 0, 1 from item_enchantment_template where ench in (1994) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1993, SUM(chance), 0, 1 from item_enchantment_template where ench in (1995) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1994, SUM(chance), 0, 1 from item_enchantment_template where ench in (1996,1997) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1995, SUM(chance), 0, 1 from item_enchantment_template where ench in (1998) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1996, SUM(chance), 0, 1 from item_enchantment_template where ench in (1999,2000) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1997, SUM(chance), 0, 1 from item_enchantment_template where ench in (2001) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1998, SUM(chance), 0, 1 from item_enchantment_template where ench in (2002,2003) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1999, SUM(chance), 0, 1 from item_enchantment_template where ench in (2004) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2000, SUM(chance), 0, 1 from item_enchantment_template where ench in (2005) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2001, SUM(chance), 0, 1 from item_enchantment_template where ench in (2006) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2002, SUM(chance), 0, 1 from item_enchantment_template where ench in (2007) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2004, SUM(chance), 0, 1 from item_enchantment_template where ench in (2008) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2005, SUM(chance), 0, 1 from item_enchantment_template where ench in (2009) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2006, SUM(chance), 0, 1 from item_enchantment_template where ench in (2010) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2007, SUM(chance), 0, 1 from item_enchantment_template where ench in (2011) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2009, SUM(chance), 0, 1 from item_enchantment_template where ench in (2012) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2010, SUM(chance), 0, 1 from item_enchantment_template where ench in (2013) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2011, SUM(chance), 0, 1 from item_enchantment_template where ench in (2014) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2013, SUM(chance), 0, 1 from item_enchantment_template where ench in (2015) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2014, SUM(chance), 0, 1 from item_enchantment_template where ench in (2016) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2015, SUM(chance), 0, 1 from item_enchantment_template where ench in (2017) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 2016, SUM(chance), 0, 1 from item_enchantment_template where ench in (2018) and patch_min = 2 group by entry;


-- Shadow
replace into item_enchantment_template select entry, 1837, SUM(chance), 0, 1 from item_enchantment_template where ench in (1837,1838) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1838, SUM(chance), 0, 1 from item_enchantment_template where ench in (1839) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1839, SUM(chance), 0, 1 from item_enchantment_template where ench in (1840,1841) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1840, SUM(chance), 0, 1 from item_enchantment_template where ench in (1842) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1841, SUM(chance), 0, 1 from item_enchantment_template where ench in (1843) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1842, SUM(chance), 0, 1 from item_enchantment_template where ench in (1844,1845) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1843, SUM(chance), 0, 1 from item_enchantment_template where ench in (1846) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1844, SUM(chance), 0, 1 from item_enchantment_template where ench in (1847,1848) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1845, SUM(chance), 0, 1 from item_enchantment_template where ench in (1849) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1846, SUM(chance), 0, 1 from item_enchantment_template where ench in (1850,1851) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1847, SUM(chance), 0, 1 from item_enchantment_template where ench in (1852) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1848, SUM(chance), 0, 1 from item_enchantment_template where ench in (1853) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1849, SUM(chance), 0, 1 from item_enchantment_template where ench in (1854) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1850, SUM(chance), 0, 1 from item_enchantment_template where ench in (1855) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1852, SUM(chance), 0, 1 from item_enchantment_template where ench in (1856) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1853, SUM(chance), 0, 1 from item_enchantment_template where ench in (1857) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1854, SUM(chance), 0, 1 from item_enchantment_template where ench in (1858) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1855, SUM(chance), 0, 1 from item_enchantment_template where ench in (1859) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1857, SUM(chance), 0, 1 from item_enchantment_template where ench in (1860) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1858, SUM(chance), 0, 1 from item_enchantment_template where ench in (1861) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1859, SUM(chance), 0, 1 from item_enchantment_template where ench in (1862) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1861, SUM(chance), 0, 1 from item_enchantment_template where ench in (1863) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1862, SUM(chance), 0, 1 from item_enchantment_template where ench in (1864) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1863, SUM(chance), 0, 1 from item_enchantment_template where ench in (1865) and patch_min = 2 group by entry;
replace into item_enchantment_template select entry, 1864, SUM(chance), 0, 1 from item_enchantment_template where ench in (1866) and patch_min = 2 group by entry;




-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
