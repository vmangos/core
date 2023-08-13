DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230810230833');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230810230833');
-- Add your query below.


ALTER TABLE `spell_threat`
	CHANGE COLUMN `Threat` `Threat` FLOAT NOT NULL DEFAULT 0 AFTER `entry`;

-- Mind Blast R1
UPDATE `spell_threat` SET `Threat` = 40, `multiplier` = 0 WHERE `entry` = 8092;
-- Mind Blast R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8102, 77, 1, 0);
-- Mind Blast R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8103, 121, 1, 0);
-- Mind Blast R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8104, 180, 1, 0);
-- Mind Blast R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8105, 236, 1, 0);
-- Mind Blast R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8106, 303, 1, 0);
-- Mind Blast R7
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10945, 380, 1, 0);
-- Mind Blast R8
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10946, 460, 1, 0);
-- Mind Blast R9
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10947, 540, 1, 0);

-- Schackle Undead R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9484, 40, 0, 0);
-- Schackle Undead R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9485, 80, 0, 0);
-- Schackle Undead R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10955, 120, 0, 0);

-- Dispell Magic R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (527, 18, 0, 0);
-- Dispell Magic R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (988, 36, 0, 0);

-- Abolish Disease
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (552, 32, 0, 0);

-- Cure Disease Priest
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (528, 14, 0, 0);

-- Power Word: Shield R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17, 11, 0, 0);
-- Power Word: Shield R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (592, 20.5, 0, 0);
-- Power Word: Shield R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (600, 35, 0, 0);
-- Power Word: Shield R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (3747, 53.5, 0, 0);
-- Power Word: Shield R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6065, 76, 0, 0);
-- Power Word: Shield R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6066, 99, 0, 0);
-- Power Word: Shield R7
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10898, 99, 0, 0);
-- Power Word: Shield R8
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10899, 99, 0, 0);
-- Power Word: Shield R9
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10900, 99, 0, 0);
-- Power Word: Shield R10
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10901, 99, 0, 0);

-- Inner Fire R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (588, 12, 0, 0);
-- Inner Fire R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7128, 20, 0, 0);
-- Inner Fire R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (602, 30, 0, 0);
-- Inner Fire R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1006, 40, 0, 0);
-- Inner Fire R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10951, 50, 0, 0);
-- Inner Fire R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10952, 60, 0, 0);

-- Psychic Scream R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8122, 28, 0, 0);
-- Psychic Scream R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8124, 56, 0, 0);
-- Psychic Scream R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10888, 84, 0, 0);
-- Psychic Scream R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10890, 112, 0, 0);

-- Shadow Protection r1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (976, 30, 0, 0);
-- Shadow Protection R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10957, 42, 0, 0);
-- Shadow Protection R3´
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10958, 56, 0, 0);

-- Prayer of Shadow Protection
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (27683, 56, 0, 0);

-- Power Word: Fortitude R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1243, 1, 0, 0);
-- Power Word: Fortitude R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1244, 12, 0, 0);
-- Power Word: Fortitude R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1245, 24, 0, 0);
-- Power Word: Fortitude R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2791, 36, 0, 0);
-- Power Word: Fortitude R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10937, 48, 0, 0);
-- Power Word: Fortitude R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10938, 60, 0, 0);

-- Prayer of Fortitude R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21562, 48, 0, 0);
-- Prayer of Fortitude R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21564, 60, 0, 0);

-- Blind
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2094, 68, 0, 0);

-- Sprint R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2983, 10, 0, 0);
-- Sprint r2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8696, 34, 0, 0);
-- Sprint R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11305, 58, 0, 0);

-- Polymorph R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (118, 16, 0, 0);
-- Polymorph R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12824, 40, 0, 0);
-- Polymorph R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12825, 80, 0, 0);
-- Polymorph R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12826, 120, 0, 0);
-- Polymorph Pig
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (28272, 120, 0, 0);
-- Polymorph Turtle
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (28271, 120, 0, 0);

-- Frost Armor R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (168, 1, 0, 0);
-- Frost Armor R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7300, 10, 0, 0);
-- Frost Armor R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7301, 20, 0, 0);

