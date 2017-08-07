INSERT INTO `migrations` VALUES ('20170513104658'); 

# Fix rep factions
UPDATE `quest_template` SET `RewRepFaction1`='730', `RewRepFaction2`='72' WHERE `entry`='7367';