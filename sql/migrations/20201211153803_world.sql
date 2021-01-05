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

-- agile boots pizznukle
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

-- small throwing knife and crude throwing axe - christi galvanis
DELETE FROM `npc_vendor` WHERE `entry` = 12960 AND `item` IN (2947, 3111);

-- greater healing potion - vendor-tron 1000
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 12245 AND `item` = 1710;

-- mana potion - vendor-tron 1000
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 12245 AND `item` = 3827;


-- desolace
-- blacksmith hammer - vendor-tron 1000
DELETE FROM `npc_vendor` WHERE `entry` = 12245 AND `item` = 5956;

-- imbued vial - vendor-tron 1000
DELETE FROM `npc_vendor` WHERE `entry` = 12245 AND `item` = 18256;

-- rune thread - vendor-tron 1000
DELETE FROM `npc_vendor` WHERE `entry` = 12245 AND `item` = 14341;

-- recipe: free action potion - vendor-tron 1000
DELETE FROM `npc_vendor` WHERE `entry` = 12245 AND `item` = 5642;

-- recipe: great rage potion - vendor-tron 1000
DELETE FROM `npc_vendor` WHERE `entry` = 12245 AND `item` = 5643;

-- scroll of agility 2 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 12246 AND `item` = 2289;

-- scroll of stamina 2 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 12246 AND `item` = 1711;

-- scroll of strength 2 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 12246 AND `item` = 2289;

-- scroll of intellect 2 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 12246 AND `item` = 2290;

-- recipe: big bear steak - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 3734;

-- scroll of protection 3 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 4421;

-- scroll of spirit 3 - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 4424;

-- recipe: barbecued buzzard wing - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 4609;

-- pattern: dark silk shirt - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 6401;

-- pattern: crimson silk shirt - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 7087;

-- schematic: goblin jumper cables - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 7561;

-- recipe: lean wolf steak - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 12227;

-- recipe: hot wolf ribsk - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 12229;

-- recipe: mystery stew - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 12233;

-- recipe: dragonbreath chilli - super-seller 680
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 12246 AND `item` = 12239;

-- schematic: ice deflector - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 13308;

-- schematic: accurate scope - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 13310;

-- pattern: enchanters cowl - vendor-tron 680
DELETE FROM `npc_vendor` WHERE `entry` = 12246 AND `item` = 14630;

-- missing items shadi mistrunner
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(12246, 15326),
(12246, 15327),
(12246, 3108),
(12246, 3137),
(12246, 3107),
(12246, 3135);

-- missing items kireena
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(9636, 4342),
(9636, 2325),
(9636, 8343),
(9636, 8925),
(9636, 4340),
(9636, 2928),
(9636, 2604),
(9636, 6529),
(9636, 7005),
(9636, 6256),
(9636, 8878),
(9636, 4341);

-- small throwing knife and crude throwing axe - tukk
DELETE FROM `npc_vendor` WHERE `entry` = 12027 AND `item` IN (2947, 3111);

-- imbued vial - lah
DELETE FROM `npc_vendor` WHERE `entry` = 12028 AND `item` = 18256;

-- rune thread - lah
DELETE FROM `npc_vendor` WHERE `entry` = 12028 AND `item` = 14341;

-- aquadynamic fish attractor - mai
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 12031 AND `item` = 6533;


-- orgrimmar
-- imbued vial - shimra
DELETE FROM `npc_vendor` WHERE `entry` = 5817 AND `item` = 18256;

-- rune thread - shimra
DELETE FROM `npc_vendor` WHERE `entry` = 5817 AND `item` = 14341;

-- balanced throwing dagger - asoran
DELETE FROM `npc_vendor` WHERE `entry` = 3350 AND `item` = 2946;

-- weighted throwing \xe - asoran
DELETE FROM `npc_vendor` WHERE `entry` = 3350 AND `item` = 3131;

-- strange dust - kithas
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 3346 AND `item` = 10940;

-- imbued vial - felika
DELETE FROM `npc_vendor` WHERE `entry` = 3367 AND `item` = 18256;

-- rune thread - felika
DELETE FROM `npc_vendor` WHERE `entry` = 3367 AND `item` = 14341;

-- missing items - felika
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(3367, 2605),
(3367, 6260),
(3367, 6529),
(3367, 2324);

-- pale leggings - torphan
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3315 AND `item` = 12255;

-- massive longbow - jinsora
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 3410 AND `item` = 11307;

-- sturdy recurve - jinsora
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 3410 AND `item` = 11306;

-- fine shortbow - jinsora
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 10800 WHERE `entry` = 3410 AND `item` = 11303;

-- missing items - sovik
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3413, 16041, 1, 10800),
(3413, 16042, 1, 10800),
(3413, 4389, 1, 10800),
(3413, 4382, 1, 10800),
(3413, 4371, 2, 10800),
(3413, 4363, 2, 10800),
(3413, 4361, 2, 10800);

-- missing items - zendojian
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(3409, 15326),
(3409, 15327),
(3409, 3108),
(3409, 3137),
(3409, 3107),
(3409, 3135),
(3409, 2946),
(3409, 3131),
(3409, 2947),
(3409, 3111);

-- aquadynamic fish attractor - shankys
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3333 AND `item` = 6533;

-- strong fishing pole - shankys
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3333, 6365, 1, 7200);

-- recipe: great rage potion - hagrus
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3335 AND `item` = 5643;

-- recipe: rage potion - hagrus
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 3335 AND `item` = 5640;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
