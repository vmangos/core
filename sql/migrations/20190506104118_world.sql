DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190506104118');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190506104118');
-- Add your query below.


-- These items should be marked as unobtainable.
UPDATE `item_template` SET `extra_flags`=`extra_flags`+4 WHERE `entry` IN (3034, 5105, 5517, 5518, 7027, 8827, 12772, 13460, 15141, 17967, 17968, 22728);
UPDATE `item_template` SET `patch`=7 WHERE `entry`=7027 && `patch`=10;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
