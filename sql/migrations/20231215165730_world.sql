DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231215165730');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231215165730');
-- Add your query below.

-- 500: Distance Between Targets Is Equal Or Greater Than 8 Yards
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (500, 38, 8, 1, 0, 0, 0);

-- Removing unused creature spell lists for Venom Stalker
DELETE FROM `creature_spells` WHERE `entry`=159760;
UPDATE `creature_template` SET `spell_list_id`=0 WHERE `entry`=15976;

-- Events list for Venom Stalker
DELETE FROM `creature_ai_events` WHERE `creature_id`=15976;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1597601, 15976, 0, 0, 0, 100, 1, 5000, 15000, 28000, 32000, 1597601, 0, 0, 'Venom Stalker - Cast Poison Charge');
DELETE FROM `creature_ai_scripts` WHERE `id`=1597601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1597601, 0, 0, 15, 28431, 0, 0, 0, 1, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 'Venom Stalker - Cast Poison Charge');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=15976;

-- Removing unused creature spell lists for Necro Stalker
DELETE FROM `creature_spells` WHERE `entry`=164530;
UPDATE `creature_template` SET `spell_list_id`=0 WHERE `entry`=16453;

-- Events list for Necro Stalker
DELETE FROM `creature_ai_events` WHERE `creature_id`=16453;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (1645301, 16453, 0, 0, 0, 100, 1, 5000, 15000, 28000, 32000, 1645301, 0, 0, 'Necro Stalker - Cast Poison Charge');
DELETE FROM `creature_ai_scripts` WHERE `id`=1645301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1645301, 0, 0, 15, 28431, 0, 0, 0, 1, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 'Necro Stalker - Cast Poison Charge');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=16453;



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
