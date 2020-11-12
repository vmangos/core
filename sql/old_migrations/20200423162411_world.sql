DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200423162411');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200423162411');
-- Add your query below.


-- Fix equipment for two npcs in Stormwind.
DELETE FROM `creature_addon` WHERE `guid`=79776;
DELETE FROM `creature_addon` WHERE `guid`=79750;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=79750;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
