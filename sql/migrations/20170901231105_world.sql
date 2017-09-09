INSERT INTO migrations VALUES ('20170901231105');

-- Gorosh drop chances
-- https://github.com/elysium-project/server/issues/1154
UPDATE creature_loot_template SET ChanceOrQuestChance=100 WHERE entry=9027 AND item=321228 AND groupid=1;

-- Execute log event
-- https://github.com/elysium-project/server/issues/2038
REPLACE INTO spell_mod (Id, SpellVisual, Comment) VALUES (20647, 250, '');

-- Jed Runewatcher
-- https://github.com/elysium-project/server/issues/2025
DELETE FROM pool_template WHERE entry=5004;
DELETE FROM pool_creature WHERE guid=42160 and pool_entry = 5004;
DELETE FROM creature WHERE guid=42160 and id = 10509;

-- Unreachable 'Wild Steelbloom
-- https://github.com/elysium-project/server/issues/1345
DELETE FROM gameobject WHERE guid=3920;
DELETE FROM pool_gameobject WHERE guid=3920;

-- Deepmoss Venomspitter
-- https://github.com/elysium-project/server/issues/1891
DELETE FROM creature_ai_scripts WHERE id=400706 and creature_id = 4007;
DELETE FROM creature_ai_scripts WHERE id=400707 and creature_id = 4007;

-- The Darkreaver Menace
-- https://github.com/elysium-project/server/issues/1870
UPDATE quest_template SET MinLevel=58 WHERE entry=8258;

-- Call of Water (Part 6)
-- https://github.com/elysium-project/server/issues/1821
UPDATE quest_template SET RequestItemsText='The brazier still reflects the ambient light from the area, and the flame shifts slightly as you move closer.$B$BThe corruption along the hills seems to have kept its distance, and besides the missing components, the brazier looks prepared for the ritual to summon a cleansed manifestation of water.' WHERE entry=63;

-- Dusty tome
-- https://github.com/elysium-project/server/issues/1430
UPDATE gameobject_template SET data12=0 WHERE entry IN (179547,179548);

-- "Gol'dir"
-- https://github.com/elysium-project/server/issues/1877
UPDATE creature SET spawndist=0, MovementType=0 WHERE guid=17013;

-- Bring the Light
-- https://github.com/elysium-project/server/issues/1143
UPDATE quest_template SET RewSpellCast=2791 WHERE entry=3636;

-- Namdo bizzfizzle
-- https://github.com/elysium-project/server/issues/1439
REPLACE INTO creature (guid, id, map, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType, spawnFlags) VALUES 
(100170, 2683, 0, 0, 0, -4923.1, 725.529, 253.1, 6.21499, 300, 5, 0, 1172, 0, 0, 0, 0);
REPLACE INTO npc_vendor (entry, item, maxcount, incrtime) VALUES
(2683, 2880, 0, 0),
(2683, 2901, 0, 0),
(2683, 3466, 0, 0),
(2683, 4357, 4, 10800),
(2683, 4361, 2, 10800),
(2683, 4363, 2, 10800),
(2683, 4364, 4, 10800),
(2683, 4371, 2, 10800),
(2683, 4382, 1, 10800),
(2683, 4389, 1, 10800),
(2683, 4399, 0, 0),
(2683, 4400, 0, 0),
(2683, 4404, 3, 10800),
(2683, 5956, 0, 0),
(2683, 10647, 0, 0),
(2683, 10648, 0, 0),
(2683, 14639, 1, 43200);

-- Desperate Prayer method
-- https://github.com/elysium-project/server/issues/1849
UPDATE quest_template SET Method=2 WHERE entry=5634;

-- Ungoro Quests
-- https://github.com/elysium-project/server/issues/2274
UPDATE quest_template SET MinLevel=47 WHERE entry in (4381, 4382, 4383, 4384, 4385, 4386, 4142, 4143, 4145, 4146, 4147, 4321, 4288, 4287, 4285);
UPDATE quest_template SET MinLevel=50 WHERE entry in (4144);

-- Proof of Deed
-- https://github.com/elysium-project/server/issues/2262
UPDATE page_text SET text='This proof of deed is to verify that $N slew Margol the Rager, scourge of the searing gorge.$B$BThe Ironforge museum recognizes this achievement and thanks the bearer for their generous contribution.$B$B-Head Curator Thorius Stonetender' WHERE entry=1231;

-- Meshlok the Harvester
-- https://github.com/elysium-project/server/issues/2250
UPDATE creature_template SET rank=2 WHERE entry=12237;

-- Imperial Qiraji Regalia/Armaments 
-- https://github.com/elysium-project/server/issues/763
DELETE FROM reference_loot_template WHERE entry IN (328926,328954,329187,329192,329198,329204,329212,329227,329233);
DELETE FROM creature_loot_template WHERE item IN (328926,328954,329187,329192,329198,329204,329212,329227,329233);
UPDATE creature_loot_template SET ChanceOrQuestChance=8 WHERE item in (328930,328942,328945,328956,329189,329196,329200,329208,329210,329229,329235);

