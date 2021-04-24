DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200609172305');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200609172305');
-- Add your query below.


-- Lesser Healing Potion - Drovnar Strongbrew
DELETE FROM `npc_vendor` WHERE `entry` = 2812 AND `item` = 858;

-- Lesser Mana Potion - Drovnar Strongbrew
DELETE FROM `npc_vendor` WHERE `entry` = 2812 AND `item` = 3385;

-- Rune Thread - Hammon Karwn
DELETE FROM `npc_vendor` WHERE `entry` = 2810 AND `item` = 14341;

-- Imbued Vial - Hammon Karwn
DELETE FROM `npc_vendor` WHERE `entry` = 2810 AND `item` = 18256;

-- Blacksmith Hammer - Hammon Karwn
DELETE FROM `npc_vendor` WHERE `entry` = 2810 AND `item` = 5956;

-- Weighted Throwing Axe - Vikki Lonsav
DELETE FROM `npc_vendor` WHERE `entry` = 2808 AND `item` = 3131;

-- Balanced Throwing Dagger - Vikki Lonsav
DELETE FROM `npc_vendor` WHERE `entry` = 2808 AND `item` = 2946;

-- Dense Shortbow - Mu'uta
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`) VALUES
(9555, 1, 7200, 11305);

-- Weighted Throwing Axe - Graud
DELETE FROM `npc_vendor` WHERE `entry` = 2820 AND `item` = 3131;

-- Balanced Throwing Dagger - Graud
DELETE FROM `npc_vendor` WHERE `entry` = 2820 AND `item` = 2946;

-- Blacksmith Hammer - Keena
DELETE FROM `npc_vendor` WHERE `entry` = 2821 AND `item` = 5956;

-- Rune Thread - Keena
DELETE FROM `npc_vendor` WHERE `entry` = 2821 AND `item` = 14341;

-- Imbued Vial - Keena
DELETE FROM `npc_vendor` WHERE `entry` = 2821 AND `item` = 18256;

-- Pattern: Barbaric Leggins - Keena
INSERT INTO `npc_vendor` (`entry`, `maxcount`, `incrtime`, `item`) VALUES
(2821, 1, 7200, 5973);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
