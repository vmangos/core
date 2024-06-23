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

-- Objects in Horde camp in Silithus shouldn't be spawned pre 1.9
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49377;
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49281;
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49379;

-- Objects in Alliance camp in Silithus shouldn't be spawned pre 1.9
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49274;
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49381;
UPDATE `gameobject` SET `patch_min`=7 WHERE `guid`=49374;

-- Stonelash Flayer shouldn't be spawned pre 1.8
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=44397;
UPDATE `creature` SET `patch_min`=6 WHERE `guid`=44396;

-- Set patch of pooled food/barrel to not spawn pre 1.11
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=902;
UPDATE `gameobject` SET `patch_min`=9 WHERE `guid`=904;

-- Moonwell at Cenarion Hold shouldn't be spawned pre 1.8
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
