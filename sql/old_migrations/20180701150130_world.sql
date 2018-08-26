DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180701150130');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180701150130');
-- Add your query below.


-- Heavy Gnoll War Club -- miss -10 agi -- stat_type2 = 3 but stat_value2 = 0
-- http://web.archive.org/web/20050117174346/http://wow.allakhazam.com:80/db/item.html?witem=1218
-- https://web.archive.org/web/20070524094210/http://www.thottbot.com:80/i1218
UPDATE `item_template` SET `stat_value2`=-10 WHERE `entry`=1218;

-- Ogremage Staff -- miss -5 intel -- stat_type1 = 5 but stat_value1 = 0
-- http://web.archive.org/web/20060114042451/http://wow.allakhazam.com:80/db/item.html?witem=2226
-- https://web.archive.org/web/20071105135648/http://thottbot.com:80/i2226
UPDATE `item_template` SET `stat_value1`=-5 WHERE `entry`=2226;

-- Cowl of Necromancy -- miss -5 stam -- stat_type2 = 7 but stat_value2 = 0
-- http://web.archive.org/web/20050312121150/http://wow.allakhazam.com:80/db/item.html?witem=2621
-- https://web.archive.org/web/20070419142352/http://www.thottbot.com:80/i2621
UPDATE `item_template` SET `stat_value2`=-5 WHERE `entry`=2621;

-- Ring of Scorn -- miss -3 spirit -- stat_type1 = 6 but stat_value1 = 0
-- http://web.archive.org/web/20050507081956/http://wow.allakhazam.com:80/db/item.html?witem=3235
-- https://web.archive.org/web/20070829234330/http://www.thottbot.com:80/i3235
UPDATE `item_template` SET `stat_value1`=-3 WHERE `entry`=3235;

-- Lapidis Tankard of Tidesippe -- miss -15 agi -- stat_type1 = 3 but stat_value1 = 0
-- https://web.archive.org/web/20060416005935/http://wow.allakhazam.com:80/db/item.html?witem=4696
-- https://web.archive.org/web/20070510025734/http://www.thottbot.com:80/i4696
UPDATE `item_template` SET `stat_value1`=-15 WHERE `entry`=4696;

-- Doomsayer's Robe -- miss -10 stam -- stat_type2 = 7 but stat_value2 = 0
-- https://web.archive.org/web/20051115065608/http://wow.allakhazam.com:80/db/item.html?witem=4746
-- https://web.archive.org/web/20070509155606/http://www.thottbot.com:80/i4746
UPDATE `item_template` SET `stat_value2`=-10 WHERE `entry`=4746;

-- Tear of Grief -- miss -3 spirit -- stat_type2 = 6 but stat_value2 = 0
-- https://web.archive.org/web/20060223130111/http://wow.allakhazam.com:80/db/item.html?witem=5611
-- https://web.archive.org/web/20070518070552/http://www.thottbot.com:80/i5611
UPDATE `item_template` SET `stat_value2`=-3 WHERE `entry`=5611;

-- Mourning Shawl -- miss -3 spirit -- stat_type1 = 6 but stat_value1 = 0
-- https://web.archive.org/web/20050816204348/http://wow.allakhazam.com:80/db/item.html?witem=6751
-- https://web.archive.org/web/20070704124113/http://www.thottbot.com:80/i6751
UPDATE `item_template` SET `stat_value1`=-3 WHERE `entry`=6751;

-- Gnomish Water Sinking Device -- miss -5 agi -- stat_type1 = 3 but stat_value1 = 0
-- https://web.archive.org/web/20050219233859/http://wow.allakhazam.com:80/db/item.html?witem=9646
-- https://web.archive.org/web/20070708095121/http://www.thottbot.com:80/i9646
UPDATE `item_template` SET `stat_value1`=-5 WHERE `entry`=9646;

-- Corruption -- miss -40 spirit -- stat_type3 = 6 but stat_value3 = 0
-- https://web.archive.org/web/20060527094231/http://wow.allakhazam.com:80/db/item.html?witem=12782
-- https://web.archive.org/web/20070312193042/http://www.thottbot.com:80/i12782
UPDATE `item_template` SET `stat_value3`=-40 WHERE `entry`=12782;

-- Crown of Tyranny -- miss -10 spirit -- stat_type2 = 6 but stat_value2 = 0
-- https://web.archive.org/web/20060526183537/http://wow.allakhazam.com:80/db/item.html?witem=13359
-- https://web.archive.org/web/20070312193227/http://www.thottbot.com:80/i13359
UPDATE `item_template` SET `stat_value2`=-10 WHERE `entry`=13359;

-- Kreeg's Mug -- miss -10 intel -- stat_type3 = 5 but stat_value3 = 0
-- https://web.archive.org/web/20070103000152/http://wow.allakhazam.com:80/db/item.html?witem=18425
-- https://web.archive.org/web/20071123141618/http://thottbot.com:80/i18425
UPDATE `item_template` SET `stat_value3`=-10 WHERE `entry`=18425;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
