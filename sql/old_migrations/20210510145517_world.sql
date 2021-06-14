DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210510145517');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210510145517');
-- Add your query below.


-- The family field is not specific to beasts, its about pets.
ALTER TABLE `creature_template`
	CHANGE COLUMN `beast_family` `pet_family` TINYINT(4) NOT NULL DEFAULT '0' AFTER `dynamic_flags`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
