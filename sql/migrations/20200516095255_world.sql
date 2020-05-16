DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200516095255');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200516095255');
-- Add your query below.


-- update gossip menu for bena winterhoof
UPDATE `creature_template` SET `gossip_menu_id` = 4131 WHERE `entry` = 3009;

-- add correct gossip_menu_entries for bena winterhoof
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4131, 5079, 0),
(4131, 5081, 25),
(4131, 5080, 361),
(4131, 5083, 362),
(4131, 8244, 461),
(4131, 8283, 459),
(4131, 8285, 454),
(4131, 8291, 458),
(4131, 8296, 460),
(4131, 8298, 455);

-- update gossip menu for doctor marsh
UPDATE `creature_template` SET `gossip_menu_id` = 4133 WHERE `entry` = 4609;

-- add correct gossip_menu_entries for doctor marsh
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4133, 5089, 0),
(4133, 5092, 25),
(4133, 5093, 361),
(4133, 5090, 362),
(4133, 8255, 461),
(4133, 8283, 459),
(4133, 8285, 454),
(4133, 8291, 458),
(4133, 8296, 460),
(4133, 8298, 455);

-- update gossip menu for alchemist narett
UPDATE `creature_template` SET `gossip_menu_id` = 4119 WHERE `entry` = 4900;

-- add correct gossip_menu_entries for alchemist narett
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4119, 5049, 0),
(4119, 5051, 25),
(4119, 5053, 361),
(4119, 5050, 362);

-- update gossip menu for lilyssia nightbreeze
UPDATE `creature_template` SET `gossip_menu_id` = 4121 WHERE `entry` = 5499;

-- add correct gossip_menu_entries for lilyssia nightbreeze
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4121, 5316, 0),
(4121, 5317, 361),
(4121, 5314, 362),
(4121, 8244, 461),
(4121, 8283, 459),
(4121, 8285, 454),
(4121, 8291, 458),
(4121, 8296, 460),
(4121, 8298, 455);

-- update gossip menu for sylvanna forestmoon
UPDATE `creature_template` SET `gossip_menu_id` = 4114 WHERE `entry` = 11042;

-- add correct gossip_menu_entries for sylvanna forestmoon
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4114, 5064, 0),
(4114, 5067, 25),
(4114, 5068, 361),
(4114, 5065, 362),
(4114, 8244, 461),
(4114, 8283, 459),
(4114, 8285, 454),
(4114, 8291, 458),
(4114, 8296, 460),
(4114, 8298, 455);

-- update gossip menu for tel'athir
UPDATE `creature_template` SET `gossip_menu_id` = 4111 WHERE `entry` = 5500;

-- add correct gossip_menu_entries for tel'athir
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4111, 5019, 0),
(4111, 5020, 25),
(4111, 5021, 361),
(4111, 8244, 461),
(4111, 8283, 459),
(4111, 8285, 454),
(4111, 8291, 458),
(4111, 8296, 460),
(4111, 8298, 455);

-- update gossip menu for milla fairancora
UPDATE `creature_template` SET `gossip_menu_id` = 4113 WHERE `entry` = 11041;

-- add correct gossip_menu_entries for milla fairancora
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4113, 5025, 0),
(4113, 5026, 25),
(4113, 5027, 361),
(4113, 8244, 461),
(4113, 8283, 459),
(4113, 8285, 454),
(4113, 8291, 458),
(4113, 8296, 460),
(4113, 8298, 455);

-- update gossip menu for kray
UPDATE `creature_template` SET `gossip_menu_id` = 4128 WHERE `entry` = 11047;

-- add correct gossip_menu_entries for kray
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4128, 5040, 0),
(4128, 5041, 25),
(4128, 5042, 361),
(4128, 8244, 461),
(4128, 8283, 459),
(4128, 8285, 454),
(4128, 8291, 458),
(4128, 8296, 460),
(4128, 8298, 455);

-- update gossip menu for ainethil
UPDATE `creature_template` SET `gossip_menu_id` = 4124 WHERE `entry` = 4160;

-- add correct gossip_menu_entries for ainethil
INSERT INTO `gossip_menu` (`entry`, `text_id`, `condition_id`) VALUES
(4124, 5094, 0),
(4124, 5097, 25),
(4124, 5098, 362),
(4124, 5095, 363),
(4124, 8244, 461),
(4124, 8283, 459),
(4124, 8285, 454),
(4124, 8291, 458),
(4124, 8296, 460),
(4124, 8298, 455);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
