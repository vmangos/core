DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230623143144');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230623143144');
-- Add your query below.


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: All Humanoids Should Swim
-- brotalnia: [x} Doubt - This sounds extremely unlikely to me. Whether creatures can swim is dictates by static flags, can be checked based on those.
UPDATE `creature_template` SET `inhabit_type` = 3 WHERE `type` = 7 AND `inhabit_type` = 1;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: Correct Some Creature Loot (Credit TrinityCore)
-- brotalnai: But they have loot on wowhead? https://www.wowhead.com/classic/npc=4625/deaths-head-ward-keeper
DELETE FROM `creature_loot_template` WHERE `entry` IN (4625);
UPDATE `creature_template` SET `loot_id` = 0, `skinning_loot_id` = 0 WHERE `entry` IN (4625);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: Remove Incorrect Aura
-- brotalnia: In sniffs all spawns have permanent aura 14108 though?
UPDATE `creature_template` SET `auras` = '' WHERE  `entry` = 6508;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: New creature spell lists. (We should really sync with cmangos ACID)
-- brotalnia: They don't appear to cast any spells in sniffs? Checked 1.13, 1.14, 2.5, nothing.
UPDATE `creature_template` SET `spell_list_id` = 74550 WHERE `entry` = 7455;
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES
(74550, 'Winterspring - Winterspring Owl', 16576, 100, 1, 0, 0, 32, 8, 11, 10, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: Correct Quest Progression For Donation of wool/silk/mageweave/runecloth For Patch 3
-- brotalnia: I remember working on the cloth donation quests when going through patch notes, and they were supposed to be connected differently in old patches.
-- brotalnia: If you are making them the same as 1.12 for older patches, this is wrong. Please go through Patch.txt in your game folder and read through cloth quest changes.
-- brotalnia: These changes are why I put off reviewing this for so many months, because I dread having to go back and research this again. I fear you are undoing progression.

-- Wool 
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7791 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7792 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7802 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7807 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7813 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7820 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7826 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7833 AND `patch`=3;

-- Silk
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7834 AND `patch`=3;

-- Mageweave
UPDATE `quest_template` SET `ExclusiveGroup`=-7791 WHERE  `entry`=7794 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7792 WHERE  `entry`=7799 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7802 WHERE  `entry`=7804 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7807 WHERE  `entry`=7809 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7813 WHERE  `entry`=7817 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7820 WHERE  `entry`=7822 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7826 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `ExclusiveGroup`=-7833 WHERE  `entry`=7835 AND `patch`=3;

-- Misc Wool
UPDATE `quest_template` SET `NextQuestId`=7795 WHERE  `entry`=7791 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7800 WHERE  `entry`=7792 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7805 WHERE  `entry`=7802 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7811 WHERE  `entry`=7807 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7818 WHERE  `entry`=7813 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7823 WHERE  `entry`=7820 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7826 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7833 AND `patch`=3;

-- Misc Silk
UPDATE `quest_template` SET `NextQuestId`=7795 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7800 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7805 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7811 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7818 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7823 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7834 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7793 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7798 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7808 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7803 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7814 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7821 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7827 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7834 AND `patch`=3;

-- Misc Mageweave
UPDATE `quest_template` SET `NextQuestId`=7824 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `NextQuestId`=7836 WHERE  `entry`=7835 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7794 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7804 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7809 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7817 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7822 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7831 AND `patch`=3;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE  `entry`=7835 AND `patch`=3;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: Cenarion Outrider Should Spawn at Patch 7
-- brotalia: Are you sure about this? Silithus revamp came in patch 1.8 not 1.9. Also his display id was added in 1.8.
UPDATE `creature` SET `patch_min` = 7 WHERE `id` = 15545;

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Nicky: Corrections to Rogue Class Quests
-- brotalnia: These changes cause the following startup errors:
/*
Quest 2241 is a breadcrumb, it should not be in exclusive group 2205
Quest 1859 is a breadcrumb, it should not be in exclusive group 1859
Quest 1885 is a breadcrumb, it should not be in exclusive group 1859
Quest 2205 is a breadcrumb, it should not be in exclusive group 2205
Quest 2218 is a breadcrumb, it should not be in exclusive group 2205
*/

UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1886, `NextQuestInChain` = 0 WHERE `entry` = 1885;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1886;

UPDATE `quest_template` SET `BreadcrumbForQuestId` = 1963, `NextQuestInChain` = 0 WHERE `entry` = 1859;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 1963;
UPDATE `quest_template` SET `RequiredRaces` = 130 WHERE `entry` = 1859;

UPDATE `quest_template` SET `NextQuestId`= 0, `BreadcrumbForQuestId` = 2238, `NextQuestInChain` = 0, `QuestFlags` = 0 WHERE `entry` = 2218;
UPDATE `quest_template` SET `PrevQuestId`= 0 WHERE `entry` = 2238;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2206 WHERE `entry` = 2205;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2206;

UPDATE `quest_template` SET `NextQuestId` = 0, `BreadcrumbForQuestId` = 2242 WHERE `entry` = 2241;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 2242;

REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(805, -2, 804, 803, 802, 0, 1),
(804, 22, 2206, 0, 0, 0, 1),
(803, 22, 2238, 0, 0, 0, 1),
(802, 22, 2242, 0, 0, 0, 1);

UPDATE `quest_template` SET `RequiredCondition` = 805 WHERE `entry` IN (2218, 2205, 2241);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
