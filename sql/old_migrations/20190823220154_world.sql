DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190823220154');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190823220154');
-- Add your query below.


-- Condition: Unadorned Stake is in ready state.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4974, 50, 12345, 123, 0, 0, 0);

-- Only run completion script for quest if condition is met.
DELETE FROM `quest_end_scripts` WHERE `id`=4974;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 0, 39, 4974, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 4974, 'For The Horde: Start Script');
DELETE FROM `event_scripts` WHERE `id`=4974;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 0, 4, 147, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Remove Gossip Flag');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 0, 10, 10719, 30000, 0, 0, 0, 0, 0, 0, 2, 10719, 6, 10, -462.404, -2637.68, 96.0656, 5.8606, 0, 'For The Horde: Thrall - Summon Creature Herald of Thrall');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 0, 13, 0, 0, 0, 0, 12345, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Activate Unadorned Stake');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6013, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Say Text 1');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6014, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Say Text 2');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, -2356.8, -1932.5, 96, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1678.6, -4355.3, 61.73, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1543.2, -4413.9, 10.14, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1550.3, -4186.2, 40.95, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1931.2, -4279.3, 29.9, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1804.3, -4344.9, -2.9, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 1881, -4518.5, 27.74, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 10, 21003, 10000, 0, 0, 0, 0, 0, 0, 2, 21003, 6, 10, 316.5, -4737.3, 9.56, 0, 0, 'For The Horde: Thrall - Summon Creature Warchief Blessing Generator');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 15, 15, 16609, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Cast Spell Warchief\'s Blessing');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4974, 30, 4, 147, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'For The Horde: Thrall - Add Gossip Flag');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
