DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261120083320');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261120083320');
-- Add your query below.

-- --------------------------------------------------------------------------------------------------
-- Rhahk'Zor
-- --------------------------------------------------------------------------------------------------

-- Guards: aggro together (1), pull the master (2), respawn on master evade (4) and respawn (128)
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(79165, 79168, 135), -- Defias Watchman
(79167, 79168, 135); -- Defias Watchman
UPDATE `creature` SET `wander_distance`=0.5, `movement_type`=1 WHERE `guid` IN (79165, 79167);

-- Walks between his spawn point and the mine entrance
UPDATE `creature` SET `movement_type`=2 WHERE `guid`=79168;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79168, 1, -191.90909, -440.37494, 53.496284, 100, 15000, 0, 0),
(79168, 2, -192.55725, -446.49152, 54.267075, 100, 0, 0, 0),
(79168, 3, -191.6708, -453.17554, 54.521107, 1.658063, 9000, 0, 0),
(79168, 4, -192.42433, -453.19968, 54.426994, 100, 0, 0, 0),
(79168, 5, -193.1702, -445.618, 54.148388, 100, 0, 0, 0);

-- Boss-death spawns: the rat and the patrol pair wait dead until Rhahk'Zor died (FLAG_CANT_SPAWN_IF_BOSS_ALIVE),
-- the instance script delays the pair by 45 s.
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(79186, 79168, 2048), -- Rat
(79189, 79168, 2048), -- Defias Overseer, patrol leader
(79188, 79168, 2048); -- Defias Evoker, walks at his left side

UPDATE `creature` SET `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `movement_type`=0 WHERE `guid`=79188;
DELETE FROM `creature_groups` WHERE `leader_guid`=79188;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(79189, 79188, 2, 1.61, 15);
DELETE FROM `creature_movement` WHERE `id` IN (79188, 79189);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79189, 1, -94.24898, -400.69452, 57.755085, 100, 0, 0, 0),
(79189, 2, -114.48709, -393.15775, 56.659332, 100, 0, 0, 0),
(79189, 3, -135.5206, -406.13586, 57.978394, 100, 0, 0, 0),
(79189, 4, -154.99382, -400.0841, 56.497444, 100, 0, 0, 0),
(79189, 5, -171.60515, -403.33044, 57.054592, 100, 0, 0, 0),
(79189, 6, -186.2994, -422.38342, 54.308994, 100, 0, 0, 0),
(79189, 7, -193.43137, -440.72485, 53.547367, 100, 0, 0, 0),
(79189, 8, -191.91858, -454.97757, 54.50148, 100, 0, 0, 0),
(79189, 9, -189.18675, -481.0852, 54.007587, 100, 0, 0, 0),
(79189, 10, -187.43935, -493.86975, 53.53527, 100, 0, 0, 0),
(79189, 11, -178.4633, -502.00378, 53.887436, 100, 0, 0, 0),
(79189, 12, -187.43935, -493.86975, 53.53527, 100, 0, 0, 0),
(79189, 13, -189.18674, -481.08517, 54.007587, 100, 0, 0, 0),
(79189, 14, -191.91856, -454.97754, 54.50148, 100, 0, 0, 0),
(79189, 15, -189.18674, -481.08517, 54.007587, 100, 0, 0, 0),
(79189, 16, -187.43935, -493.86975, 53.53527, 100, 0, 0, 0),
(79189, 17, -178.4633, -502.00378, 53.887436, 100, 0, 0, 0),
(79189, 18, -187.43935, -493.86975, 53.53527, 100, 0, 0, 0),
(79189, 19, -189.18675, -481.0852, 54.007587, 100, 0, 0, 0),
(79189, 20, -191.91858, -454.97757, 54.50148, 100, 0, 0, 0),
(79189, 21, -193.43137, -440.72485, 53.547367, 100, 0, 0, 0),
(79189, 22, -186.2994, -422.38342, 54.308994, 100, 0, 0, 0),
(79189, 23, -171.60515, -403.33044, 57.054592, 100, 0, 0, 0),
(79189, 24, -154.99382, -400.0841, 56.497444, 100, 0, 0, 0),
(79189, 25, -135.5206, -406.13586, 57.978394, 100, 0, 0, 0),
(79189, 26, -114.48709, -393.15775, 56.659332, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Sneed's Shredder / Sneed
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry` IN (6420, 6430);
DELETE FROM `creature_ai_events` WHERE `creature_id` IN (642, 643);
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 64201 AND 64399;

-- Terrify only on a random target that is not the tank
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(6420, 'Deadmines - Sneed\'s Shredder',
    3603, 100, 1, 0, 0, 0,  8, 13, 48, 54, 0,  -- Distracting Pain
    7399, 100, 5, 0, 0, 0,  9, 18, 15, 21, 0); -- Terrify
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(6430, 'Deadmines - Sneed',
    6713, 100, 1, 0, 0, 0,  5, 11, 62, 86, 0); -- Disarm

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(64201, 0, 0, 15, 5141, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sneed\'s Shredder - Cast Spell Eject Sneed');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(64201, 642, 0, 6, 0, 100, 0, 0, 0, 0, 0, 64201, 0, 0, 'Sneed\'s Shredder - Cast Eject Sneed on Creature Death');

-- Waits at the upper end of the ramp and at the lumber pile
UPDATE `creature` SET `position_x`=-309.309021, `position_y`=-508.85501, `position_z`=57.300095, `orientation`=1.313006 WHERE `guid`=79223;
DELETE FROM `creature_movement` WHERE `id`=79223;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79223, 1, -309.30902, -508.85498, 57.300102, 100, 34000, 0, 0),
(79223, 2, -310.8667, -514.5936, 54.40195, 100, 0, 0, 0),
(79223, 3, -300.48676, -516.3926, 51.41426, 100, 0, 0, 0),
(79223, 4, -294.85272, -517.7074, 48.96365, 100, 0, 0, 0),
(79223, 5, -295.64676, -525.08527, 49.311577, 100, 0, 0, 0),
(79223, 6, -287.786, -525.94446, 49.649414, 100, 14000, 0, 0),
(79223, 7, -287.83667, -525.5971, 49.638412, 100, 0, 0, 0),
(79223, 8, -294.9804, -524.75183, 49.098244, 100, 0, 0, 0),
(79223, 9, -296.03558, -515.90295, 49.509197, 100, 0, 0, 0),
(79223, 10, -310.81705, -514.57434, 54.410484, 100, 0, 0, 0);

-- Boss-death patrol: linked to the Shredder (Sneed is a summon), the instance script holds it until Sneed died.
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(79177, 79223, 2048), -- Defias Evoker, patrol leader
(79170, 79223, 2048); -- Defias Overseer, walks at his right side

