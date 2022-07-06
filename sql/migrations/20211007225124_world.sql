DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211007225124');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211007225124');
-- Add your query below.


-- Add serverside spell focus for quest Honoring a Hero (Alliance).
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES (99865, 180204, 0, 968.684, -1826.15, 77.0133, -2.94088, 0, 0, -0.994969, 0.100188, 60, 60, 1, 100, 5, 10);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (180204, 5, 8, 299, 'Uther\'s Tomb Statue', 1, 1323, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Add serverside spell focus for quest Honoring a Hero (Horde).
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES (99997, 180205, 1, 1632.57, -3075, 85.959, 0, 0, 0, 0, 1, 60, 60, 1, 100, 5, 10);
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (180205, 5, 8, 299, 'Grom\'s Monument', 1, 1324, 10, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Remove wrongly added scourge invasion objects from Harvest Festival.
DELETE FROM `gameobject` WHERE `guid` IN (8912, 8964, 8951, 8950);
DELETE FROM `game_event_gameobject` WHERE `guid` IN (8912, 8964, 8951, 8950);

-- Assign patch to everything involed in the Harvest Festival.
UPDATE `game_event` SET `patch_min`=5 WHERE `entry`=11;
UPDATE `gameobject` SET `patch_min`=5 WHERE `patch_min` < 5 && `guid` IN (SELECT `guid` FROM `game_event_gameobject` WHERE `event`=11);
UPDATE `creature` SET `patch_min`=5 WHERE `patch_min` < 5 && `guid` IN (SELECT `guid` FROM `game_event_creature` WHERE `event`=11);
UPDATE `gameobject_template` SET `patch`=5 WHERE `entry` IN (180206, 180207, 180208, 180209, 180210, 180211, 180213, 180214, 180324, 180325, 180326, 180328, 180329, 180330, 180331, 180332, 180333, 180334, 180337, 180338, 180339, 180340, 180341, 180342, 180345, 180347, 180348, 180349, 180350, 180351, 180352, 180353, 180370, 180371, 180372, 180373, 180374);

-- Assign patch to Xandivious' Demon Bag gameobject template.
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry`=180671;

-- Assign patch to Tonk Control Console gameobject spawns used in Darkmoon Faire.
UPDATE `gameobject` SET `patch_min`=8 WHERE `patch_min` < 8 && `id`=180524;

-- Assign patch to Burning Coals gameobject spawns used in Darkmoon Faire.
UPDATE `gameobject` SET `patch_min`=8 WHERE `patch_min` < 8 && `id`=181029;

-- Assign patch to Blastenheimer 5000 Ultra Cannon gameobject used in Darkmoon Faire.
UPDATE `gameobject` SET `patch_min`=7 WHERE `id` IN (180452, 180515);
UPDATE `gameobject_template` SET `patch`=6 WHERE `entry` IN (180452, 180515);

-- Assign patch to Firecrackers used in Lunar Festival.
UPDATE `gameobject` SET `patch_min`=7 WHERE `id` IN (180763, 180764);
UPDATE `pool_gameobject` SET `patch_min`=7 WHERE `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` IN (180763, 180764));

-- Assign patch to Soapbox gameobject spawn used in STV Fishing Tournament.
UPDATE `gameobject` SET `patch_min`=5 WHERE `id`=180403;

-- Fix Blastenheimer 5000 Ultra Cannon.
DELETE FROM `spell_mod` WHERE `id`=24742;
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (24742, 4, 'Magic Wings - Ignore LoS');
UPDATE `gameobject_template` SET `data10`=24832 WHERE `entry`=180515;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`, `build_min`) VALUES (24731, 0, 180452, 1, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`, `build_min`) VALUES (24731, 0, 180515, 1, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `inverseEffectMask`, `build_min`) VALUES (24731, 1, 15218, 2, 4878);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`) VALUES (24730, 1, -1327.66, 85.9815, 134.169, 3.559, 4878);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`) VALUES (24831, 0, -9569.18, -16.108, 68.2725, 4.9, 4878);
DELETE FROM `gameobject_scripts` WHERE `id`=8658;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8658, 0, 15, 24831, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastenheimer 5000 Ultra Cannon (Elwynn) - Cast Spell Cannon Prep (Teleport)');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (8658, 0, 15, 24754, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastenheimer 5000 Ultra Cannon (Elwynn) - Cast Spell Cannon Prep (Stun)');
DELETE FROM `gameobject_scripts` WHERE `id`=7705;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7705, 0, 15, 24730, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastenheimer 5000 Ultra Cannon (Mulgore) - Cast Spell Cannon Prep (Teleport)');
INSERT INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (7705, 0, 15, 24754, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Blastenheimer 5000 Ultra Cannon (Mulgore) - Cast Spell Cannon Prep (Stun)');
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (87868, 15218, 0, 0, 0, 0, -9570.28, -9.95068, 63.5196, 6.12611, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (87869, 15218, 0, 0, 0, 1, -1324.94, 87.0497, 129.79, 4.85202, 120, 120, 0, 100, 100, 0, 0, 0, 7, 10);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (87868, 4);
INSERT INTO `game_event_creature` (`guid`, `event`) VALUES (87869, 5);
UPDATE `creature_template` SET `faction`=114, `level_min`=60, `level_max`=60, `health_min`=4120, `health_max`=4120, `unit_flags`=33555200, `speed_walk`=1, `speed_run`=1.14286, `base_attack_time`=2000 WHERE `entry`=15218;

-- Fix cooldown check for Sayge's Buff.
DELETE FROM `conditions` WHERE `condition_entry` IN (863, 864, 865, 866, 867, 868, 869, 870);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES
(863, -2, 855, 856, 857, 858, 0),
(864, -2, 859, 860, 861, 862, 0),
(865, 1, 23770, 0, 0, 0, 0),
(866, -2, 863, 864, 865, 0, 1);
UPDATE `gossip_menu` SET `condition_id`=866 WHERE `condition_id`=870;
UPDATE `gossip_menu_option` SET `condition_id`=866 WHERE `condition_id`=870;

-- Remove orphaned addon row for Ribbon Pole Debug Target which was respawned with a different guid.
DELETE FROM `creature_addon` WHERE `guid`=1886;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
