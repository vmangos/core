DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200608180450');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200608180450');
-- Add your query below.


-- Add waypoints for Stormwind Orphans
DELETE FROM `creature` WHERE `guid` IN (79803, 79804, 79805, 79812, 79813);
INSERT INTO `creature` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `wander_distance`, `movement_type`, `health_percent`, `mana_percent`) VALUES 
(79803, 14496, 0, -8616.48, 730.165, 101.898, 0.0599617, 2.5, 1, 100, 0),
(79804, 14496, 0, -8622.58, 753.462, 96.7479, 3.65709, 0, 0, 100, 0),
(79805, 14496, 0, -8625, 752.292, 96.7747, 3.76508, 0, 2, 100, 0),
(79812, 14496, 0, -8623.1, 754.583, 96.7515, 3.48989, 0, 0, 100, 0),
(79813, 14496, 0, -8603.17, 742.528, 101.904, 4.94385, 2.5, 1, 100, 0);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (79805, 79804, 2.68, 0.45, 1);
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES (79805, 79812, 2.97, 0.87, 1);
DELETE FROM `creature_movement` WHERE `id` IN (79803, 79804, 79805, 79812, 79813);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES 
(79805, 1, -8626.39, 743.037, 96.8322, 100, 0, 0, 11),
(79805, 2, -8627.57, 745.924, 96.8672, 100, 0, 0, 0),
(79805, 3, -8623.4, 753.237, 96.7595, 100, 0, 0, 0),
(79805, 4, -8617.67, 748.748, 97.6345, 100, 0, 0, 0),
(79805, 5, -8612.07, 742.614, 101.903, 100, 0, 0, 0),
(79805, 6, -8612.12, 735.167, 101.89, 100, 0, 0, 0),
(79805, 7, -8613.1, 728.437, 101.9, 100, 0, 0, 0),
(79805, 8, -8608.61, 733.172, 101.897, 100, 0, 0, 0),
(79805, 9, -8603.27, 740.623, 101.904, 100, 0, 0, 0),
(79805, 10, -8595.66, 740.165, 101.904, 100, 0, 0, 0),
(79805, 11, -8601.48, 733.407, 101.904, 100, 0, 0, 0),
(79805, 12, -8605.31, 727.319, 101.904, 100, 0, 0, 0),
(79805, 13, -8615.52, 727.063, 101.901, 100, 1000, 0, 0),
(79805, 14, -8607.57, 729.512, 101.903, 100, 0, 0, 0),
(79805, 15, -8600.44, 730.201, 101.903, 100, 0, 0, 0),
(79805, 16, -8597.01, 737.467, 101.904, 100, 0, 0, 0),
(79805, 17, -8600.44, 742.183, 101.904, 100, 0, 0, 0),
(79805, 18, -8607.69, 736.292, 101.898, 100, 0, 0, 0),
(79805, 19, -8610.44, 726.97, 101.902, 100, 0, 0, 0),
(79805, 20, -8610.4, 732.759, 101.896, 100, 0, 0, 0),
(79805, 21, -8613.14, 740.34, 101.897, 100, 0, 0, 0),
(79805, 22, -8616.39, 746.937, 99.3798, 100, 0, 0, 0),
(79805, 23, -8621.3, 753.886, 96.7381, 100, 0, 0, 0),
(79805, 24, -8628.01, 749.11, 96.8317, 100, 0, 0, 0),
(79805, 25, -8626.67, 739.997, 96.8415, 100, 0, 0, 0),
(79805, 26, -8625.76, 749.978, 96.8014, 100, 0, 0, 0),
(79805, 27, -8619.42, 756.304, 96.7158, 100, 0, 0, 0),
(79805, 28, -8608.4, 754.026, 96.7741, 100, 1000, 0, 0),
(79805, 29, -8616.48, 757.203, 96.6794, 100, 0, 0, 0),
(79805, 30, -8624.98, 752.307, 96.7744, 100, 0, 0, 0);

-- Events list for Shellene
DELETE FROM `creature_ai_events` WHERE `creature_id`=14497;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1449701, 14497, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 1449701, 0, 0, 'Shellene - Say Text OOC');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (3001739, 14497, 458, 10, 0, 100, 1, 1, 50, 3000, 3000, 3001739, 0, 0, 'Love is in the Air Event - Cast Love aura and turn on gossip NPC\_FLAG');
DELETE FROM `creature_ai_scripts` WHERE `id`=1449701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1449701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9689, 9690, 9691, 9692, 0, 0, 0, 0, 0, 'Shellene - Say Text');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
