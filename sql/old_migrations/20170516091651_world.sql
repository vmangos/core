INSERT INTO `migrations` VALUES ('20170516091651'); 

# aq_script_texts.txt


-- for type, 0=CHAT_TYPE_SAY, 1=CHAT_TYPE_YELL, 2=CHAT_TYPE_TEXT_EMOTE, 3=CHAT_TYPE_BOSS_EMOTE, 4=CHAT_TYPE_WHISPER, 5=CHAT_TYPE_BOSS_WHISPER (4 and 5 are handled equally)

-- Found a much more complete list of aq text scripts here: https://github.com/scriptdev2/scriptdev2-classic/blob/master/sql/scriptdev2_script_full.sql
-- These are copied from there, with some modifcations:

-- -1531012: changed type to 3, todo: make sure it actually works... 2(prev val) worked, but 3 should have higher distance

-- NOTE FOR ELYSIUM: QUick and dirty delete and replace. There are some french translations in the nost database. If you want to keep these, make a more fancy update
DELETE FROM script_texts WHERE entry BETWEEN -1531046 AND -1531000;
INSERT INTO script_texts (entry, content_default, sound, type, language, emote, comment) VALUES


-- Skeram
(-1531000,'Are you so eager to die? I would be happy to accomodate you.',8615,1,0,0,'skeram SAY_AGGRO1'),
(-1531001,'Cower mortals! The age of darkness is at hand.',     8616,1,0,0,'skeram SAY_AGGRO2'),
(-1531002,'Tremble! The end is upon you.',                      8621,1,0,0,'skeram SAY_AGGRO3'),
(-1531003,'Let your death serve as an example!',                8617,1,0,0,'skeram SAY_SLAY1'),
(-1531004,'Spineless wretches! You will drown in rivers of blood!',8619,1,0,0,'skeram SAY_SLAY2'),
(-1531005,'The screams of the dying will fill the air. A symphony of terror is about to begin!',8620,1,0,0,'skeram SAY_SLAY3'),
(-1531006,'Prepare for the return of the ancient ones!',        8618,1,0,0,'skeram SAY_SPLIT'),
(-1531007,'You only delay... the inevetable.',                  8622,1,0,0,'skeram SAY_DEATH'),

-- Sartura 
(-1531008,'You will be judged for defiling these sacred grounds! The laws of the Ancients will not be challenged! Trespassers will be annihilated!',8646,1,0,0,'sartura SAY_AGGRO'),
(-1531009,'I sentence you to death!',                           8647,1,0,0,'sartura SAY_SLAY'),
(-1531010,'I serve to the last!',                               8648,1,0,0,'sartura SAY_DEATH'),

-- C'thun weakened
(-1531011,'%s is weakened!',                                    0,2,0,0,'cthun EMOTE_WEAKENED'),

-- Twin emperors intro
(-1531012,'The massive floating eyeball in the center of the chamber turns its gaze upon you. You stand before a god.', 0,3,0,0,'eye cthun EMOTE_INTRO'),
(-1531013,'Only flesh and bone. Mortals are such easy prey...', 0,1,0,0,'veklor SAY_INTRO_1'),
(-1531014,'Where are your manners, brother. Let us properly welcome our guests.', 0,1,0,0,'veknilash SAY_INTRO_2'),
(-1531015,'There will be pain...',                              0,1,0,0,'veklor SAY_INTRO_3'),
(-1531016,'Oh so much pain...',                                 0,1,0,0,'veknilash SAY_INTRO_4'),
(-1531017,'Come, little ones.',                                 0,1,0,0,'veklor SAY_INTRO_5'),
(-1531018,'The feast of souls begins now...',                    0,1,0,0,'veknilash SAY_INTRO_6'),

