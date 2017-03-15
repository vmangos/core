INSERT INTO `migrations` VALUES ('20170314031050');

-- Make quest Compendium of the Fallen unavailable to Undead
UPDATE `quest_template` SET `RequiredRaces`=162 WHERE `entry`=1049;
