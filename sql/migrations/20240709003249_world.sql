DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240709003249');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240709003249');
-- Add your query below.


-- Update old AQ gong according to 1.8 sniff.
UPDATE `gameobject` SET `orientation`=1.26536, `rotation2`=0.59131, `rotation3`=0.806445 WHERE `id`=177223;

-- Correct custom names in gameobject_template to match 1.8 sniff and later sniffs:
-- Gate of Ahn'Qiraj is Doodad_Ahn_Qiraj_DoorPlug01
UPDATE `gameobject_template` SET `name`='Doodad_Ahn_Qiraj_DoorPlug01', `patch`=6, `faction`=114, `flags`=32 WHERE `entry`=176146;
UPDATE `gameobject_template` SET `name`='Doodad_Ahn_Qiraj_DoorRoots01', `patch`=6, `faction`=114, `flags`=32 WHERE `entry`=176147;
UPDATE `gameobject_template` SET `name`='Doodad_Ahn_Qiraj_DoorRunes01', `patch`=6, `faction`=114, `flags`=32 WHERE `entry`=176148;

-- Update old Gate of Ahn'Qiraj according to sniff
DELETE FROM `game_event_gameobject` WHERE `guid`=66334 AND `event`=83;
UPDATE `gameobject` SET `position_x`=-8133.61, `position_y`=1525.3, `position_z`=17.9576, `orientation`=-0.0261799, `rotation2`=-0.0130896, `rotation3`=0.999914, `patch_min`=0, `patch_max`=6 WHERE `id`=176146;

-- Update old Ahn'Qiraj Gate Roots pre 1.9
-- It should not be involved in any event
DELETE FROM `game_event_gameobject` WHERE  `guid`=66335 AND `event`=83;
-- Guess since object is not sniffed pre 1.9, mix between classic sniff and old screenshot
UPDATE `gameobject` SET `position_x`=-8133.61, `position_y`=1525.3, `position_z`=17.9576, `orientation`=-0.043633, `rotation2`=-0.021815, `rotation3`=0.999762, `patch_min`=0, `patch_max`=6 WHERE `id`=176147;

-- Update old Ahn'Qiraj Gate Runes pre 1.9
-- It should not be involved in any event
DELETE FROM `game_event_gameobject` WHERE  `guid`=66336 AND `event`=83;
-- Guess object is not sniffed sniffed pre 1.9, mix between classic sniff and old screenshot
UPDATE `gameobject` SET `position_x`=-8132.32, `position_y`=1525.26, `position_z`=17.8036, `orientation`=-0.0261799, `rotation2`=-0.0130896, `rotation3`=0.999914, `patch_min`=0, `patch_max`=6 WHERE `id`=176148;

-- Post 1.9:
-- Ancient Door
UPDATE `gameobject` SET `patch_min`=7, `spawn_flags`=1, `visibility_mod`=350, `state`=1 WHERE `id`=180904;
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry`=180904;
-- AQRUNE
UPDATE `gameobject` SET `patch_min`=7, `state`=1, `spawn_flags`=1  WHERE `id`=180898;
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry`=180898;
-- AQROOT
UPDATE `gameobject` SET `patch_min`=7, `state`=1, `spawn_flags`=1  WHERE `id`=180899;
UPDATE `gameobject_template` SET `patch`=7 WHERE `entry`=180899;

-- Delete custom object from game_event_gameobject, object already deleted in 20230623091047_world.sql
DELETE FROM `game_event_gameobject` WHERE  `guid`=3997168 AND `event`=83;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
