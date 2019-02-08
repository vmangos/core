DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190124061618');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190124061618');
-- Add your query below.


-- Use percent health and mana in creature spawn table.
ALTER TABLE `creature`
	CHANGE COLUMN `curhealth` `curhealth` FLOAT NOT NULL DEFAULT '100' AFTER `currentwaypoint`,
	CHANGE COLUMN `curmana` `curmana` FLOAT UNSIGNED NOT NULL DEFAULT '100' AFTER `curhealth`;

UPDATE `creature` SET `curhealth`=100 WHERE `curhealth` > 0;
UPDATE `creature` SET `curhealth`=60 WHERE `id` IN (12423, 12427, 12428, 12429, 12430);
UPDATE `creature` SET `curhealth`=29 WHERE `id`=13020;
UPDATE `creature` SET `curmana`=100 WHERE `curmana` > 0;
    

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
