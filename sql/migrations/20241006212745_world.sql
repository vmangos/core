DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241006212745');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241006212745');
-- Add your query below.


-- 13017: Source's Entry Is 13017
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (13017, 16, 13017, 0, 0, 0, 0);

-- Define targets for Monty Bashes Rats (DND).
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (21052, 1, 13017, 0, 0, 0, 5875);

-- Correct rat respawn time.
UPDATE `creature` SET `spawntimesecsmin`=5, `spawntimesecsmax`=5 WHERE `id`=13016;

-- Events list for Deeprun Rat
DELETE FROM `creature_ai_events` WHERE `creature_id`=13016;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1301601, 13016, 0, 8, 0, 100, 1, 21050, -1, 60000, 60000, 1301601, 0, 0, 'Deeprun Rat - Follow Player on Hit by Rat Catcher\'s Flute Dummy Spell'),
(1301602, 13016, 13017, 21, 0, 100, 0, 0, 0, 0, 0, 1301602, 0, 0, 'Deeprun Rat - Despawn on Reached Home while Enthralled'),
(1301603, 13016, 0, 8, 0, 100, 1, 21052, -1, 60000, 60000, 1301602, 0, 0, 'Deeprun Rat - Despawn on Hit By Spell Monty Bashes Rats (DND)');
DELETE FROM `creature_ai_scripts` WHERE `id`=1301601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1301601, 0, 0, 15, 21051, 2, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deeprun Rat - Cast Spell Melodious Rapture Visual (DND)'),
(1301601, 0, 1, 27, 13017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deeprun Rat - Update Entry to Enthralled Deeprun Rat'),
(1301601, 0, 2, 8, 13017, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deeprun Rat - Kill Credit for Enthralled Deeprun Rat'),
(1301601, 0, 3, 20, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, -1, 0, 'Deeprun Rat - Follow Player'),
(1301601, 0, 4, 18, 600000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deeprun Rat - Despawn in 10 minutes');
DELETE FROM `creature_ai_scripts` WHERE `id`=1301602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1301602, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deeprun Rat - Despawn');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=13016;
UPDATE `quest_template` SET `ReqSpellCast1`=0 WHERE `entry`=6661;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
