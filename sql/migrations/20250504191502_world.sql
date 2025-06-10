DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250504191502');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250504191502');
-- Add your query below.


-- Feralas
SET @GGUID = 1807;
SET @PTEMPLATE = 1207;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -2996.866455078125, 2881.482177734375, 95.99605560302734375, 5.759587764739990234, 0, 0, -0.25881862640380859, 0.965925931930541992, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2040, 1, -2996.866455078125, 2881.482177734375, 95.99605560302734375, 5.759587764739990234, 0, 0, -0.25881862640380859, 0.965925931930541992, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, -2996.866455078125, 2881.482177734375, 95.99605560302734375, 5.759587764739990234, 0, 0, -0.25881862640380859, 0.965925931930541992, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1197, 0, 'Feralas - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Tanaris
SET @GGUID = 1813;
SET @PTEMPLATE = 1213;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -8302.0712890625, -5020.8759765625, 9.090802192687988281, 3.45575571060180664, 0, 0, -0.98768806457519531, 0.156436234712600708, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2040, 1, -8302.0712890625, -5020.8759765625, 9.090802192687988281, 3.45575571060180664, 0, 0, -0.98768806457519531, 0.156436234712600708, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, -8302.0712890625, -5020.8759765625, 9.090802192687988281, 3.45575571060180664, 0, 0, -0.98768806457519531, 0.156436234712600708, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Tanaris', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 1203, 0, 'Tanaris - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Desolace
SET @GGUID = 1917;
SET @PTEMPLATE = 1217;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -12.14697265625, 2783.988525390625, -37.7794837951660156, 1.186823248863220214, 0, 0, 0.559192657470703125, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 2040, 1, -12.14697265625, 2783.988525390625, -37.7794837951660156, 1.186823248863220214, 0, 0, 0.559192657470703125, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, -12.14697265625, 2783.988525390625, -37.7794837951660156, 1.186823248863220214, 0, 0, 0.559192657470703125, 0.829037725925445556, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Desolace', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 9907, 0, 'Desolace - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Felwood
SET @GGUID = 1928;
SET @PTEMPLATE = 1220;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, 5478.3984375, -1021.87542724609375, 387.068756103515625, 0.663223206996917724, 0, 0, 0.325567245483398437, 0.945518851280212402, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 176645, 1, 5478.3984375, -1021.87542724609375, 387.068756103515625, 0.663223206996917724, 0, 0, 0.325567245483398437, 0.945518851280212402, 300, 300, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2047, 1, 5478.3984375, -1021.87542724609375, 387.068756103515625, 0.663223206996917724, 0, 0, 0.325567245483398437, 0.945518851280212402, 300, 300, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Felwood', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 328, 0, 'Felwood - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);

-- Feral Scar Vale
SET @GGUID = 2339;
SET @PTEMPLATE = 1405;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, 1734, 1, -5089.9873046875, 1786.59423828125, 79.49456787109375, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+1, 1734, 1, -5158.44873046875, 1742.1925048828125, 78.70025634765625, 5.044002056121826171, 0, 0, -0.58070278167724609, 0.814115643501281738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+2, 2040, 1, -5089.9873046875, 1786.59423828125, 79.49456787109375, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+3, 2040, 1, -5158.44873046875, 1742.1925048828125, 78.70025634765625, 5.044002056121826171, 0, 0, -0.58070278167724609, 0.814115643501281738, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+4, 2047, 1, -5089.9873046875, 1786.59423828125, 79.49456787109375, 0.15707901120185852, 0, 0, 0.078458786010742187, 0.996917366981506347, 600, 2700, 100, 1, 0, 0, 0, 10),
(@GGUID+5, 2047, 1, -5158.44873046875, 1742.1925048828125, 78.70025634765625, 5.044002056121826171, 0, 0, -0.58070278167724609, 0.814115643501281738, 600, 2700, 100, 1, 0, 0, 0, 10);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+0, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 0, 10),
(@PTEMPLATE+1, 1, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@GGUID+0, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+0, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+3, @PTEMPLATE+1, 90, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+4, @PTEMPLATE+0, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10),
(@GGUID+5, @PTEMPLATE+1, 5, 'Gold Vein / Mithril Deposit / Truesilver Deposit - Feralas - Feral Scar Vale', 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+0, 297, 0, 'Feralas - Feral Scar Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0),
(@PTEMPLATE+1, 297, 0, 'Feralas - Feral Scar Vale - Gold Vein / Mithril Deposit / Truesilver Deposit', 0);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
