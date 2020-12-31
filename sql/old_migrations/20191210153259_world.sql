DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191210153259');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191210153259');
-- Add your query below.


-- Remove custom versions of Doctor Weavil and his flying machine.
DELETE FROM `creature_template` WHERE `entry` IN (155520, 155530);
DELETE FROM `creature_template_addon` WHERE `entry` IN (155520, 155530);
DELETE FROM `creature_ai_events` WHERE `creature_id` IN (155520, 155530);
DELETE FROM `creature_ai_scripts` WHERE `id` iN (15552001, 15553001);

-- Move Doctor Weavil's addon data to spawn instead of template.
INSERT INTO `creature_addon` (`guid`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES (18614, 7, 0, 3, 1, 16, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE `entry`=15552;

-- Remove custom spells used to start event script.
DELETE FROM `spell_mod` WHERE `ID` IN (25720, 33008, 33009, 33031);
DELETE FROM `spell_effect_mod` WHERE `ID` IN (25720, 33008, 33009, 33031);

-- Update scripts used in quest Decoy to use correct creature ids.
DELETE FROM `event_scripts` WHERE `id`=9527;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 0, 9, 181756, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Respawn Stillpine Grain');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 5, 10, 15553, 61000, 0, 0, 0, 0, 0, 0, 0, 9529, 6, 1, 5166.07, -5196.86, 938.6, 2.125, 0, 'Decoy!: Summon Doctor Weavil\'s Flying Machine');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 16, 10, 15552, 44000, 0, 0, 0, 0, 0, 0, 16, 9528, 6, 1, 5088.21, -5087.08, 922.385, 4.89885, 0, 'Decoy!: Summon Doctor Weavil');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 33, 0, 0, 0, 0, 0, 15552, 50, 8, 3, 11106, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 33, 1, 1, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 37, 1, 1, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 39, 0, 2, 0, 0, 0, 15552, 50, 8, 3, 11107, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Say Emoted Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 39, 1, 25, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Point');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 42, 0, 0, 0, 0, 0, 15552, 50, 8, 3, 11108, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 42, 1, 1, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 46, 1, 1, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Talk');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 50, 0, 0, 0, 0, 0, 15552, 50, 8, 2, 11109, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Say Text');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 50, 1, 5, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Exclamation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 52, 1, 5, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Exclamation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 55, 1, 5, 0, 0, 0, 15552, 50, 8, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Decoy!: Doctor Weavil - Emote Exclamation');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9527, 59, 10, 15554, 3000000, 0, 0, 0, 0, 0, 0, 0, 0, 6, 1, 5096.82, -5089.7, 923.05, 4.0144, 0, 'Decoy!: Summon Number Two');
DELETE FROM `event_scripts` WHERE `id`=9528;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Weavil - Set Stand State');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 0, 22, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Weavil - Set Faction to Friendly');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 1, 3, 0, 15000, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5085.52, -5112.76, 930.478, 4.63966, 0, 'Doctor Weavil - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 16, 3, 0, 1000, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5085.86, -5110.67, 929.987, 1.40774, 0, 'Doctor Weavil - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 40, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doctor Weavil - Set Run');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9528, 41, 3, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5088.21, -5087.08, 922.385, 1.40774, 0, 'Doctor Weavil - Move');
DELETE FROM `event_scripts` WHERE `id`=9529;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9529, 1, 3, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5086.46, -5116.87, 938.6, 1.473, 0, 'Doctor Weavil Flying Machine - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9529, 6, 3, 0, 4000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5087.93, -5083.94, 922.205, 1.74548, 0, 'Doctor Weavil Flying Machine - Move');
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (9529, 56, 3, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5098.31, -5022.73, 934.798, 1.403, 0, 'Doctor Weavil Flying Machine - Move');

-- Remove other custom creatures that do not appear to be used.
DELETE FROM `creature_template` WHERE `entry` IN (1000000, 15711, 16963);
DELETE FROM `creature_template_addon` WHERE `entry` IN (1000000, 15711, 16963);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
