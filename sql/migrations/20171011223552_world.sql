DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171011223552');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171011223552');
-- Add your query below.


-- ZHC proc flags
-- https://github.com/elysium-project/server/issues/2377
UPDATE `spell_proc_event` SET `procEx`=65536 WHERE `entry`=24658;

-- Seeing What Happens
-- https://github.com/elysium-project/server/issues/2631
UPDATE `quest_template` SET `MinLevel`=45 WHERE `entry`=2946;
UPDATE `quest_template` SET `MinLevel`=46 WHERE `entry`=2977;

-- Eunice Burch campfire
-- https://github.com/elysium-project/server/issues/2718
DELETE FROM `npc_trainer` WHERE  `entry`=4552 AND `spell`=1290;

-- Augustus' Receipt Book
-- https://github.com/elysium-project/server/issues/2704
UPDATE `quest_template` SET `MinLevel`=50, `QuestLevel`=55 WHERE  `entry`=6164;

-- Blessed Sunfruit Juice stacking
-- https://github.com/elysium-project/server/issues/2740
REPLACE INTO spell_mod (`Id`, `SpellFamilyName`, `Comment`) VALUES (18141, 0, 'Blessed Sunfruit Juice allow stacking');

-- Doling Justice chain
-- https://github.com/elysium-project/server/issues/2525
UPDATE `quest_template` SET `MinLevel`=38 WHERE  `entry` IN (2970,2972,2969,3841,3842,3843,4297,4298);

-- Fish in a Bucket
-- https://github.com/elysium-project/server/issues/2729
UPDATE `quest_template` SET `QuestLevel`=1, `PrevQuestId`=0, `RewMoneyMaxLevel`=50 WHERE  `entry`=5421;

-- Anubisath Defender combat pulse
-- https://github.com/elysium-project/server/issues/1003
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `action1_type`, `comment`) 
VALUES (1527772, 15277, 4, 38, 'Anubisath Defender - Zone combat pulse');

-- Spirestone faction
-- https://github.com/elysium-project/server/issues/2758
UPDATE `creature_template` SET `faction_A`=45, `faction_H`=45 WHERE  name like '%spirestone%';

-- Fire mobs immunities
-- https://github.com/elysium-project/server/issues/2716
UPDATE `creature_template` SET `MechanicImmuneMask`= MechanicImmuneMask | 25094
WHERE entry IN (575,2745,2760,3417,4036,4037,4038,5850,5852,5893,5896,6520,6521,7266,7738,8281,8909,8910,8911,9026,9178,9376,9878,9879,14460,14461,15209,17003);

-- Lord Alexei Barov
-- https://github.com/elysium-project/server/issues/1376
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100 WHERE  `entry`=10504 AND `item`=323616 AND `groupid`=1;

-- Vek'nilash and Viscidus loot
-- https://github.com/elysium-project/server/issues/1133
UPDATE `reference_loot_template` SET `condition_id`=2 WHERE `item` IN (21624,21607);
UPDATE `reference_loot_template` SET `condition_id`=3 WHERE `item` IN (21606,21623);

-- Staff of Nobles
-- https://github.com/elysium-project/server/issues/2965
DELETE FROM `reference_loot_template` WHERE `item`=3902;
DELETE FROM `reference_loot_template` WHERE `item`=5967;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (596, 3902, 26);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (596, 5967, 64);

-- Schematic: Red Firework
-- https://github.com/elysium-project/server/issues/2969
REPLACE INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES (3413, 18647, 1, 600);

-- Pink Mageweave Shirt
-- https://github.com/elysium-project/server/issues/2994
UPDATE `npc_vendor` SET `maxcount`=1, `incrtime`=7200 WHERE `entry`=8681 AND `item`=10317;
DELETE FROM `npc_trainer` WHERE `spell`=12124;

-- The Ice Guard / The Shadow Guard
-- https://github.com/elysium-project/server/issues/2489
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE  `entry` IN (9213,9211);

-- Node locations
-- https://github.com/elysium-project/server/issues/2971
-- https://github.com/elysium-project/server/issues/2623
-- https://github.com/elysium-project/server/issues/777
UPDATE `gameobject` SET `position_z`=32.4 WHERE  `guid`=1469;
UPDATE `gameobject` SET `position_x`=-9200.89, `position_y`=-2441.78, `position_z`=60.0945 WHERE  `guid`=5236;
UPDATE `gameobject` SET `position_x`=-9045.17, `position_y`=-2379.82, `position_z`=135.04 WHERE  `guid`=5228;
UPDATE `gameobject` SET `position_x`=-9110.86, `position_y`=-2796.44, `position_z`=106.933 WHERE  `guid`=5632;

-- Zanzil Witch Doctors
-- https://github.com/elysium-project/server/issues/2978
UPDATE `creature_template` SET `mindmg`=72, `maxdmg`=114 WHERE  `entry`=1490 AND `patch`=0;

