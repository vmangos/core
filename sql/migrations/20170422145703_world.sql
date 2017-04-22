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

