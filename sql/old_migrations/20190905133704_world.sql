DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190905133704');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190905133704');
-- Add your query below.


-- Prospecthor Whelgar should say something when Flagongut's Fossil is looted.
DELETE FROM `event_scripts` WHERE `id`=601;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (601, 0, 0, 0, 0, 0, 0, 9688, 0, 9, 2, 1235, 0, 0, 0, 0, 0, 0, 0, 0, 'Flagongut\'s Fossil: Prospector Whelgar - Say Text');
UPDATE `broadcast_text` SET `EmoteId0`=1 WHERE `ID`=1235;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
