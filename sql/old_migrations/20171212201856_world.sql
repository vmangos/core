DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171212201856');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171212201856');
-- Add your query below.

-- https://github.com/LightsHope/server/issues/757
UPDATE `gameobject_template` SET `data3`=24378 WHERE `entry`=179905;
UPDATE `gameobject_template` SET `data3`=24378 WHERE `entry`=179907;
UPDATE `spell_mod` SET `Custom`=2 WHERE `Id`=24378;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
