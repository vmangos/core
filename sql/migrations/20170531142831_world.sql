INSERT INTO `migrations` VALUES ('20170531142831'); 

-- Quest flag for Sentinel Selarin is added after dialogue.
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=3694;
-- Assign core script to Terenthis.
UPDATE `creature_template` SET `ScriptName`='npc_terenthis' WHERE `entry`=3693;

-- Waypoints for Sentinel Selarin.
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (3694, 1, 6422.38, 398.54, 11.162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (3694, 2, 6429.16, 395.69, 11.6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (3694, 3, 6437.87, 372.91, 13.941, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.581, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (3694, 4, 6435.33, 365.925, 13.941, 19000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.471, 0, 0);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (3694, 5, 6436.43, 362.265, 13.941, 120000, 15, 0, 0, 0, 0, 0, 0, 0, 0, 1.472, 0, 0);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (15, 0, 29, 2, 1, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin add quest giver flag');
-- Script for Sentinel Selarin.
DELETE FROM `quest_end_scripts` WHERE `id`=994;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 1, 20, 2, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin start moving');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 9, 0, 0, 3694, 40, 0, 0, 2000000008, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin Say1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 9, 1, 1, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin emote talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 12, 25, 0, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin set walk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 14, 0, 0, 0, 0, 0, 0, 2000000007, 0, 0, 0, 0, 0, 0, 0, 'Terenthis Say1');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 14, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Terenthis emote talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 20, 0, 0, 3694, 40, 0, 0, 2000000006, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin Say2');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 20, 1, 1, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin emote talk');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 25, 0, 0, 3694, 40, 0, 0, 2000000005, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin Say3');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (994, 25, 1, 1, 3694, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sentinel Selarin emote talk');
-- The sentinel should spawn and make her quest available when completing either Escape Through Force or Escape Through Stealth.
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=990;
UPDATE `quest_template` SET `NextQuestId`=990, `NextQuestInChain`=990 WHERE `entry`=994;
UPDATE `quest_template` SET `CompleteScript`=994, `NextQuestId`=990, `NextQuestInChain`=990 WHERE `entry`=995;