INSERT INTO `migrations` VALUES ('20170604165032'); 

-- Terenthis should clap when turning in A Lost Master 1
UPDATE `quest_template` SET `OfferRewardEmote1`=21, `CompleteScript`=986 WHERE `entry`=986;

-- Update Sentinel Selarin Movement
REPLACE INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (15, 0, 29, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin add quest giver flag');

-- Assign start script for A Lost Master 2
UPDATE `quest_template` SET `StartScript`=993 WHERE `entry`=993;

-- This script is wrong.
DELETE FROM `quest_end_scripts` WHERE `id`=993;

-- Unused script texts.
DELETE FROM `db_script_string` WHERE `entry` IN (2000000009, 2000000010, 2000000011, 2000000050, 2000000051, 2000000052, 2000000053, 2000000054);

-- Add script text for A Lost Master 1 & 2
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000011, '%s begins to cast a spell as you take the cloak from him.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000010, 'Now... where was my thread and needle. Ah! There it is...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000009, 'I shall get started right away, $n.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Quest end script for A Lost Master 1
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 0, 0, 0, 0, 0, 0, 0, 2000000009, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 1 - Terenthis Say Text 1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 1 - Terenthis Emote Talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 3, 0, 0, 0, 0, 0, 0, 2000000010, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 1 - Terenthis Say Text 2');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 1 - Terenthis Emote Talk');

-- Quest start script for A Lost Master 2
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (993, 0, 0, 2, 0, 0, 0, 0, 2000000011, 0, 0, 0, 0, 0, 0, 0, 'A Lost Master 2 - Terenthis Say Emote Text');

-- Gubber Blump should cheer when turning in quest Fruit of the Sea
UPDATE `quest_template` SET `OfferRewardEmote1`=4 WHERE `entry`=1138;

-- Terenthis should bow when turning in Escape Through Force or Stealth
UPDATE `quest_template` SET `OfferRewardEmote1`=2 WHERE `entry` IN (994, 995);

-- Add missing script text for Escape Through Force.
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000795, '%s roars in excitement as he rushes Volcor. When he reaches his master, Grimclaw licks his face.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 'grimclaw SAY_END_2');
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES (-1000796, 'I\'m happy to see you too, Grim! It looks like not all strangers are to be feared after all, huh, Grim? Terenthis shall reward this adventurer well.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 'volcor SAY_END_3');
UPDATE `script_texts` SET `emote`=1 WHERE `entry`=-1000790;

-- Add gossip menu to Volcor
INSERT INTO `conditions` VALUES (3692, 8, 993, 0);
INSERT INTO `gossip_menu` VALUES (3692, 3213, 0);
INSERT INTO `gossip_menu` VALUES (3692, 3214, 3692);
UPDATE `creature_template` SET `gossip_menu_id`=3692 WHERE `entry`=3692;
