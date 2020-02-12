DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200212174137');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200212174137');
-- Add your query below.

-- Gubber Blump should be selling fishing poles and baits permanently https://classic.wowhead.com/npc=10216/gubber-blump#sells
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6256');
UPDATE `npc_vendor` SET `maxcount`='0', `incrtime`='0' WHERE (`entry`='10216') AND (`item`='6529');

-- Event description: https://wowwiki.fandom.com/wiki/Okla

replace into creature_movement (id, point, position_x, position_y, position_z) values
(13179, 1, 270.076, -3036.6, 97.6192),
(13179, 2, 262.171, -3043.45, 96.5053),
(13179, 3, 251.328, -3055.55, 96.1454),
(13179, 4, 246.888, -3070.92, 95.2793),
(13179, 5, 242.449, -3081.3, 91.82),
(13179, 6, 232.826, -3106.67, 93.3165),
(13179, 7, 226.41, -3120.76, 93.3475),
(13179, 8, 213.921, -3151.01, 91.2851),
(13179, 9, 221.681, -3147.9, 91.374),
(13179, 10, 214.549, -3134.64, 91.9876),
(13179, 11, 210.931, -3139.95, 91.6514),
(13179, 12, 214.059, -3139.64, 91.7),
(13179, 13, 213.426, -3131.78, 92.1297),
(13179, 14, 220.194, -3140.72, 91.7517),
(13179, 15, 225.395, -3139.1, 92.0847),
(13179, 16, 220.857, -3140.83, 91.7662),
(13179, 17, 218.769, -3132.79, 92.4983),
(13179, 18, 226.814, -3137.56, 92.169),
(13179, 19, 225.496, -3132.89, 92.7818),
(13179, 20, 213.603, -3148.39, 91.4489),
(13179, 21, 219.055, -3151.2, 91.2139),
(13179, 22, 220.469, -3141.93, 91.6344),
(13179, 23, 214.852, -3148.32, 91.4558),
(13179, 24, 218.373, -3144.99, 91.5714),
(13179, 25, 224.091, -3149.02, 91.2304),
(13179, 26, 224.591, -3145.02, 91.4801),
(13179, 27, 219.022, -3147.38, 91.4735),
(13179, 28, 220.167, -3139.75, 91.8958),
(13179, 29, 225.033, -3133.14, 92.8028),
(13179, 30, 222.021, -3128.32, 93.0422),
(13179, 31, 228.338, -3126.35, 92.9595),
(13179, 32, 229.495, -3129.22, 92.6818),
(13179, 33, 232.12, -3128.11, 92.5988),
(13179, 34, 227.003, -3137.58, 92.1461),
(13179, 35, 220.002, -3132.38, 92.659),
(13179, 36, 225.874, -3102.36, 93.6962),
(13179, 37, 233.086, -3085.54, 91.6788),
(13179, 38, 235.152, -3069.81, 91.8706),
(13179, 39, 239.821, -3061.03, 95.4022),
(13179, 40, 256.123, -3047.91, 96.2473),
(13179, 41, 267.05, -3039.04, 96.9212),
(13179, 42, 271.093, -3035.98, 97.6501),
(13179, 43, 278.975, -3029.68, 97.3919),
(13179, 44, 280.125, -3029.01, 97.3502);

UPDATE `creature_movement` SET `waittime`='21000', `orientation`='3.764', `script_id`='10274' WHERE (`id`='13179') AND (`point`='2');
UPDATE `creature_movement` SET `waittime`='10000', `orientation`='0.895064', `script_id`='10277' WHERE (`id`='13179') AND (`point`='13');
UPDATE `creature_movement` SET `waittime`='10000', `orientation`='0.895064', `script_id`='10278' WHERE (`id`='13179') AND (`point`='18');
UPDATE `creature_movement` SET `waittime`='10000', `orientation`='0.895064', `script_id`='10279' WHERE (`id`='13179') AND (`point`='24');
UPDATE `creature_movement` SET `waittime`='10000', `orientation`='0.895064', `script_id`='10280' WHERE (`id`='13179') AND (`point`='29');
UPDATE `creature_movement` SET `waittime`='10000', `orientation`='0.895064', `script_id`='10281' WHERE (`id`='13179') AND (`point`='35');
UPDATE `creature_movement` SET `waittime`='60000', `orientation`='3.764' WHERE (`id`='13179') AND (`point`='44');

UPDATE `creature` SET `movement_type`='2' WHERE (`guid`='13179');

-- Script texts
delete from `creature_movement_scripts` where id between 10274 and 10281;
replace INTO `creature_movement_scripts` (`id`, `delay`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `comments`) VALUES
('10274', '0', '14873', '30', '8', '3', '10274', 'Okla Pathing - Okla Question to Kranal'),
('10274', '3', '5907', '30', '8', '3', '10275', 'Okla Pathing - Kranal Fiss Reply to Okla'),
('10274', '7', '14873', '30', '8', '3', '10276', 'Okla Pathing - Okla Reply to Kranal'),
('10277', '0', '14873', '30', '8', '3', '10277', 'Okla Pathing - Okla Text 1'),
('10278', '0', '14873', '30', '8', '3', '10278', 'Okla Pathing - Okla Text 2'),
('10279', '0', '14873', '30', '8', '3', '10279', 'Okla Pathing - Okla Text 3'),
('10280', '0', '14873', '30', '8', '3', '10280', 'Okla Pathing - Okla Text 4'),
('10281', '0', '14873', '30', '8', '3', '10281', 'Okla Pathing - Okla Text 5');

-- Pathing for Kranal Fiss
replace INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
('13174', '1', '265.967', '-3050.67', '96.9215'),
('13174', '2', '263.671661', '-3047.959961', '96.665161'),
('13174', '3', '260.557739', '-3038.177002', '96.740677'),
('13174', '4', '262.354950', '-3036.125732', '96.990982'),
('13174', '5', '261.470215', '-3036.779541', '96.961708'),
('13174', '6', '259.890106', '-3038.696045', '96.572845'),
('13174', '7', '265.967468', '-3050.672363', '96.921516'),
('13174', '8', '265.967000', '-3050.670000', '96.921500');

UPDATE `creature_movement` SET `waittime`='60000' WHERE (`id`='13174') AND (`point`='5');
UPDATE `creature_movement` SET `waittime`='30000' WHERE (`id`='13174') AND (`point`='8');


-- Repositioning and enable pathing on Kranal Fiss
UPDATE `creature` SET `position_x`='265.967', `position_y`='-3050.67', `position_z`='96.9215', `movement_type`='2' WHERE (`guid`='13174');

-- Repositioning Okla
UPDATE `creature` SET `position_x`='280.125', `position_y`='-3029.01', `position_z`='97.3502', `orientation`='3.764' WHERE (`guid`='13179');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
