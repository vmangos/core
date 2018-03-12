DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180201190458');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180201190458');
-- Add your query below.

INSERT INTO `spell_mod` (`Id`, `Attributes`, `Comment`) VALUES (23418, 0x00000800 | 0x04000000, 'Nefarian Paladin class call debuff - negative');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
