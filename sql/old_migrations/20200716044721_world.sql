DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200716044721');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200716044721');
-- Add your query below.


-- Rename broadcast text fields to lower case style.
ALTER TABLE `gossip_menu_option`
	CHANGE COLUMN `OptionBroadcastTextID` `option_broadcast_text` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `option_text`,
	CHANGE COLUMN `BoxBroadcastTextID` `box_broadcast_text` MEDIUMINT(6) UNSIGNED NOT NULL DEFAULT '0' AFTER `box_text`;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
