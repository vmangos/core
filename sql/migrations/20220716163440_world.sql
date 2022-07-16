DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220716163440');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220716163440');
-- Add your query below.


-- Forcibly respawn Altar of Elune when starting quest Guardians of the Altar.
INSERT INTO `quest_start_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(4901, 2, 0, 41, 0, 0, 0, 0, 49182, 0, 12, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Altar of Elune - Remove from Map'),
(4901, 3, 0, 82, 49182, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Guardians of the Altar: Altar of Elune - Add to Map');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
