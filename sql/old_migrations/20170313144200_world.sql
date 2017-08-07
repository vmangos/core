INSERT INTO `migrations` VALUES ('20170313144200');

-- Change damage school from frost to nature on Noxxion
UPDATE `creature_template` SET `dmgschool` = 3 WHERE `entry` = 13282 LIMIT 1;

-- Change damage school from frost to nature on Noxxion's Spawn
UPDATE `creature_template` SET `dmgschool` = 3 WHERE `entry` = 13456 LIMIT 1;
