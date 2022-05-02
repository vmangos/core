DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220502012000');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220502012000');
-- Add your query below.

-- set shadowforge senators and arena spectator faction to dark iron dwarves based on sniff data
UPDATE creature_template SET faction = 54 WHERE entry = 8904 AND patch = 0;
UPDATE creature_template SET faction = 54 WHERE entry = 8916 AND patch = 0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;

