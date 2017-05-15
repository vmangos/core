INSERT INTO `migrations` VALUES ('20170515222637');

-- Fix to ranged mobs attacking twice on agro
UPDATE creature_ai_scripts cas
SET cas.action1_type=23, cas.action1_param1=1, cas.action1_param2=0, cas.action2_type=0, cas.action2_param1=0
where event_type = 4 and action1_param1 IN (674,6660,9483,10277,12548,15547,15620,15736,15795,16100,17228,18164,22121,22907)
and creature_id IN (select creature_id from (SELECT * FROM creature_ai_scripts) as temp where event_type = 9 and action1_param1 = cas.action1_param1);
