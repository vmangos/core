DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210528111136');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210528111136');
-- Add your query below.


-- Triggered dot aura by Wyvern Sting should be a debuff.
UPDATE `spell_template` SET `customFlags`=`customFlags` | 2 WHERE `entry` IN (24131, 24134, 24135);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