-- Vek'lor yells
(-1531019,'It\'s too late to turn away.', 		                8623,1,0,0,'veklor SAY_AGGRO_1'),
(-1531020,'Prepare to embrace oblivion!', 		                8626,1,0,0,'veklor SAY_AGGRO_2'),
(-1531021,'Like a fly to the web.',         		            8624,1,0,0,'veklor SAY_AGGRO_3'),
(-1531022,'Your brash arrogance!',        		                8628,1,0,0,'veklor SAY_AGGRO_4'),
(-1531023,'You will not escape death!',                         8629,1,0,0,'veklor SAY_SLAY'),
(-1531024,'My brother...NO!',                                   8625,1,0,0,'veklor SAY_DEATH'),
(-1531025,'To decorate our halls!',                             8627,1,0,0,'veklor SAY_SPECIAL'),

-- Vek'nilash yells
(-1531026,'Ah, lambs to the slaughter!',                        8630,1,0,0,'veknilash SAY_AGGRO_1'),
(-1531027,'Let none survive!',                                  8632,1,0,0,'veknilash SAY_AGGRO_2'),
(-1531028,'Join me brother, there is blood to be shed!',        8631,1,0,0,'veknilash SAY_AGGRO_3'),
(-1531029,'Look brother, fresh blood!',                         8633,1,0,0,'veknilash SAY_AGGRO_4'),
(-1531030,'Your fate is sealed!',                               8635,1,0,0,'veknilash SAY_SLAY'),
(-1531031,'Vek\'lor, I feel your pain!',                        8636,1,0,0,'veknilash SAY_DEATH'),
(-1531032,'Shall be your undoing!',                             8634,3,0,0,'veknilash SAY_SPECIAL'),

-- C'thun whispers 
(-1531033,'Death is close...',				                    8580,4,0,0,'cthun SAY_WHISPER_1'),
(-1531034,'You are already dead.',                              8581,4,0,0,'cthun SAY_WHISPER_2'),
(-1531035,'Your courage will fail.',                            8582,4,0,0,'cthun SAY_WHISPER_3'),
(-1531036,'Your friends will abandon you.',                     8583,4,0,0,'cthun SAY_WHISPER_4'),
(-1531037,'You will betray your friends.',                      8584,4,0,0,'cthun SAY_WHISPER_5'),
(-1531038,'You will die.',                                      8585,4,0,0,'cthun SAY_WHISPER_6'),
(-1531039,'You are weak.',                                      8586,4,0,0,'cthun SAY_WHISPER_7'),
(-1531040,'Your heart will explode.',                           8587,4,0,0,'cthun SAY_WHISPER_8'),

-- Viscidus emotes
(-1531041,'%s begins to slow!',                                 0,3,0,0,'viscidus EMOTE_SLOW'),
(-1531042,'%s is freezing up!',                                 0,3,0,0,'viscidus EMOTE_FREEZE'),
(-1531043,'%s is frozen solid!',                                0,3,0,0,'viscidus EMOTE_FROZEN'),
(-1531044,'%s begins to crack!',                                0,3,0,0,'viscidus EMOTE_CRACK'),
(-1531045,'%s looks ready to shatter!',                         0,3,0,0,'viscidus EMOTE_SHATTER'),
(-1531046,'%s explodes!',                                       0,3,0,0,'viscidus EMOTE_EXPLODE');

# viscidus.sql

-- cmangos unit flags Viscidus trigger TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587968 WHERE entry = 15922;

-- Viscidus trigger aren't targettable and can't fight players
UPDATE creature_template SET minlevel = 63, maxlevel = 63, unit_flags = unit_flags | (33554432 + 512), scriptname = "boss_viscidus_trigger" WHERE entry = 15922;

-- Viscidus trigger must be hostile (faction 14 = moster) to work, both in viscidus logic and in c'thuns stomach.
UPDATE creature_template SET faction_A = 14, faction_H= 14 WHERE entry=15922;

