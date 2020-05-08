DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200507205634');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200507205634');
-- Add your query below.


-- require alchemy skill of 50 to unlock expert alchemist training gossip
-- tally berryfizz
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 9364 AND `option_id` = 5;

-- lilyssia nightbreeze
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 9378 AND `option_id` = 5;

-- sylvanna forestmoon
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 9555 AND `option_id` = 5;

-- yelmak
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 9165 AND `option_id` = 5;

-- doctor marsh
UPDATE `gossip_menu_option` SET `condition_id` = 361 WHERE `menu_id` = 9299 AND `option_id` = 5;


-- require alchemy skill of 150 to unlock expert alchemist training gossip
-- ainethil
UPDATE `gossip_menu_option` SET `condition_id` = 4454 WHERE `menu_id` = 9212 AND `option_id` = 5;

-- doctor herbert halsey
UPDATE `gossip_menu_option` SET `condition_id` = 4454 WHERE `menu_id` = 9301 AND `option_id` = 5


-- add condition to unlock master alchemist training gossip
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4455, 7, 171, 225, 0, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
