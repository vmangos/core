DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180517180736');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180517180736');
-- Add your query below.


-- Remove broken transition when flying from Azshara to Tanaris.
DELETE FROM `taxi_path_transitions` WHERE `inPath`=446 && `outPath`=222;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
