DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180622235102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180622235102');
-- Add your query below.


-- Orwin's Shovel
INSERT INTO `spell_script_target` VALUES (11757, 0, 144050);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
