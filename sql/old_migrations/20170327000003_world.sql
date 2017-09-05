INSERT INTO `migrations` VALUES ('20170327000003');

-- The Woodland Protector quest text fix
UPDATE `quest_template` SET `OfferRewardText`='Your service to the creatures of Shadowglen is worthy of reward, $N.$b$bYou confirmed my fears, however. If the grells have become tainted by the Fel Moss, one can only imagine what has become of the Gnarlpine tribe of furbolgs who once lived here.$b$bShould you find yourself in Dolanaar, able $C, seek out the knowledgeable druid, Athridas Bearmantle. He shares our concern for the well being of the forest.' WHERE `entry`=459;
