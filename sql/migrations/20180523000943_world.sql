DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180523000943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180523000943');
-- Add your query below.

DELETE FROM `creature_loot_template` WHERE `entry`='10440' and `item`='13505' and `groupid`='0';
UPDATE `creature_loot_template` SET `item`='30555', `mincountOrRef`='-30555' WHERE `entry`='10440' and `item`='30287' and `groupid`='0';
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('10440', '30556', '100', '0', '-30556', '1', '0', '8', '10');

DELETE FROM `reference_loot_template` WHERE `entry`='30287';

REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES
('30555', '13340', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13344', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13345', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13346', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13349', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13361', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13368', '0', '1', '1', '1', '0', '0', '10'),
('30555', '13505', '1', '1', '1', '1', '0', '0', '10'),
('30556', '22408', '0', '1', '1', '1', '0', '8', '10'),
('30556', '22409', '0', '1', '1', '1', '0', '8', '10'),
('30556', '22410', '0', '1', '1', '1', '0', '8', '10'),
('30556', '22411', '0', '1', '1', '1', '0', '8', '10'),
('30556', '22412', '0', '1', '1', '1', '0', '8', '10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
