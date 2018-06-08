DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180523010255');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180523010255');
-- Add your query below.

UPDATE `creature_loot_template` SET `item`='30554', `groupid`='0', `mincountOrRef`='-30554' WHERE `entry`='9019' and`item`='30229' and`groupid`='1';
UPDATE `creature_loot_template` SET `item`='30553', `mincountOrRef`='-30553' WHERE `entry`='9019' and`item`='30229' and`groupid`='0';

DELETE FROM `creature_loot_template` WHERE `entry`='9019' and`item`='11684' and`groupid`='0';

DELETE FROM `reference_loot_template` WHERE `entry`='30229';

REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('30553', '11684', '1', '1', '1', '1', '0', '0', '10'),
('30553', '11815', '0', '1', '1', '1', '0', '0', '10'), 
('30553', '11930', '0', '1', '1', '1', '0', '0', '10'), 
('30553', '11931', '0', '1', '1', '1', '0', '0', '10'), 
('30553', '11933', '0', '1', '1', '1', '0', '0', '10'), 
('30553', '22204', '0', '1', '1', '1', '0', '8', '10'),
('30554', '11924', '0', '1', '1', '1', '0', '0', '10'),
('30554', '11928', '0', '1', '1', '1', '0', '0', '10'),
('30554', '11932', '0', '1', '1', '1', '0', '0', '10'),
('30554', '11934', '0', '1', '1', '1', '0', '0', '10'),
('30554', '22207', '0', '1', '1', '1', '0', '8', '10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
