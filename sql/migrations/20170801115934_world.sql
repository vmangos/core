INSERT INTO `migrations` VALUES ('20170801115934');

-- Corrects the respawn time of a specific Gromsblood in Ashenvale, old value
-- was 7200
UPDATE `gameobject` SET `spawntimesecs` = 2700 WHERE `guid` = 16511;
