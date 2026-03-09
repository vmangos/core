DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260303150148');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260303150148');
-- Add your query below.

-- Pool Ghost Mushroom in The Hinterlands
SET @PTEMPLATE = 4088;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 1
DELETE FROM `pool_gameobject` WHERE `guid` IN (68647, 68642, 68646, 66927, 553);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Hinterlands - Group 1 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68647, @PTEMPLATE+1, 0, 'Ghost Mushroom - Hinterlands - Group 1', 0, 0, 10),
(68642, @PTEMPLATE+1, 0, 'Ghost Mushroom - Hinterlands - Group 1', 0, 0, 10),
(68646, @PTEMPLATE+1, 0, 'Ghost Mushroom - Hinterlands - Group 1', 0, 0, 10),
(66927, @PTEMPLATE+1, 0, 'Ghost Mushroom - Hinterlands - Group 1', 0, 0, 10),
(553, @PTEMPLATE+1, 0, 'Ghost Mushroom - Hinterlands - Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 2
DELETE FROM `pool_gameobject` WHERE `guid` IN (66968, 66925, 68643, 552, 551);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Hinterlands - Group 2 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66968, @PTEMPLATE+2, 0, 'Ghost Mushroom - Hinterlands - Group 2', 0, 0, 10),
(66925, @PTEMPLATE+2, 0, 'Ghost Mushroom - Hinterlands - Group 2', 0, 0, 10),
(68643, @PTEMPLATE+2, 0, 'Ghost Mushroom - Hinterlands - Group 2', 0, 0, 10),
(552, @PTEMPLATE+2, 0, 'Ghost Mushroom - Hinterlands - Group 2', 0, 0, 10),
(551, @PTEMPLATE+2, 0, 'Ghost Mushroom - Hinterlands - Group 2', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 3
DELETE FROM `pool_gameobject` WHERE `guid` IN (68644, 68645, 68641, 66926, 554);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 1, 'Hinterlands - Group 3 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(68644, @PTEMPLATE+3, 0, 'Ghost Mushroom - Hinterlands - Group 3', 0, 0, 10),
(68645, @PTEMPLATE+3, 0, 'Ghost Mushroom - Hinterlands - Group 3', 0, 0, 10),
(68641, @PTEMPLATE+3, 0, 'Ghost Mushroom - Hinterlands - Group 3', 0, 0, 10),
(66926, @PTEMPLATE+3, 0, 'Ghost Mushroom - Hinterlands - Group 3', 0, 0, 10),
(554, @PTEMPLATE+3, 0, 'Ghost Mushroom - Hinterlands - Group 3', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 4
DELETE FROM `pool_gameobject` WHERE `guid` IN (66936, 66933, 66934, 46364, 66937);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 1, 'Hinterlands - Group 4 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66936, @PTEMPLATE+4, 0, 'Ghost Mushroom - Hinterlands - Group 4', 0, 0, 10),
(66933, @PTEMPLATE+4, 0, 'Ghost Mushroom - Hinterlands - Group 4', 0, 0, 10),
(66934, @PTEMPLATE+4, 0, 'Ghost Mushroom - Hinterlands - Group 4', 0, 0, 10),
(46364, @PTEMPLATE+4, 0, 'Ghost Mushroom - Hinterlands - Group 4', 0, 0, 10),
(66937, @PTEMPLATE+4, 0, 'Ghost Mushroom - Hinterlands - Group 4', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 5
DELETE FROM `pool_gameobject` WHERE `guid` IN (66929, 46264, 66928, 559);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 1, 'Hinterlands - Group 5 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66929, @PTEMPLATE+5, 0, 'Ghost Mushroom - Hinterlands - Group 5', 0, 0, 10),
(46264, @PTEMPLATE+5, 0, 'Ghost Mushroom - Hinterlands - Group 5', 0, 0, 10),
(66928, @PTEMPLATE+5, 0, 'Ghost Mushroom - Hinterlands - Group 5', 0, 0, 10),
(559, @PTEMPLATE+5, 0, 'Ghost Mushroom - Hinterlands - Group 5', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 6
DELETE FROM `pool_gameobject` WHERE `guid` IN (46365, 68640, 33858, 66931);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 1, 'Hinterlands - Group 6 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(46365, @PTEMPLATE+6, 0, 'Ghost Mushroom - Hinterlands - Group 6', 0, 0, 10),
(68640, @PTEMPLATE+6, 0, 'Ghost Mushroom - Hinterlands - Group 6', 0, 0, 10),
(33858, @PTEMPLATE+6, 0, 'Ghost Mushroom - Hinterlands - Group 6', 0, 0, 10),
(66931, @PTEMPLATE+6, 0, 'Ghost Mushroom - Hinterlands - Group 6', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 7
DELETE FROM `pool_gameobject` WHERE `guid` IN (66935, 66930, 46366, 66932, 16434);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+7, 1, 'Hinterlands - Group 7 - Ghost Mushroom', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66935, @PTEMPLATE+7, 0, 'Ghost Mushroom - Hinterlands - Group 7', 0, 0, 10),
(66930, @PTEMPLATE+7, 0, 'Ghost Mushroom - Hinterlands - Group 7', 0, 0, 10),
(46366, @PTEMPLATE+7, 0, 'Ghost Mushroom - Hinterlands - Group 7', 0, 0, 10),
(66932, @PTEMPLATE+7, 0, 'Ghost Mushroom - Hinterlands - Group 7', 0, 0, 10);

DELETE FROM `gameobject` WHERE `guid` = 16434;
DELETE FROM `pool_template` WHERE  `entry`=1247 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
