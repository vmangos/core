DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181206122951');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181206122951');
-- Add your query below.


-- Marshal Gryan Stoutmantle, Protector Gariel, Protector Bialon, Captain Danuvin & Barkeep Hann
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` IN (234, 490, 487, 821, 274);
DELETE FROM `creature_ai_events` WHERE `id` = 23401 AND `creature_id` = 234;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(23401, 234, 0, 1, 0, 100, 1, 1000, 15000, 150000, 180000, 23401, 0, 0, "Marshal Gryan Stoutmantle - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 23401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(23401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 39, 40, 44, 0, 0, 0, 0, 0, 0, "Marshal Gryan Stoutmantle - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (39, 40, 44);

DELETE FROM `creature_ai_events` WHERE `id` = 49001 AND `creature_id` = 490;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(49001, 490, 0, 1, 0, 100, 1, 30000, 45000, 150000, 180000, 49001, 0, 0, "Protector Gariel - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 49001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(49001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41, 0, 0, 0, 0, 0, 0, 0, 0, "Protector Gariel - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` = 41;

DELETE FROM `creature_ai_events` WHERE `id` = 48701 AND `creature_id` = 487;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(48701, 487, 0, 1, 0, 100, 1, 75000, 90000, 150000, 180000, 48701, 0, 0, "Protector Bialon - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 48701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(48701, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, "Protector Bialon - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` = 42;

DELETE FROM `creature_ai_events` WHERE `id` = 82101 AND `creature_id` = 821;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(82101, 821, 0, 1, 0, 100, 1, 120000, 135000, 150000, 180000, 82101, 0, 0, "Captain Danuvin - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 82101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(82101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43, 0, 0, 0, 0, 0, 0, 0, 0, "Captain Danuvin - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` = 43;

DELETE FROM `creature_ai_events` WHERE `id` = 27401 AND `creature_id` = 274;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(27401, 274, 0, 1, 0, 40, 1, 1000, 15000, 150000, 180000, 27401, 0, 0, "Barkeep Hann - Random OOC Say");
DELETE FROM `creature_ai_scripts` WHERE `id` = 27401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(27401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 80, 81, 0, 0, 0, 0, 0, 0, 0, "Barkeep Hann - Say Text");
UPDATE `broadcast_text` SET `EmoteId0` = 1 WHERE `ID` IN (80, 81);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
