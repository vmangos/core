DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181003134756');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181003134756');
-- Add your query below.


-- Make sure Isillien is facing Taelan's corpse before talking.
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (6607, 3, 35, 0, 0, 0, 0, 5944, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'In Dreams: Grand Inquisitor Isillien - Face Taelan\'s Corpse');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
