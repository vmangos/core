DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20261121113643');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20261121113643');
-- Add your query below.

-- --------------------------------------------------------------------------------------------------
-- Oggleflint
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=48644;

-- --------------------------------------------------------------------------------------------------
-- Taragaman the Hungerer
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=48706;

-- --------------------------------------------------------------------------------------------------
-- Jergosh the Invoker
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=115180;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(115180, 'Ragefire Chasm - Jergosh the Invoker',
    20800, 100, 1, 0, 0, 32, 3, 4, 7, 16, 0,  -- Immolate
    18267, 100, 1, 0, 0, 32, 5, 12, 7, 16, 0); -- Curse of Weakness

-- --------------------------------------------------------------------------------------------------
-- Bazzalan
-- --------------------------------------------------------------------------------------------------

-- Poison comes from the Poison Proc aura, Sinister Strike from the spells list
DELETE FROM `creature_ai_events` WHERE `creature_id`=11519;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1151901, 1151902);
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(115190, 'Ragefire Chasm - Bazzalan',
    14873, 100, 1, 0, 0, 0, 5, 7, 6, 11, 0); -- Sinister Strike
UPDATE `creature_template` SET `spell_list_id`=115190, `ai_name`='', `auras`='3616' WHERE `entry`=11519;

-- --------------------------------------------------------------------------------------------------
-- Trash: Ragefire Trogg (11318)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=113180;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(113180, 'Ragefire Chasm - Ragefire Trogg',
    11976, 100, 1, 0, 0, 0, 5, 10, 5, 11, 0); -- Strike

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=48645;
DELETE FROM `creature` WHERE `guid`=48663;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(568, 11318, 0, 0, 0, 0, 389, -181.661, -65.8376, -59.5157, 2.30383, 7200, 7200, 2, 100, 0, 1, 0, 0, 0, 10),
(1754, 11318, 0, 0, 0, 0, 389, -157.09, 3.80, -42.94, 2.812, 7200, 7200, 0, 100, 0, 2, 0, 0, 0, 10);

-- 48669 is a trogg walking the path, it turns at point 5
UPDATE `creature` SET `id`=11318, `mana_percent`=0 WHERE `guid`=48669;
DELETE FROM `creature_movement` WHERE `id`=48669;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(48669, 1, -287.744, -73.9324, -60.5234, 0, 0, 0, 0),
(48669, 2, -284.397, -91.3588, -61.9013, 0, 0, 0, 0),
(48669, 3, -260.868, -92.4423, -61.2886, 0, 0, 0, 0),
(48669, 4, -254.199, -62.2292, -62.0023, 0, 0, 0, 0),
(48669, 5, -232.557, -61.1359, -61.1316, 0, 0, 0, 0),
(48669, 6, -240.409, -58.2346, -61.8446, 0, 0, 0, 0),
(48669, 7, -255.443, -64.3157, -62.0471, 0, 0, 0, 0),
(48669, 8, -260.802, -92.8847, -61.3218, 0, 0, 0, 0),
(48669, 9, -282.256, -93.1549, -61.9012, 0, 0, 0, 0);

