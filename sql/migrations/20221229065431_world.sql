DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221229065431');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221229065431');
-- Add your query below.


-- Eye of Kilrogg should not have Immune to NPC flag.
UPDATE `creature_template` SET `unit_flags`=0 WHERE `entry`=4277;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
