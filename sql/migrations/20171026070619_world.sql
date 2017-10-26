DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171026070619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171026070619');
-- Add your query below.

-- -------------------------------
--
-- SCOURGE INVASION
--
-- Event logic is hard coded in scripts for necrop spawns and related spawns
-- Quests, creature and other event objects are defined here.
--
-- -------------------------------


SET @CGUID_BOSS:=2349;
SET @CGUID_GENERAL:=12410;
SET @OGUID_GENERAL:=1267;
SET @Event_1:=17; -- Scourge Invasion
SET @Event_2:=80; -- Scourge Invasion - Skeleton spawn / Quest activation lvl 9-11
SET @Event_3:=81; -- Scourge Invasion - Boss in instance activation

-- Delete time!
DELETE FROM `game_event_gameobject` WHERE `event` IN (17, 110, 111, 112, 113, 114, 115, 116, 117, 119, 120, 121, 122, 123, 124, 125, 126);
DELETE FROM `game_event_creature` WHERE `event` IN (17, 80, 118, 126, 127);

-- ----------------------
-- Texts
-- ----------------------
UPDATE `npc_text` SET `text0_0`='This cultist is in a deep trance...' WHERE `ID`=20100;
UPDATE `npc_text` SET `text0_0`='The time has come for Horde and Alliance to look towards Northrend and the invasion of the Lich King. In recent days, territories across Kalimdor and the Eastern Kingdoms have come under attack. Will you take up arms to save your land from destruction at their hands?' WHERE `ID`=20102;

