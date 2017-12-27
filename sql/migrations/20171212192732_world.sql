DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171212192732');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171212192732');
-- Add your query below.

-- "Anengineer" (wrong quest text)
-- https://github.com/LightsHope/server/issues/964

-- Tainted Memorandum id 3115

-- Progress text Anengineer --> $N
UPDATE `quest_template` SET `RequestItemsText`='Wonderful! You got my memorandum obviously.$b$bIgnore the fools around you, $N. The Holy Light?! The sword and shield?! These aren\'t paths for ones as open minded as us. Look at what "normal" magic did to our home. Coupled with those damned tinkerers, our race almost became extinct. And now we have to rely on the dwarves-- they\'d rather spend time allying with humans than help us rebuild our own home. We\'re like second-class citizens. Have you seen the way they look at us?' WHERE `entry`=3115 AND `patch`=0;

-- Completion text Anengineer --> $N
UPDATE `quest_template` SET `OfferRewardText`='But none of that matters. What matters is that you\'ve seen your own Holy Light! You know where power truly comes from. You realize that having our own allies is much more... prudent. Special allies. Allies that, no matter the task, will obey till their last breath.$b$bAnd that\'s where I come in, $N. I can train you in the beginnings of those special powers. Seek me out often and I will do what I can to teach you more spells.' WHERE `entry`=3115 AND `patch`=0;

-- Beginnings id 1599

-- Completion text Anengineer --> $N
UPDATE `quest_template` SET `OfferRewardText`='Very good, very good! You\'ve done well, $N. Perhaps the interest that is being shown in you is deserved, after all.$b$bThat\'ll be for the others to decide--assuming your imp doesn\'t overpower you and nip your career in the bud. For now, I\'m satisfied that you\'ll probably survive your first few months as a $C.$b$bA word about the imp, $N. As a $R knows, don\'t let its size fool you, its magic can be very dangerous.' WHERE `entry`=1599 AND `patch`=0;

-- Quest 9321 has TBC name
-- https://github.com/LightsHope/server/issues/839

-- Quest: Major Healing Potion
UPDATE `quest_template` SET `Title`='Major Healing Potion' WHERE  `entry`=9321 AND `patch`=9;

-- Lorgalis Manuscript is zone drop instead of only object drop. 
-- https://github.com/LightsHope/server/issues/907

-- Delete from incorrect mobs
DELETE FROM `creature_loot_template` WHERE `entry`=4805 AND `item`=5359 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4807 AND `item`=5359 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4822 AND `item`=5359 AND `groupid`=0;
DELETE FROM `creature_loot_template` WHERE `entry`=4824 AND `item`=5359 AND `groupid`=0;

-- Delete from incorrect container
-- `gameobject_loot_template` `entry`=2774 contains quest items involved in 2 quests 
-- Move one (secret note) to new entry
UPDATE `gameobject_loot_template` SET `entry`='2775' WHERE `entry`=2774 AND `item`=12765;

-- Move secret note container to the new loot template
UPDATE `gameobject_template` SET `data1`='2775' WHERE `entry`=176344;

-- Box for the quest "Ammo For Rumbleshot"
-- https://github.com/LightsHope/server/issues/140

-- Don't give player item at quest accept
UPDATE `quest_template` SET `SrcItemId`='0', `SrcItemCount`='0' WHERE  `entry`=5541 AND `patch`=0;

-- Remove "this item starts quest tag" on ammo item
UPDATE `item_template` SET `startquest`='0' WHERE  `entry`=13850 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
