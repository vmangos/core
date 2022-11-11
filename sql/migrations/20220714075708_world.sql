DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220714075708');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220714075708');
-- Add your query below.


-- Battered Junkbox should not drop from mobs. It's only pickpocketed. 
DELETE FROM `creature_loot_template` WHERE `item`=16882;
UPDATE `creature_template` SET `loot_id`=0 WHERE `loot_id`=12352;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
