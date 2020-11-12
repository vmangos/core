DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200423170043');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200423170043');
-- Add your query below.


-- remove quest A Troubled Spirit (8417) from Torm Ragetotem (3041)
DELETE FROM `creature_questrelation` WHERE `quest` = 8417 AND `id` = 3041;

-- remove quest A Troubled Spirit (8417) from Darnath Bladesinge (7315)
DELETE FROM `creature_questrelation` WHERE `quest` = 8417 AND `id` = 7315;

-- remove quest Speak with Dillinger (1818) from Baltus Fowler (4595)
DELETE FROM `creature_questrelation` WHERE `quest` = 1818 AND `id` = 4595;

-- add Elanaria (1684) to Moon Priestess Amara (2151) and Sentinel Elissa Starbreeze (3657)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(2151, 1684, 0, 10),
(3657, 1684, 0, 10);

-- add Yorus Barleybrew (1698) to Darnath Bladesinge (7315)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(7315, 1698, 0, 10);

-- remove quest The Islander (1718) from Darnath Bladesinge (7315)
DELETE FROM `creature_questrelation` WHERE `quest` = 1718 AND `id` = 7315;

-- add A Warrior's Training (1638) to Ilsa Corbin (5480)
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES
(5480, 1638, 0, 10);

-- update progress text for The Rethban Gauntlet (1699)
UPDATE `quest_template` SET `RequestItemsText` = "Time is wasting, $n.  If I were you, I'd get going..." WHERE `entry` = 1699;

-- update Klockmort Spannerspan (1704) to Dwarves and Gnomes
UPDATE `quest_template` SET `RequiredRaces` = 68 WHERE `entry` = 1704;

-- update Grimand Elmore (1700) to Humans
UPDATE `quest_template` SET `RequiredRaces` = 1 WHERE `entry` = 1700;

-- update Mathiel (1703) to Night Elves
UPDATE `quest_template` SET `RequiredRaces` = 8 WHERE `entry` = 1703;

