DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240620215210');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240620215210');
-- Add your query below.


-- Expeditionary Priest createobject2
UPDATE `creature` SET `position_x`=-8178.819, `position_y`=-589.6886, `position_z`=200.31729, `orientation`=3.118427038192749023, `movement_type`=1, `spawntimesecsmin`=240, `spawntimesecsmax`=300, `wander_distance`=5 WHERE `guid`=54003;
UPDATE `creature` SET `position_x`=-8175.9707, `position_y`=-593.94934, `position_z`=200.10762, `orientation`=5.785596370697021484, `movement_type`=1, `wander_distance`=5 WHERE `guid`=301771;

-- Expeditionary Mountaineer createobject2
UPDATE `creature` SET `position_x`=-8180.118, `position_y`=-591.6746, `position_z`=200.30156, `orientation`=2.092212915420532226, `movement_type`=0, `spawntimesecsmin`=240, `spawntimesecsmax`=300, `wander_distance`=0 WHERE `guid`=54001;
UPDATE `creature` SET `position_x`=-8176.637, `position_y`=-584.5677, `position_z`=200.55144, `orientation`=2.897246599197387695, `movement_type`=0, `spawntimesecsmin`=240, `spawntimesecsmax`=300, `wander_distance`=0 WHERE `guid`=301770;
UPDATE `creature` SET `position_x`=-8177.798, `position_y`=-585.94714, `position_z`=200.39417, `orientation`=1.378810048103332519, `movement_type`=0, `spawntimesecsmin`=240, `spawntimesecsmax`=300 WHERE `guid`=54000;
UPDATE `creature` SET `position_x`=-8173.9185, `position_y`=-589.4102, `position_z`=200.20743, `orientation`=3.799572467803955078, `movement_type`=1, `spawntimesecsmin`=240, `spawntimesecsmax`=300 WHERE `guid`=301773;
UPDATE `creature` SET `position_x`=-8175.9634, `position_y`=-589.83655, `position_z`=200.24149, `orientation`=1.884955525398254394, `id`=14390, `movement_type`=1, `spawntimesecsmin`=240, `spawntimesecsmax`=300, `wander_distance`=5 WHERE `guid`=301772;
UPDATE `creature` SET `position_x`=-8180.905, `position_y`=-586.19696, `position_z`=200.45303, `orientation`=5.707226753234863281, `id`=14390, `movement_type`=0, `spawntimesecsmin`=240, `spawntimesecsmax`=300, `wander_distance`=0  WHERE `guid`=301774;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(285080, 14390, 0, 0, 0, 0, 0, -8181.9785, -585.30597, 200.49089, 0.750491559505462646, 240, 300, 0, 100, 0, 0, 0, 0, 0, 10);

-- Delete custom groups, none of those NPCs are grouped.
DELETE FROM `creature_groups` WHERE `member_guid`=301770;
DELETE FROM `creature_groups` WHERE `member_guid`=301774;
DELETE FROM `creature_groups` WHERE `member_guid`=301772;
DELETE FROM `creature_groups` WHERE `member_guid`=54003;

-- Expeditionary Mountaineer emote
DELETE FROM `creature_ai_scripts` WHERE `id`=301774;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(301774, 0, 0, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1678803, 'Expeditionary Mountaineer - Emote Eat'),
(301774, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678804, 'Expeditionary Mountaineer - Emote Talk');

DELETE FROM `creature_ai_scripts` WHERE `id`=301775;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(301775, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678805, 'Expeditionary Mountaineer - Idle'),
(301775, 0, 1, 28, 1, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1678805, 'Expeditionary Mountaineer - Sit State'),
(301775, 0, 1, 1, 7, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 1678805, 'Expeditionary Mountaineer - Eat Emote');

DELETE FROM `creature_ai_scripts` WHERE `id`=301776;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(301776, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678805, 'Expeditionary Mountaineer - Stand State'),
(301776, 0, 1, 20, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 1678805, 'Expeditionary Mountaineer - Active Random Movement');

-- Events list for Expeditionary Mountaineer
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(301774, 14390, 0, 1, 0, 100, 1, 1000, 7000, 6000, 11000, 301774, 0, 0, 'Expeditionary Mountaineer - Emote OOC'),
(301775, 14390, 0, 1, 0, 100, 1, 20000, 40000, 20000, 40000, 301775, 0, 0, 'Expeditionary Mountaineer - Sit Eat Emote OOC'),
(301776, 14390, 0, 1, 0, 100, 1, 10000, 20000, 10000, 20000, 301776, 0, 0, 'Expeditionary Mountaineer - Active Random Movement');

-- 1678803: Source's Guid Is 301774
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1678803, 52, 301774, 0, 0, 0, 0);
-- 1678804: Source's Guid Is 54000 Or 301770
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1678804, 52, 54000, 0, 301770, 0, 0);
-- 1678805: Source's Guid Is 54001
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (1678805, 52, 54001, 0, 0, 0, 0);

-- Stand_State for Expeditionary Mountaineer
INSERT INTO `creature_addon` (`guid`, `patch`, `display_id`, `mount_display_id`, `equipment_id`, `stand_state`, `sheath_state`, `emote_state`, `auras`) VALUES 
(285080, 0, 0, 0, -1, 3, 1, 0, NULL);

-- Rogue Black Drake createobject2
UPDATE `creature` SET `position_x`=-8136.846, `position_y`=-578.9975, `position_z`=200.53505, `orientation`=2.117406606674194335, `spawntimesecsmin`=300, `spawntimesecsmax`=450, `wander_distance`=0,`movement_type`=2 WHERE `guid`=53999;

-- Pathing for Rogue Black Drake Entry: 14388
SET @NPC := 53999;
DELETE FROM `creature_movement` WHERE `id`=@NPC;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`waittime`,`wander_distance`,`script_id`) VALUES
(@NPC,1,-8151.6396,-534.9944,200.672,100,0,0,0),
(@NPC,2,-8177.0103,-497.2137,200.20819,100,0,0,0),
(@NPC,3,-8177.0103,-497.2137,200.20819,100,0,0,0),
(@NPC,4,-8205.462,-483.48578,193.67229,100,0,0,0),
(@NPC,5,-8205.462,-483.48578,193.67229,100,0,0,0),
(@NPC,6,-8221.06,-493.07852,195.86667,100,0,0,0),
(@NPC,7,-8221.06,-493.07852,195.86667,100,0,0,0),
(@NPC,8,-8204.073,-519.3674,200.09042,100,0,0,0),
(@NPC,9,-8204.073,-519.3674,200.09042,100,0,0,0),
(@NPC,10,-8178.019,-552.7796,199.89197,100,0,0,0),
(@NPC,11,-8184.3145,-578.3928,200.52078,100,0,0,0),
(@NPC,12,-8178.019,-552.7796,199.89197,100,0,0,0);
-- 0x204CB000000E0D0000009400004CEFFE .go xyz -8151.6396 -534.9944 200.672

-- Delete duplicate custom Rogue Black Drake
DELETE FROM `creature` WHERE `guid`=53998;
DELETE FROM `creature` WHERE `guid`=53997;
DELETE FROM `creature` WHERE `guid`=53996;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
