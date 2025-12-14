DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230921171542');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230921171542');

UPDATE `mangos_string` SET 
	`content_loc1` = CONCAT( `content_loc1` , ' '),
	`content_loc2` = CONCAT( `content_loc2` , ' '),
	`content_loc3` = CONCAT( `content_loc3` , ' '),
	`content_loc4` = CONCAT( `content_loc4` , ' '),
	`content_loc6` = CONCAT( `content_loc6` , ' '),
	`content_loc8` = CONCAT( `content_loc8` , ' ')
WHERE `entry` IN (30, 45, 61, 62, 100, 206, 439, 441, 514, 515, 516, 518, 519, 520, 581, 1137, 1400, 1401, 1402, 1403, 1404, 1405, 
	1406, 1407, 1408, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422, 1423, 1424, 1425, 1426, 
	1427, 1428, 1429, 1430, 1431, 1432, 1433, 2003, 2004, 2017, 2018, 2019, 2020, 2021, 2025, 2030, 618, 1176);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
