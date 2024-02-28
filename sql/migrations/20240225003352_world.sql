DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240225003352');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240225003352');
-- Add your query below.


-- Events list for Grobbulus Cloud
DELETE FROM `creature_ai_events` WHERE `creature_id`=16363;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1636301, 16363, 0, 11, 0, 100, 1, 0, 0, 0, 0, 1636301, 0, 0, 'Grobbulus Cloud - Disable Melee Attack and Combat Movement on Spawn'),
(1636302, 16363, 0, 7, 0, 100, 0, 0, 0, 0, 0, 1636301, 0, 0, 'Grobbulus Cloud - Disable Melee Attack and Combat Movement on Evade'),
(1636303, 16363, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1636302, 0, 0, 'Grobbulus Cloud - Cast Spell Poison on Timer in Combat'),
(1636304, 16363, 0, 1, 0, 100, 0, 0, 0, 0, 0, 1636302, 0, 0, 'Grobbulus Cloud - Cast Spell Poison on Timer out of Combat');
DELETE FROM `creature_ai_scripts` WHERE `id`=1636301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1636301, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus Cloud - Disable Melee Attack'),
(1636301, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus Cloud - Disable Combat Movement');
DELETE FROM `creature_ai_scripts` WHERE `id`=1636302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1636302, 0, 0, 15, 28158, 32, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Grobbulus Cloud - Cast Spell Poison');
UPDATE `creature_template` SET `unit_flags`=33554432, `auras`='19951', `ai_name`='EventAI', `script_name`='' WHERE `entry`=16363;
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 1024) WHERE `entry`=28158;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