-- 48640 patrols back and forth, starting at its spawn point
UPDATE `creature` SET `movement_type`=2, `wander_distance`=0 WHERE `guid`=48640;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(48640, 1, -160.75, -65.05, -59.43, 100, 0, 0, 0),
(48640, 2, -148.75, -64.99, -59.32, 100, 0, 0, 0),
(48640, 3, -147.61, -55.37, -58.26, 100, 0, 0, 0),
(48640, 4, -152.77, -49.35, -58.34, 100, 0, 0, 0),
(48640, 5, -161.03, -44.28, -59.35, 100, 0, 0, 0),
(48640, 6, -161.85, -34.80, -58.64, 100, 0, 0, 0),
(48640, 7, -159.93, -22.64, -57.42, 100, 0, 0, 0),
(48640, 8, -149.52, -19.09, -55.36, 100, 0, 0, 0),
(48640, 9, -142.34, -13.32, -54.30, 100, 0, 0, 0),
(48640, 10, -149.52, -19.09, -55.36, 100, 0, 0, 0),
(48640, 11, -159.93, -22.64, -57.42, 100, 0, 0, 0),
(48640, 12, -161.85, -34.80, -58.64, 100, 0, 0, 0),
(48640, 13, -161.03, -44.28, -59.35, 100, 0, 0, 0),
(48640, 14, -152.77, -49.35, -58.34, 100, 0, 0, 0),
(48640, 15, -147.61, -55.37, -58.26, 100, 0, 0, 0),
(48640, 16, -148.75, -64.99, -59.32, 100, 0, 0, 0),
(48640, 17, -160.75, -65.05, -59.43, 100, 0, 0, 0),
(48640, 18, -181.04, -66.69, -59.36, 100, 0, 0, 0),
(48640, 19, -205.76, -70.91, -62.96, 100, 0, 0, 0),
(48640, 20, -223.56, -66.81, -61.37, 100, 0, 0, 0),
(48640, 21, -205.76, -70.91, -62.96, 100, 0, 0, 0),
(48640, 22, -181.04, -66.69, -59.36, 100, 0, 0, 0),
-- Patrol trogg back and forth through the tunnel
(1754, 1, -157.09, 3.80, -42.94, 100, 0, 0, 0),
(1754, 2, -166.27, 6.94, -48.94, 100, 0, 0, 0),
(1754, 3, -180.29, 3.54, -55.41, 100, 0, 0, 0),
(1754, 4, -205.07, -1.31, -61.62, 100, 0, 0, 0),
(1754, 5, -180.29, 3.54, -55.41, 100, 0, 0, 0),
(1754, 6, -166.27, 6.94, -48.94, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Ragefire Shaman (11319)
-- --------------------------------------------------------------------------------------------------

-- Melee from the pull, a Lightning Bolt now and then
DELETE FROM `creature_ai_events` WHERE `creature_id`=11319;
DELETE FROM `creature_ai_scripts` WHERE `id`=1131901;
DELETE FROM `creature_spells` WHERE `entry`=113190;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`,
    `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`) VALUES
(113190, 'Ragefire Chasm - Ragefire Shaman',
    11986, 100, 17, 0, 30, 0, 0, 0, 30, 35, 0, -- Healing Wave
    9532, 100, 1, 0, 0, 0, 2, 7, 7, 11, 0);    -- Lightning Bolt
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=11319;

UPDATE `creature` SET `position_x`=-142.2067, `position_y`=-19.37899, `position_z`=-54.85903, `orientation`=1.456971 WHERE `guid`=43580;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1449, 11319, 0, 0, 0, 0, 389, -286.766, -70.4934, -60.4778, 1.16064, 7200, 7200, 2, 100, 100, 1, 0, 0, 0, 10);

-- --------------------------------------------------------------------------------------------------
-- Trash: Earthborer (11320)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=113200;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(113200, 'Ragefire Chasm - Earthborer',
    18070, 100, 1, 0, 0, 0, 4, 10, 5, 14, 0); -- Earthborer Acid

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=48675;
DELETE FROM `creature_movement` WHERE `id`=48675;

-- --------------------------------------------------------------------------------------------------
-- Trash: Molten Elemental (11321)
-- --------------------------------------------------------------------------------------------------

-- Fire Shield is a passive aura with 5 s ticks
DELETE FROM `creature_ai_events` WHERE `creature_id`=11321;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1132101, 1132102);
UPDATE `creature_template` SET `ai_name`='', `auras`='18268' WHERE `entry`=11321;

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid`=48698;
DELETE FROM `creature_movement` WHERE `id`=48698;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(1756, 11321, 0, 0, 0, 0, 389, -106.828, 31.6561, -18.0723, 1.2437, 7200, 7200, 0, 100, 0, 2, 0, 0, 0, 10);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(1756, 1, -106.828, 31.6561, -18.0723, 100, 0, 0, 0),
(1756, 2, -100.82, 49.3606, -17.8358, 100, 0, 0, 0),
(1756, 3, -109.602, 64.9999, -19.4685, 100, 0, 0, 0),
(1756, 4, -119.275, 73.4505, -20.882, 100, 0, 0, 0),
(1756, 5, -130.936, 76.2791, -21.8267, 100, 0, 0, 0),
(1756, 6, -131.894, 90.1278, -21.0279, 100, 0, 0, 0),
(1756, 7, -126.455, 100.317, -20.0144, 100, 0, 0, 0),
(1756, 8, -118.159, 102.362, -17.667, 100, 0, 0, 0),
(1756, 9, -104.32, 104.222, -12.2055, 100, 0, 0, 0),
(1756, 10, -89.4216, 99.6717, -7.52993, 100, 0, 0, 0),
(1756, 11, -71.771, 84.5207, -6.86676, 100, 0, 0, 0),
(1756, 12, -89.4216, 99.6717, -7.52993, 100, 0, 0, 0),
(1756, 13, -104.32, 104.222, -12.2055, 100, 0, 0, 0),
(1756, 14, -118.159, 102.362, -17.667, 100, 0, 0, 0),
(1756, 15, -126.455, 100.317, -20.0144, 100, 0, 0, 0),
(1756, 16, -131.894, 90.1278, -21.0279, 100, 0, 0, 0),
(1756, 17, -130.936, 76.2791, -21.8267, 100, 0, 0, 0),
(1756, 18, -119.275, 73.4505, -20.882, 100, 0, 0, 0),
(1756, 19, -109.602, 64.9999, -19.4685, 100, 0, 0, 0),
(1756, 20, -100.82, 49.3606, -17.8358, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Searing Blade Cultist (11322)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=113220;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(113220, 'Ragefire Chasm - Searing Blade Cultist',
    18266, 100, 1, 0, 0, 32, 3, 15, 9, 13, 0); -- Curse of Agony

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid` IN (48689, 48710, 48717, 48722, 48734, 48735, 48743, 48746);
UPDATE `creature` SET `wander_distance`=2 WHERE `guid` IN (48726, 48727, 48733);
UPDATE `creature` SET `position_x`=-265.208, `position_y`=100.599, `position_z`=-24.9443, `orientation`=2.75762 WHERE `guid`=48705;
UPDATE `creature` SET `position_x`=-369.555, `position_y`=261.144, `position_z`=-4.97183, `orientation`=4.0072 WHERE `guid`=48734;

-- --------------------------------------------------------------------------------------------------
-- Trash: Searing Blade Enforcer (11323)
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_spells` WHERE `entry`=113230;
INSERT INTO `creature_spells` (`entry`, `name`,
    `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`) VALUES
(113230, 'Ragefire Chasm - Searing Blade Enforcer',
    8242, 100, 1, 0, 0, 32, 4, 12, 8, 17, 0); -- Shield Slam

UPDATE `creature` SET `movement_type`=0, `wander_distance`=0 WHERE `guid`=48703;

INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(642, 11323, 0, 0, 0, 0, 389, -334.2738, 216.0322, -20.54132, 0.296706, 7200, 7200, 0, 100, 0, 0, 0, 0, 0, 10);

-- 48690 walks the loop of 48696 behind it
DELETE FROM `creature_movement` WHERE `id`=48690;
UPDATE `creature` SET `movement_type`=0 WHERE `guid`=48690;

-- 48707 walks from a junction to three dead ends
UPDATE `creature` SET `position_x`=-247.37, `position_y`=140.41, `position_z`=-18.69, `orientation`=4.293 WHERE `guid`=48707;
DELETE FROM `creature_movement` WHERE `id`=48707;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `waittime`, `wander_distance`, `script_id`) VALUES
(48707, 1, -247.37, 140.41, -18.69, 100, 0, 0, 0),
(48707, 2, -261.77, 108.11, -25.02, 100, 0, 0, 0),
(48707, 3, -247.37, 140.41, -18.69, 100, 0, 0, 0),
(48707, 4, -233.09, 152.47, -18.82, 100, 0, 0, 0),
(48707, 5, -197.21, 155.97, -25.24, 100, 0, 0, 0),
(48707, 6, -233.87, 153.49, -18.81, 100, 0, 0, 0),
(48707, 7, -241.35, 162.05, -18.64, 100, 0, 0, 0),
(48707, 8, -233.22, 197.04, -24.93, 100, 0, 0, 0),
(48707, 9, -241.35, 162.05, -18.64, 100, 0, 0, 0),
(48707, 10, -233.87, 153.49, -18.81, 100, 0, 0, 0),
(48707, 11, -197.21, 155.97, -25.24, 100, 0, 0, 0),
(48707, 12, -233.08, 152.47, -18.85, 100, 0, 0, 0);

-- --------------------------------------------------------------------------------------------------
-- Trash: Searing Blade Warlock (11324)
-- --------------------------------------------------------------------------------------------------

UPDATE `creature` SET `movement_type`=1, `wander_distance`=2 WHERE `guid` IN (48693, 48709, 48716, 48724, 48736, 48738);

-- --------------------------------------------------------------------------------------------------
-- Instance-wide
-- --------------------------------------------------------------------------------------------------

DELETE FROM `creature_groups` WHERE `leader_guid`=48687 AND `member_guid`=48690;
DELETE FROM `creature_groups` WHERE `leader_guid`=48704 AND `member_guid`=48703;
INSERT INTO `creature_groups` (`leader_guid`, `member_guid`, `dist`, `angle`, `flags`) VALUES
(48696, 48690, 15, 3.14159, 3), -- OPTION_FORMATION_MOVE | OPTION_AGGRO_TOGETHER
(48731, 642, 0, 0, 2);          -- OPTION_AGGRO_TOGETHER

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
