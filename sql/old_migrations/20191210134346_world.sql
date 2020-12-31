DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191210134346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191210134346');
-- Add your query below.


-- Remove custom Un'Goro eggs trigger and use proper areatriggers.
DELETE FROM `creature` WHERE `id`=20005;
DELETE FROM `creature_template` WHERE `entry`=20005;
INSERT INTO `scripted_areatrigger` (`entry`, `script_name`) VALUES 
(1726, 'at_scent_larkorwi'),
(1727, 'at_scent_larkorwi'),
(1728, 'at_scent_larkorwi'),
(1729, 'at_scent_larkorwi'),
(1730, 'at_scent_larkorwi'),
(1731, 'at_scent_larkorwi'),
(1732, 'at_scent_larkorwi'),
(1733, 'at_scent_larkorwi'),
(1734, 'at_scent_larkorwi'),
(1735, 'at_scent_larkorwi'),
(1736, 'at_scent_larkorwi'),
(1737, 'at_scent_larkorwi'),
(1738, 'at_scent_larkorwi'),
(1739, 'at_scent_larkorwi'),
(1740, 'at_scent_larkorwi'),
(1766, 'at_scent_larkorwi');

-- Lar'korwi Mate should drop only 1 egg.
-- https://youtu.be/4h4rGWirV8U?t=33
UPDATE `creature_loot_template` SET `mincountOrRef`=1, `maxcount`=1 WHERE `entry`=9683 && `item`=11509;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
