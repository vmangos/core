DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240109004448');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240109004448');
-- Add your query below.


-- Add missing single target flag to some spells. In 1.13 this data is in Attributes5 in SpellMisc.
UPDATE `spell_template` SET `customFlags`=(`customFlags` | 256) WHERE `entry` IN (118, 339, 700, 710, 1062, 1090, 1513, 2070, 2637, 2878, 5195, 5196, 5627, 5782, 6213, 6215, 6770, 8040, 9484, 9485, 9852, 9853, 10326, 10955, 11297, 11444, 12098, 12824, 12825, 12826, 14326, 14327, 15970, 16798, 18647, 18657, 18658, 19725, 19970, 19971, 19972, 19973, 19974, 19975, 28271, 28272);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
