DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190719161352');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190719161352');
-- Add your query below.


-- Make enemy spirit healers invisible.
UPDATE `creature_template` SET `flags_extra`=`flags_extra`+262144 WHERE `entry` IN (13116, 13117);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
