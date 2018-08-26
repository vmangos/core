DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180807095933');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180807095933');
-- Add your query below.

DELETE FROM `reference_loot_template` WHERE `entry`='12005';

DELETE FROM `gameobject_loot_template` WHERE `entry`='12260' and`item`='12005';

REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('12260', '11920', '0', '1', '1', '1', '0', '0', '10'),
('12260', '11921', '0', '2', '1', '1', '0', '0', '10'),
('12260', '11922', '0', '2', '1', '1', '0', '0', '10'),
('12260', '11923', '0', '1', '1', '1', '0', '0', '10'),
('12260', '11925', '0', '2', '1', '1', '0', '0', '10'),
('12260', '11926', '0', '1', '1', '1', '0', '0', '10'),
('12260', '11927', '0', '2', '1', '1', '0', '0', '10'),
('12260', '11929', '0', '1', '1', '1', '0', '0', '10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
