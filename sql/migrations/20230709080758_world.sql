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
DELETE FROM `gameobject` WHERE `guid` = 42899;
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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
