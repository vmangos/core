DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241002045422');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241002045422');
-- Add your query below.


-- Add end script for quest Cycle of Rebirth.
DELETE FROM `quest_end_scripts` WHERE `id`=6301;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(6301, 0, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth: Tammra Windfield - Set Stand State to UNIT_STAND_STATE_STAND'),
(6301, 0, 1, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.74017, 0, 'Cycle of Rebirth: Tammra Windfield - Set Orientation'),
(6301, 0, 2, 15, 20041, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth: Tammra Windfield - Cast Spell Tammra Sapling'),
(6301, 3, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.29154, 0, 'Cycle of Rebirth: Tammra Windfield - Set Orientation'),
(6301, 3, 1, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth: Tammra Windfield - Set Stand State to UNIT_STAND_STATE_KNEEL'),
(6301, 10, 0, 41, 0, 0, 0, 0, 33531, 0, 12, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth: Tammra Gaea Sapling - Despawn GameObject'),
(6301, 23, 0, 82, 33531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Cycle of Rebirth: Respawn GameObject Tammra Gaea Sapling');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
