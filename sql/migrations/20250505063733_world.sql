DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250505063733');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250505063733');
-- Add your query below.


-- Irontree Cavern
SET @GGUID = 1197;
SET @PTEMPLATE = 1231;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 176643, 1, 6261.0419921875, -1731.408935546875, 433.1103515625, 0.331610709428787231, 0, 0, 0.16504669189453125, 0.986285746097564697, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 181108, 1, 6261.0419921875, -1731.408935546875, 433.1103515625, 0.331610709428787231, 0, 0, 0.16504669189453125, 0.986285746097564697, 600, 2700, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Small Thorium Vein - Felwood - Irontree Cavern', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Truesilver Deposit / Small Thorium Vein - Felwood - Irontree Cavern', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Truesilver Deposit / Small Thorium Vein - Felwood - Irontree Cavern', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8117, 0, 'Felwood - Irontree Cavern - Truesilver Deposit / Small Thorium Vein', 0);

-- Azshara
SET @GGUID = 1559;
SET @PTEMPLATE = 1235;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 2047, 1, 4400.880859375, -7286.0849609375, 107.7297897338867187, 0.209439441561698913, 0, 0, 0.104528427124023437, 0.994521915912628173, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 175404, 1, 4400.880859375, -7286.0849609375, 107.7297897338867187, 0.209439441561698913, 0, 0, 0.104528427124023437, 0.994521915912628173, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 95, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 2337, 0, 'Truesilver Deposit / Rich Thorium Vein - Azshara', 0);

-- Hive Regal 
SET @GGUID = 2440;
SET @PTEMPLATE = 1465;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 177388, 1, -8189.69384765625, 414.282440185546875, -79.2323989868164062, 2.286378860473632812, 0, 0, 0.909960746765136718, 0.414694398641586303, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 177388, 1, -8265.61328125, 474.52972412109375, -74.8123321533203125, 3.543023586273193359, 0, 0, -0.97992420196533203, 0.199370384216308593, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 123309, 1, -8189.69384765625, 414.282440185546875, -79.2323989868164062, 2.286378860473632812, 0, 0, 0.909960746765136718, 0.414694398641586303, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 123309, 1, -8265.61328125, 474.52972412109375, -74.8123321533203125, 3.543023586273193359, 0, 0, -0.97992420196533203, 0.199370384216308593, 600, 2700, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Regal', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0),
(@PTEMPLATE+1, 8145, 0, 'Silithus - Hive\'Regal - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);

-- Hive Zora
SET @GGUID = 1573;
SET @PTEMPLATE = 1238;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 177388, 1, -7509.44091796875, 1953.8392333984375, -56.0211029052734375, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 123309, 1, -7509.44091796875, 1953.8392333984375, -56.0211029052734375, 0.174532130360603332, 0, 0, 0.087155342102050781, 0.996194720268249511, 600, 2700, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 95, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 5, 'Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein - Silithus - Hive\'Zora', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 8146, 0, 'Silithus - Hive\'Zora - Ooze Covered Truesilver Deposit / Ooze Covered Rich Thorium Vein', 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
