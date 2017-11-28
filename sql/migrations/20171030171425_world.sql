DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171030171425');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171030171425');
-- Add your query below.

UPDATE `creature_template` SET `spell1` = '0' WHERE `spell1` = '1604';
UPDATE `creature_template` SET `spell2` = '0' WHERE `spell2` = '1604';
UPDATE `creature_template` SET `spell3` = '0' WHERE `spell3` = '1604';
UPDATE `creature_template` SET `spell4` = '0' WHERE `spell4` = '1604';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
