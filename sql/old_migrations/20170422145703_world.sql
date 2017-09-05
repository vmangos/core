INSERT INTO `migrations` VALUES ('20170422145703');

-- Update Dr. Weavil
UPDATE `creature_template`
SET `maxhealth` = 1000000, `minhealth` = 1000000, `armor` = 7000, `mindmg` = 2400, `maxdmg` = 2600,
`resistance1` = 0, `resistance2` = 250, `resistance3` = 250,`resistance4` = 250, `resistance5` = 250,`resistance6` = 250
WHERE `entry` = 15552;

-- Update Number Two
UPDATE `creature_template`
SET `maxhealth` = 600000, `minhealth` = 600000, `armor` = 5500, `mindmg` = 2000, `maxdmg` = 2100, `scale` = 5,
`resistance1` = 0, `resistance2` = 150, `resistance3` = 150,`resistance4` = 150, `resistance5` = 150,`resistance6` = 150
WHERE `entry` = 15554;

-- Update Maws
UPDATE `creature_template`
SET `maxhealth` = 1700000, `minhealth` = 1700000, `armor` = 9500, `mindmg` = 3400, `maxdmg` = 4500, `scale` = 8, `speed_run` = 2,
`resistance1` = 0, `resistance2` = 300, `resistance3` = 150,`resistance4` = 150, `resistance5` = 150,`resistance6` = 150
WHERE `entry` = 15571;

-- Update Twilight Corrupter
UPDATE `creature_template`
SET `maxhealth` = 1000616, `minhealth` = 1000616, `armor` = 7000, `mindmg` = 2000, `maxdmg` = 2100,
`resistance1` = 0, `resistance2` = 250, `resistance3` = 250,`resistance4` = 250, `resistance5` = 300,`resistance6` = 250
WHERE `entry` = 15625;

-- Delete Narain's Scrying Goggles from bosses
DELETE FROM `creature_loot_template` WHERE `item` = 20951;

-- Add Narain's Scrying Goggles with 0.6635% chance to MC Trash
-- Gives about 78% chance to drop from 1 run, 95% from 2
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(11658, 20951,  -0.6635, 0,  1,  1,  0),
(11659, 20951,  -0.6635, 0,  1,  1,  0),
(11661, 20951,  -0.6635, 0,  1,  1,  0),
(11662, 20951,  -0.6635, 0,  1,  1,  0),
(11665, 20951,  -0.6635, 0,  1,  1,  0),
(11666, 20951,  -0.6635, 0,  1,  1,  0),
(11667, 20951,  -0.6635, 0,  1,  1,  0),
(11668, 20951,  -0.6635, 0,  1,  1,  0),
(11669, 20951,  -0.6635, 0,  1,  1,  0),
(11671, 20951,  -0.6635, 0,  1,  1,  0),
(11672, 20951,  -0.6635, 0,  1,  1,  0),
(11673, 20951,  -0.6635, 0,  1,  1,  0),
(12076, 20951,  -0.6635, 0,  1,  1,  0),
(12099, 20951,  -0.6635, 0,  1,  1,  0),
(12100, 20951,  -0.6635, 0,  1,  1,  0),
(12101, 20951,  -0.6635, 0,  1,  1,  0),
(12119, 20951,  -0.6635, 0,  1,  1,  0);

