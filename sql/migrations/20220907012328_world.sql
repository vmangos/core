DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220907012328');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220907012328');
-- Add your query below.


-- Remove wrong mod of Withered Touch.
DELETE FROM `spell_effect_mod` WHERE `Id`=11442;
UPDATE `creature_template` SET `auras`='11441', `script_name`='' WHERE `entry`=8606;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
