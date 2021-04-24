DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200326133126');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200326133126');
-- Add your query below.


-- Cultist near Rakaiah should not be moving.
UPDATE `creature` SET `wander_distance`=0, `movement_type`=0 WHERE `guid` IN (40659, 40665);
UPDATE `creature` SET `position_x`=5210.24, `position_y`=-573.692, `position_z`=287.41, `orientation`=2.74017 WHERE `guid`=40659;
UPDATE `creature` SET `position_x`=5205.97, `position_y`=-564.198, `position_z`=287.41, `orientation`=4.08407 WHERE `guid`=40665;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
