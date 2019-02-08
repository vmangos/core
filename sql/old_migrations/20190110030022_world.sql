DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190110030022');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190110030022');
-- Add your query below.


-- Fix possible crash when Ghost of the Past dies.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1094004);
DELETE FROM `creature_ai_events` WHERE `id`=1094004;

-- Remove triggered flag from Serpent Form used by Druid of the Fang.
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (38400, 'Wailing Caverns - Druid of the Fang', 8041, 100, 0, 0, 0, 0, 10, 20, 240, 240, 0, 5187, 100, 15, 0, 0, 0, 0, 0, 12, 18, 0, 8040, 100, 4, 0, 0, 32, 8, 9, 10, 20, 0, 9532, 90, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- Make Galen Goodward an active object so that he respawns properly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=5391;

-- Make Ruul Snowhoof an active object so that he respawns properly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=12818;

-- Make Gilthares Firebough an active object so that he respawns properly.
UPDATE `creature` SET `spawnFlags`=1 WHERE `id`=3465;

-- Fix switched texts for commendations quests.
UPDATE `quest_template` SET `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Stormwind.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so. We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8836;
UPDATE `quest_template` SET `RequestItemsText`='For those adventurers who have but a single commendation signet, I\'ll exchange it for a small amount of recognition with Darnassus.$B$BPlease bear in mind that it is better to hand over a stack of ten signets at once; your efforts will receive greater recognition in doing so. We offer a single signet exchange as a service for those who don\'t have enough for a full stack of ten.$B$BWith that being said, I stand ready to assist you if you still wish to hand in a single signet.' WHERE `entry`=8830;
UPDATE `quest_template` SET `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty. For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Darnassus. I also accept single tokens, but at a much reduced rate of recognition. We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8831;
UPDATE `quest_template` SET `RequestItemsText`='I accept commendation signets from adventurers who have received them in the line of duty. For each set of ten that you hand to me, I\'ll make sure that you receive a significant acknowledgement of your deeds with Stormwind. I also accept single tokens, but at a much reduced rate of recognition. We are much more interested in greater feats of duty, though no feat will be ignored.$B$BWith that said, I\'ll gladly take your signets if you are ready to hand in a set.' WHERE `entry`=8837;

-- Add missing reputation on kill for Khan Shaka.
-- https://github.com/cmangos/classic-db/commit/eba2b058b42f69b5ca72b7e932b9f9bfdb981368
INSERT INTO `creature_onkill_reputation` (`creature_id`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5602, 93, 92, 4, 0, 20, 4, 0, -100, 0);

-- Correct faction of Mist.
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=3568;

-- Correct faction of Oben Rageclaw.
UPDATE `creature_template` SET `faction`=80 WHERE `entry`=7317;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
