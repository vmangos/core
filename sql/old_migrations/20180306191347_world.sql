DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180306191347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180306191347');
-- Add your query below.

-- Durotar  
-- Your Place In The World
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=6 WHERE `entry`=4641 AND `patch`=0;

-- Class quests: Should have race requirement (Otherwise both Orc and Troll version would be available in video) - CHECK
-- Assumption: All class quest will be given same emotes, cause fair
-- 11/11

-- Simple Parchment 2383 - Orc Warrior - All but Troll
-- Simple Tablet 3065 - Troll Warrior - Troll only
-- Etched Tablet 3082 - Troll Hunter - Troll only
-- Etched Parchment 3087 - Orc Hunter - All but Troll
-- Hallowed Tablet 3085 - Priest - All
-- Glyphic Tablet 3086 - Mage - All
-- Tainted Parchment 3090 - Warlock - Static name in quest text http://web.archive.org/web/20091030001100/http://thottbot.com:80/q3090
-- Encrypted Parchment 3088 - Orc Rogue - All but Troll
-- Encrypted Tablet 3083 - Troll Rogue - Troll only - Static name in quest text
-- Rune-Inscribed Tablet 3084 - Troll Shaman Troll only
-- Rune-Inscribed Parchment 3089 - Orc Shaman - All but Troll

UPDATE `quest_template` SET `RequiredRaces`=50 WHERE `entry`=2383 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=128 WHERE `entry`=3065 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=128 WHERE `entry`=3082 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=50 WHERE `entry`=3087 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=3085 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=3086 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=178 WHERE `entry`=3090 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=50 WHERE `entry`=3088 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=128 WHERE `entry`=3083 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=128 WHERE `entry`=3084 AND `patch`=0;
UPDATE `quest_template` SET `RequiredRaces`=50 WHERE `entry`=3089 AND `patch`=0;

UPDATE `quest_template` SET `OfferRewardText`='And now you\'ve joined our ranks also. Don\'t misunderstand, $N. Just because you have access to power that many will be jealous of, it does not mean you will be accepted easily. Thrall allows our kind into Orgrimmar because we are still his fellow kin--he cannot turn his back on us, or we would become as pathetic as the humans who enslaved him. My point is: be careful. You can be powerful, but if you are foolish, then you are as good dead.$b$bIf you need training in spells then return to me.', `RequestItemsText`='Finally, you\'ve arrived... and discretely also. Good.$b$bOur world is full of fools, $N. Even the mighty Thrall has greater flaws than most can see. He turns his back on the power needed to make this land ours completely! We\'re not the same people who were manipulated and used by creatures from the Nether. We are our own people. We are proud... and we are strong.' WHERE `entry`=3090 AND `patch`=0;

UPDATE `quest_template` SET `RequestItemsText`='Welcome to the Valley of Trials, $N. You wouldn\'t be here if you hadn\'t gotten my tablet, so I will get to the point.$B$BI am Rwag and I am responsible for training the rogues, thieves, and cutpurses here in the Valley. I\'m the one the Hand will turn to if you\'re not ready for what\'s to come. But don\'t worry, the Hand won\'t be controlling everything you do, but it would be wise to work with them if they have need of your talents.' WHERE `entry`=3083 AND `patch`=0;

UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry` in 
(2383, 3065, 3082, 3087, 3085, 3086, 3090, 3088, 3083, 3084, 3089) AND `patch`=0;

UPDATE `quest_template` SET `CompleteEmote`=2 WHERE `entry` in 
(2383, 3065, 3082, 3087, 3085, 3086, 3090, 3088, 3083, 3084, 3089) AND `patch`=0;

UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry` in 
(2383, 3065, 3082, 3087, 3085, 3086, 3090, 3088, 3083, 3084, 3089) AND `patch`=0;

-- Vile Familiars
UPDATE `quest_template` SET `CompleteEmote`=0, `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=792 AND `patch`=0;

-- Sarkoth (part 1) - ok
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=790 AND `patch`=0;

-- Sarkoth (part 2) - ok, only text line is added, delay on kneel off 30s -> 15s
DELETE FROM `quest_start_scripts` WHERE `id`=804;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `buddy_id`, `buddy_radius`, `comments`) VALUES
(804, 2, 28, 8, 3287, 5, 'Hana\'zua: Kneel state');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `dataint`, `comments`) VALUES
(804, 3, 0, 0, 1341, 'Hana\'zua: Say text 1');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `buddy_id`, `buddy_radius`, `comments`) VALUES
(804, 15, 28, 7, 3287, 5, 'Hana\'zua: Kneel state off');

-- Throwables present on LH

-- Burning Blade Medallion
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=2 WHERE `entry`=794 AND `patch`=0;

-- Lazy Peons
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=5, `OfferRewardEmote1`=1 WHERE `entry`=5441 AND `patch`=0;

-- Cactus +1
DELETE FROM `gameobject` WHERE `guid`=12182; -- Guid is free
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`) VALUES 
(12182, 171938, 1, -315.8, -4444.2, 58.59, 1.57, 0.566406, -0.824126, 60, 60, 100, 1, 8);

