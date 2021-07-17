DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210717172913');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210717172913');
-- Add your query below.


-- Defias Night Blade
DELETE FROM `creature_ai_scripts` WHERE `id` IN (90901);
DELETE FROM `creature_ai_events` WHERE `creature_id`=909;
UPDATE `creature_template` SET `auras` = '8601' WHERE `entry` = 909;

-- Dragonmaw Shadowwarder
DELETE FROM `creature_ai_scripts` WHERE `id` IN (103802);
DELETE FROM `creature_ai_events` WHERE `creature_id`=1038;
UPDATE `creature_template` SET `auras` = '643' WHERE `entry` = 1038;

-- Negolash
UPDATE `creature_template` SET `auras` = '7095', `ai_name`='EventAI' WHERE `entry` = 1494;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (149401, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 731, 0, 0, 0, 0, 0, 0, 0, 0, 'Negolash - Talk');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (149401, 1494, 0, 1, 0, 100, 1, 3000, 10000, 420000, 900000, 149401, 0, 0, 'Negolash - Talk - OOC');

-- Webwood Spider
UPDATE `creature_template` SET `auras` = '6752' WHERE `entry` = 1986;

-- Gazban
UPDATE `creature_template` SET `auras` = '6523' WHERE `entry` = 2624;

-- Shadra
UPDATE `creature_template` SET `auras` = '8601 13299' WHERE `entry` = 2707;

-- Mangy Silvermane
UPDATE `creature_template` SET `auras` = '18847' WHERE `entry` = 2923;

-- Lady Anacondra
UPDATE `creature_template` SET `auras` = '13236' WHERE `entry` = 3671;

-- Bleakheart Satyr
UPDATE `creature_template` SET `auras` = '6947' WHERE `entry` = 3765;

-- Blackened Ancient
UPDATE `creature_template` SET `auras` = '7999' WHERE `entry` = 4029;

-- Fardel Dabyrie
DELETE FROM `creature_ai_scripts` WHERE `id` IN (447901);
DELETE FROM `creature_ai_events` WHERE `creature_id`=4479;
UPDATE `creature_template` SET `auras` = '8876 10022', `ai_name`='' WHERE `entry` = 4479;

-- Old Serra'kis
UPDATE `creature_template` SET `auras` = '8434' WHERE `entry` = 4830;

-- Nightmare Scalebane
UPDATE `creature_template` SET `auras` = '12099' WHERE `entry` = 5277;

-- Warugs Target Dummy
UPDATE `creature_template` SET `auras` = '4048' WHERE `entry` = 5723;

-- Lord Azrethoc
UPDATE `creature_template` SET `auras` = '7974 15097' WHERE `entry` = 5760;

-- Ashmane Boar
DELETE FROM `creature_ai_scripts` WHERE `id` IN (599201);
DELETE FROM `creature_ai_events` WHERE `creature_id`=5992;
UPDATE `creature_template` SET `auras` = '12898 11966' WHERE `entry` = 5992;

-- Bloodpetal Thresher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651101);
DELETE FROM `creature_ai_events` WHERE `creature_id`=6511;
UPDATE `creature_template` SET `auras` = '8876 14111', `ai_name`='' WHERE `entry` = 6511;

-- Sandfury Guardian
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 7268;

-- Withered Spearhide
UPDATE `creature_template` SET `auras` = '12246' WHERE `entry` = 7332;

-- Tomb Reaver
UPDATE `creature_template` SET `auras` = '7351' WHERE `entry` = 7351;
































-- Jadefire Shadowstalker
UPDATE `creature_template` SET `auras` = '77939 22766 8601' WHERE `entry` = 7110;

-- Rift Spawn
UPDATE `creature_template` SET `auras` = '9095' WHERE `entry` = 6492;

-- Forsaken Assassin
DELETE FROM `creature_ai_scripts` WHERE `id` IN (380701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3807;
UPDATE `creature_template` SET `auras` = '6718 8601', `ai_name`='' WHERE `entry` = 3807;

-- Forsaken Infiltrator
DELETE FROM `creature_ai_scripts` WHERE `id` IN (380601);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3806;
UPDATE `creature_template` SET `auras` = '3616 6718', `ai_name`='' WHERE `entry` = 3806;

-- Jaguero Stalker 
UPDATE `creature_template` SET `auras` = '7939 22766 3417' WHERE `entry` = 2522;




-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
