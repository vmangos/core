DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200819164738');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200819164738');
-- Add your query below.


-- enchating
-- add missing condition to expert enchanters
UPDATE `gossip_menu_option` SET `condition_id` = 380 WHERE `menu_id` IN (4163, 4164) AND `option_id` = 5;

-- add missing condition to artisan enchanters
UPDATE `gossip_menu_option` SET `condition_id` = 381 WHERE `menu_id` = 4169 AND `option_id` = 5;


-- engineering
-- add missing condition to expert engineers
UPDATE `gossip_menu_option` SET `condition_id` = 391 WHERE `menu_id` = 4145 AND `option_id` = 5;


-- blacksmithing
-- add missing condition to expert blacksmiths
UPDATE `gossip_menu_option` SET `condition_id` = 366 WHERE `menu_id` = 2781 AND `option_id` = 5;

-- add missing condition to master blacksmiths
UPDATE `gossip_menu_option` SET `condition_id` = 368 WHERE `menu_id` = 2784 AND `option_id` = 5;


-- leatherworking
-- add missing condition to expert leatherworkers
UPDATE `gossip_menu_option` SET `condition_id` = 377 WHERE `menu_id` IN (4205, 4209) AND `option_id` = 5;

-- add missing condition to artisan leatherworkers
UPDATE `gossip_menu_option` SET `condition_id` = 378 WHERE `menu_id` = 4242 AND `option_id` = 5;


-- tailoring
-- add missing condition to expert tailors
UPDATE `gossip_menu_option` SET `condition_id` = 372 WHERE `menu_id` IN (4344, 4345, 4349, 4351) AND `option_id` = 5;

-- add missing condition to artisan tailors
UPDATE `gossip_menu_option` SET `condition_id` = 373 WHERE `menu_id` = 4353 AND `option_id` = 5;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
