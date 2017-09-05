INSERT INTO `migrations` VALUES ('20170331165323');

--  Allow horde to pick up the quest 'Hive in the Tower'
update quest_template set RequiredRaces = 0 where entry = 1126; 
