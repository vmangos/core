INSERT INTO `migrations` VALUES ('20170628103600'); 

-- Set required level for quest "In Search of Thaelrid" to 18
UPDATE quest_template SET MinLevel = 18 WHERE entry = 1198;