-- Summon glob of Viscidus spell target position
DELETE FROM spell_target_position WHERE id BETWEEN 25865 AND 25884;
INSERT INTO spell_target_position (id , target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES
(25865, 531, -8023.59, 964.772, -41.229, 5.376),
(25866, 531, -8042.13, 911.263, -42.841, 6.2),
(25867, 531, -7999.36, 860.525, -47.206, 1.417),
(25868, 531, -7971.3, 862.581, -48.099, 2.148),
(25869, 531, -7943.21, 903.804, -48.473, 3.078),
(25870, 531, -7954.38, 958.562, -41.609, 3.962),
(25871, 531, -7997.19, 979.192, -41.653, 4.896),
(25872, 531, -8037.89, 929.679, -43.416, 6.024),
(25873, 531, -8015.41, 867.734, -45.607, 1.103),
(25874, 531, -7982.8, 857.172, -48.212, 1.5),
(25875, 531, -7952.12, 883.183, -48.194, 2.43),
(25876, 531, -7947.22, 939.122, -44.014, 3.718),
(25877, 531, -7975.77, 974.82, -41.584, 4.417),
(25878, 531, -8032.75, 948.274, -41.919, 5.595),
(25879, 531, -8037.08, 887.268, -43.581, 0.675),
(25880, 531, -7992.21, 857.5, -47.762, 1.664),
(25881, 531, -7960.71, 872.483, -48.759, 2.36),
(25882, 531, -7942.98, 918.616, -46.401, 3.306),
(25883, 531, -7964.32, 967.879, -42.112, 4.087),
(25884, 531, -8015.24, 976.553, -41.647, 4.947);

-- correct glob of Viscidus modelid and unit flags
UPDATE creature_template SET modelid_1 = 12349, unit_flags = 32768 WHERE entry = 15667;

-- Remove silver drops from Glob of Viscidus
UPDATE creature_template SET mingold = 0, maxgold = 0 WHERE entry = 15667;

-- Update Glob of Viscidus immunities
UPDATE creature_template SET MechanicImmuneMask = 617299803 WHERE entry = 15667;

-- Viscidus teleport spell
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES (25904, 531, -7992.36, 908.19, -52.62, 1.68);

-- Not tauntable
UPDATE creature_template SET flags_extra = 257 WHERE entry = 15299;

-- Update speed
UPDATE creature_template SET speed_walk = 3, speed_run = 3 WHERE entry = 15299;
UPDATE creature_template SET speed_run = 1 WHERE entry = 15667;

# Twins.sql
-- Moved the masters eye up in the air and turned it around to face the emperors. Script will turn it towards players
UPDATE `creature` SET `position_z`='-102.44', `orientation`='4.896' WHERE `guid`='88072';

-- Added ScriptName, made unit non-attackable and experimented with some other flags for floating, but they should be back to what they were.
UPDATE `creature_template`  SET `unit_flags`=(2) , `AIName`='EventAI', `MovementType` = '0',`InhabitType` = '3', `ScriptName`='mob_masters_eye' WHERE `entry`='15963';


DELETE FROM spell_mod WHERE Id = 800;
INSERT INTO spell_mod (`Id`, `DurationIndex`,`Comment`) VALUES ('800', '39','Spell twins teleport stun 2 sec');

-- Increased their runspeed. No idea exactly what it should be, but absolutely more than their default one
UPDATE creature_template SET speed_run=1.8 WHERE entry=15275;
UPDATE creature_template SET speed_run=1.8 WHERE entry=15276;

	-- 15761	0.558	2	2	0	0
	-- 15778	7.1	10	2	0	0
UPDATE creature_model_info SET `bounding_radius`='1.2', `combat_reach`='6' WHERE `modelid`='15761';
UPDATE creature_model_info SET `bounding_radius`='1.2', `combat_reach`='6' WHERE `modelid`='15778';


-- scripted ai for bugs on twins to robustify resetting
UPDATE creature_template SET `ScriptName`='mob_twins_bug' WHERE `entry`='15317';
UPDATE creature_template SET `ScriptName`='mob_twins_bug' WHERE `entry`='15316';

-- creating creature_equip_template entry for Vek'lors scepter
DELETE FROM creature_equip_template WHERE entry = 16000;
INSERT INTO creature_equip_template (entry, equipentry1) VALUES (16000, 21796);

-- Giving Vek'lor the scepter equip template
UPDATE creature_template SET equipment_id=16000 WHERE entry=15276;

-- making emperors immune to disarm
UPDATE creature_template SET MechanicImmuneMask = (MechanicImmuneMask | 4) WHERE entry = 15275;
UPDATE creature_template SET MechanicImmuneMask = (MechanicImmuneMask | 4) WHERE entry = 15276;

-- Vek'nilash should drop  Belt of the Fallen Emperor for alliance only, and Grasp of the Fallen Emperor for horde only
UPDATE reference_loot_template SET condition_id = 3 WHERE entry = 328943 and item = 21606;
UPDATE reference_loot_template SET condition_id = 2 WHERE entry = 328943 and item = 21607;

# Trash.sql

-- Meteors for anubisath defenders had event_param1 and 2 swapped
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527732';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527728';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527724';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527720';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527716';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527712';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527708';
UPDATE `creature_ai_scripts` SET `event_param1`='5000', `event_param2`='6000' WHERE `id`='1527704';

-- Add detect invis/stealth and taunt immune aura
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15246', '0', '0', '1', '16', '0', '0', '18950 26602');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15247', '0', '0', '1', '16', '0', '0', '18950');
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES ('15233', '0', '0', '1', '16', '0', '0', '18950');

