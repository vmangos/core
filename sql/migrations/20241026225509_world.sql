DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241026225509');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241026225509');
-- Add your query below.


-- Un'Goro - some gorrilas is not tameable prior to patch 1.9

-- Un'Goro Thunderer
UPDATE `creature_template` SET `pet_family`=0, `static_flags1`=0 WHERE `entry`=6516 AND `patch`=0;

-- Uhk'loc
UPDATE `creature_template` SET `pet_family`=0, `static_flags1`=0 WHERE `entry`=6585 AND `patch`=0;

-- U'cha
UPDATE `creature_template` SET `pet_family`=0, `static_flags1`=0 WHERE `entry`=9622 AND `patch`=0;

-- Un'Goro Stomper
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `level_min`, `level_max`, `faction`, `display_id1`, `type`, `pet_family`, `unit_class`, `health_multiplier`, `damage_multiplier`, `damage_variance`, `loot_id`, `skinning_loot_id`, `ai_name`, `movement_type`, `inhabit_type`, `static_flags1`) VALUES (6513, 7, 'Un\'Goro Stomper', 51, 52, 72, 5294, 1, 9, 1, 1.3, 1.5, 0.09, 6513, 6513, 'EventAI', 1, 1, 16);
UPDATE `creature_template` SET `pet_family`=0, `static_flags1`=0 WHERE `entry`=6513 AND `patch`=0;


-- Zulgurub Speakers where elites prior to patch 1.11

-- Vilebranch Speaker
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=11391 AND `patch`=5;

-- Skullsplitter Speaker
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=11390 AND `patch`=5;

-- Bloodscalp Speaker
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=11389 AND `patch`=5;

-- Witherbark Speaker
UPDATE `creature_template` SET `rank`=1, `health_multiplier`=5 WHERE `entry`=11388 AND `patch`=5;

-- Sandfury Speaker
UPDATE `creature_template` SET `rank`=1 WHERE `entry`=11387 AND `patch`=5;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