-- Cortello's Riddle
-- https://github.com/elysium-project/server/issues/2992
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (1336, 1, 'Cortello\'s Riddle');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) 
VALUES (12172, 1336, 'Cortello\'s Riddle'),(11652, 1336, 'Cortello\'s Riddle'),(11133, 1336, 'Cortello\'s Riddle');

-- Steamwheedle Cartel reputation quests
-- https://github.com/elysium-project/server/issues/3016
REPLACE INTO `quest_template` (`entry`, `patch`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `RequiredMaxRepFaction`, `SpecialFlags`, `Title`, `OfferRewardText`, `RequestItemsText`, `ReqItemId1`, `ReqItemId2`, `ReqItemCount1`, `ReqItemCount2`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`) 
VALUES (9266, 9, 0, 618, 40, 60, 577, 1, 'Making Amends', 'Thank you, $N. You\'re on a quick path to redeeming yourself with our fair town.', 'You must\'ve done something really bad to us or our friends, $N. At any rate, I\'m here to offer you a way to get our good graces back.$b$bAs you know, Winterspring is quite cold. With so many of us goblins coming from other cities, we could use a hand keeping warm. Bring me some runecloth and coal and I\'ll put in the good word for ya. Be warned though, our enemies are not going to take kindly to your helping us.', 14047, 3857, 40, 4, 87, 470, 21, 369, 577, -500, 250, 250, 250, 500);
UPDATE `quest_template` SET `MinLevel`=15, `QuestLevel`=60, `SpecialFlags`=1, `RewRepFaction3`=21, `RewRepFaction4`=369, `RewRepFaction5`=577, `RewRepValue3`=250, `RewRepValue4`=250, `RewRepValue5`=250 WHERE  `entry`=9267;
UPDATE `quest_template` SET `Details`='', `Objectives`='', `ObjectiveText1`='', `ObjectiveText2`='', `ObjectiveText3`='', `ObjectiveText4`='', `CompleteEmote`=1 WHERE  `entry`=9266;
UPDATE `quest_template` SET `QuestLevel`=60 WHERE  `entry`=9268;
UPDATE `quest_template` SET `QuestLevel`=60 WHERE  `entry`=9259;
REPLACE INTO `creature_questrelation` (`id`, `quest`, `patch`) VALUES (16416, 9266, 9);
REPLACE INTO `creature_involvedrelation` (`id`, `quest`, `patch`) VALUES (16416, 9266, 9);

-- Protection potion stack rules
-- https://github.com/elysium-project/server/issues/3039
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1074, 0, 7233),(1074, 1, 17543);
REPLACE INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1074, 3);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1075, 0, 7239),(1075, 1, 17544);
REPLACE INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1075, 3);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1076, 0, 7254),(1076, 1, 17546);
REPLACE INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1076, 3);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES (1077, 0, 7242),(1077, 1, 17548);
REPLACE INTO `spell_group_stack_rules` (`group_id`, `stack_rule`) VALUES (1077, 3);

-- Target Dummy spawn effect
-- https://github.com/elysium-project/server/issues/3007
REPLACE INTO `spell_mod` (`Id`, `Attributes`, `Comment`) VALUES (4092, 16, 'Advanced Target Dummy Spawn Effect');

-- Earthfury BoE drop rates
-- https://github.com/elysium-project/server/issues/2990
REPLACE INTO `creature_loot_template` VALUES 
(11673, 16838, 0.36, 0, 1, 1, 2),
(12100, 16838, 0.28, 0, 1, 1, 2),
(12101, 16838, 0.2, 0, 1, 1, 2),
(12119, 16838, 0.52, 0, 1, 1, 2),
(11666, 16838, 0.32, 0, 1, 1, 2),
(11658, 16838, 0.28, 0, 1, 1, 2),
(11664, 16838, 0.16, 0, 1, 1, 2),
(11663, 16838, 0.04, 0, 1, 1, 2),
(11659, 16838, 0.56, 0, 1, 1, 2),
(12076, 16838, 0.16, 0, 1, 1, 2),
(11668, 16838, 0.28, 0, 1, 1, 2),
(11662, 16838, 0.44, 0, 1, 1, 2),
(11665, 16838, 0.12, 0, 1, 1, 2),
(11661, 16838, 0.16, 0, 1, 1, 2),
(11667, 16838, 0.16, 0, 1, 1, 2),
(11661, 16840, 0.48, 0, 1, 1, 2),
(11664, 16840, 0.4, 0, 1, 1, 2),
(11663, 16840, 0.06, 0, 1, 1, 2),
(12101, 16840, 0.16, 0, 1, 1, 2),
(11673, 16840, 0.24, 0, 1, 1, 2),
(11668, 16840, 0.24, 0, 1, 1, 2),
(11666, 16840, 0.4, 0, 1, 1, 2),
(11662, 16840, 0.24, 0, 1, 1, 2),
(11658, 16840, 0.28, 0, 1, 1, 2),
(12119, 16840, 0.14, 0, 1, 1, 2),
(11665, 16840, 0.1, 0, 1, 1, 2),
(12100, 16840, 0.24, 0, 1, 1, 2),
(11667, 16840, 0.16, 0, 1, 1, 2),
(12076, 16840, 0.16, 0, 1, 1, 2),
(11659, 16840, 0.32, 0, 1, 1, 2);

-- Armor of Faith
-- https://github.com/elysium-project/server/issues/2813
REPLACE INTO `spell_mod` (`Id`, `SpellFamilyName`, `Comment`) VALUES (28810, 0, 'Armor of Faith: Allow stacking');

-- Puncture Armor / Faerie Fire prevent stacking
-- https://github.com/elysium-project/server/issues/2761
REPLACE INTO `spell_group_stack_rules` (`group_id`) VALUES (1078);
REPLACE INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`) VALUES 
(1078, 0, 17315),
(1078, 1, 11791),
(1078, 2, 770),
(1078, 3, 778),
(1078, 4, 9749),
(1078, 5, 9907),
(1078, 6, 13752),
(1078, 7, 16857),
(1078, 8, 17390),
(1078, 9, 17391),
(1078, 10, 17392),
(1078, 11, 21670),
(1078, 12, 20656);

