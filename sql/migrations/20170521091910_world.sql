INSERT INTO `migrations` VALUES ('20170521091910'); 

-- Greatmother Hawkwind should gesture upon accepting quest A Humble Task 2.
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000027, '%s gestures to the pitcher of water sitting on the edge of the well.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `quest_start_scripts` WHERE `id`=753;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (753, 0, 0, 2, 0, 0, 0, 0, 2000000027, 0, 0, 0, 0, 0, 0, 0, 'Greatmother Hawkwind gestures');
UPDATE `quest_template` SET `StartScript`=753 WHERE `entry`=753;

-- Tharnariun Treetender should not have trainer flag.
UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=3701;