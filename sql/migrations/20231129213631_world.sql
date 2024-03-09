DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231129213631');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231129213631');
-- Add your query below.


-- Custom server side trap for Bubbly Fissures. 
-- We cannot know the entry of the real trap,
-- since its server side, so we need to use custom entry.
INSERT INTO `gameobject_template` (`entry`, `patch`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `script_name`) VALUES (200002, 0, 6, 344, 'Bubbly Fissure TRAP', 0, 0, 1, 0, 0, 8, 17775, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (14518, 200002, 1, -1275.51, -3012.4, 71.2432, -2.86234, -0.007825, 0.086912, 0.986437, -0.139019, 10, 10, 100, 1, 0, 0, 0, 10);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES (14521, 200002, 1, 89.9668, -1943.97, 78.7301, 1.6057, 0, 0, 0.687357, 0.726319, 10, 10, 100, 1, 0, 0, 0, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