-- Position adjustments
UPDATE `creature` SET `position_y`='1759.77' WHERE `guid`='88027';
UPDATE `creature` SET `position_y`='1780.08', `position_z`='-42.6571' WHERE `guid`='88024';
UPDATE `creature` SET `position_x`='-900.787109', `position_y`='1916.039063', `position_z`='-43.814262' WHERE `guid`='88063';

-- Replace qiraji mindslayers eventAI with scripted ai. Script is located in instance_temple_of_ahnqiraj.cpp.
UPDATE `creature_template` SET `AIName`='', `ScriptName`='mob_qiraji_mindslayer' WHERE `entry`='15246';

-- In reference to issue #551 https://github.com/elysium-project/server/issues/551
-- Anubisath Warders, Obsidian Nullfiers, QIraji Slayers, Qiraji Champions and Qiraji Mindslayers should not respawn
-- during the same save-ID once killed. Setting spawntimersecs to 7 days.
UPDATE `creature` SET `spawntimesecs`='604800' where id IN(15311, 15312, 15250, 15252, 15246);

# Spells.sql

# 1.9.0 spell values
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES ('26478', '0', '-1', '-1', '-1', '-1', '-1', '3149', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'C\'Thun Giant Tentacle Ground Rupture 1.9.0 Damage');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES ('26478', '1', '-1', '-1', '-1', '-1', '-1', '249', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'C\'Thun Giant Tentacle Ground Rupture 1.9.0 Knockback');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES ('26093', '0', '-1', '-1', '-1', '-1', '-1', '1349', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'Ouro\'s Dirt Mound Quake 1.9.0 Damage');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES ('24318', '0', '-1', '-1', '-1', '-1', '-1', '249', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'Enrage 1.9.0 Damage (nerfed in 1.9.3)');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES ('24318', '1', '-1', '-1', '-1', '-1', '-1', '59', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', 'Enrage 1.9.0 Haste (slightly buffed in 1.9.3)');

# Sartura.sql

-- Make immune to disarm
UPDATE creature_template SET MechanicImmuneMask = 617297759 WHERE entry = 15516;

# Reputation.sql

-- factions: 609=CC, 910=brood

-- =================== AQ 40 =================================================================================================
-- ===========================================================================================================================
-- Anubisath Defender 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15277';

-- Anubisath Sentinel 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15264';

-- Obsidian Eradicator 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15262';

-- Qiraji Lasher 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15249';

-- Vekniss Solider 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15229';
 
-- Vekniss Stinger 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15235';

-- Vekniss Warrior 100 rep with brood, 0 with CC
 UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15230';

-- Vekniss Wasp 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15236';

-- Vekniss hive crawler 100 rep with brood, 0 with CC
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='0' WHERE `creature_id`='15240';
  
-- C'thun gives 2500rep until exalted with brood, and 500 with cenarion circle
DELETE FROM creature_onkill_reputation where creature_id = 15727;
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) 
VALUES ('15727', '910', '609', '7', '0', '2500', '7', '0', '500', '0');

