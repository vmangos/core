UPDATE `quest_template` 
    SET `Method` = `Method` & ~1, 
        `RewChoiceItemId1` = 0, `RewChoiceItemId2` = 0, `RewChoiceItemId3` = 0, 
        `RewChoiceItemCount1` = 0, `RewChoiceItemCount2` = 0, `RewChoiceItemCount3` = 0 
    WHERE `entry` IN (7181, 7202) AND `patch` = 6; -- ALways allow Korrak quests
