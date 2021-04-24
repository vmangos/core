DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200610185313');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200610185313');
-- Add your query below.


-- Pattern: Icy Cloak - Micha Yance
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 2381 AND `item` = 4355;

-- Formula: Enchant Bracer - Lesser Deflection - Micha Yance
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 43200 WHERE `entry` = 2381 AND `item` = 11163;

-- Weighted Throwing Axe - Sarah Raycroft
DELETE FROM `npc_vendor` WHERE `entry` = 3541 AND `item` = 3131;

-- Balanced Throwing Dagger - Sarah Raycroft
DELETE FROM `npc_vendor` WHERE `entry` = 3541 AND `item` = 2946;

-- Striped Yellowtail - Hal McAllister
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 3540 AND `item` = 21552;

-- Strong Fishing Pole - Lindea Rabonne
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 2383 AND `item` = 6365;

-- Flagon of Mead - Barkeep Kelly
DELETE FROM `npc_vendor` WHERE `entry` = 2366 AND `item` = 2594;

-- Southshore Stout - Barkeep Kelly
DELETE FROM `npc_vendor` WHERE `entry` = 2366 AND `item` = 3703;

-- Cherry Grog - Barkeep Kelly
DELETE FROM `npc_vendor` WHERE `entry` = 2366 AND `item` = 4600;

-- Cheap Beer - Barkeep Kelly
DELETE FROM `npc_vendor` WHERE `entry` = 2366 AND `item` = 19222;

-- Lesser Healing Potion - Nandar Branson
DELETE FROM `npc_vendor` WHERE `entry` = 2380 AND `item` = 858;

-- Lesser Mana Potion - Nandar Branson
DELETE FROM `npc_vendor` WHERE `entry` = 2380 AND `item` = 3385;

-- Fiery Cloak - Robert Aebischer
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3543 AND `item` = 4797;

-- Heavy Runed Cloak - Robert Aebischer
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3543 AND `item` = 4798;

-- Antiquated Cloak - Robert Aebischer
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3543 AND `item` = 4799;

-- Mighty Chain Pants - Robert Aebischer
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3543 AND `item` = 4800;

-- Legionnaire's Leggings - Robert Aebischer
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3543 AND `item` = 4816;

-- Weighted Throwing Axe - Kayren Soothallow
DELETE FROM `npc_vendor` WHERE `entry` = 2401 AND `item` = 3131;

-- Balanced Throwing Dagger - Kayren Soothallow
DELETE FROM `npc_vendor` WHERE `entry` = 2401 AND `item` = 2946;

-- Executor Staff - Ott
DELETE FROM `npc_vendor` WHERE `entry` = 3539 AND `item` = 3277;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
