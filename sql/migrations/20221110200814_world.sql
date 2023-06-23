DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221110200814');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221110200814');
-- Add your query below.

-- Mailbox at bloodvenom post doesn't exist in vanilla
DELETE FROM `gameobject` WHERE `guid`=48827;

-- Duplicate campfire  gameobject
DELETE FROM `gameobject` WHERE `guid`=48822;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
