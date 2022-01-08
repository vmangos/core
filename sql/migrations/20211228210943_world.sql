DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211228210943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211228210943');
-- Add your query below.


UPDATE `gameobject_template` SET `script_name`='' WHERE `entry` = 179879;

-- Add Orb of Command Gossip (credit cmangos)
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(6001, 7154, 0, 0),
(6001, 7155, 0, 300);

INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(6001, 0, 0, '<Place my hand on the orb.>', 9859, 1, 1, -1, 0, 6001, 0, 0, NULL, 0, 300);

INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6001, 0, 15, 23460, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Orb of Command - Cast Spell');

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(300, 8, 7761, 0, 0, 0, 0);

-- Correct targets for spell Teleport to Blackwing Lair DND.
UPDATE `spell_target_position` SET `target_position_x`=-7666.46, `target_position_y`=-1103.08, `target_position_z`=399.679, `target_orientation`=1, `build_min`=4449 WHERE `id`=23460;
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `Comment`) VALUES (23460, 0, 25, 17, 'Teleport to Blackwing Lair: Fix Targets');

-- Correct targets for spell Teleport to Molten Core DND.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (25139, 409, 1080, -483, -108, 1, 4878, 5875);
INSERT INTO `spell_effect_mod` (`Id`, `EffectIndex`, `EffectImplicitTargetA`, `EffectImplicitTargetB`, `Comment`) VALUES (25139, 0, 25, 17, 'Teleport to Molten Core: Fix Targets');

-- Update Lothos Riftwaker's gossip script to use correct teleport spell.
DELETE FROM `gossip_scripts` WHERE `id`=5750;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5750, 0, 15, 25139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lothos Riftwaker - Teleport Target to Molten Core');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
