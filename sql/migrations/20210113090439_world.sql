DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210113090439');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210113090439');
-- Add your query below.


-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Orgrimmar Horde
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- H [60] Children's Week (Horde) q.172
-- 	H [60] Gateway to the Frontier q.911
-- 	H [60] Down at the Docks q.910
-- 	H [60] Lordaeron Throne Room q.1800
-- 		H [60] You Scream, I Scream... q.915
-- 		H [60] Cairne's Hoofprint q.925
-- 			H [60] A Warden of the Horde q.5502

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=172 && `patch`>=2; -- Children's Week (Horde)

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=172, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=911; -- Gateway to the Frontier
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=172, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=910; -- Down at the Docks
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=172, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=1800; -- Lordaeron Throne Room

-- All three above quests are required to unlock both these quests. We have no option but to use conditions for this case
INSERT INTO conditions (condition_entry, type, value1, value2, value3, value4) VALUES
(10229, 8, 911, 0, 0, 0), -- Gateway to the Frontier
(10230, 8, 910, 0, 0, 0), -- Down at the Docks
(10231, 8, 1800, 0, 0, 0), -- Lordaeron Throne Room
(10232, -1, 10229, 10230, 10231, 0);

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=5502, ExclusiveGroup=-925, NextQuestInChain=0, RequiredCondition=10232 WHERE entry=915; -- You Scream, I Scream...
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=5502, ExclusiveGroup=-925, NextQuestInChain=0, RequiredCondition=10232 WHERE entry=925; -- Cairne's Hoofprint

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=5502; -- A Warden of the Horde

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stormwind Alliance
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- A [60] Children's Week (Alliance) q.1468
-- 	A [60] Spooky Lighthouse q.1687
-- 	A [60] The Stonewrought Dam q.1558
-- 	A [60] The Bough of the Eternals q.1479
-- 		A [60] You Scream, I Scream... q.4822
-- 		A [60] Jaina's Autograph q.558
-- 			A [60] A Warden of the Alliance q.171

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=1468; -- Children's Week (Alliance)

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=1468, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=1687; -- Spooky Lighthouse
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=1468, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=1558; -- The Stonewrought Dam
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=1468, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=1479; -- The Bough of the Eternals

-- All three above quests are required to unlock both these quests. We have no option but to use conditions for this case
INSERT INTO conditions (condition_entry, type, value1, value2, value3, value4) VALUES
(10233, 8, 1687, 0, 0, 0), -- Spooky Lighthouse
(10234, 8, 1558, 0, 0, 0), -- The Stonewrought Dam
(10235, 8, 1479, 0, 0, 0), -- The Bough of the Eternals
(10236, -1, 10233, 10234, 10235, 0);

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=171, ExclusiveGroup=-4822, NextQuestInChain=0, RequiredCondition=10236 WHERE entry=4822; -- You Scream, I Scream...
UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=171, ExclusiveGroup=-4822, NextQuestInChain=0, RequiredCondition=10236 WHERE entry=558; -- Jaina's Autograph

UPDATE quest_template SET MinLevel=10, QuestLevel=60, PrevQuestId=0, NextQuestId=0, ExclusiveGroup=0, NextQuestInChain=0, RequiredCondition=0 WHERE entry=171 && `patch`>=2; -- A Warden of the Alliance


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
