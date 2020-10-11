DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201011033109');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201011033109');
-- Add your query below.


-- Remove Immune to NPC flag from Theramore Combat Dummy.
UPDATE `creature_template` SET `unit_flags`=256 WHERE `entry`=4952;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
