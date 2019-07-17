DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190717110310');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190717110310');
-- Add your query below.


-- Events list for Apothecary Falthis
DELETE FROM `creature_ai_events` WHERE `creature_id`=3735;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (373501, 3735, 0, 2, 0, 100, 0, 15, 0, 0, 0, 373501, 0, 0, 'Apothecary Falthis - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (373502, 3735, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 373502, 0, 0, 'Apothecary Falthis - Cast Summon Voidwalker OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=373502;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (373502, 0, 15, 12746, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Falthis - Cast Summon Voidwalker');

-- Add Spawns and Pooling for Apothecary Falthis 3735
DELETE FROM `creature` WHERE `id` = 3735;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `movementtype`) VALUES
(32913, 3735, 1, 0, 0, 3861.7, -214.578, 4.53143, 1.95477, 14400, 21600, 0, 0),
(32914, 3735, 1, 0, 0, 3828.21, -182.37, 1.15311, 0.873313, 14400, 21600, 0, 0),
(32915, 3735, 1, 0, 0, 3830.912, -212.6194, 3.763374, 1.570796, 14400, 21600, 0, 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES (3735, 1, 'Apothecary Falthis (3735)');
INSERT INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`) VALUES (3735, 3735, 0, 'Apothecary Falthis (3735)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
