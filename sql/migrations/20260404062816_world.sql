DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260404062816');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260404062816');
-- Add your query below.


-- Rep gain for Venture Co. mobs in Stranglethorn
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (674, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (675, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (676, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (677, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (921, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (1094, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (1095, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (1096, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (1097, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (4260, 0, 21, 0, 5, 0, 5, 0, 0, 0, 0);

-- Rep gain for Wastewander mobs in Tanaris
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5615, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5616, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5617, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5618, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (5623, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);
REPLACE INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES (7805, 0, 369, 0, 3, 1, 5, 0, 0, 0, 0);

-- Rep gain for Geenia Sunshadow (4184)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4184, 0, 609, 7, 0, -25, 0);

-- Rep gain for Dawnwatcher Selgorm (4783)
-- -125 with Argent Dawn (529) ; Count: 1 HUMAN!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4783, 0, 529, 7, 0, -125, 0);

-- Rep gain for Argent Guard Manados (4784)
-- -25 with Argent Dawn (529) ; Count: 1 HUMAN!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4784, 0, 529, 7, 0, -25, 0);

-- Rep gain for Dawnwatcher Shaedlass (4786)
-- -125 with Argent Dawn (529) ; Count: 1 HUMAN!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4786, 0, 529, 7, 0, -125, 0);

-- Rep gain for Argent Guard Thaelrid (4787)
-- -125 with Argent Dawn (529) ; Count: 1 HUMAN!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4787, 0, 529, 7, 0, -125, 0);

-- Rep gain for Broken Cadaver (10383)
-- 5 with Argent Dawn (529) ; Count: 101
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10383, 0, 529, 5, 0, 5, 0);

-- Rep gain for Vengeful Phantom (10387)
-- 5 with Argent Dawn (529) ; Count: 32
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10387, 0, 529, 5, 0, 5, 0);

-- Rep gain for Spiteful Phantom (10388)
-- 5 with Argent Dawn (529) ; Count: 4
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10388, 0, 529, 5, 0, 5, 0);

-- Rep gain for Wrath Phantom (10389)
-- 5 with Argent Dawn (529) ; Count: 6
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10389, 0, 529, 5, 0, 5, 0);

-- Rep gain for Skul (10393)
-- 25 with Argent Dawn (529) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10393, 0, 529, 7, 0, 25, 0);

-- Rep gain for Black Guard Sentry (10394)
-- 5 with Argent Dawn (529) ; Count: 31
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10394, 0, 529, 7, 0, 5, 0);

-- Rep gain for Eye of Naxxramas (10411)
-- 5 with Argent Dawn (529) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10411, 0, 529, 5, 0, 5, 0);

-- Rep gain for Scholomance Occultist (10472)
-- 5 with Argent Dawn (529) ; Count: 34
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10472, 0, 529, 5, 0, 5, 0);

-- Rep gain for Scholomance Student (10475)
-- 5 with Argent Dawn (529) ; Count: 32
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10475, 0, 529, 5, 0, 5, 0);

-- Rep gain for Kirtonos the Herald (10506)
-- 25 with Argent Dawn (529) ; Count: 4
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10506, 0, 529, 7, 0, 25, 0);

-- Rep gain for The Unforgiven (10516)
-- 25 with Argent Dawn (529) ; Count: 6
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10516, 0, 529, 7, 0, 25, 0);

-- Rep gain for Plagued Hatchling (10678)
-- 5 with Argent Dawn (529) ; Count: 161
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10678, 0, 529, 5, 0, 5, 0);

-- Rep gain for Bile Slime (10697)
-- 5 with Argent Dawn (529) ; Count: 2
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10697, 0, 529, 5, 0, 5, 0);

-- Rep gain for Carrion Scarab (10699)
-- 5 with Argent Dawn (529) ; Count: 3
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10699, 0, 529, 5, 0, 5, 0);

-- Rep gain for Timmy the Cruel (10808)
-- 25 with Argent Dawn (529) ; Count: 7
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10808, 0, 529, 7, 0, 25, 0);

-- Rep gain for Farmer Dalson (10836)
-- 5 with Argent Dawn (529) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10836, 0, 529, 4, 0, 5, 0);

-- Rep gain for Undead Scarab (10876)
-- 5 with Argent Dawn (529) ; Count: 8
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10876, 0, 529, 5, 0, 5, 0);

-- Rep gain for Fras Siabi (11058)
-- 25 with Argent Dawn (529) ; Count: 2
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11058, 0, 529, 7, 0, 25, 0);

-- Rep gain for Cauldron Lord Bilemaw (11075)
-- 15 with Argent Dawn (529) ; Count: 3
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11075, 0, 529, 5, 0, 15, 0);

-- Rep gain for Cauldron Lord Razarch (11076)
-- 15 with Argent Dawn (529) ; Count: 2
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11076, 0, 529, 5, 0, 15, 0);

-- Rep gain for Cauldron Lord Malvinious (11077)
-- 15 with Argent Dawn (529) ; Count: 3
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11077, 0, 529, 5, 0, 15, 0);

-- Rep gain for Cauldron Lord Soulwrath (11078)
-- 15 with Argent Dawn (529) ; Count: 3
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11078, 0, 529, 5, 0, 15, 0);

