DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171006175515');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171006175515');
-- Add your query below.


-- Remove bugged Brewfest event. It was added in TBC.
DELETE FROM `game_event` WHERE `entry`=26;
DELETE FROM `game_event_gameobject` WHERE `event`=26;
DELETE FROM `gameobject` WHERE `guid` IN (11140, 14465, 16706, 18015, 20839, 20840, 20841, 20843, 20844, 31421, 31424, 31425, 31426, 31430, 31431, 31437, 31440, 31443, 31444, 31445, 31446, 31447, 31448, 31449, 31450, 31453, 31459, 31460, 31461, 31462, 31464, 31465, 31466, 31468, 31469, 31470, 31471, 31474, 31475, 31476, 31477, 31478, 31485, 31486, 31487, 31488, 31489, 31492, 31493, 31494, 31495, 31496, 31497, 31498, 31499, 31500, 31509, 31513, 31514, 31515, 31516, 31517, 31518, 31529, 31532, 31538, 31539, 31540, 31541, 31542, 31543, 31544, 31545, 31546, 31547, 31548, 31549, 31550, 31551, 31552, 31553, 31554, 31555, 31556, 31557, 31558, 31559, 31560, 31561, 31562, 31563, 31564, 31565, 31566, 31567, 31570, 31605, 31606, 31607, 31619, 31627, 31629, 31630, 31631, 31632, 31634, 31636, 31640, 31641, 31642, 31643, 31644, 31645, 31646, 31647, 31648, 31649, 31650, 31651, 31652, 31653, 31654, 31655, 31656, 31657, 31658, 31659, 31660, 31661, 31662, 31666, 31667, 31668, 31669, 31670, 31671, 31672, 31673, 31674, 31677, 31678, 31679, 31680, 31681, 31682, 31683, 31685, 31686, 31687, 31689, 31690, 31691, 31692, 31693, 31694, 31695, 31696, 31697, 31698, 31699, 31701, 31702, 31705, 31708, 31709, 31712, 31713, 31715, 31718, 31721, 31722, 31723, 31725, 31726, 31727, 31728, 31730, 31731, 31734, 31738, 31739, 31740, 31744, 31746, 31747, 31750, 31751, 31753, 31758, 31760, 31761, 31762, 31765, 31766, 31767, 31768, 31769, 31774, 31775, 31776, 31777, 31781, 31782, 31783, 31784, 31789, 31790, 31791, 31792, 31793, 31794, 31797, 31800, 31801, 31803, 31804, 31805, 31806, 31807, 31808, 31809, 31810, 31820, 31821, 31822, 31823, 31824, 31826, 31827, 31828, 31833, 31835, 31836, 31837, 31838, 31839, 31840, 31841, 31842, 31843, 31844, 31845, 31846, 31847, 31860, 31861, 31862, 31863, 31864, 31865, 31866, 31872, 31874, 31875, 31876, 31877, 31878, 31879, 31886, 31887, 31888, 31889, 31892, 31893, 31895, 31898, 31912, 31913, 31914, 31915, 31916, 31917, 31918, 31919);

-- Remove Zeth'Kur transfer event.
DELETE FROM `game_event` WHERE `entry`=79;
DELETE FROM `game_event_creature` WHERE `event`=79;
DELETE FROM `game_event_gameobject` WHERE `event`=79;
DELETE FROM `game_event_quest` WHERE `event`=79;
DELETE FROM `creature_template` WHERE `entry` IN (99994, 99995, 99996, 99997, 99998, 99999);
DELETE FROM `gossip_menu` WHERE `entry` IN (30000, 30001, 30002, 30003, 30004, 30005, 30006, 30007, 30008);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (30000, 30001, 30002, 30003, 30004, 30005);
DELETE FROM `npc_text` WHERE `ID` IN (500000, 500001, 500002, 500003, 500004, 500005, 500006, 500007, 500008);
DELETE FROM `quest_template` WHERE `entry`=137706;
DELETE FROM `creature_questrelation` WHERE `quest`=137706;
DELETE FROM `creature_involvedrelation` WHERE `quest`=137706;
DELETE FROM `item_template` WHERE `entry` IN (50001, 50002, 50003);
DELETE FROM `gameobject` WHERE `guid` IN (3998448, 3998449, 3998450, 3998451, 3998452, 3998453, 3998454, 3998455, 3998456, 3998457, 3998458, 3998459, 3998460, 3998461, 3998462, 3998463, 3998464, 3998465, 3998466, 3998467, 3998468, 3998469, 3998470, 3998471, 3998472, 3998473, 3998474, 3998475, 3998476, 3998477, 3998478, 3998479, 3998480, 3998483, 3998484, 3998485, 3998486, 3998487, 3998488, 3998489, 3998490, 3998491, 3998492, 3998493, 3998494, 3998495, 3998496, 3998497, 3998498, 3998499, 3998501);
DELETE FROM `creature` WHERE `guid` IN (2530147, 2530148, 2530149, 2530150, 2530151, 2530152, 2530153, 2530155, 2530156, 2530157, 2530158, 2530159, 2530160, 2530161, 2530162, 2530163, 2530164, 2530165, 2530166, 2530168, 2530169, 2530170, 2530173, 2530174, 2530175, 2530176, 2530178, 2530179, 2530180, 2530181, 2530182, 2530183, 2530185, 2530186) ;
DELETE FROM `conditions` WHERE `condition_entry`=83;

