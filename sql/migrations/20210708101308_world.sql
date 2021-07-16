DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210708101308');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210708101308');
-- Add your query below.


-- Reset Naga Brazier when Muglash reaches it.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (191, 55, 0, 0, 0, 0, 0);
DELETE FROM `creature_movement_scripts` WHERE `id`=1271713;
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 44, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Set Phase to 1');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 15, 20861, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Muglash - Cast Spell Muglash Waiting');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 0, 87, 0, 0, 0, 0, 47873, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 191, 'Vorsha the Lasher: Naga Brazier - Reset Button');
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1271713, 1, 4, 9, 16, 2, 0, 47873, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Vorsha the Lasher: Naga Brazier - Remove No Interact Flag');

-- Remove reset action from start of quest.
DELETE FROM `quest_start_scripts` WHERE `id`=6641 && `command`=87;

-- Remove reset action when quest fails.
DELETE FROM `generic_scripts` WHERE `id`=66410 && `command`=87;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
