DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201211094527');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201211094527');
-- Add your query below.


-- Add motion generator name.
UPDATE `mangos_string` SET `content_default`='Motion type = %s (%u)' WHERE  `entry`=1509;

-- Make Wizzlecrank's Shredder an active object so he can respawn in original grid.
UPDATE `creature` SET `spawn_flags`=1 WHERE `id`=3439;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
