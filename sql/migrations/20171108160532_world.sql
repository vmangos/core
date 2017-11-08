DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171108160532');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171108160532');
-- Add your query below.

UPDATE `item_template` SET `spellcharges_1`='0', `spellcategory_1`='1153', `spellcategorycooldown_1`='120000' WHERE `entry`='19045' and`patch`='3';
UPDATE `item_template` SET `spellcharges_1`='0' WHERE `entry`='19046' and`patch`='3';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
