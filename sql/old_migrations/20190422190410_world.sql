DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190422190410');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190422190410');
-- Add your query below.


-- Add triggered flag to spells that are cast every second.
UPDATE `creature_spells` SET `castFlags_1`=`castFlags_1`+2 WHERE `entry` IN (57090, 101820, 109460, 152070, 153120);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
