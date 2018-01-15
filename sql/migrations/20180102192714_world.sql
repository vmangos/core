DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180102192714');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180102192714');
-- Add your query below.

-- Mana pool report string for .npc info
insert into mangos_string values ('11017', 'Mana (base): %u. (max): %u. (current): %u.', NULL, 'Mana (base): %u. (max): %u. (actuel): %u.', NULL, NULL, NULL, NULL, NULL, NULL);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