-- Shows rep of cthun and above mentioned trashmobs
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15727, 15277, 15264, 15262, 15249, 15229, 15235, 15230, 15236, 15240);

-- Twin emperors each give 210 rep, seems about right.
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15276, 15275);

-- No bosses except cthun and twins should give rep with brood, can controll with this select
-- SELECT * FROM creature_onkill_reputation where creature_id IN (15263, 15544, 15510, 15299, 15509, 15516, 15517, 15543, 15511);

-- Everything above is mentioned on wowwiki, hive crawlers are additionally mentioned here:
-- http://wow.gamepedia.com/Brood_of_Nozdormu also mentions Vekniss hive crawler:



-- ================ AQ 20 ===================================================================================================
-- ==========================================================================================================================
-- AQ20 bosses gives 300 (600 ossirian) according to http://wowwiki.wikia.com/wiki/Cenarion_Circle_reputation_guide
-- but if you check each individual boss they are said to give 150CC and 50 Brood rep (100/300 Ossirian). Presumably
-- the latter is a pre-"nerf" value. I am unable to find anything about when they stop giving rep, other than wowwiki
-- saying they give rep with both CC and Brood until exalted.

-- buru 15370
-- moam 15340
-- kurinaxx 15348
-- ayamiss 15369
-- ossirian 15339
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15370';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15340';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15348';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='50', `RewOnKillRepValue2`='150' WHERE `creature_id`='15369';
UPDATE `creature_onkill_reputation` SET `RewOnKillRepValue1`='100', `RewOnKillRepValue2`='300' WHERE `creature_id`='15339';
 -- SELECT * FROM creature_onkill_reputation where creature_id IN (15370, 15340, 15348, 15369, 15339);

-- C'thuns legacy gives 500 CC rep and 500 Brood rep.
UPDATE `quest_template` SET `RewRepFaction2`='910', `RewRepValue1`='500', `RewRepValue2`='500' WHERE `entry`='8801';

-- The Saviour of Kalimdor gives 500 CC rep and 1000 Brood rep.
UPDATE `quest_template` SET `RewRepFaction2`='910', `RewRepValue1`='500', `RewRepValue2`='1000' WHERE `entry`='8802';

# Ouro.sql

-- Replace Ouro by it's spawner
UPDATE creature SET id = 15957 WHERE id = 15517;

-- Give AI to Ouro spawner
UPDATE creature_template SET ScriptName = "npc_ouro_spawner" WHERE entry = 15957;

-- Give invisible model to Ouro spawner
UPDATE creature_template SET modelid_1 = 11686 WHERE entry = 15957;
UPDATE creature SET modelid = 11686 WHERE id = 15957;

-- Give AI to Ouro dirt mound
UPDATE creature_template SET ScriptName = "npc_dirt_mound" WHERE entry = 15712;

-- Corect faction for Ouro dirt mound
UPDATE creature_template SET faction_H = 14, faction_A = 14 WHERE entry = 15712;

-- Correct level for Ouro dirt mound
UPDATE creature_template SET minlevel = 63, maxlevel = 63 WHERE entry = 15712;

-- Ouro dirt mound are not targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry = 15712;

-- cmangos unit flags Ouro spawner TOD : search flags name
UPDATE creature_template SET unit_flags = unit_flags | 33587200 WHERE entry = 15957;

-- Ouro trigger is not targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry = 15717;

-- Add scriptname to Ouro scarab
UPDATE creature_template SET ScriptName = "npc_ouro_scarab" WHERE entry = 15718;

-- Ouro sandblast should be a debuff
DELETE FROM spell_mod where Id = 26102;
INSERT INTO spell_mod (Id, Custom, Comment) VALUES (26102, 2, "Ouro's sandblast should be negative");

