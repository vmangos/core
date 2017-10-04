INSERT INTO `migrations` VALUES ('20170902145112'); 

-- Prevent multiple Shade of Hakkar from being spawned at the same time
-- 60 unit search range, SUMMON_CREATURE_UNIQUE
UPDATE `event_scripts` SET `datalong4` = 60, `data_flags` = 2 WHERE `id` = 8502;

-- Remove script action that sets instance data on Suppressor death, it's useless
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 8497 AND `id` = 849702;
