DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180406031630');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180406031630');
-- Add your query below.

-- Disable backing up for bosses.
UPDATE `creature_template` SET `flags_extra`=`flags_extra`+32768 WHERE `rank`=3;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
