INSERT INTO `migrations` VALUES ('20170407205047'); 

-- Add correct spell to Ancient Mana Spring Totem
UPDATE `creature_template` SET `spell1`=24853 WHERE `entry`=15304;