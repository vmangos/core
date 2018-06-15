DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180612204659');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180612204659');
-- Add your query below.

-- EPL
-- Start of vid 52: https://www.youtube.com/watch?v=kmRoYJfSwdU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Demon Dogs
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5542 AND `patch`=0;

-- Blood Tinged Skies
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5543 AND `patch`=0;

-- Carrion Grubbage
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=5 WHERE `entry`=5544 AND `patch`=0;

-- The Corpulent One and The Call to Command - needs prerequisites
-- Source: http://web.archive.org/web/20070518215448/http://thottbot.com:80/q6136
-- Source: http://web.archive.org/web/20070603081154/http://www.thottbot.com:80/q6144
UPDATE `quest_template` SET `PrevQuestId`=6022, `ExclusiveGroup`=-6135 WHERE `entry`=6136 AND `patch`=0;
UPDATE `quest_template` SET `PrevQuestId`=6135 WHERE `entry`=6144 AND `patch`=0;

-- To Kill With Purpose
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=6022 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-6022 WHERE `entry`=6022 AND `patch`=0;

-- Un-Life's Little Annoyances
UPDATE `quest_template` SET `OfferRewardEmote1`=1 WHERE `entry`=6042 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-6022 WHERE `entry`=6042 AND `patch`=0;

-- The Ranger Lord's Behest
UPDATE `quest_template` SET `ExclusiveGroup`=-6022 WHERE `entry`=6133 AND `patch`=0;

-- Duskwing, Oh How I Hate Thee...
UPDATE `quest_template` SET `ExclusiveGroup`=-6135 WHERE `entry`=6135 AND `patch`=0;

-- Pamela's Doll
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=5149 AND `patch`=0;

-- Auntie Marlene
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5152 AND `patch`=0;

-- Uncle Carlin

-- Zaeldarr the Outcast
UPDATE `quest_template` SET `DetailsEmote1`=5, `CompleteEmote`=5, `OfferRewardEmote1`=4 WHERE `entry`=6021 AND `patch`=0;

-- The Restless Souls pt. 1
UPDATE `quest_template` SET `OfferRewardEmote1`=6 WHERE `entry`=5281 AND `patch`=0;

-- Minion's Scourgestones x 3
UPDATE `quest_template` SET `IncompleteEmote`=1, `OfferRewardEmote1`=4 WHERE `entry`=5402 AND `patch`=0;
UPDATE `quest_template` SET `IncompleteEmote`=1, `OfferRewardEmote1`=4 WHERE `entry`=5408 AND `patch`=0;
UPDATE `quest_template` SET `IncompleteEmote`=1, `OfferRewardEmote1`=4 WHERE `entry`=5510 AND `patch`=0;

-- The Archivist

-- Defenders of Darrowshire
UPDATE `quest_template` SET `DetailsEmote1`=5, `DetailsEmote2`=1, `OfferRewardEmote1`=1 WHERE `entry`=5211 AND `patch`=0;

-- Augustus' Receipt Book
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=0, `OfferRewardEmote1`=4 WHERE `entry`=6164 AND `patch`=0;

-- DB/Texts: Augustus the Touched
-- https://github.com/TrinityCore/TrinityCore/issues/21780
-- Source: https://www.youtube.com/watch?v=kmRoYJfSwdU&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=8697
UPDATE `creature_template` SET `AIName`='EventAI', `ScriptName`='', `gossip_menu_id`=4085 WHERE `entry`=12384 AND `patch`=0;

-- Events list for Augustus the Touched
DELETE FROM `creature_ai_events` WHERE `creature_id`=12384;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES 
(1238401, 12384, 0, 1, 0, 100, 1, 1000, 15000, 150000, 150000, 1238401, 0, 0, 'Augustus the Touched - Say text OOC');

DELETE FROM `creature_ai_scripts` WHERE `id`=1238401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1238401, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 7627, 7628, 7629, 0, 0, 0, 0, 0, 0, 'Augustus the Touched - Say random text');

-- Add condition and gossip menu - TC ID: 4085
DELETE FROM `gossip_menu` WHERE `entry` IN (4085);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES 
(4085, 4979, 0),
(4085, 4980, 60021);

DELETE FROM `gossip_menu_option` WHERE `menu_id` in (4085);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `BoxBroadcastTextID`, `condition_id`) VALUES 
(4085, 0, 0, 'GOSSIP_OPTION_QUESTGIVER', 0, 2, 2, 0, 0, 0, 0, 0, '', 0, 0),
(4085, 1, 1, 'Yes, Augustus.  I would like to do business.', 7623, 3, 4, 0, 0, 0, 0, 0, '', 0, 60021);

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES 
(60021, 8, 6164, 0);

-- Should be horde only until 1.11
-- Source: https://web.archive.org/web/20071102194101/http://wow.allakhazam.com:80/db/quest.html?wquest=6164
UPDATE `creature_template` SET `patch`=9 WHERE `entry`=12384 AND `patch`=0;
INSERT INTO `creature_template` (`entry`, `modelid_1`, `name`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `scale`, `mindmg`, `maxdmg`, `attackpower`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `AIName`, `equipment_id`, `flags_extra`) VALUES 
(12384, 12470, 'Augustus the Touched', 4085, 55, 55, 3397, 3397, 4500, 71, 71, 7, 1.1, 0, 96, 125, 248, 2000, 2000, 1, 36864, 70.664, 97.163, 100, 7, 'EventAI', 1149, 2);

-- Add alternative position for Augustus the Touched prior to 1.11
INSERT INTO `creature` (`guid`, `id`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `curhealth`, `patch_max`) VALUES 
(400000, 12384, 12470, 2967, -2672, 98.53, 5.65, 345, 345, 0, 3397, 8);
UPDATE `creature` SET `patch_min`=9 WHERE `guid`=53174;

-- Add creatures when Augustus the Touched moves to the new position
UPDATE `creature` SET `patch_min`=9 WHERE `guid`=53938;
UPDATE `creature` SET `patch_min`=9 WHERE `guid`=54760;
UPDATE `creature` SET `patch_min`=9 WHERE `guid`=54761;

-- The Restless Souls pt. 2

-- Redemption
UPDATE `quest_template` SET `DetailsEmote1`=1, `OfferRewardEmote1`=6 WHERE `entry`=5742 AND `patch`=0;

-- Of Forgotten Memories
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=5781 AND `patch`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
