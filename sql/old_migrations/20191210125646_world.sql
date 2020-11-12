DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191210125646');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191210125646');
-- Add your query below.


-- Replace custom table text with broadcast text.
DELETE FROM `script_texts` WHERE `entry`=-1000001;

-- Remove custom creature used in Magmadar script.
DELETE FROM `creature_template` WHERE `entry`=20006;

-- Correct data for Lava Bomb gameobject.
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (177704, 6, 4452, 'Lava Bomb', 54, 64, 1, 0, 60, 5, 19428, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
