DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260826000552');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260826000552');
-- Add your query below.


DELETE FROM `event_scripts` WHERE `id`=2228;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2228, 0, 0, 37, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Uldaman: Altar of The Keepers - Set Data ENCOUNTER_STONE_KEEPERS to IN_PROGRESS');
DELETE FROM `scripted_event_id` WHERE `id`=2228;
DELETE FROM `event_scripts` WHERE `id`=2268;
INSERT INTO `event_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2268, 0, 0, 37, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Uldaman: Altar of Archaedas - Set Data ENCOUNTER_ARCHAEDAS to IN_PROGRESS');
DELETE FROM `scripted_event_id` WHERE `id`=2268;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
