DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251228022409');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251228022409');
-- Add your query below.

-- Fix broadcast text not displaying for Protector Gariel.
UPDATE `broadcast_text` SET `female_text`='' WHERE  `entry`=41;
UPDATE `broadcast_text` SET `male_text`='Defias activity reported on the costal horizon. All clear on Sentinel Hill.' WHERE  `entry`=41;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
