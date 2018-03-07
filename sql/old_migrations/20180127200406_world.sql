DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180127200406');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180127200406');
-- Add your query below.

-- Remove depracated text table.
DROP TABLE `nostalrius_string`;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
