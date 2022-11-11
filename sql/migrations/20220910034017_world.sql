DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220910034017');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220910034017');
-- Add your query below.


-- Make Shadowguard proc on absorb.
UPDATE `spell_proc_event` SET `procEx`= (1 | 2 | 1024) WHERE `entry`=18137;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