-- Arcane Intellect R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1459, 1, 0, 0);
-- Arcane Intellect R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1460, 14, 0, 0);
-- Arcane Intellect R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1461, 28, 0, 0);
-- Arcane Intellect R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10156, 42, 0, 0);
-- Arcane Intellect R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10157, 56, 0, 0);

-- Arcane Brilliance R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (23028, 56, 0, 0);

-- Amplify Magic R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1008, 18, 0, 0);
-- Amplify Magic R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8455, 30, 0, 0);
-- Amplify Magic R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10169, 42, 0, 0);
-- Amplify Magic R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10170, 54, 0, 0);

-- Mana Shield R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1463, 20, 0, 0);
-- Mana Shield R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8494, 28, 0, 0);
-- Mana Shield R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8495, 36, 0, 0);
-- Mana Shield R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10191, 44, 0, 0);
-- Mana Shield R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10192, 52, 0, 0);
-- Mana Shield R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10193, 60, 0, 0);

-- Evocation
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12051, 20, 0, 0);

-- Correct Counterspell
UPDATE `spell_threat` SET `Threat` = 300, `multiplier` = 0 WHERE `entry` = 2139;

-- Dampen Magic R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (604, 12, 0, 0);
-- Dampen Magic R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8450, 24, 0, 0);
-- Dampen Magic R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8451, 36, 0, 0);
-- Dampen Magic R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10173, 48, 0, 0);
-- Dampen Magic R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10174, 60, 0, 0);

-- Mage Armor R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6117, 34, 0, 0);
-- Mage Armor R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (22782, 46, 0, 0);
-- Mage Armor R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (22783, 58, 0, 0);

-- Ice Barrier has same threat for all ranks
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11426, 53.5, 0, 0);

-- Blink
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1953, 20, 0, 0);

-- Clearcasting Mage
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12536, 10, 0, 0);

-- Clearcasting Shaman
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16246, 10, 0, 0);

-- Clearcasting Druid
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (16870, 10, 0, 0);

-- Ice Armor R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7302, 30, 0, 0);
-- Ice Armor R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7320, 40, 0, 0);
-- Ice Armor R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10219, 50, 0, 0);
-- Ice Armor R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10220, 60, 0, 0);

-- Frost Ward R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6143, 22, 0, 0);
-- Frost Ward R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8461, 32, 0, 0);
-- Frost Ward R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8462, 42, 0, 0);
-- Frost Ward R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10177, 52, 0, 0);
-- Frost Ward R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (28609, 60, 0, 0);

-- Frost Ward R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (543, 20, 0, 0);
-- Frost Ward R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8457, 30, 0, 0);
-- Frost Ward R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8458, 40, 0, 0);
-- Frost Ward R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10223, 50, 0, 0);
-- Frost Ward R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10225, 60, 0, 0);

-- Remove Lesser Curse
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (475, 18, 0, 0);

-- Frostbite
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (12494, 20, 0, 0);

-- Frost Nova R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (122, 20, 1, 0);
-- Frost Nova R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (865, 35, 1, 0);
-- Frost Nova R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6131, 50, 1, 0);
-- Frost Nova R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10230, 50, 1, 0);

-- Scare Beast R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1513, 28, 0, 0);
-- Scare Beast R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (14326, 60, 0, 0);
-- Scare Beast R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (14327, 92, 0, 0);

-- Concussive Shot
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5116, 16, 0, 0);

-- Delete Distracting Shot
-- It only added more threat than intended
DELETE FROM `spell_threat` WHERE  `entry`=20736;
DELETE FROM `spell_threat` WHERE  `entry`=14274;
DELETE FROM `spell_threat` WHERE  `entry`=15629;
DELETE FROM `spell_threat` WHERE  `entry`=15630;
DELETE FROM `spell_threat` WHERE  `entry`=15631;
DELETE FROM `spell_threat` WHERE  `entry`=15632;