-- Add missing texts
DELETE FROM `npc_text` WHERE `ID` IN (20100, 20101, 20102, 20104, 20105, 20106, 20107, 20108, 20109, 20110, 20111, 20112, 20113, 20114, 20115, 20116, 20117, 20118);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(20100, 'This cultist is in a deep trance...', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20101, 'The battle is won. For the time being, the Scourge threat has been pushed back. Our resources can be channeled into aiding you, in thanks and preparation for the future.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20102, 'The time has come for Horde and Alliance to look towards Northrend and the invasion of the Lich King. In recent days, territories across Kalimdor and the Eastern Kingdoms have come under attack. Will you take up arms to save your land from destruction at their hands?', NULL, 0, 1, 6, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20104, 'The battle goes well. The Scourge forces seem weakened. I believe it will only be a matter of time before we drive them from our shores. I will turn my magics to you, to aid in this struggle.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20105, 'The first steps of our fight against the Scourge go well. We have had some successes, and hopefully my assistance can aid you in bringing future success to the battle.', '', 0, 1, 6, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(20106, 'The tides of war have come again. From the cold north, the Lich King\'s necropolises have laid siege to', '', 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20107, 'The Scourge are establishing small staging points in the places under attack, receiving communications and other assistance from the necropolises that fly overhead. From what we can tell, the only way to root them out is by killing the ground forces that surround the points.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20108, 'The Lich King brought only small forces to bear against each of Azeroth\'s capital cities, while their main forces periodically attack the following lands:$B$BAzshara, the Blasted Lands, the Burning Steppes, the Tanaris Desert, the Eastern Plaguelands and Winterspring.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20109, 'Indeed, the hills of Winterspring are currently attempting to withstand a renewed Scourge assault.Your assistance would help them greatly.$B$BNumber of Necropolises remaining : $2284W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20110, 'It seems the army of the Scourge has come to Tanaris. A significant number of their necropolises and other forces have been dispatched there.$B$BNumber of Necropolises remaining: $2283W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20111, 'The Scourge infestation grows in the Blasted Lands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2280W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20112, 'If additional support is not soon sent to the Burning Steppes, I fear the Scourge will establish a base of operations there. If you can, you should go there to aid the defenders.$B$BNumber of Necropolises remaining: $2281W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20113, 'The Scourge infestation grows in Azshara. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2279W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20114, 'The Scourge infestation grows in the Eastern Plaguelands. Every able bodied warrior is needed to stem the tide of their invasion.$B$BNumber of Necropolises remaining: $2282W', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20115, 'We have won $2219W battles against the Scourge.  Gird yourself, $n, for this war is far from over.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20116, 'We have won $2219W battles against the Scourge.  Take heart, $n.  While many battles lie ahead, heroes, heroes from every realm have risen to fight them.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20117, 'We have won $2219W battles against the Scourge.  Stand firm, $n!  We must persevere!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0),
(20118, 'For the time being, that area is free of Scourge influence. I fear it will only be a matter of time before they return.', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0);
-- Update text for getting magic item.
UPDATE `nostalrius_string` SET `content_default`='Give me one of your magic items.', `content_loc2`='Donnez-moi un de vos objets magiques.' WHERE `entry`=121;
UPDATE `nostalrius_string` SET `content_default`='Use 8 necrotic runes and disrupt his ritual.', `content_loc2`='Utilisez 8 runes nécrotiques et interrompez son rituel.' WHERE `entry`=120;

-- Add texts for Shadow of Doom
DELETE FROM `nostalrius_string` WHERE `entry` IN (135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147);
INSERT INTO `nostalrius_string` (`entry`, `content_default`) VALUES
(135, 'Our dark master has noticed your trifling, and sends me to bring a message... of doom!'),
(136, 'Your battle here is but the smallest mote of a world wide invasion, whelp!  It is time you learned of the powers you face!'),
(137, 'What\'s happening?'),
(138, 'What can I do?'),
(139, 'Where are we battling the Scourge?'),
(140, 'Is Winterspring currently under attack?'),
(141, 'Is Tanaris currently under attack?'),
(142, 'Are the Blasted Lands currently under attack?'),
(143, 'Are the Burning Steppes currently under attack?'),
(144, 'Is Azshara currently under attack?'),
(145, 'Are the Eastern Plaguelands currently under attack?'),
(146, 'How many battles have we won?'),
(147, 'I have another question.');

-- ----------------------
-- Creatures
-- ----------------------

UPDATE `creature_template` SET `ScriptName`='npc_spectral_spirit' WHERE `entry`=16437;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_spirit' WHERE `entry`=16437;
UPDATE `creature_template` SET `ScriptName`='npc_skeletal_trooper' WHERE `entry`=16438;
UPDATE `creature_template` SET `ScriptName`='npc_skeletal_shocktrooper' WHERE `entry`=16299;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_soldier' WHERE `entry`=16298;
UPDATE `creature_template` SET `ScriptName`='npc_cultist_engineer' WHERE `entry`=16230;
UPDATE `creature_template` SET `ScriptName`='npc_shadow_of_doom' WHERE `entry`=16143;
UPDATE `creature_template` SET `ScriptName`='npc_ghoul_berserker' WHERE `entry`=16141;
UPDATE `creature_template` SET `ScriptName`='npc_spectral_apparition' WHERE `entry`=16423;
UPDATE `creature_template` SET `ScriptName`='npc_necropolis_relay' WHERE `entry`=16386;
UPDATE `creature_template` SET `ScriptName`='npc_necropolis_proxy' WHERE `entry`=16398;
UPDATE `creature_template` SET `ScriptName`='npc_necrotic_shard' WHERE `entry`=16136;
UPDATE `creature_template` SET `ScriptName`='npc_argent_emissary' WHERE `entry`=16359;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=16786; -- npc_argent_quartermaster
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=16787;

-- Update modelids for several creatures
UPDATE `creature_template` SET `modelid_2`=16238 WHERE  `entry`=16384;
UPDATE `creature_template` SET `modelid_2`=16230 WHERE  `entry`=16395;
UPDATE `creature_template` SET `modelid_2`=16231 WHERE  `entry`=16433;
UPDATE `creature_template` SET `modelid_2`=16232 WHERE  `entry`=16434;
UPDATE `creature_template` SET `modelid_2`=16239 WHERE  `entry`=16435;
UPDATE `creature_template` SET `modelid_2`=16240 WHERE  `entry`=16436;
UPDATE `creature_template` SET `modelid_2`=10672, `modelid_3`=10670 WHERE  `entry`=16511;

UPDATE `creature` SET `modelid`=16230 WHERE `guid`=1242988;

-- Set right factions
UPDATE `creature_template` SET `faction_A`=794, `faction_H`=794 WHERE  `entry`=16786;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16787;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16359;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16285;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16281;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16255;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16241;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16395;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16384;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16433;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16434;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16435;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16436;
UPDATE `creature_template` SET `faction_A`=794, `faction_H`=794 WHERE  `entry`=16511;
UPDATE `creature_template` SET `faction_A`=814, `faction_H`=814 WHERE  `entry`=16510;
UPDATE `creature_template` SET `faction_A`=794, `faction_H`=794 WHERE  `entry`=16508;

-- Argent Scouts have spawned at an Argent Dawn camp in the main cities and give a new quest, Light's Hope Chapel.
-- The quest asks plays to deliver the [Call to Arms Announcement] to the Keeper of the Rolls at Light's Hope Chapel, in Eastern Plaguelands.
-- Add Argent Scouts 16255 and Argent Recruiter 16241 gives quest http://www.wowhead.com/quest=9154/lights-hope-chapel
DELETE FROM `creature_questrelation` WHERE id=16255;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES
(16255, 9154);

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID_BOSS+0 AND @CGUID_BOSS+5;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `patch_min`, `patch_max`) VALUES
(@CGUID_BOSS+0, 14682, 33, 0, 0, -225.113, 2303.42, 94.6767, 5.91654, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10), -- Sever - Level 21 - Shadowfang Keep
(@CGUID_BOSS+1, 14693, 189, 0, 0, 1797.17, 1308.18, 18.6715, 4.71688, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10), -- Scorn - Level 32 - Scarlet Monestary
(@CGUID_BOSS+2, 14686, 129, 0, 0, 2582.66, 695.779, 56.871, 2.04211, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10), -- Lady Falther'ess - Level 37 - Razorfen Downs
(@CGUID_BOSS+3, 14690, 429, 0, 0, 29.7657, 547.141, -4.39526, 6.27435, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10), -- Revanchion - Level 60 - Dire Maul
(@CGUID_BOSS+4, 14695, 289, 0, 1, 200.29, 151.785, 109.795, 3.19581, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10), -- Lord Blackwood - Level 60 - Scholomance
(@CGUID_BOSS+5, 14684, 329, 0, 1, 3503.92, -3313.75, 130.357, 4.65155, 300, 0, 0, 1, 0, 0, 0, 0, 9, 10); -- Balzaphon - Level 60 - Stratholme

-- Add instance bosses
DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID_BOSS+0 AND @CGUID_BOSS+5;
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(@CGUID_BOSS+0, 81),
(@CGUID_BOSS+1, 81),
(@CGUID_BOSS+2, 81),
(@CGUID_BOSS+3, 81),
(@CGUID_BOSS+4, 81),
(@CGUID_BOSS+5, 81);

-- Creature id: 14682
-- Sever
UPDATE creature_template SET AIName='EventAI' WHERE entry=14682;
DELETE FROM creature_ai_scripts WHERE creature_id=14682;
INSERT INTO creature_ai_scripts VALUES 
('1468201','14682','0','0','100','1','20000','25000','20000','30000','11','16508','1','0','0','0','0','0','0','0','0','0','Sever - Intimidating Roar'),
('1468202','14682','2','0','100','0','30','0','0','0','11','20554','1','1','0','0','0','0','0','0','0','0','Sever - Berzerk at 30%'),
('1468203','14682','0','0','100','1','2000','5000','10000','15000','11','17745','1','0','0','0','0','0','0','0','0','0','Sever - Diseased Spit');

-- Creature id: 14684
-- Balzaphon
UPDATE creature_template SET AIName='EventAI' WHERE entry=14684;
DELETE FROM creature_ai_scripts WHERE creature_id=14684;
INSERT INTO creature_ai_scripts VALUES 
('1468401','14684','0','0','100','1','1000','4000','2000','4000','11','16799','1','0','0','0','0','0','0','0','0','0','Balzaphon - Frostbolt'),
('1468402','14684','2','0','100','0','30','0','0','0','11','12096','1','1','0','0','0','0','0','0','0','0','Balzaphon - Fear at 30%');

-- Creature id: 14690
-- Revanchion
UPDATE creature_template SET AIName='EventAI' WHERE entry=14690;
DELETE FROM creature_ai_scripts WHERE creature_id=14690;
INSERT INTO creature_ai_scripts VALUES 
('1469001','14690','0','0','100','1','5000','6000','9000','10000','11','29849','1','0','0','0','0','0','0','0','0','0','Revanchion - Frost Nova'),
('1469002','14690','0','0','100','1','2000','3000','5000','8000','11','15245','1','0','0','0','0','0','0','0','0','0','Revanchion - Shadowbolt Volley');

-- Creature id: 16241
-- Argent Recruiter
UPDATE creature_template SET AIName='EventAI' WHERE entry=16241;
DELETE FROM creature_ai_scripts WHERE creature_id=16241;
INSERT INTO creature_ai_scripts VALUES 
('1624101','16241','1','0','100','1','10000','90000','20000','70000','10','11','18','0','0','0','0','0','0','0','0','0','Argent Recruiter - Random Laugh or Cry Emote'),
('1624102','16241','1','0','100','1','5000','25000','10000','30000','5','1','0','0','0','0','0','0','0','0','0','0','Argent Recruiter - Talk Emote OOC');

-- Creature id: 16255
-- Argent Scout
UPDATE creature_template SET AIName='EventAI' WHERE entry=16255;
DELETE FROM creature_ai_scripts WHERE creature_id=16255;
INSERT INTO creature_ai_scripts VALUES 
('1625501','16255','1','0','100','1','10000','90000','20000','70000','10','11','18','0','0','0','0','0','0','0','0','0','Argent Scout - Random Laugh or Cry Emote'),
('1625502','16255','1','0','100','1','5000','25000','10000','30000','5','1','0','0','0','0','0','0','0','0','0','0','Argent Scout - Talk Emote OOC');

UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14682;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14693;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14686;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14690;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14695;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14697;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=14684;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=16423;
UPDATE `creature_template` SET `subname`=' ' WHERE `entry`=16508;

-- Correct factions
UPDATE `creature_template` SET `faction_A`=1630, `faction_H`=1630 WHERE  `entry`=16423;
UPDATE `creature_template` SET `faction_A`=1630, `faction_H`=1630 WHERE  `entry`=16422;

-- Update Lord Blackwood equipment
UPDATE `creature` SET `equipment_id`=14695 WHERE `guid`=2353;
DELETE FROM `creature_equip_template` WHERE entry=14695;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(14695, 18985, 12893, 5258);

-- Add gossip and quest to Argent quartermaster
UPDATE `creature_template` SET `npcflag`=3, `gossip_menu_id`=50000 WHERE `entry` = 16786;
-- Outfitter only has the gossip to move to lights hope
UPDATE `creature_template` SET `npcflag`=1, `gossip_menu_id`=50000 WHERE `entry` = 16787;

DELETE FROM npc_text where ID = 13915;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) 
VALUES (13915, 'The Argent Dawn coordinates the Scourge\'s opposition at Light\'s Hope Chapel in the Eastern Plaguelands.  Go there for instructions.', 'The Argent Dawn coordinates the Scourge\'s opposition at Light\'s Hope Chapel in the Eastern Plaguelands.  Go there for instructions.', 0, 1, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM gossip_menu where entry = 50000;
INSERT INTO `gossip_menu` VALUES (50000, 13915, 0);

-- Should not be selling anything in vanilla.
DELETE FROM `npc_vendor` WHERE entry in (16786,16787);

delete from creature_involvedrelation where id in (16786,16787);
insert into creature_involvedrelation (id, quest) VALUES
(16786, 9094),
(16786, 9317),
(16786, 9318),
(16786, 9320),
(16786, 9321),
(16786, 9341);

-- Correct several spawns
UPDATE `creature` SET `id`=16255, `equipment_id`=16255 WHERE `guid`=1243007; -- id 16241 equipment_id 798
UPDATE `creature` SET `id`=16255, `equipment_id`=16255 WHERE `guid`=1243009;
UPDATE `creature` SET `id`=16787 WHERE `guid`=1242991;
UPDATE `creature` SET `id`=16359 WHERE `guid`=1242990;
UPDATE `creature` SET `id`=16787 WHERE `guid`=1242984;
UPDATE `creature` SET `id`=16359 WHERE `guid`=1242983;

-- Update Argent Scout equipment
UPDATE `creature` SET `equipment_id`=16255 WHERE `guid`=16255;
DELETE FROM `creature_equip_template` WHERE entry=16255;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16255, 5305, 12980, 0);

-- Update Argent Messenger equipment
UPDATE `creature` SET `equipment_id`=16359 WHERE `guid`=16359;
DELETE FROM `creature_equip_template` WHERE entry=16359;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16359, 5305, 12980, 0);

UPDATE `creature` SET `equipment_id`=16359 WHERE  `guid`=1242983;
UPDATE `creature` SET `equipment_id`=16359 WHERE  `guid`=1242990;

-- Update Argent Dawn Initiate equipment
UPDATE `creature` SET `equipment_id`=16384 WHERE `guid`=16384;
DELETE FROM `creature_equip_template` WHERE entry=16384;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16384, 19053, 0, 0);

UPDATE `creature` SET `equipment_id`=16384 WHERE  `guid`=1242982;
UPDATE `creature` SET `equipment_id`=16384 WHERE  `guid`=1242989;

-- Update Argent Dawn Paladin equipment
UPDATE `creature` SET `equipment_id`=16395 WHERE `guid`=16395;
DELETE FROM `creature_equip_template` WHERE entry=16395;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16395, 19053, 0, 0);

