DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210525161813');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210525161813');
-- Add your query below.


-- Copper Veins in Ashenvale wrongfully assigned to Stonetalon pool.
UPDATE `pool_gameobject` SET `pool_entry`=1075 WHERE `guid` IN (4874, 4877, 4878, 4879, 4880, 4887, 4888, 4889, 4890, 4891, 5072, 5180, 30194, 30195, 33545, 48108, 48110, 48113, 48114);

-- Copper Veins in Barrens wrongfully assigned to Stonetalon pool.
UPDATE `pool_gameobject` SET `pool_entry`=1033 WHERE `guid` IN (4831, 15484, 15483);

-- Copper Veins in Desolace wrongfully assigned to Stonetalon pool.
UPDATE `pool_gameobject` SET `pool_entry`=1139 WHERE `guid` IN (4737, 5047, 5416, 20647, 20646, 20645, 34159);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
