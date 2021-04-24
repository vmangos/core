DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210312134320');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210312134320');
-- Add your query below.


-- Correct auras used by Syndicate Highwayman.
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=2586);
UPDATE `creature_template` SET `auras`='7939 22766' WHERE `entry`=2586;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
