DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231024223737');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231024223737');
-- Add your query below.


-- Punctured Voodoo Doll should only drop from Jinxed Hoodoo Pile.
DELETE FROM `creature_loot_template` WHERE `item` IN (19813, 19814, 19815, 19816, 19817, 19818, 19819, 19820, 19821);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
