DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230714152637');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230714152637');
-- Add your query below.


-- Blackfathom Deeps / 75295 / 75298 / Large Iron Bound Chest / Large Solid Chest
SET @OGUID = 2175;
SET @PTEMPLATE = 3525;

DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (32688, 32684, 25447));
DELETE FROM `gameobject` WHERE `guid` IN (32688, 32684, 25447);
DELETE FROM `pool_gameobject` WHERE `guid` IN (32688, 32684, 25447);

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@OGUID+1, 75295, 48, -743.061, -111.067, -30.0483, 1.48353, 0, 0, 0.67559, 0.737277, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+2, 75295, 48, -466.738, -87.5996, -39.1289, 2.93214, 0, 0, 0.994521, 0.104536, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+3, 75295, 48, -450.61, -38.0686, -31.7772, 3.08923, 0, 0, 0.999657, 0.026177, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+4, 75295, 48, -517.169, 34.4384, -46.3221, 5.14872, 0, 0, -0.537299, 0.843392, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+5, 75295, 48, -690.061, -48.8172, -30.0333, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+6, 75298, 48, -743.061, -111.067, -30.0483, 1.48353, 0, 0, 0.67559, 0.737277, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+7, 75298, 48, -466.738, -87.5996, -39.1289, 2.93214, 0, 0, 0.994521, 0.104536, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+8, 75298, 48, -450.61, -38.0686, -31.7772, 3.08923, 0, 0, 0.999657, 0.026177, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+9, 75298, 48, -517.169, 34.4384, -46.3221, 5.14872, 0, 0, -0.537299, 0.843392, 604800, 604800, 100, 1, 0, 0, 0, 10),
(@OGUID+10, 75298, 48, -690.061, -48.8172, -30.0333, 2.26893, 0, 0, 0.906307, 0.422619, 604800, 604800, 100, 1, 0, 0, 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+1, 1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+2, 1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+3, 1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+4, 1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@PTEMPLATE+5, 1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `description`, `patch_min`, `patch_max`) VALUES 
(@OGUID+1, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+2, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+3, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+4, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+5, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+6, @PTEMPLATE+1, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+7, @PTEMPLATE+2, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+8, @PTEMPLATE+3, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+9, @PTEMPLATE+4, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10),
(@OGUID+10, @PTEMPLATE+5, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0, 10);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@PTEMPLATE+6, 2, 'Blackfathom Deeps - Large Iron Bound Chest / Large Solid Chest (Master Pool)', 0, 0, 0, 10);
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES
(@PTEMPLATE+1, @PTEMPLATE+6, 0, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0),
(@PTEMPLATE+2, @PTEMPLATE+6, 0, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0),
(@PTEMPLATE+3, @PTEMPLATE+6, 0, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0),
(@PTEMPLATE+4, @PTEMPLATE+6, 0, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0),
(@PTEMPLATE+5, @PTEMPLATE+6, 0, 'Large Iron Bound Chest / Large Solid Chest - Blackfathom Deeps', 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