-- Scorpid Sting R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (3043, 44, 0, 0);
-- Scorpid Sting R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (14275, 64, 0, 0);
-- Scorpid Sting R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (14276, 84, 0, 0);
-- Scorpid Sting R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (14277, 104, 0, 0);

-- Seal of Crusader R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21082, 6, 0, 0);
-- Seal of Crusader R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20162, 12, 0, 0);
-- Seal of Crusader R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20305, 22, 0, 0);
-- Seal of Crusader R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20306, 32, 0, 0);
-- Seal of Crusader R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20307, 42, 0, 0);
-- Seal of Crusader R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20308, 52, 0, 0);

-- Correct Blessing of Freedom
UPDATE `spell_threat` SET `multiplier` = 0 WHERE `entry` = 1044;

-- Hammer of Justice R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (853, 16, 0, 0);
-- Hammer of Justice R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5588, 48, 0, 0);
-- Hammer of Justice R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5589, 80, 0, 0);
-- Hammer of Justice R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10308, 108, 0, 0);

-- Seal of Light R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20165, 30, 0, 0);
-- Seal of Light R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20347, 40, 0, 0);
-- Seal of Light R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20348, 50, 0, 0);
-- Seal of Light R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20349, 60, 0, 0);

-- Seal of Wisdom R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20166, 38, 0, 0);
-- Seal of Wisdom R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20356, 48, 0, 0);
-- Seal of Wisdom R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20357, 58, 0, 0);

-- Seal of Righteousness R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21084, 1, 0, 0);
-- Seal of Righteousness R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20287, 10, 0, 0);
-- Seal of Righteousness R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20288, 18, 0, 0);
-- Seal of Righteousness R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20289, 26, 0, 0);
-- Seal of Righteousness R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20290, 34, 0, 0);
-- Seal of Righteousness R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20291, 42, 0, 0);
-- Seal of Righteousness R7
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20292, 50, 0, 0);
-- Seal of Righteousness R8
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20293, 58, 0, 0);

-- Seal of Justice
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (20164, 20, 0, 0);

-- Turn Undead R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2878, 48, 0, 0);
-- Turn Undead R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5627, 76, 0, 0);
-- Turn Undead R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10326, 104, 0, 0);

-- Correct Blessing of Protection R1
UPDATE `spell_threat` SET `multiplier` = 0 WHERE `entry` = 1022;
-- Correct Blessing of Protection R2
UPDATE `spell_threat` SET `multiplier` = 0 WHERE `entry` = 5599;
-- Correct Blessing of Protection R3
UPDATE `spell_threat` SET `multiplier` = 0 WHERE `entry` = 10278;

-- Correct Holy Shield, same threat for all ranks
UPDATE `spell_threat` SET `Threat` = 0, `multiplier` = 1.2 WHERE `entry` = 20925;
DELETE FROM `spell_threat` WHERE  `entry`=20927;
DELETE FROM `spell_threat` WHERE  `entry`=20928;

-- Correct Lay on Hands R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2800, 125, 2, 0);
-- Correct Lay on Hands R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (10310, 275, 2, 0);

-- Cleanse
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (4987, 42, 0, 0);

-- Purify
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1152, 8, 0, 0);

-- Ghost Wolf
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2645, 20, 0, 0);

-- Far Sight
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6196, 26, 0, 0);

-- Cure Disease Shaman
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2870, 22, 0, 0);

-- Cure Poison Shaman
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (526, 16, 0, 0);

-- Fear R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5782, 16, 0, 0);
-- Fear R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6213, 64, 0, 0);
-- Fear R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6215, 112, 0, 0);

-- Howl of Terror R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5484, 80, 0, 0);
-- Howl of Terror R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17928, 108, 0, 0);

-- Curse of Shadow R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17862, 88, 0, 0);
-- Curse of Shadow R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (17937, 112, 0, 0);

-- Curse of Tongues R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1714, 52, 0, 0);
-- Curse of Tongues R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11719, 100, 0, 0);

-- Curse of Elements R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1490, 64, 0, 0);
-- Curse of Elements R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11721, 92, 0, 0);
-- Curse of Elements R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11722, 120, 0, 0);

