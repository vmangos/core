DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260109110343');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260109110343');
-- Add your query below.


UPDATE `spell_template` SET `script_name`='spell_mage_combustion_proc' WHERE `entry`=11129 && `build` >= 5464;
UPDATE `spell_template` SET `script_name`='spell_mage_combustion_buff' WHERE `entry`=28682;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
