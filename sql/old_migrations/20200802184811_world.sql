DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200802184811');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200802184811');
-- Add your query below.


-- Add old spawn location for Rashona Straglash
UPDATE `creature` SET `patch_min`='4' WHERE `guid`=3421;
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `display_id`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (302709, 14726, 0, 0, 0, 1, 0, 0, 1862.34, -4569.76, 24.8434, 2.51327, 300, 300, 0, 100, 0, 0, 0, 0, 3, 3);



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
