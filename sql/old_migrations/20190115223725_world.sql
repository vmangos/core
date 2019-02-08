DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190115223725');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190115223725');
-- Add your query below.


-- Add proc ex to Fear Ward so it triggers properly. Note that whether
-- the spell procs Fear Ward or not is hardcoded, since it depends on
-- the mechanic type of the proc spell (MECHANIC_FEAR)
INSERT INTO `spell_proc_event` (`entry`, `procFlags`, `procEx`) VALUES (6346, 0x00022000, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
