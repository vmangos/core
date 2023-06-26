DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230626135523');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230626135523');
-- Add your query below.


SET @OGUID = 263;
SET @PTEMPLATE = 3290;

-- Arathi Highlands 45
DELETE FROM `gameobject` WHERE `guid` IN (16645, 16644);
DELETE FROM `pool_gameobject` WHERE `guid` IN (16645, 16644);
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (16645, 16644));

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 180682, 0, -2183.26, -1867.59, 0, 0.069813, 0, 0, 0.034899, 0.999391, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+2, 180682, 0, -2066.96, -2050.27, 0, -1.90241, 0, 0, 0.814116, -0.580703, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+3, 180682, 0, -2285.67, -1896.8, 0, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+4, 180682, 0, -2226.57, -1850.21, 0, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+5, 180682, 0, -2098.93, -1977.7, 0, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+6, 180683, 0, -2183.26, -1867.59, 0, 0.069813, 0, 0, 0.034899, 0.999391, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+7, 180683, 0, -2066.96, -2050.27, 0, -1.90241, 0, 0, 0.814116, -0.580703, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+8, 180683, 0, -2285.67, -1896.8, 0, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+9, 180683, 0, -2226.57, -1850.21, 0, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+10, 180683, 0, -2098.93, -1977.7, 0, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+11, 180685, 0, -2183.26, -1867.59, 0, 0.069813, 0, 0, 0.034899, 0.999391, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+12, 180685, 0, -2066.96, -2050.27, 0, -1.90241, 0, 0, 0.814116, -0.580703, 3600, 3600, 100, 1, 0, 0, 7, 10),
(@OGUID+13, 180685, 0, -2285.67, -1896.8, 0, 6.26573, 0, 0, -0.00872612, 0.999962, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+14, 180685, 0, -2226.57, -1850.21, 0, 5.84685, 0, 0, -0.216439, 0.976296, 180, 180, 100, 1, 0, 0, 7, 10),
(@OGUID+15, 180685, 0, -2098.93, -1977.7, 0, 3.15906, 0, 0, -0.999962, 0.00873464, 180, 180, 100, 1, 0, 0, 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@PTEMPLATE+2, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@PTEMPLATE+3, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@PTEMPLATE+4, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@PTEMPLATE+5, 1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+2, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+3, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+4, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+5, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+6, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+7, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+8, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+9, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+10, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+11, @PTEMPLATE+1, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+12, @PTEMPLATE+2, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+13, @PTEMPLATE+3, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+14, @PTEMPLATE+4, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10),
(@OGUID+15, @PTEMPLATE+5, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 7, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 3, 'Arathi Highlands - Oily Blackmouth School / Firefin Snapper School / Floating Wreckage (Master Pool)', 0, 0, 7, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 0),
(@PTEMPLATE+2, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 0),
(@PTEMPLATE+3, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 0),
(@PTEMPLATE+4, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 0),
(@PTEMPLATE+5, @PTEMPLATE+6, 0, 'Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands', 0);

UPDATE `pool_gameobject` SET `chance` = 60 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180682);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180683);
UPDATE `pool_gameobject` SET `chance` = 20 WHERE `description` = "Oily Blackmouth School / Firefin Snapper School / Floating Wreckage - Arathi Highlands" && `guid` IN (SELECT `guid` FROM `gameobject` WHERE `id` = 180685);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
