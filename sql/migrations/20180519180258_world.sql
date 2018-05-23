DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180519180258');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180519180258');
-- Add your query below.

-- Searing Gorge
-- Start of vid 37: https://www.youtube.com/watch?v=3Q67ArTE3eQ&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Caught!

-- Ledger from Tanaris

-- Wooden Outhouse missing gossip
-- Make Wooden Outhouse always interact-able to ensure accessibility
UPDATE `gameobject_template` SET `flags`=0 WHERE `entry`=173265 AND `patch`=0;

-- Gossip for Wooden Outhouse, menu available when quest 4450 is active
DELETE FROM `gossip_menu_option` WHERE `menu_id`=2387; 
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
(2387, 0, 'Um... sorry to bother you, but could I see Goodsteel\'s ledger again... if you\'re not using it.', 5410, 1, 3, 2388, 238701, 57008);

DELETE FROM `gossip_menu` WHERE `entry` IN (2387, 2388);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(2387, 3055),
(2388, 3056);

-- Spawn book on activating gossip option
DELETE FROM `gossip_scripts` WHERE `id`=238701;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `comments`) VALUES 
(238701, 1, 9, 47578, 20, 'Gossip Menu 2387 - Wooden Outhouse: Spawn Goodsteel\'s Ledger for 20 sec');

-- Add condition needed above
DELETE FROM `conditions` WHERE `condition_entry` IN (57008); -- Empty condition
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES 
(57008, 9, 4450);

-- Divine Retribution - already ok

-- The Flawless Flame - Seems ok

-- WANTED: Overseer Maltorius

-- STOLEN: Smithing Tuyere and Lookout's Spyglass
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=21, `OfferRewardEmoteDelay1`=1000 WHERE `entry`=7728 AND `patch`=3;

-- JOB OPPORTUNITY: Culling the Competition

-- Curse These Fat Fingers
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=7723 AND `patch`=3;

-- Incendosaurs? Whateverosaur is More Like It
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmoteDelay1`=2000 WHERE `entry`=7727 AND `patch`=3;

-- Fiery Menace!
UPDATE `quest_template` SET `OfferRewardEmote1`=5, `OfferRewardEmoteDelay1`=2000 WHERE `entry`=7724 AND `patch`=3;

-- What the Flux?
UPDATE `quest_template` SET `DetailsEmote1`=6, `DetailsEmoteDelay1`=2000, `CompleteEmote`=6 WHERE `entry`=7722 AND `patch`=3;

-- The Key to Freedom - recheck
-- Source: https://github.com/TrinityCore/TrinityCore/issues/21305
UPDATE `quest_template` SET `CompleteScript`=4451 WHERE `entry`=4451 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=4451;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4451, 1, 10, 9876, 14000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -7025, -1784, 265.76, 2.7, 0, 'The Key to Freedom - Wooden Outhouse: Summon Locheed'),
(4451, 3, 0, 0, 0, 0, 0, 9876, 20, 8, 3, 5407, 0, 0, 0, 0, 0, 0, 0, 0, 'The Key to Freedom - Locheed: Say text 1'),
(4451, 3, 1, 4, 0, 0, 0, 9876, 20, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Key to Freedom - Locheed: Cheer emote'),
(4451, 6, 0, 0, 0, 0, 0, 9876, 20, 8, 3, 5408, 0, 0, 0, 0, 0, 0, 0, 0, 'The Key to Freedom - Locheed: Say text 2'),
(4451, 6, 1, 5, 0, 0, 0, 9876, 20, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Key to Freedom - Locheed: Exclamation emote'),
(4451, 8, 3, 0, 9000, 0, 2, 9876, 20, 8, 3, 0, 0, 0, 0, -7079.7, -1793.7, 267.7, 3.42, 0, 'The Key to Freedom - Locheed: Run away');

-- Forging the Shaft - Already ok

-- The Flame's Casing - accept ok

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
