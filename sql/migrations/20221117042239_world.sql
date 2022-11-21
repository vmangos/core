DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221117042239');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221117042239');
-- Add your query below.


-- Fix unit flags of Darrowshire Poltergeist.
UPDATE `creature_template` SET `faction`=35, `unit_flags`=33555208 WHERE `entry`=11296;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
