INSERT INTO `migrations` VALUES ('20170813130014');

-- Fix Tactical Task Briefing item quests(should all be repeatable)

-- Combat Task Briefing quests

UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry` IN (8770,8771,8502,8773,8775,8539,8772,8687,8774,8776,8777,8501);

-- Logistics Task Briefing quests

UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry` IN (8497,8804,8540,8805,8541,8806,8778,8785,8783,8809,8779,8807,8781,8786,8780,8787,8782,8808,8496,8810,8829);

-- Tactical Task Briefing quests

UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry` IN (8737,8537,8536,8535,8740,8538,8534,8738,8739,8498);
