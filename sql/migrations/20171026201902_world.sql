DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026201902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026201902');
-- Add your query below.


-- Twilight Corrupter
-- https://github.com/LightsHope/server/issues/153
UPDATE `creature` SET `patch_min`=7, `spawnFlags`=1 WHERE `guid`=1179144;

-- Blacksmith trainers
-- https://github.com/LightsHope/server/issues/154
UPDATE `npc_trainer` SET `reqskill`=164 WHERE `spell`=2021;

-- Frostwhisper's Embalming Fluid
-- https://github.com/LightsHope/server/issues/172
UPDATE `gameobject` SET `position_z`=84.7328 WHERE `guid`=43205;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=100 WHERE `entry`=13381 AND `item`=12736;

-- Hallowed Wand
-- https://github.com/LightsHope/server/issues/207
UPDATE `item_template` SET `spellcharges_1`=-5 WHERE `entry`=20397;
UPDATE `item_template` SET `spellcharges_1`=-5 WHERE `entry`=20413;

-- Searing Gorge quests min level
-- https://github.com/LightsHope/server/issues/209
UPDATE `quest_template` SET `MinLevel`=40 WHERE `entry` IN (3367,3368,3371,3372,3181,3182,3201,3377,3378);

-- Atiesh
-- https://github.com/LightsHope/server/issues/219
UPDATE `item_template` SET `bonding`=1 WHERE  `entry`=22589 AND `patch`=9;

-- Easter Dress
-- https://github.com/LightsHope/server/issues/104
DELETE FROM `creature_loot_template` WHERE  `entry`=423 AND `item`=7809 AND `groupid`=0;

-- Freedom for all creatures
-- https://github.com/LightsHope/server/issues/139
UPDATE `quest_template` SET `NextQuestId`=2970, `ExclusiveGroup`=0, `NextQuestInChain`=0 WHERE `entry`=2969;
UPDATE `quest_template` SET `PrevQuestId`=2969, `NextQuestId`=0, `ExclusiveGroup`=0 WHERE `entry`=2970;
UPDATE `quest_template` SET `PrevQuestId`=2970 WHERE `entry`=2972;
UPDATE `quest_template` SET `MinLevel`=40 WHERE `entry`=2972;

-- Dragon's Call
-- https://github.com/LightsHope/server/issues/146
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=0.5 WHERE `entry`=5709 AND `item`=10847 AND `groupid`=0;

-- Satyr's Bow
-- https://github.com/LightsHope/server/issues/152
REPLACE INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `BuyPrice`, `SellPrice`, `InventoryType`, `ItemLevel`, `RequiredLevel`, `stat_type1`, `stat_value1`, `dmg_min1`, `dmg_max1`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcooldown_5`, `bonding`, `Material`, `MaxDurability`, `DisenchantID`) VALUES (18323, 8, 2, 2, 'Satyr\'s Bow', 30683, 3, 164943, 32988, 15, 58, 53, 3, 3, 50, 93, 2400, 2, 100, 15464, 1, 0, 1, 2, 75, 48);
UPDATE `item_template` SET `stat_value1`=7 WHERE `entry`=18323 AND `patch`=1;

-- Malowns Slam proc
-- https://github.com/LightsHope/server/issues/95
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectTriggerSpell`, `Comment`) 
VALUES (17500, 1, 64, 6, 0, 17499, 'Malown\'s Slam strength buff');

-- Pattern: Robe of Winter Night
-- https://github.com/LightsHope/server/issues/174
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=2 WHERE `entry`=7437 AND `item`=14493 AND `groupid`=0;

-- Oozeling no loot
-- https://github.com/LightsHope/server/issues/175
DELETE FROM `creature_loot_template` WHERE `entry`=8257;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=8257;

-- Summoners Tomb loot
-- https://github.com/LightsHope/server/issues/177
DELETE FROM `creature_loot_template` WHERE `item` IN (11920,11921,11922,11923,11925,11926,11927,11929);

-- Shimmering Gloves
-- https://github.com/LightsHope/server/issues/195
DELETE FROM `npc_vendor` WHERE `entry`=3572 AND `item`=6565;

