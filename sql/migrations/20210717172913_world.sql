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
DELETE FROM `creature_ai_events` WHERE `id`=90901;
UPDATE `creature_template` SET `auras` = '8601' WHERE `entry` = 909;

-- Dragonmaw Shadowwarder
DELETE FROM `creature_ai_scripts` WHERE `id` IN (103802);
DELETE FROM `creature_ai_events` WHERE `id`=103802;
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

-- Fardel Dabyrie
DELETE FROM `creature_ai_scripts` WHERE `id` IN (447901);
DELETE FROM `creature_ai_events` WHERE `id`=447901;
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
DELETE FROM `creature_ai_events` WHERE `id`=599201;
UPDATE `creature_template` SET `auras` = '12898 11966' WHERE `entry` = 5992;

-- Bloodpetal Thresher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651101);
DELETE FROM `creature_ai_events` WHERE `id`=651101;
UPDATE `creature_template` SET `auras` = '8876 14111', `ai_name`='' WHERE `entry` = 6511;

-- Sandfury Guardian
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 7268;

-- Withered Spearhide
UPDATE `creature_template` SET `auras` = '12246' WHERE `entry` = 7332;

-- Plaguemaw the Rotting
UPDATE `creature_template` SET `auras` = '12947' WHERE `entry` = 7356;

-- Diseased Flayer
DELETE FROM `creature_ai_scripts` WHERE `id` IN (853202);
DELETE FROM `creature_ai_events` WHERE `id`=853202;
UPDATE `creature_template` SET `auras` = '8876 12539' WHERE `entry` = 8532;

-- Stitched Horror
UPDATE `creature_template` SET `auras` = '14775' WHERE `entry` = 8543;

-- Dark Adept
UPDATE `creature_template` SET `auras` = '3417 8734' WHERE `entry` = 8546;

-- Dreadlord
UPDATE `creature_template` SET `auras` = '20809' WHERE `entry` = 8716;

-- Molten War Golem
UPDATE `creature_template` SET `auras` = '13377 15506' WHERE `entry` = 8908;

-- Hedrum the Creeper
UPDATE `creature_template` SET `auras` = '13767' WHERE `entry` = 9032;

-- Plague Ghoul
UPDATE `creature_template` SET `auras` = '15088 15097 18950' WHERE `entry` = 10405;

-- Crypt Beast
UPDATE `creature_template` SET `auras` = '16428' WHERE `entry` = 10413;

-- Syndicate Rogue
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 2260;

-- Syndicate Watchman
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 2261;

-- Jailor Eston
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 2427;

-- Dark Strand Excavator
UPDATE `creature_template` SET `auras` = '3582' WHERE `entry` = 3730;

-- Sloth
UPDATE `creature_template` SET `auras` = '3509' WHERE `entry` = 2475;

-- Sludge
UPDATE `creature_template` SET `auras` = '3512' WHERE `entry` = 2479;

-- Stone Behemoth / Cracked Golem
UPDATE `creature_template` SET `auras` = '5811' WHERE `entry` IN (2156, 2157);

-- Giant Ashenvale Bear / Elder Ashenvale Bear
UPDATE `creature_template` SET `auras` = '6923' WHERE `entry` IN (3810, 3811);

-- Legashi Rogue
UPDATE `creature_template` SET `auras` = '7276' WHERE `entry` = 6201;

-- Blackened Ancient
UPDATE `creature_template` SET `auras` = '7999' WHERE `entry` = 4029;

-- Pesterhide Hyena
UPDATE `creature_template` SET `auras` = '8247' WHERE `entry` = 4248;

-- Irradiated Pillager / Irradiated Invader
DELETE FROM `creature_ai_scripts` WHERE `id` IN (621301, 632901);
DELETE FROM `creature_ai_events` WHERE `id` IN (621301, 632901);
UPDATE `creature_template` SET `auras` = '9769 21862' WHERE `entry` IN (6213, 6329);

