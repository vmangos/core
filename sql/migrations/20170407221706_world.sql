INSERT INTO `migrations` VALUES ('20170407221706'); 

-- Remove wrong gnoll aggro text from non-gnoll creatures
DELETE FROM `creature_ai_scripts` WHERE `id` IN (255402, 258702, 856602, 109702);
UPDATE `creature_ai_scripts` SET `action1_param1`=-7, `action1_param2`=0 WHERE `id`=123601;