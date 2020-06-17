DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200617221051');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200617221051');
-- Add your query below.

-- Shaethis Darkoak <Hippogryph Master>
-- .go xyzo -6422.4 -319.6 -0.9 4.9 1
UPDATE `creature` SET `position_x`=-6422.4, `position_y`=-319.6, `position_z`=-0.9, `orientation`=4.9 WHERE `id`=1233; 

-- Sulhasa <Wind Rider Master>
-- .go xyzo -6353.5 -249.8 -1.9 4.3 1
INSERT INTO `creature` VALUES (302713, 14242, 0, 0, 0, 1, 0, 0, -6353.5, -249.8, -1.9, 4.3, 420, 420, 0, 100, 100, 0, 0, 0, 0, 5);
INSERT INTO `creature_template` VALUES (14242, 0, 14306, 0, 0, 0, 1.25, 0, 0, 0, 100, 0, 0, 0, 100, 'Sulhasa', 'Wind Rider Master', 0, 55, 55, 7842, 7842, 0, 0, 0, 29, 11, 1, 1.14286, 20, 5, 0, 1, 1, 298, 427, 0, 100, 1, 1216, 1338, 1, 0, 0, 0, 0, 0, 0, 0, 58.872, 80.949, 100, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 774, '', 0, 3, 1, 0, 3, 1233, 0, 0, 0, 0, 0, '');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
