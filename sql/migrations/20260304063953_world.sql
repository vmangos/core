DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260304063953');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260304063953');
-- Add your query below.

INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`)
VALUES
(1167,3383.38,-348.25,140.408,5.27568,1,'ThistlefurVillage'),
(1168,3383.17,-648.363,177.342,5.29532,1,'ThistlefurHold');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
