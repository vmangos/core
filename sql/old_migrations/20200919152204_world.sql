DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200919152204');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200919152204');
-- Add your query below.


-- blasted lands
-- lesser healing potion - nina lightbrew
DELETE FROM `npc_vendor` WHERE `entry` = 8178 AND `item` = 858;

-- lesser mana potion - nina lightbrew
DELETE FROM `npc_vendor` WHERE `entry` = 8178 AND `item` = 3385;


-- swamp of sorrows
-- gharash - plans: mithril scale bracers
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 43200  WHERE `entry` = 8176 AND `item` = 7995;

-- pale leggings - thralosh
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 984 AND `item` = 12255;

-- cindercloth leggings - thralosh
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 984 AND `item` = 12256;

-- lesser healing potion - rartar
DELETE FROM `npc_vendor` WHERE `entry` = 8177 AND `item` = 858;

-- lesser mana potion - rartar
DELETE FROM `npc_vendor` WHERE `entry` = 8177 AND `item` = 3385;

-- rune thread - banalash
DELETE FROM `npc_vendor` WHERE `entry` = 989 AND `item` = 14341;

-- imbued vial - banalash
DELETE FROM `npc_vendor` WHERE `entry` = 989 AND `item` = 18256;

-- formula enchant bracer deflection - banalash
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 989 AND `item` = 11223;

-- karakul is not a vendor
DELETE FROM `npc_vendor` WHERE `entry` = 6930;
DELETE FROM `gossip_menu_option` WHERE `id` = 4 AND `menu_id` = 1290;
UPDATE `creature_template` SET `npc_flags` = 131, `vendor_id` = 0 WHERE `entry` = 6930;


-- badlands
-- weighted throwing axe - grawl
DELETE FROM `npc_vendor` WHERE `entry` = 2908 AND `item` = 3131;

-- balanced throwing dagger - grawl
DELETE FROM `npc_vendor` WHERE `entry` = 2908 AND `item` = 2946;


-- searing george
-- missing items - master smith burninate
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(14624, 3135),
(14624, 3107),
(14624, 3108),
(14624, 3137),
(14624, 15327),
(14624, 15326);


-- burning steppes
-- missing items - yuka screwspigot
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(9544, 4389, 1, 10800),
(9544, 4382, 1, 10800),
(9544, 4404, 3, 10800),
(9544, 4363, 2, 10800),
(9544, 4361, 2, 10800);


-- alterac mountains
-- gyrochronatom - zan shivsproket
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800  WHERE `entry` = 6777 AND `item` = 4389;


-- hinterlands
-- blacksmiths hammer - gigget zipcoil
DELETE FROM `npc_vendor` WHERE `entry` = 12958 AND `item` = 5956;

-- rune thread - gigget zipcoil
DELETE FROM `npc_vendor` WHERE `entry` = 12958 AND `item` = 14341;

-- imbued vial - gigget zipcoil
DELETE FROM `npc_vendor` WHERE `entry` = 12958 AND `item` = 18256;

-- missing items - ruppo zipcoil
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2688, 4371, 2, 10800),
(2688, 4382, 1, 10800),
(2688, 4404, 3, 10800),
(2688, 4363, 1, 10800),
(2688, 4361, 2, 10800);

-- aquadynamic fish attractor - katoom the angler
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 14740 AND `item` = 6533;

-- pattern nightscape shoulders - nioma
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 8160 AND `item` = 8409;

-- plans mithril scale bracers - harggan
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 8161 AND `item` = 7995;


-- eastern plaguelands
-- blacksmiths hammer - jase farlane
DELETE FROM `npc_vendor` WHERE `entry` = 12941 AND `item` = 5956;

-- rune thread - jase farlane
DELETE FROM `npc_vendor` WHERE `entry` = 12941 AND `item` = 14341;

-- imbued vial - jase farlane
DELETE FROM `npc_vendor` WHERE `entry` = 12941 AND `item` = 18256;

-- missing items - caretaker alen
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(11038, 15326),
(11038, 15327),
(11038, 3108),
(11038, 3137),
(11038, 3107),
(11038, 3135);

-- silverpine
-- lesser healing potion - edwin harley
DELETE FROM `npc_vendor` WHERE `entry` = 2140 AND `item` = 3107;

-- lesser healing potion - edwin harley
DELETE FROM `npc_vendor` WHERE `entry` = 2140 AND `item` = 3135;

-- agile boots - alexandre lefevre
UPDATE `npc_vendor` SET `maxcount` = 2  WHERE `entry` = 3552 AND `item` = 4788;

-- fine longbow - nadia vernon
UPDATE `npc_vendor` SET `maxcount` = 1  WHERE `entry` = 9553 AND `item` = 11304;

-- executioners sword - wallace the blind
UPDATE `npc_vendor` SET `maxcount` = 1  WHERE `entry` = 3534 AND `item` = 4818;

-- formula enchant 2H weapon lesser intellect - leo sarn
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 5758 AND `item` = 6349;

-- refreshing spring water - dalaran brewmaster
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(3577, 159);


-- tirisfal
-- pattern blue linen vest - constance brisboise
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200  WHERE `entry` = 3522 AND `item` = 6270;

-- silverleaf - selina weston
UPDATE `npc_vendor` SET `maxcount` = 3  WHERE `entry` = 3548 AND `item` = 765;

-- mageroyal - selina weston
UPDATE `npc_vendor` SET `maxcount` = 2  WHERE `entry` = 3548 AND `item` = 785;

-- missing items - selina weston
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3548, 2453, 2, 7200),
(3548, 2449, 3, 7200);

-- missing items - martine tramblay
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3550, 6365, 1, 7200),
(3550, 6533, 2, 7200);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
