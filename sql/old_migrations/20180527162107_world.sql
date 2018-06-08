DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180527162107');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180527162107');
-- Add your query below.

-- Azshara
-- Start of vid 33: https://www.youtube.com/watch?v=NG7AvygQqFU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Betrayed pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=3504 AND `patch`=0;

-- Start of vid 34: https://www.youtube.com/watch?v=gN3Z2vVNQAE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Spiritual Unrest
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=5535 AND `patch`=0;

-- A Land Filled with Hatred
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=5536 AND `patch`=0;

-- Betrayed pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=11 WHERE `entry`=3505 AND `patch`=0;

-- Bring the End
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE  `entry`=3341 AND `patch`=0;

-- Seeping Corruption pt. 1 - accept ok
-- DB/Quest: Seeping Corruption (Part 1, 2 & 3) 
-- https://github.com/TrinityCore/TrinityCore/issues/21213
UPDATE `quest_template` SET `CompleteScript`=3568 WHERE `entry`=3568 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=3568;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3568, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: npc\_flag questgiver'),
(3568, 1, 1, 133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: State use'),
(3568, 5, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: State stand'),
(3568, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4522, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: Say text 1'),
(3568, 5, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: Emote talk'),
(3568, 6, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 1 - Chemist Cuely: npc\_flag questgiver');

-- Thersa Windsong - missing sickly effect and reduce spawn time
UPDATE `creature_addon` SET `auras`=19502 WHERE `guid`=31905 AND `patch`=0;
UPDATE `creature` SET `spawntimesecsmin`=60, `spawntimesecsmax`=60 WHERE `guid`=31905;

-- Start of vid 41: https://www.youtube.com/watch?v=FFx7pDxRRrE&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Stealing Knowledge
UPDATE `quest_template` SET `DetailsEmote1`=1,  `OfferRewardEmote1`=4 WHERE `entry`=3517 AND `patch`=0;

-- Delivery to Magatha
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=2 WHERE `entry`=3518 AND `patch`=0;

-- Delivery to Jes'rimon
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3541 AND `patch`=0;

-- Delivery to Jes'rimon - correct typo mon was gender tagged with dad...
-- https://github.com/TrinityCore/TrinityCore/issues/20448
UPDATE `quest_template` SET `RequestItemsText`='Yes, what you be needin\', mon? I got many tings to be takin\' care of today, and you not be on me agenda as one of them. Pester me, and I make sure that changes.' WHERE  `entry`=3541 AND `patch`=0;

-- Delivery to Andron Gant
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=3542 AND `patch`=0;

-- Delivery to Archmage Xylem
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3561 AND `patch`=0;

-- Meeting with the Master - already ok

-- Xylem's Payment to Jediga
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=6 WHERE `entry`=3565 AND `patch`=0;

-- Return Trip - already ok

-- Magatha's Payment to Jediga
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3562 AND `patch`=0;

-- Jes'rimon's Payment to Jediga
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3563 AND `patch`=0;

-- The Hunter's Charm - should be available from Ormak Grimshot <Hunter Trainer> entry: 3352
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=8151 AND `patch`=5;
DELETE FROM `creature_questrelation` WHERE `id`=3352 and `quest`=8151;
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES
(3352, 8151, 5);

-- Andron's Payment to Jediga
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `OfferRewardEmote1`=1, `OfferRewardEmote2`=11 WHERE `entry`=3564 AND `patch`=0;

-- Seeping Corruption pt. 2 
-- DB/Quest: Seeping Corruption (Part 1, 2 & 3)
-- https://github.com/TrinityCore/TrinityCore/issues/21213
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=11, `OfferRewardEmote1`=1, `CompleteScript`=3569 WHERE `entry`=3569 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=3569;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3569, 1, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 2 - Thersa Windsong: Eat(Drink) emote'),
(3569, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4533, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 2 - Thersa Windsong: Say text 1'),
(3569, 4, 1, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 2 - Thersa Windsong: Roar emote'),
(3569, 9, 15, 5, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Seeping Corruption pt. 2 - Thersa Windsong: Kill self (with spell)');

-- Seeping Corruption pt. 3
UPDATE `quest_template` SET `OfferRewardEmote1`=4, `OfferRewardEmote2`=11 WHERE `entry`=3570 AND `patch`=0;
UPDATE `quest_template` SET `OfferRewardText`='I never dreamed the elixir would take hold that quickly. Thank you, $n. I will get to work on the rest of these samples right away. I\'m sure they\'ll be usable by the Lady Sylvanas and the Forsaken soon enough.' WHERE `entry`=3570 AND `patch`=0;

-- Start of vid 46: https://www.youtube.com/watch?v=PoWIDD4384Q&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Courser Antlers

-- Kim'jael Indeed! - already ok

-- Betrayed pt. 3 
UPDATE `quest_template` SET `CompleteEmote`=5, `OfferRewardEmote1`=4 WHERE `entry`=3506 AND `patch`=0;

-- Kim'jael's "Missing" Equipment
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=6, `OfferRewardEmote1`=4 WHERE `entry`=5534 AND `patch`=0;

-- Wavethrashing

-- Betrayed pt. 4
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=5, `OfferRewardEmote1`=11, `OfferRewardEmote2`=21 WHERE `entry`=3507 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
