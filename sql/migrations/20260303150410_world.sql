DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260303150410');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260303150410');
-- Add your query below.

-- Pool Mountain Silversage in Western Plaguelands
SET @PTEMPLATE = 3611;
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 1
DELETE FROM `pool_gameobject` WHERE `guid` IN (66836, 68770, 68769, 66832, 68767, 593);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Western Plaguelands - Group 1 - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66836, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10),
(68770, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10),
(68769, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10),
(66832, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10),
(68767, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10),
(593, @PTEMPLATE+1, 0, 'Mountain Silversage - Western Plaguelands - Group 1', 0, 0, 10);

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Group 2
DELETE FROM `pool_gameobject` WHERE `guid` IN (66831, 68768, 66833, 66834, 66835, 597);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 1, 'Western Plaguelands - Group 2 - Mountain Silversage', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(66831, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10),
(68768, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10),
(66833, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10),
(66834, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10),
(66835, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10),
(597, @PTEMPLATE+2, 0, 'Mountain Silversage - Western Plaguelands - Group 2', 0, 0, 10);

DELETE FROM `pool_template` WHERE  `entry`=402 AND `patch_min`=0 AND `patch_max`=10;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
