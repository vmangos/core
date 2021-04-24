DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200515034808');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200515034808');
-- Add your query below.


-- Add missing sign object spawns.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`) VALUES 
(42103, 3229, 1, -94.8737, -4739.08, 24.7169, 0, 0, 1, 0, 7200, 7200, 1, 100),
(42104, 3230, 1, -94.0994, -4739, 24.664, 0, 0, 0, 1, 7200, 7200, 1, 100),
(42105, 3235, 1, -94.1309, -4739, 23.8332, 0, 0, 0, 1, 7200, 7200, 1, 100),
(42106, 38927, 0, -6383.81, 1252.43, 8.34384, 0, 0, -0.75471, 0.656059, 7200, 7200, 1, 100),
(42107, 123215, 0, -4020.33, -1407.01, 155.454, 0, 0, 0.710185, 0.704015, 7200, 7200, 1, 100),
(42108, 123216, 0, -4020.05, -1407.16, 155.463, 0, 0, 1, 0, 7200, 7200, 1, 100),
(42109, 123217, 0, -4020.05, -1407.01, 155.437, 0, 0, 0.004363, 0.99999, 7200, 7200, 1, 100);

-- Add missing Talon Den object spawns from mangos zero.
-- https://github.com/mangoszero/database/commit/b4d849d77bd03d31e71dfe8108de98b56ce29c87
INSERT INTO `gameobject` (`guid`, `id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecsmin`,`spawntimesecsmax`,`animprogress`,`state`) VALUES
(42110, 152093, 1, 2511.77, 1986.62, 347.705, 3.7958, 0, 0, 0.0524759, 0.998622, 7200, 7200, 100, 1),
(42111, 152093, 1, 2501.17, 1911.33, 344.059, 1.0414, 0, 0, 0.0524759, 0.998622, 7200, 7200, 100, 1),
(42112, 152093, 1, 2403.67, 1809.85, 359.99, 0.403666, 0, 0, 0.0524759, 0.998622, 7200, 7200, 100, 1),
(42113, 152093, 1, 2445.36, 1994.02, 339.368, 6.27765, 0, 0, 0.00276556, -0.999996, 7200, 7200, 100, 1),
(42114, 152093, 1, 2457.19, 1931.27, 362.05, 0.306274, 0, 0, 0.152539, 0.988297, 7200, 7200, 100, 1),
(42115, 152093, 1, 2470.74, 1863.08, 348.472, 4.67701, 0, 0, 0.719504, -0.694488, 7200, 7200, 100, 1),
(42116, 152093, 1, 2460.92, 1798, 352.504, 2.94677, 0, 0, 0.995259, 0.0972552, 7200, 7200, 100, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
