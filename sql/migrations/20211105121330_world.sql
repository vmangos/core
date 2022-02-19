DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211105121330');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211105121330');
-- Add your query below.


-- Make Krakle's Thermometer ignore LoS.
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (16378, 4, 'Krakle\'s Thermometer - Ignore LoS');

-- Events list for Krakle's Thermometer
DELETE FROM `creature_ai_events` WHERE `creature_id`=10541;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1054101, 10541, 0, 8, 0, 100, 1, 16378, -1, 10000, 10000, 1054101, 0, 0, 'Krakle\'s Thermometer - Say Text on Hit by Spell Temperature Reading');
DELETE FROM `creature_ai_scripts` WHERE `id`=1054101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5767, 6009, 6010, 6011, 0, 0, 0, 0, 23713, 'Krakle\'s Thermometer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5764, 6413, 6414, 0, 0, 0, 0, 0, 23715, 'Krakle\'s Thermometer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5766, 6411, 6412, 0, 0, 0, 0, 0, 23712, 'Krakle\'s Thermometer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5765, 0, 0, 0, 0, 0, 0, 0, 23714, 'Krakle\'s Thermometer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5763, 6006, 6007, 6008, 0, 0, 0, 0, 23716, 'Krakle\'s Thermometer - Say Text');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1054101, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 23716, 'Krakle\'s Thermometer - Grant Quest Credit');
UPDATE `creature_template` SET `ai_name`='EventAI', `flags_extra`=66 WHERE `entry`=10541;

-- Conditions to check the guid of Krakle's Thermometer on getting hit by spell.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (23712, 52, 23712, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (23713, 52, 23713, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (23714, 52, 23714, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (23715, 52, 23715, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (23716, 52, 23716, 0, 0, 0, 0);

-- Quest Finding the Source should only be completed when using the thermometer in a specific place.
UPDATE `quest_template` SET `ReqSpellCast1`=0 WHERE `entry`=974;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
