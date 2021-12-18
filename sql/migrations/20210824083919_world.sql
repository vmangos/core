DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210824083919');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210824083919');
-- Add your query below.


-- Fix mechanic immunity mask for cretures.
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 1073741824 WHERE (`mechanic_immune_mask` & 2147483648);
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` & ~2147483648 WHERE (`mechanic_immune_mask` & 2147483648);

-- Fix mechanic id for spells.
UPDATE `spell_template` SET `mechanic`=31 WHERE `mechanic`=32;
UPDATE `spell_template` SET `effectMechanic1`=31 WHERE `effectMechanic1`=32;
UPDATE `spell_template` SET `effectMechanic2`=31 WHERE `effectMechanic2`=32;
UPDATE `spell_template` SET `effectMechanic3`=31 WHERE `effectMechanic3`=32;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
