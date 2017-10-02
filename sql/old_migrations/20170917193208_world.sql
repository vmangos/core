INSERT INTO `migrations` VALUES ('20170917193208');

-- Blackrock Spire no reset
-- https://github.com/elysium-project/server/issues/2457
UPDATE map_template SET ResetDelay=0 WHERE Entry=229;

-- Minor Water Guardian no xp
UPDATE creature_template SET flags_extra = 96 WHERE entry = 3950;

-- Mobs spawned by quests made unique
UPDATE quest_start_scripts SET data_flags = 2 WHERE id IN (4023,778,74) AND command = 10;

-- Spirit Bond no threat
-- https://github.com/elysium-project/server/issues/2496
REPLACE INTO spell_mod (Id, AttributesEx, Comment) VALUES (19579, 1024, 'Spirit Bond no threat');
REPLACE INTO spell_mod (Id, AttributesEx, Comment) VALUES (24529, 1024, 'Spirit Bond no threat');

-- Elemental Invasion item drops
-- https://github.com/elysium-project/server/issues/2308
DELETE FROM reference_loot_template WHERE item in (18674,18672,18679);
REPLACE INTO creature_loot_template (entry, item, ChanceOrQuestChance) VALUES (14464, 18674, 50);
REPLACE INTO creature_loot_template (entry, item, ChanceOrQuestChance) VALUES (14461, 18672, 50);
REPLACE INTO creature_loot_template (entry, item, ChanceOrQuestChance) VALUES (14457, 18679, 50);

-- Tromping Miner's Boots
-- https://github.com/elysium-project/server/issues/2331
DELETE FROM reference_loot_template WHERE item in (9382);
REPLACE INTO reference_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id) VALUES 
(317506, 9375, 10, 2, 1, 1, 0),
(317506, 9378, 15, 2, 1, 1, 0),
(317506, 9382, 65, 2, 1, 1, 0);

-- Gibblewilt
-- https://github.com/elysium-project/server/issues/2453
UPDATE creature_ai_scripts SET action1_param1=20793 WHERE id=850303;
UPDATE creature_ai_scripts SET action1_param1=20793 WHERE id=850304;

-- Noble Deaths reputation
-- https://github.com/elysium-project/server/issues/2393
UPDATE quest_template SET RewRepFaction1=72 WHERE entry=512;

-- Magnus Frostwake innkeeper
-- https://github.com/elysium-project/server/issues/2417
UPDATE creature_template SET npcflag=5 WHERE entry=11278;

-- Gerard Tiller drops
-- https://github.com/elysium-project/server/issues/2480
DELETE FROM creature_loot_template WHERE entry=255 AND item=11614 AND groupid=0;
DELETE FROM creature_loot_template WHERE entry=255 AND item=12830 AND groupid=0;
DELETE FROM creature_loot_template WHERE entry=255 AND item=12827 AND groupid=0;
DELETE FROM creature_loot_template WHERE entry=255 AND item=11615 AND groupid=0;
REPLACE INTO creature_loot_template (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount, condition_id) VALUES (255, 2070, 65, 0, 1, 3, 0);

-- Artisan Fishing
-- https://github.com/elysium-project/server/issues/2548
DELETE FROM npc_trainer WHERE entry=14740 AND spell=18249;

-- BKP Impact Shot
-- https://github.com/elysium-project/server/issues/2524
UPDATE item_template SET class=6, subclass=3, name='BKP "Impact" Shot', Quality=1, BuyCount=200, BuyPrice=450, SellPrice=0, ItemLevel=35, RequiredLevel=30, stackable=200, stat_type1=0, stat_value1=0, stat_type2=0, stat_value2=0, dmg_min1=9, dmg_max1=9, armor=0, delay=3000, spellcooldown_5=0, spellcategorycooldown_5=0, bonding=0, Material=2, MaxDurability=0, BagFamily=2, DisenchantID=0 WHERE entry=3034;
DELETE FROM npc_trainer WHERE spell=4020;

-- Draconic for Dummies
-- https://github.com/elysium-project/server/issues/2493
UPDATE creature_loot_template SET ChanceOrQuestChance=6 WHERE item=21105;
UPDATE creature_loot_template SET ChanceOrQuestChance=4 WHERE item=21104;

-- Anubisath Thunderclap
-- https://github.com/elysium-project/server/issues/2351
UPDATE spell_effect_mod SET EffectIndex=0 WHERE Id=2834;

-- Campfire and bonfire diameter
-- https://github.com/elysium-project/server/issues/2366
UPDATE gameobject_template SET data2=1 WHERE entry=2061;
UPDATE gameobject_template SET data2=2 WHERE entry=2066;

-- Hunters Path required race
-- https://github.com/elysium-project/server/issues/2490
UPDATE quest_template SET RequiredRaces=8 WHERE entry=6072;
UPDATE quest_template SET RequiredRaces=8 WHERE entry=6721;

-- Number Two stats
-- https://github.com/elysium-project/server/issues/2587
UPDATE creature_template SET dmg_multiplier=1, minhealth=78600, maxhealth=78600, armor=4091, mindmg=1587, maxdmg=2105 WHERE entry=15554;
