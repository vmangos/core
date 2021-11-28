DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211127183758');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211127183758');
-- Add your query below.


-- Acolyte Magaz 
-- Add Missing Default Gossip And Add Condition To 3591
UPDATE `gossip_menu` SET `condition_id` = 1803 WHERE `entry` = 2912 AND `text_id` = 3591;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(2912, 3586, 0, 0);

-- Acolyte Wytula
-- Add Missing Default Gossip And Add Condition To 3592
UPDATE `gossip_menu` SET `condition_id` = 1803 WHERE `entry` = 2913 AND `text_id` = 3592;
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES
(2913, 3587, 0, 0);

-- Menara Voidrender
-- Gossip Text 3299 Should Become Default Gossip Once Quest 4786 Is Complete But Should Be Overrided By Gossip 3594 Only When Quest 1799 Is Accepted/Incomplete And Quest 4962 Or 4963 Is Not Complete/Accepted
UPDATE `gossip_menu` SET `condition_id` = 4788 WHERE `entry` = 2603 AND `text_id` = 3299;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4786, 8, 4786, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4787, -3, 1803, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4788, -1, 4786, 4787, 0, 0, 0);

-- Gossip Text 3594 Should Show When Quest 1799 Is Accepted/Incomplete And Quest 4962 Or 4963 Is Not Complete/Accepted
UPDATE `gossip_menu` SET `condition_id` = 1803 WHERE `entry` = 2603 AND `text_id` = 3594;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1799, 9, 1799, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1800, 9, 4962, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1801, 9, 4963, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1802, -1, 1800, 1801, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1803, -1, 1799, 1802, 0, 0, 0);

-- Add Start Script to Quest 4786
UPDATE `quest_template` SET `StartScript` = 4786, `SpecialFlags` = 2 WHERE `entry` = 4786;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4786, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Menara Voidrender - Modify Flags');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4786, 1, 15, 16633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Menara Voidrender - Cast Spell');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4786, 9, 7, 4786, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Menara Voidrender - Complete Quest');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4786, 10, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Menara Voidrender - Modify Flags');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
