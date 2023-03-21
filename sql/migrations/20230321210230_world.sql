DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230321210230');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230321210230');
-- Add your query below.


-- This spawn should be of Door (179549) not Conservatory Door (176907).
UPDATE `gameobject` SET `id`=179549, `position_x`=351.568, `position_y`=88.6734, `position_z`=-36.393, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=397136;

-- This spawn should be of Conservatory Door (176907) not Door (179549).
UPDATE `gameobject` SET `id`=176907, `position_x`=131.286, `position_y`=-278.89, `position_z`=-56.5211, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=363231;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
