DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200622012614');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200622012614');
-- Add your query below.


-- Varimathras
UPDATE `creature` SET `orientation`='0.820305' WHERE  `guid`=31901;
UPDATE `creature_template` SET `display_scale1`='1.2' WHERE  `entry`=2425;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
