DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171025201047');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171025201047');
-- Add your query below.

DELETE FROM `mangos_string` WHERE `entry` IN (1031,1032,1033,1034);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(1031, 'EquipmentId: %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1032, 'InhabitType: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1033, 'Armor: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1034, 'AIName: %s ScriptName: %s', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
