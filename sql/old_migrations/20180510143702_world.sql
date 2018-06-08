DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180510143702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180510143702');
-- Add your query below.

-- Dustwallow Marsh
-- Start of vid 20: https://www.youtube.com/watch?v=OlnnPZbg3T0&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Gossip for Krog first menu as default second menu available after quest 1269 is completed
UPDATE `creature_template` SET `gossip_menu_id`=1004 WHERE `entry`=4926 AND `patch`=0;

DELETE FROM `gossip_menu_option` WHERE `menu_id`=1004; 
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_text`, `OptionBroadcastTextID`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `condition_id`) VALUES 
(1004, 0, 'The Burning Inn.', 4259, 1, 3, 1005, 0),
(1004, 1, 'Finding Reethe.', 4261, 1, 3, 1006, 57007);

DELETE FROM `gossip_menu` WHERE `entry` IN (1004, 1005, 1006);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
(1004, 1818),
(1005, 1819),
(1006, 1820);

DELETE FROM `conditions` WHERE `condition_entry` IN (57007); -- Empty condition
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES 
(57007, 8, 1269);

-- Suspicious Hoofprints
-- Source no. 2: https://www.youtube.com/watch?v=Krjsj9X3rI0&feature=youtu.be&t=72
UPDATE `quest_template` SET `CompleteScript`=1268 WHERE `entry`=1268 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=1268;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1268, 0, 1, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Krog: Emote shout'),
(1268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1755, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Krog: Say text 1'),
(1268, 1, 10, 4972, 18000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 3, -3154, -2899, 33.7, 0.5, 0, 'Suspicious Hoofprints - Krog: Summon Kagoro (rest of event in waypoint script)');

-- Set Kagoro movement and equipment
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=4972 AND `patch`=0;
UPDATE `creature_template` SET `unit_flags`=2 WHERE `entry`=4972 AND `patch`=0;
UPDATE `creature_template` SET `equipment_id`=639 WHERE entry=4972;

-- Start movement script
DELETE FROM `creature_movement_template` WHERE `entry`=4972;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`, `model1`, `model2`) VALUES
(4972, 1, -3154, -2899, 33.7, 20000, 497201, 0, 0, 0);

