INSERT INTO `migrations` VALUES ('20170905073437'); 

-- Missing Diplomat quest 1264 requires 1250, not 1249
UPDATE `quest_template` SET `NextQuestId` = 1250 WHERE `entry` = 1249;
UPDATE `quest_template` SET `PrevQuestId` = 1250 WHERE `entry` = 1264;
