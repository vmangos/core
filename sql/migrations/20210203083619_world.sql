DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210203083619');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210203083619');
-- Add your query below.


-- Human Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.306, `combat_reach`=1.5 WHERE `display_id`=49;

-- Human Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.208, `combat_reach`=1.5 WHERE `display_id`=50;

-- Orc Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.372, `combat_reach`=1.5 WHERE `display_id`=51;

-- Orc Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.236, `combat_reach`=1.5 WHERE `display_id`=52;

-- Dwarf Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.347, `combat_reach`=1.5 WHERE `display_id`=53;

-- Dwarf Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.347, `combat_reach`=1.5 WHERE `display_id`=54;

-- Night Elf Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.389, `combat_reach`=1.5 WHERE `display_id`=55;

-- Night Elf Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.306, `combat_reach`=1.5 WHERE `display_id`=56;

-- Undead Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.383, `combat_reach`=1.5 WHERE `display_id`=57;

-- Undead Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.383, `combat_reach`=1.5 WHERE `display_id`=58;

-- Tauren Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.9747, `combat_reach`=4.05 WHERE `display_id`=59;

-- Tauren Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.8725, `combat_reach`=3.75 WHERE `display_id`=60;

-- Gnome Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.3519, `combat_reach`=1.725 WHERE `display_id`=1563;

-- Gnome Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.3519, `combat_reach`=1.725 WHERE `display_id`=1564;

-- Troll Male
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.306, `combat_reach`=1.5 WHERE `display_id`=1478;

-- Troll Female
UPDATE `creature_display_info_addon` SET `bounding_radius`=0.306, `combat_reach`=1.5 WHERE `display_id`=1479;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
