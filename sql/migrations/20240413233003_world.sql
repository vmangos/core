DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240413233003');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240413233003');
-- Add your query below.


/*
 - Switch Necro Stalker and Venom Stalker to use script that targets farthest player.
*/
UPDATE `creature_template` SET `spell_list_id`=0,`script_name`='poison_charge_stalker_ai' WHERE `entry`=16453 OR `entry`=15976;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
