DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181230143330');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181230143330');
-- Add your query below.


-- Gruk
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE `guid` = 13093;
DELETE FROM `creature_movement_template` WHERE `entry` = 14850;
INSERT INTO `creature_movement_template` (`entry`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`orientation`) VALUES
(14850,1,-533.573547,-2984.998291,92.891449,0,0,0.544762),
(14850,2,-532.475403,-2982.788330,92.937279,8000,0,1.315238),
(14850,3,-535.363220,-2986.683350,92.872704,0,0,3.697351),
(14850,4,-542.794800,-2987.175781,92.978973,5000,0,3.528283),
(14850,5,-539.589355,-2979.670410,93.142120,0,0,1.891512),
(14850,6,-540.856995,-2972.263428,93.218491,0,0,1.823968),
(14850,7,-542.508789,-2968.742188,91.666573,0,0,2.028172),
(14850,8,-556.491699,-2958.448730,91.808884,0,0,3.131655),
(14850,9,-560.313782,-2959.109131,91.671059,0,0,3.790605),
(14850,10,-563.526733,-2961.728027,91.670532,10000,0,3.972032),
(14850,11,-554.859009,-2957.945313,91.988205,0,0,6.109883),
(14850,12,-542.145020,-2969.399414,91.667198,0,0,5.083374),
(14850,13,-541.034119,-2970.875977,92.783127,0,0,5.097514),
(14850,14,-540.202698,-2974.504883,93.244942,0,0,4.887030),
(14850,15,-538.437439,-2986.249268,92.934875,0,0,5.359837),
(14850,16,-534.473755,-2989.052246,92.933678,11000,1485001,6.244966),
(14850,17,-537.863098,-2989.072754,92.941650,0,0,2.621139),
(14850,18,-541.218079,-2972.432129,93.217178,0,0,2.006171),
(14850,19,-542.573792,-2969.562012,91.666840,0,0,2.059578),
(14850,20,-555.276855,-2959.603027,91.810295,0,0,3.326426),
(14850,21,-557.442505,-2961.866943,91.666817,3000,0,4.019147),
(14850,22,-549.292786,-2960.807861,91.770721,0,0,5.483130),
(14850,23,-541.476624,-2969.215576,91.667030,0,0,4.975760),
(14850,24,-540.882019,-2970.607422,92.726028,0,0,5.106141),
(14850,25,-540.170898,-2974.454590,93.247406,0,0,4.645115),
(14850,26,-538.799744,-2988.168457,92.916451,0,0,6.279530),
(14850,27,-534.022583,-2988.809082,92.925842,12000,1485002,6.224692),
(14850,28,-535.851135,-2988.203857,92.910934,0,0,2.234083),
(14850,29,-537.077087,-2984.784668,92.954727,240000,1485003,2.084072);

DELETE FROM `creature_movement_scripts` WHERE `id` IN (1485001, 1485002, 1485003);
INSERT INTO `creature_movement_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1485001, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10066, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text'),
(1485001, 8, 0, 0, 0, 0, 0, 13170, 0, 9, 2, 10183, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text (Guard Taruc)'),
(1485001, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10267, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text'),

(1485002, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10184, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text'),
(1485002, 7, 0, 0, 0, 0, 0, 13170, 0, 9, 2, 10265, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text (Guard Taruc)'),
(1485002, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10266, 0, 0, 0, 0, 0, 0, 0, 0, 'Gruk - Say Text'),

(1485003, 0, 20, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 'Gruk - Movement changed to 1: Random'),
(1485003, 235, 20, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Gruk - Movement changed to 2: Waypoint");

-- Guard Taruc
UPDATE creature_template SET AIName = "EventAI" WHERE entry = 14859;
DELETE FROM creature_ai_events WHERE id = 1485901 AND creature_id = 14859;
INSERT INTO creature_ai_events (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1485901, 14859, 0, 1, 0, 100, 1, 8000, 9000, 8000, 9000, 1485901, 0, 0, "Guard Taruc - OOC Emote");
DELETE FROM creature_ai_scripts WHERE id = 1485901;
INSERT INTO creature_ai_scripts (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1485901, 0, 1, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Guard Taruc - Play Emote");


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