-- Black Dragonflight Molt
-- https://github.com/LightsHope/server/issues/196
UPDATE `item_loot_template` SET `ChanceOrQuestChance`=100 WHERE  `entry`=10569 AND `item`=10575;

-- Empyrean Demolisher proc rate
-- https://github.com/LightsHope/server/issues/111
UPDATE `item_template` SET `spellppmRate_1`=1.5 WHERE  `entry`=17112 AND `patch`=0;

-- Removed rare portrait
-- https://github.com/elysium-project/server/pull/2604
UPDATE creature_template SET rank=1 WHERE entry IN (10812,10438,10417,10440,16446,13419,12101,11668,11665,16143,16163,16194,12100,12076,11667,11664,16216,16447,16803,16215,15391,15220,15208,15207,11672,15324,15206,15338,16020,16290,16149,14502,12801,12800,16067,16297,14302,12802,15067,16236,16127,10984,14262,14261,14265,14264,14263,11669,15181,14503,15088,15182,11121,1050,15199,15195,15209,12156,15212,15211,15307,15308);
UPDATE creature_template SET rank=0 WHERE entry IN (15667);

-- Removed tastyfish from STV fishing tables
-- https://github.com/LightsHope/server/issues/253
DELETE FROM `fishing_loot_template` WHERE `entry`=33 AND `item`=19807;

-- Quiraj Lasher
-- https://github.com/LightsHope/server/issues/301
DELETE FROM `creature` WHERE `guid`=87017;

-- Noth faction specific loot
-- https://github.com/LightsHope/server/issues/372
UPDATE `reference_loot_template` SET `condition_id`=2 WHERE `entry`=329444 AND `item`=23005;
UPDATE `reference_loot_template` SET `condition_id`=3 WHERE `entry`=329444 AND `item`=23006;

-- Tainted Pierce proc rate
-- https://github.com/LightsHope/server/issues/378
UPDATE `item_template` SET `spellppmRate_1`=1 WHERE `entry`=8225;

-- Captain Sander's Hidden Treasure
-- https://github.com/LightsHope/server/issues/444
UPDATE `gameobject_template` SET `faction`=0 WHERE  `entry` IN (33,34,35,36);

-- Quest: Junkboxes Needed
-- https://github.com/LightsHope/server/issues/357
UPDATE `quest_template` SET `RequiredMinRepFaction`=0, `RequiredMinRepValue`=0 WHERE `entry`=8249;

-- The Fate of Ramaladni
-- https://github.com/LightsHope/server/issues/423
UPDATE `quest_template` SET `PrevQuestId`=9033 WHERE  `entry`=9229 AND `patch`=9;
UPDATE `quest_template` SET `NextQuestInChain`=0,`NextQuestId`=9229 WHERE  `entry`=9033 AND `patch`=9;

-- The Madness Within
-- https://github.com/LightsHope/server/issues/102
UPDATE `quest_template` SET `NextQuestInChain`=0 WHERE  `entry`=7461;

-- Remove hearthstone from innkeepers
-- https://github.com/LightsHope/server/issues/173
DELETE FROM `npc_vendor` WHERE `item`=6948;

-- T0 bosses despawn time
-- https://github.com/LightsHope/server/issues/341
UPDATE `creature_ai_scripts` SET `action1_param3`=3600000 WHERE `id` IN (1604401,1604402,1604801,1604802,1604701,1604702,1604501,1604502);
UPDATE `creature_ai_scripts` SET `action1_param3`=3600000, `action2_param3`=3600000 WHERE `id` IN (1604601,1604602);

-- Conflagration double damage
-- https://github.com/LightsHope/server/issues/334
REPLACE INTO `spell_effect_mod` (`Id`, `EffectApplyAuraName`, `Comment`) VALUES (16805, 0, 'Conflagration prevent double damage');
REPLACE INTO `spell_effect_mod` (`Id`, `EffectApplyAuraName`, `Comment`) VALUES (23023, 0, 'Conflagration prevent double damage');

-- Healing Ward
-- https://github.com/LightsHope/server/issues/424
UPDATE `creature_template` SET `AIName`='TotemAI', `ScriptName`='' WHERE `entry`=10218;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