-- Puncture Armor / Armor Shatter stack between casters
-- https://github.com/elysium-project/server/issues/2762
REPLACE INTO `spell_mod` (`Id`, `Custom`, `Comment`) VALUES 
(11791, 1, 'Puncture Armor: Stack between casters'),
(17315, 1, 'Puncture Armor: Stack between casters'),
(16928, 1, 'Armor Shatter: Stack between casters');

-- Captain Sander's Treasure Map
-- https://github.com/elysium-project/server/issues/3084
UPDATE `quest_template` SET `RequiredRaces`=0 WHERE  `entry` IN (136,138,139,140);

-- Crossroads Conscription
-- https://github.com/elysium-project/server/issues/3090
UPDATE `quest_template` SET `OfferRewardText`='Alright, $n. You want to earn your keep with the Horde? Well there\'s plenty to do here, so listen close and do what you\'re told.$B$B$gI see that look in your eyes, do not think I will tolerate any insolence. Thrall himself has declared the Hordes females to be on equal footing with you men. Disrespect me in the slightest, and you will know true pain:I\'m happy to have met you. Thrall will be glad to know that more females like you and I are taking the initiative to push forward in the Barrens.;' WHERE `entry`=842;

-- Bloodaxe Worg Pup
-- https://github.com/elysium-project/server/issues/3097
UPDATE `creature_template` SET `faction_A`=38 WHERE  `entry`=10221;

-- Scourgestone text
-- https://github.com/elysium-project/server/issues/2842
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!\r\n\r\nTo acquire a valor token in such a manner indicates that you are a true hero in the cause of good. We value all effort brought to bear against the Scourge, but to take down one of their leaders is to truly deliver onto them a crushing defeat!\r\n\r\nFor the Dawn, my $gbrother:sister;!' WHERE  `entry`=5404;
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!\r\n\r\nTo acquire a valor token in such a manner indicates that you are a true hero in the cause of good. We value all effort brought to bear against the Scourge, but to take down one of their leaders is to truly deliver onto them a crushing defeat!\r\n\r\nFor the Dawn, my $gbrother:sister;!' WHERE  `entry`=5406;
UPDATE `quest_template` SET `OfferRewardText`='Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!\r\n\r\nTo acquire a valor token in such a manner indicates that you are a true hero in the cause of good. We value all effort brought to bear against the Scourge, but to take down one of their leaders is to truly deliver onto them a crushing defeat!\r\n\r\nFor the Dawn, my $gbrother:sister;!' WHERE  `entry`=5508;

-- Corrupted Sabers
-- https://github.com/elysium-project/server/issues/2678
UPDATE `script_texts` SET `content_default`='%s follows $n obediently.' WHERE  `entry`=-1000542;

-- Tameable pets remove immunities
UPDATE `creature_template` SET `MechanicImmuneMask`=0 WHERE entry in (3653,4425,4887,5708);

-- Shadow Mastery remove effect 1 to prevent double scaling on corruption
REPLACE INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectBasePoints`, `Comment`) VALUES 
(18271, 1, 0, 'Shadow Mastery - Remove double corruption scaling'),
(18272, 1, 0, 'Shadow Mastery - Remove double corruption scaling'),
(18273, 1, 0, 'Shadow Mastery - Remove double corruption scaling'),
(18274, 1, 0, 'Shadow Mastery - Remove double corruption scaling'),
(18275, 1, 0, 'Shadow Mastery - Remove double corruption scaling');

-- Kul Tiras no PvP flag
-- https://github.com/LightsHope/server/issues/62
UPDATE `creature_template` SET `faction_A`=12, `faction_H`=12 WHERE `entry` IN (3128,3129,3192);

-- Stormpike Emissary (duplicate spawn)
-- https://github.com/LightsHope/server/issues/38
DELETE FROM `creature` WHERE `guid`=83184;
DELETE FROM `creature_addon` WHERE `guid`=83184;
DELETE FROM `game_event_creature` WHERE `guid`=83184;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

