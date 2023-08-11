DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230811165702');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230811165702');
-- Add your query below.


-- Update Template
UPDATE `creature_template` SET `script_name` = '', `gossip_menu_id` = 5667, `npc_flags` = 3 WHERE `entry` = 14338;

-- Conditions for skill proficiency and quest completion
SET @COND := 3719;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(@COND+0, 7, 197, 275),  -- Tailoring
(@COND+1, 7, 165, 275),  -- Leatherworking
(@COND+2, 8, 5518, 0),
(@COND+3, 17, 22813, 1),   -- Create Gordok Ogre Suit (Tailoring)
(@COND+4, 17, 22815, 1),   -- Create Gordok Ogre Suit (Leatherworking)
(@COND+5, -1, @COND+2, @COND+3),
(@COND+6, -1, @COND+2, @COND+4),
(@COND+7, -1, @COND, @COND + 5),
(@COND+8, -1, @COND+1, @COND+6),
(@COND+9, 2, 18250, 1); -- 3730: Target Has 1 Stacks Of Item 18250 In Inventory

-- Add Gossip Scripts
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(566701, 0, 0, 15, 22814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knot Thimblejack - Cast Spell'),
(566702, 0, 0, 15, 22816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Knot Thimblejack - Cast Spell');

-- Add Gossip Menus
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(5667, 6795, 0, 0),
(5668, 6875, 0, 0),
(5716, 6883, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES
(5667, 0, 0, 'So, I found this shackle key...', 9344, 1, 1, 5668, 0, 0, 0, 0, '', 0, @COND+9),
(5667, 1, 0, 'Why should I bother fixing the trap?  Why not just eliminate the guard the old fashioned way?', 9368, 1, 1, 5716, 0, 0, 0, 0, '', 0, 0),
(5667, 2, 0, 'Please teach me how to make a Gordok Ogre Suit!', 0, 1, 1, -1, 0, 566701, 0, 0, '', 0, @COND+7),
(5667, 3, 0, 'Please teach me how to make a Gordok Ogre Suit!', 0, 1, 1, -1, 0, 566702, 0, 0, '', 0, @COND+8);

-- Correct Position For Knot's Ball and Chain
UPDATE `gameobject` SET `position_x` = 581.241, `position_y` = 524.321, `position_z` = -25.4027, `orientation` = 3.49067, `rotation2` = -0.984807, `rotation3` = 0.173652 WHERE `guid` = 396421;

-- Add Scripts
UPDATE `quest_template` SET `CompleteScript` = 5525 WHERE `entry` = 7429;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5525, 0, 0, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Knot!: Knot Thimblejack - Emote'),
(5525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9346, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Knot!: Knot Thimblejack - Talk'),
(5525, 0, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Knot!: Knot Thimblejack - Modify Flags'),
(5525, 0, 0, 81, 396421, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Knot!: Knot Thimblejack - Despawn Object'),
(5525, 0, 0, 9, 396410, 7200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Free Knot!: Knot Thimblejack - Respawn');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