-- Remove L70ETC concert event. It was added in TBC.
DELETE FROM `game_event` WHERE `entry`=34;

-- Remove April Fools! event. It has no content.
DELETE FROM `game_event` WHERE `entry`=77;

-- Startup error related to PvP quests. They have wrong patch in relation tables.
-- ERROR:Table `creature_questrelation: Quest 8268 listed for entry 14733 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8269 listed for entry 14733 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8289 listed for entry 14733 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8296 listed for entry 14733 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8266 listed for entry 14781 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8267 listed for entry 14781 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8297 listed for entry 14984 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8298 listed for entry 14984 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8299 listed for entry 15022 does not exist.
-- ERROR:Table `creature_questrelation: Quest 8300 listed for entry 15022 does not exist.
UPDATE `creature_questrelation` SET `patch`=5 WHERE `quest` IN (8268, 8269, 8289, 8296, 8266, 8267, 8297, 8298, 8299, 8300);
-- ERROR:Table `creature_involvedrelation: Quest 8268 listed for entry 14733 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8269 listed for entry 14733 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8289 listed for entry 14733 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8296 listed for entry 14733 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8266 listed for entry 14781 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8267 listed for entry 14781 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8297 listed for entry 14984 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8298 listed for entry 14984 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8299 listed for entry 15022 does not exist.
-- ERROR:Table `creature_involvedrelation: Quest 8300 listed for entry 15022 does not exist.
UPDATE `creature_involvedrelation` SET `patch`=5 WHERE `quest` IN (8268, 8269, 8289, 8296, 8266, 8267, 8297, 8298, 8299, 8300);

-- Remove useless custom quests. They don't even have a description.
-- ERROR:Quest 137702 has PrevQuestId -8534, but no such quest
-- ERROR:Quest 137701 has PrevQuestId -8739, but no such quest
-- ERROR:Quest 137703 has PrevQuestId -8738, but no such quest
DELETE FROM `quest_template` WHERE `entry` IN (137701, 137702, 137703);
DELETE FROM `creature_questrelation` WHERE `quest` IN (137701, 137702, 137703);
DELETE FROM `creature_involvedrelation` WHERE `quest` IN (137701, 137702, 137703);

-- ERROR:Item condition (entry 32, type 2) requires to have non existing item (19727), skipped
-- Add dummy version of Blood Scythe with patch 0 to prevent condition error.
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `displayid`, `Quality`, `Flags`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `Duration`, `ExtraFlags`, `OtherTeamEntry`) VALUES (19727, 0, 15, 0, '[DISABLED] Blood Scythe', 6659, 0, 0, 1, 0, 0, 0, -1, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 1);

-- Some fixes by Nolin:

-- Despawn Wind Stones until Patch 1.8
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
('49298', '154'), -- Wind Stone Entry [180502]
('49299', '154'), -- Wind Stone Entry [180502]
('49300', '154'), -- Wind Stone Entry [180502]
('49301', '154'), -- Wind Stone Entry [180502]
('49302', '154'), -- Wind Stone Entry [180502]
('49303', '154'), -- Wind Stone Entry [180502]
('49304', '154'), -- Wind Stone Entry [180502]
('49305', '154'), -- Wind Stone Entry [180502]
('49306', '154'), -- Wind Stone Entry [180502]
('49307', '154'), -- Wind Stone Entry [180502]
('49308', '154'), -- Wind Stone Entry [180502]
('49309', '154'), -- Wind Stone Entry [180502]
('49450', '154'), -- Wind Stone Entry [180461]
('49316', '154'), -- Wind Stone Entry [180534]
('49333', '154'), -- Wind Stone Entry [180554]
('49311', '154'), -- Lesser Wind Stone Entry [180518]
('49433', '154'), -- Lesser Wind Stone Entry [180456]
('49321', '154'), -- Lesser Wind Stone Entry [180544]
('49332', '154'), -- Lesser Wind Stone Entry [180549]
('49335', '154'), -- Lesser Wind Stone Entry [180564]
('49314', '154'), -- Lesser Wind Stone Entry [180529]
('49334', '154'), -- Greater Wind Stone Entry [180559]
('49452', '154'), -- Greater Wind Stone Entry [180466]
('49317', '154'); -- Greater Wind Stone Entry [180539]

-- Despawn The Scarab Gong until Patch 1.9.
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES ('49451', '166');

-- Despawn NPC Jonathan the Revelator until Patch 1.9.
UPDATE `creature` SET `patch_min`=7 WHERE `id` = 15693;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
