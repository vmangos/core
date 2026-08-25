DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260816040508');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260816040508');
-- Add your query below.


-- Correct Black Guard Swordsmith position to sniff
UPDATE `gameobject_scripts` SET `x`=3820.96142578125, `y`=-3707.0078125, `z`=143.568634033203125, `o`=1.256637096405029296 WHERE `id`=42959;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
