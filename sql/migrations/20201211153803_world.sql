DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201211153803');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201211153803');
-- Add your query below.


-- stonetalon mountains
-- executioners sword - veenix
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4086 AND `item` = 4818;

-- dwarven mild - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 422;

-- snapvine watermellon - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 4538;

-- bristle whisker catfish - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` = 4593;

-- small throwing knife and crude throwing axe - chylina
DELETE FROM `npc_vendor` WHERE `entry` = 4084 AND `item` IN (2947, 3111);

-- missing items jeeda
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4083, 3357, 1, 7200),
(4083, 929, 3, 7200),
(4083, 3355, 1, 7200),
(4083, 785, 2, 7200);

-- small throwing knife and crude throwing axe - grawnal
DELETE FROM `npc_vendor` WHERE `entry` = 4082 AND `item` IN (2947, 3111);

-- fine longbow - borand
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 9549 AND `item` = 11304;


-- thunder bluff
-- missing items shadi mistrunner
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(8363, 6260),
(8363, 6529),
(8363, 2324),
(8363, 785);

-- imbued vial - shadi mistrunner
DELETE FROM `npc_vendor` WHERE `entry` = 8363 AND `item` = 18256;

-- rune thread - shadi mistrunner
DELETE FROM `npc_vendor` WHERE `entry` = 8363 AND `item` = 14341;

-- strange dust - nata dawnstrider
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 3012 AND `item` = 10940;

-- fine shortbow - kuna thunderhorn
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 7200 WHERE `entry` = 3015 AND `item` = 11303;

-- sturdy recurve - kuna thunderhorn
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3015 AND `item` = 11306;

-- massive longbow - kuna thunderhorn
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 3015 AND `item` = 11307;

-- aquadynamic fish attractor - sewa mistrunner
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3029, 6533, 2, 7200);


-- durotar
-- missing items jark
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(3164, 2946),
(3164, 3131);


-- barrens
-- correct hecht copperpinch items
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 14964;

-- feral blade vrang wildgore
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3682 AND `item` = 4766;

-- stable boots piznukle
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3684 AND `item` = 4788;

-- pattern: blue overalls yonada
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`)VALUES
(5944, 1, 7200, 6274);

-- malgin barleybrew should be a vendor
UPDATE `creature_template` SET `npc_flags` = 6 WHERE `entry` = 5848; 
INSERT INTO `npc_vendor` (`entry`, `item`)VALUES
(5848, 2595),
(5848, 2594),
(5848, 2593),
(5848, 2596),
(5848, 2723);

-- missing items lizzarik
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`)VALUES
(3658, 3, 7200, 858),
(3658, 3, 7200, 2455);

-- silverleaf hula mahi
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 3490 AND `item` = 765;

-- keen throwing knife and sharp throwing axe barg
DELETE FROM `npc_vendor` WHERE `entry` = 3481 AND `item` IN (3107, 3135);

-- missing items wrahk
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`)VALUES
(3485, 1, 7200, 6270);

-- recipe: rage potion ranik
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3499 AND `item` = 5640;

-- missing items ranik
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`)VALUES
(3499, 1, 7200, 2675);

-- small throwing knife and crude throwing axe jazzik
DELETE FROM `npc_vendor` WHERE `entry` = 3498 AND `item` IN (2947, 3111);

-- strong fishing pole - kilxx
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3497 AND `item` = 6365;

-- schematic: minor recombobulator gagsprocket
DELETE FROM `npc_vendor` WHERE `entry` = 3495 AND `item` = 14639;

-- missing items gagsprocket
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3495, 4389, 1, 10800),
(3495, 4382, 1, 10800),
(3495, 4363, 2, 10800),
(3495, 4404, 3, 10800),
(3495, 4361, 2, 10800);

-- gyrochronatom fradd swiftgear
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 2682 AND `item` = 4389;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
