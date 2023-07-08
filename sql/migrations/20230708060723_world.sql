DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230708060723');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230708060723');
-- Add your query below.


SET @OGUID = 90977;
-- Spawn Risen Protector pre 1.6.0
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID, 10487, 0, 0, 0, 0, 289, 195.727, 128.917, 109.794, 1.3257, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+1, 10487, 0, 0, 0, 0, 289, 169.733, 156.674, 109.507, 6.28001, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+2, 10487, 0, 0, 0, 0, 289, 169.875, 149.593, 109.508, 0.358109, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+3, 10487, 0, 0, 0, 0, 289, 204.894, 129.028, 109.794, 1.76239, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+4, 10487, 0, 0, 0, 0, 289, 236.687, 189.963, 95.8464, 1.00923, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+5, 10487, 0, 0, 0, 0, 289, 245.316, 189.926, 95.8464, 2.25248, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+6, 10487, 0, 0, 0, 0, 289, 197.778, 176.974, 109.796, 4.78456, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
(@OGUID+7, 10487, 0, 0, 0, 0, 289, 204.641, 176.899, 109.796, 4.78456, 7200, 7200, 0, 100, 100, 0, 0, 0, 0, 3),
-- Spawn Risen Warrior pre 1.6.0
(@OGUID+8, 10486, 0, 0, 0, 0, 289, -18.4563, 152.231, 83.8604, 3.47225, 25, 25, 0, 100, 0, 0, 0, 0, 0, 3),
(@OGUID+9, 10486, 0, 0, 0, 0, 289, -18.1193, 131.767, 83.8999, 2.71828, 25, 25, 0, 100, 0, 0, 0, 0, 0, 3);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
