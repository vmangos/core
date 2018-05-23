DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180517193005');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180517193005');
-- Add your query below.

-- Feralas
-- Start of vid 32: https://www.youtube.com/watch?v=5_ZPdLEprMg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- The Ogres of Feralas pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=5, `OfferRewardEmote1`=1 WHERE `entry`=2975 AND `patch`=0;

-- A New Cloak's Sheen 
UPDATE `quest_template` SET `DetailsEmote1`=2, `DetailsEmote2`=1, `OfferRewardEmote1`=11 WHERE `entry`=2973 AND `patch`=0;

-- Gordunni Cobalt

-- A Strange Request
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=3121 AND `patch`=0;

-- Natural Materials - Should only be available after Return to Witch Doctor Uzer'i 3122 is completed 
UPDATE `quest_template` SET `PrevQuestId`=3122 WHERE `entry`=3128 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=4 WHERE `entry`=3128 AND `patch`=0;

-- War on the Woodpaw
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=5, `OfferRewardEmote1`=21 WHERE `entry`=2862 AND `patch`=0;

-- The Mark of Quality 
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=5 WHERE `entry`=2822 AND `patch`=0;

-- Find OOX-22/FE!

-- The Gordunni Scroll
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=2978 AND `patch`=0;

-- Alpha Strike
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=66 WHERE `entry`=2863 AND `patch`=0;

-- The Ogres of Feralas pt. 2
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry`=2980 AND `patch`=0;

-- Dark Ceremony
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0 WHERE `entry`=2979 AND `patch`=0;

-- A Grim Discovery pt. 1
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1 WHERE `entry`=2974 AND `patch`=0;

-- Woodpaw Investigation
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2902 AND `patch`=0;

-- The Battle Plans
UPDATE `quest_template` SET `CompleteEmote`=6 WHERE `entry`=2903 AND `patch`=0;

-- Zukk'ash Infestation
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=4 WHERE `entry`=7730 AND `patch`=3;

-- Stinglasher
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=7731 AND `patch`=3;

-- A Grim Discovery pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `OfferRewardEmote1`=5, `OfferRewardEmote2`=1 WHERE `entry`=2976 AND `patch`=0;

-- Rescue OOX-22/FE!

-- Zukk'ash Report
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=7732 AND `patch`=3;

-- The Gordunni Orb
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=5 WHERE `entry`=3002 AND `patch`=0;

-- Start of vid 33: https://www.youtube.com/watch?v=NG7AvygQqFU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Necklace Recovery 
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=2283 AND `patch`=0;

-- Ripple Recovery pt. 1
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=649 AND `patch`=0;

-- Ripple Recovery pt. 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=6 WHERE `entry`=650 AND `patch`=0;

-- Return to Witch Doctor Uzer'i
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `CompleteScript`=3122 WHERE `entry`=3122 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=3122;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3122, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: npc\_flag questgiver removed'),
(3122, 1, 3, 0, 2000, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4389, 274.3, 25.5, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Move point 1'),
(3122, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4181, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Emote text 1'),
(3122, 3, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Emote cheer 1'),
(3122, 6, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Emote cheer 2'),
(3122, 9, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4391.5, 274.7, 25.6, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Move point 2'),
(3122, 10, 1, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: State Dance'),
(3122, 25, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: State stand'),
(3122, 26, 3, 0, 2500, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, -4375.68, 269.717, 25.4947, 4.72984, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Move to spawn'),
(3122, 29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4180, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: Say text 1'),
(3122, 29, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Return to Witch Doctor Uzer\'i - Witch Doctor Uzer\'i: npc\_flag questgiver added');

-- Testing the Vessel
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=3123 AND `patch`=0;

-- The Sunken Temple
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=3380 AND `patch`=0;

-- Start of vid 39: https://www.youtube.com/watch?v=5lRRXShK1Ag&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Hippogryph Muisek
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3124 AND `patch`=0;

-- Faerie Dragon Muisek
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3125 AND `patch`=0;

-- Treant Muisek
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=3126 AND `patch`=0;

-- Dark Heart
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=2 WHERE `entry`=3062 AND `patch`=0;

-- The Strength of Corruption
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=4120 AND `patch`=0;

-- Vengeance on the Northspring 
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=3063 AND `patch`=0;

-- Mountain Giant Muisek
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=4 WHERE `entry`=3127 AND `patch`=0;

-- Improved Quality
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=7734 AND `patch`=3;

-- Fuel for the Zapping 

-- Zapped Giants - already ok

-- Perfect Yeti Hide
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=7738 AND `patch`=3;

-- Weapons of Spirit
UPDATE `quest_template` SET `DetailsEmote1`=1, `StartScript`=3129, `OfferRewardEmote1`=1, `OfferRewardEmote2`=4 WHERE `entry`=3129 AND `patch`=0;

DELETE FROM `quest_start_scripts` WHERE `id`=3129;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3129, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: npc\_flag questgiver+gossip removed'),
(3129, 1, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4377.4, 253.8, 26.63, 4.26, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move point 1'),
(3129, 3, 3, 0, 600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4381.1, 253.1, 26.01, 2.85, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move point 2'),
(3129, 4, 3, 0, 600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4382.1, 256.6, 25.95, 2.49, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move point 3'),
(3129, 5, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Kneel state'),
(3129, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4175, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Emote text 1'),
(3129, 11, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Stand state'),
(3129, 12, 1, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: State use'),
(3129, 22, 1, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: State stand'),
(3129, 23, 3, 0, 600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4381.1, 253.1, 26.01, 5.99, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move point 4'),
(3129, 24, 3, 0, 600, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4377.4, 253.8, 26.63, 1.12, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move point 5'),
(3129, 25, 3, 0, 1800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -4375.68, 269.717, 25.4947, 4.72984, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Move to spawn'),
(3129, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4176, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Say text 1'),
(3129, 28, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: Cheer emote'),
(3129, 29, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Weapons of Spirit - Witch Doctor Uzer\'i: npc\_flag questgiver+gossip added');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
