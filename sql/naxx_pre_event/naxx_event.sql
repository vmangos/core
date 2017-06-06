-- ----------------------
-- Game Events
-- ----------------------

INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES
(110, '2014-03-30 05:25:00', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 1 - Circle spawn', 0, 0),
(111, '2014-03-30 05:25:03', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Consacred earth spawn around Circle 1', 0, 0),
(112, '2014-03-30 05:25:06', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Consacred earth spawn around Circle 2', 0, 0),
(113, '2014-03-30 05:25:09', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Consacred earth spawn around Circle 3', 0, 0),
(114, '2014-03-30 05:25:12', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Consacred earth spawn around Circle 4', 0, 0),
(115, '2014-03-30 05:25:15', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Consacred earth spawn around Circle 5', 0, 0),
(116, '2014-03-30 05:25:18', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 2 - Aura on Consacred earth spawn around Circle', 0, 0),
(117, '2014-03-30 05:25:21', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 3 - Citadel spawn', 0, 0),
(118, '2014-03-30 05:25:24', '2014-03-30 05:30:00', 525600, 33720, 0, 'Event Naxxramass phase 4 - Skeleton spawn / Quest activation lvl 9-11', 0, 0),
(119, '2014-03-30 05:25:00', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.1 - Circle spawn outside cities', 0, 0),
(120, '2014-03-30 05:25:03', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Consacred earth spawn around Circle 1 outside cities', 0, 0),
(121, '2014-03-30 05:25:06', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Consacred earth spawn around Circle 2 outside cities', 0, 0),
(122, '2014-03-30 05:25:09', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Consacred earth spawn around Circle 3 outside cities', 0, 0),
(123, '2014-03-30 05:25:12', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Consacred earth spawn around Circle 4 outside cities', 0, 0),
(124, '2014-03-30 05:25:15', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Consacred earth spawn around Circle 5 outside cities', 0, 0),
(125, '2014-03-30 05:25:18', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.2 - Aura on Consacred earth spawn around Circle outside cities', 0, 0),
(126, '2014-03-30 05:25:21', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.3 - Citadel spawn outside cities', 0, 0),
(127, '2014-03-30 05:25:24', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P2.4 - Skeleton spawn / Quest activation', 0, 0),
(128, '2014-03-30 05:25:24', '2014-04-20 04:30:00', 525600, 33720, 0, 'Event Naxxramass P3   - Boss in instance activation', 0, 0),
(129, '2014-03-30 05:25:24', '2014-04-20 04:30:00', 525600, 2592000, 0, 'Event Naxxramas P2.5 - Invasion Stormwind', 0, 0),
(130, '2014-03-30 05:25:24', '2014-04-20 04:30:00', 525600, 2592000, 0, 'Event Naxxramas P2.5 - Invasion Undercity', 0, 0);


-- ----------------------
-- Texts
-- ----------------------

-- Add missing texts
DELETE FROM `npc_text` WHERE `ID` IN (20101, 20104, 20105);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(20101, 'The battle is won. For the time being, the Scourge threat has been pushed back. Our resources can be channeled into aiding you, in thanks and preparation for the future.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20104, 'The battle goes well. The Scourge forces seem weakened. I believe it will only be a matter of time before we drive them from our shores. I will turn my magics to you, to aid in this struggle.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20105, 'The first steps of our fight against the Scourge go well. We have had some successes, and hopefully my assistance can aid you in bringing future success to the battle.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- Update text for getting magic item.
UPDATE `nostalrius_string` SET `content_default`='Give me one of your magic items.', `content_loc2`='Donnez-moi un de vos objets magiques.' WHERE  `entry`=121;

-- Add texts for Shadow of Doom
INSERT INTO `nostalrius_string` (`entry`, `content_default`) VALUES
(135, 'Our dark master has noticed your trifling, and sends me to bring a message... of doom!'),
(136, 'Your battle here is but the smallest mote of a world wide invasion, whelp!  It is time you learned of the powers you face!');

UPDATE `npc_text` SET `text0_0`='This cultist is in a deep trance...' WHERE  `ID`=20100;

-- ----------------------
-- Add boss spawns
-- ----------------------

-- Creatures
SET @CGUID:=2349;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+5;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES
(@CGUID+0, 14682, 33, 0, 0, -225.113, 2303.42, 94.6767, 5.91654, 300, 0, 0, 1, 0, 0, 0, 0), -- Sever - Level 21 - Shadowfang Keep
(@CGUID+1, 14693, 189, 0, 0, 1797.17, 1308.18, 18.6715, 4.71688, 300, 0, 0, 1, 0, 0, 0, 0), -- Scorn - Level 32 - Scarlet Monestary
(@CGUID+2, 14686, 129, 0, 0, 2582.66, 695.779, 56.871, 2.04211, 300, 0, 0, 1, 0, 0, 0, 0), -- Lady Falther'ess - Level 37 - Razorfen Downs
(@CGUID+3, 14690, 429, 0, 0, 29.7657, 547.141, -4.39526, 6.27435, 300, 0, 0, 1, 0, 0, 0, 0), -- Revanchion - Level 60 - Dire Maul
(@CGUID+4, 14695, 289, 0, 1, 200.29, 151.785, 109.795, 3.19581, 300, 0, 0, 1, 0, 0, 0, 0), -- Lord Blackwood - Level 60 - Scholomance
(@CGUID+5, 14684, 329, 0, 1, 3503.92, -3313.75, 130.357, 4.65155, 300, 0, 0, 1, 0, 0, 0, 0); -- Balzaphon - Level 60 - Stratholme

-- Add instance bosses. 128 - Event Naxxramass P3 - Boss in instance activation
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+5;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID+0, 128),
(@CGUID+1, 128),
(@CGUID+2, 128),
(@CGUID+3, 128),
(@CGUID+4, 128),
(@CGUID+5, 128);

-- Add ghost glow
DELETE FROM `creature_template_addon` WHERE `entry` IN (14682, 14693, 14686, 14690, 14695, 14684);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
(14682, 0, 0, 0, 0, 0, 0, '50596'),
(14693, 0, 0, 0, 0, 0, 0, '50596'),
(14686, 0, 0, 0, 0, 0, 0, '50596'),
(14690, 0, 0, 0, 0, 0, 0, '50596'),
(14695, 0, 0, 0, 0, 0, 0, '50596'),
(14684, 0, 0, 0, 0, 0, 0, '50596');

-- ----------------------
-- Fix spawns
-- ----------------------
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES
(2530150, 16285, 0, 0, 0, -4935.45, -990.098, 501.456, 2.40353, 25, 0, 0, 8, 0, 0, 0, 0),
(2530151, 16241, 0, 0, 798, -4934.06, -988.571, 501.459, 2.40353, 25, 0, 0, 300, 0, 0, 1, 0),
(2530152, 16786, 0, 0, 0, -4932.81, -987.199, 501.461, 2.40353, 25, 0, 0, 300, 0, 0, 1, 0);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES
(3998511, 181256, 0, -4923.36, -979.323, 501.471, 2.2426, 0, 0, 0.900666, 0.434513, 25, 100, 1, 0),
(3998516, 181254, 0, -4930.26, -992.487, 501.443, 2.36819, 0, 0, 0.926159, 0.377134, 25, 100, 1, 0),
(3998517, 181256, 0, -4929.6, -986.764, 501.459, 2.27002, 0, 0, 0.906538, 0.422124, 25, 100, 1, 0),
(3998518, 181256, 0, -4936.46, -992.14, 501.453, 2.20325, 0, 0, 0.891943, 0.452147, 25, 100, 1, 0),
(3998519, 181255, 0, -4930.98, -987.826, 501.458, 2.58025, 0, 0, 0.960869, 0.277003, 25, 100, 1, 0),
(3998520, 181255, 0, -4930.98, -987.826, 502.024, 2.42317, 0, 0, 0.936174, 0.351538, 25, 100, 1, 0),
(3998521, 181256, 0, -4917.47, -981.636, 501.451, 1.46499, 0, 0, 0.668728, 0.743507, 25, 100, 1, 0);

UPDATE `creature_template` SET `ScriptName`='npc_spectral_spirit' WHERE `entry`=16437;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_spirit' WHERE `entry`=16437;
UPDATE `creature_template` SET `ScriptName`='npc_skeletal_trooper' WHERE `entry`=16438;
UPDATE `creature_template` SET `ScriptName`='npc_skeletal_shocktrooper' WHERE `entry`=16299;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_soldier' WHERE `entry`=16298;
UPDATE `creature_template` SET `ScriptName`='npc_cultist_engineer' WHERE `entry`=16230;
UPDATE `creature_template` SET `ScriptName`='npc_shadow_of_doom' WHERE `entry`=16143;
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_berserker' WHERE  `entry`=16141;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_apparition' WHERE  `entry`=16423;
UPDATE `creature_template` SET `ScriptName`='npc_bone_witch' WHERE  `entry`=16380;
UPDATE `creature_template` SET `ScriptName`='npc_spirit_of_the_damned' WHERE  `entry`=16379;

UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181223;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181215;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181374;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181373;

-- ----------------------
-- Spells
-- ----------------------

/*
-- SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES = 28373, // Communique, Necropolis-to-Proxies
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16136);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16386);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16398);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (28373, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 18, 8, 0, -1, -1, -1, -1, 'Communication necropol');
*/

/*
-- SPELL_DMG_BOOST_AT_PYLON_DEATH = 28681, // [Soul Revival] Increases all damage caused by 10%.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (28861, 1, 16592);
*/

/*
-- SPELL_ZAP_CRYSTAL = 28032, // [Zap Crystal]. 15 damage.
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (28032, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 25, 0, -1, -1, -1, -1, -1, 'Zap Crystal');
*/