-- Add scripted target for Despawn Base spell
DELETE FROM spell_script_target WHERE entry = 26594;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (26594, 0, 180795);

-- Ouro base shouldn't be targettable by players and should despawn after sending animation on use
UPDATE gameobject_template SET data3 = 65536 * 900, data4 = 1, data5 = 1 WHERE entry = 180795;

-- Add scriptname to Ouro base
UPDATE gameobject_template SET scriptname = "go_sandworm_base" WHERE entry = 180795;

-- Update model combat reach
UPDATE creature_model_info SET combat_reach = '20' WHERE modelid = 15509;

-- Fix spell effect target for base desummoning
INSERT INTO spell_script_target (`entry`, `type`, `targetEntry`) VALUES (26063, 0, 180795);

# Mount.sql

# Black Qiraji mount fixes
DELETE FROM spell_mod WHERE Id = 25863;
UPDATE item_template SET spellid_1 = 26656 WHERE entry = 21176;
UPDATE item_template SET spellcooldown_1 =1 WHERE entry = 21176;

# Instance.sql


-- Setting 7day respawn timer on all AQ bosses. Note for ouro it's the spawner creature we need to set the respawn timer on.
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88075';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88076';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88077';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87938';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88014';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87911';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87602';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87648';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87601';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87603';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='87559';
UPDATE `creature` SET `spawntimesecs`='604800' WHERE `guid`='88073';

/*
SELECT * FROM mangos.creature where id in(
15275, -- twins
15276, -- twins
15263, -- skeram
15299, -- viscidus
15509, -- huhuran
15510, -- fankriss
15511, -- kri
15516, -- sartura
15517, -- ouro
15543, -- yauj
15544, -- vem
15727, -- cthun
15957) -- ouro spawner
*/

# Huhuran.sql

-- Change damage of Huhuran Wyvern Sting casted on dispelled Wyvern Sting
DELETE FROM spell_effect_mod WHERE Id = 26233;
INSERT INTO spell_effect_mod (Id, EffectBasePoints, Comment) VALUES (26233, 3000, "Huhuran wyvern sting should do 3-4k damage on dispelled");

-- add flag SPELL_ATTR_EX4_IGNORE_RESISTANCES to Huhuran acid spit
DELETE FROM spell_mod WHERE Id = 26050;
INSERT INTO spell_mod (Id, AttributesEx4, Comment) VALUES (26050, 1, "Huhuran acid spit ignore resistances");

# Fankriss.sql


-- Spawn of Fankriss enrage happens, seemingly, at a random point between 10 and 20 seconds after spawn.
-- Some sources say 10 sec, some 15 and some 20. From videos I can see it happening at any point aproximately
-- between 10 and 20 seconds. I therefore conclude it is either rand(10,20) sec, OR it should be based on something
-- else which is not yet understood.
-- EDIT: db ai no longer used. Creature has its own script.
-- UPDATE creature_ai_scripts SET event_param1=10000, event_param2=20000 WHERE id=1563001;



UPDATE `creature_template` SET `AIName`='', `speed_walk`='1.4', `ScriptName`='creature_spawn_fankriss' WHERE `entry`='15630';

UPDATE `creature_template` SET `ScriptName`='creature_vekniss_hatchling' WHERE `entry`='15962';

# CThunGrasp.sql

-- Update creatures position
UPDATE creature SET position_x = -8652.2, position_y = 2020.92, position_z = 108.58, orientation = 3.65 WHERE id = 15378;
UPDATE creature SET position_x = -8660.63, position_y = 2022.4, position_z = 108.58, orientation = 4.09 WHERE id = 15379;
UPDATE creature SET position_x = -8663.34, position_y = 2029.9, position_z = 108.58, orientation = 4.31 WHERE id = 15380;

-- Apply faction brood of Nozdormu to npcs after C'Thun
UPDATE creature_template SET faction_H = 35, faction_A = 35 WHERE entry BETWEEN 15378 AND 15380;

