DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171228001655');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171228001655');
-- Add your query below.


-- Add minimum and maximum respawn time for creature spawns.
ALTER TABLE `creature`
	CHANGE COLUMN `spawntimesecs` `spawntimesecsmin` INT(10) UNSIGNED NOT NULL DEFAULT '120' AFTER `orientation`;

ALTER TABLE `creature`
	ADD COLUMN `spawntimesecsmax` INT(10) UNSIGNED NOT NULL DEFAULT '120' AFTER `spawntimesecsmin`;

UPDATE `creature` SET `spawntimesecsmax`=`spawntimesecsmin`;

-- Add minimum and maximum respawn time for gameobject spawns.
ALTER TABLE `gameobject`
	CHANGE COLUMN `spawntimesecs` `spawntimesecsmin` INT(11) NOT NULL DEFAULT '0' AFTER `rotation3`;

ALTER TABLE `gameobject`
	ADD COLUMN `spawntimesecsmax` INT(11) NOT NULL DEFAULT '0' AFTER `spawntimesecsmin`;

UPDATE `gameobject` SET `spawntimesecsmax`=`spawntimesecsmin`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
