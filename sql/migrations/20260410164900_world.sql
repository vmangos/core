DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260410164900');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260410164900');
-- Add your query below.

SET @PTEMPLATE = 3557;

DELETE FROM `pool_template` WHERE `entry` = 1139;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1139;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Copper Vein - Desolace - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(4737, @PTEMPLATE+1, 'Copper Vein - Desolace - Group 1'),
(20647, @PTEMPLATE+1, 'Copper Vein - Desolace - Group 1'),
(34182, @PTEMPLATE+1, 'Copper Vein - Desolace - Group 1'),
(34159, @PTEMPLATE+1, 'Copper Vein - Desolace - Group 1'),
(34185, @PTEMPLATE+1, 'Copper Vein - Desolace - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 2, 'Copper Vein - Desolace - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(20646, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2'),
(5047, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2'),
(20645, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2'),
(20659, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2'),
(5416, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2'),
(5443, @PTEMPLATE+2, 'Copper Vein - Desolace - Group 2');

SET @PTEMPLATE = 4814;

DELETE FROM `pool_template` WHERE `entry` = 1066;
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1066;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Copper Vein - Hillsbrad Foothills - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(21274, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1'),
(21257, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1'),
(21256, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1'),
(21259, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1'),
(21273, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1'),
(5222, @PTEMPLATE+1, 'Copper Vein - Hillsbrad Foothills - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 2, 'Copper Vein - Hillsbrad Foothills - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(5391, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2'),
(5380, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2'),
(21271, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2'),
(21250, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2'),
(18263, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2'),
(34265, @PTEMPLATE+2, 'Copper Vein - Hillsbrad Foothills - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 2, 'Copper Vein - Hillsbrad Foothills - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(18264, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3'),
(34278, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3'),
(25046, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3'),
(21276, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3'),
(27640, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3'),
(27641, @PTEMPLATE+3, 'Copper Vein - Hillsbrad Foothills - Group 3');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 2, 'Copper Vein - Hillsbrad Foothills - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(34238, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4'),
(35356, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4'),
(30030, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4'),
(34233, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4'),
(34279, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4'),
(29993, @PTEMPLATE+4, 'Copper Vein - Hillsbrad Foothills - Group 4');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Copper Vein - Hillsbrad Foothills - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(25045, @PTEMPLATE+5, 'Copper Vein - Hillsbrad Foothills - Group 5'),
(25047, @PTEMPLATE+5, 'Copper Vein - Hillsbrad Foothills - Group 5'),
(21237, @PTEMPLATE+5, 'Copper Vein - Hillsbrad Foothills - Group 5'),
(21277, @PTEMPLATE+5, 'Copper Vein - Hillsbrad Foothills - Group 5'),
(21251, @PTEMPLATE+5, 'Copper Vein - Hillsbrad Foothills - Group 5');

SET @PTEMPLATE = 4950;

DELETE FROM `pool_template` WHERE `entry` IN (270, 1156);
DELETE FROM `pool_gameobject` WHERE `pool_entry` = 1156;
DELETE FROM `pool_gameobject` WHERE `guid` = 14920;

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 2, 'Copper Vein - Wetlands - Group 1 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(15031, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1'),
(15030, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1'),
(5283, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1'),
(5288, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1'),
(14900, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1'),
(5286, @PTEMPLATE+1, 'Copper Vein - Wetlands - Group 1');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+2, 2, 'Copper Vein - Wetlands - Group 2 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(14870, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2'),
(5474, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2'),
(112738, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2'),
(4700, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2'),
(100578, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2'),
(4716, @PTEMPLATE+2, 'Copper Vein - Wetlands - Group 2');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+3, 2, 'Copper Vein - Wetlands - Group 3 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(5048, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3'),
(5207, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3'),
(15214, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3'),
(5250, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3'),
(14875, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3'),
(14920, @PTEMPLATE+3, 'Copper Vein - Wetlands - Group 3');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+4, 2, 'Copper Vein - Wetlands - Group 4 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(14862, @PTEMPLATE+4, 'Copper Vein - Wetlands - Group 4'),
(14906, @PTEMPLATE+4, 'Copper Vein - Wetlands - Group 4'),
(34906, @PTEMPLATE+4, 'Copper Vein - Wetlands - Group 4'),
(34133, @PTEMPLATE+4, 'Copper Vein - Wetlands - Group 4'),
(33849, @PTEMPLATE+4, 'Copper Vein - Wetlands - Group 4');

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+5, 2, 'Copper Vein - Wetlands - Group 5 - Master', 0, 0, 0, 10);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`) VALUES
(14894, @PTEMPLATE+5, 'Copper Vein - Wetlands - Group 5'),
(14564, @PTEMPLATE+5, 'Copper Vein - Wetlands - Group 5'),
(14602, @PTEMPLATE+5, 'Copper Vein - Wetlands - Group 5'),
(4705, @PTEMPLATE+5, 'Copper Vein - Wetlands - Group 5');

UPDATE `pool_gameobject` SET `pool_entry`=1028, `description`='Copper Vein - Mulgore' WHERE  `guid`=5127;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
