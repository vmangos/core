DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171114071349');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171114071349');
-- Add your query below.

-- Set MC Formula/Pattern/Schematic pool to 10% drop rather than 1%, yielding a
-- 1% chance per item rather than 0.1% chance.
-- https://web.archive.org/web/20070129142639/http://wow.allakhazam.com:80/item.html?witem=18260
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = 10 WHERE `mincountOrRef` = -34011;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
