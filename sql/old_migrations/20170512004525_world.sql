INSERT INTO `migrations` VALUES ('20170512004525');

-- Twilight Avenger EventAI
UPDATE creature_template SET AIName='EventAI', ScriptName='' WHERE entry=11880;
DELETE FROM creature_ai_scripts WHERE creature_id = 11880;
INSERT INTO creature_ai_scripts (creature_id, event_type, event_param1, action1_type, action1_param1, comment) VALUES (11880, 2, 30, 11, 8599, 'Twilight Avenger - Cast Enrage at 30% HP');
INSERT INTO creature_ai_scripts (creature_id, event_type, event_param1, event_param2, action1_type, action1_param1, comment) VALUES (11880, 14, 3500, 20, 11, 8602, 'Twilight Avenger - Cast Vegeance on Low Friendly HP');

-- Darnassus Guards locations
UPDATE gossip_menu_option SET action_menu_id=2329 WHERE  menu_id=2343 AND id=2;
UPDATE gossip_menu_option SET action_poi_id=98 WHERE  menu_id=2343 AND id=0;
UPDATE gossip_menu_option SET action_poi_id=99 WHERE  menu_id=2343 AND id=1;
UPDATE gossip_menu_option SET action_poi_id=267 WHERE  menu_id=2343 AND id=2;
UPDATE gossip_menu_option SET action_poi_id=100 WHERE  menu_id=2343 AND id=3;
UPDATE gossip_menu_option SET action_poi_id=97 WHERE  menu_id=2343 AND id=4;

-- Cast Haleh's Will when accepting 5162
UPDATE quest_template SET SrcSpell=17168 WHERE entry=5162;
INSERT INTO spell_target_position (id, target_position_x, target_position_y, target_position_z, target_orientation) VALUES (17167, 1291.52, -2161.9, 200, 2.69407);
INSERT INTO spell_mod (Id, DurationIndex, Comment) VALUES (17168, 8, 'Haleh\'s Will - Duration');

-- Battlegear quests repeatable
UPDATE quest_template SET SpecialFlags=1 WHERE entry IN (8548,8572,8574,8573);

-- Imperial Quiraj quests repeatable
UPDATE quest_template SET SpecialFlags=1 WHERE entry IN (8790,8789);

-- Woodland protector quest text
UPDATE quest_template SET OfferRewardText='I see you found me, young $R. Melithar is a wise druid to have sent you.' WHERE  entry=458;

-- Lessons Anew and Moonglade quest requirements
UPDATE quest_template SET PrevQuestId=0 WHERE  entry=6126;
UPDATE quest_template SET NextQuestId=0 WHERE  entry=5922;
UPDATE quest_template SET NextQuestId=5922 WHERE  entry IN (5926,5927,5928);

-- Striker's Pauldrons given by Andorgos
INSERT INTO creature_questrelation (id, quest) VALUES (15502, 8659);
