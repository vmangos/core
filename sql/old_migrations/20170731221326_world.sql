INSERT INTO `migrations` VALUES ('20170731221326');

-- Tideress does not do frost base damage:
-- (Joana's guide 26-27 https://youtu.be/ZjFoYPGGpsA?t=6m3s)
UPDATE `creature_template` SET `dmgschool` = 0 WHERE `entry` = 12759;
