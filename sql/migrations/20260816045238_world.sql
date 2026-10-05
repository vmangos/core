DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260816045238');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260816045238');
-- Add your query below.


-- Spawn missing Postbox Parcel from sniff
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES
(2464, 176360, 329, 3651.55908203125, -3166.3369140625, 129.3258209228515625, 5.148722648620605468, 0, 0, -0.53729915618896484, 0.843391716480255126, -3600, -3600, 100, 1, 0, 10); -- Stratholme (SPAWN)
DELETE FROM `gameobject_scripts` WHERE `id`=47273;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(47273, 0, 0, 9, 2464, 3600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Crusaders\' Square Postbox - Respawn Postbox Parcel');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
