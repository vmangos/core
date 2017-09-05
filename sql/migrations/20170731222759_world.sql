INSERT INTO `migrations` VALUES ('20170731222759');

-- Delete the Blackhand's Command letter upon turning in the quest
UPDATE `quest_template` SET `ReqItemId1` = 18987, `ReqItemCount1` = 1 WHERE `entry` = 7761;
