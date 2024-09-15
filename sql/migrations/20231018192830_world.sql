DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231018192830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231018192830');
-- Add your query below.

UPDATE `spell_affect` SET `build_min`='5875' WHERE  `entry`=14113 AND `effectId`=0;
UPDATE `spell_affect` SET `build_min`='5875' WHERE  `entry`=14114 AND `effectId`=0;
UPDATE `spell_affect` SET `build_min`='5875' WHERE  `entry`=14115 AND `effectId`=0;
UPDATE `spell_affect` SET `build_min`='5875' WHERE  `entry`=14116 AND `effectId`=0;
UPDATE `spell_affect` SET `build_min`='5875' WHERE  `entry`=14117 AND `effectId`=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