-- Strange Water Globe
-- https://github.com/elysium-project/server/issues/1884
UPDATE quest_template SET SpecialFlags=0 WHERE entry=909;

-- Wrathtail Sea Witch and Felslayer
-- https://github.com/elysium-project/server/issues/1897
UPDATE creature_ai_scripts SET action1_param1=11981 WHERE id=371509;
UPDATE creature_ai_scripts SET action1_param1=13321 WHERE id=377401;

-- Crystal of Zin-malor
-- https://github.com/elysium-project/server/issues/1907
REPLACE INTO spell_mod (Id, Attributes, Custom, Comment) VALUES (19307, 150995008, 4, 'Crystal of Zin-Malor: Passive');

-- Glyphic Scroll
-- https://github.com/elysium-project/server/issues/1926
UPDATE page_text SET text='The corruption and evil that rumor says travels with the arcane is nothing compared to the pain we\'ve already felt. We are no longer victims, $N. We are the ones who control our fate. Sylvanas has paved the way for us--she has proven that our will is our own; that we are no longer thralls to that bastard Arthas.$B$BSeek me out in the church, I shall instruct you further... if that is your desire.$B$B- Isabella, Mage Trainer' WHERE entry=2447;

-- Pao'ka Swiftmountain
-- https://github.com/elysium-project/server/issues/1949
UPDATE creature_template SET type_flags=4096 WHERE entry=10427;

-- Nat Pagle breadcumb
-- https://github.com/elysium-project/server/issues/2047
UPDATE quest_template SET MinLevel=35 WHERE entry IN (6608,6609);

-- Stone Watcher increased despawn timer
-- https://github.com/elysium-project/server/issues/2213
UPDATE quest_end_scripts SET datalong2=900000 WHERE id IN (2946,2966);

-- Oozes creature type
-- https://github.com/elysium-project/server/issues/2285
UPDATE creature_template SET type=10 WHERE entry IN (10290,4391,4392,9477,9621);

-- Cliff Lurker
-- https://github.com/elysium-project/server/issues/2311
UPDATE creature_template SET minlevel=13, maxlevel=14, minhealth=273, maxhealth=300, mindmg=18 WHERE entry=1184;

-- Mark of Hakkar
-- https://github.com/elysium-project/server/issues/2318
DELETE FROM reference_loot_template WHERE entry=2043 AND item=10780;

-- Gaxim Rustfizzle Quest Chain
-- https://github.com/elysium-project/server/issues/2313
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1085 WHERE entry=1070;
UPDATE quest_template SET PrevQuestId=1085, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry=1071;
UPDATE quest_template SET PrevQuestId=1071, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1073 WHERE entry=1072;
UPDATE quest_template SET PrevQuestId=1072, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1074 WHERE entry=1073;
UPDATE quest_template SET PrevQuestId=1073, NextQuestId=1079, ExclusiveGroup=-1074, NextQuestInChain=0 WHERE entry=1074;
UPDATE quest_template SET PrevQuestId=1071, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1076 WHERE entry=1075;
UPDATE quest_template SET PrevQuestId=1075, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1077 WHERE entry=1076;
UPDATE quest_template SET PrevQuestId=1076, NextQuestId=1079, ExclusiveGroup=-1074, NextQuestInChain=0 WHERE entry=1077;
UPDATE quest_template SET PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1080 WHERE entry=1079;
UPDATE quest_template SET PrevQuestId=1079, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1091 WHERE entry=1080;
UPDATE quest_template SET PrevQuestId=1082, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0 WHERE entry=1081;
UPDATE quest_template SET PrevQuestId=1084, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1081 WHERE entry=1082;
UPDATE quest_template SET PrevQuestId=1091, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1084 WHERE entry=1083;
UPDATE quest_template SET PrevQuestId=1083, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1082 WHERE entry=1084;
UPDATE quest_template SET PrevQuestId=1070, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1071 WHERE entry=1085;
UPDATE quest_template SET PrevQuestId=1080, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=1083 WHERE entry=1091;

-- Araj the Summoner
-- https://github.com/elysium-project/server/issues/2342
UPDATE creature_template SET rank=1 WHERE entry=1852;

-- Annihilator / Rivenspike / Bashguuder proc rate
-- https://github.com/elysium-project/server/issues/1147
UPDATE item_template SET spellppmRate_1=5 WHERE entry=12798;
UPDATE item_template SET spellppmRate_1=5 WHERE entry=13286;
UPDATE item_template SET spellppmRate_1=5 WHERE entry=13204;

-- SM Graveyard rare spawn
UPDATE pool_creature SET chance=2 WHERE chance > 0 and description like '%graveyard%';
