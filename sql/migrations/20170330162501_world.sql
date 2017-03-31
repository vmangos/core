INSERT INTO `migrations` VALUES ('20170330162501');

-- Changed from "may come.$b$bMac, as promised" to "may come.$b$b$N, as promised"
UPDATE `quest_template` SET `OfferRewardText` = 'Great Spirit Totem! This is dire news indeed. I must begin to plan for whatever may come.$b$b$N, as promised, here is your reward for your brave service.$b$b' WHERE `entry` = '5064' LIMIT 1;