-- Crimson Sorcerer
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1042201, 1042202);
DELETE FROM `creature_ai_events` WHERE `creature_id`=10422;
UPDATE `creature_template` SET `auras` = '17150 12544', `ai_name`='' WHERE `entry` = 10422;

-- Ramstein the Gorger
UPDATE `creature_template` SET `auras` = '15088' WHERE `entry` = 10439;

-- Lazy Peon
UPDATE `creature_template` SET `auras` = '17743' WHERE `entry` = 10556;

-- Wildspawn Shadowstalker
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1145601, 1145604);
DELETE FROM `creature_ai_events` WHERE `id` IN (1145601, 1145604);
UPDATE `creature_template` SET `auras` = '8601 18950 22766' WHERE `entry` = 11456;

-- Magrami Spectre
UPDATE `creature_template` SET `auras` = '17327' WHERE `entry` = 11560;

-- Whirlwind Stormwalker
UPDATE `creature_template` SET `auras` = '18148' WHERE `entry` = 11577;

-- Nefarian
UPDATE `creature_template` SET `auras` = '19818 22992 25184' WHERE `entry` = 11583;

-- Sentinel Aynasha
UPDATE `creature_template` SET `auras` = '18373' WHERE `entry` = 11711;

-- Putridus Satyr
UPDATE `creature_template` SET `auras` = '21061' WHERE `entry` = 11790;

-- Lava Elemental
UPDATE `creature_template` SET `auras` = '19640' WHERE `entry` = 12076;

-- Lava Elemental
UPDATE `creature_template` SET `auras` = '8876 15733' WHERE `entry` = 12099;

-- Eris Havenfire
UPDATE `creature_template` SET `auras` = '23196 23199' WHERE `entry` = 14494;

-- Hakkar
UPDATE `creature_template` SET `auras` = '19818 24692' WHERE `entry` = 14834;

-- Voodoo Spirit
UPDATE `creature_template` SET `auras` = '24051' WHERE `entry` = 15009;

-- Spawn of Mar'li
UPDATE `creature_template` SET `auras` = '24087' WHERE `entry` = 15041;

-- Vekniss Soldier
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1522904);
DELETE FROM `creature_ai_events` WHERE `id`=1522904;
UPDATE `creature_template` SET `auras` = '25801' WHERE `entry` = 15229;

-- Spirit Shade
UPDATE `creature_template` SET `auras` = '24313' WHERE `entry` = 15261;

-- Hive'Zara Sandstalker
UPDATE `creature_template` SET `auras` = '25592' WHERE `entry` = 15323;

-- Ossirian the Unscarred
UPDATE `creature_template` SET `auras` = '25176 19818' WHERE `entry` = 15339;

-- Poison Cloud
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1593301, 1593301);
DELETE FROM `creature_ai_events` WHERE `creature_id`=15933;
UPDATE `creature_template` SET `auras` = '25786 26575', `ai_name`='' WHERE `entry` = 15933;

-- The Master's Eye
UPDATE `creature_template` SET `auras` = '18430' WHERE `entry` = 15963;

-- Patchwork Golem
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1601703);
DELETE FROM `creature_ai_events` WHERE `id`=1601703;
UPDATE `creature_template` SET `auras` = '16017' WHERE `entry` = 27793;

-- Sludge Belcher
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1602903);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16029;
UPDATE `creature_template` SET `auras` = '28362', `ai_name`='' WHERE `entry` = 16029;

-- Annalise Lerent
UPDATE `creature_template` SET `auras` = '10848' WHERE `entry` = 16110;

-- Unrelenting Rider
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1612601);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16126;
UPDATE `creature_template` SET `auras` = '27987', `ai_name`='' WHERE `entry` = 16126;

-- Soldier of the Frozen Wastes
UPDATE `creature_template` SET `auras` = '28458' WHERE `entry` = 16427;

-- Soldier of the Frozen Wastes
UPDATE `creature_template` SET `auras` = '28460' WHERE `entry` = 16429;

-- Blizzard
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1647401);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16474;
UPDATE `creature_template` SET `auras` = '28534', `ai_name`='' WHERE `entry` = 16474;

