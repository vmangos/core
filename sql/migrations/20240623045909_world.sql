DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240623045909');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240623045909');
-- Add your query below.


-- Bonfires at Blackwood GY shouldn't be spawned pre 1.11 naxx
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=45609;
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=45611;
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=45610;
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=45608;

-- 1.12 objects in Horde camp in Silithus shouldn't be spawned pre 1.12
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49377;
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49281;
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49379;
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49375;
-- Update in gameobject_template as well
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry`=181633;
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry`=181634;
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry`=181619;

-- Spawn missing pre 1.12 Cooking Brazier in Horde camp in Silithus
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(49998, 180689, 1, -7554.36, 742.9, -17.7829, 4.79809, 0, 0, 0.676168, -0.736748, 25, 25, 0, 1, 0, 0, 7, 9);

-- 1.12 objects in Alliance camp in Silithus shouldn't be spawned pre 1.12
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49274;
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49381;
UPDATE `gameobject` SET `patch_min`=10 WHERE `guid`=49374;
-- Update in gameobject_template as well
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry`=181635;
UPDATE `gameobject_template` SET `patch`=10 WHERE `entry`=181618;

-- Spawn missing pre 1.12 Cooking Brazier in Alliance camp in Silithus
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(49999, 180688, 1, -7165.76, 1389.52, 2.41821, 3.06785, 0, 0, 0.99932, 0.0368614, 25, 25, 0, 1, 0, 0, 7, 9);

-- Stonelash Flayer shouldn't be spawned pre 1.8
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=44397;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=44396;

-- Set patch of pooled food/barrel to not spawn pre 1.11
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=902;
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=904;

-- Moonwell (for mooncloth crafting) at Cenarion Hold shouldn't be spawned pre 1.8
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid`=49378;

-- Twilight Masters in northeast Silithus shouldn't be spawned pre 1.8
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=43069;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=43070;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=43071;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=43076;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=43077;

-- Bonfire Damage in northeast Silithus shouldn't be spawned in pre 1.8
UPDATE `gameobject` SET `patch_min`=6 WHERE `guid`=49282;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
