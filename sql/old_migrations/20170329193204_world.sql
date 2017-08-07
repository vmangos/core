INSERT INTO `migrations` VALUES ('20170329193204'); 

-- Make quest "Letter to Stormpike" require "Encrypted Letter" to be completed first.
UPDATE `quest_template` SET `PrevQuestId`=511 WHERE `entry`=514;
