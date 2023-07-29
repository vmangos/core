DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230709080758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230709080758');
-- Add your query below.


-- Create new pool to hold Gahz'ridian spawns in Tanaris.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(14, 53, 'Tanaris - Gahz\'ridian', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(140971, 14, 'Tanaris - Gahz\'ridian');

-- Create new pool to hold Calcified Elven Gem spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21551, 7, 'Arathi Highlands - Calcified Elven Gems', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(2712, 21551, 'Arathi Highlands - Calcified Elven Gems');
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 2712;
DELETE FROM `gameobject` WHERE `guid` = 55630;

UPDATE `pool_template` SET `max_limit` = 20 WHERE `entry` = 1597;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 375;

UPDATE `pool_template` SET `max_limit` = 18 WHERE `entry` = 140;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 161557;

-- Create new pool to hold Carved Stone Urn spawns in Uldaman.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(63, 19, 'Badlands - Carved Stone Urn', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(2743, 63, 'Badlands - Carved Stone Urn');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 2743;

-- Create new pool to hold Well Stone spawns in Mulgore.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(64, 14, 'Mulgore - Well Stone', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(2910, 64, 'Mulgore - Well Stone');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 2910;

-- Create new pool to hold Taillasher Eggs spawns in Durotar.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21552, 13, 'Durotar - Taillasher Eggs', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(3240, 21552, 'Durotar - Taillasher Eggs');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 3240;

-- Create new pool to hold Stolen Supply Sack spawns in Durotar.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(95, 8, 'Durotar - Stolen Supply Sacks', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(3290, 95, 'Durotar - Stolen Supply Sacks');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 3240;

-- Create new pool to hold Tear of Theradras spawns in Desolace.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(96, 7, 'Desolace - Tear of Theradras', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(22246, 96, 'Desolace - Tear of Theradras');

UPDATE `gameobject` SET `spawntimesecsmax` = 60, `spawntimesecsmin` = 60 WHERE `id` IN (11713, 11714);
UPDATE `gameobject` SET `spawntimesecsmax` = 60, `spawntimesecsmin` = 60 WHERE `id` = 2867;
UPDATE `gameobject` SET `spawntimesecsmax` = 60, `spawntimesecsmin` = 60 WHERE `id` = 179908;
UPDATE `gameobject` SET `spawntimesecsmax` = 60, `spawntimesecsmin` = 60 WHERE `id` = 175928;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 28604;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 1723;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 2560;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 152094;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 2724;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` IN (13360, 12654, 13872);
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 143980;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 37099;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 1673;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 4608;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 2883;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 175566;
UPDATE `gameobject` SET `spawntimesecsmax` = 180, `spawntimesecsmin` = 180 WHERE `id` = 176753;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (30854, 30855, 30856);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (13359, 13873);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (176750, 176751, 176752);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (180501, 180436, 180583);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (126049, 128293, 128196);
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (164778, 164658, 164659, 164779, 164780, 164660, 164661, 164781);

-- Create new pool to hold Kim'jael's Equipment spawns in Azshara.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(97, 8, 'Azshara - Kim\'jael\'s Equipment', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(153123, 97, 'Azshara - Kim\'jael\'s Equipment');

-- Create new pool to hold Un'Goro Dirt Pile spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(98, 45, 'UnGoro Crater - UnGoro Dirt Pile', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(157936, 98, 'UnGoro Crater - UnGoro Dirt Pile');

-- Create new pool to hold Dinosaur Bone spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(99, 9, 'UnGoro Crater - Dinosaur Bone', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(161527, 99, 'UnGoro Crater - Dinosaur Bone');

-- Create new pool to hold Equipment Boxes spawns in Tirisfal Glades.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(100, 9, 'Tirisfal Glades - Equipment Boxes', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(164662, 100, 'Tirisfal Glades - Equipment Boxes');

-- Create new pool to hold Tool Bucket spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(101, 10, 'Barrens - Tool Bucket', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(161752, 101, 'Barrens - Tool Bucket');

-- Create new pool to hold Bloodpetal Sprout spawns in Un'Goro Crater.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(102, 37, 'UnGoro Crater - Bloodpetal Sprout', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(164958, 102, 'UnGoro Crater - Bloodpetal Sprout');

-- Create new pool to hold Frostmaul Shards spawns in Winterspring.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(103, 20, 'Winterspring - Frostmaul Shards', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(175324, 103, 'Winterspring - Frostmaul Shards');

-- Create new pool to hold Highperch Wyvern Egg spawns in Thousand Needles.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(145, 10, 'Thousand Needles - Highperch Wyvern Egg', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(175384, 145, 'Thousand Needles - Highperch Wyvern Egg');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 175384;

-- Create new pool to hold Crossroads' Supply Crates spawns in The Barrens.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(21553, 6, 'Barrens - Crossroads Supply Crates', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(175708, 21553, 'Barrens - Crossroads Supply Crates');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 175708;

-- Create new pool to hold Keepsake of Remembrance spawns in Arathi Highlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(147, 4, 'Arathi Highlands - Keepsake of Remembrance', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(176630, 147, 'Arathi Highlands - Keepsake of Remembrance');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 176630;

-- Create new pool to hold Bundle of Wood spawns in Elwynn Forest.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(148, 13, 'Elwynn Forest - Bundle of Wood', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(176793, 148, 'Elwynn Forest - Bundle of Wood');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 176793;

-- Create new pool to hold Gaea Seed spawns in Stonetalon Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(149, 6, 'Stonetalon Mountains - Gaea Seed', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(177926, 149, 'Stonetalon Mountains - Gaea Seed');

-- Create new pool to hold Troll Chest spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(153, 10, 'Ashenvale - Troll Chest', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(178144, 153, 'Ashenvale - Troll Chest');

-- Create new pool to hold Sapphire of Aku'Mai spawns in Blackfathom Deeps.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(154, 6, 'Blackfathom Deeps - Sapphire of Aku\'Mais (178184)', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(178184, 154, 'Blackfathom Deeps - Sapphire of Aku\'Mais (178184)');

UPDATE `pool_gameobject_template` SET `description`='Blackfathom Deeps - Sapphire of Aku\'Mai (178185)' WHERE  `id`=178185;
UPDATE `pool_template` SET `description`='Blackfathom Deeps - Sapphire of Aku\'Mai (178185)' WHERE  `entry`=18867;

-- Create new pool to hold Sapphire of Aku'Mai spawns in Blackfathom Deeps.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(157, 5, 'Blackfathom Deeps - Sapphire of Aku\'Mais (178186)', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(178186, 157, 'Blackfathom Deeps - Sapphire of Aku\'Mais (178186)');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` IN (178184, 178185, 178186);

-- Create new pool to hold Vessel of Tainted Blood spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(155, 39, 'Hinterlands - Vessel of Tainted Blood', 3, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(179922, 155, 'Hinterlands - Vessel of Tainted Blood');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 179922;

-- Create new pool to hold Slagtree's Lost Tools spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(158, 2, 'Hinterlands - Slagtree\'s Lost Tools', 3, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(179908, 158, 'Hinterlands - Slagtree\'s Lost Tools');

-- Create new pool to hold Basket of Bloodkelp spawns in Dustwallow Marsh.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(159, 3, 'Dustwallow Marsh - Basket of Bloodkelp', 8, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(181053, 159, 'Dustwallow Marsh - Basket of Bloodkelp');
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 181053;

UPDATE `pool_template` SET `max_limit` = 43 WHERE `entry`=1613;

-- Create new pool to hold Volcanic Ash spawns in Burning Steppes.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(160, 36, 'Burning Steppes - Volcanic Ash', 8, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(181098, 160, 'Burning Steppes - Volcanic Ash');

-- Create new pool to hold Thaurissan Relic spawns in Burning Steppes.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(161, 16, 'Burning Steppes - Thaurissan Relic', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(153556, 161, 'Burning Steppes - Thaurissan Relic');

-- Create new pool to hold Plant Bundle spawns in Ashenvale.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(250, 8, 'Ashenvale - Plant Bundle', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(17282, 250, 'Ashenvale - Plant Bundle');

UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `id` = 3685;

UPDATE `pool_template` SET `max_limit` = 32 WHERE `entry`=1630;
UPDATE `gameobject` SET `spawntimesecsmin` = 180, `spawntimesecsmax` = 180 WHERE `guid`=127;
DELETE FROM `pool_gameobject` WHERE  `guid` IN ( 220813, 220814, 220815, 220816, 220817, 220818, 220819, 220820);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(220813, 1146, 'Mithril Deposit'),
(220814, 1146, 'Mithril Deposit'),
(220815, 1146, 'Mithril Deposit'),
(220816, 1146, 'Mithril Deposit'),
(220817, 1146, 'Mithril Deposit'),
(220818, 1146, 'Mithril Deposit'),
(220819, 1146, 'Mithril Deposit'),
(220820, 1146, 'Mithril Deposit'),
(25454, 1141, 'Iron Deposit');
UPDATE `pool_template` SET `max_limit`= 15  WHERE  `entry`=1141;

-- Remove Empty Pools
DELETE FROM `pool_template` WHERE `entry` IN ( 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 3010, 9274, 9273, 9271, 9270, 9269, 9268, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 1631, 1632, 1633, 151, 2511);
DELETE FROM `gameobject_requirement` WHERE  `guid` = 361752;
-- DELETE FROM `gameobject` WHERE `guid` = 42899;
DELETE FROM `gameobject` WHERE `guid` IN (44016, 44077);
DELETE FROM `pool_gameobject` WHERE `guid` IN (44016, 44077);
DELETE FROM `pool_template` WHERE `entry` = 3823;
DELETE FROM `gameobject` WHERE `guid`=26002;
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` IN (2083, 2086, 2087);
DELETE FROM `game_event_gameobject` WHERE `guid` =12093 AND `event`=38;

DELETE FROM `pool_gameobject_template` WHERE  `id` = 2039;
-- Create new pool to hold Hidden Strongbox spawns in Alterac Mountains.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(156, 6, 'Hidden Strongboxs in Alterac Mountains', 0, 10);
-- Add existing spawns to pool.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(32179, 156, 0, 'Hidden Strongbox', 0, 10),
(32183, 156, 0, 'Hidden Strongbox', 0, 10),
(32184, 156, 0, 'Hidden Strongbox', 0, 10),
(32346, 156, 0, 'Hidden Strongbox', 0, 10),
(32361, 156, 0, 'Hidden Strongbox', 0, 10),
(32362, 156, 0, 'Hidden Strongbox', 0, 10),
(32454, 156, 0, 'Hidden Strongbox', 0, 10),
(32455, 156, 0, 'Hidden Strongbox', 0, 10),
(32459, 156, 0, 'Hidden Strongbox', 0, 10),
(32460, 156, 0, 'Hidden Strongbox', 0, 10),
(32470, 156, 0, 'Hidden Strongbox', 0, 10),
(32471, 156, 0, 'Hidden Strongbox', 0, 10),
(32479, 156, 0, 'Hidden Strongbox', 0, 10),
(32485, 156, 0, 'Hidden Strongbox', 0, 10),
(32492, 156, 0, 'Hidden Strongbox', 0, 10),
(32493, 156, 0, 'Hidden Strongbox', 0, 10),
(32509, 156, 0, 'Hidden Strongbox', 0, 10);

-- Missing Alliance Chest spawns in Arathi Highlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(55403, 105581, 0, -1544.81, -1751.48, 68.1662, 1.11701, 0, 0, 0.529919, 0.848048, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 55402 at 70.779816 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(55403, 74, 0, 'Alliance Chest', 0, 10); -- 

UPDATE `pool_template` SET `max_limit` = 2 WHERE `entry` = 75;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(74, 2, 'Alliance Chests in Arathi Highlands');

DELETE FROM `pool_gameobject` WHERE  `guid` = 68803;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(68803, 1265, 'Plaguebloom');

DELETE FROM `gameobject` WHERE `guid` IN (25360, 25357);
UPDATE `pool_gameobject` SET `pool_entry` = 38 WHERE  `guid` IN (25931, 25934);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(420, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Western Plaguelands');

UPDATE `pool_gameobject` SET `pool_entry` = 17198 WHERE `guid` = 427563;
UPDATE `pool_gameobject` SET `pool_entry` = 14446 WHERE `guid` = 84124;

DELETE FROM `pool_pool` WHERE  `pool_id` IN (3823, 21401, 21402, 21403, 21404, 21405, 21406, 21407, 21408, 21409, 21410, 21411, 21412, 21413, 21414, 21415, 21451, 21452, 21453, 21454, 21455, 21456, 21457, 21458, 21459, 21460, 21461, 21462, 21463, 21464, 21465, 21466, 21467, 21468, 21469, 21470, 21471, 21472, 21473, 21474, 21475, 21476, 21477, 21478, 21554, 21555, 21556, 21557, 21558, 21559, 21560, 21561, 21562, 21563, 21564, 21565, 21566, 21567, 21568, 21569, 21570, 21601, 21602, 21603, 21604, 21605, 21606, 21607, 21608, 21609, 21610, 21611, 21612, 21613, 21614, 21615, 21651, 21652, 21653, 21654, 21655, 21656, 21657, 34921, 34922);

-- Barrens / 3714 / 3715
SET @OGUID = 100086;
SET @PTEMPLATE = 43535;

DELETE FROM `gameobject` WHERE `guid` IN (13528, 13539, 13545, 25433);
DELETE FROM `pool_gameobject` WHERE `guid` IN (13528, 13539, 13545, 25433);
DELETE FROM `pool_template` WHERE `entry` = 60;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3714, 1, -4040.54, -2384.23, 125.298, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+2, 3714, 1, -4033.6, -2404.29, 126.131, -2.70526, 0, 0, 0.976296, -0.21644, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 3714, 1, -4065.35, -2417.5, 126.133, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 3714, 1, -4113.86, -2302.24, 126.262, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 3715, 1, -4040.54, -2384.23, 125.298, 1.95477, 0, 0, 0.829038, 0.559193, 300, 300, 100, 1, 0, 0, 0, 10), 
(@OGUID+6, 3715, 1, -4033.6, -2404.29, 126.131, -2.70526, 0, 0, 0.976296, -0.21644, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 3715, 1, -4065.35, -2417.5, 126.133, 3.57793, 0, 0, -0.976295, 0.216442, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 3715, 1, -4113.86, -2302.24, 126.262, 5.61996, 0, 0, -0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@PTEMPLATE+2, 1, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@PTEMPLATE+3, 1, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@PTEMPLATE+4, 1, 'Alliance Chest / Alliance Strongbox - Barrens', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+2, @PTEMPLATE+2, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+3, @PTEMPLATE+3, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+4, @PTEMPLATE+4, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+5, @PTEMPLATE+1, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+6, @PTEMPLATE+2, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+7, @PTEMPLATE+3, 'Alliance Chest / Alliance Strongbox - Barrens', 10),
(@OGUID+8, @PTEMPLATE+4, 'Alliance Chest / Alliance Strongbox - Barrens', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Barrens - Alliance Chest / Alliance Strongbox (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+5, 0, 'Alliance Chest / Alliance Strongbox - Barrens', 0),
(@PTEMPLATE+2, @PTEMPLATE+5, 0, 'Alliance Chest / Alliance Strongbox - Barrens', 0),
(@PTEMPLATE+3, @PTEMPLATE+5, 0, 'Alliance Chest / Alliance Strongbox - Barrens', 0),
(@PTEMPLATE+4, @PTEMPLATE+5, 0, 'Alliance Chest / Alliance Strongbox - Barrens', 0);

-- Alterac Mountains / 105570 / 105579
SET @OGUID = 112738;
SET @PTEMPLATE = 43157;

DELETE FROM `gameobject` WHERE `guid` IN (33191, 32516, 32515, 33188, 32213, 33181, 25432);
DELETE FROM `pool_gameobject` WHERE `guid` IN (33191, 32516, 32515, 33188, 32213, 33181, 25432);
DELETE FROM `pool_template` WHERE `entry` = 76;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 105570, 0, 389.558, 178.222, 41.9383, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 105570, 0, 58.7195, 276.344, 41.9076, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 105570, 0, 17.3519, 435.146, 43.7572, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 105570, 0, 96.9252, 367.759, 43.922, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 105570, 0, 121.878, 454.223, 44.0955, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 105570, 0, 424.828, 221.755, 42.888, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 105570, 0, 335.954, 185.797, 42.9273, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 105570, 0, 443.818, 288.769, 42.4809, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 105579, 0, 389.558, 178.222, 41.9383, 3.26377, 0, 0, -0.998135, 0.0610518, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 105579, 0, 58.7195, 276.344, 41.9076, 5.13127, 0, 0, -0.544639, 0.838671, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 105579, 0, 17.3519, 435.146, 43.7572, 6.14356, 0, 0, -0.0697556, 0.997564, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 105579, 0, 96.9252, 367.759, 43.922, 3.97935, 0, 0, -0.913545, 0.406738, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 105579, 0, 121.878, 454.223, 44.0955, 0.0349062, 0, 0, 0.0174522, 0.999848, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 105579, 0, 424.828, 221.755, 42.888, 0.663223, 0, 0, 0.325567, 0.945519, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 105579, 0, 335.954, 185.797, 42.9273, 4.69494, 0, 0, -0.71325, 0.70091, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 105579, 0, 443.818, 288.769, 42.4809, 5.72468, 0, 0, -0.275637, 0.961262, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+2, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+3, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+4, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+5, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+6, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+7, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@PTEMPLATE+8, 1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+2, @PTEMPLATE+2, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+3, @PTEMPLATE+3, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+4, @PTEMPLATE+4, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+5, @PTEMPLATE+5, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+6, @PTEMPLATE+6, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+7, @PTEMPLATE+7, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+8, @PTEMPLATE+8, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+9, @PTEMPLATE+1, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+10, @PTEMPLATE+2, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+11, @PTEMPLATE+3, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+12, @PTEMPLATE+4, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+13, @PTEMPLATE+5, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+14, @PTEMPLATE+6, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+15, @PTEMPLATE+7, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10),
(@OGUID+16, @PTEMPLATE+8, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+9, 3, 'Alterac Mountains - Alliance Chest / Alliance Strongbox (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+2, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+3, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+4, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+5, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+6, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+7, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0),
(@PTEMPLATE+8, @PTEMPLATE+9, 0, 'Alliance Chest / Alliance Strongbox - Alterac Mountains', 0);

-- Create new pool to hold Horde Supply Crate spawns in The Hinterlands.
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(41, 4, 'Hinterlands - Horde Supply Crate', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(142191, 41, 'Hinterlands - Horde Supply Crate');
UPDATE `gameobject` SET `spawntimesecsmin` = 60, `spawntimesecsmax` = 60 WHERE `id` = 142191;

-- Missing Silverleaf spawns in Teldrassil.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(49637, 1617, 1, 10400, 1534.33, 1305.91, 3.94445, 0, 0, -0.920505, 0.390732, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 49635 at 80.792198 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(49637, 1003, 0, 'Silverleaf', 0, 10); -- Silverleaf in Teldrassil

-- Missing Goldthorn spawns in Swamp of Sorrows.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42423, 2046, 0, -10588, -2737.17, 34.8652, 2.26893, 0, 0, 0.906307, 0.422619, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 42360 at 4.599496 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42423, 1313, 0, 'Goldthorn', 0, 10); -- Goldthorn in Swamp of Sorrows

-- Missing Purple Lotus spawns in Dire Maul.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66946, 142140, 1, -3651.92, 1213.45, 149.229, 2.87979, 0, 0, 0.991445, 0.130528, 300, 300, 1, 100, 0, 10); -- Closest existing guid is 66939 at 156.249222 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(66946, 1324, 0, 'Purple Lotus', 0, 10); -- Purple Lotus in Feralas

SET @OGUID = 3244;
SET @PTEMPLATE = 21553;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1733, 0, -869.414, -3911.16, 141.44, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 1734, 0, -869.414, -3911.16, 141.44, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 1735, 0, -869.414, -3911.16, 141.44, 2.07694, 0, 0, 0.861629, 0.507539, 300, 300, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+2, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10),
(@OGUID+3, @PTEMPLATE+1, 'Silver Vein / Gold Vein / Iron Deposit - Arathi Highlands', 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 323, 0, 'Arathi Highlands - Silver Vein / Gold Vein / Iron Deposit', 0);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+4, 2055, 0, -8774.09, -1973.63, 129.718, 2.11185, 0, 0, 0.870356, 0.492424, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(@OGUID+4, 1128, 'Copper Vein');

-- Missing Gri'lek the Wanderer spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(11149, 58, 0, -12140.9, 640.934, -70.777, 0.564744, 0.0569606, -0.263658, 0.263268, 0.926245, 0, 0, 1, 100, 0, 10); -- Closest existing guid is 11028 at 8.522406 yards.

-- Missing Bloodsail Orders spawns in Stranglethorn Vale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(10293, 2087, 0, -14680.9, 500.437, 2.18742, 3.927, 0, 0, -0.923879, 0.382686, 60, 60, 1, 100, 0, 10);

-- Correct position of Cortello's Riddle in Stranglethorn Vale (position is off by 0.100586 yards).
UPDATE `gameobject` SET `position_x`=-14912.9, `position_y`=83.4848, `position_z`=2.1396, `orientation`=2.60054, `rotation0`=0, `rotation1`=0, `rotation2`=0.96363, `rotation3`=0.267241 WHERE `guid`=26047;

SET @OGUID = 298;
SET @PTEMPLATE = 386;

DELETE FROM `gameobject` WHERE `guid` IN (42675, 42676, 42674);

-- Missing Food Crate spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3662, 0, -11280.2, 1512.85, 37.6001, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 39821 at 177.525513 yards.
(@OGUID+2, 3662, 0, -11142.5, 1561.96, 21.3644, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 39843 at 103.225113 yards.
(@OGUID+3, 3662, 0, -11176.7, 1518.9, 19.5604, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 1, 100, 0, 10),
(@OGUID+4, 3662, 0, -11214.6, 1549.68, 34.4351, 2.58309, 0, 0, 0.961262, 0.275637, 180, 180, 1, 100, 0, 10),
(@OGUID+5, 3662, 0, -11327.6, 1566.61, 26.2925, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 1, 100, 0, 10),
(@OGUID+6, 3705, 0, -11280.2, 1512.85, 37.6001, 3.63029, 0, 0, -0.970295, 0.241925, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 39821 at 177.525513 yards.
(@OGUID+7, 3705, 0, -11142.5, 1561.96, 21.3644, 2.19911, 0, 0, 0.891006, 0.453991, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 39843 at 103.225113 yards.
(@OGUID+8, 3705, 0, -11176.7, 1518.9, 19.5604, 0.296705, 0, 0, 0.147809, 0.989016, 180, 180, 1, 100, 0, 10),
(@OGUID+9, 3705, 0, -11214.6, 1549.68, 34.4351, 2.58309, 0, 0, 0.961262, 0.275637, 180, 180, 1, 100, 0, 10),
(@OGUID+10, 3705, 0, -11327.6, 1566.61, 26.2925, 6.14356, 0, 0, -0.0697556, 0.997564, 180, 180, 1, 100, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+3, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+4, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@PTEMPLATE+5, 1, 'Food Crate / Barrel of Milk - Westfall', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+6, @PTEMPLATE+1, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+7, @PTEMPLATE+2, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+8, @PTEMPLATE+3, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+9, @PTEMPLATE+4, 'Food Crate / Barrel of Milk - Westfall', 0, 10),
(@OGUID+10, @PTEMPLATE+5, 'Food Crate / Barrel of Milk - Westfall', 0, 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+2, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+3, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+4, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0),
(@PTEMPLATE+5, 2129, 0, 'Food Crate / Barrel of Milk - Westfall', 0);

SET @OGUID = 194;
SET @PTEMPLATE = 18840;

UPDATE `pool_template` SET `description` = 'Food Crate / Armor Crate / Weapon Crate - Barrens' WHERE  `entry` IN ( 243, 244, 245, 246, 247, 248, 249);
UPDATE `pool_gameobject` SET `description` = 'Food Crate / Armor Crate / Weapon Crate - Barrens' WHERE `pool_entry`  IN ( 243, 244, 245, 246, 247, 248, 249);

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 3689, 1, -4081.57, -2407.94, 135.856, 1.23918, 0, 0, 0.580703, 0.814116, 180, 180, 1, 100, 0, 10),
(@OGUID+2, 3689, 1, -4065, -2404.03, 135.853, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 1, 100, 0, 10),
(@OGUID+3, 3695, 1, -4081.57, -2407.94, 135.856, 1.23918, 0, 0, 0.580703, 0.814116, 180, 180, 1, 100, 0, 10),
(@OGUID+4, 3695, 1, -4065, -2404.03, 135.853, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 1, 100, 0, 10),
(@OGUID+5, 3702, 1, -4081.57, -2407.94, 135.856, 1.23918, 0, 0, 0.580703, 0.814116, 180, 180, 1, 100, 0, 10),
(@OGUID+6, 3702, 1, -4065, -2404.03, 135.853, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 1, 100, 0, 10); 

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@PTEMPLATE+2, 1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@OGUID+3, @PTEMPLATE+1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@OGUID+4, @PTEMPLATE+2, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@OGUID+5, @PTEMPLATE+1, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10),
(@OGUID+6, @PTEMPLATE+2, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 3, 'Barrens - Food Crate / Armor Crate / Weapon Crate (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(@PTEMPLATE+2, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(244, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(245, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(246, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(247, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(248, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0),
(249, @PTEMPLATE+3, 0, 'Food Crate / Armor Crate / Weapon Crate - Barrens', 0);

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(82074, 3691, 1, -1362.96, -3906.07, 10.1468, 4.53786, 0, 0, -0.766044, 0.642789, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 82072 at 162.593842 yards.

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(82075, 3693, 1, 1346.15, -3614.72, 91.811, 0.314158, 0, 0, 0.156434, 0.987688, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 82073 at 39.149246 yards.

-- Missing Food Crate spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(82076, 3690, 1, 1362.68, -3418.61, 92.2878, 2.18166, 0, 0, 0.887011, 0.461749, 3600, 3600, 1, 100, 0, 10); -- Closest existing guid is 82071 at 137.587158 yards.

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(96, 3689, 48, -295.378, 316.711, -52.3953, 2.23402, 0, 0, 0.898793, 0.438373, 604800, 604800, 100, 1, 0, 0, 0, 10);

-- Missing Bottle of Disease spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48124, 18036, 1, 1909.85, -2642.83, 84.2239, 0.174532, 0, 0, 0.0871553, 0.996195, 10, 10, 1, 100, 0, 10); -- Closest existing guid is 47983 at 0.297812 yards.

-- Durotar
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(281, 3658, 1, 319.082, -4768.63, 11.9896, 1.72787, 0, 0, 0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10),
(282, 3719, 1, 319.082, -4768.63, 11.9896, 1.72787, 0, 0, 0.760406, 0.649449, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(60, 1, 'Water Barrel / Food Crate - Durotar', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(281, 60, 'Water Barrel / Food Crate - Durotar', 0, 10),
(282, 60, 'Water Barrel / Food Crate - Durotar', 0, 10);

INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(60, 3877, 0, 'Water Barrel / Food Crate - Durotar', 0);

-- Missing Food Crate spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(9100, 3707, 1, -2429.64, -4067.95, -0.042337, 4.18879, 0, 0, -0.866025, 0.500001, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 9097 at 153.081680 yards.
(55944, 3707, 1, -3012.29, -3247.19, 35.6678, 4.95674, 0, 0, -0.615661, 0.788011, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 55943 at 89.168709 yards.
(82057, 3707, 1, -3120.66, -2817.84, 34.1979, 2.21657, 0, 0, 0.894934, 0.446199, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 82056 at 69.481461 yards.
(13658, 3707, 1, -3616.08, -4059.85, -0.156585, 5.39307, 0, 0, -0.430511, 0.902586, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 13634 at 158.182877 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(9100, 2512, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(55944, 2512, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(82057, 2512, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(13658, 2512, 0, 'Food Crate', 0, 10); -- Food Crates in Dustwallow Marsh

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2556, 3702, 48, -614.864, 252.745, -49.4881, 4.81711, 0, 0, -0.66913, 0.743145, 604800, 604800, 100, 1, 0, 0, 0, 10),
(2557, 3704, 189, 1743.97, -389.967, 8.00978, 0.0349062, 0, 0, 0.0174522, 0.999848, 604800, 604800, 100, 1, 0, 0, 0, 10),
(2558, 3703, 189, 1782.58, -414.356, 8.01169, 1.5708, 0, 0, 0.707107, 0.707107, 604800, 604800, 100, 1, 0, 0, 0, 10),
(2559, 3704, 189, 1795.07, -431.977, 8.01001, 0, 0, 0, 0, 1, 604800, 604800, 100, 1, 0, 0, 0, 10),
(2560, 3704, 189, 1803.25, -398.513, 8.01243, 3.12412, 0, 0, 0.999962, 0.00873464, 604800, 604800, 100, 1, 0, 0, 0, 10);

-- Giant Clam BFD
SET @OGUID = 3340;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 19018, 48, -835.627, -47.6639, -35.6945, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 19018, 48, -799.321, -30.2354, -37.0964, 5.70723, 0, 0, -0.284015, 0.95882, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 19018, 48, -331.169, -27.6077, -72.2552, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 19018, 48, -710.16, -49.4721, -41.5957, 3.31614, 0, 0, -0.996194, 0.087165, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 19018, 48, -730.435, -31.5133, -41.4731, 2.11185, 0, 0, 0.870356, 0.492424, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 19018, 48, -764.24, -12.3917, -35.5403, 5.93412, 0, 0, -0.173648, 0.984808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 19018, 48, -784.329, -82.7394, -43.0525, 0.558504, 0, 0, 0.275637, 0.961262, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 19018, 48, -760.683, -155.534, -51.5062, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 19018, 48, -795.359, -161.435, -44.3909, 4.7822, 0, 0, -0.681998, 0.731354, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 19018, 48, -410.169, 94.1617, -65.5919, 2.09439, 0, 0, 0.866025, 0.500001, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 19018, 48, -437.448, 292.991, -65.8625, 6.00393, 0, 0, -0.139173, 0.990268, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 19018, 48, -427.409, 311.43, -65.817, 0.139624, 0, 0, 0.0697556, 0.997564, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 19018, 48, -683.941, -76.1221, -36.733, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 19018, 48, -805.247, -65.7192, -43.6953, 0.610863, 0, 0, 0.300705, 0.953717, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 19018, 48, -755.565, -121.637, -37.5905, 1.79769, 0, 0, 0.782608, 0.622515, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 19018, 48, -368.942, 256.857, -71.7873, 5.70723, 0, 0, -0.284015, 0.95882, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 19018, 48, -686.755, -34.1224, -36.9234, 2.16421, 0, 0, 0.882947, 0.469473, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 19018, 48, -731.243, -49.8701, -40.9547, 3.71755, 0, 0, -0.958819, 0.284016, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 19018, 48, -734.435, -96.0345, -36.9606, 1.20428, 0, 0, 0.566406, 0.824126, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 19018, 48, -756.047, -176.359, -54.119, 1.6057, 0, 0, 0.719339, 0.694659, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 19018, 48, -870.495, -105.115, -35.4094, 1.71042, 0, 0, 0.754709, 0.656059, 180, 180, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+2, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+3, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+4, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+5, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+6, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+7, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+8, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+9, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+10, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+11, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+12, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+13, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+14, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+15, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+16, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+17, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+18, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+19, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+20, 1341, 0, 'Giant Clam', 0, 10),
(@OGUID+21, 1341, 0, 'Giant Clam', 0, 10);

UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `id` = 19018 AND `map` = 48;
UPDATE `pool_template` SET `max_limit` = 17 WHERE `entry` = 1341;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(128, 19019, 36, -209.953, -595.73, 20.9768, 1.16937, 0, 0, 0.551936, 0.833886, 604800, 604800, 100, 1, 0, 0, 0, 10);

-- Correct position of Snufflenose Owner's Manual in The Barrens (position is off by 0.120619 yards).
UPDATE `gameobject` SET `position_x`=-929.43, `position_y`=-3693.32, `position_z`=8.70877, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=13041;

-- Missing Snufflenose Owner's Manual spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13218, 21530, 1, -929.35, -3693.59, 8.70877, 4.83456, 0, 0, -0.66262, 0.748956, 10, 10, 1, 100, 0, 10),
(13219, 21530, 1, -929.441, -3693.2, 8.70877, 4.85202, 0, 0, -0.656058, 0.75471, 10, 10, 1, 100, 0, 10); -- Closest existing guid is 13041 at 0.120619 yards.

-- Missing Snufflenose Command Sticks spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(12686, 68865, 1, -928.243, -3694.29, 7.42971, 2.23402, 0, 0, 0.898793, 0.438373, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 12674 at 0.092578 yards.
(12759, 68865, 1, -928.193, -3694.29, 7.48284, 0.925024, 0, 0, 0.446198, 0.894935, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 12674 at 0.039830 yards.
(12770, 68865, 1, -928.21, -3694.32, 7.46828, 0.331611, 0, 0, 0.165047, 0.986286, 10, 10, 1, 100, 0, 10), -- Closest existing guid is 12674 at 0.073590 yards.
(12773, 68865, 1, -928.177, -3694.24, 7.27782, 3.87463, 0, 0, -0.93358, 0.358368, 10, 10, 1, 100, 0, 10);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(283, 103820, 90, -511.898, -139.356, -152.478, 3.9619, 0, 0, -0.91706, 0.39875, 604800, 604800, 100, 1, 0, 0, 0, 10),
(284, 103820, 90, -511.33, -139.962, -152.476, 0.750491, 0, 0, 0.366501, 0.930418, 604800, 604800, 100, 1, 0, 0, 0, 10),
(285, 103820, 90, -510.675, -139.437, -152.617, 3.33359, 0, 0, -0.995396, 0.0958512, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(251, 43, 'Gnomeregan - Artificial Extrapolator', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(142344, 251, 'Gnomeregan - Artificial Extrapolator');
SET @OGUID = 24689;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 142344, 90, -842.885, 375.022, -316.873, 3.07177, 0, 0, 0.999391, 0.0349061, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 142344, 90, -856.641, 308.149, -316.433, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 142344, 90, -671.056, 430.924, -273.064, 4.46804, 0, 0, -0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 142344, 90, -737.022, 561.946, -303.783, 0.209439, 0, 0, 0.104528, 0.994522, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 142344, 90, -629.114, 674.704, -327.053, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 142344, 90, -842.7, 340.362, -316.872, 6.17847, 0, 0, -0.0523357, 0.99863, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 142344, 90, -666.174, 424.073, -230.628, 2.82743, 0, 0, 0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 142344, 90, -653.174, 470.925, -230.601, 3.17653, 0, 0, -0.999847, 0.0174693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 142344, 90, -623.801, 425.115, -230.6, 3.45576, 0, 0, -0.987688, 0.156436, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 142344, 90, -526.468, 359.332, -231.52, 2.02458, 0, 0, 0.848047, 0.529921, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+11, 142344, 90, -523.784, 384.632, -231.679, 4.13643, 0, 0, -0.878817, 0.47716, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+12, 142344, 90, -657.832, 522.973, -230.601, 1.98967, 0, 0, 0.83867, 0.54464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+13, 142344, 90, -557.41, 487.718, -273.062, 5.95157, 0, 0, -0.165047, 0.986286, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+14, 142344, 90, -540.654, 489.965, -273.062, 1.74533, 0, 0, 0.766044, 0.642789, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+15, 142344, 90, -514.955, 406.563, -230.601, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+16, 142344, 90, -531.904, 498.709, -273.062, 1.97222, 0, 0, 0.833885, 0.551938, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+17, 142344, 90, -478.25, 542.684, -230.602, 0.767944, 0, 0, 0.374606, 0.927184, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+18, 142344, 90, -476.012, 579.194, -230.601, 1.36136, 0, 0, 0.62932, 0.777146, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+19, 142344, 90, -492.235, 563.659, -230.602, 6.05629, 0, 0, -0.113203, 0.993572, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+20, 142344, 90, -506.716, 574.526, -230.602, 1.88495, 0, 0, 0.809016, 0.587786, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+21, 142344, 90, -570.643, 562.819, -273.08, 3.90954, 0, 0, -0.927183, 0.374608, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+22, 142344, 90, -602.541, 538.518, -273.08, 5.8294, 0, 0, -0.224951, 0.97437, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+23, 142344, 90, -705.812, 415.35, -273.062, 1.18682, 0, 0, 0.559193, 0.829038, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+24, 142344, 90, -545.807, 282.381, -208.121, 0.174532, 0, 0, 0.0871553, 0.996195, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+25, 142344, 90, -467.554, 266.701, -207.906, 0.698131, 0, 0, 0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+26, 142344, 90, -448.323, 256.703, -207.906, 2.02458, 0, 0, 0.848047, 0.529921, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+27, 142344, 90, -490.968, 497.865, -273.08, 2.68781, 0, 0, 0.97437, 0.224951, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+28, 142344, 90, -630.671, 543.116, -273.062, 2.91469, 0, 0, 0.993571, 0.113208, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+29, 142344, 90, -523.274, 609.425, -230.601, 0.802851, 0, 0, 0.390731, 0.920505, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+30, 142344, 90, -812.693, 454.52, -308.104, 2.46091, 0, 0, 0.942641, 0.333808, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+31, 142344, 90, -878.901, 413.444, -316.452, 5.58505, 0, 0, -0.34202, 0.939693, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+32, 142344, 90, -413.838, 169.739, -154.025, 3.12412, 0, 0, 0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+33, 142344, 90, -376.055, 111.525, -154.024, 1.55334, 0, 0, 0.700909, 0.713251, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+34, 142344, 90, -618.114, 124.15, -199.649, 4.66003, 0, 0, -0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+35, 142344, 90, -360.867, 84.9759, -207.895, 1.81514, 0, 0, 0.788011, 0.615662, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+36, 142344, 90, -420.608, 206.151, -211.553, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+37, 142344, 90, -518.132, 260.072, -207.906, 4.66003, 0, 0, -0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+38, 142344, 90, -537.037, 437.35, -273.068, 1.37881, 0, 0, 0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+39, 142344, 90, -517.682, 555.84, -273.08, 4.66003, 0, 0, -0.725374, 0.688355, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+40, 142344, 90, -573.884, 581.258, -230.602, 2.9496, 0, 0, 0.995396, 0.0958512, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+41, 142344, 90, -624.42, 584.544, -230.601, 3.57793, 0, 0, -0.976295, 0.216442, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+42, 142344, 90, -609.993, 484.964, -273.08, 5.77704, 0, 0, -0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+43, 142344, 90, -621.209, 506.055, -273.066, 3.99681, 0, 0, -0.909961, 0.414694, 180, 180, 100, 1, 0, 0, 0, 10),
(@OGUID+44, 142344, 90, -644.211, 450.836, -230.601, 2.32129, 0, 0, 0.91706, 0.39875, 180, 180, 100, 1, 0, 0, 0, 10);
UPDATE `gameobject` SET `spawntimesecsmin` = 604800, `spawntimesecsmax` = 604800 WHERE `id` = 142344;

-- Missing Food Crate spawns in Dustwallow Marsh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(56052, 153470, 1, -4024.68, -3397.13, 38.4731, 0.488691, 0, 0, 0.241921, 0.970296, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 56051 at 340.924286 yards.
(14985, 153470, 1, -4415.2, -4113.46, -0.247779, 3.4034, 0, 0, -0.991445, 0.130528, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 14932 at 272.981262 yards.
(56053, 153470, 1, -4297.23, -3019.47, 35.2656, 4.88692, 0, 0, -0.642787, 0.766045, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 56051 at 281.128387 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(56052, 2513, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(14985, 2513, 0, 'Food Crate', 0, 10), -- Food Crates in Dustwallow Marsh
(56053, 2513, 0, 'Food Crate', 0, 10); -- Food Crates in Dustwallow Marsh

-- Missing Food Crate spawns in The Hinterlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(46252, 153470, 0, 332.637, -2122.37, 104.618, 0.628317, 0, 0, 0.309016, 0.951057, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46251 at 63.565536 yards.
(46244, 153470, 0, -375.357, -4217.46, 174.073, 5.75959, 0, 0, -0.258819, 0.965926, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46238 at 149.182541 yards.
(82077, 153470, 0, 117.548, -4399.23, 120.311, 1.5708, 0, 0, 0.707107, 0.707107, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 82070 at 342.146118 yards.
(46247, 153470, 0, 80.0868, -2092.69, 112.912, 1.69297, 0, 0, 0.748956, 0.66262, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46234 at 159.998779 yards.
(46257, 153470, 0, -266.57, -4607.67, -0.763927, 5.72468, 0, 0, -0.275637, 0.961262, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46226 at 425.468323 yards.
(46267, 153470, 0, 235.022, -2852.96, 111.004, 1.02974, 0, 0, 0.492423, 0.870356, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46224 at 246.037491 yards.
(82078, 153470, 0, 218.436, -4326.15, 117.688, 0.0174525, 0, 0, 0.00872612, 0.999962, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 82070 at 228.182098 yards.
(46271, 153470, 0, 46.9772, -4649.91, 13.1173, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46238 at 551.168152 yards.
(46276, 153470, 0, 362.761, -2828.82, 121.56, 3.54302, 0, 0, -0.979924, 0.19937, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46224 at 265.329834 yards.
(46278, 153470, 0, 382.345, -2130.22, 121.007, 2.1293, 0, 0, 0.874619, 0.48481, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46251 at 21.049978 yards.
(46279, 153470, 0, 352.859, -2092.25, 120.451, 1.74533, 0, 0, 0.766044, 0.642789, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46251 at 43.796371 yards.
(46433, 153470, 0, 472.777, -3328.22, 120.236, 3.22886, 0, 0, -0.999048, 0.0436193, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46428 at 298.538452 yards.
(46282, 153470, 0, -394.79, -4055.36, 174.083, 6.0912, 0, 0, -0.0958452, 0.995396, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46238 at 213.624695 yards.
(46285, 153470, 0, -262.859, -4019.79, 174.073, 3.29869, 0, 0, -0.996917, 0.0784664, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 46238 at 180.732529 yards.
(46290, 153470, 0, -473.828, -4588.63, 9.1685, 2.56563, 0, 0, 0.958819, 0.284016, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 46226 at 217.654510 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(46252, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46244, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(82077, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46247, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46257, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46267, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(82078, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46271, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46276, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46278, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46279, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46433, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46282, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46285, 2515, 0, 'Food Crate', 0, 10), -- Food Crates in The Hinterlands
(46290, 2515, 0, 'Food Crate', 0, 10); -- Food Crates in The Hinterlands
UPDATE `pool_template` SET `max_limit` = 11 WHERE  `entry`=2515;

-- Missing Food Crate spawns in Western Plaguelands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(45503, 153471, 0, 1638.44, -2280.04, 59.8932, 1.43117, 0, 0, 0.656058, 0.75471, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45489 at 386.286224 yards.
(45504, 153471, 0, 2101.49, -1815.66, 56.4621, 0.471238, 0, 0, 0.233445, 0.97237, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45483 at 224.309387 yards.
(45505, 153471, 0, 2824.81, -1544.42, 151.203, 5.60251, 0, 0, -0.333807, 0.942641, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45487 at 114.101120 yards.
(45513, 153471, 0, 1769.98, -1251.8, 60.0194, 2.3911, 0, 0, 0.930417, 0.366502, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45490 at 135.835510 yards.
(82079, 153471, 0, 2395.77, -1490.48, 102.559, 2.96704, 0, 0, 0.996194, 0.087165, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 82066 at 173.045197 yards.
(45557, 153471, 0, 1578.1, -1556.25, 62.4489, 2.35619, 0, 0, 0.92388, 0.382683, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45550 at 119.286827 yards.
(45515, 153471, 0, 2207.68, -1784.19, 63.8967, 4.08407, 0, 0, -0.891006, 0.453991, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45483 at 139.963562 yards.
(45560, 153471, 0, 3011.26, -1497.19, 146.331, 4.66003, 0, 0, -0.725374, 0.688355, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45487 at 190.077469 yards.
(45561, 153471, 0, 2774.89, -1438.41, 146.268, 5.20108, 0, 0, -0.515038, 0.857168, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 45487 at 58.793861 yards.
(82080, 153471, 0, 1296.44, -1385.05, 49.5297, 2.75761, 0, 0, 0.981627, 0.190812, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 82064 at 169.616440 yards.
(82081, 153471, 0, 1491.99, -1821.35, 61.6151, 5.07891, 0, 0, -0.566406, 0.824126, 180, 180, 1, 100, 0, 10); -- Closest existing guid is 82063 at 210.005600 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(45503, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45504, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45505, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45513, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(82079, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45557, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45515, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45560, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(45561, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(82080, 2514, 0, 'Food Crate', 0, 10), -- Food Crates in Western Plaguelands
(82081, 2514, 0, 'Food Crate', 0, 10); -- Food Crates in Western Plaguelands
UPDATE `pool_template` SET `max_limit`= 9  WHERE  `entry`=2514;

UPDATE `gameobject` SET `position_x`=803.48, `position_y`=-357.449, `position_z`=-48.9414, `orientation`=0.733038, `rotation0`=0, `rotation1`=0, `rotation2`=0.358368, `rotation3`=0.93358 WHERE `guid`=43137;

UPDATE `gameobject` SET `position_x`=802.907, `position_y`=-356.401, `position_z`=-48.9423, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=362149;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(314, 173234, 230, 631.133, -70.6022, -44.4505, 4.67748, 0, 0, -0.719339, 0.694659, 604800, 604800, 100, 1, 0, 0, 0, 10),
(315, 173234, 230, 852.163, -327.889, -49.366, 0.279252, 0, 0, 0.139173, 0.990268, 604800, 604800, 100, 1, 0, 0, 0, 10);

UPDATE `gameobject` SET `position_x`=75.9989, `position_y`=-334.744, `position_z`=91.5107, `orientation`=6.17847, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0523357, `rotation3`=0.99863 WHERE `guid` IN (399066, 399067);

UPDATE `gameobject` SET `position_x`=67.1283, `position_y`=-297.421, `position_z`=91.4255, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=3996164;

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(353, 178185, 1, 4321.46, 922.773, -14.2548, 5.2709, 0, 0, -0.484809, 0.87462, 180, 180, 100, 1, 0, 0, 0, 10);

-- Missing Warsong Oil spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(66115, 178195, 1, 2703.38, -2942, 145.095, 5.2709, 0, 0, -0.484809, 0.87462, 180, 180, 1, 100, 0, 10), -- Closest existing guid is 65926 at 23.763996 yards.
(47897, 178195, 1, 2487.91, -2132.03, 201.998, 4.46804, 0, 0, -0.788011, 0.615662, 180, 180, 1, 100, 0, 10);

UPDATE `gameobject` SET `id` = 179426 WHERE `guid` = 11028;

-- Missing Dark Iron Pillow spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7087, 179828, 0, -6578.01, -1314.35, 209.978, 4.20625, 0, 0, -0.861629, 0.507539, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6995 at 9.456453 yards.
(66116, 179828, 0, -6547.68, -1325.57, 212.376, 2.75761, 0, 0, 0.981627, 0.190812, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 66096 at 4.327898 yards.
(66141, 179828, 0, -6554.68, -1351.74, 212.682, 2.14675, 0, 0, 0.878817, 0.47716, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 66099 at 2.525874 yards.
(66146, 179828, 0, -6550.27, -1321.75, 210.433, 5.44543, 0, 0, -0.406736, 0.913546, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 66096 at 2.110844 yards.
(66147, 179828, 0, -6518.91, -1364.86, 210.541, 5.65487, 0, 0, -0.309016, 0.951057, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 66109 at 4.569125 yards.
(7089, 179828, 0, -6576.94, -1319.12, 210.249, 6.03884, 0, 0, -0.121869, 0.992546, 300, 300, 1, 100, 3, 10);

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 2.33102 yards).
UPDATE `gameobject` SET `position_x`=-6559.2, `position_y`=-1347.43, `position_z`=212.376, `orientation`=1.76278, `rotation0`=0, `rotation1`=0, `rotation2`=0.771625, `rotation3`=0.636078 WHERE `guid`=7006;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 2.50527 yards).
UPDATE `gameobject` SET `position_x`=-6552.55, `position_y`=-1317.99, `position_z`=212.64, `orientation`=4.93928, `rotation0`=0, `rotation1`=0, `rotation2`=-0.622514, `rotation3`=0.782609 WHERE `guid`=7009;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 1.97493 yards).
UPDATE `gameobject` SET `position_x`=-6573.04, `position_y`=-1328.57, `position_z`=210.388, `orientation`=0.837757, `rotation0`=0, `rotation1`=0, `rotation2`=0.406736, `rotation3`=0.913546 WHERE `guid`=7003;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 4.73451 yards).
UPDATE `gameobject` SET `position_x`=-6522.7, `position_y`=-1340.67, `position_z`=210.145, `orientation`=3.33359, `rotation0`=0, `rotation1`=0, `rotation2`=-0.995396, `rotation3`=0.0958512 WHERE `guid`=6991;

-- Correct position of Dark Iron Pillow in Searing Gorge (position is off by 3.80791 yards).
UPDATE `gameobject` SET `position_x`=-6569.39, `position_y`=-1335.83, `position_z`=210.187, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=6976;

-- Missing Dark Iron Pillow spawns in Searing Gorge.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(7090, 179828, 0, -6572.96, -1327.58, 212.095, 3.56047, 0, 0, -0.978148, 0.207912, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7003 at 1.974929 yards.
(7091, 179828, 0, -6551.49, -1318.46, 210.419, 0.698131, 0, 0, 0.34202, 0.939693, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7009 at 2.505269 yards.
(7092, 179828, 0, -6558.36, -1347.93, 210.26, 3.35105, 0, 0, -0.994521, 0.104536, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 7006 at 2.331023 yards.
(7093, 179828, 0, -6570.39, -1332.69, 212.095, 5.37562, 0, 0, -0.438371, 0.898794, 300, 300, 1, 100, 3, 10), -- Closest existing guid is 6976 at 3.807909 yards.
(7094, 179828, 0, -6518.08, -1341.7, 210.242, 2.84488, 0, 0, 0.989016, 0.147811, 300, 300, 1, 100, 3, 10); -- Closest existing guid is 6991 at 4.734511 yards.


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
