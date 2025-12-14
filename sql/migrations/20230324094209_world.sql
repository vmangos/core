DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230324094209');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230324094209');
-- Add your query below.

-- Entry at creature_spells was already existing, just spell_list_id was not linked
UPDATE `creature_template` SET `spell_list_id`= 18950 WHERE `entry`=1895;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
