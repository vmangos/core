DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180727212211');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180727212211');
-- Add your query below.

REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES
('53943', '10414', '329', '0', '0', '3514.031', '-3315.812', '131.4270', '5.8762820', '7200', '7200', '0', '0', '17294', '0', '0', '2', '0', '0', '0', '10'),
('53953', '10414', '329', '0', '0', '3715.006', '-3257.741', '127.5074', '3.7167480', '7200', '7200', '0', '0', '16810', '0', '0', '2', '0', '0', '0', '10'),
('53954', '10414', '329', '0', '0', '3644.708', '-3518.909', '136.6874', '0.4530413', '7200', '7200', '0', '0', '17778', '0', '0', '2', '0', '0', '0', '10');

SET @POINT := 0;
SET @GUID := 53943;
DELETE FROM `creature_movement` WHERE `id`=@GUID;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID, @POINT := @POINT + 1, '3534.015', '-3324.425', '129.8595', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3560.001', '-3333.560', '129.3484', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3586.655', '-3333.666', '127.5914', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3547.955', '-3350.484', '129.6712', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3535.259', '-3386.414', '132.3763', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3547.318', '-3425.527', '135.5917', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3535.259', '-3386.414', '132.3763', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3547.955', '-3350.484', '129.6712', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3586.655', '-3333.666', '127.5914', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3560.001', '-3333.560', '129.3484', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3534.015', '-3324.425', '129.8595', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3514.710', '-3316.200', '131.3653', '0', '0', '100');

SET @POINT := 0;
SET @GUID := 53953;
DELETE FROM `creature_movement` WHERE `id`=@GUID;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID, @POINT := @POINT + 1, '3684.709', '-3277.381', '127.7411', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3676.379', '-3308.390', '126.5745', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3659.589', '-3336.161', '123.8123', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3676.391', '-3362.000', '126.9095', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3692.163', '-3390.773', '131.7898', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3704.820', '-3409.990', '132.0954', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3713.120', '-3429.090', '131.0521', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3704.820', '-3409.990', '132.0954', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3692.163', '-3390.773', '131.7898', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3676.560', '-3362.259', '126.9878', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3659.589', '-3336.161', '123.8123', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3676.379', '-3308.390', '126.5745', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3684.709', '-3277.381', '127.7411', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3710.365', '-3258.234', '127.3572', '0', '0', '100');

SET @POINT := 0;
SET @GUID := 53954;
DELETE FROM `creature_movement` WHERE `id`=@GUID;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `orientation`) VALUES
(@GUID, @POINT := @POINT + 1, '3657.536', '-3512.664', '136.7484', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3658.833', '-3494.780', '136.6653', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3643.470', '-3488.159', '137.2863', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3627.432', '-3493.946', '137.0125', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3613.319', '-3494.960', '136.8131', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3595.513', '-3479.301', '134.8088', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3611.958', '-3502.992', '137.2479', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3628.521', '-3521.972', '136.8026', '0', '0', '100'),
(@GUID, @POINT := @POINT + 1, '3646.972', '-3519.165', '136.6715', '0', '0', '100');

UPDATE `creature_spells` SET `spellId_1`='10101', `castTarget_1`='1', `delayInitialMin_1`='7', `delayInitialMax_1`='14', `delayRepeatMin_1`='7', `delayRepeatMax_1`='15', `spellId_2`='0', `probability_2`='0', `castTarget_2`='0', `delayInitialMin_2`='0', `delayInitialMax_2`='0', `delayRepeatMin_2`='0', `delayRepeatMax_2`='0' WHERE `entry`='104140';

DELETE FROM `creature_addon` WHERE `guid` IN ('53943', '53953', '53954');
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
('10414', '0', '0', '0', '1', '16', '0', '0', '8876 16345');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