-- Void Zone
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1669701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=16697;
UPDATE `creature_template` SET `auras` = '28874' WHERE `entry` = 16697;

-- Sapphiron's Wing Buffet
UPDATE `creature_template` SET `auras` = '29327' WHERE `entry` = 17025;

-- Mosh'Ogg Mauler
UPDATE `creature_template` SET `auras` = '7095' WHERE `entry` = 678;

-- Takk the Leaper
UPDATE `creature_template` SET `auras` = '7165 21156' WHERE `entry` = 5842;

-- Captain Gerogg Hammertoe
UPDATE `creature_template` SET `auras` = '3418' WHERE `entry` = 5851;

-- Swinegart Spearhide
UPDATE `creature_template` SET `auras` = '7165' WHERE `entry` = 5864;

-- Anvilrage Overseer
UPDATE `creature_template` SET `auras` = '13589' WHERE `entry` = 8889;

-- Entropic Horror
UPDATE `creature_template` SET `auras` = '11966' WHERE `entry` = 9879;

-- Hive'Regal Ambusher
UPDATE `creature_template` SET `auras` = '22766' WHERE `entry` = 11730;

-- Son of Flame
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1214301);
DELETE FROM `creature_ai_events` WHERE `creature_id`=12143;
UPDATE `creature_template` SET `auras` = '19818 21857', `ai_name`='' WHERE `entry` = 12143;

-- Shanda the Spinner
UPDATE `creature_template` SET `auras` = '11919' WHERE `entry` = 14266;

-- Gretheer
UPDATE `creature_template` SET `auras` = '21788' WHERE `entry` = 14472;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6508;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (650801);
-- Events list for Venomhide Ravasaur
DELETE FROM `creature_ai_events` WHERE `creature_id`=6508;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6509;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (650901);
-- Events list for Bloodpetal Lasher
DELETE FROM `creature_ai_events` WHERE `creature_id`=6509;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6510;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651001);
-- Events list for Bloodpetal Flayer
DELETE FROM `creature_ai_events` WHERE `creature_id`=6510;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6512;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651201);
-- Events list for Bloodpetal Trapper
DELETE FROM `creature_ai_events` WHERE `creature_id`=6512;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6517;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651701);
-- Events list for Tar Beast
DELETE FROM `creature_ai_events` WHERE `creature_id`=6517;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6518;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651801);
-- Events list for Tar Lurker
DELETE FROM `creature_ai_events` WHERE `creature_id`=6518;

-- Removing unused script actions.
UPDATE `creature_template` SET `ai_name`='' WHERE `entry` = 6527;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (652701);
-- Events list for Tar Creeper
DELETE FROM `creature_ai_events` WHERE `creature_id`=6527;

-- Removing unused script actions.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (651901);
-- Events list for Tar Lord
DELETE FROM `creature_ai_events` WHERE `creature_id`=6519;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (651903, 6519, 0, 2, 0, 100, 0, 40, 0, 0, 0, 651903, 0, 0, 'Tar Lord - Cast Renew');

-- Add missing auras for NPC 6508 (Venomhide Ravasaur)
UPDATE `creature_template` SET `auras`='14108' WHERE `entry`=6508;
-- Add missing auras for NPC 6509 (Bloodpetal Lasher), 6510 (Bloodpetal Flayer), 6512 (Bloodpetal Trapper)
UPDATE `creature_template` SET `auras`='14111' WHERE `entry` IN (6509, 6510, 6512);
-- Add missing auras for NPC 6517 (Tar Beast), 6518 (Tar Lurker), 6519 (Tar Lord), 6527 (Tar Creeper)
UPDATE `creature_template` SET `auras`='14178' WHERE `entry` IN (6517, 6518, 6519, 6527);
-- Add missing aura for NPC 6556 (Muculent Ooze)
UPDATE `creature_template` SET `auras`='14133' WHERE `entry`=6556;
-- Add missing aura for NPC 10407 (Muculent Ooze)
UPDATE `creature_template` SET `auras`='8876 18950' WHERE `entry`=10407;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
