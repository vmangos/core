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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
