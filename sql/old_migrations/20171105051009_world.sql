DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171105051009');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171105051009');
-- Add your query below.


-- Fix data for Varian Wrynn.
UPDATE `creature_template` SET `unit_flags`=4096, `equipment_id`=11699, `baseattacktime`=2100, `mindmg`=159, `maxdmg`=228, `mingold`=0, `maxgold`=0 WHERE `entry`=11699;
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (11699, 12748, 0, 0);

-- Spawn Varian Wrynn before patch 1.9.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (30879, 11699, 1, 0, 0, -2714.5, -4999.67, 7.07856, 4.75027, 1200, 0, 0, 7680, 0, 0, 0, 0, 0, 0, 6);

-- Tidelord Rrurgaz was added in patch 1.10.
UPDATE `creature` SET `patch_min`=8 WHERE `guid`=30872;

-- Doctor Weavil was added in patch 1.9.
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15552;

-- Doctor Weavil's Flying Machine was added in patch 1.9.
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15553;

-- Minion of Weavil was added in patch 1.9.
UPDATE `creature` SET `patch_min`=7 WHERE `id`=15591;

-- Add missing pre 1.9 naga spawns.
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12620, 4366, 1, 0, 0, -2652, -5055, 23.055, 2.307, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12621, 4366, 1, 0, 0, -2647, -5031, 21.288, 2.26, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12622, 4366, 1, 0, 0, -2642, -5061, 25.672, 5.457, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12623, 4366, 1, 0, 0, -2641, -5056, 33.827, 1.219, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12624, 4366, 1, 0, 0, -2640, -5040, 22.661, 3.798, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12625, 4368, 1, 0, 0, -2638, -5060, 33.827, 1.683, 5400, 0, 0, 9232, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12626, 4366, 1, 0, 0, -2636, -5055, 33.827, 1.828, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES (12627, 4366, 1, 0, 0, -2631.62, -5055.44, 25.672, 3.814, 5400, 0, 0, 9382, 0, 0, 0, 0, 0, 0, 6);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
