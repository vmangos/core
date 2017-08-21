INSERT INTO `migrations` VALUES ('20170602212240'); 

-- Darkmoon Faire
UPDATE `gameobject_template` SET `ScriptName`='go_darkmoon_faire_music' WHERE `entry`=180335;

-- Add missing Darkmoon Faire Music Doodad in mulgore
DELETE FROM `gameobject` WHERE `guid` IN (21);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) VALUES
(21, 180335, 1, -1563.93, 157.087, -7.79281, 0.0523589, 0, 0, 0.0261765, 0.999657, 180, 100, 1, 0);
