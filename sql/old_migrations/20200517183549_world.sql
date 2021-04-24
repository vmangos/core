DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200517183549');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200517183549');
-- Add your query below.


-- add path for veron amberstill
UPDATE `creature` SET `movement_type`= 2 WHERE `id`= 1261;
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1261, 1, -5537.03, -1323.67, 398.8638, 100, 25000, 0, 0),
(1261, 2, -5539.6513, -1322.5054, 399.159, 100, 28000, 0, 0);

-- allow herd to roam
UPDATE `creature` SET `wander_distance` = 2, `movement_type` = 1 WHERE `guid` IN (95108, 4148, 4147, 95109, 4154, 95107);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
