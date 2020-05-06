DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200408195451');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200408195451');
-- Add your query below.


-- Add missing target for Test Ribbon Pole Channel.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES (29705, 1, 17066);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
