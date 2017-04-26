INSERT INTO `migrations` VALUES ('20170423220438');

UPDATE `script_texts` SET `content_default` = "Soon you will know the price of your meddling, mortals... The master is nearly whole... And when he rises, your world will cease!"
WHERE `entry` = -1509017;

-- Buff General Rajaxx's stats
UPDATE `creature_template` SET `armor` = 12000, `resistance2` = 150, `resistance3` = 150, `resistance4` = 150, `resistance5` = 150, `resistance6` = 150
WHERE `entry` = 14341;