DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190802210938');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190802210938');
-- Add your query below.


-- Fix default equipment for Mr. Smite.
REPLACE INTO `creature_equip_template` (`entry`, `patch`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES (646, 0, 2179, 0, 0);

-- Remove not needed text entries. We use broadcast texts.
DELETE FROM `script_texts` WHERE `entry` IN (-1036002, -1036003);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
