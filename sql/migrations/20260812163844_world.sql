DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260812163844');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260812163844');
-- Add your query below.


-- 3379: Target Has Quest 3379 In Log
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3379, 9, 3379, 0, 0, 0, 0);
-- 6350:  Not (Source or Target Is In Zone or Area 51)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6350, 4, 51, 0, 0, 0, 1);
-- 6351: (6303: Source Is Dead Or Target Is Dead Or Source Is Not Within 80 Yards Of Target) OR (6350:  Not (Source or Target Is In Zone or Area 51))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (6351, -2, 6303, 6350, 0, 0, 0);

-- Gossip option and script.
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (2306, 0, 0, 'I need help in defeating the shadowsilk poachers.', 5306, 1, 1, -1, 0, 2306, 0, 0, NULL, 0, 3379);
DELETE FROM `gossip_scripts` WHERE `id`=2306;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2306, 0, 0, 61, 3379, 600, 0, 0, 0, 0, 0, 8, 0, 337901, 6351, 337900, 0, 0, 0, 0, 0, 'Shadoweaver: Start Scripted Map Event'),
(2306, 0, 1, 15, 15539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Cast Spell Conjure Staff of Command'),
(2306, 0, 2, 22, 250, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Set Faction to Escortee'),
(2306, 0, 3, 4, 46, 512, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Remove Immune to NPC Flag'),
(2306, 0, 4, 4, 147, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Remove Gossip Flag'),
(2306, 0, 5, 93, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Follow Player'),
(2306, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5949, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Say Text');
-- Event Failed Script
DELETE FROM `generic_scripts` WHERE `id`=337900;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(337900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4413, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Say Text'),
(337900, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Move Idle'),
(337900, 0, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Stop Following'),
(337900, 3, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Restore Faction'),
(337900, 3, 1, 4, 46, 256, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Add Immune to NPC Flag'),
(337900, 3, 2, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Add Gossip Flag'),
(337900, 3, 3, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Despawn');
-- Event Succeeded Script
DELETE FROM `generic_scripts` WHERE `id`=337901;
INSERT INTO `generic_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(337901, 0, 0, 20, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Move Idle'),
(337901, 0, 0, 93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Stop Following'),
(337901, 3, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Restore Faction'),
(337901, 3, 1, 4, 46, 512, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Add Immune to NPC Flag'),
(337901, 3, 2, 4, 147, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Add Gossip Flag');
-- Script for Staff of Command
DELETE FROM `event_scripts` WHERE `id`=3124;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3124, 0, 0, 26, 0, 0, 0, 0, 3379, 0, 22, 17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Staff of Command: Raze - Attack Target');
-- Quest Complete Script
DELETE FROM `quest_end_scripts` WHERE `id`=3379;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3379, 0, 0, 62, 3379, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: End Scripted Map Event'),
(3379, 0, 1, 0, 0, 0, 0, 0, 8441, 30, 10, 3, 4415, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Say Text'),
(3379, 3, 0, 18, 0, 0, 0, 0, 8441, 30, 10, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Shadoweaver: Raze - Despawn Creature');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
