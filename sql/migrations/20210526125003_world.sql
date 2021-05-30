DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210526125003');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210526125003');
-- Add your query below.


-- Correct ID of existing Copper Vein spawns in The Barrens.
UPDATE `gameobject` SET `id`=103713, `position_x`=-4093.85, `position_y`=-2122.36, `position_z`=55.9365, `orientation`=1.74533, `rotation0`=0, `rotation1`=0, `rotation2`=0.766044, `rotation3`=0.642789 WHERE `guid`=5096;

-- Add missing Copper Vein (Entry: 103713) spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(5516, 103713, 1, -4076.08, -2193.39, 53.0868, 4.71239, 0, 0, -0.707107, 0.707107, 900, 900, 1, 100),
(5518, 103713, 1, -4189.49, -2169.27, 56.5968, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 1, 100),
(5519, 103713, 1, -4203.78, -2233.75, 55.3837, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100),
(5520, 103713, 1, -4207.56, -2290.02, 57.1232, 3.38594, 0, 0, -0.992546, 0.12187, 900, 900, 1, 100);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(5516, 1033, 0, 'Copper Vein'),
(5518, 1033, 0, 'Copper Vein'),
(5519, 1033, 0, 'Copper Vein'),
(5520, 1033, 0, 'Copper Vein');

--  Copper Vein (Entry: 1731 and 103713) should not contain Blood Shard.
DELETE FROM `gameobject_loot_template` WHERE `item`=5075 && `entry`=1502;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
