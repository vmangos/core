INSERT INTO `migrations` VALUES ('20170401231337');

DELETE FROM spell_effect_mod WHERE Id IN (4071,4072,19805);
DELETE FROM creature_loot_template WHERE entry IN (2673,2674,12426);

UPDATE creature_template SET lootid = 2673, faction_A = 1, faction_H = 85 WHERE entry = 2673;
UPDATE creature_template SET lootid = 2674, faction_A = 1, faction_H = 85 WHERE entry = 2674;
UPDATE creature_template SET lootid = 12426, faction_A = 1, faction_H = 85 WHERE entry = 12426;

INSERT INTO spell_effect_mod (Id, Effect, EffectMiscValue, EffectTriggerSpell, `Comment`) VALUES (4071, 41, 2673, 0,'Target Dummy');
INSERT INTO spell_effect_mod (Id, Effect, EffectMiscValue, EffectTriggerSpell, `Comment`) VALUES (4072, 41, 2674, 0,'Advanced Target Dummy');
INSERT INTO spell_effect_mod (Id, Effect, EffectMiscValue, EffectTriggerSpell, `Comment`) VALUES (19805, 41, 12426, 0,'Masterwork Target Dummy');

-- Target Dummy
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid) VALUES (2673, 15, 7191, 0);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2673, 75, 4363, 1, 2);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2673, 75, 4359, 2, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2673, 75, 2841, 3, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2673, 75, 2592, 4, 1);

-- Advanced Target Dummy
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid) VALUES (2674, 25, 7191, 0);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2674, 75, 4387, 1, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2674, 75, 4382, 2, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2674, 75, 4389, 3, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (2674, 75, 4234, 4, 4);

-- Masterwork Target Dummy
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid) VALUES (12426, 35, 7191, 0);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 10561, 1, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 16000, 2, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 15994, 3, 2);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 6037, 4, 1);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 8170, 5, 2);
INSERT INTO creature_loot_template (entry, ChanceOrQuestChance, item, groupid, maxcount) VALUES (12426, 75, 14047, 6, 4);
