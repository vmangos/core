DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210222004851');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210222004851');
-- Add your query below.


-- Update old dragonkin elites to be elite in pre patch 1.12.0
-- Green Scalebane
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=744 AND `patch`=0;
INSERT INTO `creature_template` VALUES (744, 0, 7903, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Green Scalebane', '', 0, 42, 43, 1981, 2059, 0, 0, 3658, 50, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 182, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 744, 0, 744, 0, 0, 100, 0, 172, 0, 0, 0, 0, 0, 0, 0, 75, 103, 'EventAI', 1, 1, 0, 0, 3, 744, 0, 0, 0, 0, 0, '');

-- Elder Dragonkin
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=746 AND `patch`=0;
INSERT INTO `creature_template` VALUES (746, 0, 625, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Elder Dragonkin', '', 0, 45, 45, 2217, 2217, 0, 0, 4059, 50, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 204, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 746, 0, 746, 0, 0, 0, 0, 0, 0, 6306, 0, 0, 0, 7460, 0, 84, 115, 'EventAI', 0, 1, 0, 0, 0, 746, 0, 0, 0, 0, 0, '');

-- Green Wyrmkin
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=742 AND `patch`=0;
INSERT INTO `creature_template` VALUES (742, 0, 7863, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Green Wyrmkin', '', 0, 41, 42, 1902, 1981, 0, 0, 2246, 50, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 172, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 742, 0, 742, 0, 0, 100, 0, 168, 0, 0, 0, 0, 0, 7420, 0, NULL, 76, 105, '', 0, 1, 0, 0, 3, 742, 0, 0, 0, 0, 0, '');

-- Wyrmkin Dreamwalker
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=743 AND `patch`=0;
INSERT INTO `creature_template` VALUES (743, 0, 7974, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 'Wyrmkin Dreamwalker', '', 0, 42, 43, 1585, 1647, 1381, 1432, 1896, 50, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 182, 1, 2000, 2000, 2, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 743, 0, 743, 0, 0, 100, 0, 0, 0, 15970, 7966, 20664, 0, 7430, 0, NULL, 69, 95, 'EventAI', 0, 1, 0, 0, 3, 743, 0, 0, 0, 0, 0, '');

-- Scalebane Captain 
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=745 AND `patch`=0;
INSERT INTO `creature_template` VALUES (745, 0, 7976, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 'Scalebane Captain', '', 0, 43, 44, 2059, 2138, 0, 0, 3688, 50, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 194, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 745, 0, 745, 0, 0, 100, 0, 0, 0, 9128, 13730, 12555, 0, 7450, 0, 78, 107, 'EventAI', 1, 1, 0, 0, 3, 745, 0, 0, 0, 0, 0, '');

-- Firemane Scout
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=4329 AND `patch`=0;
INSERT INTO `creature_template` VALUES (4329, 0, 143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemane Scout', '', 0, 41, 42, 1902, 1981, 0, 0, 1900, 103, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 172, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 4329, 0, 4329, 0, 100, 0, 0, 0, 0, 18968, 0, 0, 0, 43290, 0, 74, 102, 'EventAI', 0, 1, 0, 0, 3, 4329, 0, 0, 0, 0, 0, '');

-- Firemane Scalebane 
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=4328 AND `patch`=0;
INSERT INTO `creature_template` VALUES (4328, 0, 8310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemane Scalebane', '', 0, 43, 44, 1647, 1711, 1432, 1483, 1673, 103, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 194, 1, 2000, 2000, 2, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 4328, 0, 4328, 0, 100, 0, 0, 0, 0, 18968, 11972, 11971, 0, 0, 0, 72, 99, 'EventAI', 1, 1, 0, 0, 3, 4328, 0, 0, 0, 0, 0, '');

-- Firemane Ash Tail
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=4331 AND `patch`=0;
INSERT INTO `creature_template` VALUES (4331, 0, 8249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemane Ash Tail', '', 0, 42, 43, 1585, 1647, 1381, 1432, 1673, 103, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 182, 1, 2000, 2000, 2, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 4331, 0, 4331, 0, 100, 0, 0, 0, 0, 18968, 11969, 0, 0, 43310, 0, 67, 92, 'EventAI', 0, 1, 0, 0, 3, 4331, 0, 0, 0, 0, 0, '');

-- Firemane Flamecaller
UPDATE `creature_template` SET `patch`='10' WHERE  `entry`=4334 AND `patch`=0;
INSERT INTO `creature_template` VALUES (4334, 0, 8309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Firemane Flamecaller', '', 0, 43, 44, 1647, 1711, 1432, 1483, 1784, 103, 0, 0.888888, 1.14286, 20, 5, 0, 1, 1, 269, 346, 0, 194, 1, 2000, 2000, 2, 0, 0, 0, 0, 0, 0, 0, 53.1456, 73.0752, 100, 2, 0, 4334, 0, 4334, 0, 100, 0, 0, 0, 0, 18968, 11990, 9053, 0, 43340, 0, 72, 99, '', 0, 1, 0, 0, 3, 4334, 0, 0, 0, 0, 0, '');

-- Army of the Black Dragon used to be elite quest pre 1.12.0
UPDATE `quest_template` SET `patch`='10' WHERE  `entry`=1168 AND `patch`=0;
INSERT INTO `quest_template` VALUES (1168, 0, 2, 15, 38, 0, 43, 1, 0, 178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, 'Army of the Black Dragon', 'Mok\'Morokk was made Overlord by Rexxar. He care more for power than he care for ogres.$b$bBlack dragons kill many ogre. Kill Tharg\'s wife. Mok\'Morokk tell us to run. Make us come here.$b$bOgre should fight. Ogres not good at running. Mok\'Morokk care only about Mok\'Morokk.$b$bMe call Stonemaul Ruins home. Me like it in the south. This place not home.$b$bHelp ogres fight army of the black dragon. Me want revenge. Me want to go home.', 'Tharg in Brackenwall Village wants you to kill 15 Firemane Scouts, 10 Firemane Ash Tails, and 5 Firemane Guards.', 'You kill many of the black dragon army. You brave $r.$b$bMake Tharg happy.', 'Mok\'Morokk tell all ogres to stay and keep this place safe. Me think ogres need to kill black dragon army and get old home back.$b$bYou help ogres get home back. Help ogres get revenge.', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4329, 4331, 4328, 0, 15, 10, 5, 0, 0, 0, 0, 0, 9705, 9706, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3600, 0, 2160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
