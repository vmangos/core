DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221031075849');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221031075849');
-- Add your query below.

-- Pirate's Footlocker
-- sources: https://www.wowhead.com/classic/item=9276/pirates-footlocker#contains , https://youtu.be/uLYj_OFIdyo?t=681
UPDATE `item_template` SET `min_money_loot`=47, `max_money_loot`=302 WHERE `entry`=9276; -- Add missing money loot (min/max from video)

UPDATE `item_loot_template` SET `ChanceOrQuestChance`=23 WHERE `entry`=9276 AND `item`=9252; -- Lower Map Fragment
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=22 WHERE `entry`=9276 AND `item`=9253; -- Middle Map Fragment
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=22 WHERE `entry`=9276 AND `item`=9251; -- Upper Map Fragment
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=17 WHERE `entry`=9276 AND `item`=9250; -- Ship Schedule
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=10 WHERE `entry`=9276 AND `item`=9249; -- Captain's Key

UPDATE `item_loot_template` SET `ChanceOrQuestChance`=21, `groupid`=1 WHERE `entry`=9276 AND `item`=9358; -- A Head Rag
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=21, `groupid`=1 WHERE `entry`=9276 AND `item`=9357; -- A Parrot Skeleton
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=21, `groupid`=1 WHERE `entry`=9276 AND `item`=9356; -- A Wooden Leg
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=21, `groupid`=1 WHERE `entry`=9276 AND `item`=9355; -- Hoop Earring
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=1.1, `groupid`=1 WHERE `entry`=9276 AND `item`=9359; -- Southsea Lamp

-- Drop chance of Pirate's Footlocker
-- source: https://www.wowhead.com/classic/item=9276/pirates-footlocker
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=8 WHERE `entry` IN (7855,7856,7857,7858,15685) AND `item`= 9276;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
