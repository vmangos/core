DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260301150201');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260301150201');
-- Add your query below.

-- Pool Gromsblood in Blasted Lands
SET @PTEMPLATE = 3662;
SET @GGUID = 251;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Dark Portal Pool 1
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`) VALUES
(@GGUID+1, 142145, 0, -11755.8, -3155.15, -19.205, 4.11898, 0, 0, -0.882947, 0.469473, 300, 300, 100, 1, 0),
(@GGUID+2, 142145, 0, -11785.9, -3237.88, -24.6383, 3.22886, 0, 0, -0.999048, 0.0436193, 300, 300, 100, 1, 0);
DELETE FROM `pool_gameobject` WHERE `guid` IN (42121, 42117, 42123, 42184);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Blasted Lands - The Dark Portal Pool 1 - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(42121, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10),
(42117, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10),
(42123, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10),
(42184, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10),
(@GGUID+1, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10),
(@GGUID+2, @PTEMPLATE+1, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- The Dark Portal Pool 2
DELETE FROM `gameobject` WHERE `guid` = 29687;
DELETE FROM `pool_gameobject` WHERE `guid` IN (42125, 32304, 42127, 42118, 32106, 42124, 29687);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Blasted Lands - The Dark Portal Pool 2 - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(42125, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10),
(32304, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10),
(42127, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10),
(42118, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10),
(32106, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10),
(42124, @PTEMPLATE+2, 0, 'Gromsblood - Blasted Lands - The Dark Portal Pool 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dreadmaul Post
DELETE FROM `pool_gameobject` WHERE `guid` IN (68718, 16453, 16497, 16503, 42122, 42128);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Blasted Lands - Dreadmaul Post - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68718, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10),
(16453, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10),
(16497, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10),
(16503, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10),
(42122, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10),
(42128, @PTEMPLATE+3, 0, 'Gromsblood - Blasted Lands - Dreadmaul Post', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Altar of Storms
DELETE FROM `pool_gameobject` WHERE `guid` IN (16463, 42130, 32309, 42131, 589);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Blasted Lands - Altar of Storms - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(16463, @PTEMPLATE+4, 0, 'Gromsblood - Blasted Lands - Altar of Storms', 0, 0, 10),
(42130, @PTEMPLATE+4, 0, 'Gromsblood - Blasted Lands - Altar of Storms', 0, 0, 10),
(32309, @PTEMPLATE+4, 0, 'Gromsblood - Blasted Lands - Altar of Storms', 0, 0, 10),
(42131, @PTEMPLATE+4, 0, 'Gromsblood - Blasted Lands - Altar of Storms', 0, 0, 10),
(589, @PTEMPLATE+4, 0, 'Gromsblood - Blasted Lands - Altar of Storms', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rise of the Defiler
DELETE FROM `pool_gameobject` WHERE `guid` IN (16479, 16499, 32758, 42120, 35307);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Blasted Lands - Rise of the Defiler - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(16479, @PTEMPLATE+5, 0, 'Gromsblood - Blasted Lands - Rise of the Defiler', 0, 0, 10),
(16499, @PTEMPLATE+5, 0, 'Gromsblood - Blasted Lands - Rise of the Defiler', 0, 0, 10),
(32758, @PTEMPLATE+5, 0, 'Gromsblood - Blasted Lands - Rise of the Defiler', 0, 0, 10),
(42120, @PTEMPLATE+5, 0, 'Gromsblood - Blasted Lands - Rise of the Defiler', 0, 0, 10),
(35307, @PTEMPLATE+5, 0, 'Gromsblood - Blasted Lands - Rise of the Defiler', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Dreadmaul Hold
DELETE FROM `pool_gameobject` WHERE `guid` IN (16472, 16450, 16462, 42119, 16454);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Blasted Lands - Dreadmaul Hold - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(16472, @PTEMPLATE+6, 0, 'Gromsblood - Blasted Lands - Dreadmaul Hold', 0, 0, 10),
(16450, @PTEMPLATE+6, 0, 'Gromsblood - Blasted Lands - Dreadmaul Hold', 0, 0, 10),
(16462, @PTEMPLATE+6, 0, 'Gromsblood - Blasted Lands - Dreadmaul Hold', 0, 0, 10),
(42119, @PTEMPLATE+6, 0, 'Gromsblood - Blasted Lands - Dreadmaul Hold', 0, 0, 10),
(16454, @PTEMPLATE+6, 0, 'Gromsblood - Blasted Lands - Dreadmaul Hold', 0, 0, 10);

DELETE FROM `pool_template` WHERE  `entry`=1275 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
