INSERT INTO `migrations` VALUES ('20170423192001');

UPDATE creature_ai_scripts SET creature_id = 1157 WHERE id = 115702;

DELETE FROM creature_ai_scripts WHERE comment = 'Dragonmaw Bonewarder - Cast Curse of Weakness';
INSERT INTO creature_ai_scripts (`creature_id`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `comment`) VALUES
 (1057, 1, 8000, 14000, 8000, 14000, 11, 6205, 4, 32, 'Dragonmaw Bonewarder - Cast Curse of Weakness');
