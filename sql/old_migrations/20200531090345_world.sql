DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200531090345');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200531090345');
-- Add your query below.


-- Enamelled Broadsword - Morhan Coppertongue
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 1800 WHERE `entry` = 167 AND `item` = 4765;

-- Feral Blade - Morhan Coppertongue
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 1800 WHERE `entry` = 167 AND `item` = 4766;

-- Keen Throwing Knife - Yanni Stoutheart
DELETE FROM `npc_vendor` WHERE `entry` = 1682 AND `item` = 3107;

-- Sharp Throwing Axe - Yanni Stoutheart
DELETE FROM `npc_vendor` WHERE `entry` = 1682 AND `item` = 3135;

-- Recipe: Rage Potion - Xandar Goodbeard
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 1685 AND `item` = 5640;

-- Keen Throwing Knife - Xandar Goodbeard
DELETE FROM `npc_vendor` WHERE `entry` = 1685 AND `item` = 3107;

-- Sharp Throwing Axe - Xandar Goodbeard
DELETE FROM `npc_vendor` WHERE `entry` = 1685 AND `item` = 3135;

-- Agile Boots - Kat Sampson
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 954 AND `item` = 4788;

-- Whispering Vest - Aldren Cordon
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 1214 AND `item` = 4781;

-- Solstice Robe - Aldren Cordon
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 1214 AND `item` = 4782;

-- Wise Man's Belt - Aldren Cordon
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 1214 AND `item` = 4786;

-- Striped Yellowtail - Khara Deepwater
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 1684 AND `item` = 21552;

-- Strong Fishing Pole - Khara Deepwater
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 1684 AND `item` = 6365;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
