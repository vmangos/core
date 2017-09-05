INSERT INTO `migrations` VALUES ('20170705100000');

-- ----------------------------------------------------------------------------
-- The Missing Diplomat part 8(id: 1447) db side implementation.
-- Remove db scripts
DELETE FROM `quest_start_scripts` WHERE `id` = '1447';
UPDATE `quest_template` SET `StartScript` = 0 WHERE `entry` = 1447;

-- script texts
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999902', 'Now you\'re gonna get it good, $N.', '0', '0', '0', '7', 'SAY_PROGRESS_1_DAS'),
 ('-1999903', 'Okay, okay! Enough fighting. No one else needs to get hurt.', '0', '0', '0', '7', 'SAY_PROGRESS_2_DAS'),
 ('-1999904', 'It\'s okay. boys. Back off. You\'ve done enough. I\'ll meet up with you later', '0', '0', '0', '7', 'SAY_PROGRESS_3_DAS'),
 ('-1999905', 'Ok, boss.', '0', '0', '0', '7', 'SAY_PROGRESS_4_THU');

-- Correct faction. Old Town Thugs and Ol' Beasley must not attack each other
UPDATE `creature_template` SET `faction_A` = 17, `faction_H` = 17 WHERE `entry` = 4969;
UPDATE `creature_template` SET `faction_A` = 12, `faction_H` = 12 WHERE `entry` = 1395;

-- ----------------------------------------------------------------------------
-- The Missing Diplomat part 11(id: 1249) db side implementation.

-- script texts
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999906', 'Oh, it\'s on now! But you thought I\'d be alone too, huh?!', '0', '0', '0', '7', 'SAY_PROGRESS_1_TAP'),
 ('-1999907', 'Whoa! This is way more than what I bargained for, you\'re on your own, Slim!', '0', '0', '0', '7', 'SAY_PROGRESS_2_FRI'),
 ('-1999908', 'Okay, okay! No need to get all violent. I\'ll talk. I\'ll talk!', '0', '0', '0', '7', 'SAY_PROGRESS_3_TAP'),
 ('-1999909', 'I have a few notes from the job back at my place. I\'ll get them and then meet you back in the inn.', '0', '0', '0', '7', 'SAY_PROGRESS_4_TAP'),
 ('-1999910', 'I\'m glad the commotions died down some around here. The last thing this place needs is another brawl.', '0', '0', '0', '7', 'SAY_PROGRESS_5_MIC');

-- Tapoke "Slim" Jahn shouldn't have any weapons equipped.
UPDATE `creature_template` SET `equipment_id` = 0 WHERE `entry` = 4962;

-- Add equipment for Slim's Friend
INSERT INTO `creature_equip_template` ( `entry`, `equipentry1`,  `equipentry2`, `equipentry3`) VALUES ('20000', '5278', '0', '0');
UPDATE `creature_template` SET `equipment_id` = 20000 WHERE `entry` = 4971;

-- Mikhail is not a vendor!
DELETE FROM `npc_vendor` WHERE `entry` = 4963;
-- Mikhail is a quest giver and has a gossip flag during quest event
UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 4963;

-- ----------------------------------------------------------------------------
-- The Missing Diplomat part 16(id: 1324) db side implementation.

-- Remove guards. They will spawn using script
DELETE FROM `creature` WHERE `guid` IN('31271','31268'); 

-- Corrected Private Hendel's spawn position. Added Random movement.
UPDATE `creature_template` SET `MovementType` = 0 WHERE `entry` = 4966;
UPDATE `creature` SET `position_x` = -2895.768311, `position_y` = -3349.095459, `position_z` = 31.286715, `orientation` = 4.848380, `spawndist` = 0, `MovementType` = 0 WHERE `guid` = 31274;

-- added missing quote for Tervosh
INSERT INTO `script_texts` ( `entry`, `content_default`,  `sound`, `type`, `emote`, `language`, `comment` ) VALUES
 ('-1999901', 'Farewell. We shall speak again. I\'m sure.', '0', '0', '0', '7', 'Tervosh SAY_FAREWELL'),
 ('-1999911', 'It\'s Proudmoore! Get out of here!', '0', '0', '0', '7', 'SAY_PROGRESS_5_SEN'),
 ('-1999912', 'Run!', '0', '0', '0', '7', 'SAY_PROGRESS_6_SEN');

-- Jaina's Teleport Group spell effect fix
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`,
 `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`,
 `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`)
VALUES ('7078', '0', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '8', '0', '-1', '-1', '-1', '-1', '-1', 'Jaina\'s Group Teleport Spell');
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('7078', '1', '4968'), ('7078', '1', '4967'), ('7078', '1', '4965');

-- Update quest template, "quest complete" should be triggerd by sctipt.
UPDATE `quest_template` SET `SpecialFlags` = 2 WHERE `entry` = 1324;

-- Fix Tervosh's gossip
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES ('5301', '6333', '0');
UPDATE `creature_template` SET `gossip_menu_id` = 5301 WHERE `entry` = 4967;

-- Trigger to make original NPCs not avaliable during event
INSERT INTO `creature_template` (`entry`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`,
 `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`,
 `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`,
 `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `Civilian`, `RacialLeader`, `RegenHealth`, `equipment_id`,
 `trainer_id`, `vendor_id`, `MechanicImmuneMask`, `SchoolImmuneMask`, `flags_extra`, `ScriptName`) VALUES 
('25000', '0', '0', '16169', '0', '0', '0', 'Missing Diplomat Trigger', 'Theramore tower', '0', '60', '60', '1', '1', '0', '0', '0', '35', '35', '0', '1', '1.14286', '1', '0', '0', '0', '0', '272', '1', '2000', '2000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '0', '3', '0', '0', '1', '0', '0', '0', '16384', '0', '130', '');

-- ----------------------------------------------------------------------------
-- The Missing Diplomat part 17(id: 1267) db side implementation.
-- UPDATE `quest_template` SET `Method` = 0 WHERE `entry` = 1267;

-- Fix. Jaina should start a quest The Missing Diplomat part 17(id: 1267) instead of Archmage Tervosh.
DELETE FROM `creature_questrelation`WHERE `quest` = 1267;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES ('4968', '1267');

-- Set correct quest text
UPDATE `quest_template` SET `Objectives` = '', `OfferRewardText` = 'Let me be first to thank you for all you\'ve done, $N. You have been an incredible blessing to my people and the people of Stormwind. I am sorry I couldn\'t make your acquaintance under better circumstances.$B$BUnderstand also that I cannot overtly thank you for your efforts, but I assure you again, it is appreciated.$B$BWhen you visit Theramore in the future, seek me out and I shall try to keep you appraised of the situation.$B$BThank you again, $N.' WHERE `entry` = 1267;

-- Fix buggy complete button, after changes above
UPDATE `quest_template` SET `NextQuestInChain` = 0 WHERE `entry` = 1324;
