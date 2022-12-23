DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221223093116');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221223093116');
-- Add your query below.

UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_list_id`=0 WHERE `entry`=10596;

-- Events list for Mother Smolderweb
DELETE FROM `creature_ai_events` WHERE `creature_id`=10596;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(1059603, 10596, 0, 28, 0, 100, 1, 16468, 1, 7000, 15000, 1059603, 0, 0, 'Mother Smolderweb - Cast Mothers Milk'),
(1059604, 10596, 0, 6, 0, 100, 1, 0, 0, 0, 0, 1059604, 0, 0, 'Mother Smolderweb - Cast Summon Spire Spiderling'),
(1059605, 10596, 0, 0, 0, 100, 1, 2000, 2000, 15000, 15000, 1059605, 0, 0, 'Mother Smolderweb - Cast Crystallize');

DELETE FROM `creature_ai_scripts` WHERE `id`=1059603;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1059603, 0, 0, 15, 16468, 3, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mother Smolderweb - Cast Spell Mother s Milk');

DELETE FROM `creature_ai_scripts` WHERE `id`=1059604;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1059604, 0, 0, 15, 16103, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mother Smolderweb - Cast Summon Spire Spiderling');

DELETE FROM `creature_ai_scripts` WHERE `id`=1059605;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1059605, 0, 0, 15, 16104, 64, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Mother Smolderweb - Cast Crystallize');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
