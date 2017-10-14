INSERT INTO `migrations` VALUES ('20170919210956');

-- Dream Vision
UPDATE creature_template SET ScriptName = 'npc_summon_possessed' WHERE entry IN (7863,4277);
UPDATE creature_template SET unit_flags = 33554818 WHERE entry = 7863;
