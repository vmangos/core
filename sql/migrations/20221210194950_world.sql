DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221210194950');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221210194950');
-- Add your query below.


-- Food Buff respawns in 20 seconds.
UPDATE `gameobject` SET `spawntimesecsmin`=20, `spawntimesecsmax`=20 WHERE `id`=179904;
-- Berserk Buff respawns in 120 seconds.
UPDATE `gameobject` SET `spawntimesecsmin`=120, `spawntimesecsmax`=120 WHERE `id`=179905;
-- Speed Buff respawns in 150 seconds.
UPDATE `gameobject` SET `spawntimesecsmin`=150, `spawntimesecsmax`=150 WHERE `id`=179871;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
