DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171019212730');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171019212730');
-- Add your query below.

-- low level ores
UPDATE `gameobject` SET `spawntimesecs`=900 WHERE `id` IN (1610,1667,1731,1732,1733,2054,2055,3763,3764,73940,103711,103713,1731,1732,1733) and map IN (0,1);

-- mid level ores
UPDATE `gameobject` SET `spawntimesecs`=1800 WHERE `id` IN (1734,1735,2040,73941,123310,150079,176645) and map IN (0,1);

-- high level ores
UPDATE `gameobject` SET `spawntimesecs`=2700 WHERE `id` IN (324,2047,123309,123848,150081,150082,165658,175404,176643,177388) and map IN (0,1);

-- low level herbs
UPDATE `gameobject` SET `spawntimesecs`=900 WHERE `id` IN (1617,1618,1619,1620,1621,2045) and map IN (0,1);

-- mid level herbs
UPDATE `gameobject` SET `spawntimesecs`=1800 WHERE `id` IN (1622,1623,1624,1628,2041,2042,2043,2044,2046) and map IN (0,1);

-- high level herbs
UPDATE `gameobject` SET `spawntimesecs`=2700 WHERE `id` IN (2866,142140,142141,142142,142143,142144,142145,176583,176584,176586,176587,176588,176642) and map IN (0,1);

-- black lotus
UPDATE `gameobject` SET `spawntimesecs`=3600 WHERE `id` IN (176589) and map IN (0,1);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
