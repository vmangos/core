DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210312231945');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210312231945');
-- Add your query below.


-- Quests: Winterhoof Cleansing, Thunderhorn Cleansing, Wildmane Cleansing
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(332887, 2904, 1, -2544.54, -712.088, -9.232, 0.767944, 1, -60, -60),
(332888, 2904, 1, -1823.85, -237.555, -9.42485, 0.069812, 1, -60, -60),
(332889, 2904, 1, -753.256, -149.158, -29.0568, 3.08918, 1, -60, -60);

DELETE FROM `event_scripts` WHERE `id` IN (466, 467, 468);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(466, 0, 9, 332887, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Winterhoof Cleansing - Respawn Water Well Cleansing Aura (GUID: 332887)"),
(467, 0, 9, 332888, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Thunderhorn Cleansing - Respawn Water Well Cleansing Aura (GUID: 332888)"),
(468, 0, 9, 332889, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Wildmane Cleansing - Respawn Water Well Cleansing Aura (GUID: 332889)");

-- Fixed Okla position
UPDATE `creature` SET `position_x` = 270.076, `position_y` = -3036.6, `position_z` = 97.6192 WHERE `id` = 14873;

-- Completion script for quest 'Call of Fire' (Part 3)
UPDATE `quest_template` SET `CompleteScript` = 1525 WHERE `entry` = 1525;

DELETE FROM `quest_end_scripts` WHERE `id` = 1525;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1525, 1, 15, 9200, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Telf Joolam - Cast Spell Create Sapta");

-- Completion script for quest 'Call of Fire' (Part 5)
UPDATE `quest_template` SET `CompleteScript` = 1527 WHERE `entry` = 1527;

DELETE FROM `quest_end_scripts` WHERE `id` = 1527;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(1527, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2181, 0, 0, 0, 0, 0, 0, 0, 0, "Kranal Fiss - Say Text");

-- Quest Greets Rus Locales
UPDATE `quest_greeting` SET `content_loc8` = "Чтобы выжить, мы должны следовать путям природы и постигать ее тайны." WHERE `entry` = 3419;

-- The Stagnant Oasis
DELETE FROM `event_scripts` WHERE `id` = 525;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(525, 0, 9, 332890, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "The Stagnant Oasis - Respawn Fissure Plant (GUID: 332890)"),
(525, 0, 9, 332891, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "The Stagnant Oasis - Respawn Fissure Plant (GUID: 332891)"),
(525, 0, 9, 332892, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "The Stagnant Oasis - Respawn Fissure Plant (GUID: 332892)"),
(525, 0, 9, 332893, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "The Stagnant Oasis - Respawn Fissure Plant (GUID: 332893)"),
(525, 0, 9, 332894, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "The Stagnant Oasis - Respawn Fissure Plant (GUID: 332894)");

INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(332890, 3743, 1, -1278.97, -3008.1, 72.0716, 0.86185, 1, -62, -62),
(332891, 3743, 1, -1275.4, -3006.46, 72.5618, 1.29382, 1, -62, -62),
(332892, 3743, 1, -1279.63, -3014.32, 71.7535, 0.539832, 1, -62, -62),
(332893, 3743, 1, -1277.91, -3016.5, 72.699, 0.889334, 1, -62, -62),
(332894, 3743, 1, -1274.86, -3016.2, 72.6146, 1.63939, 1, -62, -62);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
