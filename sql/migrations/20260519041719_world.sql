DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260519041719');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260519041719');
-- Add your query below.


-- Special bags should have bag family assigned.
UPDATE `item_template` SET `bag_family`=3 WHERE `class`=1 && `subclass`=1;
UPDATE `item_template` SET `bag_family`=6 WHERE `class`=1 && `subclass`=2;
UPDATE `item_template` SET `bag_family`=7 WHERE `class`=1 && `subclass`=3;
UPDATE `item_template` SET `bag_family`=1 WHERE `class`=11 && `subclass`=2;
UPDATE `item_template` SET `bag_family`=2 WHERE `class`=11 && `subclass`=3;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
