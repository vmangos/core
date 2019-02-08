DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181213235909');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181213235909');
-- Add your query below.


-- Remove second parameter from CONDITION_SOURCE_ENTRY.
UPDATE `conditions` SET `value2`=0 WHERE `type`=16;
-- Remove CONDITION_AREA_FLAG and use that type id for CONDITION_CANT_PATH_TO_VICTIM. 
UPDATE `conditions` SET `type`=13 WHERE `type`=48;
-- Remove CONDITION_LEARNABLE_ABILITY and use that type id for CONDITION_IS_PLAYER. 
UPDATE `conditions` SET `type`=28 WHERE `type`=49;
-- Change type id for CONDITION_OBJECT_IS_SPAWNED from 50 to 48.
UPDATE `conditions` SET `type`=48 WHERE `type`=50;
-- Change type id for CONDITION_OBJECT_LOOT_STATE from 51 to 49.
UPDATE `conditions` SET `type`=49 WHERE `type`=51;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
