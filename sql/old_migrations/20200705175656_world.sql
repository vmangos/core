DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200705175656');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200705175656');
-- Add your query below.


-- westfall
-- Striped Yellowtail - Kriggon Talsone
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4305 AND `item` = 21552;

-- Striped Yellowtail - Innkeeper Heather
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 8931 AND `item` = 21552;

-- Balanced Throwing Dagger, Weighted Throwing Axe, Small Throwing Knife, Crude Throwing Axe - Quartermaster Lewis
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(491, 2946),
(491, 3131),
(491, 2947),
(491, 3111);

-- Rune Thread - Christopher Hewen
DELETE FROM `npc_vendor` WHERE `entry` = 8934 AND `item` = 14341;

-- Imbued Vial - Christopher Hewen
DELETE FROM `npc_vendor` WHERE `entry` = 8934 AND `item` = 18256;

-- Pattern: Red Linen Bag - Gina MacGregor
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 843 AND `item` = 5771;

-- Pattern: Murloc Scale Belt - Gina MacGregor
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 843 AND `item` = 5786;

-- Pattern: Murloc Scale Breastplate - Gina MacGregor
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 843 AND `item` = 5787;

-- Pattern: Blue Overalls - Gina MacGregor
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 843 AND `item` = 6274;

-- Agile Boots - Defias Profiteer
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 1669 AND `item` = 4788;

-- Recipe: Rage Potion - Defias Profiteer
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 1669 AND `item` = 5640;


-- elwynn
-- Pattern: Blue Linen Vest - Tharynn Bouden
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 66 AND `item` = 6270;

-- Scroll of Strength - Dawn Brightstar
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 7200 WHERE `entry` = 958 AND `item` = 954;

-- Fine Shortbow - Rallic Finn
UPDATE `npc_vendor` SET `maxcount` = 2, `incrtime` = 7200 WHERE `entry` = 1198 AND `item` = 11303;

-- Unlit Poor Torch - Drake Lindgren
DELETE FROM `npc_vendor` WHERE `entry` = 1250 AND `item` = 6183;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
