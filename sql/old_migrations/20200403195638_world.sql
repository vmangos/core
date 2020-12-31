DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200403195638');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200403195638');
-- Add your query below.


-- Remove not used db script.
DELETE FROM `event_scripts` WHERE `id`=8420;

-- Correct type of dreadstead ritual circle. This fixes the animation.
UPDATE `gameobject_template` SET `type`=0, `flags`=20 WHERE `entry`=179668;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
