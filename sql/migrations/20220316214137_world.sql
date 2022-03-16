DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220316214137');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220316214137');
-- Add your query below.


-- Change the war effort stage condition into a generic saved variable check.
UPDATE `conditions` SET `value3`=`value2`, `value2`=`value1`, `value1`=30050 WHERE `type`=11;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
