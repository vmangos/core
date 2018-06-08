DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180519193249');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180519193249');
-- Add your query below.

SET @CGUID := 52011;
SET @PID := 25610;

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE a FROM `creature_movement` a INNER JOIN `creature` b ON a.`id`=b.`guid` WHERE b.`id`='9956';
DELETE a FROM `creature_addon` a INNER JOIN `creature` b ON a.`guid`=b.`guid` WHERE b.`id`='9956';
DELETE FROM `creature` WHERE `id`='9956';

REPLACE INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`, `spawnFlags`, `visibilitymod`, `patch_min`, `patch_max`) VALUES
(@CGUID := @CGUID + 0, '9956', '230', '0', '0', '1396.891', '-343.4526', '-91.95705', '0.4070473', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1457.020', '-417.8852', '-91.95474', '0.4534256', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1382.046', '-396.8674', '-94.59128', '6.0744370', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1385.198', '-439.4368', '-94.59129', '1.7924730', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1383.411', '-491.5028', '-91.95210', '1.9999730', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1331.276', '-462.2303', '-91.93541', '0.4006878', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1383.776', '-324.0556', '-91.97105', '2.1732760', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1382.621', '-397.6801', '-94.59127', '1.9852640', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1431.643', '-378.0382', '-91.91800', '1.5580570', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1305.000', '-426.3872', '-91.95335', '1.4881020', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1381.997', '-528.6877', '-91.96191', '2.3904490', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10'),
(@CGUID := @CGUID + 1, '9956', '230', '0', '0', '1431.377', '-462.2412', '-91.93483', '3.0068700', '600', '600', '15', '0', '895', '0', '0', '1', '0', '0', '0', '10');

REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
('9956', '0', '0', '0', '1', '16', '0', '0', NULL);

REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PID, '4', 'BRD - Shadowforge Flame Keeper', '0', '0', '0', '10');

REPLACE INTO `pool_creature_template` (`id`, `pool_entry`, `chance`, `description`, `flags`) VALUES
('9956', @PID, '0', 'BRD - Shadowforge Flame Keeper', '0');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
