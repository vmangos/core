DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241229001108');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241229001108');
-- Add your query below.


-- Naglering was not unique before 1.10.
UPDATE `item_template` SET `max_count`=0 WHERE `entry`=11669 AND `patch`=0;

-- Acidic Walkers correct stat order before 1.10.
UPDATE `item_template` SET `stat_type2`=3, `stat_value2`=4, `stat_type3`=6, `stat_value3`=7 WHERE `entry`=9454 AND `patch`=0;

-- Backusarian Gauntlets correct stat order before 1.10.
UPDATE `item_template` SET `stat_type2`=6, `stat_value2`=14, `stat_type3`=7, `stat_value3`=15 WHERE `entry`=12637 AND `patch`=0;

-- Cadaverous Leggings correct stat order before 1.10.
UPDATE `item_template` SET `stat_type2`=3, `stat_value2`=12, `stat_type3`=4, `stat_value3`=10 WHERE `entry`=14638 AND `patch`=0;

-- Boots of the Shrieker correct stat order before 1.10.
UPDATE `item_template` SET `stat_type3`=4, `stat_type4`=7 WHERE `entry`=13398 AND `patch`=0;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
