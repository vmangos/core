DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200606122821');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200606122821');
-- Add your query below.


-- Gyrochronatom - Neal Allen
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 1448 AND `item` = 4389;

-- Unlit Poor Torch - Neal Allen
DELETE FROM `npc_vendor` WHERE `entry` = 1448 AND `item` = 6183;

-- Missing Items - Neal Allen
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(1448, 3107),
(1448, 3135),
(1448, 3108),
(1448, 3137);

-- Lesser Healing Potion - Dewin Shimmerdawn
DELETE FROM `npc_vendor` WHERE `entry` = 1453 AND `item` = 858;

-- Lesser Mana Potion - Dewin Shimmerdawn
DELETE FROM `npc_vendor` WHERE `entry` = 1453 AND `item` = 3385;

-- Strong Fishing Pole - Stuart Fleming
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3178 AND `item` = 6365;

-- Striped Yellowtail - Stuart Fleming
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 3178 AND `item` = 21552;

-- Unlit Poor Torch - Gruham Rumdnul 
DELETE FROM `npc_vendor` WHERE `entry` = 1452 AND `item` = 6183;

-- Balanced Throwing Dagger - Gruham Rumdnul 
DELETE FROM `npc_vendor` WHERE `entry` = 1452 AND `item` = 2946;

-- Weighted Throwing Axe - Gruham Rumdnul 
DELETE FROM `npc_vendor` WHERE `entry` = 1452 AND `item` = 3131;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
