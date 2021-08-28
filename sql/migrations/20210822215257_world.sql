DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210822215257');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210822215257');
-- Add your query below.


-- Fix Wyvern Sting not being removed on taking damage.
UPDATE `spell_template` SET `procCharges`=1 WHERE (`procFlags` & 1048576) && (`auraInterruptFlags` & 2) && (`procCharges` = 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
