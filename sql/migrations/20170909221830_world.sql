DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20170909221830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20170909221830');
-- Add your query below.


-- Clean up some wrong data.
DELETE FROM `npc_gossip` WHERE `textid` = 8455;

-- Argent Medic's gossip text depends on the reputation.
DELETE FROM `gossip_menu` WHERE `entry` = 7175;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES ('7175', '8455', '7175');
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES ('7175', '8454', '0');
-- Conditions:
-- If player character is honored with Argent Dawn.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('7175', '5', '529', '5');
-- If player character has a Ghoul Rot debuff.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('7176', '1', '12541', '0');
-- If player character has a Maggot Slime debuff.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('7177', '1', '16449', '0');
-- If player character has a Ghoul Rot or Maggot Slime debuff.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('7178', '-2', '7176', '7177');
-- If player character is honored with Argent Dawn and has a Ghoul Rot or Maggot Slime debuff.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('7179', '-1', '7178', '7175');

-- Add a gossip text, correct stats
UPDATE `creature_template` SET  `gossip_menu_id` = 7175, `minlevel` = 57, `maxlevel` = 58, `minhealth` = 7740, `maxhealth` = 7831 WHERE `entry` = 16284;
-- prevent errors in console for guids: 53897, 53898
UPDATE `creature` SET `modelid` = 0, `curhealth` = 7740, `curmana` = 8964 WHERE `id` = 16284;

-- Implement a spell for argent medics
DELETE FROM `spell_effect_mod` WHERE `id` = 28133;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`)
 VALUES ('28133', '0', '38', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '-1', '21', '-1', '-1', '-1', '-1', '3', '-1', 'Argent Medic cure disease');

-- Add a gossip menu
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7175;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`)
VALUES (7175, 0, 0, 'I am diseased. Please cure me, medic.', 1, 1, -1, 0, 7175, 0, 0, NULL, 7179);
-- Localization
INSERT INTO `locales_gossip_menu_option` (`menu_id`, `id`, `option_text_loc1`, `option_text_loc2`, `option_text_loc3`, `option_text_loc4`, `option_text_loc5`, `option_text_loc6`, `option_text_loc7`, `option_text_loc8`, `box_text_loc1`, `box_text_loc2`, `box_text_loc3`, `box_text_loc4`, `box_text_loc5`, `box_text_loc6`, `box_text_loc7`, `box_text_loc8`)
 VALUES (7175, 0, '질병에 걸렸습니다. 치료를 부탁합니다.', 'Je suis malade. Soignez-moi, infirmier.', 'Ich bin krank. Sanitäter, bitte heilt mich.', '我的伤口感染了。请治疗我，医生。', '我生病了。請救救我，醫生。', 'Estoy enfermo. Cúrame, por favor.', 'Estoy enfermo. Cúrame, por favor.', 'Мне очень плохо. Пожалуйста, вылечите меня.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Add a gossip script
DELETE FROM `gossip_scripts` WHERE `id` = 7175;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`)
VALUES (7175, 0, 15, 28133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Argent Medic cure disease');

-- Move Defenders of Darrowshire(quest id:5211) to DB. Implement Diseased Flayer AI script.
UPDATE `creature_template` SET  `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` IN(8530, 8531, 8532);

INSERT INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
 VALUES
 -- Defenders of Darrowshire(quest id:5211) related.
 ('853201', '8532', '6', '0',' 100', '0', '0', '0', '0', '0', '12', '11064', '0', '60000', '0', '0', '0', '0', '0', '0', '0', '0', 'Diseased Flayer - Summon Darrowshire Spirit on Death'),
 -- Aura (spell id:12539) procs 12541 with 5% chance.
 ('853202', '8532','11', '0', '100','0','0','0','0','0','11','12539','0','1','0','0','0','0','0','0','0','0','Diseased Flayer - Cast Ghoul Rot Aura on Spawn'),
-- Defenders of Darrowshire(quest id:5211) related.
 ('853101', '8531', '6', '0', '100','0','0','0','0','0','12','11064','0','60000','0','0','0','0','0','0','0','0','Gibbering Ghoul - Summon Darrowshire Spirit on Death'),
-- Defenders of Darrowshire(quest id:5211) related.
 ('853001', '8530', '6', '0', '100', '0', '0', '0', '0', '0', '12', '11064', '0', '60000', '0', '0', '0', '0', '0', '0', '0', '0', 'Cannibal Ghoul - Summon Darrowshire Spirit on Death');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
