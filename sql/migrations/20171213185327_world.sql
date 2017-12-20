DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171213185327');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171213185327');
-- Add your query below.

-- Empyrean Demolisher proc rate
UPDATE `item_template` SET `spellppmRate_1`=1 WHERE `entry`=17112;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
