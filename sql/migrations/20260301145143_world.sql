DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260301145143');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260301145143');
-- Add your query below.

-- Pool Gromsblood in Ashenvale
SET @PTEMPLATE = 1763;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Felfire Hill
DELETE FROM `pool_gameobject` WHERE `guid` IN (16511, 42136, 42132, 42133, 68720, 68719);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Ashenvale - Felfire Hill - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(16511, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10),
(42136, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10),
(42132, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10),
(42133, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10),
(68720, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10),
(68719, @PTEMPLATE+1, 0, 'Gromsblood - Ashenvale - Felfire Hill', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Demon Fall Ridge
DELETE FROM `pool_gameobject` WHERE `guid` IN (625, 630, 631, 42134, 42135, 47871);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Ashenvale - Demon Fall Ridge - Gromsblood', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(625, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10),
(630, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10),
(631, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10),
(42134, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10),
(42135, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10),
(47871, @PTEMPLATE+2, 0, 'Gromsblood - Ashenvale - Demon Fall Ridge', 0, 0, 10);

DELETE FROM `pool_template` WHERE  `entry`=1327 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
