DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210316080636');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210316080636');
-- Add your query below.


-- Fix flags for Invisible Trigger One.
UPDATE `creature_template` SET `unit_flags`=33554944, `flags_extra`=2 WHERE `entry`=14495;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
