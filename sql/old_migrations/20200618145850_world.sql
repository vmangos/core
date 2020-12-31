DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200618145850');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200618145850');
-- Add your query below.


-- Duskwood
-- Lesser Healing Potion - Bliztik
DELETE FROM `npc_vendor` WHERE `entry` = 2481 AND `item` = 858;


-- Fiery Cloak - Morg Gnarltree
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 226 AND `item` = 4797;


-- Heavy Runed Cloak - Morg Gnarltree
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 226 AND `item` = 4798;


-- Antiquated Cloak - Morg Gnarltree
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 226 AND `item` = 4799;


-- Mighty Chain Pants - Morg Gnarltree
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 226 AND `item` = 4800;


-- Legionnaire's Leggings - Morg Gnarltree
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 226 AND `item` = 4816;


-- Weighted Throwing Axe - Mabel Solaj
DELETE FROM `npc_vendor` WHERE `entry` = 227 AND `item` = 3131;


-- Balanced Throwing Dagger - Mabel Solaj
DELETE FROM `npc_vendor` WHERE `entry` = 227 AND `item` = 2946;


-- Pattern: Dark Silk Shirt - Sheri Zipstitch
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 2669 AND `item` = 6401;


-- Pattern: Bright Yellow Shirt - Danielle Zipstitch
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 2668 AND `item` = 14627;


-- Gyrochronatom - Herble Baubletump
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 3133 AND `item` = 4389;


-- Redridge
-- Pattern: Black Whelp Cloak - Clyde Ranthal
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 2697 AND `item` = 7289;


-- Wolf Bracers - Bernard Brubaker
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3097 AND `item` = 4794;


-- Bear Bracers - Bernard Brubaker
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3097 AND `item` = 4795;


-- Owl Bracers - Bernard Brubaker
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3097 AND `item` = 4796;


-- Owl's Disk - Kara Adams
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 793 AND `item` = 4822;


-- Bear Buckler - Kara Adams
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 793 AND `item` = 4821;


-- Guardian Buckler - Kara Adams
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 793 AND `item` = 4820;


-- Pattern: Black Whelp Tunic - Amy Davenport
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 777 AND `item` = 20576;


-- Unlit Poor Torch - Lindsay Ashlock
DELETE FROM `npc_vendor` WHERE `entry` = 791 AND `item` = 6183;


-- Crude Throwing Axe - Lindsay Ashlock
DELETE FROM `npc_vendor` WHERE `entry` = 791 AND `item` = 3111;


-- Small Throwing Knife - Lindsay Ashlock
DELETE FROM `npc_vendor` WHERE `entry` = 791 AND `item` = 2947;


-- Strong Fishing Pole - Vernon Hale
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 1678 AND `item` = 6365;


-- Striped Yellowtail - Vernon Hale
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 1678 AND `item` = 21552;


-- Jagged Arrow - Kimberly Hiett
DELETE FROM `npc_vendor` WHERE `entry` = 789 AND `item` = 11285;


-- Striped Yellowtail - Innkeeper Brianna
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 6727 AND `item` = 21552;


-- Whispering Vest - Franklin Hamar
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3091 AND `item` = 4781;


-- Solstice Robe - Franklin Hamar
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3091 AND `item` = 4782;


-- Wise Man's Belt - Franklin Hamar
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 14400 WHERE `entry` = 3091 AND `item` = 4786;


-- Striped Yellowtail - Gretcen Vogel
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 3086 AND `item` = 21552;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
