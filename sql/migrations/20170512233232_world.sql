INSERT INTO `migrations` VALUES ('20170512233232'); 

-- Implemented quest start script for Cave Mushrooms
UPDATE `quest_template` SET `StartScript`=947 WHERE `entry`=947;

INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000077, 'Thank you, $n.  And luck to you.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000078, 'Cliffspring Falls lies along the mountains to the east and north.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (947, 0, 0, 0, 0, 0, 2, 0, 2000000077, 0, 0, 0, 0, 0, 0, 0, 'Quest Cave Mushrooms, Say 1st Line');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (947, 4, 0, 0, 0, 0, 2, 0, 2000000078, 0, 0, 0, 0, 0, 0, 0, 'Quest Cave Mushrooms, Say 2nd Line');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (947, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Quest Cave Mushrooms, Bow');
