DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230802150021');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230802150021');
-- Add your query below.


-- Correct gossip menu id of Earthcaller Franzahl.
UPDATE `gossip_menu` SET `entry`=5813 WHERE `entry`=50309;
UPDATE `gossip_menu_option` SET `menu_id`=5813 WHERE `menu_id`=50309;
UPDATE `creature_template` SET `gossip_menu_id`=5813 WHERE `gossip_menu_id`=50309;

-- Correct gossip menu id of Vartrus the Ancient.
UPDATE `gossip_menu` SET `entry`=6584 WHERE `entry`=50000;
UPDATE `gossip_menu_option` SET `menu_id`=6584 WHERE `menu_id`=50000;
UPDATE `gossip_menu_option` SET `action_script_id`=658400 WHERE `action_script_id`=5000000;
UPDATE `gossip_scripts` SET `id`=658400 WHERE `id`=5000000;
UPDATE `gossip_menu_option` SET `action_script_id`=658401 WHERE `action_script_id`=5000001;
UPDATE `gossip_scripts` SET `id`=658401 WHERE `id`=5000001;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id`=50000;
UPDATE `creature_template` SET `gossip_menu_id`=6584 WHERE `gossip_menu_id`=50000;

-- Correct gossip menu id of Cenarion Scout Jalia.
UPDATE `gossip_menu` SET `entry`=6691, `text_id`=8064 WHERE `entry`=15611 && `text_id`=8064;
UPDATE `gossip_menu_option` SET `menu_id`=6691 WHERE `menu_id`=15611;
UPDATE `gossip_menu_option` SET `action_script_id`=6691 WHERE `action_script_id`=15611;
UPDATE `gossip_scripts` SET `id`=6691 WHERE `id`=15611;
UPDATE `creature_template` SET `gossip_menu_id`=6691 WHERE `gossip_menu_id`=15611;

-- Correct gossip menu id of Cenarion Scout Azenel.
UPDATE `gossip_menu` SET `entry`=6690, `text_id`=8063 WHERE `entry`=15610 && `text_id`=8064;
UPDATE `gossip_menu_option` SET `menu_id`=6690 WHERE `menu_id`=15610;
UPDATE `gossip_menu_option` SET `action_script_id`=6690 WHERE `action_script_id`=15610;
UPDATE `gossip_scripts` SET `id`=6690 WHERE `id`=15610;
UPDATE `creature_template` SET `gossip_menu_id`=6690 WHERE `gossip_menu_id`=15610;

-- Correct gossip menu id of Cenarion Scout Landion.
UPDATE `gossip_menu` SET `entry`=6692, `text_id`=8065 WHERE `entry`=15609 && `text_id`=8063;
UPDATE `gossip_menu_option` SET `menu_id`=6692 WHERE `menu_id`=15609;
UPDATE `gossip_menu_option` SET `action_script_id`=6692 WHERE `action_script_id`=15609;
UPDATE `gossip_scripts` SET `id`=6692 WHERE `id`=15609;
UPDATE `creature_template` SET `gossip_menu_id`=6692 WHERE `gossip_menu_id`=15609;

-- Correct gossip menu id of Vaelan.
UPDATE `gossip_menu` SET `entry`=2630 WHERE `entry`=12039;
UPDATE `gossip_menu_option` SET `menu_id`=2630 WHERE `menu_id`=12039;
UPDATE `gossip_menu` SET `entry`=2629 WHERE `entry`=12040;
UPDATE `gossip_menu_option` SET `menu_id`=2629 WHERE `menu_id`=12040;
UPDATE `gossip_menu_option` SET `action_menu_id`=2629 WHERE `action_menu_id`=12040;
UPDATE `gossip_menu` SET `entry`=2628 WHERE `entry`=12041;
UPDATE `gossip_menu_option` SET `menu_id`=2628 WHERE `menu_id`=12041;
UPDATE `gossip_menu_option` SET `action_menu_id`=2628 WHERE `action_menu_id`=12041;
UPDATE `gossip_menu` SET `entry`=2627 WHERE `entry`=12042;
UPDATE `gossip_menu_option` SET `menu_id`=2627 WHERE `menu_id`=12042;
UPDATE `gossip_menu_option` SET `action_menu_id`=2627 WHERE `action_menu_id`=12042;
UPDATE `gossip_menu` SET `entry`=2626 WHERE `entry`=12043;
UPDATE `gossip_menu_option` SET `menu_id`=2626 WHERE `menu_id`=12043;
UPDATE `gossip_menu_option` SET `action_menu_id`=2626 WHERE `action_menu_id`=12043;
UPDATE `gossip_menu` SET `entry`=2625 WHERE `entry`=12044;
UPDATE `gossip_menu_option` SET `menu_id`=2625 WHERE `menu_id`=12044;
UPDATE `gossip_menu_option` SET `action_menu_id`=2625 WHERE `action_menu_id`=12044;
UPDATE `gossip_menu` SET `entry`=2624 WHERE `entry`=12045;
UPDATE `gossip_menu_option` SET `menu_id`=2624 WHERE `menu_id`=12045;
UPDATE `gossip_menu_option` SET `action_menu_id`=2624 WHERE `action_menu_id`=12045;
UPDATE `gossip_menu` SET `entry`=2623 WHERE `entry`=12046;
UPDATE `gossip_menu_option` SET `menu_id`=2623 WHERE `menu_id`=12046;
UPDATE `gossip_menu_option` SET `action_menu_id`=2623 WHERE `action_menu_id`=12046;
UPDATE `gossip_menu` SET `entry`=2622 WHERE `entry`=12047;
UPDATE `gossip_menu_option` SET `menu_id`=2622 WHERE `menu_id`=12047;
UPDATE `gossip_menu_option` SET `action_menu_id`=2622 WHERE `action_menu_id`=12047;
UPDATE `gossip_menu` SET `entry`=2621 WHERE `entry`=12048;
UPDATE `gossip_menu_option` SET `menu_id`=2621 WHERE `menu_id`=12048;
UPDATE `gossip_menu_option` SET `action_menu_id`=2621 WHERE `action_menu_id`=12048;
UPDATE `creature_template` SET `gossip_menu_id`=2630 WHERE `gossip_menu_id`=12039;

-- Hegnar Swiftaxe does not have gossip.
DELETE FROM `gossip_menu` WHERE `entry`=9330;
DELETE FROM `gossip_menu_option` WHERE `menu_id`=9330;
UPDATE `creature_template` SET `gossip_menu_id`=0 WHERE `entry`=5119;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