-- Thazz'ril's Pick
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=6394 AND `patch`=0;

-- Thwarting Kolkar Aggression, Report to Sen'jin Village seems ok

-- Report to Orgnil
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=823 AND `patch`=0;

-- A Solvent Spirit
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=1, `OfferRewardEmote1`=2 WHERE `entry`=818;

-- Practical Prey
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=1, `OfferRewardEmote1`=1 WHERE `entry`=817;

-- A Peon's Burden
UPDATE `quest_template` SET `DetailsEmote1`=6, `OfferRewardEmote1`=6, `OfferRewardEmote2`=1 WHERE `entry`=2161;

-- Vanquish the Betrayers
UPDATE `quest_template` SET `DetailsEmote1`=5, `IncompleteEmote`=25, `OfferRewardEmote1`=66 WHERE `entry`=784 AND `patch`=0;

-- Carry Your Weight
UPDATE `quest_template` SET `DetailsEmote1`=2, `OfferRewardEmote1`=4 WHERE `entry`=791 AND `patch`=0;

-- Dark Storm
UPDATE `quest_template` SET `CompleteEmote`=0,`OfferRewardEmote1`=4 WHERE `entry`=806;

UPDATE `quest_end_scripts` SET `comments`='Orgnil Soulscar: Say text on quest end' WHERE `id`=806 AND `delay`=0 AND `command`=0;
DELETE FROM `quest_end_scripts` WHERE `id`=806 AND `command`=1;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(806, 0, 1, 15, 'Orgnil Soulscar: Roar emote on quest end');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `dataint`, `comments`) VALUES 
(806, 4, 984, 'Orgnil Soulscar: Emote text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(806, 4, 1, 61, 'Orgnil Soulscar: Throw emote');

-- The Admiral's Orders
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=830 AND `patch`=0;

-- Minshina's Skull
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=808 AND `patch`=0;
-- The event with the ghost seems correct on LH

-- Add dance state to npc Kali Remik
UPDATE `creature_template_addon` SET `emote`=10 WHERE `entry`=705 AND `patch`=0;
UPDATE `creature_addon` SET `emote`=10 WHERE `guid`=705 AND `patch`=0;

-- Lost But Not Forgotten
UPDATE `quest_template` SET `DetailsEmote1`=18, `OfferRewardEmote1`=18 WHERE `entry`=816 AND `patch`=0;

-- Winds in the Desert

-- Securing the Lines

-- Taming the Beast (Dire Mottled Boar)
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`= 0, `OfferRewardEmote1`=273 WHERE `entry`=6062 AND `patch`=0;

-- Taming the Beast (Surf Crawler)
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`= 0, `OfferRewardEmote1`=273 WHERE `entry`=6083 AND `patch`=0;

-- Taming the Beast (Armored Scorpid)
UPDATE `quest_template` SET `DetailsEmote1`=1, CompleteEmote=0, `OfferRewardEmote1`=273 WHERE `entry`=6082 AND `patch`=0;

-- Training the Beast (Orgrimmar)
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=273 WHERE `entry`=6081 AND `patch`=0;

-- Need for a Cure
UPDATE `quest_template` SET `DetailsEmote1`=1, CompleteEmote=1, `OfferRewardEmote1`=2, `OfferRewardEmote2`=1 WHERE `entry`=812 AND `patch`=0;

-- Hidden Enemies
UPDATE `quest_template` SET `DetailsEmote1`=1,`CompleteEmote`=6, `OfferRewardEmote1`=15 WHERE entry=5726;

-- Finding the Antidote
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1 WHERE `entry`=813 AND `patch`=0;

-- Fizzle Darkstorm Waypoint
UPDATE `creature` SET `MovementType`=2 WHERE `guid`=6455;

DELETE FROM `creature_movement` WHERE `id`=6455;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `orientation`) VALUES 
(6455, 1, 868.614, -4189.56, -14.0285, 25000, 1.39128),
(6455, 2, 876.31, -4218.16, -11.52, 25000, 2.22);

-- Margoz
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=2 WHERE `entry`=828 AND `patch`=0;

-- Skull Rock
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0 WHERE `entry`=827 AND `patch`=0;

-- Thrall position
UPDATE `creature` SET `position_x`=1920.13, `position_y`=-4126.46, `position_z`=42.91, `orientation`=4.712 WHERE `id`=4949;
-- Gossip already ok on LH

-- Hidden Enemies part 2
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=4 WHERE `entry`=5727 AND `patch`=0;