-- Add Grasps
DELETE FROM gameobject WHERE guid BETWEEN 21797 AND 21799;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, spawnFlags) VALUES
(21797, 180745, 531, -8660.63, 2022.4, 108.577, 3.64774, 0, 0, -0.968147, 0.250381, 7200, 100, 1, 0),
(21798, 180745, 531, -8652.2, 2020.92, 108.577, 0.244346, 0, 0, 0.121869, 0.992546, 7200, 100, 1, 0),
(21799, 180745, 531, -8663.34, 2029.9, 108.577, 4.45059, 0, 0, -0.793353, 0.608762, 7200, 100, 1, 0);

-- Set Grasps untargettables
UPDATE gameobject_template SET data1 = 0 WHERE entry = 180745;

-- Add a scriptname to caelestrasz in aq, used to handle gossip text
UPDATE creature_template SET `ScriptName`='aq_caelestrasz_ai' WHERE `entry`='15379';

-- npc texts for Caelestrasz in AQ
DELETE FROM npc_text WHERE ID BETWEEN '40100' AND '40101';
INSERT INTO npc_text (`ID`, `text0_0`) VALUES ('40100', 'Even if you somehow manage to free us without defeating C\'Thun, we would focus all our powers to see the beast banished back to the hell from whence it came - AT ANY COST.');
INSERT INTO npc_text (`ID`, `text0_0`) VALUES ('40101', 'Our freedom would have meant nothing if C\'Thun had survived. You are truly a champion of prophecy.');

# Doors.sql

-- Spawn AQ doors
DELETE FROM gameobject WHERE guid BETWEEN 21783 AND 21785;
INSERT INTO gameobject (guid, id, map, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state, spawnFlags) VALUES
(21783, 180634, 531, -8929.61, 1344.38, -104.211, 3.84846, 0, 0, -0.938191, 0.346119, 7200, 100, 1, 0),
(21784, 180635, 531, -9016.36, 1330.68, -104.211, 2.80125, 0, 0, 0.985556, 0.169352, 7200, 100, 1, 0),
(21785, 180636, 531, -8429.59, 2048.81, 153.309, 3.51685, 0, 0, -0.982449, 0.186529, 7200, 100, 1, 0);

-- Makes doors untargettable and no despawn
UPDATE gameobject_template SET flags = 36 WHERE entry BETWEEN 180634 AND 180636;

# CThun.sql

-- C'Thun portals aren't targettable
UPDATE creature_template SET unit_flags = unit_flags | 33554432 WHERE entry IN (15896, 15904, 15910);

-- Correct eye tentacle model
UPDATE creature_template SET modelid_1 = 15788 WHERE entry = 15726;

-- Correct giant eye tentacle scale
UPDATE creature_template SET scale = 5 WHERE entry = 15334;
-- Correct eye tentacle scale
UPDATE creature_template SET `scale`='1' WHERE `entry`='15726';

-- Correct giant claw tentacle scale
UPDATE creature_template SET scale = 5 WHERE entry = 15728;

-- Setting correct scale of claw tentacle
UPDATE creature_template SET `scale`='2' WHERE `entry`='15725';



  -- cmangos unit flags C'Thun tentacles TOD : search flags name
  UPDATE creature_template SET unit_flags = unit_flags | 32768 WHERE entry IN (15334, 15725, 15726, 15728, 15802);

  -- Bigger melee range for c'thun in p1
  UPDATE creature_model_info set `combat_reach` = 15, `bounding_radius` = 15  where `modelid` = 15556;
  
  
  -- flesh tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 10, `bounding_radius` = 1.2  where `modelid` = 15793;	
  
  -- Giant claw tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 10, `bounding_radius` = 1.2  where `modelid` = 15790;	
  -- Claw tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 3.5, `bounding_radius` = 1.89  where `modelid` = 15789;	
  
  -- combat reach fixes for eye tentacles. Since they use same modelId atm it may need to be overwritten in code
   -- if 2 and 10 seems wrong.
  -- Giant Eye tentacle fix melee range
  UPDATE creature_model_info set `combat_reach` = 2, `bounding_radius` = 1.2  where `modelid` = 15788;	  
  -- Eye tentacle
  -- UPDATE creature_model_info set `combat_reach` = 3.5, `bounding_radius` = 1.2  where `modelid` = 15788;	
  

  
  
  -- moved c'thun eye and body slightly towards entrance
