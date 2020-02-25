DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200225215346');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200225215346');
-- Add your query below.

-- Vendor is missing Strong Fishing Pole: https://classic.wowhead.com/npc=3572/zizzek
DELETE FROM `npc_vendor` WHERE `entry` = '3572' AND `item` = '6365';
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES ('3572', '6365', '1', '7200');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