-- add missing abilities to Ilsa Corbin (5480)
DELETE FROM `npc_trainer` WHERE `entry`=5480;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(5480, 797, 4000, 0, 0, 20, 0, 5875),
(5480, 798, 10000, 0, 0, 26, 0, 5875),
(5480, 1055, 11000, 0, 0, 28, 0, 5875),
(5480, 1065, 1500, 0, 0, 14, 0, 5875),
(5480, 1229, 100, 0, 0, 6, 0, 5875),
(5480, 1343, 100, 0, 0, 6, 0, 5875),
(5480, 1344, 3000, 0, 0, 18, 0, 5875),
(5480, 1423, 100, 0, 0, 4, 0, 5875),
(5480, 1424, 4000, 0, 0, 20, 0, 5875),
(5480, 1482, 12000, 0, 0, 30, 0, 5875),
(5480, 1606, 200, 0, 0, 8, 0, 5875),
(5480, 1607, 2000, 0, 0, 16, 0, 5875),
(5480, 1610, 8000, 0, 0, 24, 0, 5875),
(5480, 1611, 14000, 0, 0, 32, 0, 5875),
(5480, 1646, 3000, 0, 0, 18, 0, 5875),
(5480, 1675, 1000, 0, 0, 12, 0, 5875),
(5480, 1676, 14000, 0, 0, 32, 0, 5875),
(5480, 1677, 54000, 0, 0, 52, 0, 5875),
(5480, 1685, 18000, 0, 0, 36, 0, 5875),
(5480, 1716, 200, 0, 0, 8, 0, 5875),
(5480, 1722, 42000, 0, 0, 50, 0, 5875),
(5480, 1738, 100, 0, 0, 4, 0, 5875),
(5480, 2570, 2000, 0, 0, 16, 0, 5875),
(5480, 2688, 600, 0, 0, 10, 0, 5875),
(5480, 3128, 100, 0, 0, 6, 0, 5875),
(5480, 3433, 12000, 0, 0, 30, 0, 5875),
(5480, 3434, 22000, 0, 0, 40, 0, 5875),
(5480, 3435, 42000, 0, 0, 50, 0, 5875),
(5480, 5243, 1000, 0, 0, 12, 0, 5875),
(5480, 5247, 6000, 0, 0, 20, 0, 5875),
(5480, 5283, 8000, 0, 0, 24, 0, 5875),
(5480, 6158, 22000, 0, 0, 40, 0, 5875),
(5480, 6176, 14000, 0, 0, 32, 0, 5875),
(5480, 6177, 22000, 0, 0, 40, 0, 5875),
(5480, 6180, 10000, 0, 0, 26, 0, 5875),
(5480, 6191, 8000, 0, 0, 24, 0, 5875),
(5480, 6193, 6000, 0, 0, 22, 0, 5875),
(5480, 6543, 14000, 0, 0, 32, 0, 5875),
(5480, 6549, 600, 0, 0, 10, 0, 5875),
(5480, 6550, 4000, 0, 0, 20, 0, 5875),
(5480, 6551, 12000, 0, 0, 30, 0, 5875),
(5480, 6553, 20000, 0, 0, 38, 0, 5875),
(5480, 6556, 60000, 0, 0, 58, 0, 5875),
(5480, 6573, 1500, 0, 0, 14, 0, 5875),
(5480, 6575, 8000, 0, 0, 24, 0, 5875),
(5480, 6674, 10, 0, 0, 1, 0, 5875),
(5480, 7109, 22000, 0, 0, 40, 0, 5875),
(5480, 7374, 14000, 0, 0, 32, 0, 5875),
(5480, 7375, 56000, 0, 0, 54, 0, 5875),
(5480, 7380, 16000, 0, 0, 34, 0, 5875),
(5480, 7382, 2000, 0, 0, 16, 0, 5875),
(5480, 7385, 1000, 0, 0, 12, 0, 5875),
(5480, 7401, 10000, 0, 0, 26, 0, 5875),
(5480, 7403, 18000, 0, 0, 36, 0, 5875),
(5480, 7406, 6000, 0, 0, 22, 0, 5875),
(5480, 7889, 11000, 0, 0, 28, 0, 5875),
(5480, 8206, 11000, 0, 0, 28, 0, 5875),
(5480, 8207, 20000, 0, 0, 38, 0, 5875),
(5480, 8381, 16000, 0, 0, 34, 0, 5875),
(5480, 8821, 20000, 0, 0, 38, 0, 5875),
(5480, 11552, 32000, 0, 0, 42, 0, 5875),
(5480, 11553, 54000, 0, 0, 52, 0, 5875),
(5480, 11557, 16000, 0, 0, 34, 0, 5875),
(5480, 11558, 34000, 0, 0, 44, 0, 5875),
(5480, 11559, 56000, 0, 0, 54, 0, 5875),
(5480, 11570, 40000, 0, 0, 48, 0, 5875),
(5480, 11571, 58000, 0, 0, 56, 0, 5875),
(5480, 11575, 22000, 0, 0, 40, 0, 5875),
(5480, 11576, 42000, 0, 0, 50, 0, 5875),
(5480, 11577, 62000, 0, 0, 60, 0, 5875),
(5480, 11579, 36000, 0, 0, 46, 0, 5875),
(5480, 11582, 40000, 0, 0, 48, 0, 5875),
(5480, 11583, 60000, 0, 0, 58, 0, 5875),
(5480, 11586, 34000, 0, 0, 44, 0, 5875),
(5480, 11587, 62000, 0, 0, 60, 0, 5875),
(5480, 11598, 36000, 0, 0, 46, 0, 5875),
(5480, 11599, 60000, 0, 0, 58, 0, 5875),
(5480, 11602, 34000, 0, 0, 44, 0, 5875),
(5480, 11603, 56000, 0, 0, 54, 0, 5875),
(5480, 11606, 36000, 0, 0, 46, 0, 5875),
(5480, 11607, 56000, 0, 0, 54, 0, 5875),
(5480, 18556, 14000, 0, 0, 32, 0, 5875),
(5480, 20561, 36000, 0, 0, 46, 0, 5875),
(5480, 20562, 58000, 0, 0, 56, 0, 5875),
(5480, 20571, 62000, 0, 0, 60, 0, 5875),
(5480, 20621, 32000, 0, 0, 42, 0, 5875),
(5480, 20622, 54000, 0, 0, 52, 0, 5875),
(5480, 20703, 40000, 0, 0, 48, 0, 5875),
(5480, 20704, 58000, 0, 0, 56, 0, 5875),
(5480, 20724, 4000, 0, 0, 20, 0, 5875),
(5480, 21555, 200, 0, 0, 48, 0, 5875),
(5480, 21557, 2800, 0, 0, 54, 0, 5875),
(5480, 21558, 3100, 0, 0, 60, 0, 5875),
(5480, 23898, 2000, 0, 0, 48, 0, 5875),
(5480, 23899, 2800, 0, 0, 54, 0, 5875),
(5480, 23900, 3100, 0, 0, 60, 0, 5875),
(5480, 23926, 200, 0, 0, 48, 0, 5875),
(5480, 23927, 2800, 0, 0, 54, 0, 5875),
(5480, 23928, 3100, 0, 0, 60, 0, 5875);

-- update completion text for Grimands Armor (1706)
UPDATE `quest_template` SET `OfferRewardText` = "I can barely believe it!  Furen's technique was a success, and this armor should withstand tremendous levels of stress.$b$bHere you are, $n.  And thank you.  I wouldn't have believed Furen's discovery if you hadn't gathered the materials I needed to test it myself." WHERE `entry` = 1706;

-- update progress text for The Affray (1719)
UPDATE `quest_template` SET `RequestItemsText` = "Have you completed your challenge?" WHERE `entry` = 1719;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
