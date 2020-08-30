DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200830034909');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200830034909');
-- Add your query below.


-- Flask of Petrification  should not stack with other flasks.
UPDATE `spell_elixir` SET `mask`=3 WHERE `entry`=17624;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
