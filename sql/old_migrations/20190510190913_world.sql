DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190510190913');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190510190913');
-- Add your query below.


-- These spells should require facing the target.
UPDATE `spell_template` SET `customFlags`=`customFlags`+128 WHERE `entry` IN (781, 1510, 2480, 2537, 5254, 6226, 7918, 7919, 8131, 8823, 8824, 10336, 10337, 10874, 10875, 10876, 11703, 11704, 14267, 14268, 14272, 14273, 14274, 14275, 14276, 14277, 14279, 14280, 14294, 14295, 14296, 15629, 15630, 15631, 15632, 18930, 18931, 18932, 22858, 25200, 26652, 28317, 28407, 29163, 30012);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
