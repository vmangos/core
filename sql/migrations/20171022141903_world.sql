DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171022141903');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171022141903');
-- Add your query below.

-- Blood of Heroes dynamic and random spawn timers
UPDATE `gameobject` SET `spawnFlags`=12 WHERE id IN (176213,176214);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