DELETE FROM `creature_movement_scripts` WHERE `id`=497201;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(497201, 1, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3147, -2896, 34.2, 0.33, 0, 'Suspicious Hoofprints - Kagoro: Point 1'),
(497201, 2, 3, 0, 800, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3143, -2891, 34.18, 2.54, 0, 'Suspicious Hoofprints - Kagoro: Point 2'),
(497201, 3, 3, 0, 500, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3146.9, -2887, 34.1, 3.22, 0, 'Suspicious Hoofprints - Kagoro: Point 3'),
(497201, 5, 0, 0, 0, 0, 0, 4926, 20, 8, 2, 1648, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Krog: Say text 2'),
(497201, 5, 1, 1, 0, 0, 0, 4926, 20, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Krog: Emote talk'),
(497201, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1649, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Kagoro: Say text 1'),
(497201, 7, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Kagoro: Emote talk'),
(497201, 9, 1, 66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Suspicious Hoofprints - Kagoro: Emote salute'),
(497201, 11, 3, 0, 3000, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3137, -2865, 34.8, 2.83, 0, 'Suspicious Hoofprints - Kagoro: Point 4'),
(497201, 14, 3, 0, 4000, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3178, -2855, 35.26, 2.9, 0, 'Suspicious Hoofprints - Kagoro: Point 5'),
(497201, 18, 3, 0, 1000, 69, 1, 0, 0, 0, 0, 0, 0, 0, 0, -3193, -2848, 42.74, 2.63, 0, 'Suspicious Hoofprints - Kagoro: Point 6');

-- Lieutenant Paval Reethe - ok already

-- The Black Shield pt. 1 - ok already

-- The Black Shield pt. 2 - ok already

-- Start of vid 25: https://www.youtube.com/watch?v=yFHe-rrgfcg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Theramore Spies - ok already

-- Hungry! - ok already

-- Jarl Needs Eyes - accept unknown, complete ok already

-- Stinky's Escape - ally version assumed to be the same 
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1270 AND `patch`=0;
UPDATE `quest_template` SET `DetailsEmote1`=1 WHERE `entry`=1222 AND `patch`=0;

-- The Black Shield pt. 4 - ok already

-- The Theramore Docks
UPDATE `quest_template` SET `OfferRewardEmote1`=66 WHERE `entry`=1202 AND `patch`=0;

-- The Lost Report
UPDATE `quest_template` SET `CompleteEmote`=6, `OfferRewardEmote1`=1 WHERE `entry`=1238 AND `patch`=0;

-- The Black Shield pt. 5 - should require 1323, 1268 unconfirmed but likely, 1273
-- Source: http://vanillawowdb.com/?quest=1276
-- Source: https://web.archive.org/web/20071103144419/http://wow.allakhazam.com:80/db/quest.html?wquest=1276
UPDATE `quest_template` SET `ExclusiveGroup`=-1268 WHERE `entry`=1268 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-1268 WHERE `entry`=1273 AND `patch`=0;
UPDATE `quest_template` SET `ExclusiveGroup`=-1268 WHERE `entry`=1323 AND `patch`=0;

-- The Severed Head
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=1 WHERE `entry`=1239 AND `patch`=0;

-- Jarl Needs a Blade - details ok already

-- The Troll Witchdoctor
UPDATE `quest_template` SET `DetailsEmote1`=1, `CompleteEmote`=6,`OfferRewardEmote1`=1, `CompleteScript`=1240 WHERE `entry`=1240 AND `patch`=0;

DELETE FROM `quest_end_scripts` WHERE `id`=1240;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(1240, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: npc\_flag questgiver removed'),
(1240, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1664, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: Say text 1'),
(1240, 2, 9, 399736, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: Spawn smoke (Maybe not correct smoke)'),
(1240, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1665, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: Emote text 1'),
(1240, 5, 15, 3644, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: Cast spell "Speak with Heads"'),
(1240, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1666, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: Say text 2'),
(1240, 11, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Troll Witchdoctor - Kin\'weelay: npc\_flag questgiver added');

-- Add smoke GUID
DELETE FROM `gameobject` WHERE `guid`=399736; -- Empty guid
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`) VALUES 
(399736, 19544, 0, -12345.4, 163.1, 2.98, 0, 0, 0, -15, -15, 100, 1);

-- Start of vid 26: https://www.youtube.com/watch?v=6DTmw7FvKCk&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Marg Speaks
UPDATE `quest_template` SET `CompleteEmote`=0, `OfferRewardEmote1`=6, `OfferRewardEmote2`=66 WHERE `entry`=1261 AND `patch`=0;

-- Start of vid 29: https://www.youtube.com/watch?v=NmuWN_3Qkec&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Deadmire 
UPDATE `quest_template` SET `DetailsEmote1`=0, `OfferRewardEmote1`=1 WHERE `entry`=1205 AND `patch`=0;

-- Start of vid 30: https://www.youtube.com/watch?v=DHPascB50tg&feature=youtu.be&list=PL49Ga_-r7iKkxrbckm9CkUhWzxqrOnw-n&t=2

-- Identifying the Brood - already ok

-- Questioning Reethe - no emotes

-- The Brood of Onyxia pt. 1 - already ok

-- The Brood of Onyxia pt. 2 -

-- The Brood of Onyxia pt. 3 - accept ok

-- Report to Zor
UPDATE `quest_template` SET `CompleteEmote`=0 WHERE `entry`=1262 AND `patch`=0;

-- Service to the Horde
UPDATE `quest_template` SET `OfferRewardEmote1`=1, `OfferRewardEmote2`=2 WHERE `entry`=7541 AND `patch`=2;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