-- Neeru Fireblade
UPDATE `quest_template` SET `CompleteScript`=829, `CompleteEmote`=0 WHERE `entry`=829 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=829;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(829, 0, 1, 69, 'Neeru Fireblade: Craft emote on quest end');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `datalong`, `dataint`, `comments`) VALUES 
(829, 1, 0, 990, 'Neeru Fireblade: Emote text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES 
(829, 6, 1, 26, 'Neeru Fireblade: Return to normal after crafting for 6sec');

-- Burning Shadows
UPDATE `quest_template` SET `CompleteScript`=832, `OfferRewardEmote1`=1 WHERE `entry`=832 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=832;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `datalong`, `dataint`, `comments`) VALUES 
(832, 0, 0, 991, 'Neeru Fireblade: Say text 1');

-- Ak'Zeloth 
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=809 AND `patch`=0;

-- Officer Redblade is present on LH if war effort is completed/started

-- Hidden Enemies part 3

-- Add missing 'Taillasher Eggs' to empty guids
DELETE FROM `gameobject` WHERE guid=12467; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`) VALUES 
(12467, 3240, 1, -1254.91, -5582.25, 7.67776, 4.68486, 0.716773, -0.697306, 300, 300, 100, 1, 8);

DELETE FROM `gameobject` WHERE guid=12468; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawnFlags`) VALUES 
(12468, 3240, 1, -1520.69, -5293.85, 7.05261, 2.21025, 0.89352, 0.449022, 300, 300, 100, 1, 8);

-- Conscript of the Horde
UPDATE `quest_template` SET `DetailsEmote1`=25, `DetailsEmoteDelay1`=3000, `CompleteEmote`=15, `OfferRewardEmote1`=6 WHERE `entry`=840 AND `patch`=0;


-- More emote fixes by brotalnia below.


-- Kaltunk should do two talk emotes, followed by a laugh and point emote when offering quest Your Place In The World
-- Gornek should do shrug emote when turning in quest Your Place In The World
UPDATE `quest_template` SET `DetailsEmote1`=1, `DetailsEmote2`=1, `DetailsEmote3`=11, `DetailsEmote4`=25, `OfferRewardEmote1`=6 WHERE `entry`=4641;

-- Gornek should do talk emote when offering quest Cutting Teeth.
-- Gornek should do laugh emote when turning in quest Cutting Teeth.
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=1, `OfferRewardEmoteDelay1`=2000 WHERE `entry`=788;

-- Gornek should do talk emote when offering quest Sting of the Scorpid
UPDATE `quest_template` SET `DetailsEmote1`=1,`DetailsEmoteDelay1`=1000 WHERE `entry`=789;

-- Galgar should do shout emote when offering quest Galgar's Cactus Apple Surprise
-- Galgar should do shrug emote on completed quest Galgar's Cactus Apple Surprise
-- Galgar should do talk emote when turning in quest Galgar's Cactus Apple Surprise
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=4402;

-- Master Gadrin should do talk emote when turning in quest Report to Sen'Jin Village
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=805;

-- Cook Torka should do shout emote, followed by two talk emotes when offering quest Break a Few Eggs
-- Cook Torka should not do an emote on completed quest Break a Few Eggs
-- Cook Torka should do two talk emotes when turning in quest Break a Few Eggs
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `DetailsEmote3`=1, `CompleteEmote`=0, `OfferRewardEmote1`=1, `OfferRewardEmote2`=1 WHERE `entry`=815;

-- Gar'Thok should do talk emote when offering quest From The Wreckage
-- Gar'Thok should do talk emote on incomplete quest From The Wreckage
-- Gar'Thok should do salute emote when turning in quest From The Wreckage
UPDATE `quest_template` SET `DetailsEmote1`=1, `IncompleteEmote`=1, `OfferRewardEmote1`=66, `OfferRewardEmoteDelay1`=3000 WHERE `entry`=825;

-- Gar'Thok should do cheer emote when offering quest The Admiral's Orders 2
-- Nazgrel should do shrug emote on completed quest The Admiral's Orders 2
-- Nazgrel should do yell emote when turning in quest The Admiral's Orders 2
UPDATE `quest_template` SET `DetailsEmote1`=4, `DetailsEmoteDelay1`=2000, `CompleteEmote`=6, `OfferRewardEmote1`=5 WHERE `entry`=831;

-- Lar Prowltusk should do salute emote when turning in quest Thwarting Kolkar Aggression
UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=786;

-- Master Gadrin should not do an emote on completed quest Zalazane
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=826;

-- Sentinel Elissa Starbreeze should do bow emote when offering quest The Tower of Althalaxx
UPDATE `quest_template` SET `DetailsEmote1`=2 WHERE `entry`=965;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
