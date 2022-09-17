DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220917053021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220917053021');
-- Add your query below.


-- Remove wrong spell from Entropic Horror.
UPDATE `creature_template` SET `spell_id1`=0, `script_name`='' WHERE `entry`=9879;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
