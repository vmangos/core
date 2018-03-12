DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180228020350');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180228020350');
-- Add your query below.

UPDATE `creature_template` SET `minhealth`=470, `maxhealth`=500 WHERE `entry` in (6867,10656);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
