DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200725172743');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200725172743');
-- Add your query below.


-- stormwind
-- gyrochronatom - billibub cogspinner
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5519 AND `item` = 4389;

-- scroll of strength - adair gilroy
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 1316 AND `item` = 954;

-- scroll of stamina 2 - adair gilroy
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 1316 AND `item` = 1711;

-- scroll of intellect 2 - adair gilroy
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 1316 AND `item` = 2290;

-- scroll of agility - adair gilroy
UPDATE `npc_vendor` SET `maxcount` = 5 WHERE `entry` = 1316 AND `item` = 3012;

-- strong fishing pole - catherine leland
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 5494 AND `item` = 6365;

-- massive longbow - frederick stover
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 1298 AND `item` = 11307;

-- sturdy recurve - frederick stover
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 1298 AND `item` = 11306;

-- fine shortbow - frederick stover
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 10800 WHERE `entry` = 1298 AND `item` = 11303;

-- rune thread - edna mulby
DELETE FROM `npc_vendor` WHERE `entry` = 1286 AND `item` = 14341;

-- imbued vial - edna mulby
DELETE FROM `npc_vendor` WHERE `entry` = 1286 AND `item` = 18256;

-- missing items - edna mulby
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(1286, 2324),
(1286, 6260),
(1286, 2605),
(1286, 6529);

-- missing items - keldric boucher
INSERT INTO `npc_vendor` (`entry`, `item`, maxcount, incrtime) VALUES
(1257, 858, 3, 7200);

-- pattern blue overalls - alexandra bolero
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 1347 AND `item` = 6274;

-- pattern white wedding dress - alexandra bolero
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 1347 AND `item` = 10325;

-- silverleaf - maria lumere
UPDATE `npc_vendor` SET `maxcount` = 3, `incrtime` = 7200 WHERE `entry` = 1313 AND `item` = 765;

-- mageroyal - maria lumere
UPDATE `npc_vendor` SET `maxcount` = 4, `incrtime` = 7200 WHERE `entry` = 1313 AND `item` = 785;

-- earthroot - maria lumere
UPDATE `npc_vendor` SET `maxcount` = 5, `incrtime` = 7200 WHERE `entry` = 1313 AND `item` = 2449;

-- bruisweed - maria lumere
UPDATE `npc_vendor` SET `maxcount` = 4, `incrtime` = 7200 WHERE `entry` = 1313 AND `item` = 2453;

-- schematic blue firework - darian singh
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 1304 AND `item` = 18649;

-- scroll of strength - deneb walker
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 2805 AND `item` = 954;

-- scroll of stamina 2 - deneb walker
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 2805 AND `item` = 1711;

-- scroll of intellect 2 - deneb walker
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 2805 AND `item` = 2290;


-- stv
-- Corporal Bluth
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(734, 3137),
(734, 3108),
(734, 3107),
(734, 3135),
(734, 15327),
(734, 15326);

-- Gnaz Blunderflame - Bronze Tube
UPDATE `npc_vendor` SET `maxcount` = 1 WHERE `entry` = 2687 AND `item` = 4371;

-- Gnaz Blunderflame
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2687, 4389, 1, 10800),
(2687, 4382, 1, 10800),
(2687, 4404, 2, 10800),
(2687, 4363, 1, 10800),
(2687, 4361, 2, 10800);

-- Knaz Blunderflame
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(8679, 4389, 1, 10800),
(8679, 4382, 1, 10800),
(8679, 4404, 1, 10800),
(8679, 4363, 1, 10800),
(8679, 4371, 2, 10800),
(8679, 4361, 1, 10800);

-- Cowardly Crosby - Admirals Hat
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime`=9000 WHERE `entry` = 2672 AND `item` = 10318;

-- Haren Kanmae - Dense Shortbow
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2839, 11305, 1, 7200);

-- Mazk Snipeshot - Bronze Tube
UPDATE `npc_vendor` SET `maxcount` = 1 WHERE `entry` = 2685 AND `item` = 4371;

-- Mazk Snipeshot
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2685, 4389, 1, 10800),
(2685, 4382, 1, 10800),
(2685, 4404, 3, 10800),
(2685, 4363, 2, 10800);
DELETE FROM `npc_vendor` WHERE `item` IN (3033, 2519, 2516, 2102, 11363) AND `entry` = 2685;

-- Kizz Bluntstrike - Ironwood Maul
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2840, 4777, 2, 86400);

-- Old Man Heming
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(2626, 6533, 2, 7200),
(2626, 6365, 1, 7200);

-- Xizk Goodstitch - Pattern: Crimson Silk Cloak
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 2670 AND `item` = 7087;

-- Xizk Goodstitch - Pattern: Enchanter's Cowl
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 2670 AND `item` = 14630;

-- Fargon Mortalak - Heavy Notched Belt
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 2845 AND `item` = 12257;

-- Nerrist 
DELETE FROM `npc_vendor` WHERE `item` IN (18256, 14341, 5956) AND `entry` = 1148;

-- Uthok 
DELETE FROM `npc_vendor` WHERE `item` IN (3131, 2946) AND `entry` = 1149;


-- misc
-- lesser healing potion - bro kin
DELETE FROM `npc_vendor` WHERE `entry` = 2480 AND `item` = 858;

-- lesser mana potion - bro kin
DELETE FROM `npc_vendor` WHERE `entry` = 2480 AND `item` = 3385;

-- Rizz Loosebolt - Gyrochronatom
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800  WHERE `entry` = 2684 AND `item` = 4389;

-- Rizz Loosebolt - Schematic: Ice Deflector
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 43200  WHERE `entry` = 2684 AND `item` = 13308;

-- Kris Legace
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(3536, 4830, 1, 43200),
(3536, 4832, 1, 43200);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
