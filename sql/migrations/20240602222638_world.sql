DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240602222638');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240602222638');
-- Add your query below.


-- Remove custom spells from Broken Tooth.
UPDATE `creature_template` SET `spell_id1`=0, `spell_id2`=0, `spell_id3`=0, `spell_id4`=0, `script_name`='' WHERE `entry`=2850;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
