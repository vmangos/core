INSERT INTO `migrations` VALUES ('20170715200000');

-- Fix quest Druid of the Claw(id:2561) These are 2 different objectives and using the charm on him should not count as having killed him.
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 0, `ReqCreatureOrGOId2` = 7318, `ReqCreatureOrGOCount1` = 0, `ReqCreatureOrGOCount2` = 1 WHERE `entry` = 2561;

-- Fix quest text The Color of Blood(id:388)
UPDATE `quest_template` SET `OfferRewardText` = 'So these bandanas -- filthy tokens of corruption -- are what my Mac had to die for?  Such a waste.  Such a tragic sacrifice. $b$bBut alas, I cannot return to the past.  Just know, $N, that you have brought my family justice through your deeds.' WHERE `entry` = 388;
