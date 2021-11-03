DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211103112507');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211103112507');
-- Add your query below.


-- Move PROC_EX_NO_PERIODIC to 0x0020000.
UPDATE `spell_proc_event` SET `procEx` = `procEx` | 0x0020000 WHERE (`procEx` & 0x0080000);
UPDATE `spell_proc_event` SET `procEx` = `procEx` - 0x0080000 WHERE (`procEx` & 0x0080000);

-- Make Elemental Focus proc on cast end.
UPDATE `spell_proc_event` SET `procEx` = `procEx` | 0x0080000 WHERE `entry`=16164;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
