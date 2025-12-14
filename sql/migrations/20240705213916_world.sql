DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240705213916');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240705213916');
-- Add your query below.


-- Fix Stormwind and Orgrimmar world buffs not applying to pets.
UPDATE `generic_scripts` SET `datalong3`=1 WHERE `command`=92 && `id` IN (4974, 7782, 7496);
UPDATE `creature_movement_scripts` SET `datalong3`=1 WHERE `command`=92 && `id` IN (1439202, 1472002);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
