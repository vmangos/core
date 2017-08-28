INSERT INTO `migrations` VALUES ('20170827172855'); 

-- Fix level requirement for quest Cuergo's Gold
UPDATE `quest_template` SET `MinLevel`=40 WHERE `entry`=2882;