-- Update Argent Dawn Cleric equipment
UPDATE `creature` SET `equipment_id`=16435 WHERE `guid`=16435;
DELETE FROM `creature_equip_template` WHERE entry=16435;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16435, 14873, 0, 0);

-- Update Argent Dawn Priest equipment
UPDATE `creature` SET `equipment_id`=16436 WHERE `guid`=16436;
DELETE FROM `creature_equip_template` WHERE entry=16436;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16436, 18122, 0, 0);

-- Update Argent Dawn Crusader equipment
UPDATE `creature` SET `equipment_id`=16433 WHERE `guid`=16433;
DELETE FROM `creature_equip_template` WHERE entry=16433;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16433, 2196, 0, 0);

-- Update Argent Dawn Crusader equipment
UPDATE `creature` SET `equipment_id`=16433 WHERE `guid`=16433;
DELETE FROM `creature_equip_template` WHERE entry=16433;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
(16433, 2196, 0, 0);

UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16490;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16493;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16494;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16495;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16241;
UPDATE `creature_template` SET `npcflag`=1 WHERE `entry`=16359;
UPDATE `creature_template` SET `npcflag`=2 WHERE `entry`=16255;

DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID_GENERAL+0 AND @CGUID_GENERAL+183;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) VALUES
(@CGUID_GENERAL+0  , 16285, 0, 0, 16285, -4935.45, -990.098, 501.456, 2.40353, 25, 0, 0, 8, 0, 0, 0, 0),
(@CGUID_GENERAL+1  , 16241, 0, 0, 798, -4934.06, -988.571, 501.459, 2.40353, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+2  , 16786, 0, 0, 16786, -4932.81, -987.199, 501.461, 2.40353, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+3  , 16511, 1, 0, 16511, 1589.57, -4413.12, 8.30807, 2.9829, 25, 5, 0, 8, 0, 0, 0, 0),
(@CGUID_GENERAL+4  , 16395, 0, 0, 16395, -4925.02, -985.091, 501.455, 2.30543, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+5  , 16241, 0, 0, 798, -8832.93, 643.004, 94.7504, 4.21086, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+6  , 16285, 0, 0, 16285, -8831.22, 640.154, 94.4378, 3.90063, 25, 0, 0, 8, 0, 0, 0, 0),
(@CGUID_GENERAL+7  , 16395, 0, 0, 16395, -8839.21, 646.997, 96.0542, 3.617884, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+8  , 16786, 0, 0, 16786, -8835.663086, 644.270447, 95.505074, 4.238351, 25, 0, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+9  , 16423, 0, 0, 0, -9041.08, 342.393, 93.4455, 2.48927, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+10 , 16423, 0, 0, 0, -9058.45, 359.37, 92.9135, 2.61494, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+11 , 16423, 0, 0, 0, -9061.93, 327.891, 93.7343, 5.04574, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+12 , 16423, 0, 0, 0, -9076.43, 300.812, 92.6916, 3.00764, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+13 , 16423, 0, 0, 0, -9082.21, 336.391, 93.5654, 0.466875, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+14 , 16423, 0, 0, 0, -9077.59, 378.045, 92.4842, 1.88059, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+15 , 16423, 0, 0, 0, -9141.45, 341.346, 91.4809, 4.43705, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+16 , 16423, 0, 0, 0, -9177.81, 181.701, 72.4589, 4.77477, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+17 , 16423, 0, 0, 0, -9183.76, 148.838, 71.6585, 5.86646, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+18 , 16423, 0, 0, 0, -9218.54, 128.033, 73.2587, 4.83759, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+19 , 16423, 0, 0, 0, -9262.4, 99.3352, 69.8058, 4.32709, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+20 , 16423, 0, 0, 0, -9329.59, 91.8126, 61.4596, 3.38854, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+21 , 16423, 0, 0, 0, -9355.65, 63.1585, 60.3967, 2.88195, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+22 , 16423, 0, 0, 0, -9326.6, 12.3096, 62.1349, 0.262643, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+23 , 16423, 0, 0, 0, -9270.76, -14.9632, 71.9293, 0.15661, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+24 , 16423, 0, 0, 0, -9165.42, -32.8249, 77.7064, 5.54838, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+25 , 16423, 0, 0, 0, -9106.17, 23.2097, 86.6479, 1.23261, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+26 , 16423, 0, 0, 0, -9209.33, -58.6125, 74.9506, 3.00369, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+27 , 16423, 0, 0, 0, -9228.63, -18.9575, 73.4202, 1.69207, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+28 , 16423, 0, 0, 0, -9199.91, 32.5402, 75.5605, 1.23654, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+29 , 16423, 0, 0, 0, -9238.22, 85.1951, 74.0689, 2.21435, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+30 , 16423, 0, 0, 0, -9153.54, 117.705, 77.2912, 3.41994, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+31 , 16423, 0, 0, 0, -9298.32, 212.284, 67.1619, 1.82558, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+32 , 16423, 0, 0, 0, -9242.72, 260.948, 71.9232, 2.36357, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+33 , 16423, 0, 0, 0, -9232.07, 300.686, 74.1951, 3.78907, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+34 , 16423, 0, 0, 0, -9308.42, 321.237, 70.8509, 2.83089, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+35 , 16423, 0, 0, 0, -9223.74, 419.623, 88.2867, 1.15406, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+36 , 16423, 0, 0, 0, -9199.73, 431.799, 90.9798, 0.784924, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+37 , 16423, 0, 0, 0, -9157.91, 439.223, 93.7276, 6.10992, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+38 , 16423, 0, 0, 0, -9172.28, 402.497, 87.3646, 3.82049, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+39 , 16423, 0, 0, 0, 1885.84, 274.476, 54.7195, 0.00644016, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+40 , 16423, 0, 0, 0, 1912.8, 284.649, 49.8581, 1.46335, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+41 , 16423, 0, 0, 0, 1897.29, 320.633, 42.0402, 1.34554, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+42 , 16423, 0, 0, 0, 1878.85, 205.594, 58.8074, 0.532657, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+43 , 16423, 0, 0, 0, 1980.83, 192.938, 32.9406, 3.89417, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+44 , 16423, 0, 0, 0, 1998.99, 171.726, 30.5488, 5.53173, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+45 , 16423, 0, 0, 0, 2050.15, 197.926, 47.6246, 0.493397, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+46 , 16423, 0, 0, 0, 2096.67, 193.772, 57.3139, 0.850753, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+47 , 16423, 0, 0, 0, 2108.91, 239.523, 61.2804, 1.67149, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+48 , 16423, 0, 0, 0, 1974.53, 346.827, 41.2911, 2.39406, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+49 , 16423, 0, 0, 0, 1942.92, 395.825, 38.0968, 0.768286, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+50 , 16423, 0, 0, 0, 2015.07, 447.787, 38.7245, 2.39798, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+51 , 16423, 0, 0, 0, 1995.55, 392.864, 41.9887, 4.78167, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+52 , 16423, 0, 0, 0, 1864.67, 339.807, 61.6347, 5.27647, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+53 , 16423, 1, 0, 0, 1366.55, -4468.33, 28.0429, 4.8011, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+54 , 16423, 1, 0, 0, 1336.63, -4503.62, 26.7644, 5.04064, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+55 , 16423, 1, 0, 0, 1161.76, -4380.52, 26.4073, 3.43058, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+56 , 16423, 1, 0, 0, 1261.72, -4442.55, 26.7162, 3.51305, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+57 , 16423, 1, 0, 0, 1240.1, -4303.54, 27.1389, 1.0626, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+58 , 16423, 1, 0, 0, 1239.13, -4257.44, 25.3062, 1.63987, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+59 , 16423, 1, 0, 0, 1305.32, -4264.64, 25.8662, 5.07206, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+60 , 16423, 1, 0, 0, 1192.56, -4284.2, 21.0845, 3.36381, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+61 , 16423, 1, 0, 0, 1135.33, -4329.67, 26.1925, 4.51442, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+62 , 16423, 1, 0, 0, 1087.66, -4266.55, 19.5832, 3.56016, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+63 , 16423, 1, 0, 0, 1066.61, -4328.92, 20.8856, 4.47515, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+64 , 16423, 1, 0, 0, 1012.3, -4319.8, 17.8397, 2.93184, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+65 , 16423, 1, 0, 0, 977.516, -4371.68, 14.9716, 5.01707, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+66 , 16423, 1, 0, 0, 1055.35, -4473.53, 18.1272, 5.33909, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+67 , 16423, 1, 0, 0, 1083.45, -4523.93, 17.903, 5.19772, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+68 , 16423, 1, 0, 0, 1134.32, -4527.3, 19.647, 0.347882, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+69 , 16423, 1, 0, 0, 1358.45, -4584.26, 32.8256, 6.07736, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+70 , 16423, 1, 0, 0, 1388.76, -4641.64, 31.8307, 5.0642, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+71 , 16423, 1, 0, 0, 1363.26, -4737.33, 27.5461, 4.40448, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+72 , 16423, 1, 0, 0, 1397.35, -4761.8, 27.7985, 5.78677, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+73 , 16423, 1, 0, 0, 1330.91, -4793.59, 23.0603, 3.4345, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+74 , 16423, 1, 0, 0, 1287.79, -4759.83, 19.5867, 2.14252, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+75 , 16423, 1, 0, 0, 1246.87, -4730.07, 16.8273, 5.18594, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+76 , 16423, 1, 0, 0, 1227.57, -4694.01, 16.9351, 1.73411, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+77 , 16423, 1, 0, 0, 1233.1, -4638.87, 17.5293, 1.73019, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+78 , 16423, 1, 0, 0, 1172.73, -4582.68, 18.3191, 2.16216, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+79 , 16423, 1, 0, 0, 1371.48, -4423.58, 29.9217, 5.68703, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+80 , 16423, 1, 0, 0, 1342.23, -4428.83, 26.9684, 6.20932, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+81 , 16423, 0, 0, 0, -5281.35, -543.503, 386.491, 4.52419, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+82 , 16423, 0, 0, 0, -5336.89, -458.786, 388.333, 1.35511, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+83 , 16423, 0, 0, 0, -5368.81, -415.818, 396.13, 2.43111, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+84 , 16423, 0, 0, 0, -5403.15, -385.695, 399.447, 2.88664, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+85 , 16423, 0, 0, 0, -5428.44, -408.415, 398.747, 4.03725, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+86 , 16423, 0, 0, 0, -5474.44, -410.019, 400.42, 3.80163, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+87 , 16423, 0, 0, 0, -5538.34, -538.997, 403.129, 4.28858, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+88 , 16423, 0, 0, 0, -5527.68, -580.528, 405.415, 4.93653, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+89 , 16423, 0, 0, 0, -5482.35, -576.947, 401.77, 0.0788381, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+90 , 16423, 0, 0, 0, -5520.37, -427.978, 405.304, 2.69422, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+91 , 16423, 0, 0, 0, -5689.28, -554.845, 399.182, 5.08183, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+92 , 16423, 0, 0, 0, -5680.58, -599.406, 402.067, 5.00329, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+93 , 16423, 0, 0, 0, -5719.45, -580.863, 400.84, 2.20334, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+94 , 16423, 0, 0, 0, -5741.59, -559.975, 398.413, 3.39715, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+95 , 16423, 0, 0, 0, -5767, -595.299, 397.75, 3.7388, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+96 , 16423, 0, 0, 0, -5798.44, -576.558, 399.055, 3.21651, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+97 , 16423, 0, 0, 0, -5801.28, -626.298, 398.627, 4.62238, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+98 , 16423, 0, 0, 0, -5440.01, -831.022, 395.459, 2.28186, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+99 , 16423, 0, 0, 0, -5483.97, -792.794, 397.693, 2.19547, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+100, 16423, 0, 0, 0, -5528.05, -747.308, 406.177, 1.98734, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+101, 16423, 0, 0, 0, -5559.6, -675.527, 410.972, 2.58031, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+102, 16423, 0, 0, 0, -5534.64, -631.579, 407.635, 1.25299, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+103, 16423, 0, 0, 0, -5518.12, -557.935, 401.313, 5.95359, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+104, 16423, 0, 0, 0, -5689.62, -392.552, 366.191, 0.192688, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+105, 16423, 0, 0, 0, -5677.43, -360.285, 371.156, 0.805298, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+106, 16423, 0, 0, 0, -5638.21, -344.836, 386.678, 5.80043, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+107, 16423, 0, 0, 0, -5581.83, -374.901, 406.903, 5.79651, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+108, 16423, 0, 0, 0, -5218.72, -526.245, 390.668, 0.0788097, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+109, 16423, 0, 0, 0, -5187.42, -541.213, 393.96, 5.17998, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+110, 16423, 0, 0, 0, -5188.32, -599.816, 396.775, 5.3292, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+111, 16423, 0, 0, 0, -5140.85, -614.744, 397.855, 5.99286, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+112, 16423, 0, 0, 0, -5172.73, -641.776, 397.736, 3.89585, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+113, 16423, 0, 0, 0, -5159.08, -577.951, 398.105, 1.58285, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+114, 16423, 0, 0, 0, -5165.82, -603.671, 398.855, 5.51769, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+115, 16423, 0, 0, 0, -5195.09, -491.675, 387.883, 0.985937, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+116, 16423, 0, 0, 0, -5255.23, -411.222, 389.598, 2.50176, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+117, 16423, 0, 0, 0, -5295.13, -412.559, 395.642, 3.3814, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+118, 16423, 0, 0, 0, -5331.58, -367.74, 386.111, 1.43754, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+119, 16423, 0, 0, 0, -5341.26, -420.164, 388.333, 4.63803, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+120, 16423, 0, 0, 0, -5484.05, -482.733, 408.926, 1.08803, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+121, 16423, 1, 0, 0, -1383.4, 229.625, 2.97871, 4.1114, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+122, 16423, 1, 0, 0, -1412.76, 176.057, 3.44212, 4.31561, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+123, 16423, 1, 0, 0, -1483.03, 141.394, -3.96585, 1.50781, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+124, 16423, 1, 0, 0, -1519.3, 106.294, -0.131866, 4.13889, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+125, 16423, 1, 0, 0, -1562.31, 107.013, -4.43843, 3.20427, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+126, 16423, 1, 0, 0, -1580.3, 76.8382, -8.20803, 4.35095, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+127, 16423, 1, 0, 0, -1617.04, 52.2334, -11.8218, 4.36273, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+128, 16423, 1, 0, 0, -1655.72, 62.4677, -11.6827, 2.88618, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+129, 16423, 1, 0, 0, -1670.58, 99.2062, -11.0045, 2.32855, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+130, 16423, 1, 0, 0, -1705.76, 77.8436, -7.09094, 3.68729, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+131, 16423, 1, 0, 0, -1616.25, 113.935, -17.9131, 0.384687, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+132, 16423, 1, 0, 0, -1559.16, 144.319, -7.79245, 1.07976, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+133, 16423, 1, 0, 0, -1611.71, 228.277, 1.18939, 2.6859, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+134, 16423, 1, 0, 0, -1559.31, 237.222, 3.27011, 0.243315, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+135, 16423, 1, 0, 0, -1489.35, 256.71, 3.32315, 0.286512, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+136, 16423, 1, 0, 0, -1429.55, 276.298, 7.52892, 0.349344, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+137, 16423, 1, 0, 0, -1468.05, 201.119, -7.79151, 3.94647, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+138, 16423, 1, 0, 0, -1444.49, 122.886, -2.04196, 5.00283, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+139, 16423, 1, 0, 0, -1563.79, -75.1414, 16.8831, 1.57848, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+140, 16423, 1, 0, 0, -1600.92, -60.1236, 5.21005, 2.98435, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+141, 16423, 1, 0, 0, -1622.95, -110.435, -1.65029, 5.03423, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+142, 16423, 1, 0, 0, -1649.14, -84.9151, -11.0207, 2.35995, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+143, 16423, 1, 0, 0, -1678.16, -60.233, -9.32196, 2.65447, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+144, 16423, 1, 0, 0, -1626.49, -54.0661, -4.35444, 1.08367, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+145, 16423, 1, 0, 0, -1442.53, 13.2507, 33.9057, 0.172611, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+146, 16423, 1, 0, 0, -1553.64, 198.563, -4.55921, 3.01968, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+147, 16423, 1, 0, 0, -1587.86, 194.561, -3.36744, 3.27886, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+148, 16423, 1, 0, 0, -1646.89, 183.458, 2.36883, 3.00004, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+149, 16423, 1, 0, 0, -1698.75, 182.356, 10.6056, 3.42416, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+150, 16423, 1, 0, 0, -1712.09, 136.16, 0.771876, 4.52372, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+151, 16423, 1, 0, 0, -1736.28, 97.8825, -3.66114, 4.57869, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+152, 16423, 1, 0, 0, -1655.47, 138.885, -9.77307, 1.60989, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+153, 16423, 1, 0, 0, 9922.3, 1945.16, 1333.49, 2.96639, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+154, 16423, 1, 0, 0, 9914.25, 1891.04, 1324.36, 4.45473, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+155, 16423, 1, 0, 0, 9892.67, 1855.36, 1317.36, 5.14588, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+156, 16423, 1, 0, 0, 9938.4, 1845.08, 1325.48, 0.889015, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+157, 16423, 1, 0, 0, 9935.4, 1794.64, 1329.47, 5.22834, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+158, 16423, 1, 0, 0, 9914.53, 1756.74, 1327.79, 4.38404, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+159, 16423, 1, 0, 0, 9876.29, 1729.1, 1329.78, 3.65362, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+160, 16423, 1, 0, 0, 9832.66, 1735.41, 1320.23, 2.84466, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+161, 16423, 1, 0, 0, 9802.59, 1754.06, 1314.33, 2.16922, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+162, 16423, 1, 0, 0, 9785.73, 1788.65, 1307.16, 2.08675, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+163, 16423, 1, 0, 0, 9759.83, 1742.99, 1307.37, 5.354, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+164, 16423, 1, 0, 0, 9808.77, 1824.03, 1310.6, 0.57878, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+165, 16423, 1, 0, 0, 9766.39, 1818.64, 1302.34, 3.37087, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+166, 16423, 1, 0, 0, 9861.86, 1854.45, 1317.97, 0.602339, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+167, 16423, 1, 0, 0, 10082.9, 1890.04, 1329.32, 2.66009, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+168, 16423, 1, 0, 0, 10121.8, 1883.77, 1331.06, 0.150735, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+169, 16423, 1, 0, 0, 10098.6, 1827.67, 1330.8, 4.41545, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+170, 16423, 1, 0, 0, 10024.4, 1772.79, 1332.74, 5.76633, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+171, 16423, 1, 0, 0, 10023.1, 1729.33, 1332.46, 2.29095, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+172, 16423, 1, 0, 0, 9951.68, 1774.33, 1333.5, 3.3316, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+173, 16423, 1, 0, 0, 9992.52, 1785.34, 1333.71, 0.987185, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+174, 16423, 1, 0, 0, 9716.41, 1814.05, 1297.41, 1.83541, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+175, 16423, 1, 0, 0, 9696.21, 1840.31, 1299.51, 2.29095, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+176, 16423, 1, 0, 0, 9714.65, 1871.04, 1306.07, 0.728003, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+177, 16423, 1, 0, 0, 9756.88, 1859.74, 1305.55, 6.01373, 25, 5, 0, 137, 0, 0, 1, 0),
(@CGUID_GENERAL+178, 16423, 1, 0, 0, 9728.21, 1843.1, 1302.12, 2.77003, 25, 5, 0, 120, 0, 0, 1, 0),
(@CGUID_GENERAL+179, 16508, 0, 0, 16508, -8822.24, 647.135, 94.4622, 4.71745, 25, 5, 0, 8, 0, 0, 0, 0),
(@CGUID_GENERAL+180, 16787, 1, 0, 16787, 1586.24, -4425.39, 7.83914, 3.34184, 25, 5, 0, 300, 0, 0, 0, 0),
(@CGUID_GENERAL+181, 16359, 1, 0, 16359, 1589.03, -4422.22, 8.61155, 3.34184, 25, 5, 0, 5228, 0, 0, 0, 0),
(@CGUID_GENERAL+182, 16255, 1, 0, 16255, 1587.85, -4418.74, 8.66717, 3.50677, 25, 5, 0, 8, 0, 0, 0, 0),
(@CGUID_GENERAL+183, 16384, 1, 0, 16384, 1581.95, -4413.12, 7.66595, 2.68213, 25, 5, 0, 300, 0, 0, 0, 0);

