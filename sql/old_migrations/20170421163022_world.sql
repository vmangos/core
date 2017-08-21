INSERT INTO `migrations` VALUES ('20170421163022'); 

-- Allow 'A Hero's Reward' to be picked up after completing 'Hands of the Enemy'
update quest_template set NextQuestId = 7486 where entry = 6824; 
update quest_template set PrevQuestId = 0 where entry = 7486;
