DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190114020122');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190114020122');
-- Add your query below.


-- Add OOC texts for Lil Timmy.
DELETE FROM `creature_ai_events` WHERE `creature_id` = 8666;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES
(866601, 8666, 0, 1, 0, 100, 3, 1000, 15000, 150000, 180000, 866601, 866602, 0, 'Lil Timmy - OOC Say Random Text');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (866601, 866602);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(866601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4523, 4524, 4525, 0, 0, 0, 0, 0, 0, 'Lil Timmy - Random Text'),
(866602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4526, 4527, 4528, 0, 0, 0, 0, 0, 0, 'Lil Timmy - Random Text');
UPDATE `creature_movement` SET `textid1` = 0, `textid2` = 0, `textid3` = 0 WHERE `id` = 45501;
UPDATE `creature_template` SET `AIName` = "EventAI" WHERE `entry` = 8666;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
