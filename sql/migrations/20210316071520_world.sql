DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210316071520');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210316071520');
-- Add your query below.


-- Change despawn type of Mana Surges.
UPDATE `event_scripts` SET `dataint4`=2 WHERE `id`=1653 && `command`=10;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
