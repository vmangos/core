INSERT INTO `migrations` VALUES ('20170511000537'); 

-- Make A Lost Master require How Big A Threat part 1 and change event to play on its completion.
UPDATE `quest_template` SET `PrevQuestId`=984, `StartScript`=0 WHERE `entry`=986;
UPDATE `quest_template` SET `CompleteScript`=986 WHERE `entry`=984;

DELETE FROM `quest_start_scripts` WHERE `id`=986;

INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 9, 0, 0, 0, 0, 0, 0, 2000000011, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 7, 0, 0, 0, 0, 0, 0, 2000000010, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 5, 0, 0, 0, 0, 0, 0, 2000000009, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (986, 0, 10, 6086, 15000, 0, 0, 0, 0, 0, 0, 0, 6435.25, 368.004, 13.9412, 4.5, '');
