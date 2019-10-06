DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190302155127');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190302155127');
-- Add your query below.


-- We have a dedicated column for school immunities.
UPDATE `creature_template` SET `holy_res`=0, `school_immune_mask`=`school_immune_mask`+2 WHERE `holy_res` < 0;
UPDATE `creature_template` SET `fire_res`=0, `school_immune_mask`=`school_immune_mask`+4 WHERE `fire_res` < 0;
UPDATE `creature_template` SET `nature_res`=0, `school_immune_mask`=`school_immune_mask`+8 WHERE `nature_res` < 0;
UPDATE `creature_template` SET `frost_res`=0, `school_immune_mask`=`school_immune_mask`+16 WHERE `frost_res` < 0;
UPDATE `creature_template` SET `shadow_res`=0, `school_immune_mask`=`school_immune_mask`+32 WHERE `shadow_res` < 0;
UPDATE `creature_template` SET `arcane_res`=0, `school_immune_mask`=`school_immune_mask`+64 WHERE `arcane_res` < 0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
