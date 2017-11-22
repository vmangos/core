INSERT INTO `migrations` (`id`) VALUES ('LB_108_RELEASE');

-- Hero of the Frostwolf/Stormpike quests
UPDATE `quest_template` 
    SET `patch` = 3, `Method` = `Method` & ~1
    WHERE `entry` IN (8271, 8272) AND `patch` = 6;

UPDATE `creature_questrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);
UPDATE `creature_involvedrelation` SET `patch` = 3 WHERE `quest` IN (8271, 8272);

-- Remove base level Korrak rewards, allow beyond 1.8
UPDATE `quest_template` 
    SET `RewChoiceItemId1` = 0, `RewChoiceItemId2` = 0, `RewChoiceItemId3` = 0, 
        `RewChoiceItemCount1` = 0, `RewChoiceItemCount2` = 0, `RewChoiceItemCount3` = 0,
        `Method` = `Method` & ~1
    WHERE `entry` IN (7181, 7202);

-- Disabled food and oil spells due to accidental formula release, re-added in 1.9
DELETE FROM `spell_disabled`;
REPLACE INTO `spell_disabled` 
    VALUES  (25117), -- Minor Wizard Oil
            (25118), -- Minor Mana Oil
            (25119), -- Lesser Wizard Oil
            (25120), -- Lesser Mana Oil
            (25121), -- Wizard Oil
            (25122), -- Brilliant Wizard Oil
            (25123), -- Brilliant Mana Oil
            (25660), -- Dirge's Kickin' Chimaerok Chops
            (25691), -- Smoked Sagefish
            (25704), -- Smoked Sagefish
            (25722), -- Rumsey Rum Dark
            (25804), -- Rumsey Rum Black Label
            (26276); -- Greater Firepower (1.10)
UPDATE `item_template` SET `patch` = 0 WHERE `entry` = 21546; -- Allow Greater Firepower to remain in-game
