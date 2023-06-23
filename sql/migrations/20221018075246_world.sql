DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221018075246');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221018075246');
-- Add your query below.


-- Move permanent auras of Wildthorn Lurker to template.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (382101);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3821;
UPDATE `creature_template` SET `auras`='3616 6920', `ai_name`='' WHERE `entry`=3821;

-- Move permanent auras of Forsaken Assassin to template.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (380701);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3807;
UPDATE `creature_template` SET `auras`='6718 8601', `ai_name`='' WHERE `entry`=3807;

-- Move permanent auras of Forsaken Intruder to template.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (380401, 380402);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3804;
UPDATE `creature_template` SET `auras`='6718', `ai_name`='', `spell_list_id`=38040 WHERE `entry`=3804;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (38040, 'Ashenvale - Forsaken Intruder', 7159, 100, 1, 0, 0, 0, 5, 9, 5, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Remove not needed EventAI from Ashenvale Outrunner.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1285601);
DELETE FROM `creature_ai_events` WHERE `creature_id`=12856;

-- Correct auras used by Silvermane Stalker.
UPDATE `creature_template` SET `auras`='7939 22766' WHERE `entry`=2926;

-- Clear addon rows applying wrong auras.
DELETE FROM `creature_addon` WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id` IN (3821, 3807, 3804, 12856, 2926));


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
