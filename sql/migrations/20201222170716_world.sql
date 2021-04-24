DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201222170716');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201222170716');
-- Add your query below.


-- misc
-- smudge thunderwood should only sell recipe: thistle tea to rogues who have completed quests 2359 or 2478
UPDATE `npc_vendor` SET `condition_id` = 482 WHERE  `entry` = 6779 AND `item` = 18160;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (479, 8, 2359, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (480, 8, 2478, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (481, -2, 479, 480, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (482, -1, 100, 481, 0, 0, 0);


-- thousand needles
-- mageroyal - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 785;

-- scroll of stamina 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 1711;

-- scroll of int 2 - montarr
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4878 AND `item` = 2290;

-- missing items - montarr
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4878, 1478, 2, 7200),
(4878, 3355, 1, 7200),
(4878, 954, 2, 7200),
(4878, 2449, 3, 7200),
(4878, 2453, 2, 7200);

-- fine longbow - starn
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 9551 AND `item` = 11304;

-- balanced throwing dagger - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 2946;

-- weighted throwing axe - jawn highmesa
DELETE FROM `npc_vendor` WHERE `entry` = 4876 AND `item` = 3131;

-- missing items - jinky twizzlefixxit
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(6730, 4389, 1, 10800),
(6730, 4382, 1, 10800),
(6730, 4371, 2, 10800),
(6730, 4361, 2, 10800);


-- tanaris
-- balanced throwing dagger - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 2946;

-- weighted throwing axe - jabbey 
DELETE FROM `npc_vendor` WHERE `entry` = 8139 AND `item` = 3131;


-- ungoro
-- balanced throwing dagger - nergal
DELETE FROM `npc_vendor` WHERE `entry` = 12959 AND `item` = 2946;

-- weighted throwing axe - nergal
DELETE FROM `npc_vendor` WHERE `entry` = 12959 AND `item` = 3131;


-- feralas
-- pattern: azure silk cloak - brienna starglow
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 43200 WHERE `entry` = 6576 AND `item` = 7089;

-- missing items - zorbin fandazzle
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(14637, 4389, 1, 10800),
(14637, 4382, 1, 10800),
(14637, 4404, 3, 10800),
(14637, 4371, 2, 10800),
(14637, 4363, 2, 10800);

-- correct items - harklane
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 7943 AND `item` IN (159, 1179, 1205, 1645, 1708, 21552);

-- strong fishing pole - savanne
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7945 AND `item` = 6365;

-- correct items - mardrack greenwell
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 7941 AND `item` IN (21030, 21031, 21033);
DELETE FROM `npc_vendor` WHERE `entry` = 7941 AND `item` IN (117, 2287, 3770, 3771, 4599, 8952, 16171);

-- imbued vial - vivianna
DELETE FROM `npc_vendor` WHERE `entry` = 7947 AND `item` = 18256;

-- rune thread - vivianna
DELETE FROM `npc_vendor` WHERE `entry` = 7947 AND `item` = 14341;

-- lesser healing potion - logannas
DELETE FROM `npc_vendor` WHERE `entry` = 8157 AND `item` = 858;

-- lesser mana potion - logannas
DELETE FROM `npc_vendor` WHERE `entry` = 8157 AND `item` = 3385;

-- small throwing knofe and crude throwing axe - faralorn
DELETE FROM `npc_vendor` WHERE `entry` = 7942 AND `item` IN (2947, 3111);

-- pattern: green whelp bracers - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 7451;

-- pattern: turtle scale gloves - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 8385;

-- pattern: living shoulders - patt mcgrubben
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 7852 AND `item` = 15734;

-- imbued vial - sheendra tallgrass
DELETE FROM `npc_vendor` WHERE `entry` = 8145 AND `item` = 18256;

-- rune thread - sheendra tallgrass
DELETE FROM `npc_vendor` WHERE `entry` = 8145 AND `item` = 14341;

-- missing items calandrath
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(15174, 15326),
(15174, 15327),
(15174, 3108),
(15174, 3137),
(15174, 3107),
(15174, 3135);

-- blacksmith hammer - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 5956;

-- imbued vial - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 18256;

-- rune thread - mishta
DELETE FROM `npc_vendor` WHERE `entry` = 15179 AND `item` = 14341;

-- Gubber Blump should be selling fishing poles and baits permanently https://classic.wowhead.com/npc=10216/gubber-blump#sells
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6256');
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6529');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
