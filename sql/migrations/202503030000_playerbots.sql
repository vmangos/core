DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='202503030000');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('202503030000');
-- Add your query below.

-- Source: mod-playerbots-wotlk/data/sql/playerbots/updates/2025_03_03_00.sql
SET SESSION sql_mode=(SELECT REPLACE(@@SESSION.sql_mode,'NO_BACKSLASH_ESCAPES',''));

-- Delete existing entries from playerbots_travelnode, playerbots_travelnode_path, and playerbots_travelnode_link tables
DELETE FROM `playerbots_travelnode_link` WHERE `node_id` = 3780;
DELETE FROM `playerbots_travelnode_path` WHERE `node_id` = 3780;
DELETE FROM `playerbots_travelnode` WHERE `id` = 3780;

-- Insert new entries into playerbots_travelnode
INSERT INTO `playerbots_travelnode` (`id`, `name`, `map_id`, `x`, `y`, `z`, `linked`)
VALUES (3780, 'Highlord Mograine', 533, 2524.32, -2951.28, 245.633, 1);

-- Insert new entries into playerbots_travelnode_path
INSERT INTO `playerbots_travelnode_path` (`node_id`, `to_node_id`, `nr`, `map_id`, `x`, `y`, `z`)
VALUES
(3780, 472, 0, 533, 2524.32, -2951.28, 245.633),
(3780, 472, 1, 533, 2528.79, -2948.58, 245.633),
(3780, 757, 0, 533, 2524.32, -2951.28, 245.633),
(3780, 757, 1, 533, 2517.62, -2959.38, 245.636);

-- Insert new entries into playerbots_travelnode_link
INSERT INTO `playerbots_travelnode_link` (`node_id`, `to_node_id`, `type`, `object`, `distance`, `swim_distance`, `extra_cost`, `calculated`, `max_creature_0`, `max_creature_1`, `max_creature_2`)
VALUES
(3780, 472, 1, 0, 5.3221, 0, 0, 1, 83, 0, 0),
(3780, 757, 1, 0, 10.6118, 0, 0, 1, 83, 0, 0);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
