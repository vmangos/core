DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190114014235');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190114014235');
-- Add your query below.


DELETE FROM `creature_equip_template` WHERE `entry` = 5697;
UPDATE `creature_template` SET `equipment_id` = 0 WHERE `entry` = 5697;

DELETE FROM `conditions` WHERE `condition_entry` = 5696;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(5696, 20, 5697, 5, 0, 0, 2);

DELETE FROM `creature_ai_events` WHERE `creature_id` = 5696;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(569601, 5696, 0, 4, 0, 100, 0, 0, 0, 0, 0, 569601, 0, 0, 'Gerard Abernathy - Summon Deathguard Elite on Aggro'),
(569602, 5696, 0, 1, 0, 100, 1, 30000, 45000, 230000, 300000, 569602, 0, 0, 'Gerard Abernathy - Start OOC Event'),
(3001540, 5696, 458, 10, 0, 100, 1, 1, 50, 3000, 3000, 3001540, 0, 0, 'Love is in the Air Event - Cast Love aura and turn on gossip NPC\_FLAG');

DELETE FROM `creature_ai_scripts` WHERE `id` = 569602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(569602, 0, 39, 569602, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 5696, 'Gerard Abernathy - Start OOC Event');

DELETE FROM `event_scripts` WHERE `id` IN (569602, 569603, 569604);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(569602, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1995, 0, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Say Text'),
(569602, 2, 19, 0, 0, 0, 0, 41840, 0, 9, 2, 2716, 0, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Set Equipment (Theresa)'),
(569602, 3, 60, 3, 1, 0, 0, 41840, 0, 9, 2, 0, 5697, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Start Waypoints (Theresa)'),
(569602, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2003, 2002, 1994, 2000, 0, 0, 0, 0, 0, 'Gerard Abernathy - Say Text'),
(569602, 32, 39, 569901, 569902, 0, 0, 38111, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Start Random Script (Leona Tharpe)'),
(569602, 41, 39, 569603, 569604, 0, 0, 0, 0, 0, 0, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Start Random Script'),
(569602, 50, 39, 569801, 569802, 0, 0, 38112, 0, 9, 2, 50, 50, 0, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Start Random Script (Joanna Whitehall)'),
(569603, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2007, 2008, 2004, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Say Random Text'),
(569604, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2009, 2005, 2006, 0, 0, 0, 0, 0, 0, 'Gerard Abernathy - Say Random Text');

DELETE FROM `event_scripts` WHERE `id` IN (569901, 569902);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(569901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2017, 2013, 2014, 0, 0, 0, 0, 0, 0, 'Leona Tharpe - Say Random Text'),
(569902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2016, 2012, 0, 0, 0, 0, 0, 0, 0, 'Leona Tharpe - Say Random Text');

DELETE FROM `event_scripts` WHERE `id` IN (569801, 569802);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(569801, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2018, 2019, 2024, 0, 0, 0, 0, 0, 0, 'Joanna Whitehall - Say Random Text'),
(569802, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2027, 2023, 0, 0, 0, 0, 0, 0, 0, 'Joanna Whitehall - Say Random Text');

UPDATE broadcast_text SET EmoteId0 = 1 WHERE ID IN (1994, 1995, 2000, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2011, 2012, 2013, 2014, 2016, 2017, 2018, 2019, 2023, 2024, 2027, 2028);

DELETE FROM `creature_movement_special` WHERE `id` = 5697;
INSERT INTO `creature_movement_special` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `script_id`) VALUES 
(5697, 1,  1662.228149, 353.675415, -60.742798, 100, 0, 0),
(5697, 2,  1667.451416, 349.544647, -60.740757, 100, 0, 0),
(5697, 3,  1678.154785, 345.241730, -60.481709, 100, 0, 0),
(5697, 4,  1698.429199, 334.720062, -60.482483, 100, 0, 0),
(5697, 5,  1706.992676, 324.664032, -55.392391, 100, 0, 0),
(5697, 6,  1720.239746, 334.975159, -49.161541, 100, 0, 0),
(5697, 7,  1734.973267, 346.734009, -55.393040, 100, 0, 0),
(5697, 8,  1743.887329, 335.560913, -60.484417, 100, 0, 0),
(5697, 9,  1782.811035, 350.868103, -62.369541, 100, 0, 0),
(5697, 10,  1795.520752, 370.227966, -60.158966, 100, 0, 0),
(5697, 11,  1785.445190, 400.132721, -57.214481, 100, 17000, 569701), 
(5697, 12,  1795.520752, 370.227966, -60.158966, 100, 0, 0),
(5697, 13,  1782.811035, 350.868103, -62.369541, 100, 0, 0),
(5697, 14,  1743.887329, 335.560913, -60.484417, 100, 0, 0),
(5697, 15,  1734.973267, 346.734009, -55.393040, 100, 0, 0),
(5697, 16,  1720.239746, 334.975159, -49.161541, 100, 0, 0),
(5697, 17,  1706.992676, 324.664032, -55.392391, 100, 0, 0),
(5697, 18,  1698.429199, 334.720062, -60.482483, 100, 0, 0),
(5697, 19,  1678.154785, 345.241730, -60.481709, 100, 0, 0),
(5697, 20,  1667.451416, 349.544647, -60.740757, 100, 0, 0),
(5697, 21,  1662.228149, 353.675415, -60.742798, 100, 0, 0),
(5697, 22,  1655.74, 367.394, -60.7665, 100, 0, 569702);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (569701, 569702);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(569701, 1, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Set Equipment'),
(569701, 1, 2, 138, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Kneel'),
(569701, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1997, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Say Text'),
(569701, 11, 0, 0, 0, 0, 0, 41835, 0, 9, 2, 2028, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Say Text (Father Lankester)'),
(569701, 11, 19, 0, 0, 0, 0, 0, 0, 0, 0, 2716, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Set Equipment'),
(569701, 14, 2, 138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Stand'),
(569701, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1998, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Say Text'),
(569702, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.27606, 0, 'Theresa - Set Orientation'),
(569702, 2, 19, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Set Equipment'),
(569702, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1999, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Say Text'),
(569702, 7, 0, 0, 0, 0, 0, 38425, 0, 9, 2, 2011, 0, 0, 0, 0, 0, 0, 0, 0, 'Theresa - Say Text (Gerard Abernathy)');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
