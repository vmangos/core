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
(41, 7, 'Arathi Highlands - Calcified Elven Gems', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(2712, 41, 'Arathi Highlands - Calcified Elven Gems');
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
(74, 13, 'Durotar - Taillasher Eggs', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(3240, 74, 'Durotar - Taillasher Eggs');
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
(146, 6, 'Barrens - Crossroads Supply Crates', 0, 10);
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `description`) VALUES
(175708, 146, 'Barrens - Crossroads Supply Crates');
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
(220813, 146, 'Mithril Deposit'),
(220814, 146, 'Mithril Deposit'),
(220815, 146, 'Mithril Deposit'),
(220816, 146, 'Mithril Deposit'),
(220817, 146, 'Mithril Deposit'),
(220818, 146, 'Mithril Deposit'),
(220819, 146, 'Mithril Deposit'),
(220820, 146, 'Mithril Deposit'),
(25454, 1141, 'Iron Deposit');
UPDATE `pool_template` SET `max_limit`= 15  WHERE  `entry`=1141;

-- Remove Empty Pools
DELETE FROM `pool_template` WHERE `entry` IN ( 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 3010, 9274, 9273, 9271, 9270, 9269, 9268, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 1631, 1632, 1633, 151, 2511);
DELETE FROM `gameobject_requirement` WHERE  `guid` = 361752;
DELETE FROM `gameobject` WHERE `guid` 42899;
DELETE FROM `gameobject` WHERE `guid` IN (44016, 44077);
DELETE FROM `pool_gameobject` WHERE `guid` IN (44016, 44077);
DELETE FROM `pool_template` WHERE `entry` = 3823;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
