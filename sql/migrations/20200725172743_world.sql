DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200725172743');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200725172743');
-- Add your query below.


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
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 5175 AND `item` = 1304;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
