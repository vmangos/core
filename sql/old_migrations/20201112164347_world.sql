DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201112164347');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201112164347');
-- Add your query below.


-- Add auras to Wickerman Guardian.
UPDATE `creature_template` SET `auras`='12187' WHERE `entry`=15195;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
