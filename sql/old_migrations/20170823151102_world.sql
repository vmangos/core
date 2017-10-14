INSERT INTO `migrations` VALUES ('20170823151102');

-- Nightfall, only proc on periodic effects
UPDATE `spell_proc_event` SET `procFlags` = 262144 WHERE `entry` = 18094;

-- Blackout, default proc flags
UPDATE `spell_proc_event` SET `procFlags` = 0 WHERE `entry` = 15268;
