DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201125032226');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201125032226');
-- Add your query below.


-- Correct location of existing objects.
UPDATE `gameobject` SET `position_x`=3082.94, `position_y`=-3554.52, `position_z`=132.872, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=19970;
UPDATE `gameobject` SET `position_x`=3181.9, `position_y`=-3130.97, `position_z`=154.537, `orientation`=1.16937, `rotation0`=0, `rotation1`=0, `rotation2`=0.551936, `rotation3`=0.833886 WHERE `guid`=20094;
UPDATE `gameobject` SET `position_x`=2495.23, `position_y`=-4580.06, `position_z`=78.383, `orientation`=4.10152, `rotation0`=0, `rotation1`=0, `rotation2`=-0.887011, `rotation3`=0.461749 WHERE `guid`=19905;
UPDATE `gameobject` SET `position_x`=2019.04, `position_y`=-4695.94, `position_z`=91.3082, `orientation`=2.94959, `rotation0`=0, `rotation1`=0, `rotation2`=0.995396, `rotation3`=0.0958512 WHERE `guid`=19955;
UPDATE `gameobject` SET `position_x`=1711.95, `position_y`=-3935.5, `position_z`=130.9, `orientation`=4.55531, `rotation0`=0, `rotation1`=0, `rotation2`=-0.760405, `rotation3`=0.649449 WHERE `guid`=19910;
UPDATE `gameobject` SET `position_x`=2239.62, `position_y`=-5264.17, `position_z`=75.2423, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=20127;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
