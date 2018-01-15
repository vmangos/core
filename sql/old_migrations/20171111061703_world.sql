DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171111061703');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171111061703');
-- Add your query below.

ALTER TABLE `areatrigger_teleport` ADD COLUMN `required_event` int DEFAULT 0 AFTER `required_quest_done`;
ALTER TABLE `areatrigger_teleport` ADD COLUMN `required_pvp_rank` mediumint unsigned DEFAULT 0 AFTER `required_event`;
ALTER TABLE `areatrigger_teleport` ADD COLUMN `required_team` mediumint unsigned DEFAULT 0 AFTER `required_pvp_rank`;
-- Hall of Legends requires rank 6, Horde only
UPDATE `areatrigger_teleport` SET `required_pvp_rank` = 6, `required_team` = 67 WHERE `id` = 2527;
-- Champion's Hall requires rank 6, Alliance only
UPDATE `areatrigger_teleport` SET `required_pvp_rank` = 6, `required_team` = 469 WHERE `id` = 2532;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