DELETE FROM `game_event_creature` WHERE `guid` BETWEEN @CGUID_GENERAL+0 AND @CGUID_GENERAL+183 AND `event`=@Event_2;
INSERT INTO `game_event_creature` SELECT creature.guid, @Event_2 FROM `creature` WHERE creature.guid BETWEEN @CGUID_GENERAL+0 AND @CGUID_GENERAL+183;

DELETE FROM `creature` WHERE `guid` IN (1242996, 1242997, 1243011, 1242995, 1242992, 1242993, 1243010, 1242994, 1242988, 1242986, 1242987, 1243008);

-- ----------------------
-- Game Events
-- ----------------------

UPDATE `game_event` SET `start_time`='0000-00-00 00:00:00', `end_time`='0000-00-00 00:00:00', `length`=999999999, `patch_min` = 9, `patch_max` = 10, `disabled` = 1 WHERE `entry`=17; -- Scourge Invasion
UPDATE `game_event` SET `start_time`='0000-00-00 00:00:00', `end_time`='0000-00-00 00:00:00', `length`=999999999, `patch_min` = 9, `patch_max` = 10, `disabled` = 1 WHERE `entry`=155; -- Argent Dawn Spawns
UPDATE `game_event` SET `start_time`='0000-00-00 00:00:00', `end_time`='0000-00-00 00:00:00', `length`=999999999, `patch_min` = 9, `patch_max` = 10, `disabled` = 1, `description`='Scourge Invasion - Phase 2 - Invasion Stormwind' WHERE  `entry`=129;
UPDATE `game_event` SET `start_time`='0000-00-00 00:00:00', `end_time`='0000-00-00 00:00:00', `length`=999999999, `patch_min` = 9, `patch_max` = 10, `disabled` = 1, `description`='Scourge Invasion - Phase 2 - Invasion Undercity' WHERE  `entry`=130;

