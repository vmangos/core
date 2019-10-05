DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190605174948');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190605174948');
-- Add your query below.


-- Add missing exit trigger in SFK when jumping off the keep.
INSERT INTO `areatrigger_teleport` (`id`, `patch`, `name`, `required_level`, `required_item`, `required_item2`, `required_quest_done`, `required_event`, `required_pvp_rank`, `required_team`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES (2406, 0, 'Shadowfang Keep - Falling out', 0, 0, 0, 0, 0, 0, 0, 0, -233.011, 1567.5, 76.8921, 4.27606);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