UPDATE `creature` SET `movement_type`=2 WHERE `guid`=79177;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=79170;
DELETE FROM `creature_groups` WHERE `leader_guid`=79170;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(79177, 79170, 2.2, 4.55, 15);
DELETE FROM `creature_movement` WHERE `id` IN (79170, 79177);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79177, 1, -186.95818, -481.76346, 54.040146, 100, 0, 0, 0),
(79177, 2, -190.70293, -502.35675, 52.764175, 100, 0, 0, 0),
(79177, 3, -212.0412, -505.8564, 50.912086, 100, 0, 0, 0),
(79177, 4, -225.21088, -491.1336, 48.06478, 100, 0, 0, 0),
(79177, 5, -243.50027, -482.04996, 48.794502, 100, 0, 0, 0),
(79177, 6, -277.94595, -482.44012, 48.813126, 100, 0, 0, 0),
(79177, 7, -288.72583, -490.04144, 49.882317, 100, 0, 0, 0),
(79177, 8, -289.1889, -502.86853, 50.13845, 100, 0, 0, 0),
(79177, 9, -290.29633, -515.02405, 49.645164, 100, 0, 0, 0),
(79177, 10, -291.81174, -547.0825, 49.449257, 100, 0, 0, 0),
(79177, 11, -290.908, -555.2198, 49.45501, 100, 0, 0, 0),
(79177, 12, -293.18338, -569.42267, 48.784706, 100, 0, 0, 0),
(79177, 13, -303.31754, -584.896, 47.86361, 100, 0, 0, 0),
(79177, 14, -304.77106, -598.60785, 48.19625, 100, 0, 0, 0),
(79177, 15, -293.51953, -603.1351, 47.57084, 100, 0, 0, 0),
(79177, 16, -281.7558, -597.12897, 50.22444, 100, 0, 0, 0),
(79177, 17, -271.70645, -581.9288, 49.995926, 100, 0, 0, 0),
(79177, 18, -253.54874, -578.5116, 51.14273, 100, 0, 0, 0),
(79177, 19, -271.70645, -581.9288, 49.995926, 100, 0, 0, 0),
(79177, 20, -281.7558, -597.12897, 50.22444, 100, 0, 0, 0),
(79177, 21, -293.51953, -603.1351, 47.57084, 100, 0, 0, 0),
(79177, 22, -304.77106, -598.60785, 48.19625, 100, 0, 0, 0),
(79177, 23, -303.31754, -584.896, 47.86361, 100, 0, 0, 0),
(79177, 24, -293.18338, -569.42267, 48.784706, 100, 0, 0, 0),
(79177, 25, -290.908, -555.2198, 49.45501, 100, 0, 0, 0),
(79177, 26, -291.81174, -547.0825, 49.449257, 100, 0, 0, 0),
(79177, 27, -290.29633, -515.02405, 49.645164, 100, 0, 0, 0),
(79177, 28, -289.1889, -502.86853, 50.13845, 100, 0, 0, 0),
(79177, 29, -288.72583, -490.04144, 49.882317, 100, 0, 0, 0),
(79177, 30, -277.94595, -482.44012, 48.813126, 100, 0, 0, 0),
(79177, 31, -243.50027, -482.04996, 48.794502, 100, 0, 0, 0),
(79177, 32, -225.21088, -491.1336, 48.06478, 100, 0, 0, 0),
(79177, 33, -212.0412, -505.8564, 50.912086, 100, 0, 0, 0),
(79177, 34, -190.70293, -502.35675, 52.764175, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Gilnid
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=17630;
DELETE FROM `creature_ai_events` WHERE `creature_id`=1763;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 176301 AND 176399;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(17630, 'Deadmines - Gilnid',
    5213, 100, 1, 0, 0, 0,  2,  7, 23, 44, 0); -- Molten Metal

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(176301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1145, 1146, 1147, 0, 0, 0, 0, 0, 0, 'Gilnid - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(176301, 1763, 0, 1, 0, 100, 1, 120000, 120000, 120000, 120000, 176301, 0, 0, 'Gilnid - Random Say OOC');

-- Boss-death patrol: spawns at Gilnid's death, walks from the foundry down to the ship and back.
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(79285, 79206, 2048), -- Defias Taskmaster, patrol leader
(79284, 79206, 2048), -- Defias Wizard, behind him
(79283, 79206, 2048); -- Defias Taskmaster, at his left side

UPDATE `creature` SET `position_x`=-230.55, `position_y`=-574.55, `position_z`=51.23, `orientation`=1.30298, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79285;
UPDATE `creature` SET `position_x`=-232.19, `position_y`=-576.18, `position_z`=51.23, `orientation`=1.30298, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=0, `spawn_flags`=0 WHERE `guid`=79284;
UPDATE `creature` SET `position_x`=-229.58, `position_y`=-576.38, `position_z`=51.23, `orientation`=1.58573, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=0, `spawn_flags`=0 WHERE `guid`=79283;
DELETE FROM `creature_groups` WHERE `leader_guid`=79284;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(79285, 79284, 2, 3.15, 15),
(79285, 79283, 2, 1.63, 15);
DELETE FROM `creature_movement` WHERE `id` IN (79283, 79284, 79285);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79285, 1, -226.54195, -564.5306, 51.22959, 100, 0, 0, 0),
(79285, 2, -209.75278, -553.3245, 51.22959, 100, 0, 0, 0),
(79285, 3, -186.41515, -561.52637, 51.229595, 100, 0, 0, 0),
(79285, 4, -179.53603, -580.251, 45.519478, 100, 0, 0, 0),
(79285, 5, -192.47157, -603.79034, 34.469368, 100, 0, 0, 0),
(79285, 6, -214.60352, -604.6466, 25.749641, 100, 0, 0, 0),
(79285, 7, -231.67249, -588.0884, 19.30647, 100, 0, 0, 0),
(79285, 8, -234.65001, -569.723, 19.30647, 100, 0, 0, 0),
(79285, 9, -225.2302, -556.5635, 19.30647, 100, 0, 0, 0),
(79285, 10, -209.05774, -551.3421, 19.306469, 100, 0, 0, 0),
(79285, 11, -190.22055, -555.4245, 19.306469, 100, 0, 0, 0),
(79285, 12, -178.37686, -569.7693, 19.308126, 100, 0, 0, 0),
(79285, 13, -176.28462, -580.1344, 19.30925, 100, 0, 0, 0),
(79285, 14, -151.21896, -579.62585, 19.311586, 100, 0, 0, 0),
(79285, 15, -139.71736, -580.76373, 18.523998, 100, 0, 0, 0),
(79285, 16, -130.0759, -598.4244, 16.41069, 100, 0, 0, 0),
(79285, 17, -129.9118, -617.7772, 13.53013, 100, 0, 0, 0),
(79285, 18, -127.7115, -634.4573, 13.01549, 100, 0, 0, 0),
(79285, 19, -109.1601, -646.9236, 8.094193, 100, 0, 0, 0),
(79285, 20, -101.8926, -660.6654, 7.510015, 100, 0, 0, 0),
(79285, 21, -109.1601, -646.9236, 8.094193, 100, 0, 0, 0),
(79285, 22, -127.7115, -634.4573, 13.01549, 100, 0, 0, 0),
(79285, 23, -129.9118, -617.7772, 13.53013, 100, 0, 0, 0),
(79285, 24, -130.0759, -598.4244, 16.41069, 100, 0, 0, 0),
(79285, 25, -139.71736, -580.76373, 18.523998, 100, 0, 0, 0),
(79285, 26, -176.28462, -580.1344, 19.30925, 100, 0, 0, 0),
(79285, 27, -178.37686, -569.7693, 19.308126, 100, 0, 0, 0),
(79285, 28, -190.22055, -555.4245, 19.306469, 100, 0, 0, 0),
(79285, 29, -209.05774, -551.3421, 19.306469, 100, 0, 0, 0),
(79285, 30, -225.2302, -556.5635, 19.30647, 100, 0, 0, 0),
(79285, 31, -234.65001, -569.723, 19.30647, 100, 0, 0, 0),
(79285, 32, -231.67249, -588.0884, 19.30647, 100, 0, 0, 0),
(79285, 33, -214.60352, -604.6466, 25.749641, 100, 0, 0, 0),
(79285, 34, -192.47157, -603.79034, 34.469368, 100, 0, 0, 0),
(79285, 35, -179.53603, -580.251, 45.519478, 100, 0, 0, 0),
(79285, 36, -186.41515, -561.52637, 51.229595, 100, 0, 0, 0),
(79285, 37, -209.75278, -553.3245, 51.22959, 100, 0, 0, 0),
(79285, 38, -226.54195, -564.5306, 51.22959, 100, 0, 0, 0),
(79285, 39, -230.24435, -579.23816, 51.280838, 100, 0, 0, 0),
(79285, 40, -254.89024, -578.315, 51.143654, 100, 0, 0, 0),
(79285, 41, -270.391, -580.4173, 49.793816, 100, 0, 0, 0),
(79285, 42, -293.2387, -604.6723, 47.669945, 100, 0, 0, 0),
(79285, 43, -308.08636, -589.3385, 47.696728, 100, 0, 0, 0),
(79285, 44, -293.2387, -604.6723, 47.669945, 100, 0, 0, 0),
(79285, 45, -270.391, -580.4173, 49.793816, 100, 0, 0, 0),
(79285, 46, -254.89024, -578.315, 51.143654, 100, 0, 0, 0),
(79285, 47, -230.24435, -579.23816, 51.280838, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Captain Greenskin
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=6470;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(6470, 'Deadmines - Captain Greenskin',
    5208, 100, 4, 0, 0, 32,  6, 17, 37, 97, 0,  -- Poisoned Harpoon
    5532, 100, 1, 0, 0, 0,   5, 18, 17, 42, 0); -- Cleave

-- Walks a loop over the deck with a short stop at his spawn point, the Pirate and the Squallshaper in formation
UPDATE `creature` SET `position_x`=-64.128204, `position_y`=-832.945862, `position_z`=41.234051, `orientation`=1.228981 WHERE `guid`=79333;
UPDATE `creature` SET `position_x`=-65.730385, `position_y`=-833.170837, `position_z`=41.090137, `orientation`=1.220535 WHERE `guid`=79334;
UPDATE `creature` SET `position_x`=-63.265984, `position_y`=-834.741455, `position_z`=41.316696, `orientation`=1.159101 WHERE `guid`=79335;
DELETE FROM `creature_movement` WHERE `id`=79333;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79333, 1, -56.56912, -830.9819, 41.92698, 100, 0, 0, 0),
(79333, 2, -56.50835, -826.0676, 41.92096, 100, 0, 0, 0),
(79333, 3, -55.78435, -812.3325, 41.96623, 100, 0, 0, 0),
(79333, 4, -50.19228, -809.0906, 42.50024, 100, 0, 0, 0),
(79333, 5, -63.76807, -808.2733, 41.21822, 100, 0, 0, 0),
(79333, 6, -79.45795, -807.5516, 39.83706, 100, 0, 0, 0),
(79333, 7, -91.9668, -808.2596, 38.83189, 100, 0, 0, 0),
(79333, 8, -103.5676, -814.1779, 37.99392, 100, 0, 0, 0),
(79333, 9, -102.9695, -824.1078, 38.04074, 100, 0, 0, 0),
(79333, 10, -92.63673, -831.0884, 38.81192, 100, 0, 0, 0),
(79333, 11, -76.55396, -835.9163, 40.1191, 100, 0, 0, 0),
(79333, 12, -65.46484, -836.7028, 41.12366, 100, 0, 0, 0),
(79333, 13, -64.1282, -832.9458, 41.23405, 100, 2000, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Edwin VanCleef
-- --------------------------------------------------------------------------------------------------

-- Guards: aggro together (1), pull the master (2), respawn on master evade (4) and respawn (128)
DELETE FROM `creature_groups` WHERE `leader_guid`=79336;
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
(79383, 79336, 135), -- Defias Blackguard
(79368, 79336, 135); -- Defias Blackguard

DELETE FROM `creature_spells` WHERE `entry`=6390;
DELETE FROM `creature_ai_events` WHERE `creature_id`=639;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 63901 AND 63999;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(6390, 'Deadmines - Edwin VanCleef',
    3391, 100, 0, 0, 0, 0,  5, 20,  5, 20, 0); -- Thrash

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(63902, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6061, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text'),
(63903, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6063, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text'),
(63904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1048, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text'),
(63904, 0, 0, 15, 5200, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Cast Spell VanCleef\'s Allies'),
(63905, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6064, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text'),
(63906, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6065, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text'),
(63907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6062, 0, 0, 0, 0, 0, 0, 0, 0, 'Edwin VanCleef - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(63902, 639, 0, 4, 0, 100, 0, 0, 0, 0, 0, 63902, 0, 0, 'Edwin VanCleef - Yell on Aggro'),
(63903, 639, 0, 2, 0, 100, 0, 75, 51, 0, 0, 63903, 0, 0, 'Edwin VanCleef - Yell at 75% HP'),
(63904, 639, 0, 2, 0, 100, 0, 50, 36, 0, 0, 63904, 0, 0, 'Edwin VanCleef - Emote and Summon VanCleef\'s Allies at 50% HP'),
(63905, 639, 0, 2, 0, 100, 0, 35, 11, 0, 0, 63905, 0, 0, 'Edwin VanCleef - Yell at 35% HP'),
(63906, 639, 0, 2, 0, 100, 0, 10, 0, 0, 0, 63906, 0, 0, 'Edwin VanCleef - Yell at 10% HP'),
(63907, 639, 0, 5, 0, 100, 1, 5000, 5000, 1, 0, 63907, 0, 0, 'Edwin VanCleef - Yell on Player Kill');

-- --------------------------------------------------------------------------------------------------
-- Cookie
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=6450;
DELETE FROM `creature_ai_events` WHERE `creature_id`=645;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 64501 AND 64599;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(6450, 'Deadmines - Cookie',
    6306, 100, 0, 0, 0, 0,  5,  5, 53, 70, 0); -- Acid Splash

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(64502, 0, 0, 15, 5174, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cookie - Cast Spell Cookie\'s Cooking'),
(64503, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cookie - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(64502, 645, 0, 2, 0, 100, 1, 50, 0, 22000, 26000, 64502, 0, 0, 'Cookie - Cast Cookie\'s Cooking at 50% HP'),
(64503, 645, 0, 2, 0, 100, 4, 15, 0, 0, 0, 64503, 0, 0, 'Cookie - Flee at 15% HP');

-- Walks between the galley and the bow, potters about at the galley for 60 s each round
UPDATE `creature` SET `position_x`=-69.32134, `position_y`=-850.14856, `position_z`=16.931229, `orientation`=4.92527 WHERE `guid`=79344;
DELETE FROM `creature_movement` WHERE `id`=79344;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79344, 1, -69.32134, -850.14856, 16.931229, 100, 1000, 1, 0),
(79344, 2, -66.97825, -855.5297, 17.111067, 100, 0, 0, 0),
(79344, 3, -59.45654, -857.23553, 17.353142, 100, 0, 0, 0),
(79344, 4, -50.3138, -855.70825, 18.302856, 100, 0, 0, 0),
(79344, 5, -35.34467, -851.60175, 18.970959, 100, 0, 0, 0),
(79344, 6, -27.44754, -842.3621, 19.31336, 100, 0, 0, 0),
(79344, 7, -21.12468, -832.7762, 19.623764, 100, 0, 0, 0),
(79344, 8, -18.802567, -829.0729, 19.76191, 100, 0, 0, 0),
(79344, 9, -20.687439, -833.7297, 19.655472, 100, 0, 0, 0),
(79344, 10, -26.837341, -843.58496, 19.354517, 100, 0, 0, 0),
(79344, 11, -36.79807, -850.1254, 18.884825, 100, 0, 0, 0),
(79344, 12, -50.30767, -856.97894, 18.310108, 100, 0, 0, 0),
(79344, 13, -59.595325, -855.60986, 17.339714, 100, 0, 0, 0),
(79344, 14, -77.48779, -856.55023, 16.909397, 100, 0, 0, 0),
(79344, 15, -91.12364, -853.84766, 17.185957, 100, 0, 0, 0),
(79344, 16, -103.98405, -848.8289, 16.997131, 100, 0, 0, 0),
(79344, 17, -113.17393, -842.34204, 16.91727, 100, 0, 0, 0),
(79344, 18, -123.847534, -832.82416, 16.895817, 100, 0, 0, 0),
(79344, 19, -126.50819, -822.9019, 16.834297, 100, 0, 0, 0),
(79344, 20, -122.65848, -832.29535, 16.93224, 100, 0, 0, 0),
(79344, 21, -114.2487, -843.2539, 16.883636, 100, 0, 0, 0),
(79344, 22, -103.26367, -847.5654, 17.026318, 100, 0, 0, 0),
(79344, 23, -90.66455, -852.49133, 17.202484, 100, 0, 0, 0),
(79344, 24, -78.37317, -857.9727, 17.437523, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Defias Overseer (634), Defias Evoker (1729)
-- --------------------------------------------------------------------------------------------------

-- 8 spots with a random Overseer or Evoker, 6 of them walk a path, 2 wander
DELETE FROM `creature_groups` WHERE `leader_guid`=79374;
DELETE FROM `creature_movement` WHERE `id` IN (79138, 79139, 79147, 79151, 79152, 79171, 79373, 79374);
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-56.64209, `position_y`=-376.924408, `position_z`=54.236263, `orientation`=5.916666, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79138;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-58.953236, `position_y`=-390.729736, `position_z`=53.948158, `orientation`=5.270895, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=3, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79139;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-86.581604, `position_y`=-376.20258, `position_z`=57.2615, `orientation`=0.820305, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79147;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-116.774902, `position_y`=-444.119293, `position_z`=54.759884, `orientation`=3.735005, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79152;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-102.588921, `position_y`=-395.528137, `position_z`=58.160156, `orientation`=3.717551, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79151;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-185.987579, `position_y`=-487.112152, `position_z`=54.044189, `orientation`=1.775586, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79171;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-192.541779, `position_y`=-484.369293, `position_z`=54.132118, `orientation`=6.213372, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79373;
UPDATE `creature` SET `id`=634, `id2`=1729, `position_x`=-222.824387, `position_y`=-489.602905, `position_z`=48.534119, `orientation`=2.160415, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79374;
UPDATE `creature` SET `mana_percent`=100 WHERE `guid` IN (79151, 79152, 79373); -- the Evoker is a caster

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79138, 1, -58.76378, -377.43353, 54.003212, 100, 0, 0, 0),
(79138, 2, -66.11079, -373.37067, 55.162174, 100, 0, 0, 0),
(79138, 3, -73.79227, -374.31607, 54.66773, 100, 0, 0, 0),
(79138, 4, -84.69266, -376.90512, 56.844524, 100, 0, 0, 0),
(79138, 5, -99.66847, -378.01794, 58.452507, 100, 0, 0, 0),
(79138, 6, -112.35368, -377.89508, 58.22396, 100, 0, 0, 0),
(79138, 7, -119.7283, -388.72574, 58.33481, 100, 0, 0, 0),
(79138, 8, -112.35368, -377.89508, 58.22396, 100, 0, 0, 0),
(79138, 9, -99.66847, -378.01794, 58.452507, 100, 0, 0, 0),
(79138, 10, -84.69266, -376.90512, 56.844524, 100, 0, 0, 0),
(79138, 11, -73.79227, -374.31607, 54.66773, 100, 0, 0, 0),
(79138, 12, -66.11079, -373.37067, 55.162174, 100, 0, 0, 0),
(79138, 13, -58.76378, -377.43353, 54.003212, 100, 0, 0, 0),
(79138, 14, -52.46672, -379.36597, 54.579678, 100, 0, 0, 0),
(79138, 15, -39.569878, -375.84045, 56.07526, 100, 0, 0, 0),
(79138, 16, -52.46672, -379.36597, 54.579678, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79147, 1, -86.581604, -376.20258, 57.2615, 100, 0, 0, 0),
(79147, 2, -72.23367, -377.3908, 54.352997, 100, 0, 0, 0),
(79147, 3, -86.581604, -376.20258, 57.2615, 100, 0, 0, 0),
(79147, 4, -106.50342, -384.58344, 57.00715, 100, 0, 0, 0),
(79147, 5, -115.66759, -397.75037, 57.232178, 100, 0, 0, 0),
(79147, 6, -126.15794, -405.9793, 58.316452, 100, 0, 0, 0),
(79147, 7, -136.25526, -408.28925, 58.215996, 100, 0, 0, 0),
(79147, 8, -141.91911, -407.14886, 58.51202, 100, 0, 0, 0),
(79147, 9, -144.31105, -403.2868, 57.561764, 100, 0, 0, 0),
(79147, 10, -153.6606, -398.99005, 56.54003, 100, 0, 0, 0),
(79147, 11, -165.11497, -399.59137, 56.648952, 100, 0, 0, 0),
(79147, 12, -174.86765, -408.23163, 55.95623, 100, 0, 0, 0),
(79147, 13, -187.572006, -425.240997, 53.997337, 100, 0, 0, 0),
(79147, 14, -174.86765, -408.23163, 55.95623, 100, 0, 0, 0),
(79147, 15, -165.11497, -399.59137, 56.648952, 100, 0, 0, 0),
(79147, 16, -153.6606, -398.99005, 56.54003, 100, 0, 0, 0),
(79147, 17, -144.31105, -403.2868, 57.561764, 100, 0, 0, 0),
(79147, 18, -141.91911, -407.14886, 58.51202, 100, 0, 0, 0),
(79147, 19, -136.25526, -408.28925, 58.215996, 100, 0, 0, 0),
(79147, 20, -126.15794, -405.9793, 58.316452, 100, 0, 0, 0),
(79147, 21, -115.66759, -397.75037, 57.232178, 100, 0, 0, 0),
(79147, 22, -106.50342, -384.58344, 57.00715, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79152, 1, -116.7749, -444.1193, 54.759884, 100, 0, 0, 0),
(79152, 2, -117.9636, -434.5622, 54.967766, 100, 0, 0, 0),
(79152, 3, -115.90824, -427.48868, 54.884758, 100, 0, 0, 0),
(79152, 4, -120.17801, -416.62067, 57.922184, 100, 0, 0, 0),
(79152, 5, -119.5502, -410.78864, 58.469112, 100, 0, 0, 0),
(79152, 6, -115.10835, -405.2406, 59.711975, 100, 0, 0, 0),
(79152, 7, -105.37104, -397.7303, 58.35349, 100, 0, 0, 0),
(79152, 8, -104.52167, -386.5047, 57.10899, 100, 0, 0, 0),
(79152, 9, -100.74132, -378.118, 58.120064, 100, 0, 0, 0),
(79152, 10, -82.71153, -376.43393, 56.322186, 100, 0, 0, 0),
(79152, 11, -72.693306, -379.93402, 54.877014, 100, 0, 0, 0),
(79152, 12, -65.48118, -386.8156, 53.401222, 100, 0, 0, 0),
(79152, 13, -61.64849, -399.21436, 53.78483, 100, 0, 0, 0),
(79152, 14, -65.48118, -386.8156, 53.401222, 100, 0, 0, 0),
(79152, 15, -72.693306, -379.93402, 54.877014, 100, 0, 0, 0),
(79152, 16, -82.71153, -376.43393, 56.322186, 100, 0, 0, 0),
(79152, 17, -100.74132, -378.118, 58.120064, 100, 0, 0, 0),
(79152, 18, -104.52167, -386.5047, 57.10899, 100, 0, 0, 0),
(79152, 19, -105.37104, -397.7303, 58.35349, 100, 0, 0, 0),
(79152, 20, -115.10835, -405.2406, 59.711975, 100, 0, 0, 0),
(79152, 21, -119.5502, -410.78864, 58.469112, 100, 0, 0, 0),
(79152, 22, -120.17801, -416.62067, 57.922184, 100, 0, 0, 0),
(79152, 23, -115.90824, -427.48868, 54.884758, 100, 0, 0, 0),
(79152, 24, -117.9636, -434.5622, 54.967766, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79171, 1, -188.06647, -479.887, 54.047768, 100, 0, 0, 0),
(79171, 2, -187.91211, -496.45074, 53.40541, 100, 0, 0, 0),
(79171, 3, -192.43625, -503.41602, 53.115036, 100, 0, 0, 0),
(79171, 4, -202.85753, -505.9479, 52.573483, 100, 0, 0, 0),
(79171, 5, -214.83952, -511.1139, 50.75599, 100, 0, 0, 0),
(79171, 6, -202.85753, -505.9479, 52.573483, 100, 0, 0, 0),
(79171, 7, -192.43625, -503.41602, 53.115044, 100, 0, 0, 0),
(79171, 8, -187.91211, -496.45074, 53.40541, 100, 0, 0, 0),
(79171, 9, -188.06647, -479.887, 54.04777, 100, 0, 0, 0),
(79171, 10, -185.98758, -487.11215, 54.04419, 100, 0, 0, 0),
(79171, 11, -183.5982, -498.61597, 53.539482, 100, 0, 0, 0),
(79171, 12, -172.41374, -506.0768, 53.896214, 100, 0, 0, 0),
(79171, 13, -165.83821, -506.6772, 53.35173, 100, 0, 0, 0),
(79171, 14, -157.95786, -511.49872, 53.091927, 100, 0, 0, 0),
(79171, 15, -153.14784, -526.7511, 50.833046, 100, 0, 0, 0),
(79171, 16, -157.95786, -511.49872, 53.091927, 100, 0, 0, 0),
(79171, 17, -165.83821, -506.6772, 53.35173, 100, 0, 0, 0),
(79171, 18, -172.41374, -506.0768, 53.896214, 100, 0, 0, 0),
(79171, 19, -183.5982, -498.61597, 53.539482, 100, 0, 0, 0),
(79171, 20, -185.98758, -487.11215, 54.04419, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79373, 1, -187.68474, -491.22113, 53.525726, 100, 0, 0, 0),
(79373, 2, -187.06964, -501.111, 52.817223, 100, 0, 0, 0),
(79373, 3, -198.57916, -506.24493, 53.05465, 100, 0, 0, 0),
(79373, 4, -210.25772, -506.26825, 51.188133, 100, 0, 0, 0),
(79373, 5, -217.77377, -497.89062, 49.244225, 100, 0, 0, 0),
(79373, 6, -226.99973, -486.98877, 48.560753, 100, 0, 0, 0),
(79373, 7, -239.53906, -479.85858, 49.07003, 100, 0, 0, 0),
(79373, 8, -256.99722, -479.81537, 49.440235, 100, 0, 0, 0),
(79373, 9, -239.53906, -479.85858, 49.07003, 100, 0, 0, 0),
(79373, 10, -226.99973, -486.98877, 48.560753, 100, 0, 0, 0),
(79373, 11, -217.77377, -497.89062, 49.244225, 100, 0, 0, 0),
(79373, 12, -210.25772, -506.26825, 51.188133, 100, 0, 0, 0),
(79373, 13, -198.57916, -506.24493, 53.05465, 100, 0, 0, 0),
(79373, 14, -187.06964, -501.111, 52.817223, 100, 0, 0, 0),
(79373, 15, -187.68474, -491.22113, 53.525726, 100, 0, 0, 0),
(79373, 16, -191.73372, -483.35373, 54.041306, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79374, 1, -222.82439, -489.6029, 48.53412, 100, 0, 0, 0),
(79374, 2, -214.4271, -502.1547, 50.96303, 100, 0, 0, 0),
(79374, 3, -215.1579, -513.8491, 51.19925, 100, 0, 0, 0),
(79374, 4, -214.4271, -502.1547, 50.96303, 100, 0, 0, 0),
(79374, 5, -222.82439, -489.6029, 48.53412, 100, 0, 0, 0),
(79374, 6, -248.54062, -481.88538, 49.448555, 100, 0, 0, 0);

DELETE FROM `creature_spells` WHERE `entry`=6340;
DELETE FROM `creature_ai_events` WHERE `creature_id`=634;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 63401 AND 63499;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(6340, 'Deadmines - Defias Overseer',
    5115, 100, 0, 0, 0, 0, 2, 20, 24, 43, 0); -- Battle Command

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(63402, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Overseer - Flee');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(63402, 634, 0, 2, 0, 100, 4, 15, 0, 0, 0, 63402, 0, 0, 'Defias Overseer - Flee at 15% HP');

DELETE FROM `creature_spells` WHERE `entry`=17290;
DELETE FROM `creature_ai_events` WHERE `creature_id`=1729;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 172901 AND 172999;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(17290, 'Deadmines - Defias Evoker',
    11829, 100, 1, 0, 0, 32, 0, 7, 3, 17, 0); -- Flamestrike

-- Source in combat: the missing-buff event below is also checked out of combat
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(76, 43, 0, 0, 0, 0, 2);

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(172901, 0, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Evoker - Cast Spell Frost Armor'),
(172904, 0, 0, 15, 12544, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Evoker - Cast Spell Frost Armor'),
(172905, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Evoker - Flee'),
(172906, 0, 0, 15, 4979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Evoker - Cast Quick Flame Ward');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(172901, 1729, 0, 1, 0, 100, 1, 1000, 1000, 1800000, 1800000, 172901, 0, 0, 'Defias Evoker - Cast Frost Armor on Spawn'),
(172904, 1729, 0, 27, 0, 100, 1, 12544, 1, 15000, 30000, 172904, 0, 0, 'Defias Evoker - Cast Frost Armor on Missing Buff'),
(172905, 1729, 0, 2, 0, 100, 4, 15, 0, 0, 0, 172905, 0, 0, 'Defias Evoker - Flee at 15% HP'),
(172906, 1729, 76, 16, 0, 100, 1, 4979, 10, 25000, 63500, 172906, 0, 0, 'Defias Evoker - Cast Quick Flame Ward on Friendly Missing Buff');

-- --------------------------------------------------------------------------------------------------
-- Trash: Defias Miner (598)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature_spells` SET `delayInitialMax_1`=13 WHERE `entry`=5980;

-- Mines at his spot instead of walking
DELETE FROM `creature_groups` WHERE `leader_guid`=79144;
DELETE FROM `creature_movement` WHERE `id`=79144;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=79144;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(8, 598, 0, 0, 0, 0, 36, -65.874619, -348.985016, 56.187321, 2.687807, 43200, 43200, 0, 100, 0, 0, 0, 0, 0, 10),
(111, 598, 0, 0, 0, 0, 36, -60.233887, -350.185394, 55.929626, 6.195919, 43200, 43200, 0, 100, 0, 0, 0, 0, 0, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `sheath_state`, `emote_state`) VALUES
(8, 0, 1, 233),
(111, 0, 1, 233);

-- --------------------------------------------------------------------------------------------------
-- Trash: Defias Taskmaster (4417), Defias Wizard (4418)
-- --------------------------------------------------------------------------------------------------

-- 5 spots with a random Taskmaster or Wizard, each walks a path
DELETE FROM `creature_movement` WHERE `id` IN (79214, 79229, 79233, 79246, 79260);
UPDATE `creature` SET `id`=4417, `id2`=4418, `position_x`=-292.01627, `position_y`=-553.296, `position_z`=49.452904, `orientation`=3.030618, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79246;
UPDATE `creature` SET `id`=4417, `id2`=4418, `position_x`=-286.73477, `position_y`=-549.68677, `position_z`=49.43975, `orientation`=0.749327, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79229;
UPDATE `creature` SET `id`=4417, `id2`=4418, `position_x`=-247.10542, `position_y`=-578.5476, `position_z`=51.19613, `orientation`=0.561151, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79233;
UPDATE `creature` SET `id`=4417, `id2`=4418, `position_x`=-158.413483, `position_y`=-580.4104, `position_z`=19.298595, `orientation`=3.122689, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79214;
UPDATE `creature` SET `id`=4417, `id2`=4418, `position_x`=-103.953064, `position_y`=-654.0595, `position_z`=7.4237385, `orientation`=5.21559, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79260;
UPDATE `creature` SET `mana_percent`=100 WHERE `guid` IN (79214, 79233, 79246); -- the Wizard is a caster

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79246, 1, -292.01627, -553.296, 49.452904, 100, 0, 0, 0),
(79246, 2, -296.85025, -570.1918, 48.577343, 100, 0, 0, 0),
(79246, 3, -302.3725, -581.19073, 47.605476, 100, 0, 0, 0),
(79246, 4, -301.97244, -593.9545, 48.116074, 100, 0, 0, 0),
(79246, 5, -293.54813, -601.5745, 47.47778, 100, 0, 0, 0),
(79246, 6, -278.99503, -595.66296, 51.05494, 100, 0, 0, 0),
(79246, 7, -274.24017, -583.7839, 50.226143, 100, 0, 0, 0),
(79246, 8, -265.88293, -577.00464, 50.52929, 100, 0, 0, 0),
(79246, 9, -252.44026, -578.5026, 51.151405, 100, 0, 0, 0),
(79246, 10, -265.88293, -577.00464, 50.52929, 100, 0, 0, 0),
(79246, 11, -274.24017, -583.7839, 50.226143, 100, 0, 0, 0),
(79246, 12, -278.99503, -595.66296, 51.05494, 100, 0, 0, 0),
(79246, 13, -293.54813, -601.5745, 47.47778, 100, 0, 0, 0),
(79246, 14, -301.97244, -593.9545, 48.116074, 100, 0, 0, 0),
(79246, 15, -302.3725, -581.19073, 47.605476, 100, 0, 0, 0),
(79246, 16, -296.85025, -570.1918, 48.577343, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79229, 1, -286.73477, -549.68677, 49.43975, 100, 0, 0, 0),
(79229, 2, -286.54498, -561.3732, 49.090645, 100, 0, 0, 0),
(79229, 3, -291.0139, -571.6229, 48.973297, 100, 0, 0, 0),
(79229, 4, -298.56674, -578.64954, 47.511406, 100, 0, 0, 0),
(79229, 5, -305.55154, -587.29443, 47.780563, 100, 0, 0, 0),
(79229, 6, -306.7934, -598.79144, 48.205612, 100, 0, 0, 0),
(79229, 7, -302.50745, -606.9749, 47.58105, 100, 0, 0, 0),
(79229, 8, -291.69592, -602.72833, 47.720074, 100, 0, 0, 0),
(79229, 9, -279.93256, -593.248, 50.81076, 100, 0, 0, 0),
(79229, 10, -268.7006, -578.3376, 50.22232, 100, 0, 0, 0),
(79229, 11, -257.3604, -577.2259, 51.145557, 100, 0, 0, 0),
(79229, 12, -268.7006, -578.3376, 50.22232, 100, 0, 0, 0),
(79229, 13, -279.93256, -593.248, 50.81076, 100, 0, 0, 0),
(79229, 14, -291.69592, -602.72833, 47.720074, 100, 0, 0, 0),
(79229, 15, -302.50745, -606.9749, 47.58105, 100, 0, 0, 0),
(79229, 16, -306.7934, -598.79144, 48.205612, 100, 0, 0, 0),
(79229, 17, -305.55154, -587.29443, 47.780563, 100, 0, 0, 0),
(79229, 18, -298.56674, -578.64954, 47.511406, 100, 0, 0, 0),
(79229, 19, -291.0139, -571.6229, 48.973297, 100, 0, 0, 0),
(79229, 20, -286.54498, -561.3732, 49.090645, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79233, 1, -247.10542, -578.5476, 51.19613, 100, 0, 0, 0),
(79233, 2, -266.955, -578.12616, 50.42572, 100, 0, 0, 0),
(79233, 3, -273.79282, -585.1593, 50.418015, 100, 0, 0, 0),
(79233, 4, -282.27957, -597.8999, 50.118706, 100, 0, 0, 0),
(79233, 5, -296.09717, -603.58307, 47.515846, 100, 0, 0, 0),
(79233, 6, -306.11313, -595.0604, 48.027958, 100, 0, 0, 0),
(79233, 7, -298.4439, -578.7232, 47.53197, 100, 0, 0, 0),
(79233, 8, -290.46985, -567.01434, 49.170135, 100, 0, 0, 0),
(79233, 9, -298.4439, -578.7232, 47.53197, 100, 0, 0, 0),
(79233, 10, -306.11313, -595.0604, 48.027958, 100, 0, 0, 0),
(79233, 11, -296.09717, -603.58307, 47.515846, 100, 0, 0, 0),
(79233, 12, -282.27957, -597.8999, 50.118706, 100, 0, 0, 0),
(79233, 13, -273.79282, -585.1593, 50.418015, 100, 0, 0, 0),
(79233, 14, -266.955, -578.12616, 50.42572, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79214, 1, -158.41348, -580.4104, 19.298595, 100, 0, 0, 0),
(79214, 2, -139.71736, -580.76373, 18.523998, 100, 0, 0, 0),
(79214, 3, -131.46512, -589.5594, 18.33189, 100, 0, 0, 0),
(79214, 4, -130.63118, -603.9581, 15.526054, 100, 0, 0, 0),
(79214, 5, -130.11502, -620.458, 12.97068, 100, 0, 0, 0),
(79214, 6, -127.78906, -631.6504, 13.044312, 100, 0, 0, 0),
(79214, 7, -113.72759, -642.26294, 9.976677, 100, 0, 0, 0),
(79214, 8, -103.50933, -657.09735, 7.4237385, 100, 0, 0, 0),
(79214, 9, -113.72759, -642.26294, 9.976677, 100, 0, 0, 0),
(79214, 10, -127.78906, -631.6504, 13.044312, 100, 0, 0, 0),
(79214, 11, -130.11502, -620.458, 12.97068, 100, 0, 0, 0),
(79214, 12, -130.63118, -603.9581, 15.526054, 100, 0, 0, 0),
(79214, 13, -131.46512, -589.5594, 18.33189, 100, 0, 0, 0),
(79214, 14, -139.71736, -580.76373, 18.523998, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79260, 1, -103.953064, -654.0595, 7.4237385, 100, 0, 0, 0),
(79260, 2, -108.63995, -644.96466, 8.169756, 100, 0, 0, 0),
(79260, 3, -133.57932, -631.97363, 14.086486, 100, 0, 0, 0),
(79260, 4, -128.89893, -620.37335, 12.8853035, 100, 0, 0, 0),
(79260, 5, -118.38314, -617.18506, 14.055471, 100, 0, 0, 0),
(79260, 6, -131.37022, -609.909, 13.8192425, 100, 0, 0, 0),
(79260, 7, -130.78125, -599.5094, 16.114822, 100, 0, 0, 0),
(79260, 8, -132.13634, -587.5697, 18.374426, 100, 0, 0, 0),
(79260, 9, -140.86057, -577.78467, 18.726727, 100, 0, 0, 0),
(79260, 10, -153.77892, -579.9578, 19.309643, 100, 0, 0, 0),
(79260, 11, -140.86057, -577.78467, 18.726727, 100, 0, 0, 0),
(79260, 12, -132.13634, -587.5697, 18.374426, 100, 0, 0, 0),
(79260, 13, -130.78125, -599.5094, 16.114822, 100, 0, 0, 0),
(79260, 14, -131.37022, -609.909, 13.8192425, 100, 0, 0, 0),
(79260, 15, -118.38314, -617.18506, 14.055471, 100, 0, 0, 0),
(79260, 16, -128.89893, -620.37335, 12.8853035, 100, 0, 0, 0),
(79260, 17, -133.57932, -631.97363, 14.086486, 100, 0, 0, 0),
(79260, 18, -108.63995, -644.96466, 8.169756, 100, 0, 0, 0);

DELETE FROM `creature_spells` WHERE `entry`=44180;
DELETE FROM `creature_ai_events` WHERE `creature_id`=4418;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 441801 AND 441899;

INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(44180, 'Deadmines - Defias Wizard',
    113, 100, 1, 0, 0, 32, 3, 8, 10, 15, 0, -- Chains of Ice
    9053, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0); -- Fireball

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(441801, 0, 0, 47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Wizard - Flee'),
(441802, 0, 0, 15, 4979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Wizard - Cast Quick Flame Ward');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(441801, 4418, 0, 2, 0, 100, 4, 15, 0, 0, 0, 441801, 0, 0, 'Defias Wizard - Flee at 15% HP'),
(441802, 4418, 76, 16, 0, 100, 1, 4979, 10, 25000, 63500, 441802, 0, 0, 'Defias Wizard - Cast Quick Flame Ward on Friendly Missing Buff');

-- --------------------------------------------------------------------------------------------------
-- Trash: Goblin Woodcarver (641)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_movement` WHERE `id`=79207;
UPDATE `creature` SET `position_x`=-284.02356, `position_y`=-483.880219, `position_z`=49.926548, `orientation`=2.835918, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79207;
UPDATE `creature` SET `position_x`=-270.227966, `position_y`=-523.863647, `position_z`=49.950367, `orientation`=0.296706 WHERE `guid`=79221;
UPDATE `creature` SET `position_x`=-295.155975, `position_y`=-504.55365, `position_z`=49.503532, `orientation`=0.715585, `wander_distance`=1, `movement_type`=1 WHERE `guid`=79222;
UPDATE `creature` SET `position_x`=-296.991272, `position_y`=-528.199707, `position_z`=49.37093, `orientation`=1.727876, `wander_distance`=2, `movement_type`=1 WHERE `guid`=79227;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(119, 641, 0, 0, 0, 0, 36, -300.8313, -493.87317, 49.43989, 1.4796, 43200, 43200, 0, 100, 100, 2, 0, 0, 0, 10),
(126, 641, 0, 0, 0, 0, 36, -284.815155, -518.513489, 48.538517, 4.520403, 43200, 43200, 0, 100, 100, 0, 0, 0, 0, 10);
INSERT INTO `creature_addon` (`guid`, `patch`, `sheath_state`, `emote_state`) VALUES
(126, 0, 1, 234);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79207, 1, -284.02356, -483.8802, 49.92655, 100, 33000, 0, 0),
(79207, 2, -284.23383, -485.69238, 49.94569, 100, 0, 0, 0),
(79207, 3, -279.00452, -485.9936, 48.912605, 100, 0, 0, 0),
(79207, 4, -278.8442, -490.9167, 49.237305, 100, 0, 0, 0),
(79207, 5, -283.45578, -493.5826, 49.195206, 100, 0, 0, 0),
(79207, 6, -283.5502, -514.0262, 48.907715, 100, 0, 0, 0),
(79207, 7, -280.7719, -519.89777, 48.855667, 100, 0, 0, 0),
(79207, 8, -283.1958, -521.42285, 48.63613, 100, 10000, 0, 0),
(79207, 9, -283.30664, -522.4891, 48.656666, 100, 0, 0, 0),
(79207, 10, -274.21652, -519.23425, 49.85315, 100, 0, 0, 0),
(79207, 11, -275.3435, -518.56586, 49.80932, 100, 0, 0, 0),
(79207, 12, -283.05737, -521.0515, 48.63594, 100, 7000, 0, 0),
(79207, 13, -282.92218, -519.98413, 48.61708, 100, 0, 0, 0),
(79207, 14, -279.7437, -485.23083, 48.98772, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(119, 1, -301.78625, -488.11188, 49.165245, 100, 33000, 0, 0),
(119, 2, -301.92758, -488.64844, 49.161034, 100, 0, 0, 0),
(119, 3, -297.33508, -497.1024, 49.645508, 100, 0, 0, 0),
(119, 4, -291.17535, -498.39166, 50.226646, 100, 0, 0, 0),
(119, 5, -290.94092, -519.6039, 49.63137, 100, 0, 0, 0),
(119, 6, -289.62323, -523.9527, 49.639244, 100, 0, 0, 0),
(119, 7, -287.98358, -523.6623, 49.5725, 100, 10000, 0, 0),
(119, 8, -288.58807, -522.5039, 49.550705, 100, 0, 0, 0),
(119, 9, -288.80554, -500.67365, 50.145775, 100, 0, 0, 0),
(119, 10, -296.8723, -498.0021, 49.80485, 100, 0, 0, 0),
(119, 11, -300.8313, -493.87317, 49.43989, 100, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `creature_id`=641;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 64101 AND 64199;

-- Throws the axe at the pull and fights on without Cleave
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(64101, 0, 0, 15, 6466, 0, 0, 0, 0, 0, 1, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Woodcarver - Cast Spell Axe Toss'),
(64101, 0, 1, 15, 6467, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Woodcarver - Cast Spell Unarmed Woodcutter'),
(64101, 0, 2, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goblin Woodcarver - Clear Spell List until Combat End');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(64101, 641, 0, 4, 0, 30, 0, 0, 0, 0, 0, 64101, 0, 0, 'Goblin Woodcarver - Cast Axe Toss on Aggro');

-- --------------------------------------------------------------------------------------------------
-- Trash: Goblin Craftsman (1731)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature_spells` SET `delayInitialMin_1`=0, `delayInitialMax_1`=12 WHERE `entry`=17310;

UPDATE `creature` SET `wander_distance`=3, `movement_type`=1 WHERE `guid` IN (79197, 79199, 79200, 79201, 79203, 79204, 79205, 79211, 79217, 79218, 79242, 79243);
UPDATE `creature` SET `wander_distance`=2, `movement_type`=1 WHERE `guid`=79247;
UPDATE `creature` SET `position_x`=-214.418411, `position_y`=-548.662964, `position_z`=19.306469, `orientation`=0.57346 WHERE `guid`=79197;

-- --------------------------------------------------------------------------------------------------
-- Trash: Goblin Engineer (622)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature_spells` SET `delayInitialMin_1`=1, `delayInitialMax_1`=6 WHERE `entry`=6220;

-- Short paths between the workbenches
DELETE FROM `creature_movement` WHERE `id`=79213;
UPDATE `creature` SET `position_x`=-199.980743, `position_y`=-576.726501, `position_z`=20.976822, `orientation`=4.454452, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79196;
UPDATE `creature` SET `position_x`=-208.009995, `position_y`=-546.207642, `position_z`=19.306469, `orientation`=1.661719, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79198;
UPDATE `creature` SET `position_x`=-231.83165, `position_y`=-558.140381, `position_z`=19.306471, `orientation`=2.369889, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79208;
UPDATE `creature` SET `position_x`=-194.58905, `position_y`=-586.258484, `position_z`=20.976818, `orientation`=5.513892, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79209;
UPDATE `creature` SET `position_x`=-212.866104, `position_y`=-592.363647, `position_z`=20.976814, `orientation`=4.06948, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79212;
UPDATE `creature` SET `position_x`=-234.78088, `position_y`=-574.0823, `position_z`=19.30647, `orientation`=1.08319, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79213;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79196, 1, -199.980743, -576.726501, 20.976822, 4.454452, 22000, 0, 0),
(79196, 2, -192.083725, -547.289246, 19.306469, 1.3087, 26000, 0, 0),
(79196, 3, -192.33551, -547.7468, 19.306469, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79198, 1, -208.009995, -546.207642, 19.306469, 1.661719, 16000, 0, 0),
(79198, 2, -207.65327, -546.0899, 19.306469, 100, 0, 0, 0),
(79198, 3, -205.631622, -572.29126, 20.976824, 4.789396, 15000, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79208, 1, -231.83165, -558.140381, 19.306471, 2.369889, 16000, 0, 0),
(79208, 2, -232.1938, -558.0962, 19.30647, 100, 0, 0, 0),
(79208, 3, -226.42947, -563.81116, 19.30647, 100, 0, 0, 0),
(79208, 4, -219.59435, -571.0974, 20.976822, 100, 0, 0, 0),
(79208, 5, -211.98775, -577.78577, 20.976822, 100, 12000, 0, 0),
(79208, 6, -212.07661, -577.3619, 20.976822, 100, 0, 0, 0),
(79208, 7, -231.83165, -558.14044, 19.30647, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79209, 1, -194.58905, -586.2585, 20.976818, 100, 15000, 0, 0),
(79209, 2, -199.69917, -581.31036, 20.976822, 100, 13000, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79212, 1, -212.866104, -592.363647, 20.976814, 4.06948, 15000, 0, 0),
(79212, 2, -213.17029, -592.5014, 20.976814, 100, 0, 0, 0),
(79212, 3, -207.480087, -585.72876, 20.976822, 0.872036, 10000, 0, 0),
(79212, 4, -208.8252, -587.3651, 21.476818, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79213, 1, -234.78088, -574.0823, 19.30647, 100, 0, 0, 0),
(79213, 2, -228.62756, -562.47925, 19.30647, 100, 0, 0, 0),
(79213, 3, -216.41878, -552.2443, 19.30647, 100, 0, 0, 0),
(79213, 4, -198.8244, -550.1321, 19.306469, 100, 0, 0, 0),
(79213, 5, -188.47276, -557.78815, 19.306469, 100, 0, 0, 0),
(79213, 6, -182.38043, -566.1832, 19.306469, 100, 0, 0, 0),
(79213, 7, -178.76411, -577.1136, 19.310112, 100, 0, 0, 0),
(79213, 8, -173.14336, -587.10406, 19.322857, 100, 8000, 0, 0),
(79213, 9, -178.76411, -577.1136, 19.310112, 100, 0, 0, 0),
(79213, 10, -182.38043, -566.1832, 19.306469, 100, 0, 0, 0),
(79213, 11, -188.47276, -557.78815, 19.306469, 100, 0, 0, 0),
(79213, 12, -198.8244, -550.1321, 19.306469, 100, 0, 0, 0),
(79213, 13, -216.41878, -552.2443, 19.30647, 100, 0, 0, 0),
(79213, 14, -228.62756, -562.47925, 19.30647, 100, 0, 0, 0),
(79213, 15, -234.78088, -574.0823, 19.30647, 100, 0, 0, 0),
(79213, 16, -236.19403, -583.4495, 19.30647, 100, 0, 0, 0),
(79213, 17, -230.18112, -593.6112, 19.527985, 100, 0, 0, 0),
(79213, 18, -222.1441, -599.7067, 22.367672, 100, 0, 0, 0),
(79213, 19, -213.65881, -606.8971, 26.245995, 100, 0, 0, 0),
(79213, 20, -199.07507, -605.2112, 31.794928, 100, 0, 0, 0),
(79213, 21, -191.25478, -601.9495, 35.35846, 100, 0, 0, 0),
(79213, 22, -199.07507, -605.2112, 31.794928, 100, 0, 0, 0),
(79213, 23, -213.65881, -606.8971, 26.245995, 100, 0, 0, 0),
(79213, 24, -222.1441, -599.7067, 22.367672, 100, 0, 0, 0),
(79213, 25, -230.18112, -593.6112, 19.527985, 100, 0, 0, 0),
(79213, 26, -236.19403, -583.4495, 19.30647, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Goblin Shipbuilder (3947)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `wander_distance`=3, `movement_type`=1 WHERE `guid` IN (79262, 79286, 79287, 79293, 79298, 79303, 79304, 79309, 79312, 79314, 79315, 79319, 79320, 79325, 79347);
UPDATE `creature` SET `wander_distance`=2, `movement_type`=1 WHERE `guid`=79353;

-- --------------------------------------------------------------------------------------------------
-- Trash: Defias Pirate (657), Defias Squallshaper (1732)
-- --------------------------------------------------------------------------------------------------

-- 41 spots with a random Pirate or Squallshaper. 79289, 79290 and 79292 run to the Iron Clad Door at the
-- alarm (instance script).
DELETE FROM `creature_addon` WHERE `guid`=79322;
DELETE FROM `creature_movement` WHERE `id` IN (79289, 79290, 79292, 79302, 79310, 79313, 79322, 79352);
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-102.52079, `position_y`=-697.94214, `position_z`=8.844545, `orientation`=1.56316, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79289;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-89.952415, `position_y`=-719.418, `position_z`=8.568348, `orientation`=1.587, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=2, `spawn_flags`=0 WHERE `guid`=79290;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-96.14399, `position_y`=-721.423767, `position_z`=8.460886, `orientation`=2.780664, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79292;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-80.442093, `position_y`=-728.93866, `position_z`=8.941698, `orientation`=2.974025, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79297;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-49.63485, `position_y`=-723.231079, `position_z`=8.862312, `orientation`=4.519009, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79299;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-41.065918, `position_y`=-730.667786, `position_z`=9.128899, `orientation`=4.625123, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79301;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-32.14719, `position_y`=-727.728943, `position_z`=8.616197, `orientation`=0.575959, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79300;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-22.718323, `position_y`=-736.560791, `position_z`=8.654451, `orientation`=3.060759, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79306;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-15.103353, `position_y`=-724.563293, `position_z`=8.090608, `orientation`=1.32645, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79316;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-9.550598, `position_y`=-740.607178, `position_z`=8.926136, `orientation`=5.81186, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79324;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-28.817762, `position_y`=-795.674011, `position_z`=19.39633, `orientation`=6.021386, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=0, `spawn_flags`=0 WHERE `guid`=79338;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-21.87397, `position_y`=-802.940552, `position_z`=19.763287, `orientation`=1.727876, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=0, `movement_type`=0, `spawn_flags`=0 WHERE `guid`=79330;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-42.031425, `position_y`=-787.620483, `position_z`=18.594944, `orientation`=1.672088, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79323;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-57.313858, `position_y`=-783.42804, `position_z`=18.19203, `orientation`=2.565634, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79313;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-79.994728, `position_y`=-782.890503, `position_z`=17.383385, `orientation`=3.804137, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79305;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-110.960991, `position_y`=-795.764648, `position_z`=17.120804, `orientation`=2.146755, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79322;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-130.556107, `position_y`=-790.177612, `position_z`=17.528416, `orientation`=2.80998, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79311;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-99.081223, `position_y`=-778.771301, `position_z`=22.304209, `orientation`=3.166557, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79310;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-83.054604, `position_y`=-775.971252, `position_z`=26.799826, `orientation`=4.173615, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79308;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-75.419868, `position_y`=-783.754211, `position_z`=26.454674, `orientation`=3.01942, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79307;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-105.196304, `position_y`=-793.858093, `position_z`=28.121059, `orientation`=0.915151, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79326;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-78.214043, `position_y`=-796.646973, `position_z`=38.390114, `orientation`=5.864606, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79327;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-65.258667, `position_y`=-793.513184, `position_z`=39.421597, `orientation`=0.781476, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79321;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-51.631615, `position_y`=-790.10614, `position_z`=38.558163, `orientation`=1.089548, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79328;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-41.731186, `position_y`=-798.820312, `position_z`=39.310715, `orientation`=4.925622, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79329;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-19.160477, `position_y`=-830.004822, `position_z`=19.743584, `orientation`=4.186212, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79341;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-20.797472, `position_y`=-835.390381, `position_z`=19.742785, `orientation`=3.630285, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79340;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-30.656071, `position_y`=-844.164246, `position_z`=19.161572, `orientation`=3.907836, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79343;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-85.225258, `position_y`=-856.464294, `position_z`=17.298817, `orientation`=3.50743, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79349;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-90.791283, `position_y`=-854.35144, `position_z`=17.190548, `orientation`=3.444939, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79348;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-102.880859, `position_y`=-848.688354, `position_z`=17.020536, `orientation`=3.519058, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79351;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-116.983963, `position_y`=-837.987671, `position_z`=16.925558, `orientation`=0.829051, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79352;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-121.246254, `position_y`=-835.79834, `position_z`=16.885035, `orientation`=2.957986, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79354;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-142.50148, `position_y`=-874.329102, `position_z`=1.752538, `orientation`=4.443251, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79355;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-154.924286, `position_y`=-892.051819, `position_z`=5.627538, `orientation`=0.559828, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79384;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-146.585541, `position_y`=-906.105591, `position_z`=8.043657, `orientation`=0.792333, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79385;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-153.45285, `position_y`=-909.507019, `position_z`=8.918657, `orientation`=1.466934, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79388;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-148.683426, `position_y`=-919.161865, `position_z`=12.668657, `orientation`=3.291884, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79390;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-90.68, `position_y`=-785.59, `position_z`=27.08, `orientation`=5.65511, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79317;
UPDATE `creature` SET `id`=657, `id2`=1732, `position_x`=-60.41, `position_y`=-731.54, `position_z`=8.94, `orientation`=2.51001, `spawntimesecsmin`=43200, `spawntimesecsmax`=43200, `wander_distance`=2, `movement_type`=1, `spawn_flags`=0 WHERE `guid`=79302;
UPDATE `creature` SET `mana_percent`=100 WHERE `guid` IN (79289, 79290, 79292, 79297, 79299, 79300, 79301, 79302, 79305, 79306, 79307, 79308, 79310, 79311, 79313, 79316, 79317, 79321, 79322, 79323, 79324, 79326, 79327, 79328, 79329, 79330, 79338, 79340, 79341, 79343, 79348, 79349, 79351, 79352, 79354, 79355, 79384, 79385, 79388, 79390); -- the Squallshaper is a caster

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(127, 657, 1732, 0, 0, 0, 36, -97.28662, -714.35114, 8.69282, 1.44085, 43200, 43200, 0, 100, 100, 2, 0, 0, 0, 10);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79289, 1, -102.52079, -697.94214, 8.844545, 100, 1000, 0, 0),
(79289, 2, -102.61659, -710.4934, 9.017014, 100, 0, 0, 0),
(79289, 3, -102.21658, -716.5364, 8.732536, 100, 0, 0, 0),
(79289, 4, -103.38927, -722.8615, 8.51218, 100, 0, 0, 0),
(79289, 5, -102.21658, -716.5364, 8.732536, 100, 0, 0, 0),
(79289, 6, -102.61659, -710.4934, 9.017014, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79290, 1, -89.952415, -719.418, 8.568348, 100, 1000, 0, 0),
(79290, 2, -89.86063, -712.8904, 8.767227, 100, 0, 0, 0),
(79290, 3, -89.50405, -703.4275, 8.996733, 100, 0, 0, 0),
(79290, 4, -89.754395, -687.9793, 8.013082, 100, 0, 0, 0),
(79290, 5, -89.50054, -703.3343, 8.99148, 100, 0, 0, 0),
(79290, 6, -89.86063, -712.8904, 8.767227, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(127, 1, -97.28662, -714.35114, 8.69282, 100, 0, 0, 0),
(127, 2, -96.21387, -706.1424, 8.864227, 100, 0, 0, 0),
(127, 3, -97.28662, -714.35114, 8.69282, 100, 0, 0, 0),
(127, 4, -93.32655, -721.48755, 8.5219, 100, 0, 0, 0),
(127, 5, -80.44662, -727.67316, 8.92354, 100, 0, 0, 0),
(127, 6, -69.5746, -731.31445, 8.109911, 100, 0, 0, 0),
(127, 7, -56.12272, -730.7711, 9.157366, 100, 0, 0, 0),
(127, 8, -47.203835, -725.9252, 8.954771, 100, 0, 0, 0),
(127, 9, -35.193413, -726.2176, 8.682568, 100, 0, 0, 0),
(127, 10, -22.702759, -730.3445, 8.226051, 100, 0, 0, 0),
(127, 11, -12.233337, -740.43036, 9.033932, 100, 0, 0, 0),
(127, 12, -2.223099, -751.9745, 8.774811, 100, 0, 0, 0),
(127, 13, 4.573459, -763.5695, 9.838999, 100, 1000, 0, 0),
(127, 14, -2.223099, -751.9745, 8.774811, 100, 0, 0, 0),
(127, 15, -12.233337, -740.43036, 9.033932, 100, 0, 0, 0),
(127, 16, -22.702759, -730.3445, 8.226051, 100, 0, 0, 0),
(127, 17, -35.193413, -726.2176, 8.682568, 100, 0, 0, 0),
(127, 18, -47.203835, -725.9252, 8.954771, 100, 0, 0, 0),
(127, 19, -56.12272, -730.7711, 9.157366, 100, 0, 0, 0),
(127, 20, -69.5746, -731.31445, 8.109911, 100, 0, 0, 0),
(127, 21, -80.44662, -727.67316, 8.92354, 100, 0, 0, 0),
(127, 22, -93.32655, -721.48755, 8.5219, 100, 0, 0, 0);

DELETE FROM `creature_ai_events` WHERE `creature_id`=657;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 65701 AND 65799;

INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(65701, 0, 0, 15, 5172, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Pirate - Cast Spell Bloodsail Companion'),
(65702, 0, 0, 15, 7389, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Pirate - Cast Spell Attack');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(65701, 657, 0, 1, 0, 70, 0, 0, 0, 0, 0, 65701, 0, 0, 'Defias Pirate - Summon Bloodsail Companion on Spawn'),
(65702, 657, 0, 4, 0, 100, 0, 0, 0, 0, 0, 65702, 0, 0, 'Defias Pirate - Cast Attack on Aggro');

UPDATE `creature_spells` SET `delayInitialMax_1`=7 WHERE `entry`=17320;

-- --------------------------------------------------------------------------------------------------
-- Trash: Defias Blackguard (636)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_ai_events` WHERE `creature_id`=636;
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 63601 AND 63699;

-- Faded drops at the first damage taken
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(63602, 0, 0, 15, 6408, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Blackguard - Cast Spell Faded'),
(63602, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1327, 0, 0, 0, 0, 0, 0, 0, 0, 'Defias Blackguard - Say Text');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(63602, 636, 0, 27, 0, 100, 0, 1785, 1, 0, 0, 63602, 0, 0, 'Defias Blackguard - Cast Faded and Emote when out of Stealth');

-- --------------------------------------------------------------------------------------------------
-- Trash: Rat (4075)
-- --------------------------------------------------------------------------------------------------

-- 8 rats running a path. 79186 is Rhahk'Zor's death rat, it runs off and then wanders.
DELETE FROM `creature` WHERE `guid` IN (79276, 79381, 79387);
UPDATE `creature` SET `position_x`=-13.942166, `position_y`=-377.629669, `position_z`=60.793911, `orientation`=2.338741, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79141;
UPDATE `creature` SET `position_x`=-94.663414, `position_y`=-403.933105, `position_z`=57.586201, `orientation`=0.505054, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79132;
UPDATE `creature` SET `position_x`=-137.211044, `position_y`=-415.713654, `position_z`=58.887707, `orientation`=5.550147, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79153;
UPDATE `creature` SET `position_x`=-176.586594, `position_y`=-428.736176, `position_z`=54.909203, `orientation`=2.391101, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79166;
UPDATE `creature` SET `position_x`=-195.525497, `position_y`=-476.928711, `position_z`=54.132118, `orientation`=2.96706, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79186;
UPDATE `creature` SET `position_x`=-247.06735, `position_y`=-586.6072, `position_z`=51.142708, `orientation`=6.0705, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79228;
UPDATE `creature` SET `position_x`=-111.36128, `position_y`=-617.7238, `position_z`=13.396099, `orientation`=1.50113, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79254;
UPDATE `creature` SET `position_x`=-19.740885, `position_y`=-817.841064, `position_z`=19.746334, `orientation`=0.767945, `spawntimesecsmin`=420, `spawntimesecsmax`=480, `wander_distance`=0, `movement_type`=2 WHERE `guid`=79331;

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79141, 1, -13.342728, -376.70654, 60.732327, 100, 0, 0, 11),
(79141, 2, -26.269424, -373.45914, 60.55405, 100, 0, 0, 0),
(79141, 3, -36.633575, -372.04553, 57.74746, 100, 0, 0, 0),
(79141, 4, -48.576828, -374.59464, 55.421486, 100, 0, 0, 0),
(79141, 5, -57.26123, -370.5302, 54.975822, 100, 0, 0, 0),
(79141, 6, -62.88244, -359.6911, 54.10677, 100, 0, 0, 0),
(79141, 7, -64.42009, -367.0666, 55.109085, 100, 0, 0, 0),
(79141, 8, -68.61178, -352.7555, 55.824417, 100, 0, 0, 0),
(79141, 9, -64.42009, -367.0666, 55.109085, 100, 0, 0, 0),
(79141, 10, -66.50143, -371.0593, 55.319252, 100, 0, 0, 0),
(79141, 11, -67.34007, -373.65253, 55.106583, 100, 0, 0, 0),
(79141, 12, -69.15381, -376.51608, 54.990646, 100, 0, 0, 0),
(79141, 13, -68.01747, -382.0384, 53.802254, 100, 0, 0, 0),
(79141, 14, -59.618874, -387.82526, 53.643402, 100, 0, 0, 0),
(79141, 15, -61.508896, -394.5246, 53.625908, 100, 0, 0, 0),
(79141, 16, -54.9338, -401.93414, 55.079895, 100, 0, 0, 0),
(79141, 17, -61.508896, -394.5246, 53.625908, 100, 0, 0, 0),
(79141, 18, -72.98356, -409.0148, 54.84156, 100, 0, 0, 0),
(79141, 19, -67.17714, -404.2614, 54.463245, 100, 0, 0, 0),
(79141, 20, -61.980095, -402.55685, 54.348637, 100, 0, 0, 0),
(79141, 21, -60.01741, -405.3698, 54.977913, 100, 0, 0, 0),
(79141, 22, -51.21392, -400.3385, 55.666183, 100, 0, 0, 0),
(79141, 23, -50.3106, -396.58588, 55.761524, 100, 0, 0, 0),
(79141, 24, -44.325363, -381.47226, 55.484566, 100, 0, 0, 0),
(79141, 25, -34.608727, -376.37997, 58.78998, 100, 0, 0, 0),
(79141, 26, -23.800934, -377.42386, 60.978092, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79132, 1, -90.645294, -401.71155, 58.5306, 100, 0, 0, 11),
(79132, 2, -93.94673, -396.15424, 58.96117, 100, 0, 0, 0),
(79132, 3, -100.54356, -390.8484, 58.008446, 100, 0, 0, 0),
(79132, 4, -102.445755, -386.2497, 57.806316, 100, 0, 0, 0),
(79132, 5, -102.62831, -381.193, 57.65515, 100, 0, 0, 0),
(79132, 6, -103.85683, -375.9284, 58.372665, 100, 0, 0, 0),
(79132, 7, -110.787605, -375.8803, 58.4542, 100, 0, 0, 0),
(79132, 8, -114.810165, -375.67462, 58.525078, 100, 0, 0, 0),
(79132, 9, -115.02583, -386.36444, 57.072067, 100, 0, 0, 0),
(79132, 10, -110.420746, -386.20508, 57.00196, 100, 0, 0, 0),
(79132, 11, -109.28392, -389.58685, 56.89531, 100, 0, 0, 0),
(79132, 12, -108.31071, -398.96924, 59.666073, 100, 0, 0, 0),
(79132, 13, -113.03906, -404.96347, 59.856194, 100, 0, 0, 0),
(79132, 14, -117.24605, -409.93073, 59.001892, 100, 0, 0, 0),
(79132, 15, -123.45601, -405.76562, 58.72492, 100, 0, 0, 0),
(79132, 16, -128.69847, -397.30957, 59.002052, 100, 0, 0, 0),
(79132, 17, -126.50105, -391.48447, 58.822357, 100, 0, 0, 0),
(79132, 18, -125.55838, -383.7503, 59.18976, 100, 0, 0, 0),
(79132, 19, -122.47591, -380.95868, 59.43924, 100, 0, 0, 0),
(79132, 20, -114.871155, -389.8229, 56.600624, 100, 0, 0, 0),
(79132, 21, -105.26889, -396.7763, 58.055862, 100, 0, 0, 0),
(79132, 22, -94.07319, -403.81885, 57.57258, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79153, 1, -136.44286, -415.72748, 58.682045, 100, 0, 0, 11),
(79153, 2, -131.90804, -414.03656, 57.963463, 100, 0, 0, 0),
(79153, 3, -119.45026, -414.6206, 58.212658, 100, 0, 0, 0),
(79153, 4, -117.80323, -423.83414, 55.603798, 100, 0, 0, 0),
(79153, 5, -120.585785, -425.70575, 55.612785, 100, 0, 0, 0),
(79153, 6, -120.60863, -433.48212, 54.47722, 100, 0, 0, 0),
(79153, 7, -124.4515, -441.00836, 55.094406, 100, 0, 0, 0),
(79153, 8, -110.13608, -437.58096, 55.21454, 100, 0, 0, 0),
(79153, 9, -108.72032, -434.24692, 55.103058, 100, 0, 0, 0),
(79153, 10, -105.424385, -433.6854, 55.025307, 100, 0, 0, 0),
(79153, 11, -115.74409, -420.94128, 56.56216, 100, 0, 0, 0),
(79153, 12, -126.89529, -398.04596, 58.753662, 100, 0, 0, 0),
(79153, 13, -139.08092, -402.43582, 58.620316, 100, 0, 0, 0),
(79153, 14, -143.3673, -402.88263, 57.736656, 100, 0, 0, 0),
(79153, 15, -142.87141, -408.06122, 58.45069, 100, 0, 0, 0),
(79153, 16, -136.6092, -412.8161, 58.43025, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79166, 1, -205.92087, -428.3792, 54.52316, 100, 12000, 0, 11),
(79166, 2, -202.93974, -428.6003, 54.60062, 100, 0, 0, 0),
(79166, 3, -200.39009, -434.32867, 53.70125, 100, 0, 0, 0),
(79166, 4, -200.4194, -436.4223, 53.361088, 100, 0, 0, 0),
(79166, 5, -196.98526, -440.89362, 53.406853, 100, 0, 0, 0),
(79166, 6, -190.6257, -439.703, 53.434982, 100, 0, 0, 0),
(79166, 7, -186.3699, -437.04877, 53.657623, 100, 0, 0, 0),
(79166, 8, -181.0037, -443.2863, 54.74726, 100, 0, 0, 0),
(79166, 9, -180.34055, -438.02142, 54.72874, 100, 0, 0, 0),
(79166, 10, -176.5292, -428.8615, 54.8445, 100, 6000, 0, 0),
(79166, 11, -178.67769, -429.372, 54.80384, 100, 0, 0, 0),
(79166, 12, -180.24533, -427.4156, 54.84556, 100, 0, 0, 0),
(79166, 13, -180.11002, -424.27484, 55.039017, 100, 1000, 0, 0),
(79166, 14, -186.04617, -426.05566, 53.991676, 100, 0, 0, 0),
(79166, 15, -191.34048, -430.06088, 53.802635, 100, 0, 0, 0),
(79166, 16, -196.33908, -432.64764, 53.75982, 100, 0, 0, 0),
(79166, 17, -197.59294, -429.45087, 54.133026, 100, 0, 0, 0),
(79166, 18, -200.17792, -430.28, 54.30015, 100, 0, 0, 0),
(79166, 19, -201.94344, -429.11115, 54.49671, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79186, 1, -189.10857, -479.75977, 54.015175, 100, 0, 0, 11),
(79186, 2, -187.56407, -488.1715, 54.045113, 100, 0, 0, 0),
(79186, 3, -186.61412, -478.287, 54.037453, 100, 0, 0, 0),
(79186, 4, -187.68817, -468.94525, 54.087425, 100, 0, 0, 0),
(79186, 5, -188.26286, -486.00525, 54.043495, 100, 0, 0, 0),
(79186, 6, -183.61346, -497.136, 53.60662, 100, 0, 0, 0),
(79186, 7, -177.95361, -502.32318, 53.906532, 100, 0, 0, 0),
(79186, 8, -191.16168, -502.81213, 52.862732, 100, 0, 0, 0),
(79186, 9, -177.95361, -502.32318, 53.906532, 100, 0, 0, 0),
(79186, 10, -165.99666, -503.37183, 54.9892, 100, 0, 0, 0),
(79186, 11, -168.12268, -503.96173, 54.477898, 100, 0, 0, 0),
(79186, 12, -177.72733, -502.61798, 53.909557, 100, 0, 0, 0),
(79186, 13, -169.78206, -507.9791, 53.58645, 100, 0, 0, 0),
(79186, 14, -160.4488, -507.877, 53.266502, 100, 0, 0, 0),
(79186, 15, -153.76253, -516.4237, 52.54428, 100, 0, 0, 0),
(79186, 16, -152.06392, -528.5805, 50.213837, 100, 1, 5, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79228, 1, -247.06735, -586.6072, 51.142708, 100, 0, 0, 11),
(79228, 2, -248.58807, -584.49164, 51.140194, 100, 0, 0, 0),
(79228, 3, -251.87608, -583.88275, 51.141483, 100, 0, 0, 0),
(79228, 4, -255.12941, -585.2355, 51.14608, 100, 0, 0, 0),
(79228, 5, -254.31143, -587.27515, 51.14896, 100, 0, 0, 0),
(79228, 6, -274.53098, -578.4672, 50.219402, 100, 0, 0, 0),
(79228, 7, -277.50235, -581.4939, 50.311165, 100, 0, 0, 0),
(79228, 8, -276.72208, -588.1806, 50.206406, 100, 0, 0, 0),
(79228, 9, -286.48737, -599.3257, 48.773582, 100, 0, 0, 0),
(79228, 10, -306.93423, -601.514, 47.958206, 100, 0, 0, 0),
(79228, 11, -308.79346, -599.8139, 48.20256, 100, 0, 0, 0),
(79228, 12, -294.03473, -578.0737, 48.532143, 100, 0, 0, 0),
(79228, 13, -290.56244, -574.7206, 48.887825, 100, 0, 0, 0),
(79228, 14, -289.32336, -574.98816, 49.05831, 100, 0, 0, 0),
(79228, 15, -289.62936, -561.2878, 48.883644, 100, 0, 0, 0),
(79228, 16, -297.98553, -548.254, 49.442894, 100, 0, 0, 0),
(79228, 17, -296.7915, -546.8063, 49.439693, 100, 0, 0, 0),
(79228, 18, -296.25894, -544.5258, 49.43714, 100, 0, 0, 0),
(79228, 19, -297.51074, -542.6644, 49.43817, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79254, 1, -111.36128, -617.7238, 13.396099, 100, 0, 0, 11),
(79254, 2, -117.82021, -622.4169, 14.221246, 100, 0, 0, 0),
(79254, 3, -118.57547, -623.8969, 15.227645, 100, 0, 0, 0),
(79254, 4, -123.61241, -626.36664, 13.384993, 100, 0, 0, 0),
(79254, 5, -123.37169, -630.0501, 13.389254, 100, 0, 0, 0),
(79254, 6, -119.49263, -633.37616, 13.13361, 100, 0, 0, 0),
(79254, 7, -107.69629, -649.3585, 7.020886, 100, 0, 0, 0),
(79254, 8, -103.63678, -659.35675, 7.422068, 100, 0, 0, 0),
(79254, 9, -108.40604, -667.52167, 7.414669, 100, 0, 0, 0),
(79254, 10, -108.15543, -667.3005, 7.414267, 100, 0, 0, 0),
(79254, 11, -95.70151, -663.3414, 7.4133, 100, 0, 0, 0),
(79254, 12, -114.8092, -644.916, 10.021677, 100, 0, 0, 0),
(79254, 13, -133.62381, -636.243, 14.291261, 100, 0, 0, 0),
(79254, 14, -137.67427, -628.0509, 14.88417, 100, 0, 0, 0),
(79254, 15, -135.10532, -591.2344, 19.058775, 100, 0, 0, 0),
(79254, 16, -137.54904, -586.0582, 18.166218, 100, 0, 0, 0),
(79254, 17, -141.3818, -582.31287, 18.673775, 100, 0, 0, 0),
(79254, 18, -145.31589, -584.5022, 18.800209, 100, 0, 0, 0),
(79254, 19, -147.05762, -586.9083, 18.850399, 100, 0, 0, 0),
(79254, 20, -146.3705, -588.8868, 19.372875, 100, 0, 0, 0),
(79254, 21, -146.60402, -587.2395, 18.887112, 100, 0, 0, 0),
(79254, 22, -144.87457, -584.57404, 18.79853, 100, 0, 0, 0),
(79254, 23, -140.89883, -582.19836, 18.609165, 100, 0, 0, 0),
(79254, 24, -140.04704, -584.7782, 18.291325, 100, 0, 0, 0),
(79254, 25, -128.17578, -599.0777, 16.647186, 100, 0, 0, 0),
(79254, 26, -127.12801, -610.2, 14.468011, 100, 0, 0, 0),
(79254, 27, -117.73259, -618.592, 14.122251, 100, 0, 0, 0),
(79254, 28, -108.55789, -619.6602, 13.832647, 100, 0, 0, 0);

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(79331, 1, -19.692703, -817.70715, 19.666203, 100, 9000, 0, 11),
(79331, 2, -17.427414, -818.63855, 19.805122, 100, 0, 0, 0),
(79331, 3, -16.222122, -817.1295, 19.883083, 100, 0, 0, 0),
(79331, 4, -17.08583, -806.5906, 19.850666, 100, 0, 0, 0),
(79331, 5, -27.24202, -794.3803, 19.276024, 100, 0, 0, 0),
(79331, 6, -35.70215, -787.3601, 18.893969, 100, 0, 0, 0),
(79331, 7, -46.870552, -782.293, 18.41, 100, 0, 0, 0),
(79331, 8, -56.69474, -779.28, 18.041986, 100, 0, 0, 0),
(79331, 9, -66.52039, -778.3401, 17.719732, 100, 0, 0, 0),
(79331, 10, -77.28384, -778.68146, 17.422222, 100, 0, 0, 0),
(79331, 11, -80.855034, -779.4319, 17.33651, 100, 0, 0, 0),
(79331, 12, -83.41162, -778.9413, 17.647728, 100, 0, 0, 0),
(79331, 13, -85.21771, -779.51245, 17.607494, 100, 0, 0, 0),
(79331, 14, -91.67295, -782.14105, 17.114193, 100, 0, 0, 0),
(79331, 15, -101.109604, -785.7731, 16.968147, 100, 0, 0, 0),
(79331, 16, -100.7264, -787.20087, 16.991772, 100, 0, 0, 0),
(79331, 17, -102.60629, -787.96106, 16.966885, 100, 0, 0, 0),
(79331, 18, -104.8641, -787.11847, 16.916416, 100, 0, 0, 0),
(79331, 19, -116.803986, -794.6023, 16.814854, 100, 0, 0, 0),
(79331, 20, -120.39795, -805.05914, 16.948978, 100, 8000, 0, 0),
(79331, 21, -122.42372, -798.30414, 16.751118, 100, 0, 0, 0),
(79331, 22, -134.39854, -792.648, 17.469975, 100, 5000, 0, 0),
(79331, 23, -128.00496, -802.2658, 17.103455, 100, 0, 0, 0),
(79331, 24, -134.22586, -792.8417, 17.456932, 100, 0, 0, 0),
(79331, 25, -117.02734, -794.8406, 16.808586, 100, 0, 0, 0),
(79331, 26, -104.98031, -787.26526, 16.916048, 100, 0, 0, 0),
(79331, 27, -103.2991, -786.5359, 16.937725, 100, 0, 0, 0),
(79331, 28, -102.48139, -787.7147, 16.966242, 100, 0, 0, 0),
(79331, 29, -89.52202, -790.72327, 18.61929, 100, 0, 0, 0),
(79331, 30, -102.48139, -787.7147, 16.966242, 100, 0, 0, 0),
(79331, 31, -100.28912, -786.71564, 16.993946, 100, 0, 0, 0),
(79331, 32, -91.89513, -782.02185, 17.108345, 100, 0, 0, 0),
(79331, 33, -85.02452, -780.5136, 17.251099, 100, 0, 0, 0),
(79331, 34, -84.4776, -781.7484, 17.272388, 100, 0, 0, 0),
(79331, 35, -82.288734, -781.12683, 17.316835, 100, 0, 0, 0),
(79331, 36, -82.31928, -779.7382, 17.305977, 100, 0, 0, 0),
(79331, 37, -77.33616, -778.6057, 17.420952, 100, 0, 0, 0),
(79331, 38, -66.61338, -778.2277, 17.703321, 100, 0, 0, 0),
(79331, 39, -56.69744, -779.2976, 18.029669, 100, 0, 0, 0),
(79331, 40, -46.762413, -781.82733, 18.404427, 100, 0, 0, 0),
(79331, 41, -35.693497, -787.2768, 18.89481, 100, 0, 0, 0),
(79331, 42, -27.303223, -794.7998, 19.271385, 100, 0, 0, 0),
(79331, 43, -17.845062, -807.02405, 19.8026, 100, 0, 0, 0),
(79331, 44, -16.281631, -816.9322, 19.879784, 100, 0, 0, 0),
(79331, 45, -17.211319, -819.07166, 19.81768, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Gameobjects
-- --------------------------------------------------------------------------------------------------

-- Factory Door, Foundry Door, Mast Room Door: locked until the instance script opens them
UPDATE `gameobject_template` SET `flags`=34 WHERE `entry` IN (13965, 16399, 16400);

-- Door Lever: back after 5 s
UPDATE `gameobject_template` SET `data2`=327680 WHERE `entry` IN (101831, 101832, 101833, 101834);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1161, 19019, 36, -43.048122, -691.144348, 4.213008, 2.949595, 0, 0, 0.995396, 0.095851, 300, 300, 100, 1, 0, 0, 0, 10), -- Box of Assorted Parts
(1164, 75293, 36, -155.300461, -913.896179, 10.280881, 0.90757, 0, 0, 0.438371, 0.898794, 604800, 604800, 100, 1, 0, 0, 0, 10); -- Large Battered Chest

-- Large Battered Chest: 2 of the 3 areas, one chest each
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(1, 1, 'Deadmines - Large Battered Chest (Mast Room)', 0, 0, 0, 10),
(57, 1, 'Deadmines - Large Battered Chest (Goblin Foundry)', 0, 0, 0, 10),
(105, 1, 'Deadmines - Large Battered Chest (Ironclad Cove)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(1, 253, 0, 'Deadmines - Large Battered Chest (Mast Room)', 0),
(57, 253, 0, 'Deadmines - Large Battered Chest (Goblin Foundry)', 0),
(105, 253, 0, 'Deadmines - Large Battered Chest (Ironclad Cove)', 0);
UPDATE `pool_gameobject` SET `pool_entry`=1 WHERE `guid` IN (26198, 25445);
UPDATE `pool_gameobject` SET `pool_entry`=57 WHERE `guid`=30538;
UPDATE `pool_gameobject` SET `pool_entry`=105 WHERE `guid` IN (899, 26210, 30540);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1164, 105, 0, 'Deadmines - Large Battered Chest (Ironclad Cove)', 0, 0, 10);

-- Box of Assorted Parts: 6 of 9 points
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(107, 6, 'Deadmines - Box of Assorted Parts', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(128, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(26190, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(26196, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(26209, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(30537, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(30539, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(34848, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(34852, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10),
(1161, 107, 0, 'Deadmines - Box of Assorted Parts', 0, 0, 10);

-- Food Crate / Barrel of Milk: 3 of the 5 points
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(413, 3, 'Deadmines - Food Crate / Barrel of Milk (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(2991, 413, 0, 'Food Crate / Barrel of Milk - Deadmines', 0),
(2992, 413, 0, 'Food Crate / Barrel of Milk - Deadmines', 0),
(2993, 413, 0, 'Food Crate / Barrel of Milk - Deadmines', 0),
(2994, 413, 0, 'Food Crate / Barrel of Milk - Deadmines', 0),
(2995, 413, 0, 'Food Crate / Barrel of Milk - Deadmines', 0);

UPDATE `pool_template` SET `max_limit`=3 WHERE `entry`=4485; -- Tin Vein / Silver Vein
UPDATE `pool_template` SET `max_limit`=2 WHERE `entry`=4486; -- Copper Vein

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
