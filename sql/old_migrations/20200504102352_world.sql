DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200504102352');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200504102352');
-- Add your query below.


-- fix donation quests used by mistina steelshield
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7805, `ExclusiveGroup` = -7802 WHERE `entry` IN (7802, 7803, 7804) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7805;

-- fix donation quests used by bubulo acerbus
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7811, `ExclusiveGroup` = -7807 WHERE `entry` IN (7807, 7808, 7809) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7811;

-- fix donation quests used by clavicus knavingham 
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7795, `ExclusiveGroup` = -7791 WHERE `entry` IN (7791, 7793, 7794) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7795;

-- fix donation quests used by raedon duskstriker
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7800, `ExclusiveGroup` = -7797 WHERE `entry` IN (7797, 7798, 7799) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7800;

-- fix donation quests used by rashona straglash
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7824, `ExclusiveGroup` = -7826 WHERE `entry` IN (7826, 7827, 7831) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7832 WHERE `entry` = 7824;
UPDATE `quest_template` SET `PrevQuestId` = 7824 WHERE `entry` = 7832;

-- fix donation quests used by vehena
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7836, `ExclusiveGroup` = -7833 WHERE `entry` IN (7833, 7834, 7835) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7837 WHERE `entry` = 7836;
UPDATE `quest_template` SET `PrevQuestId` = 7836 WHERE `entry` = 7837;

-- fix donation quests used by rumstag proudstrider
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7823, `ExclusiveGroup` = -7820 WHERE `entry` IN (7820, 7821, 7822) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7823;

-- fix donation quests used by ralston farnsley
UPDATE `quest_template` SET `PrevQuestId` = 0, `NextQuestId` = 7818, `ExclusiveGroup` = -7813 WHERE `entry` IN (7813, 7814, 7817) AND `patch` = 7;
UPDATE `quest_template` SET `PrevQuestId` = 0 WHERE `entry` = 7818;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