UPDATE creature SET `position_x`='-8577.270', `position_y`='1986.942' WHERE `guid`='87560';

UPDATE creature SET `position_x`='-8577.270', `position_y`='1986.942' WHERE `guid`='87559';


-- Set Giant claw dmg to around 2500 dmg per hit on a full t2 geared tank, with demo shout up. ~3200 without demo shout.
UPDATE creature_template SET `mindmg`='8500', `maxdmg`='9500' WHERE `entry`='15728';

-- Set Giant eye dmg to around 2500 dmg per hit on a full t2 geared tank, with demo shout up. ~3200 without demo shout.
UPDATE creature_template SET `mindmg`='8500', `maxdmg`='9500', `baseattacktime`='2000' WHERE `entry`='15334';

-- Set eye tentacle damage 350-450 on 38% armor (need a good source for what this dmg should be)
UPDATE creature_template SET `mindmg`='500', `maxdmg`='800', `baseattacktime`='2000' WHERE `entry`='15726';

-- Claw tentacle damage 350-450 on 38% armor (french pdf say top 200-300dmg, so maybe reduce)
UPDATE creature_template SET `mindmg`='500', `maxdmg`='800', `baseattacktime`='2000' WHERE `entry`='15725';


-- stomach of cthun area triggers
DELETE FROM scripted_areatrigger WHERE entry IN (4033, 4034, 4036);
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4033', 'at_temple_ahnqiraj');
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4034', 'at_temple_ahnqiraj');
INSERT INTO scripted_areatrigger (`entry`, `ScriptName`) VALUES ('4036', 'at_temple_ahnqiraj');

-- flags update on trigger unit used to knock players out of cthuns body after being ported. Flags copied from viscidus trigger.
-- UPDATE `creature_template` SET `unit_flags`='33587968', `ScriptName`='boss cthun knockback trigger' WHERE `entry`='15800';


-- to remove c'thuns eye
DELETE FROM `creature` WHERE `guid`='87560';

-- to re-add c'thuns eye
-- INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`) 
-- VALUES ('87560', '15589	', '531', '15556', '0', '-8577.27', '1986.94', '100.4', '3.44', '6380', '0', '0', '1269434', '0', '0', '0');


-- Remove CREATURE_FLAG_EXTRA_AGGRO_ZONE from C'thun as we want to manually handle his combat with zone.
UPDATE creature_template SET flags_extra = flags_extra & ~512 WHERE entry = 15727;

-- Taunt-immunity for both c'thuns body and the eye. Fixes eye being able to turn during dark glare
UPDATE creature_template SET flags_extra = flags_extra | 256 where entry in (15589, 15727);

-- Fix mechanic immunities for adds
UPDATE creature_template SET MechanicImmuneMask = MechanicImmuneMask | (2 | 16 | 4096 | 512) WHERE entry IN (15728, 15334, 15725, 15726, 15802);

# Chests.sql

-- key requirement added to Large scarab coffer
UPDATE `gameobject_template` SET `flags`='2' WHERE `entry`='180690';

-- large scarab coffer drop 1-3 idols, all 25% chance to drop from what I can find (some sources give varying droprates, but i cant see why that would be the case)
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20874';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20875';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20876';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20877';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20878';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20879';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20881';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `entry`='17533' and`item`='20882';

-- large scarab coffer can drop 1-3 bags, and always drop one
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100', `maxcount`='3' WHERE `entry`='17533' and`item`='21156';

-- regular scarab coffer bag droprate set to 85%
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='85' WHERE `entry`='17532' and`item`='21156';

-- regular scarab coffer fixed droprate of 14% for 1-2 idols
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20866';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20867';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20868';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20869';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20870';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20871';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20872';
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='14' WHERE `entry`='17532' and`item`='20873';
