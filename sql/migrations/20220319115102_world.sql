DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220319115102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220319115102');
-- Add your query below.


-- Remove Uneeded Condition
DELETE FROM `conditions` WHERE `condition_entry` = 401;
UPDATE `gossip_menu` SET `condition_id` = 0 WHERE `entry` = 5502 AND `text_id` = 6553;

-- Correct Condition
-- 400: Target Has Done Quest 1046
UPDATE `conditions` SET `value1`=1046 WHERE `condition_entry`=400;

-- Add Missing Gossip Menu Option
INSERT INTO `gossip_menu_option` (`menu_id`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES
(5502, 'Raene, I lost Dartol\'s Rod of Transformation.', 9025, 1, 1, 5501, 5502, 389);

INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(5502, 0, 0, 15, 22227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Raene Wolfrunner - Cast Spell');

INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(5501, 6554);

INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`, `BroadcastTextID1`, `Probability1`, `BroadcastTextID2`, `Probability2`, `BroadcastTextID3`, `Probability3`, `BroadcastTextID4`, `Probability4`, `BroadcastTextID5`, `Probability5`, `BroadcastTextID6`, `Probability6`, `BroadcastTextID7`, `Probability7`) VALUES
(6554, 9026, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Add Conditions
-- 387: Target Can Accept Quest 1045
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (387, 19, 1045, 0, 0, 0, 0);
-- 388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (388, 23, 5462, 1, 0, 0, 1);
-- 389: (387: Target Can Accept Quest 1045) And (388:  Not (Target Has 1 Stacks of Item 5462 In Inventory Or Bank))
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (389, -1, 387, 388, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
