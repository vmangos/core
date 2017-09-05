INSERT INTO `migrations` VALUES ('20170329195220'); 

-- Fix completion text for quest "Beer Basted Boar Ribs".
UPDATE `quest_template` SET `OfferRewardText`='The Malt is brewed, the Boars are dead\r\nAnd before all is done and anything said\r\nWe will have to fight for first dibs\r\nOn these savory Beer Basted Boar Ribs!' WHERE `entry`=384;
