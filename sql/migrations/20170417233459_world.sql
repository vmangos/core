INSERT INTO `migrations` VALUES ('20170417233459');

-- Update Silt Crawler not being able to swim
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 922;
-- Update Monstrous Crawler not being able to swim
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 1088;
-- Update Pygmy Surf Crawler not being able to swim
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 3106;
-- Update Surf Crawler not being able to swim
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 3107;
