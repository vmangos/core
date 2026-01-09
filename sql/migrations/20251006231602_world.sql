DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251006231602');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251006231602');
-- Add your query below.


-- 2557: Target has explored Dire Maul
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2557, 59, 2557, 0, 0, 0, 0);

-- 5527: Target Has Aura 33006 Index 0
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (5527, 1, 33006, 0, 0, 0, 0);

-- Gossips for Rabine Saturna.
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5764, 6949);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5765, 6950);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5767, 6953);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5768, 6952);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (5769, 6951);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5102, 0, 0, 'Have you ever heard of a place called Dire Maul?', 9534, 1, 1, 5764, 0, 0, 0, 0, NULL, 0, 2557);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5764, 0, 0, 'Why do you say that this is a coincidence, Rabine?', 9536, 1, 1, 5765, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5765, 0, 0, 'The Fruit of Fertility?', 9538, 1, 1, 5769, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5767, 0, 0, 'What would you have me do, Rabine?', 9544, 1, 1, -1, 0, 5767, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5768, 0, 0, 'What would happen if the Fruit of Fertility - or the Felvine - was allowed to be fully corrupted?', 9542, 1, 1, 5767, 0, 0, 0, 0, NULL, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5769, 0, 0, 'But something went wrong, didn\'t it?', 9540, 1, 1, 5768, 0, 0, 0, 0, NULL, 0, 0);

-- Gossip Script for Rabine Saturna.
DELETE FROM `gossip_scripts` WHERE `id`=5767;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5767, 0, 0, 74, 33006, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rabine Saturna - Enable Quest A Reliquary of Purity'),
(5767, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9545, 0, 0, 0, 0, 0, 0, 0, 0, 'Rabine Saturna - Say Text');

-- Server Side Dummy Aura to enable quest 5527.
INSERT INTO `spell_mod` (`Id`, `procChance`, `procFlags`, `procCharges`, `DurationIndex`, `Category`, `CastingTimeIndex`, `StackAmount`, `SpellIconID`, `activeIconID`, `manaCost`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `Custom`, `InterruptFlags`, `AuraInterruptFlags`, `ChannelInterruptFlags`, `Dispel`, `Stances`, `StancesNot`, `SpellVisual`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxAffectedTargets`, `MaxTargetLevel`, `DmgClass`, `rangeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `SpellFamilyName`, `SpellFamilyFlags`, `Mechanic`, `EquippedItemClass`, `Comment`) VALUES (33006, 101, -1, -1, 21, -1, 1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, -1, 0, -1, -1, 'Enable Quest: A Reliquary of Purity');
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `Effect`, `EffectDieSides`, `EffectBaseDice`, `EffectDicePerLevel`, `EffectRealPointsPerLevel`, `EffectBasePoints`, `EffectAmplitude`, `EffectPointsPerComboPoint`, `EffectChainTarget`, `EffectMultipleValue`, `EffectMechanic`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `EffectRadiusIndex`, `EffectApplyAuraName`, `EffectItemType`, `EffectMiscValue`, `EffectTriggerSpell`, `Comment`) VALUES (33006, 0, 6, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 4, -1, -1, -1, 'Enable Quest: A Reliquary of Purity');
UPDATE `quest_template` SET `RequiredCondition`=5527 WHERE `entry`=5527;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
