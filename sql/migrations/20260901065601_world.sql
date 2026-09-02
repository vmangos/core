DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260901065601');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260901065601');
-- Add your query below.


-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (604701);

-- Events list for Aqua Guardian
DELETE FROM `creature_ai_events` WHERE `creature_id`=6047;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (854501);

-- Events list for Abomination
DELETE FROM `creature_ai_events` WHERE `creature_id`=8545;

-- Auras and spawn spell for Darrowshire Spirit.
UPDATE `creature_template` SET `spawn_spell_id`=17321, `auras`='17327' WHERE `entry`=11064;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1106401);

-- Events list for Darrowshire Spirit
DELETE FROM `creature_ai_events` WHERE `creature_id`=11064;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1174601);

-- Events list for Desert Rumbler
DELETE FROM `creature_ai_events` WHERE `creature_id`=11746;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1315201);

-- Events list for Commander Malgor
DELETE FROM `creature_ai_events` WHERE `creature_id`=13152;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1538601, 1538602);

-- Events list for Major Yeggeth
DELETE FROM `creature_ai_events` WHERE `creature_id`=15386;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1546101, 1546102);

-- Events list for Shrieker Scarab
DELETE FROM `creature_ai_events` WHERE `creature_id`=15461;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1546201);

-- Events list for Spitting Scarab
DELETE FROM `creature_ai_events` WHERE `creature_id`=15462;

-- Fix creatures having EventAI data but don't have it assigned.
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry` IN (1892, 1893, 1896, 3284, 3285, 3385, 7167, 8898, 12143, 16390);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
