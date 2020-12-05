DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201129150128');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201129150128');
-- Add your query below.


-- Remove attributes hack from Essence of the Red.
DELETE FROM `spell_mod` WHERE `ID`=23513;

-- Hack school instead.
UPDATE `spell_template` SET `school`=1 WHERE `entry`=23513;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
