DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171108161754');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171108161754');
-- Add your query below.

UPDATE `item_template` SET `AllowableRace`='-1' WHERE `entry`='18422' and`patch`='1';
UPDATE `item_template` SET `AllowableRace`='-1' WHERE `entry`='18423' and`patch`='1';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
