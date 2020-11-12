DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200607115801');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200607115801');
-- Add your query below.


-- require alchemy skill of 50 to unlock expert alchemist training gossip
-- tally berryfizz
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4123 AND `option_id` = 5;

-- yelmak
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 4126 AND `option_id` = 5;

-- require alchemy skill of 200 to unlock master alchemist training gossip
-- kylanna windwhisper
UPDATE `gossip_menu_option` SET `condition_id` = 363 WHERE `menu_id` = 4133 AND `option_id` = 5;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
