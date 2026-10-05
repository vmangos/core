DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260816021552');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260816021552');
-- Add your query below.


-- Add Call of Air NPCs in Thousand Needles, which were forgotten and unintentionally left in when the quest was changed.
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(2635, 5898, 0, 0, 0, 0, 1, -5473.201171875, -3152.729736328125, 99.33782958984375, 0.523598790168762207, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10),
(2636, 5898, 0, 0, 0, 0, 1, -5479.60302734375, -3142.520751953125, 98.58148193359375, 2.111848354339599609, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10),
(2637, 5898, 0, 0, 0, 0, 1, -5473.46484375, -3147.193115234375, 98.759552001953125, 4.939281940460205078, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10),
(2638, 5898, 0, 0, 0, 0, 1, -5467.62353515625, -3150.5498046875, 99.17620086669921875, 4.223696708679199218, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10),
(2639, 5898, 0, 0, 0, 0, 1, -5470.25927734375, -3142.655517578125, 98.3877716064453125, 0.907571196556091308, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10),
(2640, 5902, 0, 0, 0, 0, 1, -5461.4345703125, -3144.56201171875, 99.42690277099609375, 0.593411922454833984, 120, 120, 0.0, 100.0, 100.0, 0, 0, 0.0, 0, 10);

-- Add Elemental Spirit Invisibility so they only are visible with Sapta
INSERT INTO `creature_addon` (`guid`, `patch`, `display_id`, `mount_display_id`, `equipment_id`, `stand_state`, `sheath_state`, `emote_state`, `auras`) VALUES
(2635, 0, 0, 0, -1, 0, 1, 0, '8203'), -- 5898
(2636, 0, 0, 0, -1, 0, 1, 0, '8203'), -- 5898
(2637, 0, 0, 0, -1, 0, 1, 0, '8203'), -- 5898
(2638, 0, 0, 0, -1, 0, 1, 0, '8203'), -- 5898
(2639, 0, 0, 0, -1, 0, 1, 0, '8203'), -- 5898
(2640, 0, 0, 0, -1, 0, 1, 0, '8203'); -- 5902

-- Air Spirit should not be targetable.
UPDATE `creature_template` SET `static_flags1` = `static_flags1` | 512 /*Uninteractible*/ WHERE `entry`=5898;
-- Set correct level to Minor Manifestation of Air, previous was incorrectly level 1
UPDATE `creature_template` SET `level_min` = 33, `level_max` = 33 WHERE `entry` = 5902;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
