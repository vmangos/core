DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171013060930');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171013060930');

-- Druid T3: Restore power on rejuv tick, only proc for period spells @ 50% chance per tick
UPDATE `spell_proc_event` SET `procEx` = 0x0040000, `CustomChance` = 50 WHERE `entry` = 28716;

-- Druid T3: Increase target HP with a stacking buff on regrowth tick and cast
-- Proc for hit, crit and periodic ticks
UPDATE `spell_proc_event` SET `procEx` = 0x0000001 | 0x0000002 | 0x0040000 WHERE `entry` = 28744;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