-- Rep gain for Azzleby (11119)
-- -125 with Everlook (577) ; Count: 1 HUMAN!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11119, 0, 577, 7, 0, -125, 0);

-- Rep gain for Son of Hakkar (11357)
-- 3 with Zandalar Tribe (270) ; Count: 133
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11357, 5, 270, 5, 0, 3, 0);

-- Rep gain for Zulian Cub (11360)
-- 4 with Zandalar Tribe (270) ; Count: 64
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11360, 5, 270, 5, 0, 4, 0);

-- Rep gain for Bloodseeker Bat (11368)
-- 4 with Zandalar Tribe (270) ; Count: 16
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11368, 5, 270, 5, 0, 4, 0);

-- Rep gain for Bessany Plainswind (11796)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11796, 0, 609, 7, 0, -25, 0);

-- Rep gain for Moren Riverbend (11797)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11797, 0, 609, 7, 0, -25, 0);

-- Rep gain for Bunthen Plainswind (11798)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11798, 0, 609, 7, 0, -25, 0);

-- Rep gain for Silva Fil'naveth (11800)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11800, 0, 609, 7, 0, -25, 0);

-- Rep gain for Umber (11939)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11939, 0, 609, 7, 0, -25, 0);

-- Rep gain for Daeolyn Summerleaf (12021)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(12021, 0, 609, 7, 0, -25, 0);

-- Rep gain for Meliri (12024)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(12024, 0, 609, 7, 0, -25, 0);

-- Rep gain for Narianna (12029)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(12029, 0, 609, 7, 0, -25, 0);

-- Rep gain for Loganaar (12042)
-- -25 with Cenarion Circle (609) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(12042, 0, 609, 7, 0, -25, 0);

-- Rep gain for Winterfall Ambusher (14372)
-- 5 with Timbermaw Hold (576) ; Count: 10
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(14372, 0, 576, 5, 0, 5, 0);

-- Rep gain for Death Knight Darkreaver (14516)
-- 25 with Argent Dawn (529) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(14516, 2, 529, 5, 0, 25, 0);

-- Rep gain for Ohgan (14988)
-- 15 with Zandalar Tribe (270) ; Count: 8
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(14988, 5, 270, 7, 0, 15, 0);

-- Rep gain for Gahz'ranka (15114)
-- 100 with Zandalar Tribe (270) ; Count: 5
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(15114, 5, 270, 7, 0, 100, 0);

-- Rep gain for Southsea Kidnapper (15685)
-- 5 with Gadgetzan (369) ; Count: 5
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(15685, 6, 369, 5, 0, 5, 0);

-- Rep gain for Frenzied Bat (16036)
-- 5 with Argent Dawn (529) ; Count: 201
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(16036, 9, 529, 5, 0, 5, 0);

-- Rep gain for Plagued Bat (16037)
-- 5 with Argent Dawn (529) ; Count: 236
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(16037, 9, 529, 5, 0, 5, 0);

-- Rep gain for Spectral Trainee (16127)
-- 5 with Argent Dawn (529) ; Count: 104
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(16127, 9, 529, 5, 0, 5, 0);

-- Rep gain for Mutated Grub (16297)
-- 5 with Argent Dawn (529) ; Count: 9
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(16297, 9, 529, 5, 0, 5, 0);

-- Rep gain for Professor Phizzlethorpe (2768)
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `RewOnKillRepFaction2`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `MaxStanding2`, `IsTeamAward2`, `RewOnKillRepValue2`, `TeamDependent`) VALUES
(2768, 0, 87, 21, 5, 0, 5, 7, 0, -125, 0);

-- Rep gain for Gadgetzan Bruiser (9460)
-- -125 with Gadgetzan (369) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(9460, 0, 369, 7, 1, -125, 0);

-- Rep gain for Umi Rumplesnicker (10305)
-- -25 with Everlook (577) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(10305, 0, 577, 7, 0, -25, 0);

-- Rep gain for Everlook Bruiser (11190)
-- -125 with Everlook (577) ; Count: 2
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(11190, 0, 577, 7, 0, -125, 0);

-- Rep gain for Zap Farflinger (14742)
-- -25 with Everlook (577) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(14742, 3, 577, 7, 0, -25, 0);

-- Rep gain for Willix the Importer (4508)
-- -25 with Ratchet (470) ; Count: 1 GRAY!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(4508, 0, 470, 7, 0, -25, 0);

-- Rep gain for Yorba Screwspigot (9706)
-- -25 with Steamwheedle Cartel (169) ; Count: 1 GRAY!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(9706, 0, 169, 7, 1, -25, 0);

-- Rep gain for Keeper Marandis (13698)
-- -250 with Cenarion Circle (609) ; Count: 1 GRAY!
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(13698, 0, 609, 7, 0, -250, 0);

-- Rep gain for Ratchet Bruiser (3502)
-- -125 with Ratchet (470) ; Count: 1
INSERT INTO `creature_onkill_reputation` (`creature_id`, `patch`, `RewOnKillRepFaction1`, `MaxStanding1`, `IsTeamAward1`, `RewOnKillRepValue1`, `TeamDependent`) VALUES
(3502, 0, 470, 7, 0, -125, 0);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