-- Curse of Weakness R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (702, 8, 0, 0);
-- Curse of Weakness R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1108, 24, 0, 0);
-- Curse of Weakness R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6205, 44, 0, 0);
-- Curse of Weakness R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7646, 64, 0, 0);
-- Curse of Weakness R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11707, 84, 0, 0);
-- Curse of Weakness R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11708, 104, 0, 0);

-- Curse of Doom
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (603, 120, 1, 0);

-- Curse of Recklessness R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (704, 28, 0, 0);
-- Curse of Recklessness R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7658, 56, 0, 0);
-- Curse of Recklessness R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (7659, 84, 0, 0);
-- Curse of Recklessness R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11717, 112, 0, 0);

-- Siphon Life R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (18265, 60, 1, 0);
-- Siphon Life R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (18879, 76, 1, 0);
-- Siphon Life R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (18880, 96, 1, 0);
-- Siphon Life R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (18881, 116, 1, 0);

-- Demon Skin R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (687, 1, 0, 0);
-- Demon Skin R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (696, 10, 0, 0);

-- Demon Armor R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (706, 20, 0, 0);
-- Demon Armor R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1086, 30, 0, 0);
-- Demon Armor R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11733, 40, 0, 0);
-- Demon Armor R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11734, 50, 0, 0);
-- Demon Armor R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11735, 60, 0, 0);

-- Detect Greater Invisibility
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11743, 50, 0, 0);

-- Detect Detect Invisibility
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2970, 38, 0, 0);

-- Detect Greater Invisibility
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (132, 26, 0, 0);

-- Shadow Ward R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6229, 32, 0, 0);
-- Shadow Ward R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11739, 42, 0, 0);
-- Shadow Ward R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (11740, 52, 0, 0);
-- Shadow Ward R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (28610, 60, 0, 0);

-- Eye of Kilrogg
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (126, 22, 0, 0);

-- Banish R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (710, 56, 0, 0);
-- Banish R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (18647, 96, 0, 0);

-- Barkskin
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (22812, 44, 0, 0);

-- Correct Faerie Fire R1
UPDATE `spell_threat` SET `Threat` = 36, `multiplier` = 0 WHERE `entry` = 770;
-- Faerie Fire R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (778, 60, 0, 0);
-- Faerie Fire R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9749, 84, 0, 0);
-- Faerie Fire R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9907, 108, 0, 0);

-- Entangling Roots R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (339, 16, 1, 0);
-- Entangling Roots R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1062, 36, 1, 0);
-- Entangling Roots R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5195, 56, 1, 0);
-- Entangling Roots R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5196, 76, 1, 0);
-- Entangling Roots R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9852, 96, 1, 0);
-- Entangling Roots R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9853, 116, 1, 0);

-- Thorns R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (467, 6, 1, 0);
-- Thorns R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (782, 14, 1, 0);
-- Thorns R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1075, 24, 1, 0);
-- Thorns R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8914, 34, 1, 0);
-- Thorns R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9756, 44, 1, 0);
-- Thorns R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9910, 54, 1, 0);

-- Cure Poison Druid
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8946, 14, 0, 0);

-- Abolish Poison
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (2893, 26, 0, 0);

-- Challenging Roar
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5209, 98, 0, 0);

-- Gift of the Wild R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21849, 50, 0, 0);
-- Gift of the Wild R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (21850, 60, 0, 0);

-- Mark of The Wild R1
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (1126, 1, 0, 0);
-- Mark of The Wild R2
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5232, 10, 0, 0);
-- Mark of The Wild R3
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (6756, 20, 0, 0);
-- Mark of The Wild R4
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (5234, 30, 0, 0);
-- Mark of The Wild R5
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (8907, 40, 0, 0);
-- Mark of The Wild R6
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9884, 50, 0, 0);
-- Mark of The Wild R7
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (9885, 60, 0, 0);

-- Innervate
INSERT INTO `spell_threat` (`entry`, `Threat`, `multiplier`, `ap_bonus`) VALUES (29166, 40, 0, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
