DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250310213622');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20250310213622');
-- Add your query below.

DELETE FROM script_texts where entry in (
-1409006,
-1409004,
-1000010,
-1000011,
-1000012,
-1000013,
-1000014,
-1000015,
-1000016
);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
