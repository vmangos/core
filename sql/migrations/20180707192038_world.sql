DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180707192038');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180707192038');
-- Add your query below.

-- Rogue Beginner Quests (Possibly Beyond) Reference Wrong Name - ok
-- https://github.com/LightsHope/issues/issues/548
UPDATE `quest_template` SET `OfferRewardText`='You\'re gonna find that there a number of outfits that\'ll covet our skills, $N. Adventurers, SI:7... heck, even the Defias Brotherhood wouldn\'t mind a spy or two inside Stormwind. But you remember this, you\'re your own man. Don\'t let nobody bully you into doing something you don\'t wanna do! Besides, we hold all the cards... at least, we do before the game\'s done. Know what I mean?$b$bAnyway, just wanted to introduce myself and let you know that I\'m here if you need any training. Come by anytime.' WHERE `entry`=3102 AND `patch`=0;


-- Wrong stats on Crown of the Penitent - ok
-- https://github.com/LightsHope/issues/issues/552
DELETE FROM `item_template` WHERE `entry`=13216;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `stat_type1`, `stat_value1`, `armor`, `delay`, `spellid_1`, `spelltrigger_1`, `spellcooldown_5`, `spellcategorycooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) VALUES 
(13216, 0, 4, 1, 'Crown of the Penitent', 23777, 2, 66252, 13250, 1, 61, 5, 20, 64, 0, 17328, 1, 0, 0, 1, 7, 45, 11),
(13216, 1, 4, 1, 'Crown of the Penitent', 23777, 2, 66252, 13250, 1, 61, 5, 20, 64, 0, 21626, 1, 0, 0, 1, 7, 45, 11);


-- Incorrect race reference during Blood Tinged Skies quest - ok
-- https://github.com/LightsHope/issues/issues/515
UPDATE `quest_template` SET `OfferRewardText`='You are a shining example of decency, $R! It has been long since I have felt the blood of heroes pump through my veins. Your acts of bravery are uplifting!' WHERE `entry`=5543 AND `patch`=0;

-- Also found another error, troll was hardcoded in quest 3501
UPDATE `quest_template` SET `OfferRewardText`='You truly disgust me, $R. A grown man drooling over a pile of junk? Pitiful! Take your reward and get out of my sight.' WHERE `entry`=3501 AND `patch`=0;


-- Items not marked as quest item - ok
-- https://github.com/LightsHope/issues/issues/528
UPDATE `item_template` SET `bonding`=4 WHERE `entry`=12445 AND `patch`=0;
UPDATE `item_template` SET `bonding`=4 WHERE `entry`=12286 AND `patch`=0;


-- Heavy War Golem underground - ok
-- https://github.com/LightsHope/issues/issues/480
UPDATE `creature` SET `position_z`=247.26, `spawndist`=5, `MovementType`=1 WHERE `guid`=5687;


-- Weapon Technician always stuck in object in BRD - ok
-- https://github.com/LightsHope/issues/issues/537
UPDATE `creature` SET `position_x`=809.2, `position_y`=46.6, `position_z`=-53.6, `orientation`=0.9 WHERE `guid`=47259;


-- Marez Cowl triple spawn - ok
-- https://github.com/LightsHope/issues/issues/290
-- TC has only one spawn
DELETE FROM `creature` WHERE `guid`=1183627;
DELETE FROM `creature` WHERE `guid`=1179379;


-- Quest: C'Thun's Legacy (8801) - Text error - ok
-- https://github.com/LightsHope/issues/issues/396
-- Also for quest 8802
UPDATE `quest_template` SET `OfferRewardText`='We will leave this place on our own, $GLord:Lady; $N - once we are certain that the evil within has been wholly destroyed. Your journey of legend is almost at an end.', `RequestItemsText`='$GLord:Lady; $N, you have freed us of its grasp.' WHERE `entry`=8801 AND `patch`=7;

UPDATE `quest_template` SET `RequestItemsText`='$GLord:Lady; $N! It is over...' WHERE `entry`=8802 AND `patch`=7;


-- Shriveled heart dropped by level 23
-- https://github.com/LightsHope/issues/issues/641
DELETE FROM `creature_loot_template` WHERE `entry`=232 AND `item`=9243 AND `groupid`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
