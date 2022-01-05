DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220105011323');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220105011323');
-- Add your query below.


-- Fix: Have Princess Moira Bronzebeard summon visible portal to Ironforge
UPDATE `spell_template` SET `effect1`='50', `effectMiscValue1`='176497' WHERE  `entry`=13912 AND `build`=4222;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