DELETE FROM `game_event` WHERE `entry` IN (110, 111, 112, 113, 114, 115, 116, 117, 118, 80, 81, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128);
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`, `patch_min`, `patch_max`) VALUES
(80, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Skeleton spawn / Quest activation lvl 9-11', 0, 1, 9, 10),
(81, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 999999999, 0, 'Scourge Invasion - Boss in instance activation', 0, 1, 9, 10);

-- Objects
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(3996418, 17), -- 110),
(3996419, 17), -- 110),
(3996420, 17), -- 110),
(3996421, 17), -- 110),
(3996422, 17), -- 110),
(3996423, 17), -- 110),
(3996424, 17), -- 111),
(3996430, 17), -- 111),
(3996435, 17), -- 111),
(3996440, 17), -- 111),
(3996445, 17), -- 111),
(3996450, 17), -- 111),
(3996427, 17), -- 112),
(3996434, 17), -- 112),
(3996439, 17), -- 112),
(3996444, 17), -- 112),
(3996449, 17), -- 112),
(3996454, 17), -- 112),
(3996428, 17), -- 113),
(3996431, 17), -- 113),
(3996436, 17), -- 113),
(3996441, 17), -- 113),
(3996446, 17), -- 113),
(3996451, 17), -- 113),
(3996429, 17), -- 114),
(3996432, 17), -- 114),
(3996437, 17), -- 114),
(3996442, 17), -- 114),
(3996447, 17), -- 114),
(3996452, 17), -- 114),
(3996425, 17), -- 115),
(3996433, 17), -- 115),
(3996438, 17), -- 115),
(3996443, 17), -- 115),
(3996448, 17), -- 115),
(3996453, 17), -- 115),
(3996462, 17), -- 116),
(3996464, 17), -- 116),
(3996465, 17), -- 116),
(3996466, 17), -- 116),
(3996467, 17), -- 116),
(3996474, 17), -- 116),
(3996475, 17), -- 116),
(3996476, 17), -- 116),
(3996477, 17), -- 116),
(3996478, 17), -- 116),
(3996479, 17), -- 116),
(3996480, 17), -- 116),
(3996481, 17), -- 116),
(3996482, 17), -- 116),
(3996483, 17), -- 116),
(3996484, 17), -- 116),
(3996485, 17), -- 116),
(3996486, 17), -- 116),
(3996487, 17), -- 116),
(3996488, 17), -- 116),
(3996489, 17), -- 116),
(3996490, 17), -- 116),
(3996491, 17), -- 116),
(3996492, 17), -- 116),
(3996493, 17), -- 116),
(3996494, 17), -- 116),
(3996495, 17), -- 116),
(3996496, 17), -- 116),
(3996497, 17), -- 116),
(3996498, 17), -- 116),
(3996407, 17), -- 117),
(3996468, 17), -- 117),
(3996470, 17), -- 117),
(3996471, 17), -- 117),
(3996472, 17), -- 117),
(3996473, 17), -- 117),
(3996500, 17), -- 119),
(3996501, 17), -- 119),
(3996502, 17), -- 119),
(3996503, 17), -- 119),
(3996504, 17), -- 119),
(3996505, 17), -- 119),
(3996506, 17), -- 119),
(3996507, 17), -- 119),
(3996508, 17), -- 119),
(3996509, 17), -- 119),
(3996510, 17), -- 119),
(3996511, 17), -- 119),
(3996512, 17), -- 119),
(3996514, 17), -- 119),
(3996515, 17), -- 119),
(3996516, 17), -- 119),
(3996517, 17), -- 119),
(3996518, 17), -- 119),
(3996519, 17), -- 119),
(3996520, 17), -- 119),
(3996521, 17), -- 119),
(3996522, 17), -- 119),
(3996523, 17), -- 119),
(3996524, 17), -- 119),
(3996525, 17), -- 119),
(3996526, 17), -- 119),
(3996527, 17), -- 119),
(3996528, 17), -- 119),
(3996529, 17), -- 119),
(3996530, 17), -- 119),
(3996531, 17), -- 119),
(3996532, 17), -- 119),
(3996534, 17), -- 119),
(3996890, 17), -- 119),
(3996535, 17), -- 120),
(3996540, 17), -- 120),
(3996545, 17), -- 120),
(3996550, 17), -- 120),
(3996555, 17), -- 120),
(3996560, 17), -- 120),
(3996565, 17), -- 120),
(3996570, 17), -- 120),
(3996575, 17), -- 120),
(3996580, 17), -- 120),
(3996585, 17), -- 120),
(3996590, 17), -- 120),
(3996595, 17), -- 120),
(3996600, 17), -- 120),
(3996605, 17), -- 120),
(3996610, 17), -- 120),
(3996615, 17), -- 120),
(3996620, 17), -- 120),
(3996625, 17), -- 120),
(3996630, 17), -- 120),
(3996635, 17), -- 120),
(3996640, 17), -- 120),
(3996645, 17), -- 120),
(3996650, 17), -- 120),
(3996655, 17), -- 120),
(3996660, 17), -- 120),
(3996665, 17), -- 120),
(3996670, 17), -- 120),
(3996675, 17), -- 120),
(3996680, 17), -- 120),
(3996685, 17), -- 120),
(3996690, 17), -- 120),
(3996695, 17), -- 120),
(3996891, 17), -- 120),
(3996536, 17), -- 121),
(3996541, 17), -- 121),
(3996546, 17), -- 121),
(3996551, 17), -- 121),
(3996556, 17), -- 121),
(3996561, 17), -- 121),
(3996566, 17), -- 121),
(3996571, 17), -- 121),
(3996576, 17), -- 121),
(3996581, 17), -- 121),
(3996586, 17), -- 121),
(3996591, 17), -- 121),
(3996596, 17), -- 121),
(3996601, 17), -- 121),
(3996606, 17), -- 121),
(3996611, 17), -- 121),
(3996616, 17), -- 121),
(3996621, 17), -- 121),
(3996626, 17), -- 121),
(3996631, 17), -- 121),
(3996636, 17), -- 121),
(3996641, 17), -- 121),
(3996646, 17), -- 121),
(3996651, 17), -- 121),
(3996656, 17), -- 121),
(3996661, 17), -- 121),
(3996666, 17), -- 121),
(3996671, 17), -- 121),
(3996676, 17), -- 121),
(3996681, 17), -- 121),
(3996686, 17), -- 121),
(3996691, 17), -- 121),
(3996696, 17), -- 121),
(3996893, 17), -- 121),
(3996537, 17), -- 122),
(3996542, 17), -- 122),
(3996547, 17), -- 122),
(3996552, 17), -- 122),
(3996557, 17), -- 122),
(3996562, 17), -- 122),
(3996567, 17), -- 122),
(3996572, 17), -- 122),
(3996577, 17), -- 122),
(3996582, 17), -- 122),
(3996587, 17), -- 122),
(3996592, 17), -- 122),
(3996597, 17), -- 122),
(3996602, 17), -- 122),
(3996607, 17), -- 122),
(3996612, 17), -- 122),
(3996617, 17), -- 122),
(3996622, 17), -- 122),
(3996627, 17), -- 122),
(3996632, 17), -- 122),
(3996637, 17), -- 122),
(3996642, 17), -- 122),
(3996647, 17), -- 122),
(3996652, 17), -- 122),
(3996657, 17), -- 122),
(3996662, 17), -- 122),
(3996667, 17), -- 122),
(3996672, 17), -- 122),
(3996677, 17), -- 122),
(3996682, 17), -- 122),
(3996687, 17), -- 122),
(3996692, 17), -- 122),
(3996697, 17), -- 122),
(3996895, 17), -- 122),
(3996538, 17), -- 123),
(3996543, 17), -- 123),
(3996548, 17), -- 123),
(3996553, 17), -- 123),
(3996558, 17), -- 123),
(3996563, 17), -- 123),
(3996568, 17), -- 123),
(3996573, 17), -- 123),
(3996578, 17), -- 123),
(3996583, 17), -- 123),
(3996588, 17), -- 123),
(3996593, 17), -- 123),
(3996598, 17), -- 123),
(3996603, 17), -- 123),
(3996608, 17), -- 123),
(3996613, 17), -- 123),
(3996618, 17), -- 123),
(3996623, 17), -- 123),
(3996628, 17), -- 123),
(3996633, 17), -- 123),
(3996638, 17), -- 123),
(3996643, 17), -- 123),
(3996648, 17), -- 123),
(3996653, 17), -- 123),
(3996658, 17), -- 123),
(3996663, 17), -- 123),
(3996668, 17), -- 123),
(3996673, 17), -- 123),
(3996678, 17), -- 123),
(3996683, 17), -- 123),
(3996688, 17), -- 123),
(3996693, 17), -- 123),
(3996698, 17), -- 123),
(3996897, 17), -- 123),
(3996539, 17), -- 124),
(3996544, 17), -- 124),
(3996549, 17), -- 124),
(3996554, 17), -- 124),
(3996559, 17), -- 124),
(3996564, 17), -- 124),
(3996569, 17), -- 124),
(3996574, 17), -- 124),
(3996579, 17), -- 124),
(3996584, 17), -- 124),
(3996589, 17), -- 124),
(3996594, 17), -- 124),
(3996599, 17), -- 124),
(3996604, 17), -- 124),
(3996609, 17), -- 124),
(3996614, 17), -- 124),
(3996619, 17), -- 124),
(3996624, 17), -- 124),
(3996629, 17), -- 124),
(3996634, 17), -- 124),
(3996639, 17), -- 124),
(3996644, 17), -- 124),
(3996649, 17), -- 124),
(3996654, 17), -- 124),
(3996659, 17), -- 124),
(3996664, 17), -- 124),
(3996669, 17), -- 124),
(3996674, 17), -- 124),
(3996679, 17), -- 124),
(3996684, 17), -- 124),
(3996689, 17), -- 124),
(3996694, 17), -- 124),
(3996699, 17), -- 124),
(3996899, 17), -- 124),
(3996701, 17), -- 125),
(3996702, 17), -- 125),
(3996703, 17), -- 125),
(3996704, 17), -- 125),
(3996705, 17), -- 125),
(3996706, 17), -- 125),
(3996707, 17), -- 125),
(3996708, 17), -- 125),
(3996709, 17), -- 125),
(3996710, 17), -- 125),
(3996711, 17), -- 125),
(3996712, 17), -- 125),
(3996713, 17), -- 125),
(3996714, 17), -- 125),
(3996715, 17), -- 125),
(3996716, 17), -- 125),
(3996717, 17), -- 125),
(3996718, 17), -- 125),
(3996719, 17), -- 125),
(3996720, 17), -- 125),
(3996721, 17), -- 125),
(3996722, 17), -- 125),
(3996723, 17), -- 125),
(3996724, 17), -- 125),
(3996725, 17), -- 125),
(3996726, 17), -- 125),
(3996727, 17), -- 125),
(3996728, 17), -- 125),
(3996729, 17), -- 125),
(3996730, 17), -- 125),
(3996731, 17), -- 125),
(3996732, 17), -- 125),
(3996733, 17), -- 125),
(3996734, 17), -- 125),
(3996735, 17), -- 125),
(3996736, 17), -- 125),
(3996737, 17), -- 125),
(3996738, 17), -- 125),
(3996739, 17), -- 125),
(3996740, 17), -- 125),
(3996741, 17), -- 125),
(3996742, 17), -- 125),
(3996743, 17), -- 125),
(3996744, 17), -- 125),
(3996745, 17), -- 125),
(3996746, 17), -- 125),
(3996747, 17), -- 125),
(3996748, 17), -- 125),
(3996749, 17), -- 125),
(3996750, 17), -- 125),
(3996751, 17), -- 125),
(3996752, 17), -- 125),
(3996753, 17), -- 125),
(3996754, 17), -- 125),
(3996755, 17), -- 125),
(3996756, 17), -- 125),
(3996757, 17), -- 125),
(3996758, 17), -- 125),
(3996759, 17), -- 125),
(3996760, 17), -- 125),
(3996761, 17), -- 125),
(3996762, 17), -- 125),
(3996763, 17), -- 125),
(3996764, 17), -- 125),
(3996765, 17), -- 125),
(3996766, 17), -- 125),
(3996767, 17), -- 125),
(3996768, 17), -- 125),
(3996769, 17), -- 125),
(3996770, 17), -- 125),
(3996771, 17), -- 125),
(3996772, 17), -- 125),
(3996773, 17), -- 125),
(3996774, 17), -- 125),
(3996775, 17), -- 125),
(3996776, 17), -- 125),
(3996777, 17), -- 125),
(3996778, 17), -- 125),
(3996779, 17), -- 125),
(3996780, 17), -- 125),
(3996781, 17), -- 125),
(3996782, 17), -- 125),
(3996783, 17), -- 125),
(3996784, 17), -- 125),
(3996785, 17), -- 125),
(3996786, 17), -- 125),
(3996787, 17), -- 125),
(3996788, 17), -- 125),
(3996789, 17), -- 125),
(3996790, 17), -- 125),
(3996791, 17), -- 125),
(3996792, 17), -- 125),
(3996793, 17), -- 125),
(3996794, 17), -- 125),
(3996795, 17), -- 125),
(3996796, 17), -- 125),
(3996797, 17), -- 125),
(3996798, 17), -- 125),
(3996799, 17), -- 125),
(3996800, 17), -- 125),
(3996801, 17), -- 125),
(3996802, 17), -- 125),
(3996803, 17), -- 125),
(3996804, 17), -- 125),
(3996805, 17), -- 125),
(3996806, 17), -- 125),
(3996807, 17), -- 125),
(3996808, 17), -- 125),
(3996809, 17), -- 125),
(3996810, 17), -- 125),
(3996811, 17), -- 125),
(3996812, 17), -- 125),
(3996813, 17), -- 125),
(3996814, 17), -- 125),
(3996815, 17), -- 125),
(3996816, 17), -- 125),
(3996817, 17), -- 125),
(3996818, 17), -- 125),
(3996819, 17), -- 125),
(3996820, 17), -- 125),
(3996821, 17), -- 125),
(3996822, 17), -- 125),
(3996823, 17), -- 125),
(3996824, 17), -- 125),
(3996825, 17), -- 125),
(3996826, 17), -- 125),
(3996827, 17), -- 125),
(3996828, 17), -- 125),
(3996829, 17), -- 125),
(3996830, 17), -- 125),
(3996831, 17), -- 125),
(3996832, 17), -- 125),
(3996833, 17), -- 125),
(3996834, 17), -- 125),
(3996835, 17), -- 125),
(3996836, 17), -- 125),
(3996837, 17), -- 125),
(3996838, 17), -- 125),
(3996839, 17), -- 125),
(3996840, 17), -- 125),
(3996841, 17), -- 125),
(3996842, 17), -- 125),
(3996843, 17), -- 125),
(3996844, 17), -- 125),
(3996845, 17), -- 125),
(3996846, 17), -- 125),
(3996847, 17), -- 125),
(3996848, 17), -- 125),
(3996849, 17), -- 125),
(3996850, 17), -- 125),
(3996851, 17), -- 125),
(3996852, 17), -- 125),
(3996853, 17), -- 125),
(3996854, 17), -- 125),
(3996855, 17), -- 125),
(3996856, 17), -- 125),
(3996857, 17), -- 125),
(3996858, 17), -- 125),
(3996859, 17), -- 125),
(3996860, 17), -- 125),
(3996861, 17), -- 125),
(3996862, 17), -- 125),
(3996863, 17), -- 125),
(3996864, 17), -- 125),
(3996865, 17), -- 125),
(3996892, 17), -- 125),
(3996894, 17), -- 125),
(3996896, 17), -- 125),
(3996898, 17), -- 125),
(3996900, 17), -- 125),
(3996700, 17), -- 126),
(3996866, 17), -- 126),
(3996867, 17), -- 126),
(3996880, 17), -- 126),
(3996881, 17), -- 126),
(3996882, 17), -- 126),
(3996883, 17), -- 126),
(3996884, 17), -- 126),
(3996885, 17), -- 126),
(3996886, 17), -- 126),
(3996887, 17), -- 126),
(3996888, 17), -- 126),
(3996889, 17), -- 126),
(3996902, 17), -- 126),
(3996903, 17), -- 126),
(3996904, 17), -- 126),
(3996906, 17), -- 126),
(3996910, 17), -- 126),
(3996911, 17), -- 126),
(3996912, 17), -- 126),
(3996914, 17), -- 126),
(3996916, 17), -- 126),
(3996917, 17), -- 126),
(3996918, 17), -- 126),
(3996921, 17), -- 126),
(3996922, 17), -- 126),
(3996923, 17), -- 126),
(3996924, 17), -- 126),
(3996925, 17), -- 126),
(3996930, 17), -- 126),
(3996931, 17), -- 126),
(3996932, 17), -- 126),
(3996940, 17), -- 126),
(3996941, 17), -- 126),
(3996942, 17), -- 126),
(3996945, 17), -- 126),
(3996946, 17), -- 126),
(3996948, 17), -- 126),
(3996949, 17), -- 126),
(3996951, 17), -- 126),
(3996952, 17), -- 126),
(3996953, 17), -- 126),
(3996954, 17), -- 126),
(3996957, 17), -- 126),
(3996959, 17), -- 126),
(3996960, 17); -- 126),

-- Creatures
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES
(1242626, 80), -- 118),
(1242627, 80), -- 118),
(1242628, 80), -- 118),
(1242629, 80), -- 118),
(1242630, 80), -- 118),
(1242631, 80), -- 118),
(1242632, 80), -- 118),
(1242633, 80), -- 118),
(1242634, 80), -- 118),
(1242635, 80), -- 118),
(1242636, 80), -- 118),
(1242637, 80), -- 118),
(1242638, 80), -- 118),
(1242639, 80), -- 118),
(1242640, 80), -- 118),
(1242641, 80), -- 118),
(1242642, 80), -- 118),
(1242643, 80), -- 118),
(1242644, 80), -- 118),
(1242645, 80), -- 118),
(1242646, 80), -- 118),
(1242647, 80), -- 118),
(1242648, 80), -- 118),
(1242649, 80), -- 118),
(1242650, 80), -- 118),
(1242651, 80), -- 118),
(1242652, 80), -- 118),
(1242653, 80), -- 118),
(1242654, 80), -- 118),
(1242655, 80), -- 118),
(1242656, 80), -- 118),
(1242657, 80), -- 118),
(1242658, 80), -- 118),
(1242659, 80), -- 118),
(1242660, 80), -- 118),
(1242661, 80), -- 118),
(1242662, 80), -- 118),
(1242663, 80), -- 118),
(1242664, 80), -- 118),
(1242665, 80), -- 118),
(1242666, 80), -- 118),
(1242667, 80), -- 118),
(1242668, 80), -- 118),
(1242669, 80), -- 118),
(1242670, 80), -- 118),
(1242671, 80), -- 118),
(1242672, 80), -- 118),
(1242673, 80), -- 118),
(1242674, 80), -- 118),
(1242675, 80), -- 118),
(1242676, 80), -- 118),
(1242677, 80), -- 118),
(1242678, 80), -- 118),
(1242679, 80), -- 118),
(1242680, 80), -- 118),
(1242681, 80), -- 118),
(1242682, 80), -- 118),
(1242683, 80), -- 118),
(1242684, 80), -- 118),
(1242685, 80), -- 118),
(1242686, 80), -- 118),
(1242687, 80), -- 118),
(1242688, 80), -- 118),
(1242689, 80), -- 118),
(1242690, 80), -- 118),
(1242691, 80), -- 118),
(1242692, 80), -- 118),
(1242693, 80), -- 118),
(1242694, 80), -- 118),
(1242695, 80), -- 118),
(1242696, 80), -- 118),
(1242697, 80), -- 118),
(1242698, 80), -- 118),
(1242699, 80), -- 118),
(1242700, 80), -- 118),
(1242701, 80), -- 118),
(1242702, 80), -- 118),
(1242703, 80), -- 118),
(1242704, 80), -- 118),
(1242705, 80), -- 118),
(1242706, 80), -- 118),
(1242707, 80), -- 118),
(1242708, 80), -- 118),
(1242709, 80), -- 118),
(1242710, 80), -- 118),
(1242711, 80), -- 118),
(1242712, 80), -- 118),
(1242713, 80), -- 118),
(1242714, 80), -- 118),
(1242715, 80), -- 118),
(1242716, 80), -- 118),
(1242717, 80), -- 118),
(1242718, 80), -- 118),
(1242719, 80), -- 118),
(1242720, 80), -- 118),
(1242721, 80), -- 118),
(1242722, 80), -- 118),
(1242723, 80), -- 118),
(1242724, 80), -- 118),
(1242725, 80), -- 118),
(1242726, 80), -- 118),
(1242727, 80), -- 118),
(1242728, 80), -- 118),
(1242733, 17), -- 126),
(1242734, 17), -- 126),
(1242735, 17), -- 126),
(1242741, 17), -- 126),
(1242742, 17), -- 126),
(1242743, 17), -- 126),
(1242744, 17), -- 126),
(1242745, 17), -- 126),
(1242746, 17), -- 126),
(1242747, 17), -- 126),
(1242748, 17), -- 126),
(1242749, 17), -- 126),
(1242750, 17), -- 126),
(1242751, 17), -- 126),
(1242752, 17), -- 126),
(1242753, 17), -- 126),
(1242754, 17), -- 126),
(1242755, 17), -- 126),
(1242756, 17), -- 126),
(1242757, 17), -- 126),
(1242758, 17), -- 126),
(1242759, 17), -- 126),
(1242760, 17), -- 126),
(1242761, 17), -- 126),
(1242762, 17), -- 126),
(1242763, 17), -- 126),
(1242764, 17), -- 126),
(1242765, 17), -- 126),
(1242766, 17), -- 126),
(1242767, 17), -- 126),
(1242768, 17), -- 126),
(1242769, 17), -- 126),
(1242770, 17), -- 126),
(1242771, 17), -- 126),
(1242817, 17), -- 126),
(1242822, 17), -- 126),
(1242828, 17), -- 126),
(1242910, 17), -- 126),
(1242912, 17), -- 126),
(1242913, 17), -- 126),
(1242914, 17), -- 126),
(1242915, 17), -- 126),
(1242916, 17), -- 126),
(1242917, 17), -- 126),
(1242918, 17), -- 126),
(1242919, 17), -- 126),
(1242920, 17), -- 126),
(1242921, 17), -- 126),
(1242936, 17), -- 126),
(1242952, 17), -- 126),
(1242967, 17), -- 126),
(1242978, 17), -- 126),
(1242980, 17), -- 126),
(1242982, 17), -- 126),
(1242983, 17), -- 126),
(1242984, 17), -- 126),
(1242989, 17), -- 126),
(1242990, 17), -- 126),
(1242991, 17), -- 126),
(1242992, 17), -- 126),
(1242993, 17), -- 126),
(1242994, 17), -- 126),
(1242995, 17), -- 126),
(1242996, 17), -- 126),
(1242997, 17), -- 126),
(1242998, 17), -- 126),
(1242999, 17), -- 126),
(1243000, 17), -- 126),
(1243007, 17), -- 126),
(1243009, 17), -- 126),
(1243010, 17), -- 126),
(1243011, 17), -- 126),
(1243012, 17); -- 126),

-- ----------------------
-- Objects
-- ----------------------

UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181223;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181215;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181374;
UPDATE `gameobject_template` SET `ScriptName`='go_necropolis' WHERE `entry`=181373;

DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID_GENERAL+0 AND @OGUID_GENERAL+15;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES
(@OGUID_GENERAL+0, 181254, 0, -4930.26, -992.487, 501.443, 2.36819, 0, 0, 0.926159, 0.377134, 25, 100, 1, 0),
(@OGUID_GENERAL+1, 181256, 0, -4929.6, -986.764, 501.459, 2.27002, 0, 0, 0.906538, 0.422124, 25, 100, 1, 0),
(@OGUID_GENERAL+2, 181256, 0, -4936.46, -992.14, 501.453, 2.20325, 0, 0, 0.891943, 0.452147, 25, 100, 1, 0),
(@OGUID_GENERAL+3, 181255, 0, -4930.98, -987.826, 501.458, 2.58025, 0, 0, 0.960869, 0.277003, 25, 100, 1, 0),
(@OGUID_GENERAL+4, 181255, 0, -4930.98, -987.826, 502.024, 2.42317, 0, 0, 0.936174, 0.351538, 25, 100, 1, 0),
(@OGUID_GENERAL+5, 181256, 0, -4917.47, -981.636, 501.451, 1.46499, 0, 0, 0.668728, 0.743507, 25, 100, 1, 0),
(@OGUID_GENERAL+6, 181256, 0, -8833.53, 645.621, 95.3165, 4.06871, 0, 0, 0.894466, -0.447135, 25, 100, 1, 0),
(@OGUID_GENERAL+7, 181256, 0, -8827.92, 640.435, 94.331, 3.8221, 0, 0, 0.942671, -0.333724, 25, 100, 1, 0),
(@OGUID_GENERAL+8, 181254, 0, -8828.14, 644.609, 94.4657, 3.78675, 0, 0, 0.948421, -0.317014, 25, 100, 1, 0),
(@OGUID_GENERAL+9, 181256, 0, -8838.25, 644.563, 95.7177, 3.9674, 0, 0, 0.91596, -0.401268, 25, 100, 1, 0),
(@OGUID_GENERAL+10, 181255, 0, -8828.24, 643.265, 94.4295, 5.40467, 0, 0, 0.42527, -0.905067, 25, 100, 1, 0),
(@OGUID_GENERAL+11, 181255, 0, -8828.24, 643.265, 94.9958, 5.76987, 0, 0, 0.253848, -0.967244, 25, 100, 1, 0),
(@OGUID_GENERAL+12, 181256, 1, 1586.61, -4413.88, 8.18393, 2.67034, 0, 0, 0.972368, 0.233452, 25, 100, 1, 0),
(@OGUID_GENERAL+13, 181255, 1, 1592.43, -4415.54, 9.15589, 3.4204, 0, 0, 0.990299, -0.138951, 25, 100, 1, 0),
(@OGUID_GENERAL+14, 181255, 1, 1592.43, -4415.54, 9.72213, 3.07482, 0, 0, 0.999443, 0.033379, 25, 100, 1, 0),
(@OGUID_GENERAL+15, 181256, 1, -1323.83, 193.404, 59.7026, 3.89934, 0, 0, 0.929081, -0.369875, 25, 100, 1, 0);

DELETE FROM `game_event_gameobject` WHERE `guid` BETWEEN @OGUID_GENERAL+0 AND @OGUID_GENERAL+15 AND `event`=@Event_1;
INSERT INTO `game_event_gameobject` SELECT gameobject.guid, @Event_1 FROM `gameobject` WHERE gameobject.guid BETWEEN @OGUID_GENERAL+0 AND @OGUID_GENERAL+15;

DELETE FROM `gameobject` WHERE `guid` IN (3996948, 3996951, 3996952, 3996946, 3996946, 3996949, 3996945, 3996924, 3996923, 3996925);

-- 
-- Start values for zones etc
-- 
DELETE FROM `variables` WHERE `index` IN (10,11,14,15,16,17,18,19,20,21,22,23);
INSERT INTO `variables` (`index`, `value`) VALUES
(10, 440), -- VARIABLE_NAXX_ATTACK_ZONE1 & ZONEID_TANARIS
(11, 4), -- VARIABLE_NAXX_ATTACK_ZONE2 & ZONEID_BLASTED_LANDS
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0);

-- ----------------------
-- Spells
-- ----------------------

/*
-- SPELL_COMMUNIQUE_NECROPOLIS_TO_PROXIES = 28373, // Communique, Necropolis-to-Proxies
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16136);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16386);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16398);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16172);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (28373, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 18, 8, 0, -1, -1, -1, -1, 'Communication necropol');
*/

/*
-- SPELL_DMG_BOOST_AT_PYLON_DEATH = 28681, // [Soul Revival] Increases all damage caused by 10%.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (28861, 1, 16592);
*/

-- SPELL_ZAP_CRYSTAL = 28032, // [Zap Crystal]. 15 damage.
/*
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) 
VALUES 
(28032, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 25, 0, -1, -1, -1, -1, -1, 'Zap Crystal');
*/
delete from spell_effect_mod where Id = 28032;
delete from spell_script_target  where entry = 28032;
insert into spell_script_target (entry, type, targetEntry) VALUES
(28032, 1, 16136),
(28032, 1, 16172);

-- Want the communication from relay to shard to hit damaged shard as well
delete from spell_script_target where entry = 28373 and targetEntry = 16172;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES(28373, 1, 16172);

-- Since we are not using proxies, we need to set the shard death spell (28351) to target
-- the relay, and we mod the spell to use script-targeting.
DELETE FROM `spell_script_target` where entry = 28351;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (28351, 1, 16386);
DELETE FROM `spell_effect_mod` where Id = 28351;
INSERT INTO `spell_effect_mod` 
(`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, 
`EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) 
VALUES
 (28351, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 38, 0, -1, -1, -1, -1, -1, 'Communique, Relay-to-Proxy');

-- Makes the necropolis relay and proxy "invisible"
UPDATE `creature_template` SET `flags_extra`=0,`unit_flags`=33554560 WHERE `entry`=16386;
UPDATE `creature_template` SET `flags_extra`=0,`unit_flags`=33554560 WHERE `entry`=16398;

update creature set visibilitymod = 3000, spawnFlags = 1 where id = 16386; -- necropolis relay
update creature set visibilitymod = 3000, spawnFlags = 1 where id = 16136; -- necrotic shard
update gameobject set visibilitymod = 1000, spawnFlags = 1 where id = 181223; -- necropolis

-- deleteing all necropolises except those stationed outside cities. 
-- the deleted gobjs are summmoned by the hardcoded WorldEvent
delete from gameobject where guid in (
3998522,
3996700,
3996866,
3998521,
3996880,
3996881,
3996882,
3996883,
3996884,
3996885,
3996886,
3996887,
3996888,
3996889
);
-- deleting all necropolis relays. They are ssummoned by the hardcoded worldevent
delete from creature where id = 16386;
-- Deleting all necropolis shards. They are spawned by the hardcoded gameevent
delete from creature where id = 16136;
-- remove all necropolis proxies, not using them
delete from creature where id = 16398; 

-- The scourge invasion phase 1 is now a hardcoded world event
UPDATE `game_event` SET `hardcoded`='1' WHERE `entry`='17';


-- boss in scholomance
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14 WHERE `entry`=16383;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
