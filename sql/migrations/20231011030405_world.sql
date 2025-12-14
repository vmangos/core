DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231011030405');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231011030405');
-- Add your query below.


-- Murloc Coastrunner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=126; -- old 0.45, level 13, hits 9

-- Gryan Stoutmantle
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=234; -- old 3.25, level 35, hits 8

-- Commander Althea Ebonlocke
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=264; -- old 0.95, level 45, hits 3

-- Jitters
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=288; -- old 0.9, level 25, hits 7

-- Eliza
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=314; -- old 1, level 31, hits 22
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=314; -- old 6, level 31, hits 6

-- Singe
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=335; -- old 4.15, level 24, hits 10

-- Corporal Keeshan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=349; -- old 2.8, level 25, hits 35

-- Stitches
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=412; -- old 3.3, level 35, hits 454
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=412; -- old 5.75, level 35, hits 116

-- Black Dragon Whelp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=441; -- old 1, level 18, hits 104
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=441; -- old 0.14, level 17, hits 47

-- Watcher Keefer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=495; -- old 0.9, level 40, hits 9

-- Watcher Paige
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=499; -- old 0.95, level 29, hits 5

-- Lord Malathrom
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=503; -- old 4.5, level 31, hits 32

-- Mor'Ladim
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=522; -- old 3.95, level 35, hits 10

-- Fire Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=575; -- old 1.35, level 35, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=575; -- old 0.75, level 35, hits 46
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=575; -- old 0.14, level 35, hits 46

-- Defias Pillager
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=589; -- old 1.5, level 14, hits 5

-- Defias Looter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=590; -- old 0.85, level 14, hits 467

-- Brainwashed Noble
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=596; -- old 3.7, level 18, hits 9

-- Marisa du'Paige
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=599; -- old 3.7, level 18, hits 8

-- Goblin Engineer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=622; -- old 2.65, level 19, hits 17

-- Skeletal Miner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=623; -- old 2.8, level 17, hits 36
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=623; -- old 0.14, level 17, hits 36

-- Undead Excavator
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=624; -- old 2.8, level 18, hits 78

-- Undead Dynamiter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=625; -- old 2.8, level 17, hits 25

-- Foreman Thistlenettle
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=626; -- old 3.2, level 20, hits 19

-- Defias Overseer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=634; -- old 2.8, level 18, hits 57

-- Defias Blackguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=636; -- old 2.7, level 19, hits 74

-- Edwin VanCleef
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=639; -- old 2.9, level 21, hits 61

-- Goblin Woodcarver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=641; -- old 2.65, level 18, hits 77

-- Rhahk'Zor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.3 WHERE `entry`=644; -- old 3.6, level 19, hits 27

-- Cookie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=645; -- old 2.9, level 20, hits 58

-- Mr. Smite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=646; -- old 3, level 20, hits 22
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=646; -- old 0.14, level 20, hits 22

-- Defias Pirate
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=657; -- old 2.7, level 19, hits 175

-- Lesser Water Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=691; -- old 0.65, level 36, hits 108

-- Adolescent Whelp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=740; -- old 0, level 34, hits 102
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=740; -- old 1.45, level 34, hits 65

-- Dreaming Whelp
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=741; -- old 1.15, level 36, hits 81

-- Swampwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=764; -- old 1.45, level 39, hits 44
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=764; -- old 0.14, level 39, hits 44

-- Swampwalker Elder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=765; -- old 0.55, level 39, hits 30
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=765; -- old 0.85, level 39, hits 24

-- Tangled Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=766; -- old 0, level 41, hits 20
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=766; -- old 1.3, level 41, hits 36

-- Commander Felstrom
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=771; -- old 3.75, level 32, hits 9

-- Bookie Herod
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=815; -- old 2.45, level 35, hits 3

-- Watcher Mocarski
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=827; -- old 0.85, level 38, hits 7

-- Dust Devil
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=832; -- old 0.65, level 18, hits 22

-- Ghoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=846; -- old 1.6, level 15, hits 56

-- Stonard Cartographer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=867; -- old 0.85, level 52, hits 6
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=867; -- old 2.05, level 52, hits 8

-- Watcher Jordan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=887; -- old 1, level 39, hits 24

-- Lord Grayson Shadowbreaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=928; -- old 0.9, level 60, hits 21
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=928; -- old 1.05, level 60, hits 107

-- Watcher Hutchins
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1001; -- old 1.3, level 20, hits 3

-- Black Slime
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=1030; -- old 1.5, level 20, hits 10

-- Gan'zulah
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=1061; -- old 3.2, level 41, hits 38
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1061; -- old 0.14, level 41, hits 38

-- Watcher Merant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1098; -- old 1.3, level 20, hits 7

-- Watcher Gelwin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1099; -- old 1.3, level 20, hits 6

-- Watcher Selkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1100; -- old 1.3, level 20, hits 7

-- Watcher Thayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1101; -- old 1.3, level 20, hits 13

-- Cursed Sailor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1157; -- old 1.1, level 27, hits 439

-- Captain Halyndor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1160; -- old 1, level 30, hits 38

-- Watcher Sarys
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1203; -- old 0.55, level 35, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1203; -- old 1.5, level 35, hits 123

-- Watcher Corwin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1204; -- old 1.55, level 38, hits 88

-- Balgaras the Foul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1364; -- old 4.35, level 34, hits 9

-- Miran
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=1379; -- old 0.8, level 15, hits 52

-- Watcher Cutford
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1436; -- old 1.6, level 37, hits 5

-- Zanzil Zombie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1488; -- old 1.2, level 44, hits 316

-- Zanzil Hunter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1489; -- old 1.2, level 44, hits 243

-- Zanzil Naga
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1491; -- old 1.15, level 44, hits 506

-- Gorlash
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1492; -- old 0.8, level 47, hits 73

-- Mindless Zombie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=1501; -- old 0.95, level 1, hits 169

-- Konda
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1516; -- old 3.75, level 43, hits 141

-- Rattlecage Soldier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1520; -- old 0.85, level 6, hits 46

-- Darkeye Bonecaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=1522; -- old 1.4, level 7, hits 57
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1522; -- old 1.05, level 7, hits 50

-- Rotting Dead
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=1525; -- old 1, level 5, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=1525; -- old 1.1, level 5, hits 40
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.03 WHERE `entry`=1525; -- old 0.14, level 5, hits 40

-- Ravaged Corpse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1526; -- old 0.7, level 7, hits 44

-- Bleeding Horror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1529; -- old 0.6, level 10, hits 28

-- Lost Soul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1531; -- old 1.75, level 7, hits 85
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.19 WHERE `entry`=1531; -- old 0.14, level 7, hits 85

-- Tormented Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=1533; -- old 1.65, level 9, hits 46
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=1533; -- old 0.14, level 9, hits 46

-- Deathguard Burgess
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1652; -- old 0.9, level 24, hits 5

-- Nissa Agamand
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=1655; -- old 1.05, level 10, hits 19

-- Thurman Agamand
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1656; -- old 1.05, level 10, hits 50
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=1656; -- old 0.14, level 10, hits 50

-- Devlin Agamand
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=1657; -- old 1.9, level 9, hits 18

-- Defias Evoker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=1729; -- old 3.8, level 18, hits 17

-- Goblin Craftsman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=1731; -- old 2.65, level 18, hits 85

-- Defias Squallshaper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1732; -- old 3.65, level 19, hits 74
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=1732; -- old 0.14, level 19, hits 74

-- Deathguard Mort
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1744; -- old 0.9, level 24, hits 3

-- Highlord Bolvar Fordragon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1748; -- old 1.3, level 63, hits 237
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=1748; -- old 13.05, level 63, hits 403

-- Lord Gregor Lescovar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1754; -- old 1.3, level 31, hits 31
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=1754; -- old 0.14, level 31, hits 31

-- Stormwind Royal Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1756; -- old 1.2, level 60, hits 16
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1756; -- old 5, level 60, hits 172

-- Gilnid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=1763; -- old 2.9, level 20, hits 22
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=1763; -- old 0.14, level 20, hits 22

-- Skeletal Warlord
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.65 WHERE `entry`=1788; -- old 3.5, level 57, hits 86

-- Flesh Golem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1805; -- old 3.6, level 57, hits 111

-- Grand Inquisitor Isillien
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1840; -- old 1.4, level 63, hits 258
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=1840; -- old 5.8, level 63, hits 135

-- Highlord Taelan Fordring
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1842; -- old 2.2, level 63, hits 40
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=1842; -- old 7.2, level 63, hits 270

-- Foulmane
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1847; -- old 3.7, level 52, hits 18

-- Putridius
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1850; -- old 3.7, level 58, hits 69

-- Araj the Summoner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=1852; -- old 5.95, level 61, hits 14

-- Darkmaster Gandling
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1853; -- old 1.35, level 61, hits 36
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=1853; -- old 8.4, level 61, hits 93

-- Tirion Fordring
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=1855; -- old 44.8, level 61, hits 5

-- Dalaran Apprentice
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1867; -- old 1.15, level 13, hits 12

-- Eliza's Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1871; -- old 1.35, level 29, hits 57

-- Dalaran Watcher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1888; -- old 1, level 19, hits 27

-- Rattlecage Skeleton
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1890; -- old 0.35, level 3, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=1890; -- old 1.1, level 3, hits 147
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.05 WHERE `entry`=1890; -- old 0.14, level 3, hits 147

-- Pyrewood Elder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1895; -- old 1, level 15, hits 148

-- Dalaran Mage
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=1914; -- old 1, level 15, hits 62
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1914; -- old 1.2, level 15, hits 22
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.18 WHERE `entry`=1914; -- old 0.14, level 15, hits 22

-- Dalaran Conjuror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=1915; -- old 1, level 18, hits 44
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1915; -- old 1.2, level 18, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.18 WHERE `entry`=1915; -- old 0.14, level 18, hits 24

-- Stephen Bhartec
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.92 WHERE `entry`=1916; -- old 1.1, level 3, hits 4

-- Daniel Ulfman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=1917; -- old 1.25, level 2, hits 4

-- Samuel Fipps
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=1919; -- old 1.1, level 5, hits 19

-- Rot Hide Brute
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1939; -- old 1, level 17, hits 245

-- Rot Hide Plague Weaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1940; -- old 1, level 17, hits 111

-- Raging Rot Hide
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=1943; -- old 0.95, level 19, hits 226

-- Lillith Nefara
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1946; -- old 1.7, level 12, hits 15

-- Snarlmane
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1948; -- old 3.2, level 23, hits 3

-- Elder Lake Creeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=1956; -- old 1, level 18, hits 49

-- Greenpaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=1993; -- old 1, level 10, hits 11

-- Bloodfeather Fury
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=2019; -- old 1, level 10, hits 27

-- Timberling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=2022; -- old 1.1, level 5, hits 262

-- Ancient Protector
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2041; -- old 1.35, level 60, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=2041; -- old 1.6, level 60, hits 16

-- Forlorn Spirit
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2044; -- old 0, level 26, hits 6
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2044; -- old 1.8, level 25, hits 21

-- Haggard Refugee
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2053; -- old 0.85, level 18, hits 25
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=2053; -- old 0.14, level 18, hits 25

-- Sickly Refugee
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=2054; -- old 0, level 19, hits 14

-- Councilman Smithers
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=2060; -- old 1.1, level 12, hits 30
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=2060; -- old 1.9, level 12, hits 13

-- Councilman Higarth
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=2066; -- old 1, level 13, hits 35

-- Mountaineer Dokkin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.10 WHERE `entry`=2105; -- old 1, level 30, hits 6

-- Gnarlpine Ambusher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.7 WHERE `entry`=2152; -- old 1, level 7, hits 11

-- Gravelflint Scout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2158; -- old 1.5, level 19, hits 67

-- Gravelflint Bonesnapper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2159; -- old 1.35, level 20, hits 5

-- Gravelflint Geomancer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2160; -- old 1.6, level 20, hits 7

-- Agal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2162; -- old 0.75, level 8, hits 4

-- Oakenscowl
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=2166; -- old 1, level 9, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=2166; -- old 1.75, level 9, hits 23

-- Cursed Highborne
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2176; -- old 0.5, level 10, hits 48
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=2176; -- old 0.14, level 10, hits 48

-- Writhing Highborne
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=2177; -- old 1, level 12, hits 74

-- Vile Sprite
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=2189; -- old 1, level 10, hits 85
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2189; -- old 0.5, level 10, hits 151

-- Greymist Tidehunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=2208; -- old 1, level 20, hits 24

-- High Executor Darthalia
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=2215; -- old 2.55, level 60, hits 7

-- Zora Guthrek
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2225; -- old 1.4, level 55, hits 341

-- Stone Fury
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2258; -- old 3.55, level 37, hits 24

-- Hillsbrad Apprentice Blacksmith
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.45 WHERE `entry`=2265; -- old 1, level 24, hits 40

-- Hillsbrad Sentry
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2270; -- old 2, level 28, hits 21

-- Enraged Stanley
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.35 WHERE `entry`=2275; -- old 1, level 24, hits 6

-- Magistrate Henry Maleb
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=2276; -- old 1.85, level 60, hits 15

-- Ravenclaw Regent
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2283; -- old 3.7, level 22, hits 19

-- Andrew Brownell
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2308; -- old 1.1, level 40, hits 27

-- Thomas Arlento
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2309; -- old 1.2, level 5, hits 4

-- Dalaran Summoner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2358; -- old 1.15, level 35, hits 75

-- Elemental Slave
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2359; -- old 0, level 34, hits 241
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2359; -- old 0.95, level 33, hits 143

-- Southshore Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2386; -- old 1.3, level 55, hits 142

-- Warden Belamoore
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2415; -- old 1.6, level 36, hits 7

-- Varimathras
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2425; -- old 1.5, level 62, hits 275
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=2425; -- old 13.85, level 62, hits 57

-- Helcular's Remains
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=2433; -- old 5.8, level 44, hits 15

-- Southshore Crier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2435; -- old 0.85, level 32, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2435; -- old 1.45, level 32, hits 13

-- Narillasanz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.35 WHERE `entry`=2447; -- old 3.85, level 44, hits 8

-- Clerk Horrace Whitesteed
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2448; -- old 1.5, level 26, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2448; -- old 1.15, level 26, hits 60

-- Miner Hackett
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2450; -- old 1.1, level 29, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2450; -- old 1.1, level 29, hits 36

-- Flesh Eating Worm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=2462; -- old 0.9, level 25, hits 267

-- Watcher Fraizer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2470; -- old 0.85, level 37, hits 15

-- Remote-Controlled Golem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=3 WHERE `entry`=2520; -- old 1, level 18, hits 22
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2520; -- old 2.6, level 18, hits 76

-- Dalaran Serpent
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.2 WHERE `entry`=2540; -- old 1.3, level 14, hits 178
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=2540; -- old 0.14, level 15, hits 103

-- Archmage Ansirem Runeweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2543; -- old 1.5, level 40, hits 6

-- Brutus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=5.75 WHERE `entry`=2551; -- old 999.6, level 43, hits 46

-- Dabyrie Militia
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2581; -- old 0.85, level 31, hits 59
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2581; -- old 1.35, level 31, hits 71

-- Dabyrie Laborer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2582; -- old 1.3, level 30, hits 114

-- Fozruk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.15 WHERE `entry`=2611; -- old 4.25, level 42, hits 77

-- Spirit of Old
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2623; -- old 1.5, level 33, hits 6

-- Compact Harvest Reaper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2676; -- old 0, level 40, hits 40

-- Highvale Outrunner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2691; -- old 1.2, level 44, hits 327

-- Highvale Scout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2692; -- old 1.1, level 45, hits 446

-- Highvale Ranger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2694; -- old 1.1, level 47, hits 280

-- Kinelory
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2713; -- old 1.2, level 38, hits 65
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2713; -- old 1.15, level 38, hits 100

-- Scorched Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.45 WHERE `entry`=2726; -- old 3, level 45, hits 100

-- Lesser Rock Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2735; -- old 1.9, level 39, hits 729

-- Greater Rock Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2736; -- old 1.75, level 43, hits 71

-- Shadowforge Commander
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2744; -- old 3.6, level 40, hits 4

-- Archaedas
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2748; -- old 0.7, level 47, hits 83

-- Siege Golem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.4 WHERE `entry`=2749; -- old 3.8, level 40, hits 15

-- War Golem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2751; -- old 3.55, level 36, hits 3

-- Rumbler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2752; -- old 3.15, level 45, hits 28

-- Barnabus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2753; -- old 2.1, level 38, hits 5

-- Anathemus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.75 WHERE `entry`=2754; -- old 3.4, level 45, hits 9

-- Myzrael
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=2755; -- old 4.6, level 44, hits 40

-- Burning Exile
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2760; -- old 0.65, level 38, hits 142

-- Cresting Exile
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2761; -- old 0.75, level 39, hits 244

-- Thundering Exile
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2762; -- old 0.55, level 39, hits 102

-- Thenan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2763; -- old 1.5, level 42, hits 27
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=2763; -- old 4.25, level 42, hits 31

-- Vengeful Surge
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2776; -- old 1.5, level 40, hits 78

-- Enraged Rock Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2791; -- old 1.85, level 42, hits 276

-- Summoned Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2794; -- old 0, level 38, hits 135
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=2794; -- old 2.35, level 38, hits 98

-- Prismatic Exile
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2887; -- old 1.4, level 43, hits 99

-- Prospector Remtravel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2917; -- old 0.75, level 16, hits 169

-- Fam'retor Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2919; -- old 1.35, level 45, hits 22

-- Puppet of Helcular
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2946; -- old 1.5, level 42, hits 49

-- Palemane Tanner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=2949; -- old 1, level 6, hits 42

-- Palemane Poacher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=2951; -- old 1, level 8, hits 45
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2951; -- old 0.75, level 8, hits 99

-- Venture Co. Hireling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=2975; -- old 1.1, level 6, hits 93

-- Bael'dun Appraiser
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=2990; -- old 1.6, level 8, hits 37
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=2990; -- old 1.1, level 8, hits 58
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=2990; -- old 0.14, level 8, hits 58

-- Unseen
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3094; -- old 1.75, level 49, hits 115

-- Makrura Clacker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=3103; -- old 1.5, level 7, hits 20

-- Makrura Shellhide
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.1 WHERE `entry`=3104; -- old 1.5, level 7, hits 10

-- Razormane Dustrunner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=3113; -- old 0.95, level 9, hits 35

-- Gazz'uz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3204; -- old 1.1, level 14, hits 5

-- Zalazane
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3205; -- old 1, level 10, hits 20

-- Hexed Troll
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3207; -- old 1, level 9, hits 23
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=3207; -- old 0.7, level 9, hits 25

-- Margoz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3208; -- old 0.8, level 18, hits 4

-- Brave Darksky
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=3220; -- old 1, level 14, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3220; -- old 0.75, level 14, hits 8

-- "Squealer" Thornmantle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3229; -- old 1, level 5, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=3229; -- old 1.2, level 5, hits 40

-- Silithid Harvester
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3253; -- old 3.05, level 24, hits 33
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=3253; -- old 0.14, level 24, hits 33

-- Bristleback Water Seeker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3260; -- old 1, level 16, hits 70

-- Bristleback Geomancer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3263; -- old 1, level 20, hits 90
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=3263; -- old 1.15, level 20, hits 48
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=3263; -- old 0.14, level 19, hits 30

-- Sludge Beast
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=3295; -- old 3.8, level 19, hits 30

-- Sergra Darkthorn
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=3338; -- old 2.6, level 60, hits 4

-- Grelkor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3343; -- old 1.65, level 55, hits 205

-- Bael'dun Excavator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3374; -- old 1.1, level 22, hits 52

-- Burning Blade Bruiser
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3379; -- old 1, level 11, hits 29

-- Theramore Preserver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3386; -- old 1, level 17, hits 102

-- Prospector Khazgorm
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3392; -- old 1.1, level 24, hits 23
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.875 WHERE `entry`=3392; -- old 1.3, level 24, hits 45

-- Verog the Dervish
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3395; -- old 1, level 18, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=3395; -- old 1.45, level 18, hits 18

-- Gesharahan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=3398; -- old 3.2, level 20, hits 18

-- General Twinbraid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3414; -- old 1.1, level 30, hits 15

-- Living Flame
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.45 WHERE `entry`=3417; -- old 1, level 17, hits 82

-- Kuz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3436; -- old 1.2, level 21, hits 9

-- Wizzlecrank's Shredder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3439; -- old 0.8, level 18, hits 47

-- Tonga Runetotem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3448; -- old 0.85, level 22, hits 4

-- Cannoneer Whessan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3455; -- old 1, level 19, hits 14

-- Gilthares Firebough
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3465; -- old 0.7, level 17, hits 188
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=3465; -- old 0.14, level 17, hits 188

-- Nargal Deatheye
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=3479; -- old 1.05, level 35, hits 3

-- Wrahk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=3485; -- old 0.8, level 18, hits 3

-- Pyrewood Tailor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3530; -- old 1, level 15, hits 11

-- Blackmoss the Fetid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3535; -- old 2.7, level 13, hits 9

-- Overwatch Mark I
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3538; -- old 1.35, level 32, hits 2

-- Mist
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=3568; -- old 0.75, level 10, hits 6

-- Therylune
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3584; -- old 0.6, level 17, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3584; -- old 0.7, level 17, hits 62

-- Devrak
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3615; -- old 1.4, level 55, hits 7

-- Lordaeron Citizen
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3617; -- old 1.3, level 15, hits 62

-- Rarck
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3625; -- old 1.45, level 55, hits 177

-- Devouring Ectoplasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3638; -- old 2.95, level 16, hits 47

-- Evolving Ectoplasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3640; -- old 2.8, level 18, hits 60

-- Mutanus the Devourer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=3654; -- old 3.65, level 22, hits 23

-- Jorb
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3659; -- old 0.85, level 37, hits 10

-- Delgren the Purifier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3663; -- old 0.75, level 19, hits 9

-- Skum
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=3674; -- old 2.75, level 21, hits 4

-- Disciple of Naralex
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3678; -- old 2.7, level 20, hits 61

-- Volcor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3692; -- old 0.55, level 19, hits 16
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3692; -- old 0.75, level 19, hits 62

-- Gruna
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3708; -- old 0.25, level 52, hits 14

-- Mystlash Hydra
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3721; -- old 1, level 19, hits 19

-- Dark Strand Cultist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=3725; -- old 1, level 19, hits 77

-- Dark Strand Adept
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3728; -- old 1, level 19, hits 55
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3728; -- old 1.15, level 19, hits 11

-- Dark Strand Excavator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3730; -- old 1, level 20, hits 45

-- Forsaken Herbalist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3733; -- old 1, level 19, hits 48

-- Forsaken Thug
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=3734; -- old 1.05, level 20, hits 54

-- Apothecary Falthis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=3735; -- old 1, level 22, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3735; -- old 5, level 22, hits 8

-- Cenarion Protector
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3797; -- old 1.5, level 25, hits 80

-- Severed Druid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3799; -- old 1.2, level 29, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=3799; -- old 1.6, level 29, hits 21
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3799; -- old 0.14, level 29, hits 21

-- Severed Dreamer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3802; -- old 0, level 30, hits 22
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3802; -- old 1.35, level 30, hits 27
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3802; -- old 0.14, level 30, hits 27

-- Severed Keeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3803; -- old 0, level 29, hits 69

-- Cenarion Vindicator
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3833; -- old 1.15, level 27, hits 40

-- Biletoad
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=3835; -- old 1.3, level 1, hits 8

-- Deathstalker Adamant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=3849; -- old 3, level 18, hits 9

-- Shadowfang Wolfguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=3854; -- old 3.3, level 20, hits 3

-- Shadowfang Darksoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=3855; -- old 3.5, level 21, hits 126

-- Bleak Worg
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3861; -- old 4.95, level 25, hits 21

-- Slavering Worg
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3862; -- old 3.2, level 18, hits 119

-- Lupine Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=3863; -- old 0.85, level 24, hits 49
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3863; -- old 2.95, level 24, hits 111

-- Fel Steed
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3864; -- old 3.4, level 20, hits 18

-- Shadow Charger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3865; -- old 3.1, level 20, hits 22

-- Vile Bat
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3866; -- old 2.7, level 22, hits 6

-- Blood Seeker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=3868; -- old 0.85, level 23, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3868; -- old 3.05, level 23, hits 4

-- Tormented Officer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3873; -- old 2.9, level 24, hits 38

-- Haunted Servitor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3875; -- old 3.3, level 20, hits 149

-- Wailing Guardsman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3877; -- old 3.15, level 22, hits 145

-- Dark Strand Assassin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3879; -- old 1.6, level 21, hits 59

-- Baron Silverlaine
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=3887; -- old 0.85, level 24, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3887; -- old 3.2, level 24, hits 35

-- Forsaken Scout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3893; -- old 1.55, level 23, hits 31
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=3893; -- old 0.14, level 23, hits 31

-- Aligar the Tormentor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3898; -- old 1.6, level 24, hits 17

-- Balizar the Umbrage
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3899; -- old 1, level 24, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=3899; -- old 2.15, level 24, hits 5

-- Stoneclaw Totem II
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3911; -- old 0, level 21, hits 6

-- Stoneclaw Totem III
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3912; -- old 0, level 31, hits 16

-- Stoneclaw Totem IV
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3913; -- old 0, level 49, hits 79

-- Befouled Water Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3917; -- old 0.65, level 23, hits 142
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=3917; -- old 0.14, level 23, hits 142

-- Withered Ancient
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3919; -- old 1, level 26, hits 15
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=3919; -- old 0.14, level 26, hits 23

-- Bloodtooth Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.4 WHERE `entry`=3932; -- old 1, level 27, hits 101

-- Taneel Darkwood
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=3940; -- old 1, level 32, hits 22

-- Uthil Mooncall
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=3941; -- old 1, level 32, hits 6
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3941; -- old 1.45, level 32, hits 9

-- Mavoris Cloudsbreak
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=3942; -- old 1, level 32, hits 14
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3942; -- old 1.45, level 32, hits 9

-- Goblin Shipbuilder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3947; -- old 2.7, level 20, hits 82

-- Houndmaster Loksey
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=3974; -- old 4.35, level 34, hits 12

-- Herod
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3975; -- old 0.8, level 40, hits 62
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=3975; -- old 3.8, level 40, hits 16

-- Scarlet Commander Mograine
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.85 WHERE `entry`=3976; -- old 4.55, level 42, hits 269
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=3976; -- old 0.14, level 42, hits 269

-- High Inquisitor Whitemane
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.15 WHERE `entry`=3977; -- old 4.55, level 42, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.05 WHERE `entry`=3977; -- old 0.14, level 42, hits 23

-- Sap Beast
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=4020; -- old 0, level 23, hits 112
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=4020; -- old 0.14, level 23, hits 148

-- Enraged Stone Spirit
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=4034; -- old 1, level 25, hits 6

-- Furious Stone Spirit
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=4035; -- old 2.1, level 26, hits 7

-- Rogue Flame Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4036; -- old 0.65, level 23, hits 30
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=4036; -- old 0.14, level 23, hits 30

-- Burning Ravager
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4037; -- old 0.65, level 24, hits 42
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4037; -- old 0.14, level 24, hits 42

-- Burning Destroyer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4038; -- old 0.65, level 27, hits 20
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4038; -- old 0.14, level 27, hits 20

-- Magatha Grimtotem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4046; -- old 1.15, level 62, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4046; -- old 1.6, level 62, hits 28
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=4046; -- old 0.14, level 62, hits 28

-- Nal'taszar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.15 WHERE `entry`=4066; -- old 3.65, level 30, hits 18

-- Venture Co. Builder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4070; -- old 4.95, level 20, hits 8

-- Gravelsnout Digger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4113; -- old 1.5, level 29, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=4113; -- old 0.14, level 29, hits 23

-- Silithid Ravager
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4132; -- old 3.55, level 36, hits 9

-- Silithid Swarm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4196; -- old 0.85, level 49, hits 93

-- Brogus Thunderbrew
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4255; -- old 1.45, level 55, hits 116

-- Lana Thunderbrew
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4257; -- old 1.65, level 55, hits 2002

-- Daelyshia
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4267; -- old 1.4, level 55, hits 2

-- Fenrus the Devourer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=4274; -- old 0.85, level 25, hits 9

-- Archmage Arugal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=4275; -- old 0.85, level 26, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.7 WHERE `entry`=4275; -- old 3.7, level 26, hits 17

-- Commander Springvale
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=4278; -- old 3.6, level 24, hits 26

-- Scarlet Sorcerer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4294; -- old 4.95, level 38, hits 102

-- Scarlet Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4298; -- old 1.3, level 38, hits 51
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4298; -- old 3.65, level 38, hits 88

-- Scarlet Wizard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=4300; -- old 4.8, level 39, hits 138

-- Scarlet Centurion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.75 WHERE `entry`=4301; -- old 3.5, level 38, hits 159

-- Scarlet Champion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4302; -- old 3.65, level 40, hits 120

-- Scarlet Abbot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4303; -- old 3.65, level 39, hits 69

-- Gorm Grimtotem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4309; -- old 1.15, level 62, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4309; -- old 3.45, level 62, hits 41

-- Cor Grimtotem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4310; -- old 3.45, level 62, hits 36

-- Searing Hatchling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4323; -- old 1.15, level 42, hits 443

-- Firemane Ash Tail
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4331; -- old 0.85, level 43, hits 169

-- Brimgore
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.45 WHERE `entry`=4339; -- old 1.15, level 45, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.65 WHERE `entry`=4339; -- old 3.3, level 45, hits 7

-- Strashaz Hydra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=4374; -- old 5.45, level 60, hits 71


-- Withervine Rager
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4385; -- old 0.85, level 39, hits 3

-- Withervine Bark Ripper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4386; -- old 1.7, level 37, hits 15

-- Swamp Ooze
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4391; -- old 1.3, level 39, hits 29
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4391; -- old 1.55, level 37, hits 24

-- Corrosive Swamp Ooze
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4392; -- old 1.55, level 40, hits 46

-- Muckshell Clacker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.4 WHERE `entry`=4401; -- old 0.9, level 40, hits 1

-- Muckshell Snapclaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.45 WHERE `entry`=4402; -- old 1.2, level 40, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4402; -- old 1.9, level 40, hits 35

-- Muckshell Scrabbler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4404; -- old 0.75, level 42, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4404; -- old 0.75, level 42, hits 21
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=4404; -- old 0.14, level 42, hits 21

-- Muckshell Razorclaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4405; -- old 1.2, level 44, hits 61
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=4405; -- old 1.65, level 43, hits 69

-- Defias Taskmaster
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4417; -- old 2.85, level 19, hits 39

-- Defias Wizard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=4418; -- old 3.6, level 19, hits 3

-- Overlord Ramtusk
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4420; -- old 0.85, level 32, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=4420; -- old 4.25, level 32, hits 4

-- Charlga Razorflank
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4421; -- old 0.85, level 33, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=4421; -- old 4.3, level 33, hits 15

-- Agathelos the Raging
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4422; -- old 0.85, level 33, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4422; -- old 3.45, level 33, hits 19

-- Aggem Thorncurse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4424; -- old 3.65, level 30, hits 10

-- Jade Sludge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=4468; -- old 3.3, level 47, hits 126

-- Emerald Ooze
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=4469; -- old 4.15, level 46, hits 13

-- Rotting Cadaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4474; -- old 0.7, level 54, hits 437

-- Blighted Zombie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4475; -- old 0.75, level 52, hits 428

-- Feero Ironhand
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4484; -- old 0.85, level 20, hits 56

-- Parqual Fintallas
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4488; -- old 1.05, level 35, hits 133

-- Grenka Bloodscreech
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=4490; -- old 0.85, level 31, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4490; -- old 2, level 31, hits 18

-- Rok'Alim the Pounder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4499; -- old 3, level 30, hits 34

-- Overlord Mok'Morokk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.2 WHERE `entry`=4500; -- old 3, level 45, hits 26

-- Frostmaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4504; -- old 1.7, level 37, hits 33

-- Willix the Importer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4508; -- old 2.9, level 27, hits 202

-- Agam'ar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4511; -- old 5.15, level 25, hits 85

-- Rotting Agam'ar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4512; -- old 3.35, level 28, hits 36

-- Raging Agam'ar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4514; -- old 2.85, level 25, hits 97

-- Death's Head Sage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4518; -- old 3.35, level 29, hits 36

-- Razorfen Earthbreaker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4525; -- old 4.7, level 31, hits 44

-- Wind Howler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4526; -- old 1.75, level 26, hits 17

-- Stone Rumbler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=4528; -- old 1.75, level 22, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4528; -- old 3.85, level 22, hits 36

-- Razorfen Beast Trainer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4531; -- old 3.1, level 28, hits 37

-- Tamed Hyena
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4534; -- old 2.8, level 27, hits 43

-- Tamed Battleboar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4535; -- old 2.7, level 23, hits 17

-- Kraul Bat
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4538; -- old 0.85, level 30, hits 64
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4538; -- old 3.05, level 31, hits 105

-- Greater Kraul Bat
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4539; -- old 0.85, level 32, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4539; -- old 3.25, level 32, hits 64

-- Blood of Agamaggan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4541; -- old 3.35, level 27, hits 40

-- High Inquisitor Fairbanks
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=4542; -- old 4.35, level 40, hits 29

-- Arugal's Voidwalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.95 WHERE `entry`=4627; -- old 0.85, level 24, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4627; -- old 1.4, level 24, hits 56

-- Maraudine Scout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4654; -- old 3.65, level 37, hits 27

-- Maraudine Bonepaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4660; -- old 1.6, level 38, hits 6

-- Burning Blade Augur
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=4663; -- old 1, level 31, hits 152
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4663; -- old 1.2, level 31, hits 86

-- Deepstrider Giant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=4686; -- old 3.9, level 38, hits 9

-- Deepstrider Searcher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=4687; -- old 3.4, level 40, hits 8

-- Slitherblade Sorceress
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4712; -- old 1.15, level 32, hits 43

-- Illusionary Nightmare
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=4785; -- old 1.5, level 29, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4785; -- old 1.4, level 29, hits 25
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=4785; -- old 0.14, level 29, hits 25

-- Dawnwatcher Shaedlass
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4786; -- old 0.85, level 22, hits 3

-- Force of Nature
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4795; -- old 1.25, level 17, hits 63
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=4795; -- old 0.14, level 17, hits 63

-- Skittering Crustacean
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4821; -- old 2.85, level 23, hits 42

-- Barbed Crustacean
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4823; -- old 2.85, level 26, hits 144

-- Aku'mai Fisher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4824; -- old 3.2, level 24, hits 13

-- Aku'mai Snapjaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=4825; -- old 1.75, level 27, hits 70
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=4825; -- old 2.9, level 26, hits 152

-- Deep Pool Threshfin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4827; -- old 3.1, level 25, hits 10

-- Aku'mai
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=4829; -- old 3.35, level 28, hits 45

-- Old Serra'kis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4830; -- old 3.45, level 26, hits 20

-- Twilight Lord Kelris
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4832; -- old 3.55, level 27, hits 52

-- Theramore Infiltrator
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4834; -- old 1.25, level 36, hits 130

-- Shadowforge Darkcaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4848; -- old 0.7, level 43, hits 36
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=4848; -- old 3.95, level 43, hits 17

-- Shadowforge Archaeologist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4849; -- old 0.7, level 43, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=4849; -- old 3.7, level 43, hits 8

-- Stonevault Geomancer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4853; -- old 0.7, level 43, hits 62
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=4853; -- old 3.95, level 44, hits 31

-- Grimlok
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4854; -- old 0.75, level 45, hits 40
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=4854; -- old 3.55, level 45, hits 11

-- Stonevault Brawler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.3 WHERE `entry`=4855; -- old 0.2, level 44, hits 251
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=4855; -- old 3.7, level 44, hits 389

-- Stone Keeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=4857; -- old 1.4, level 46, hits 120
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=4857; -- old 3.45, level 46, hits 111

-- Stone Steward
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=4860; -- old 1.45, level 44, hits 475
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=4860; -- old 3.7, level 44, hits 533

-- Shrike Bat
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=4861; -- old 2.75, level 39, hits 133

-- Ghamoo-ra
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=7.6 WHERE `entry`=4887; -- old 932.45, level 25, hits 53
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4887; -- old 2.1, level 25, hits 60

-- Haunting Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4958; -- old 1.25, level 21, hits 10

-- Slim's Friend
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4971; -- old 1.6, level 34, hits 124

-- Murkshallow Softshell
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=4977; -- old 1.4, level 25, hits 160

-- Aku'mai Servant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=4978; -- old 2.25, level 26, hits 59

-- Theramore Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4979; -- old 1.1, level 56, hits 9

-- Stockade Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4995; -- old 0.95, level 45, hits 10

-- Defias Rioter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5043; -- old 1.3, level 20, hits 39

-- Theramore Skirmisher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5044; -- old 1.65, level 36, hits 161

-- Private Hallan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5045; -- old 0.7, level 36, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5045; -- old 1.55, level 36, hits 71

-- Lieutenant Caldwell
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5046; -- old 1.65, level 37, hits 36

-- Lupine Delusion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5097; -- old 0.85, level 24, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=5097; -- old 2.8, level 25, hits 42

-- Jonivera Farmountain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5134; -- old 1.45, level 55, hits 298

-- Svalbrad Farmountain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5135; -- old 1.45, level 55, hits 977

-- Kurdrum Barleybeard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5139; -- old 1.45, level 55, hits 1347

-- Murk Worm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=5226; -- old 3.7, level 47, hits 239

-- Saturated Ooze
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=5228; -- old 3.3, level 48, hits 119

-- Fungal Ooze
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.65 WHERE `entry`=5235; -- old 3.45, level 45, hits 56

-- Gordunni Ogre Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5237; -- old 0.85, level 42, hits 60

-- Cursed Atal'ai
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=5243; -- old 3.45, level 46, hits 52

-- Atal'ai Warrior
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=5256; -- old 3.25, level 49, hits 175

-- Atal'ai Witch Doctor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=5259; -- old 3.7, level 50, hits 194

-- Enthralled Atal'ai
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=5261; -- old 3.45, level 46, hits 92

-- Mummified Atal'ai
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=5263; -- old 0.7, level 47, hits 63
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=5263; -- old 3.35, level 46, hits 108

-- Atal'ai Deathwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=5271; -- old 4.25, level 50, hits 301

-- Atal'ai High Priest
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=5273; -- old 4.15, level 51, hits 36

-- Nightmare Scalebane
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=5277; -- old 3.75, level 51, hits 240

-- Nightmare Wyrmkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=5280; -- old 3.9, level 51, hits 159

-- Hakkari Frostwing
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=5291; -- old 3.5, level 49, hits 30

-- Enraged Feral Scar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5295; -- old 2.95, level 44, hits 176

-- Phantim
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=5314; -- old 7.45, level 62, hits 21

-- Hatecrest Screamer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5335; -- old 0.95, level 42, hits 3

-- Bloodroar the Stalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5346; -- old 3.15, level 48, hits 8

-- Land Walker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=5357; -- old 3.25, level 49, hits 4

-- Cliff Giant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=5358; -- old 3.05, level 49, hits 17

-- Shore Strider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.25 WHERE `entry`=5359; -- old 3.4, level 48, hits 7

-- Deep Strider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5360; -- old 1.25, level 49, hits 3

-- Galen Goodward
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5391; -- old 0.85, level 37, hits 92

-- Khan Hratha
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=5402; -- old 4.25, level 42, hits 3

-- Deathstalker Zraedus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5418; -- old 1.1, level 40, hits 19

-- Centipaar Worker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5458; -- old 0.5, level 49, hits 49

-- Sea Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5461; -- old 0.65, level 49, hits 282

-- Sea Spray
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5462; -- old 0.65, level 48, hits 107

-- Coast Strider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=5466; -- old 3.25, level 49, hits 8

-- Dune Smasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.55 WHERE `entry`=5469; -- old 3.1, level 48, hits 6

-- Thistleshrub Dew Collector
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5481; -- old 1.55, level 47, hits 268

-- Thistleshrub Rootshaper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5485; -- old 1.85, level 49, hits 173

-- Wastewander Thief
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5616; -- old 1.25, level 40, hits 321

-- Wastewander Bandit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5618; -- old 1.25, level 42, hits 351

-- Undercity Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5624; -- old 1.2, level 55, hits 14783

-- Dalinda Malem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5644; -- old 1.25, level 35, hits 67
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=5644; -- old 0.14, level 35, hits 67

-- Tyler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5653; -- old 0.85, level 20, hits 3091

-- Edward
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5654; -- old 0.85, level 20, hits 3090

-- Richard Van Brunt
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5656; -- old 0.85, level 20, hits 32

-- Andrew Hartwell
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5659; -- old 0.85, level 20, hits 31

-- Travist Bosk
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5663; -- old 0.85, level 20, hits 7231

-- Eldin Partridge
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5664; -- old 0.85, level 20, hits 5369

-- Alyssa Blaye
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5665; -- old 0.85, level 20, hits 6749

-- Summoned Voidwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=5676; -- old 1.6, level 10, hits 34

-- Summoned Succubus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=5677; -- old 0, level 20, hits 16
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5677; -- old 1.4, level 20, hits 23

-- Male Human Captive
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=5680; -- old 1.6, level 5, hits 226
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.01 WHERE `entry`=5680; -- old 0.14, level 5, hits 226

-- Dalin Forgewright
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=5682; -- old 1, level 20, hits 15

-- Captive Ghoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=5685; -- old 0.65, level 10, hits 577
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=5685; -- old 0.14, level 10, hits 577

-- Captive Zombie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=5686; -- old 0.8, level 8, hits 376
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=5686; -- old 0.14, level 8, hits 376

-- Captive Abomination
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5687; -- old 0.3, level 20, hits 3112

-- Spawn of Hakkar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=5708; -- old 3.45, level 51, hits 25
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=5708; -- old 0.14, level 51, hits 25

-- Shade of Eranikus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=5709; -- old 7.45, level 55, hits 137

-- Jammal'an the Prophet
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=5710; -- old 3.8, level 54, hits 28

-- Ogom the Wretched
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=5711; -- old 4.05, level 53, hits 7

-- Zolo
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=5712; -- old 4.25, level 51, hits 24

-- Gasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=5713; -- old 3.95, level 51, hits 33

-- Hukku
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.25 WHERE `entry`=5715; -- old 5.3, level 52, hits 13

-- Zul'Lor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.4 WHERE `entry`=5716; -- old 3.85, level 52, hits 83

-- Mijan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=5717; -- old 4.15, level 52, hits 44

-- Rothos
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=16.5 WHERE `entry`=5718; -- old 5.25, level 62, hits 3

-- Weaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5720; -- old 0.85, level 51, hits 118
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=5720; -- old 3.45, level 51, hits 78

-- Dreamscythe
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5721; -- old 0.8, level 53, hits 76

-- Deviate Shambler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5761; -- old 4.05, level 20, hits 103

-- Deviate Moccasin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5762; -- old 2.9, level 21, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=5762; -- old 0.14, level 21, hits 23

-- Nightmare Ectoplasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5763; -- old 1.6, level 21, hits 36

-- Verdan the Everliving
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=8.1 WHERE `entry`=5775; -- old 6.1, level 21, hits 15

-- Cloned Ectoplasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=5780; -- old 3.35, level 16, hits 4

-- Silithid Creeper Egg
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=5781; -- old 0, level 21, hits 1

-- Sister Hatelash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5785; -- old 1.5, level 11, hits 4

-- Snagglespear
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=5786; -- old 1.2, level 9, hits 22
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=5786; -- old 0.14, level 9, hits 22

-- Enforcer Emilgund
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.55 WHERE `entry`=5787; -- old 2.1, level 11, hits 5

-- Aean Swiftriver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5797; -- old 3.25, level 25, hits 33

-- Thora Feathermoon
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5798; -- old 3.25, level 25, hits 63

-- Hannah Bladeleaf
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5799; -- old 3.5, level 24, hits 37

-- Marcus Bel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5800; -- old 3.5, level 24, hits 49

-- Margol the Rager
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5833; -- old 0.85, level 48, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.75 WHERE `entry`=5833; -- old 3.2, level 48, hits 11

-- Heggin Stonewhisker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=5847; -- old 3.05, level 24, hits 8

-- Malgin Barleybrew
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5848; -- old 3.1, level 25, hits 6

-- Digger Flameforge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5849; -- old 3.05, level 24, hits 11

-- Blazing Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5850; -- old 0.65, level 47, hits 61

-- Inferno Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5852; -- old 0.65, level 49, hits 132

-- Hagg Taurenbane
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=5859; -- old 1, level 26, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=5859; -- old 3.45, level 26, hits 20

-- Cursed Sycamore
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5881; -- old 1.5, level 45, hits 35
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5881; -- old 1.15, level 45, hits 32

-- Minor Manifestation of Fire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5893; -- old 0.7, level 12, hits 50

-- Deviate Faerie Dragon
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5912; -- old 3.35, level 20, hits 7

-- Sentinel Amarassan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5916; -- old 1.25, level 27, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5916; -- old 3.55, level 27, hits 6

-- Clara Charles
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=5917; -- old 1.75, level 2, hits 7

-- Sister Riven
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=5930; -- old 3.6, level 28, hits 8

-- Taskmaster Whipfang
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5932; -- old 10.3, level 22, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=5932; -- old 4, level 22, hits 10

-- Tooga
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=5955; -- old 0.55, level 45, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.2 WHERE `entry`=5955; -- old 0.95, level 45, hits 84
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=5955; -- old 0.14, level 45, hits 84

-- Dreadmaul Ogre
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5974; -- old 0.5, level 46, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5974; -- old 0.75, level 46, hits 45

-- Dreadmaul Ogre Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5975; -- old 1.4, level 47, hits 10

-- Wretched Lost One
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5979; -- old 1.15, level 47, hits 48

-- Nethergarde Foreman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5998; -- old 0.25, level 48, hits 2

-- Aqua Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6047; -- old 0, level 23, hits 34

-- Earthgrab Totem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6066; -- old 0, level 49, hits 1

-- Warug's Bodyguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6068; -- old 1.25, level 35, hits 5

-- Maraudine Khan Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6069; -- old 1.55, level 40, hits 6

-- Maraudine Khan Advisor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6070; -- old 1.7, level 38, hits 5

-- Bartleby
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=6090; -- old 0.75, level 10, hits 33
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=6090; -- old 0.14, level 10, hits 33

-- Highborne Apparition
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6116; -- old 1.1, level 46, hits 95

-- Highborne Lichling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6117; -- old 1.45, level 47, hits 16

-- Varo'then's Ghost
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6118; -- old 3.25, level 48, hits 11

-- Shade of Elura
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=6133; -- old 1, level 11, hits 9

-- Arkkoran Muckdweller
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6136; -- old 1.5, level 53, hits 10

-- Hetaera
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.3 WHERE `entry`=6140; -- old 3.25, level 55, hits 5

-- Son of Arkkoroc
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.6 WHERE `entry`=6144; -- old 3.65, level 54, hits 4

-- School of Fish
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=6145; -- old 1.3, level 1, hits 17

-- Cliff Breaker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=6146; -- old 3.65, level 55, hits 36

-- Cliff Thunderer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=6147; -- old 3.35, level 54, hits 19

-- Cliff Walker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=6148; -- old 0.9, level 52, hits 10

-- Roogug
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=6168; -- old 3.6, level 28, hits 6

-- Defias Raider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6180; -- old 1.45, level 18, hits 59
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=6180; -- old 0.14, level 18, hits 59

-- Blood Elf Surveyor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6198; -- old 1.3, level 51, hits 239

-- Blood Elf Reclaimer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6199; -- old 1.5, level 53, hits 84
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6199; -- old 1.55, level 53, hits 58

-- Caverndeep Burrower
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6206; -- old 3.35, level 27, hits 28

-- Caverndeep Invader
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=6208; -- old 3.45, level 25, hits 50

-- Caverndeep Pillager
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6210; -- old 1.4, level 25, hits 97
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=6210; -- old 2.95, level 25, hits 121

-- Caverndeep Reaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6211; -- old 3.25, level 28, hits 44

-- Dark Iron Agent
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6212; -- old 0.85, level 32, hits 43
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6212; -- old 4.15, level 33, hits 345

-- Irradiated Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6213; -- old 1.9, level 25, hits 35
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=6213; -- old 4.7, level 26, hits 10

-- Irradiated Slime
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=6218; -- old 3.25, level 28, hits 10

-- Corrosive Lurker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=6219; -- old 3.1, level 29, hits 28
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=6219; -- old 0.14, level 29, hits 28

-- Irradiated Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6220; -- old 0, level 29, hits 44
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6220; -- old 2.35, level 29, hits 17

-- Leprous Defender
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6223; -- old 3.1, level 29, hits 49

-- Dark Iron Ambassador
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.65 WHERE `entry`=6228; -- old 3.7, level 33, hits 7

-- Techbot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6231; -- old 3.45, level 26, hits 5

-- Stockade Archer
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6237; -- old 0.95, level 45, hits 21

-- Big Will
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6238; -- old 1.85, level 33, hits 10

-- Cyclonian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=6239; -- old 2.6, level 40, hits 10

-- Affray Challenger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6240; -- old 1.35, level 27, hits 22

-- Summoned Felhunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=6268; -- old 0, level 30, hits 21
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6268; -- old 1.45, level 30, hits 28
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=6268; -- old 0.14, level 30, hits 28

-- Irradiated Pillager
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6329; -- old 3.7, level 25, hits 53

-- Kurzen Mindslave
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6366; -- old 0.55, level 44, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6366; -- old 0.7, level 44, hits 63
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=6366; -- old 0.14, level 44, hits 63

-- Zanzil Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6388; -- old 1.35, level 45, hits 16

-- Ulag the Cleaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6390; -- old 1.4, level 11, hits 23

-- Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6412; -- old 1.15, level 53, hits 663

-- Anguished Dead
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6426; -- old 4.15, level 33, hits 195

-- Haunting Phantasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6427; -- old 4.15, level 33, hits 178

-- Arcanist Doan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6487; -- old 5.1, level 37, hits 48
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=6487; -- old 0.14, level 37, hits 48

-- Fallen Champion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6488; -- old 3.75, level 33, hits 7

-- Ironspine
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6489; -- old 3.6, level 33, hits 28
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=6489; -- old 0.14, level 33, hits 28

-- Azshir the Sleepless
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6490; -- old 2.4, level 33, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6490; -- old 4.05, level 33, hits 4

-- Rift Spawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6492; -- old 0.8, level 16, hits 122

-- Illusionary Phantasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6493; -- old 3.15, level 32, hits 56

-- Scorching Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6520; -- old 0.65, level 53, hits 100

-- Living Blaze
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6521; -- old 0.65, level 54, hits 400

-- Demon of the Orb
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6549; -- old 3.4, level 40, hits 27

-- Mana Surge
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6550; -- old 1.15, level 40, hits 2

-- Stone Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=6560; -- old 1.4, level 60, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=6560; -- old 3.4, level 60, hits 10

-- Scarlet Trainee
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6575; -- old 1.95, level 30, hits 60

-- Clutchmother Zavas
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6582; -- old 3.35, level 54, hits 10

-- Gruff
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.7 WHERE `entry`=6583; -- old 3.6, level 57, hits 3

-- Overseer Glibby
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=6606; -- old 1, level 16, hits 18

-- Harroc
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.86 WHERE `entry`=6607; -- old 1.2, level 5, hits 9

-- The Threshwackonator 4100
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=6669; -- old 2.5, level 20, hits 19

-- Calvin Montague
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=6784; -- old 1.2, level 5, hits 8

-- Tracking Hound
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=6867; -- old 1.45, level 30, hits 33
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=6867; -- old 0.14, level 30, hits 33

-- Baelog
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6906; -- old 1.3, level 41, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=6906; -- old 4.55, level 41, hits 12

-- Eric "The Swift"
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=6907; -- old 3.4, level 40, hits 7

-- Olaf
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.25 WHERE `entry`=6908; -- old 3.8, level 40, hits 18

-- Revelosh
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=6910; -- old 3.8, level 40, hits 13

-- Defias Dockworker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=6927; -- old 0.95, level 8, hits 5

-- Swamp Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6932; -- old 1.55, level 40, hits 9

-- Earthen Rocksmasher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7011; -- old 0.75, level 42, hits 90
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.55 WHERE `entry`=7011; -- old 1.25, level 42, hits 137

-- Earthen Sculptor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7012; -- old 0.8, level 42, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=7012; -- old 0.9, level 43, hits 10

-- Venomlash Scorpid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7022; -- old 0.85, level 40, hits 100
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7022; -- old 2.95, level 40, hits 88

-- Shadowforge Geologist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7030; -- old 0.85, level 41, hits 48
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7030; -- old 4.7, level 41, hits 35

-- Greater Obsidian Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7032; -- old 1.15, level 56, hits 16

-- Black Dragonspawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.85 WHERE `entry`=7040; -- old 3.8, level 52, hits 150

-- Black Wyrmkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=7041; -- old 5.1, level 54, hits 49

-- Flamescale Dragonspawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.6 WHERE `entry`=7042; -- old 3.5, level 57, hits 27
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7042; -- old 0.14, level 57, hits 27

-- Flamescale Wyrmkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.85 WHERE `entry`=7043; -- old 4.7, level 57, hits 16

-- Scalding Drake
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.6 WHERE `entry`=7045; -- old 3.25, level 54, hits 4

-- Searscale Drake
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7046; -- old 0.9, level 58, hits 14

-- Condemned Monk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.3 WHERE `entry`=7069 && `patch`=8; -- old 6.05, level 58, hits 3

-- Earthen Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=7076; -- old 0.8, level 44, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.4 WHERE `entry`=7076; -- old 1, level 44, hits 24

-- Earthen Hallshaper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7077; -- old 0.7, level 45, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=7077; -- old 0.85, level 44, hits 27

-- Cleft Scorpid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7078; -- old 1.2, level 36, hits 220

-- Viscous Fallout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=7079; -- old 2.1, level 30, hits 9

-- Cursed Ooze
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7086; -- old 0.85, level 50, hits 115

-- Shadowforge Ambusher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7091; -- old 0.7, level 44, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=7091 && `patch`=10; -- old 1.25, level 44, hits 6

-- Jaedenar Cultist
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7112; -- old 1.15, level 51, hits 133
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.18 WHERE `entry`=7112; -- old 0.14, level 51, hits 133

-- Jaedenar Adept
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7115; -- old 1.15, level 52, hits 118

-- Toxic Horror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7132; -- old 0.65, level 54, hits 285

-- Ancient Stone Keeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=7206; -- old 1.55, level 44, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=7206; -- old 3.7, level 44, hits 47

-- Obsidian Shard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7209; -- old 0, level 35, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=7209; -- old 1.5, level 35, hits 36
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7209; -- old 0.14, level 35, hits 36

-- Sand Storm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.2 WHERE `entry`=7226; -- old 0.6, level 44, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=7226; -- old 0.14, level 44, hits 24

-- Ironaya
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=7228; -- old 4.8, level 40, hits 24

-- Taskmaster Fizzule
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=7233; -- old 3, level 30, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7233; -- old 0.14, level 30, hits 24

-- Sandfury Soul Eater
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=7247; -- old 3.7, level 46, hits 176

-- Sandfury Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=7268; -- old 0.7, level 46, hits 195

-- Witch Doctor Zum'rah
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=7271; -- old 3.7, level 46, hits 71

-- Shadowpriest Sezz'ziz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=7275; -- old 3.5, level 47, hits 23

-- Zul'Farrak Dead Hero
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7276; -- old 1, level 45, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=7276 && `patch`=10; -- old 1, level 45, hits 64

-- Zul'Farrak Zombie
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7286; -- old 0, level 44, hits 891
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=7286; -- old 3.7, level 44, hits 2138

-- Grand Foreman Puzik Gallywix
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=7288; -- old 2.85, level 23, hits 19

-- Shadowforge Sharpshooter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7290; -- old 0.7, level 44, hits 75
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=7290; -- old 3.7, level 44, hits 38

-- Galgann Firehammer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7291; -- old 0.7, level 45, hits 71

-- Earthen Custodian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7309; -- old 1, level 45, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=7309; -- old 1.15, level 45, hits 50

-- Rageclaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=7318; -- old 1, level 10, hits 68

-- Stonevault Mauler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.3 WHERE `entry`=7320; -- old 0.2, level 44, hits 105
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=7320; -- old 3.5, level 44, hits 130

-- Stonevault Flameweaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7321; -- old 0.7, level 44, hits 41
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=7321; -- old 4.8, level 44, hits 42

-- Withered Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7327; -- old 1, level 35, hits 52
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7327; -- old 3.95, level 35, hits 132

-- Withered Reaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7328; -- old 0, level 36, hits 53
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=7328; -- old 3.85, level 36, hits 91

-- Withered Quilguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7329; -- old 0, level 36, hits 106
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7329; -- old 3.85, level 36, hits 185

-- Withered Spearhide
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7332; -- old 3.95, level 34, hits 84

-- Battle Boar Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7334; -- old 0, level 37, hits 55

-- Skeletal Shadowcaster
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7340; -- old 2.55, level 36, hits 9

-- Skeletal Frostweaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7341; -- old 0.85, level 37, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=7341; -- old 4.95, level 37, hits 20

-- Skeletal Summoner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7342; -- old 0.8, level 39, hits 28
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7342; -- old 4.8, level 39, hits 21

-- Splinterbone Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=7344; -- old 1.25, level 38, hits 82
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=7344; -- old 1.35, level 38, hits 245

-- Splinterbone Captain
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7345; -- old 0.75, level 39, hits 65
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=7345; -- old 3.8, level 39, hits 7

-- Splinterbone Centurion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7346; -- old 0.8, level 38, hits 93

-- Boneflayer Ghoul
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7347; -- old 0.8, level 39, hits 107
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=7347; -- old 3.5, level 39, hits 182

-- Thorn Eater Ghoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=7348; -- old 3.65, level 38, hits 189

-- Tomb Fiend
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7349; -- old 1.55, level 35, hits 160

-- Tomb Reaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7351; -- old 3.45, level 37, hits 112

-- Frozen Soul
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7352; -- old 0.85, level 37, hits 39
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=7352; -- old 3.9, level 37, hits 42

-- Freezing Spirit
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7353; -- old 0.8, level 40, hits 21
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=7353; -- old 3.65, level 40, hits 76

-- Ragglesnout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7354; -- old 3.15, level 40, hits 8

-- Tuten'kash
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7355; -- old 0.8, level 40, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=7355; -- old 3.7, level 40, hits 20

-- Plaguemaw the Rotting
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7356; -- old 0.8, level 40, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7356; -- old 3.8, level 40, hits 79

-- Mordresh Fire Eye
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7357; -- old 0.9, level 39, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=7357; -- old 5.2, level 39, hits 6

-- Amnennar the Coldbringer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.2 WHERE `entry`=7358; -- old 4.85, level 41, hits 4

-- Dun Garok Soldier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7360; -- old 1.5, level 28, hits 13

-- Grubbis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=7361; -- old 4.25, level 32, hits 15

-- Restless Shade
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7370; -- old 2.15, level 59, hits 5

-- Earthen Stonebreaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7396; -- old 0.7, level 44, hits 147
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7396; -- old 1.2, level 44, hits 350

-- Earthen Stonecarver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7397; -- old 0.75, level 44, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=7397; -- old 1.05, level 44, hits 25

-- Stoneclaw Totem V
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7398; -- old 0, level 54, hits 118

-- Stoneclaw Totem VI
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7399; -- old 0, level 60, hits 257

-- Deadly Cleft Scorpid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7405; -- old 0.7, level 42, hits 71

-- Spigot Operator Luglunket
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7408; -- old 1.1, level 40, hits 36

-- Frostmaul Giant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=7428; -- old 5.2, level 59, hits 37

-- Frostmaul Preserver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=7429; -- old 5.4, level 60, hits 38

-- Cobalt Wyrmkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=7435; -- old 4.75, level 55, hits 10

-- Cobalt Scalebane
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=7436; -- old 4.65, level 57, hits 17

-- Cobalt Mageweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=7437; -- old 6.25, level 58, hits 7

-- Hederine Manastalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7462; -- old 0.9, level 59, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=7462; -- old 5, level 60, hits 15

-- Hederine Slayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7463; -- old 0.9, level 60, hits 35
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.2 WHERE `entry`=7463; -- old 5.15, level 59, hits 8

-- Suffering Highborne
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7523; -- old 1.15, level 55, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7523; -- old 1.2, level 55, hits 108

-- Anguished Highborne
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7524; -- old 1.2, level 56, hits 64

-- Goblin Land Mine
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7527; -- old 0, level 43, hits 80

-- Wandering Forest Walker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7584; -- old 3.7, level 46, hits 155

-- Sergeant Bly
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=7604; -- old 3.5, level 45, hits 1118

-- Raven
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=7605; -- old 1, level 44, hits 191
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=7605; -- old 3.7, level 44, hits 817

-- Oro Eyegouge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=7606; -- old 5.05, level 44, hits 171

-- Weegli Blastfuse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=7607; -- old 3.2, level 43, hits 802

-- Murta Grimgut
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=7608; -- old 3.95, level 44, hits 403

-- Razelikh the Defiler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=7664; -- old 5.45, level 60, hits 5

-- Grol the Destroyer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=7665; -- old 3.6, level 58, hits 25
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7665; -- old 0.14, level 58, hits 25

-- Senior Surveyor Fizzledowser
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7724; -- old 0.14, level 44, hits 100

-- Ilifar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7734; -- old 1.35, level 60, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=7734; -- old 5.7, level 60, hits 21

-- Felcular
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7735; -- old 1.35, level 60, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=7735; -- old 5.55, level 60, hits 44

-- Witherbark Felhunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7767; -- old 0, level 45, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7767; -- old 1.5, level 46, hits 15

-- Witherbark Bloodling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=7768; -- old 1.4, level 25, hits 104
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=7768; -- old 0.14, level 25, hits 104

-- Hazzali Parasite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=7769; -- old 1.35, level 45, hits 241

-- Skeleton of Zum'rah
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7786; -- old 1.5, level 35, hits 99

-- Sandfury Slave
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7787; -- old 1.35, level 44, hits 650

-- Ruuzlu
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.7 WHERE `entry`=7797; -- old 3.45, level 46, hits 35

-- Wastewander Scofflaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7805; -- old 1.6, level 45, hits 33
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=7805; -- old 0.14, level 45, hits 33

-- Marauding Owlbeast
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7808; -- old 1.55, level 46, hits 102

-- Vilebranch Ambusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7809; -- old 1.45, level 47, hits 174

-- Bera Stonehammer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7823; -- old 1.4, level 55, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.65 WHERE `entry`=7823; -- old 3.25, level 55, hits 5

-- Teremus the Devourer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7846; -- old 1.5, level 60, hits 22
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.5 WHERE `entry`=7846; -- old 7.2, level 60, hits 18

-- Lurking Feral Scar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=7848; -- old 1.5, level 46, hits 153

-- Lingering Highborne
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7864; -- old 0, level 49, hits 10

-- Hadoken Swiftstrider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=7875; -- old 1.75, level 57, hits 8

-- Treasure Hunting Pirate
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7899; -- old 1.55, level 44, hits 79

-- Treasure Hunting Swashbuckler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7901; -- old 1.55, level 44, hits 60

-- Treasure Hunting Buccaneer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7902; -- old 1.6, level 45, hits 44

-- Captured Sprite Darter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7997; -- old 0, level 42, hits 189

-- Blastmaster Emi Shortfuse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7998; -- old 2.9, level 27, hits 49

-- Barrens Guard
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8016; -- old 5.75, level 40, hits 10

-- Dark Iron Land Mine
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8035; -- old 0, level 57, hits 7

-- Thelsamar Mountaineer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8055; -- old 1.1, level 40, hits 41

-- Protector of the People
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8096; -- old 1.1, level 40, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=8096; -- old 0.14, level 40, hits 24

-- Witch Doctor Uzer'i
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=8115; -- old 1.4, level 50, hits 4

-- Sul'lithuz Abomination
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8120; -- old 1.25, level 47, hits 54
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=8120 && `patch`=10; -- old 3.25, level 47, hits 130

-- Antu'sul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.3 WHERE `entry`=8127; -- old 3.55, level 48, hits 95

-- Sul'lithuz Broodling
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8138; -- old 2.5, level 39, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8138; -- old 2.2, level 39, hits 118

-- Nijel's Point Guard
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8151; -- old 5.65, level 45, hits 18

-- Ghost Walker Brave
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8154; -- old 5.2, level 50, hits 26

-- Greater Healing Ward
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8179; -- old 0, level 45, hits 2

-- Occulus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=8196; -- old 3.35, level 50, hits 3

-- Chronalis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8197; -- old 1.15, level 61, hits 27
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=8197; -- old 5.2, level 61, hits 41

-- Tick
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=8198; -- old 3.5, level 52, hits 4

-- Kregg Keelhaul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8203; -- old 3.2, level 47, hits 16

-- Jalinde Summerdrake
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8214; -- old 3.55, level 49, hits 46

-- Smoldar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8278; -- old 3.45, level 50, hits 19

-- Faulty War Golem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=8279; -- old 0.15, level 46, hits 7

-- Mojo the Twisted
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8296; -- old 4.45, level 48, hits 19

-- Atal'ai Deathwalker's Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=8317; -- old 5.6, level 50, hits 105

-- Hakkari Sapper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8336; -- old 3.5, level 50, hits 24

-- Sentinel Keldara Sunblade
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8397; -- old 0.9, level 44, hits 4

-- Obsidion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8400; -- old 1.8, level 52, hits 48
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=8400; -- old 3.75, level 52, hits 86

-- Hakkari Minion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8437; -- old 0.35, level 46, hits 259

-- Hakkari Bloodkeeper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8438; -- old 3.4, level 50, hits 23

-- Avatar of Hakkar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8443; -- old 1.5, level 49, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.1 WHERE `entry`=8443; -- old 7.05, level 49, hits 14

-- Skeletal Servant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8477; -- old 0.35, level 58, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8477; -- old 0.45, level 58, hits 124

-- Nightmare Suppressor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8497; -- old 3.4, level 50, hits 84

-- Atal'ai Totem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8510; -- old 0, level 51, hits 1

-- Blighted Surge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8519; -- old 0.65, level 54, hits 4

-- Plague Ravager
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=8520; -- old 0.5, level 55, hits 22

-- Blighted Horror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8521; -- old 0.65, level 57, hits 26
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=8521; -- old 0.14, level 57, hits 26

-- Plague Monstrosity
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8522; -- old 0.65, level 58, hits 46

-- Cursed Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8524; -- old 1.6, level 54, hits 43

-- Dark Caster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8526; -- old 1.4, level 57, hits 19
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8526; -- old 1.6, level 57, hits 6

-- Dread Weaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8528; -- old 1.2, level 59, hits 191
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8528; -- old 1.5, level 59, hits 162

-- Unseen Servant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8538; -- old 0.85, level 55, hits 26

-- Chief Sharptusk Thornmantle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.55 WHERE `entry`=8554; -- old 0.95, level 5, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=8554; -- old 1.1, level 5, hits 41

-- Ranger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8564; -- old 2.4, level 59, hits 96
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8564; -- old 1.55, level 59, hits 92

-- Glutton
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8567; -- old 0.8, level 40, hits 3

-- Magus Rimtori
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8578; -- old 2.2, level 55, hits 3

-- Atal'alarion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=8580; -- old 4.65, level 50, hits 21

-- Blood Elf Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8581; -- old 0.8, level 51, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8581; -- old 1.45, level 51, hits 17

-- Frost Spectre
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8585; -- old 0, level 41, hits 8

-- Angered Infernal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8608; -- old 1.4, level 53, hits 8

-- Mithril Dragonling
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=8615; -- old 0.1, level 60, hits 24

-- Infernal Servant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8616; -- old 1.45, level 55, hits 33

-- Hukku's Voidwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.45 WHERE `entry`=8656; -- old 1.5, level 52, hits 29
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=8656; -- old 0.14, level 52, hits 29

-- Gusting Vortex
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8667; -- old 0.6, level 43, hits 15

-- Auctioneer Leeka
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8672; -- old 0.85, level 50, hits 16

-- Dreadlord
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8716; -- old 1.5, level 62, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.7 WHERE `entry`=8716; -- old 5.75, level 62, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=8716; -- old 0.14, level 62, hits 24

-- Felguard Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=8717; -- old 5.15, level 61, hits 18

-- Manahound
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=8718; -- old 5.45, level 60, hits 3

-- Auctioneer Epitwee
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8721; -- old 0.85, level 50, hits 24

-- Muck Splash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8837; -- old 0.65, level 47, hits 30
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=8837; -- old 0.14, level 47, hits 30

-- Sandfury Acolyte
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=8876; -- old 1.45, level 44, hits 19

-- Anvilrage Guardsman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=8891; -- old 3.95, level 50, hits 1334

-- Anvilrage Footman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.6 WHERE `entry`=8892; -- old 4.1, level 51, hits 699

-- Anvilrage Soldier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=8893; -- old 10.05, level 53, hits 50

-- Anvilrage Medic
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=8894; -- old 6.4, level 53, hits 10

-- Anvilrage Officer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=8895; -- old 7.3, level 54, hits 10

-- Anvilrage Marshal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=8898; -- old 8.15, level 55, hits 236

-- Warbringer Construct
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=8905; -- old 0.95, level 54, hits 277

-- Molten War Golem
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.5 WHERE `entry`=8908; -- old 2.45, level 56, hits 91

-- Fireguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=8909; -- old 2.4, level 52, hits 100

-- Blazing Fireguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=8910; -- old 2.3, level 54, hits 114

-- Fireguard Destroyer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8911; -- old 0.85, level 54, hits 289
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.6 WHERE `entry`=8911; -- old 2.05, level 54, hits 441

-- Twilight's Hammer Torturer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=8912; -- old 4.25, level 51, hits 310

-- Twilight Emissary
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=8913; -- old 5.2, level 52, hits 124

-- Twilight Bodyguard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=8914; -- old 4, level 53, hits 83

-- Arena Spectator
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=8916; -- old 1.25, level 54, hits 10

-- Weapon Technician
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8920; -- old 0.8, level 54, hits 153
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=8920; -- old 1.05, level 54, hits 285

-- Panzor the Invincible
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=8923; -- old 3.5, level 57, hits 35

-- Dredge Worm
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8925; -- old 0.5, level 51, hits 54
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=8925; -- old 1.5, level 51, hits 34

-- Deep Stinger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=8926; -- old 0.5, level 50, hits 42
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.7 WHERE `entry`=8926; -- old 1.85, level 50, hits 35

-- Dark Screecher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8927; -- old 0.5, level 52, hits 41
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=8927; -- old 1.85, level 52, hits 116

-- Burrowing Thundersnout
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8928; -- old 0.5, level 51, hits 84
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8928; -- old 1.4, level 51, hits 42

-- Princess Moira Bronzebeard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=8929; -- old 3.7, level 58, hits 55

-- Borer Beetle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8932; -- old 0.65, level 50, hits 43
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=8932; -- old 1.4, level 50, hits 62

-- Cave Creeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8933; -- old 0.5, level 50, hits 78
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8933; -- old 1.95, level 50, hits 28

-- Pet Bomb
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8937; -- old 6.65, level 39, hits 9

-- Hematos
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.8 WHERE `entry`=8976; -- old 5.45, level 60, hits 6

-- Malfunctioning Reaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=8981; -- old 0.85, level 56, hits 18
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=8981; -- old 3.4, level 56, hits 36

-- Golem Lord Argelmach
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.25 WHERE `entry`=8983; -- old 5.65, level 57, hits 79

-- Voidwalker Minion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8996; -- old 0, level 57, hits 29
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=8996; -- old 0.2, level 57, hits 106

-- Bael'Gar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.3 WHERE `entry`=9016; -- old 3.6, level 54, hits 29

-- Lord Incendius
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9017; -- old 4.5, level 55, hits 51

-- High Interrogator Gerstahn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=9018; -- old 3.95, level 52, hits 49

-- Marshal Windsor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9023; -- old 0.85, level 52, hits 108

-- Pyromancer Loregrain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.6 WHERE `entry`=9024; -- old 4.75, level 52, hits 18

-- Overmaster Pyron
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=9026; -- old 2.4, level 52, hits 129

-- Gorosh the Dervish
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.05 WHERE `entry`=9027; -- old 0.75, level 56, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.4 WHERE `entry`=9027; -- old 3.55, level 56, hits 20

-- Grizzle
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9028; -- old 3.6, level 54, hits 17

-- Eviscerator
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.9 WHERE `entry`=9029; -- old 4, level 54, hits 76

-- Ok'thor the Breaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9030; -- old 0.8, level 53, hits 11

-- Anub'shiah
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9031; -- old 0.8, level 54, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.35 WHERE `entry`=9031; -- old 3.8, level 54, hits 7

-- Hedrum the Creeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9032; -- old 0.65, level 53, hits 73
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.66 WHERE `entry`=9032; -- old 3.5, level 53, hits 58

-- General Angerforge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.9 WHERE `entry`=9033; -- old 0.95, level 57, hits 52

-- Anger'rel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.85 WHERE `entry`=9035; -- old 3.45, level 55, hits 13

-- Gloom'rel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.5WHERE `entry`=9037; -- old 3.4, level 56, hits 12

-- Dope'rel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.6 WHERE `entry`=9040; -- old 0.5, level 56, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=9040; -- old 3.4, level 56, hits 15

-- Fineous Darkvire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.2 WHERE `entry`=9056; -- old 4, level 54, hits 100
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=9056; -- old 0.14, level 54, hits 100

-- Hierophant Theodora Mulvadania
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9079; -- old 1.15, level 58, hits 9

-- Rage Talon Dragonspawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9096; -- old 7.8, level 59, hits 589

-- Ambassador Flamelash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9156; -- old 1, level 57, hits 21

-- Bloodpetal Pest
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.03 WHERE `entry`=9157; -- old 0.1, level 40, hits 1627

-- Burning Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=9178; -- old 1.05, level 30, hits 70

-- Highlord Omokk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.9 WHERE `entry`=9196; -- old 3.8, level 59, hits 52

-- Spirestone Battle Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9197; -- old 3.8, level 58, hits 74

-- Spirestone Mystic
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9198; -- old 3.95, level 56, hits 75

-- Spirestone Enforcer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9199; -- old 3.65, level 55, hits 219

-- Spirestone Reaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9200; -- old 3.65, level 56, hits 204

-- Spirestone Ogre Magus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9201; -- old 3.9, level 55, hits 140

-- Spirestone Battle Lord
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9218; -- old 3.5, level 58, hits 32

-- Spirestone Butcher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9219; -- old 3.2, level 57, hits 12

-- War Master Voone
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=9237; -- old 3.45, level 59, hits 56

-- Scarshield Warlock
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9257; -- old 3.9, level 54, hits 39

-- Firebrand Grunt
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9259; -- old 3.6, level 57, hits 212

-- Firebrand Darkweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=9261; -- old 3.85, level 56, hits 80

-- Firebrand Invoker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=9262; -- old 3.85, level 56, hits 72

-- Firebrand Dreadweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=9263; -- old 3.85, level 57, hits 31

-- Firebrand Pyromancer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=9264; -- old 3.95, level 58, hits 49

-- Smolderthorn Shadow Hunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=9265; -- old 1, level 56, hits 34
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=9265; -- old 3.85, level 56, hits 52

-- Blazerunner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=9376; -- old 2.2, level 56, hits 76

-- Swirling Vortex
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9377; -- old 0, level 33, hits 29
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9377; -- old 0.7, level 33, hits 40

-- Ground Pounder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=9396; -- old 1.55, level 42, hits 10

-- Spawn of Bael'Gar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=9436; -- old 1.35, level 50, hits 126

-- Dark Keeper Pelver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.55 WHERE `entry`=9443; -- old 4, level 55, hits 4

-- Warlord Krom'zar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9456; -- old 1.2, level 20, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=9456; -- old 5.05, level 20, hits 42

-- Horde Defender
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=9457; -- old 0.8, level 18, hits 1065

-- Horde Axe Thrower
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=9458; -- old 0.7, level 18, hits 143

-- Watchman Doomgrip
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9476; -- old 4, level 55, hits 72

-- Cloned Ooze
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9477; -- old 0, level 50, hits 59
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9477; -- old 1.75, level 50, hits 78

-- Gorishi Grub
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9498; -- old 1.4, level 48, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=9498; -- old 0.14, level 48, hits 23

-- Plugger Spazzring
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9499; -- old 3.9, level 55, hits 9

-- Phalanx
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=9502; -- old 3.65, level 55, hits 41

-- Kolkar Stormseer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=9523; -- old 1.2, level 15, hits 141
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9523; -- old 1.75, level 15, hits 119

-- Kolkar Invader
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9524; -- old 1.5, level 17, hits 548

-- Blackbreath Crony
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=9541; -- old 3.8, level 53, hits 198

-- Ribbly Screwspigot
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=9543; -- old 3.6, level 53, hits 11

-- Guzzling Patron
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=9547; -- old 1.8, level 50, hits 19

-- Hammered Patron
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9554; -- old 0.85, level 48, hits 21
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=9554; -- old 3.65, level 49, hits 67

-- Bloodaxe Veteran
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=9583; -- old 1, level 59, hits 136
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=9583; -- old 3.45, level 59, hits 321

-- Bannok Grimaxe
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=9596; -- old 3.3, level 59, hits 14

-- Blackrock Raider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=9605; -- old 1.5, level 59, hits 5

-- Gargantuan Ooze
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9621; -- old 0, level 52, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9621; -- old 1.6, level 52, hits 6

-- Ograbisi
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9677; -- old 1.4, level 55, hits 57
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9677; -- old 3.65, level 55, hits 42

-- Crest Killer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9680; -- old 3.7, level 54, hits 17

-- Jaz
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.6 WHERE `entry`=9681; -- old 1, level 53, hits 27
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9681; -- old 4.05, level 53, hits 17

-- Marshal Reginald Windsor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=9682; -- old 1, level 52, hits 223

-- Bloodaxe Worg
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=9696; -- old 2.05, level 57, hits 376

-- Spire Scorpid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9701; -- old 1.45, level 58, hits 232

-- Burning Imp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=9708; -- old 1, level 54, hits 10

-- Ghok Bashguud
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=9718; -- old 3.2, level 59, hits 5

-- Quartermaster Zigris
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=9736; -- old 3.3, level 59, hits 53

-- Pyroguard Emberseer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=9816; -- old 5.2, level 60, hits 74

-- Blackhand Dreadweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=9817; -- old 7.25, level 59, hits 117

-- Blackhand Summoner
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=9818; -- old 6.85, level 59, hits 62

-- Blackhand Veteran
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=9819; -- old 7.15, level 59, hits 578

-- Entropic Beast
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9878; -- old 0.65, level 51, hits 91

-- Entropic Horror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9879; -- old 0.7, level 53, hits 82

-- Magmus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.25 WHERE `entry`=9938; -- old 3.6, level 57, hits 34

-- Gorishi Hive Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10040; -- old 1.5, level 54, hits 477

-- Gorishi Hive Queen
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=10041; -- old 1.45, level 56, hits 32

-- Ribbly's Crony
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=10043; -- old 3.75, level 51, hits 34

-- Sandarr Dunereaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=10080; -- old 0.6, level 45, hits 5

-- Dustwraith
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.6 WHERE `entry`=10081; -- old 1, level 45, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=10081; -- old 0.6, level 45, hits 6

-- Zerillis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=10082; -- old 3.1, level 45, hits 13

-- Rage Talon Flamescale
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10083; -- old 6.15, level 58, hits 125

-- Volchan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10119; -- old 1.1, level 60, hits 14
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.1 WHERE `entry`=10119; -- old 5.85, level 60, hits 35

-- Vault Warder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=4.6 WHERE `entry`=10120; -- old 6.7, level 45, hits 17

-- Raging Moonkin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10160; -- old 0.85, level 14, hits 52

-- Rookery Whelp
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=10161; -- old 2.95, level 57, hits 293

-- Spire Scarab
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10177; -- old 1.5, level 58, hits 257

-- Lady Sylvanas Windrunner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10181; -- old 1.3, level 63, hits 18
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15.5 WHERE `entry`=10181; -- old 13.05, level 63, hits 15

-- Onyxia
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10184; -- old 1.3, level 63, hits 1

-- Rookery Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10258; -- old 7.25, level 59, hits 21

-- Burning Felhound
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=10261; -- old 1, level 54, hits 6

-- Burning Felguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=10263; -- old 1, level 56, hits 4

-- Solakar Flamewreath
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.15 WHERE `entry`=10264; -- old 11, level 60, hits 6

-- Gizrul the Slavener
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=10268; -- old 5.2, level 60, hits 64

-- Jaron Stoneshaper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.6 WHERE `entry`=10301; -- old 1.05, level 55, hits 8

-- Blackhand Incarcerator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10316; -- old 1.1, level 59, hits 167
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=10316; -- old 3.85, level 59, hits 123

-- Blackhand Elite
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10317; -- old 1.15, level 60, hits 262
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.9 WHERE `entry`=10317; -- old 9.3, level 60, hits 258

-- Blackhand Assassin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.5 WHERE `entry`=10318; -- old 0.6, level 60, hits 183
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=10318; -- old 4.55, level 60, hits 144

-- Blackhand Iron Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=10319; -- old 2.3, level 60, hits 257

-- Emberstrife
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10321; -- old 1.4, level 61, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.6 WHERE `entry`=10321; -- old 5.1, level 61, hits 8

-- Murkdeep
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=10323; -- old 1, level 19, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=10323; -- old 1.5, level 19, hits 205
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=10323; -- old 0.14, level 19, hits 205

-- Gyth
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10339; -- old 1.2, level 62, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=10339; -- old 7, level 62, hits 74

-- Fellicent's Shade
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10358; -- old 3.15, level 12, hits 20

-- General Drakkisath
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10363; -- old 1.2, level 62, hits 12

-- Rage Talon Dragon Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=10366; -- old 1.75, level 60, hits 256
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=10366; -- old 7.2, level 60, hits 305

-- Shrye Ragefist
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10367; -- old 1.65, level 55, hits 65

-- Rage Talon Captain
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10371; -- old 1.2, level 62, hits 85

-- Rage Talon Fire Tongue
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10372; -- old 1.15, level 60, hits 165

-- Xabraxxis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10373; -- old 1.45, level 19, hits 14

-- Spire Spider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=10374; -- old 3.5, level 58, hits 202

-- Spire Spiderling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=10375; -- old 1.35, level 55, hits 1798

-- Crystal Fang
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=10376; -- old 4.9, level 60, hits 12

-- Broken Cadaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10383; -- old 1.65, level 55, hits 13

-- Vengeful Phantom
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10387; -- old 0.85, level 57, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=10387; -- old 1.45, level 57, hits 94

-- Spiteful Phantom
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10388; -- old 1.5, level 59, hits 10

-- Wrath Phantom
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10389; -- old 1.15, level 60, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10389; -- old 1.55, level 61, hits 7

-- Black Guard Sentry
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10394; -- old 1.35, level 58, hits 140
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10394; -- old 2.95, level 58, hits 113

-- Thuzadin Shadowcaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10398; -- old 2, level 59, hits 147
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10398; -- old 4.75, level 59, hits 97

-- Thuzadin Acolyte
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10399; -- old 1.6, level 59, hits 461

-- Thuzadin Necromancer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10400; -- old 2.05, level 60, hits 192
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=10400; -- old 4.65, level 61, hits 195

-- Plague Ghoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.3 WHERE `entry`=10405; -- old 3.5, level 58, hits 503

-- Rockwing Gargoyle
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=10408; -- old 3.5, level 57, hits 338

-- Eye of Naxxramas
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10411; -- old 1.45, level 57, hits 8

-- Crypt Crawler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10412; -- old 3.45, level 59, hits 160

-- Crypt Beast
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10413; -- old 5, level 60, hits 233

-- Patchwork Horror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.4 WHERE `entry`=10414; -- old 3.4, level 58, hits 86

-- Bile Spewer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=10416; -- old 5, level 60, hits 179

-- Venom Belcher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10417; -- old 1.15, level 60, hits 222
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.1 WHERE `entry`=10417; -- old 3.6, level 60, hits 298

-- Crimson Conjuror
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=10419; -- old 4.8, level 57, hits 61

-- Crimson Sorcerer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10422; -- old 1.4, level 58, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10422; -- old 4.75, level 59, hits 97

-- Crimson Priest
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10423; -- old 4.75, level 59, hits 22

-- Crimson Gallant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10424; -- old 5.4, level 60, hits 336

-- Crimson Battle Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10425; -- old 7.3, level 60, hits 53

-- Crimson Inquisitor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10426; -- old 5.4, level 59, hits 73

-- Warchief Rend Blackhand
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10429; -- old 1.2, level 62, hits 14
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.65 WHERE `entry`=10429; -- old 13, level 62, hits 51

-- The Beast
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10430; -- old 1.2, level 62, hits 14

-- Vectus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.7 WHERE `entry`=10432; -- old 5.55, level 60, hits 10

-- Marduk Blackpool
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.25 WHERE `entry`=10433; -- old 3.7, level 58, hits 12

-- Magistrate Barthilas
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=10435; -- old 3.7, level 58, hits 13

-- Baroness Anastari
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.65 WHERE `entry`=10436; -- old 3.7, level 59, hits 6

-- Nerub'enkan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.55 WHERE `entry`=10437; -- old 5.2, level 60, hits 110

-- Maleki the Pallid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.05 WHERE `entry`=10438; -- old 7.8, level 61, hits 44

-- Ramstein the Gorger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=11 WHERE `entry`=10439; -- old 5.5, level 61, hits 57

-- Baron Rivendare
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10440; -- old 1.4, level 62, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=10440; -- old 5.95, level 62, hits 82

-- Plagued Rat
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=10441; -- old 0.15, level 55, hits 1260

-- Chromatic Whelp
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=10442; -- old 4.3, level 57, hits 126

-- Chromatic Dragonspawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.75 WHERE `entry`=10447; -- old 5.5, level 59, hits 382

-- Plagued Insect
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=10461; -- old 0.1, level 55, hits 763

-- Wailing Banshee
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10464; -- old 3.45, level 59, hits 162

-- Scholomance Neophyte
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=10470; -- old 4.8, level 58, hits 94

-- Splintered Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10478; -- old 5, level 59, hits 422

-- Unstable Corpse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=10480; -- old 1, level 59, hits 437

-- Risen Warrior
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.25 WHERE `entry`=10486; -- old 3.3, level 60, hits 56

-- Risen Protector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10487; -- old 5.4, level 58, hits 90

-- Risen Construct
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=10488; -- old 3.3, level 61, hits 163

-- Diseased Ghoul
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.75 WHERE `entry`=10495; -- old 3.45, level 58, hits 521

-- Spectral Tutor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10498; -- old 5.4, level 60, hits 110

-- Spectral Researcher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10499; -- old 5.7, level 59, hits 51

-- Lady Illucia Barov
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10502; -- old 1.1, level 60, hits 44
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=10502; -- old 5.55, level 60, hits 93

-- Jandice Barov
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10503; -- old 1.15, level 61, hits 30
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=10503; -- old 3.9, level 61, hits 29

-- Lord Alexei Barov
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=10504; -- old 5.2, level 60, hits 109

-- Instructor Malicia
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=10505; -- old 5.55, level 60, hits 80

-- Kirtonos the Herald
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=10506; -- old 5.85, level 60, hits 59

-- The Ravenian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=10507; -- old 5.2, level 60, hits 103

-- Ras Frostwhisper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10508; -- old 1.5, level 62, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10508; -- old 5.6, level 62, hits 114

-- Jed Runewatcher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=10509; -- old 7.3, level 59, hits 8

-- Plagued Maggot
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=10536; -- old 0.1, level 55, hits 763

-- Vaelastrasz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.9 WHERE `entry`=10538; -- old 5, level 62, hits 16

-- Lazy Peon
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=10556; -- old 1.15, level 4, hits 4

-- Hearthsinger Forresten
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10558; -- old 3.2, level 57, hits 26
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=10558; -- old 0.14, level 57, hits 26

-- Crypt Scarab
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=10577; -- old 0.1, level 58, hits 5484

-- Urok Doomhowl
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=10584; -- old 5.55, level 60, hits 18

-- Mother Smolderweb
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.3 WHERE `entry`=10596; -- old 5.4, level 59, hits 146

-- Hulfnar Stonetotem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=10599; -- old 1, level 10, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=10599; -- old 0.75, level 10, hits 20
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=10599; -- old 0.14, level 10, hits 20

-- Thontek Rumblehoof
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=10600; -- old 1, level 11, hits 20
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10600; -- old 0.8, level 11, hits 13

-- Urok Enforcer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=10601; -- old 3.35, level 55, hits 62

-- Urok Ogre Magus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=10602; -- old 3.9, level 54, hits 72

-- Branch Snapper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=10641; -- old 3.1, level 25, hits 4

-- Spellmaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.65 WHERE `entry`=10662; -- old 3.55, level 56, hits 11

-- Manaclaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.75 WHERE `entry`=10663; -- old 4.55, level 58, hits 10

-- Plagued Hatchling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=10678; -- old 1.05, level 57, hits 245

-- Summoned Blackhand Dreadweaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.25 WHERE `entry`=10680; -- old 7.25, level 59, hits 4

-- Summoned Blackhand Veteran
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10681; -- old 7.15, level 59, hits 58

-- Rookery Hatcher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=10683; -- old 6.45, level 59, hits 20

-- Bile Slime
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10697; -- old 0.7, level 59, hits 57

-- Summoned Zombie
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10698; -- old 1.45, level 53, hits 27

-- Carrion Scarab
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=10699; -- old 1.95, level 57, hits 68

-- Galak Assassin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10720; -- old 0.85, level 27, hits 49
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10720; -- old 1.65, level 27, hits 67

-- Novice Warrior
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=10721; -- old 1.2, level 5, hits 3

-- Shy-Rotam
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10737; -- old 1.1, level 60, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=10737; -- old 5.3, level 60, hits 20

-- Sian-Rotam
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10741; -- old 0.5, level 60, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.25 WHERE `entry`=10741; -- old 5.45, level 60, hits 7

-- Blackhand Dragon Handler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10742; -- old 5.25, level 59, hits 155

-- Scalding Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=10756; -- old 0.95, level 28, hits 94

-- Boiling Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=10757; -- old 0.95, level 27, hits 145

-- Grimtotem Reaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.5 WHERE `entry`=10761; -- old 0.5, level 28, hits 68

-- Blackhand Thug
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=10762; -- old 7.25, level 60, hits 6

-- Royal Overseer Bauhaus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10781; -- old 1.1, level 40, hits 1382

-- Timmy the Cruel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.2 WHERE `entry`=10808; -- old 3.25, level 58, hits 83

-- Archivist Galford
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10811; -- old 1.1, level 60, hits 19
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.55 WHERE `entry`=10811; -- old 5.55, level 60, hits 42

-- Grand Crusader Dathrohan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10812; -- old 1.25, level 62, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.6 WHERE `entry`=10812; -- old 5.7, level 62, hits 41

-- Balnazzar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10813; -- old 1.4, level 62, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.9 WHERE `entry`=10813; -- old 7.35, level 62, hits 26

-- Duggan Wildhammer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.3 WHERE `entry`=10817; -- old 3.4, level 55, hits 3

-- Hed'mush the Rotting
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=10821; -- old 3.4, level 57, hits 22

-- Ranger Lord Hawkspear
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=10824; -- old 5.2, level 60, hits 7

-- Farmer Dalson
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=10836; -- old 1.45, level 56, hits 6

-- Commander Ashlam Valorfist
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10838; -- old 1.75, level 61, hits 58
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=10838; -- old 0.14, level 61, hits 58

-- Argent Officer Garush
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=10839; -- old 1, level 60, hits 3

-- Undead Scarab
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=10876; -- old 2, level 57, hits 94

-- Goraluk Anvilcrack
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10899; -- old 1.15, level 61, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.1 WHERE `entry`=10899; -- old 7.25, level 61, hits 7

-- Lorekeeper Polkelt
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10901; -- old 5.2, level 60, hits 129

-- Succubus Minion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.75 WHERE `entry`=10928; -- old 0, level 42, hits 68

-- Decrepit Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=10943; -- old 3.2, level 55, hits 591

-- Davil Lightfire
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10944; -- old 1.35, level 60, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=10944; -- old 5.4, level 60, hits 56

-- Horgus the Ravager
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.65 WHERE `entry`=10946; -- old 5.45, level 60, hits 14

-- Darrowshire Defender
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10948; -- old 1.45, level 58, hits 207

-- Silver Hand Disciple
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10949; -- old 1.2, level 57, hits 113

-- Marauding Corpse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10951; -- old 1.45, level 57, hits 86

-- Marauding Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10952; -- old 1.45, level 57, hits 93

-- Servant of Horgus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=10953; -- old 3.25, level 57, hits 209

-- Bloodletter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10954; -- old 3.25, level 57, hits 5

-- Summoned Water Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10955; -- old 0.85, level 56, hits 45

-- Frostwolf
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10981; -- old 0.75, level 51, hits 170
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10981; -- old 1.8, level 51, hits 452

-- Whitewhisker Vermin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10982; -- old 0.85, level 53, hits 37
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=10982; -- old 3.9, level 52, hits 29

-- Snowblind Harpy
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10986; -- old 0.85, level 53, hits 247
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10986; -- old 1.65, level 53, hits 454

-- Irondeep Trogg
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10987; -- old 0.85, level 53, hits 3494
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=10987; -- old 3.9, level 53, hits 8248

-- Alterac Ram
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10990; -- old 0.75, level 51, hits 684
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10990; -- old 1.8, level 51, hits 2320

-- Wildpaw Gnoll
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10991; -- old 0.85, level 53, hits 82
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10991; -- old 1.7, level 53, hits 194

-- Fallen Hero
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=10996; -- old 5, level 60, hits 23

-- Cannon Master Willey
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=10997; -- old 5.45, level 60, hits 52

-- Captured Arko'narin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=11016; -- old 0.95, level 48, hits 479

-- Alexi Barov
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.6 WHERE `entry`=11022; -- old 5, level 60, hits 42

-- Weldon Barov
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=11023; -- old 5, level 60, hits 3

-- Illusory Wraith
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=11027; -- old 1.45, level 51, hits 118

-- Mindless Undead
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11030; -- old 1.45, level 56, hits 281

-- Malor the Zealous
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.75 WHERE `entry`=11032; -- old 5.85, level 60, hits 53

-- Crimson Rifleman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11054; -- old 2.2, level 60, hits 11

-- Fras Siabi
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11058; -- old 1.15, level 61, hits 32
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.5 WHERE `entry`=11058; -- old 5.45, level 61, hits 16

-- Cauldron Lord Bilemaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11075; -- old 1.45, level 53, hits 52

-- Cauldron Lord Razarch
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11076; -- old 2.2, level 56, hits 4

-- Cauldron Lord Malvinious
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11077; -- old 1.55, level 55, hits 8

-- Cauldron Lord Soulwrath
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11078; -- old 1.45, level 58, hits 41

-- Stratholme Courier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.65 WHERE `entry`=11082; -- old 3.5, level 57, hits 17

-- Argent Rider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11102; -- old 1.3, level 60, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.9 WHERE `entry`=11102; -- old 0.95, level 60, hits 34
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=11102; -- old 0.14, level 60, hits 34

-- Yugrek
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11139; -- old 1.4, level 55, hits 2

-- Spirit of Trey Lightforge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=11141; -- old 3.45, level 53, hits 34

-- Undead Postman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11142; -- old 0.8, level 58, hits 69
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.55 WHERE `entry`=11142; -- old 3.35, level 58, hits 46

-- Postmaster Malown
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11143; -- old 1.35, level 60, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.8 WHERE `entry`=11143; -- old 5.55, level 60, hits 13

-- Argent Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11194; -- old 1.4, level 55, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=11194; -- old 1.7, level 55, hits 14

-- Mindless Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11197; -- old 2.15, level 60, hits 170

-- Summoned Skeleton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11200; -- old 0.85, level 60, hits 241

-- Kerlonian Evershade
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11218; -- old 0.85, level 20, hits 88
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=11218; -- old 0.14, level 20, hits 88

-- Scholomance Handler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=11257; -- old 5.4, level 59, hits 116

-- Doctor Theolen Krastinov
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.1 WHERE `entry`=11261; -- old 5.2, level 60, hits 56

-- Spectral Projection
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11263; -- old 2.15, level 58, hits 135

-- Dark Shade
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=11284; -- old 3.6, level 58, hits 105

-- Unliving Mossflayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11291; -- old 1.2, level 55, hits 338

-- Earthborer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=11320; -- old 2.8, level 14, hits 29

-- Molten Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.65 WHERE `entry`=11321; -- old 2.9, level 15, hits 18

-- Hakkari Shadowcaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11338; -- old 1.15, level 61, hits 186

-- Hakkari Shadow Hunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11339; -- old 1.15, level 61, hits 431

-- Hakkari Blood Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11340; -- old 1.15, level 61, hits 153

-- Zealot Lor'Khan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=11347; -- old 14.2, level 62, hits 149

-- Gurubashi Headhunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11351; -- old 1.1, level 60, hits 221

-- Gurubashi Berserker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11352; -- old 1.2, level 62, hits 142

-- Gurubashi Blood Drinker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11353; -- old 1.1, level 60, hits 858

-- Gurubashi Champion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11356; -- old 1.15, level 61, hits 709

-- Son of Hakkar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11357; -- old 1.65, level 60, hits 819
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11357; -- old 7.15, level 60, hits 3140

-- Soulflayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11359; -- old 1.15, level 61, hits 283

-- Zulian Cub
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11360; -- old 1.1, level 60, hits 155
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11360; -- old 3.1, level 60, hits 367

-- Zulian Tiger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=11361; -- old 8.85, level 60, hits 955

-- Zulian Panther
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11365; -- old 1.1, level 60, hits 1485
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11365; -- old 15.7, level 60, hits 1825

-- Bloodseeker Bat
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11368; -- old 1.1, level 60, hits 460

-- Razzashi Broodwidow
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11370; -- old 1.15, level 61, hits 279

-- Razzashi Serpent
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11371; -- old 1.1, level 60, hits 1108

-- Razzashi Cobra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=11373; -- old 9.4, level 60, hits 433

-- Jin'do the Hexxer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11380; -- old 1.3, level 63, hits 2

-- Bloodlord Mandokir
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11382; -- old 1.3, level 63, hits 10

-- Sandfury Speaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11387; -- old 1.15, level 61, hits 18
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11387; -- old 9.05, level 61, hits 50

-- Witherbark Speaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11388; -- old 1.55, level 61, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.2 WHERE `entry`=11388; -- old 7.4, level 61, hits 4

-- Vilebranch Speaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11391; -- old 1.25, level 61, hits 37
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11391; -- old 9.05, level 61, hits 41

-- Illusion of Jandice Barov
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11439; -- old 1.15, level 61, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11439; -- old 1.1, level 61, hits 492

-- Gordok Brute
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.2 WHERE `entry`=11441; -- old 6.65, level 57, hits 53

-- Gordok Captain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=11445; -- old 8.35, level 59, hits 18

-- Gordok Warlock
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.1 WHERE `entry`=11448; -- old 6.9, level 60, hits 49

-- Gordok Reaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11450; -- old 8.7, level 58, hits 83

-- Wildspawn Rogue
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=11452; -- old 3.6, level 57, hits 39

-- Wildspawn Felsworn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=11455; -- old 5, level 56, hits 4

-- Wildspawn Shadowstalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=11456; -- old 3.65, level 56, hits 114

-- Ironbark Protector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=11459; -- old 3.5, level 58, hits 267

-- Warpwood Stomper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.8 WHERE `entry`=11465; -- old 3.5, level 57, hits 46

-- Highborne Summoner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11466; -- old 1.3, level 55, hits 19
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11466; -- old 1.65, level 55, hits 39

-- Eldreth Seether
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=11469; -- old 3.5, level 59, hits 31

-- Eldreth Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=11472; -- old 3.5, level 58, hits 110

-- Eldreth Phantasm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=11475; -- old 3.45, level 58, hits 81

-- Rotting Highborne
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11477; -- old 1.55, level 58, hits 57

-- Arcane Aberration
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=11480; -- old 3.45, level 60, hits 111

-- Mana Remnant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=11483; -- old 2.4, level 59, hits 149

-- Residual Monstrosity
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=11484; -- old 3.75, level 59, hits 9

-- Prince Tortheldrin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=11486; -- old 5.2, level 61, hits 36
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.05 WHERE `entry`=11486; -- old 0.14, level 61, hits 36

-- Magister Kalendris
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11487; -- old 1.1, level 60, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=11487; -- old 5.7, level 60, hits 16

-- Tendris Warpwood
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11489; -- old 1.1, level 60, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=11489; -- old 6, level 60, hits 98

-- Zevrim Thornhoof
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=11490; -- old 3.6, level 57, hits 4

-- Immol'thar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11496; -- old 1.15, level 61, hits 27
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.75 WHERE `entry`=11496; -- old 6.45, level 61, hits 8

-- The Razza
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11497; -- old 1.25, level 60, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12.1 WHERE `entry`=11497; -- old 5.85, level 60, hits 17

-- Skarr the Unbreakable
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11498; -- old 1.1, level 58, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10.5 WHERE `entry`=11498; -- old 3.8, level 58, hits 4

-- King Gordok
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11501; -- old 1.2, level 62, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=11501; -- old 7.75, level 62, hits 14

-- Ragnaros
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11502; -- old 1.3, level 63, hits 3

-- Necrofiend
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11551; -- old 5, level 60, hits 149

-- Timbermaw Mystic
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11552; -- old 1.65, level 54, hits 18

-- Gorn One Eye
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11555; -- old 1.4, level 55, hits 8
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=11555; -- old 0.14, level 55, hits 20

-- Meilosh
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11557; -- old 1.4, level 55, hits 6

-- Kernda
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11558; -- old 1.4, level 55, hits 10

-- Outcast Necromancer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11559; -- old 1.4, level 39, hits 10

-- Magrami Spectre
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11560; -- old 1.55, level 38, hits 202

-- Undead Ravager
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.6 WHERE `entry`=11561; -- old 0.7, level 37, hits 262
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11561; -- old 1.15, level 38, hits 410

-- Whirlwind Ripper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11576; -- old 0, level 32, hits 66

-- Whirlwind Stormwalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11577; -- old 0, level 36, hits 16
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11577; -- old 0.75, level 36, hits 47

-- Whirlwind Shredder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11578; -- old 0, level 33, hits 78

-- Nefarian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11583; -- old 1.3, level 63, hits 7

-- Risen Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.35 WHERE `entry`=11598; -- old 1.6, level 59, hits 45

-- Irondeep Shaman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11600; -- old 4.1, level 54, hits 833

-- Irondeep Skullthumper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11602; -- old 3.75, level 54, hits 2719

-- Whitewhisker Digger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11603; -- old 0.85, level 53, hits 305
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11603; -- old 3.9, level 52, hits 685

-- Whitewhisker Geomancer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=11604; -- old 4.1, level 54, hits 36

-- Whitewhisker Overseer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=11605; -- old 3.75, level 55, hits 225

-- Alexia Ironknife
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11609; -- old 1.1, level 51, hits 49
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=11609; -- old 0.14, level 51, hits 49

-- Nathaniel Dumah
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11616; -- old 1.4, level 55, hits 6

-- Rattlegore
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11622; -- old 1.15, level 61, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=11622; -- old 5.6, level 61, hits 117

-- Servant of Weldon Barov
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11636; -- old 0.9, level 60, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=11636; -- old 0.6, level 60, hits 243

-- Servant of Alexi Barov
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11637; -- old 0.9, level 60, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=11637; -- old 0.6, level 60, hits 201

-- Morloch
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11657; -- old 1.25, level 58, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11657; -- old 5.8, level 58, hits 24

-- Molten Giant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11658; -- old 1.2, level 62, hits 85

-- Molten Destroyer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11659; -- old 1.3, level 63, hits 29

-- Flamewaker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11661; -- old 1.25, level 62, hits 18

-- Flamewaker Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11662; -- old 1.25, level 62, hits 139
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=11 WHERE `entry`=11662; -- old 13, level 62, hits 193

-- Flamewaker Elite
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=11664; -- old 1.55, level 62, hits 46

-- Lava Annihilator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11665; -- old 1.2, level 62, hits 99

-- Firewalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11666; -- old 1.2, level 61, hits 128

-- Flameguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11667; -- old 1.2, level 61, hits 61

-- Firelord
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11668; -- old 1.2, level 61, hits 92

-- Flame Imp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11669; -- old 1.2, level 61, hits 206

-- Ancient Core Hound
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11673; -- old 1.2, level 62, hits 119
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=11673; -- old 0.14, level 62, hits 57

-- Snowblind Windcaller
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11675; -- old 1.75, level 54, hits 55

-- Taskmaster Snivvle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11677; -- old 1.25, level 58, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11677; -- old 5.8, level 58, hits 6

-- Snowblind Ambusher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11678; -- old 0.85, level 53, hits 50
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11678; -- old 1.7, level 53, hits 139

-- Maraudine Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11685; -- old 1.4, level 42, hits 15

-- Ghostly Raider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11686; -- old 0, level 40, hits 46

-- Ghostly Marauder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11687; -- old 1.2, level 41, hits 62

-- Cursed Centaur
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11688; -- old 3.7, level 43, hits 9

-- Gnarlpine Instigator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=11690; -- old 1, level 8, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=11690; -- old 1.8, level 8, hits 99
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=11690; -- old 0.14, level 8, hits 99

-- Blackwood Tracker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=11713; -- old 1, level 15, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.95 WHERE `entry`=11713; -- old 1.4, level 15, hits 52

-- Marosh the Devious
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=11714; -- old 1.75, level 16, hits 7

-- Hive'Ashi Sandstalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.15 WHERE `entry`=11723; -- old 3.5, level 59, hits 39

-- Hive'Zora Reaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=11728; -- old 5.45, level 59, hits 20

-- Hive'Zora Hive Sister
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=11729; -- old 5.45, level 60, hits 35

-- Hive'Regal Ambusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.25 WHERE `entry`=11730; -- old 5.2, level 60, hits 31

-- Hive'Regal Spitfire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=11732; -- old 5.3, level 59, hits 11

-- Hive'Regal Slavemaker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=11733; -- old 5.3, level 59, hits 9

-- Dust Stormer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11744; -- old 0.65, level 56, hits 194

-- Desert Rumbler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11746; -- old 0.8, level 56, hits 77

-- Samantha Swifthoof
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11748; -- old 1.1, level 40, hits 6

-- Meggi Peppinrocker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11754; -- old 2.15, level 60, hits 3

-- Shadowshard Rumbler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=11777; -- old 3.85, level 40, hits 79

-- Shadowshard Smasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=11778; -- old 3.65, level 42, hits 40

-- Ambershard Crusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=11781; -- old 3.85, level 41, hits 24

-- Ambershard Destroyer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=11782; -- old 3.4, level 43, hits 44

-- Putridus Satyr
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=11790; -- old 3.7, level 44, hits 84

-- Putridus Trickster
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=11791; -- old 3.5, level 44, hits 117

-- Putridus Shadowstalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11792; -- old 0.9, level 42, hits 49
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=11792; -- old 3.7, level 44, hits 26

-- Celebrian Dryad
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=11793; -- old 3.7, level 46, hits 59

-- Sister of Celebrian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.65 WHERE `entry`=11794; -- old 3.35, level 47, hits 32

-- Mylentha Riverbend
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11795; -- old 1.7, level 60, hits 3

-- Bessany Plainswind
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.05 WHERE `entry`=11796; -- old 1.7, level 60, hits 5

-- Moren Riverbend
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11797; -- old 1.7, level 60, hits 3

-- Bunthen Plainswind
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11798; -- old 1.7, level 60, hits 8

-- Silva Fil'naveth
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11800; -- old 3.85, level 60, hits 14

-- Twilight Keeper Exeter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11803; -- old 1.1, level 60, hits 11

-- Kerr Ironsight
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11813; -- old 1.05, level 41, hits 9

-- Hakkari Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11830; -- old 1.1, level 60, hits 809

-- Hakkari Witch Doctor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11831; -- old 1.1, level 60, hits 335

-- Keeper Remulos
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11832; -- old 1.4, level 62, hits 24
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=11832; -- old 2.25, level 62, hits 49

-- Rahauro
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11833; -- old 0.85, level 20, hits 6

-- Wildpaw Shaman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11837; -- old 1.75, level 54, hits 129

-- Wildpaw Mystic
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11838; -- old 1.15, level 57, hits 25
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11838; -- old 1.7, level 57, hits 10

-- Wildpaw Brute
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.75 WHERE `entry`=11839; -- old 1, level 56, hits 19
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=11839; -- old 1.6, level 56, hits 49

-- Wildpaw Alpha
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11840; -- old 1.5, level 59, hits 9

-- Kaya Flathoof
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=11856; -- old 1, level 15, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11856; -- old 0.8, level 15, hits 30
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=11856; -- old 0.14, level 15, hits 30

-- Spectral Attendant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11873; -- old 1.1, level 60, hits 2

-- Nathanos Blightcaller
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=11878; -- old 3.95, level 62, hits 10

-- Mercutio Filthgorger
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=11886; -- old 1.45, level 57, hits 63

-- Grimtotem Sorcerer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.85 WHERE `entry`=11913; -- old 1, level 15, hits 38
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11913; -- old 1.2, level 15, hits 15

-- Gogger Geomancer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=11917; -- old 1, level 17, hits 18
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11917; -- old 1.3, level 17, hits 14

-- Gogger Stonepounder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.5 WHERE `entry`=11918; -- old 1, level 17, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.6 WHERE `entry`=11918; -- old 0.95, level 17, hits 14

-- Umber
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11939; -- old 1.4, level 55, hits 9

-- Drek'Thar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11946; -- old 1.4, level 62, hits 20

-- Captain Galvangar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11947; -- old 1.15, level 61, hits 16
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=11947; -- old 7.25, level 61, hits 32

-- Vanndar Stormpike
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.7 WHERE `entry`=11948; -- old 1.4, level 62, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=11948; -- old 16.35, level 62, hits 23

-- Captain Balinda Stonehearth
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11949; -- old 0.75, level 61, hits 154
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=11949; -- old 3.9, level 61, hits 71

-- Flamegor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11981; -- old 1.3, level 63, hits 1

-- Magmadar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11982; -- old 1.3, level 63, hits 1

-- Firemaw
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11983; -- old 1.3, level 63, hits 5

-- Golemagg the Incinerator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11988; -- old 1.3, level 63, hits 1

-- Broodlord Lashlayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12017; -- old 1.3, level 63, hits 3

-- Stormpike Mountaineer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=17 WHERE `entry`=12047; -- old 0.7, level 55, hits 2350
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=12047; -- old 1.65, level 55, hits 4414

-- Alliance Sentinel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12048; -- old 0.7, level 55, hits 871
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=12048; -- old 1.65, level 55, hits 2645

-- Stormpike Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.35 WHERE `entry`=12050; -- old 0.65, level 58, hits 722
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=12050; -- old 1.95, level 58, hits 6112

-- Frostwolf Legionnaire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=12051; -- old 2.85, level 57, hits 1829

-- Frostwolf Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12052; -- old 0.7, level 55, hits 722
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=12052; -- old 1.65, level 55, hits 2058

-- Frostwolf Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.35 WHERE `entry`=12053; -- old 0.65, level 58, hits 673
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=12053; -- old 1.95, level 58, hits 3989

-- Baron Geddon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12056; -- old 1.3, level 63, hits 2

-- Garr
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12057; -- old 1.3, level 63, hits 8

-- Lava Elemental
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12076; -- old 1.2, level 61, hits 155

-- Stormpike Quartermaster
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12096; -- old 1.65, level 55, hits 121

-- Sulfuron Harbinger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=12098; -- old 1.6, level 63, hits 7

-- Lava Reaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12100; -- old 1.3, level 62, hits 46

-- Lava Surger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12101; -- old 1.2, level 61, hits 68

-- Lucifron
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12118; -- old 1.3, level 63, hits 4

-- Flamewaker Protector
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12119; -- old 1.25, level 62, hits 67

-- Draka
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=12121; -- old 5.45, level 60, hits 166

-- Duros
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=12122; -- old 5.45, level 60, hits 172

-- Lord Tirion Fordring
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=4 WHERE `entry`=12126; -- old 1.65, level 63, hits 29
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=12.25 WHERE `entry`=12126; -- old 44.15, level 63, hits 375

-- Stormpike Guardsman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12127; -- old 0.65, level 57, hits 1559

-- Onyxian Warder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12129; -- old 1.3, level 62, hits 14

-- Son of Flame
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=12143; -- old 7, level 60, hits 182

-- Tortured Druid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12178; -- old 1.2, level 55, hits 86

-- Princess Theradras
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=12201; -- old 3.95, level 51, hits 320

-- Landslide
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=12203; -- old 3.4, level 50, hits 53

-- Primordial Behemoth
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.25 WHERE `entry`=12206; -- old 3.25, level 49, hits 264

-- Thessala Hydra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=12207; -- old 3.05, level 46, hits 116

-- Conquered Soul of the Blightcaller
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=12208; -- old 1.5, level 58, hits 233

-- Vile Larva
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12218; -- old 0.9, level 45, hits 113

-- Barbed Lasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=12219; -- old 3, level 44, hits 276

-- Constrictor Vine
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=12220; -- old 3.05, level 46, hits 688

-- Noxious Slime
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12221; -- old 0.9, level 47, hits 132
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=12221; -- old 3.35, level 47, hits 114

-- Creeping Sludge
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=12222; -- old 3.45, level 46, hits 67

-- Celebras the Cursed
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.6 WHERE `entry`=12225; -- old 3.65, level 49, hits 10

-- Lord Vyletongue
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=12236; -- old 3.35, level 47, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=12236; -- old 0.14, level 47, hits 23

-- Spirit of Kolk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=12240; -- old 3.2, level 43, hits 5

-- Spirit of Magra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.15 WHERE `entry`=12241; -- old 3.2, level 43, hits 3

-- Infiltrator Hameya
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12248; -- old 1.1, level 60, hits 25

-- Mechanical Yeti
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=12257; -- old 0.1, level 58, hits 40

-- Razorlash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=12258; -- old 3.4, level 48, hits 38

-- Gehennas
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12259; -- old 1.3, level 63, hits 4

-- Infected Mossflayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12261; -- old 1.5, level 58, hits 50

-- Ziggurat Protector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=12262; -- old 3.5, level 58, hits 35

-- Shazzrah
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12264; -- old 1.3, level 63, hits 4

-- Lava Spawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.75 WHERE `entry`=12265; -- old 4.8, level 60, hits 579

-- Melizza Brimbuzzle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12277; -- old 0.75, level 39, hits 3

-- Burning Blade Crusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12320; -- old 1.55, level 13, hits 7

-- Stormscale Toxicologist
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12321; -- old 1.5, level 15, hits 4

-- Quel'Lithien Protector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=12322; -- old 1.8, level 60, hits 25

-- Demetria
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.4 WHERE `entry`=12339; -- old 10.7, level 61, hits 4

-- Scarlet Trooper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12352; -- old 1.55, level 58, hits 8

-- Lord Kragaru
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12369; -- old 1.55, level 38, hits 37

-- Unliving Caretaker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12379; -- old 1.6, level 60, hits 10

-- Unliving Resident
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=12380; -- old 1.6, level 60, hits 73

-- Doomguard Commander
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12396; -- old 1.15, level 61, hits 1

-- Lord Kazzak
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18 WHERE `entry`=12397; -- old 21.3, level 63, hits 22

-- Blackwing Legionnaire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=12416; -- old 9.7, level 60, hits 2961

-- Blackwing Mage
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=12420; -- old 9.55, level 60, hits 1101

-- Death Talon Dragonspawn
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12422; -- old 1.2, level 60, hits 1679
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14 WHERE `entry`=12422; -- old 24.45, level 60, hits 2319

-- Razorgore the Untamed
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12435; -- old 1.3, level 63, hits 916

-- Blackwing Spellbinder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12457; -- old 1.25, level 62, hits 409

-- Blackwing Taskmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12458; -- old 1.25, level 62, hits 230

-- Blackwing Warlock
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12459; -- old 1.15, level 61, hits 239

-- Death Talon Wyrmguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12460; -- old 1.3, level 63, hits 12

-- Death Talon Overseer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12461; -- old 1.2, level 62, hits 45

-- Death Talon Flamescale
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12463; -- old 1.2, level 62, hits 24

-- Death Talon Seether
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12464; -- old 1.2, level 62, hits 8

-- Death Talon Wyrmkin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12465; -- old 1.15, level 61, hits 45

-- Death Talon Captain
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12467; -- old 1.2, level 62, hits 17

-- Death Talon Hatcher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12468; -- old 1.15, level 61, hits 66

-- Emeraldon Boughguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12474; -- old 1.2, level 62, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12474; -- old 5.25, level 62, hits 8

-- Emeraldon Tree Warder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12475; -- old 5.2, level 60, hits 32

-- Emeraldon Oracle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12476; -- old 1.15, level 61, hits 10
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12476; -- old 5.45, level 61, hits 14

-- Verdantine Boughguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.8 WHERE `entry`=12477; -- old 1.2, level 62, hits 42
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12477; -- old 5.1, level 62, hits 72

-- Verdantine Oracle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12478; -- old 1.45, level 61, hits 110
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14.6 WHERE `entry`=12478; -- old 5.75, level 61, hits 35
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=12478; -- old 0.14, level 61, hits 35

-- Verdantine Tree Warder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=12479; -- old 1.1, level 60, hits 21
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12479; -- old 5.45, level 60, hits 53

-- Melris Malagan
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=12480; -- old 3.3, level 58, hits 638

-- Justine Demalier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=12481; -- old 1.05, level 57, hits 736

-- Dreamtracker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12496; -- old 5.35, level 62, hits 3

-- Dreamstalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=12498; -- old 7.45, level 62, hits 21

-- Grethok the Controller
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12557; -- old 1.25, level 62, hits 8

-- Georgia
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12636; -- old 1.4, level 55, hits 2

-- Ursangous
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=12678; -- old 1, level 25, hits 13

-- Onyxia's Elite Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=12739; -- old 4.9, level 60, hits 1438

-- Tideress
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=12759; -- old 0.75, level 27, hits 38
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.04 WHERE `entry`=12759; -- old 0.14, level 27, hits 38

-- Ruul Snowhoof
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12818; -- old 1.5, level 26, hits 213

-- Wandering Protector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=12836; -- old 3.95, level 35, hits 47

-- Splintertree Raider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12859; -- old 0.8, level 22, hits 187

-- Duriel Moonfire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12860; -- old 1.75, level 24, hits 39
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=12860; -- old 0.14, level 24, hits 39

-- Baron Aquanis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=12876; -- old 2.3, level 28, hits 6

-- Axtroz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=12899; -- old 3.65, level 62, hits 10

-- Somnus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12900; -- old 1.2, level 62, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.2 WHERE `entry`=12900; -- old 5.25, level 62, hits 16

-- Chief Murgut
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=12918; -- old 1.65, level 26, hits 3

-- Enraged Foulweald
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=12921; -- old 1, level 23, hits 32
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12921; -- old 1.35, level 23, hits 48

-- Imp Minion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.6 WHERE `entry`=12922; -- old 0, level 54, hits 60

-- Vorsha the Lasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=12940; -- old 1.55, level 22, hits 39
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=12940; -- old 0.14, level 22, hits 39

-- Kolkar Waylayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12976; -- old 1.9, level 34, hits 38

-- Kolkar Ambusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12977; -- old 1.8, level 34, hits 145

-- Deeprun Rat
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=13016; -- old 1.3, level 1, hits 9

-- Vaelastrasz the Corrupt
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13020; -- old 1.3, level 63, hits 6

-- Warpwood Crusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=13021; -- old 12.75, level 56, hits 68

-- Umi Thorson
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13078; -- old 1, level 58, hits 254
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13078; -- old 3.6, level 58, hits 155

-- Keetar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13079; -- old 3.4, level 58, hits 19

-- Irondeep Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13080; -- old 1.05, level 55, hits 1845
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13080; -- old 3.65, level 55, hits 1471

-- Irondeep Raider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13081; -- old 0.85, level 55, hits 172
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13081; -- old 3.55, level 55, hits 233

-- Aggi Rumblestomp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=13086; -- old 0.8, level 58, hits 7
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13086; -- old 3.35, level 58, hits 11

-- Coldmine Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13087; -- old 0.75, level 55, hits 48
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13087; -- old 3.65, level 55, hits 76

-- Coldmine Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.55 WHERE `entry`=13089; -- old 3.75, level 54, hits 23

-- Coldmine Explorer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13096; -- old 1.05, level 55, hits 28
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13096; -- old 3.8, level 55, hits 36

-- Coldmine Surveyor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13097; -- old 1.25, level 54, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13097; -- old 4, level 54, hits 9

-- Irondeep Surveyor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13098; -- old 0.95, level 54, hits 1399
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13098; -- old 3.6, level 54, hits 673

-- Irondeep Explorer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.4 WHERE `entry`=13099; -- old 4, level 54, hits 103

-- Hive'Ashi Drone
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=13136; -- old 1.55, level 57, hits 119

-- Lieutenant Rugba
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13137; -- old 12.35, level 59, hits 168

-- Lieutenant Spencer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13138; -- old 1.1, level 59, hits 675
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13138; -- old 12.35, level 59, hits 657

-- Commander Randolph
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13139; -- old 1.4, level 61, hits 338
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13139; -- old 15.2, level 61, hits 575

-- Commander Dardosh
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13140; -- old 1.4, level 61, hits 148
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13140; -- old 15.2, level 61, hits 169

-- Deeprot Stomper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13141; -- old 0.9, level 43, hits 79
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=13141; -- old 3.7, level 43, hits 111

-- Deeprot Tangler
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=13142; -- old 3.5, level 44, hits 83

-- Lieutenant Stronghoof
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13143; -- old 12.35, level 59, hits 133

-- Lieutenant Vol'talar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13144; -- old 1.1, level 59, hits 307
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13144; -- old 12.35, level 59, hits 182

-- Lieutenant Grummus
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13145; -- old 12.35, level 59, hits 180

-- Lieutenant Murp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13146; -- old 1.1, level 59, hits 220
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13146; -- old 12.35, level 59, hits 141

-- Lieutenant Lewis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13147; -- old 1.1, level 59, hits 370
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13147; -- old 12.35, level 59, hits 167

-- Commander Malgor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13152; -- old 1.4, level 61, hits 120
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13152; -- old 15.2, level 61, hits 95

-- Commander Mulfort
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13153; -- old 1.4, level 61, hits 159
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13153; -- old 15.2, level 61, hits 106

-- Commander Louis Philips
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13154; -- old 1.4, level 61, hits 217
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13154; -- old 15.2, level 61, hits 174

-- Makasgar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13157; -- old 1.05, level 12, hits 17

-- Carrion Swarmer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13160; -- old 1.35, level 57, hits 50

-- Smith Regzar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13176; -- old 1.1, level 60, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13176; -- old 5.45, level 60, hits 80

-- Vahgruk
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13177; -- old 0.35, level 55, hits 5

-- Wing Commander Guse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=13179; -- old 3.5, level 59, hits 519

-- Wing Commander Jeztor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=13180; -- old 3.35, level 58, hits 762

-- Wing Commander Mulverick
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=13181; -- old 5, level 60, hits 858

-- Phase Lasher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=13196; -- old 3.35, level 55, hits 43

-- Fel Lash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=13197; -- old 3.5, level 56, hits 25

-- Gaelden Hammersmith
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13216; -- old 0.8, level 58, hits 165
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13216; -- old 3.35, level 58, hits 202

-- Grunnda Wolfheart
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13218; -- old 3.35, level 58, hits 114

-- Primalist Thurloga
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13236; -- old 1.35, level 60, hits 37
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13236; -- old 5.85, level 60, hits 27

-- Murgot Deepforge
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13257; -- old 1.1, level 60, hits 515
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13257; -- old 5.45, level 60, hits 1264

-- Discordant Surge
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13279; -- old 1.5, level 56, hits 2

-- Hydrospawn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.6 WHERE `entry`=13280; -- old 2.45, level 57, hits 20

-- Noxxion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=13282; -- old 2.2, level 48, hits 23

-- Frostwolf Shaman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13284; -- old 1.25, level 58, hits 279

-- Death Lash
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=13285; -- old 3.5, level 57, hits 39

-- Lieutenant Largent
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13296; -- old 1.1, level 59, hits 476
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13296; -- old 12.35, level 59, hits 491

-- Lieutenant Stouthandle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13297; -- old 1.1, level 59, hits 666
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13297; -- old 12.35, level 59, hits 621

-- Lieutenant Greywand
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13298; -- old 1.1, level 59, hits 566
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13298; -- old 12.35, level 59, hits 437

-- Lieutenant Lonadin
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13299; -- old 1.1, level 59, hits 550
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13299; -- old 12.35, level 59, hits 377

-- Lieutenant Mancuso
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13300; -- old 1.1, level 59, hits 439
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13300; -- old 12.35, level 59, hits 372

-- Coldmine Peon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13316; -- old 0.85, level 52, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=13316; -- old 3.9, level 53, hits 90

-- Coldmine Miner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13317; -- old 1.1, level 53, hits 286
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=13317; -- old 3.8, level 53, hits 517

-- Commander Mortimer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13318; -- old 1.4, level 61, hits 392
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13318; -- old 15.2, level 61, hits 1257

-- Commander Duffy
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13319; -- old 1.4, level 61, hits 405
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13319; -- old 15.2, level 61, hits 691

-- Commander Karl Philips
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13320; -- old 1.4, level 61, hits 247
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13320; -- old 15.2, level 61, hits 574

-- Frog
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=13321; -- old 2.55, level 1, hits 30

-- Seasoned Guardsman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13324; -- old 0.75, level 58, hits 321
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=13324; -- old 2.35, level 58, hits 990
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.23 WHERE `entry`=13324; -- old 0.14, level 58, hits 990

-- Seasoned Mountaineer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13325; -- old 0.75, level 56, hits 110
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=13325; -- old 2.35, level 56, hits 193

-- Seasoned Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13326; -- old 0.75, level 59, hits 184
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=13326; -- old 2.5, level 59, hits 1379

-- Seasoned Sentinel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13327; -- old 0.75, level 56, hits 130
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=13327; -- old 2.35, level 56, hits 518

-- Seasoned Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13328; -- old 0.75, level 59, hits 74
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=13328; -- old 2.5, level 59, hits 620

-- Seasoned Legionnaire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=13329; -- old 2.35, level 58, hits 105

-- Seasoned Warrior
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.65 WHERE `entry`=13330; -- old 2.35, level 56, hits 11

-- Veteran Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13331; -- old 0.8, level 60, hits 101

-- Veteran Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13332; -- old 0.8, level 60, hits 97

-- Veteran Guardsman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13333; -- old 0.8, level 59, hits 206

-- Veteran Mountaineer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13335; -- old 0.8, level 57, hits 59

-- Veteran Sentinel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13336; -- old 0.8, level 57, hits 41

-- Veteran Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13337; -- old 0.8, level 57, hits 8

-- Stormpike Bowman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13358; -- old 0.2, level 59, hits 758

-- Frostwolf Bowman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13359; -- old 0.2, level 59, hits 369

-- Irondeep Miner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13396; -- old 0.85, level 53, hits 6292
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=13396; -- old 3.9, level 53, hits 8138

-- Irondeep Peon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13397; -- old 1.7, level 53, hits 925
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=13397; -- old 15.3, level 53, hits 1697

-- Champion Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13421; -- old 0.85, level 61, hits 49
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13421; -- old 3.9, level 61, hits 228

-- Champion Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13422; -- old 0.85, level 61, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=13422; -- old 4, level 61, hits 285

-- Champion Guardsman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13424; -- old 0.85, level 60, hits 56
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13424; -- old 5.7, level 60, hits 151

-- Champion Legionnaire
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13425; -- old 5.7, level 60, hits 69

-- Champion Mountaineer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13426; -- old 0.85, level 58, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=13426; -- old 5.7, level 58, hits 5

-- Champion Sentinel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13427; -- old 0.85, level 58, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.85 WHERE `entry`=13427; -- old 5.7, level 58, hits 10

-- Champion Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13428; -- old 0.85, level 58, hits 40
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=13428; -- old 5.7, level 58, hits 115

-- Wing Commander Slidore
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13438; -- old 3.6, level 58, hits 421

-- Wing Commander Vipore
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=13439; -- old 3.35, level 59, hits 119

-- Arch Druid Renferal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13442; -- old 1.35, level 60, hits 165
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13442; -- old 5.4, level 60, hits 282

-- Druid of the Grove
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13443; -- old 1.35, level 60, hits 366
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=13443; -- old 5.7, level 60, hits 812

-- Corporal Noreg Stormpike
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13447; -- old 1, level 59, hits 146
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13447; -- old 3.6, level 58, hits 445

-- Sergeant Yazra Bloodsnarl
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13448; -- old 1.6, level 57, hits 120

-- Veteran Coldmine Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=13535; -- old 3.2, level 58, hits 3

-- Veteran Coldmine Surveyor
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13538; -- old 1.2, level 59, hits 6
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13538; -- old 3.45, level 59, hits 3

-- Seasoned Irondeep Explorer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13540; -- old 3.65, level 56, hits 23

-- Veteran Irondeep Explorer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13541; -- old 3.3, level 58, hits 47

-- Champion Irondeep Explorer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13542; -- old 1.35, level 60, hits 61
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13542; -- old 5.15, level 60, hits 51

-- Seasoned Irondeep Raider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13543; -- old 3.6, level 56, hits 31

-- Veteran Irondeep Raider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13544; -- old 3.35, level 59, hits 173

-- Champion Irondeep Raider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13545; -- old 1.1, level 60, hits 71
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13545; -- old 4.55, level 60, hits 117

-- Seasoned Coldmine Explorer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13546; -- old 0.9, level 57, hits 52
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13546; -- old 3.85, level 57, hits 34

-- Veteran Coldmine Explorer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13547; -- old 3.65, level 59, hits 17

-- Seasoned Coldmine Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13549; -- old 0.75, level 57, hits 48
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13549; -- old 3.7, level 57, hits 59

-- Veteran Coldmine Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13550; -- old 1, level 58, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13550; -- old 3.45, level 58, hits 63

-- Champion Coldmine Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13551; -- old 1.1, level 60, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13551; -- old 5, level 60, hits 10

-- Seasoned Irondeep Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13552; -- old 1, level 56, hits 444
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13552; -- old 4.55, level 56, hits 405

-- Veteran Irondeep Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13553; -- old 1, level 58, hits 198
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13553; -- old 4.75, level 58, hits 174

-- Champion Irondeep Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.25 WHERE `entry`=13554; -- old 1.1, level 60, hits 140
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13554; -- old 4.8, level 60, hits 125

-- Seasoned Irondeep Surveyor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=13555; -- old 3.25, level 56, hits 171

-- Veteran Irondeep Surveyor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=13556; -- old 2.35, level 59, hits 58

-- Champion Irondeep Surveyor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=13557; -- old 5.35, level 60, hits 62
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=13557; -- old 0.14, level 60, hits 62

-- Stormpike Ram Rider Commander
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13577; -- old 5.45, level 60, hits 182

-- Rotgrip
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.8 WHERE `entry`=13596; -- old 3.4, level 50, hits 82

-- Tinkerer Gizlock
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=13601; -- old 3.4, level 50, hits 22

-- Stormpike Stable Master
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13617; -- old 1.1, level 60, hits 709
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=13617; -- old 5.3, level 60, hits 864

-- Noxxious Scion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13696; -- old 2.1, level 46, hits 75

-- The Nameless Prophet
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=13718; -- old 4.85, level 41, hits 85

-- Veng
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=13738; -- old 3.35, level 47, hits 8

-- Maraudos
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=13739; -- old 3.35, level 46, hits 9

-- Magra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=13740; -- old 4, level 43, hits 8

-- Gelk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=13741; -- old 4.25, level 42, hits 10

-- Kolk
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=13742; -- old 4, level 43, hits 46

-- Corrupt Force of Nature
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13743; -- old 0.9, level 44, hits 36
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13743; -- old 0.9, level 44, hits 109

-- Mountaineer Boombellow
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=13797; -- old 3.65, level 61, hits 560

-- Jotek
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=13798; -- old 5.45, level 60, hits 157

-- Prospector Stonehewer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13816; -- old 1.2, level 61, hits 56
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13816; -- old 1.6, level 61, hits 129

-- Royal Dreadguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=13839; -- old 1.2, level 60, hits 7292
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=13839; -- old 5, level 60, hits 2325

-- Frostwolf Ambassador Rokhstrom
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13842; -- old 1.6, level 60, hits 8

-- Lieutenant Rotimer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13843; -- old 3.2, level 60, hits 4

-- Alterac Yeti
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.9 WHERE `entry`=13959; -- old 5.1, level 61, hits 18

-- Chromaggus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14020; -- old 1.3, level 63, hits 2

-- Enraged Felguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=14101; -- old 1.1, level 60, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=17.15 WHERE `entry`=14101; -- old 15, level 60, hits 12

-- Najak Hexxen
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14185; -- old 1.6, level 59, hits 92

-- Ravak Grimtotem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14186; -- old 0.9, level 60, hits 18
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14186; -- old 2.2, level 60, hits 112

-- Athramanis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14187; -- old 0.9, level 60, hits 80
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14187; -- old 2.3, level 60, hits 497

-- Dirk Swindle
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14188; -- old 1.6, level 59, hits 511

-- Drogoth the Roamer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14231; -- old 3.55, level 37, hits 7

-- Lord Angler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=14236; -- old 0.95, level 44, hits 19
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=14236; -- old 3.55, level 44, hits 16

-- Blue Drakonid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14261; -- old 1.1, level 60, hits 271

-- Red Drakonid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14264; -- old 1.1, level 60, hits 147

-- Emogg the Crusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=14267; -- old 4, level 19, hits 11

-- Seeker Aqualon
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14269; -- old 2.2, level 21, hits 25

-- Boulderheart
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14273; -- old 3.1, level 25, hits 49

-- Scargil
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=14276; -- old 1, level 30, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14276; -- old 3.25, level 30, hits 13

-- Frostwolf Bloodhound
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14282; -- old 1.7, level 54, hits 512

-- Stormpike Owl
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14283; -- old 0, level 53, hits 57
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14283; -- old 1.7, level 53, hits 1157

-- Frostwolf Battleguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.35 WHERE `entry`=14285; -- old 1, level 61, hits 38
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.1 WHERE `entry`=14285; -- old 7.4, level 61, hits 71

-- Brinna Valanaar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14301; -- old 0.85, level 45, hits 9

-- Chromatic Drakonid
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14302; -- old 5, level 60, hits 346

-- Petrified Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=14303; -- old 3.5, level 58, hits 10

-- Ferra
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14308; -- old 5.3, level 60, hits 33

-- Guard Slip'kik
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.1 WHERE `entry`=14323; -- old 3.45, level 59, hits 19

-- Cho'Rush the Observer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=14324; -- old 5.7, level 60, hits 12

-- Captain Kromcrush
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14325; -- old 1.15, level 61, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.1 WHERE `entry`=14325; -- old 3.65, level 61, hits 10

-- Guard Mol'dar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=14326; -- old 3.45, level 59, hits 21

-- Alshirr Banebreath
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14340; -- old 3.55, level 54, hits 10

-- Ragepaw
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14342; -- old 3.4, level 51, hits 23

-- The Ongar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14345; -- old 0, level 51, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14345; -- old 3.3, level 51, hits 24

-- Hydroling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.2 WHERE `entry`=14350; -- old 0.15, level 57, hits 13

-- Pusillin
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14354; -- old 6.2, level 57, hits 20
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=14354; -- old 0.14, level 57, hits 20

-- Thief Catcher Farmountain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=14365; -- old 5, level 60, hits 3

-- Cadaverous Worm
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=14370; -- old 0.95, level 60, hits 76

-- Winterfall Ambusher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=14372; -- old 1.45, level 56, hits 11

-- Scout Stronghand
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14375; -- old 5, level 60, hits 4

-- Scout Manslayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14376; -- old 5, level 60, hits 6

-- Scout Tharr
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14377; -- old 5, level 60, hits 4

-- Doomguard Minion
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=14385; -- old 2.4, level 60, hits 55

-- Netherwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14389; -- old 4.9, level 60, hits 12

-- Expeditionary Mountaineer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=14390; -- old 3.05, level 40, hits 95

-- Expeditionary Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14393; -- old 1.55, level 41, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=14393; -- old 0.85, level 41, hits 8

-- Eye of Immol'thar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=14396; -- old 5.15, level 61, hits 18

-- Arcane Torrent
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14399; -- old 3.55, level 60, hits 9

-- Arcane Feedback
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14400; -- old 0.55, level 60, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14400; -- old 1.5, level 59, hits 42

-- Seeker Cromwell
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14402; -- old 1.1, level 60, hits 1381
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14402; -- old 5, level 60, hits 546

-- Seeker Nahr
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14403; -- old 5, level 60, hits 636

-- Seeker Thompson
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14404; -- old 5, level 60, hits 907

-- Officer Jaxon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14423; -- old 1.1, level 60, hits 592
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14423; -- old 5, level 60, hits 202

-- Officer Pomeroy
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14438; -- old 1.1, level 60, hits 94
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14438; -- old 5, level 60, hits 34

-- Officer Brady
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14439; -- old 1.1, level 60, hits 229
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14439; -- old 5, level 60, hits 80

-- Lord Captain Wyrmak
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.55 WHERE `entry`=14445; -- old 3.5, level 45, hits 3

-- Gilmorian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14447; -- old 3.35, level 43, hits 19

-- Molt Thorn
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.25 WHERE `entry`=14448; -- old 3.6, level 42, hits 6

-- The Windreaver
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14454; -- old 3.4, level 60, hits 3

-- Whirling Invader
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14455; -- old 1.5, level 57, hits 137

-- Blackwing Guardsman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14456; -- old 1.15, level 61, hits 130

-- Princess Tempestria
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14457; -- old 1.1, level 60, hits 4

-- Watery Invader
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14458; -- old 1.5, level 58, hits 14

-- Thundering Invader
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.4 WHERE `entry`=14462; -- old 0.8, level 56, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14462; -- old 2.3, level 55, hits 22

-- Kroshius
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14467; -- old 3.25, level 55, hits 18

-- Setis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.65 WHERE `entry`=14471; -- old 5.15, level 61, hits 5

-- Gretheer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14472; -- old 3.4, level 57, hits 17

-- Dread Guard
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=14483; -- old 4.9, level 60, hits 147

-- Injured Peasant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14484; -- old 0.85, level 52, hits 8

-- Plagued Peasant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14485; -- old 0.5, level 52, hits 2

-- Scourge Footsoldier
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=14486; -- old 0.55, level 59, hits 42

-- Verifonix
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14492; -- old 3.5, level 42, hits 14

-- Xorothian Dreadsteed
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14502; -- old 1.2, level 62, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14502; -- old 5.3, level 62, hits 10

-- Lord Hel'nurath
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14506; -- old 1.5, level 62, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.7 WHERE `entry`=14506; -- old 5.9, level 62, hits 11

-- High Priest Venoxis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14507; -- old 1.3, level 63, hits 6

-- High Priestess Mar'li
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14510; -- old 1.3, level 63, hits 9

-- Shadowed Spirit
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14511; -- old 1.35, level 60, hits 34
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.1 WHERE `entry`=14511; -- old 5.4, level 60, hits 17

-- Corrupted Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14512; -- old 4.9, level 60, hits 30

-- Malicious Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14513; -- old 4.9, level 59, hits 28

-- Banal Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14514; -- old 2.2, level 60, hits 60

-- High Priestess Arlokk
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14515; -- old 1.3, level 63, hits 27

-- Aspect of Banality
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14518; -- old 1.35, level 60, hits 5

-- Aspect of Corruption
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.3 WHERE `entry`=14519; -- old 5.45, level 60, hits 8

-- Aspect of Malice
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=14520; -- old 5.45, level 60, hits 9

-- Razzashi Venombrood
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14532; -- old 1.1, level 60, hits 592
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=14532; -- old 10, level 60, hits 1172

-- Precious the Devourer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14538; -- old 1.1, level 60, hits 1

-- Ebonroc
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14601; -- old 1.3, level 63, hits 6

-- Zapped Shore Strider
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=14603; -- old 1.35, level 49, hits 67

-- Bone Construct
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=14605; -- old 3.4, level 60, hits 1680

-- Zapped Deep Strider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14639; -- old 1.25, level 49, hits 45
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=14639; -- old 1.5, level 49, hits 41

-- Zapped Cliff Giant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=14640; -- old 1.45, level 50, hits 71

-- Stinglasher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14661; -- old 1.25, level 47, hits 31

-- Corrupted Fire Nova Totem V
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14662; -- old 0, level 52, hits 69

-- Corrupted Healing Stream Totem V
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14664; -- old 0, level 60, hits 8

-- Corrupted Windfury Totem III
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14666; -- old 0, level 60, hits 138

-- Corrupted Infernal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=14668; -- old 2.35, level 60, hits 147

-- Sever
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=14682; -- old 5.6, level 25, hits 87
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14682; -- old 0.14, level 25, hits 87

-- Lady Falther'ess
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14686; -- old 0.14, level 40, hits 103

-- Scorn
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.06 WHERE `entry`=14693; -- old 0.14, level 34, hits 84

-- Lord Blackwood
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14695; -- old 0.14, level 60, hits 61

-- Lumbering Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14697; -- old 1.15, level 61, hits 72

-- Silverwing Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=14715; -- old 3.25, level 55, hits 16

-- Horde Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=14717; -- old 3.25, level 55, hits 8

-- Horde Laborer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14718; -- old 0.9, level 27, hits 3

-- High Overlord Saurfang
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14720; -- old 1.2, level 62, hits 700
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14720; -- old 5.9, level 62, hits 124

-- Vilebranch Kidnapper
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14748; -- old 1.4, level 49, hits 265

-- Gurubashi Bat Rider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14750; -- old 1.15, level 61, hits 372

-- Dun Baldar North Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14762; -- old 1.4, level 60, hits 49

-- Dun Baldar South Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14763; -- old 1.4, level 60, hits 12

-- Icewing Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14764; -- old 1.4, level 60, hits 18

-- Stonehearth Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14765; -- old 1.4, level 60, hits 9
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14765; -- old 13.5, level 60, hits 20

-- Iceblood Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14766; -- old 1.4, level 60, hits 42
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14766; -- old 13.5, level 60, hits 37

-- Tower Point Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14767; -- old 1.4, level 60, hits 39

-- East Frostwolf Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14768; -- old 1.4, level 60, hits 77

-- West Frostwolf Marshal
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14769; -- old 1.4, level 60, hits 32
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14769; -- old 13.5, level 60, hits 28

-- Dun Baldar North Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14770; -- old 1.4, level 60, hits 1

-- Dun Baldar South Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14771; -- old 1.4, level 60, hits 21
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14771; -- old 13.5, level 60, hits 7

-- East Frostwolf Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14772; -- old 1.4, level 60, hits 41
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14772; -- old 13.5, level 60, hits 26

-- Iceblood Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14773; -- old 1.4, level 60, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14773; -- old 13.5, level 60, hits 14

-- Icewing Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14774; -- old 1.4, level 60, hits 15

-- Stonehearth Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14775; -- old 1.4, level 60, hits 40

-- Tower Point Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14776; -- old 1.4, level 60, hits 13

-- West Frostwolf Warmaster
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14777; -- old 1.4, level 60, hits 38
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=14777; -- old 13.5, level 60, hits 20

-- Withered Mistress
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14825; -- old 1.1, level 60, hits 1172
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=14825; -- old 11.7, level 60, hits 1540

-- Sacrificed Troll
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14826; -- old 1.5, level 60, hits 1007

-- Hakkar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14834; -- old 1.3, level 63, hits 136

-- Blood Steward of Kirtonos
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14861; -- old 1.15, level 61, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.65 WHERE `entry`=14861; -- old 3.9, level 61, hits 6

-- Razzashi Skitterer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=14880; -- old 4.15, level 58, hits 1207

-- Atal'ai Mistress
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=14882; -- old 9.6, level 60, hits 1798

-- Voodoo Slave
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=14883; -- old 10.3, level 60, hits 151

-- Parasitic Serpent
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=14884; -- old 595.15, level 1, hits 3

-- Emeriss
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14889; -- old 1.3, level 63, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20 WHERE `entry`=14889; -- old 10.3, level 63, hits 14

-- Taerar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14890; -- old 1.3, level 63, hits 56
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20 WHERE `entry`=14890; -- old 12.65, level 63, hits 10

-- Peon
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.9 WHERE `entry`=14901; -- old 1.15, level 4, hits 9

-- Frenzied Bloodseeker Bat
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=14965; -- old 5.45, level 60, hits 399

-- Field Marshal Oslight
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14983; -- old 1.6, level 62, hits 13

-- Shade of Jin'do
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14986; -- old 1.1, level 60, hits 141

-- Powerful Healing Ward
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14987; -- old 1.2, level 60, hits 65

-- Voodoo Spirit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=15009; -- old 0.1, level 60, hits 68

-- Jungle Toad
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=15010; -- old 6.65, level 1, hits 49

-- Spawn of Mar'li
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15041; -- old 1.1, level 60, hits 190
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=15041; -- old 4.85, level 60, hits 161

-- Zulian Stalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15067; -- old 1.15, level 61, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.15 WHERE `entry`=15067; -- old 6.2, level 61, hits 8

-- Zulian Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15068; -- old 1.2, level 60, hits 85
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5.65 WHERE `entry`=15068; -- old 3, level 60, hits 265

-- Renataki
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15084; -- old 1.3, level 63, hits 5

-- Booty Bay Elite
-- Damage Multiplier (DIRTY!!!)
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15088; -- old 2.45, level 61, hits 4

-- Zulian Prowler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15101; -- old 1.1, level 60, hits 712
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=15101; -- old 2.25, level 60, hits 2701

-- Warsong Emissary
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15105; -- old 1.55, level 30, hits 10

-- Mad Servant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15111; -- old 1.15, level 61, hits 231
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15111; -- old 7.45, level 61, hits 363

-- Brain Wash Totem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15112; -- old 0, level 60, hits 376

-- Gahz'ranka
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15114; -- old 1.3, level 63, hits 1

-- Rutherford Twing
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10.6 WHERE `entry`=15126; -- old 7.95, level 55, hits 8

-- Defiler Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15128; -- old 4.75, level 55, hits 47

-- League of Arathor Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15130; -- old 4.75, level 55, hits 117

-- Hammerfall Elite
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15136; -- old 1.55, level 55, hits 47

-- Mad Voidwalker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15146; -- old 5, level 60, hits 935

-- Runk Windtamer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15178; -- old 1.4, level 55, hits 17

-- Cenarion Hold Infantry
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15184; -- old 8.6, level 60, hits 624

-- Anachronos
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15192; -- old 3.25, level 63, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=45 WHERE `entry`=15192; -- old 12.25, level 63, hits 7

-- Wickerman Guardian
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14 WHERE `entry`=15195; -- old 2.45, level 60, hits 3

-- Twilight Keeper Mayna
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15200; -- old 1.1, level 60, hits 15

-- Vyral the Vile
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15202; -- old 1.15, level 61, hits 5

-- High Marshal Whirlaxis
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15204; -- old 1.2, level 63, hits 1

-- Baron Kazum
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=24 WHERE `entry`=15205; -- old 15.35, level 63, hits 4

-- The Duke of Shards
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.2 WHERE `entry`=15208; -- old 2.65, level 62, hits 7

-- Crimson Templar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15209; -- old 1.7, level 60, hits 16

-- Hoary Templar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15212; -- old 2.6, level 60, hits 11

-- Mistress Natalia Mar'alith
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15215; -- old 1.4, level 62, hits 2

-- The Duke of Zephyrs
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15220; -- old 1.15, level 62, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=15220; -- old 2.65, level 62, hits 6

-- Vekniss Soldier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15229; -- old 1.15, level 61, hits 105

-- Vekniss Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15230; -- old 1.15, level 61, hits 89

-- Vekniss Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15233; -- old 1.35, level 61, hits 587

-- Vekniss Stinger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15235; -- old 1.2, level 62, hits 46

-- Vekniss Wasp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15236; -- old 1.1, level 60, hits 493

-- Vekniss Hive Crawler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15240; -- old 1.2, level 62, hits 40

-- Qiraji Mindslayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=01 WHERE `entry`=15246; -- old 1.15, level 61, hits 176

-- Qiraji Brainwasher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15247; -- old 1.15, level 61, hits 39

-- Qiraji Lasher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15249; -- old 1.15, level 61, hits 37

-- Qiraji Slayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15250; -- old 1.15, level 61, hits 174
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=15250; -- old 0.14, level 61, hits 1000

-- Qiraji Champion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15252; -- old 1.3, level 63, hits 7

-- Obsidian Eradicator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15262; -- old 1.55, level 60, hits 31
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20.25 WHERE `entry`=15262; -- old 22.5, level 60, hits 160

-- The Prophet Skeram
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15263; -- old 1.3, level 63, hits 252

-- Anubisath Sentinel
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15264; -- old 1.15, level 61, hits 53

-- Emperor Vek'nilash
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15275; -- old 1.3, level 63, hits 87

-- Anubisath Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15277; -- old 1.2, level 62, hits 94

-- Vekniss Drone
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15300; -- old 1.1, level 60, hits 1899

-- Shade of Taerar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=15302; -- old 12.65, level 63, hits 5

-- Earthen Templar
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=15307; -- old 2.6, level 60, hits 8

-- Anubisath Warder
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15311; -- old 1.3, level 63, hits 7

-- Obsidian Nullifier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15312; -- old 1.45, level 61, hits 59

-- Qiraji Scarab
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15316; -- old 1.1, level 60, hits 3242

-- Hive'Zara Drone
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15318; -- old 7.9, level 60, hits 34
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=15318; -- old 0.14, level 60, hits 34

-- Hive'Zara Collector
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15319; -- old 12.3, level 60, hits 32

-- Hive'Zara Soldier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15320; -- old 1.15, level 61, hits 108
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=15320; -- old 20.3, level 61, hits 308

-- Hive'Zara Sandstalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15323; -- old 1.15, level 61, hits 130
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=15323; -- old 6.5, level 61, hits 471

-- Qiraji Gladiator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15324; -- old 1.35, level 61, hits 75

-- Hive'Zara Wasp
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15325; -- old 1.15, level 61, hits 882
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=15325; -- old 12.6, level 61, hits 2129

-- Hive'Zara Stinger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15327; -- old 1.15, level 61, hits 508
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15327; -- old 12.6, level 61, hits 1587

-- Silicate Feeder
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=15333; -- old 5.05, level 55, hits 400

-- Giant Eye Tentacle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15334; -- old 1.35, level 60, hits 180

-- Flesh Hunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15335; -- old 1.2, level 62, hits 65
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=15335; -- old 15.95, level 62, hits 364

-- Hive'Zara Tail Lasher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15336; -- old 1.15, level 61, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=15336; -- old 12.1, level 61, hits 28

-- Obsidian Destroyer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15338; -- old 1.65, level 61, hits 66
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14 WHERE `entry`=15338; -- old 4.95, level 61, hits 387

-- Ossirian the Unscarred
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15339; -- old 1.3, level 63, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=15339; -- old 33.35, level 63, hits 208

-- Moam
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15340; -- old 1.8, level 63, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=17 WHERE `entry`=15340; -- old 10.25, level 63, hits 153

-- General Rajaxx
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15341; -- old 1.3, level 63, hits 34
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18 WHERE `entry`=15341; -- old 15.3, level 63, hits 73

-- Qiraji Swarmguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15343; -- old 1.35, level 61, hits 88
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=15343; -- old 17.65, level 61, hits 202

-- Swarmguard Needler
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15344; -- old 1.2, level 61, hits 1365
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15344; -- old 12.1, level 61, hits 1449

-- Kurinnaxx
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15348; -- old 1.3, level 63, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=16.1 WHERE `entry`=15348; -- old 18.05, level 63, hits 83

-- Anubisath Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15355; -- old 1.3, level 62, hits 63

-- Ayamiss the Hunter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15369; -- old 1.3, level 63, hits 11

-- Buru the Gorger
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15370; -- old 1.3, level 63, hits 12

-- Colonel Zerran
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15385; -- old 1.3, level 63, hits 49
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18.1 WHERE `entry`=15385; -- old 11.65, level 63, hits 40

-- Major Yeggeth
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15386; -- old 1.3, level 63, hits 43
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18.1 WHERE `entry`=15386; -- old 11.65, level 63, hits 78

-- Qiraji Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15387; -- old 1.15, level 61, hits 1599

-- Major Pakkon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15388; -- old 1.3, level 63, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18 WHERE `entry`=15388; -- old 11.65, level 63, hits 35

-- Captain Drenn
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15389; -- old 1.3, level 63, hits 20
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=17.5 WHERE `entry`=15389; -- old 11.65, level 63, hits 39
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=15389; -- old 0.14, level 63, hits 39

-- Captain Xurrem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15390; -- old 1.3, level 63, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18.1 WHERE `entry`=15390; -- old 11.65, level 63, hits 32

-- Captain Qeez
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15391; -- old 1.2, level 63, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18 WHERE `entry`=15391; -- old 11.65, level 63, hits 65

-- Captain Tuubid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15392; -- old 1.3, level 63, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=18.35 WHERE `entry`=15392; -- old 14.9, level 63, hits 42

-- Qiraji Wasp
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=15414; -- old 3.4, level 60, hits 1657

-- Qiraji Drone
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.4 WHERE `entry`=15421; -- old 3.4, level 60, hits 1976

-- Qiraji Tank
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=15422; -- old 3.4, level 60, hits 1831

-- Kaldorei Infantry
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15423; -- old 0.9, level 59, hits 1067
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15423; -- old 0.6, level 59, hits 1930

-- Anubisath Conqueror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15424; -- old 1.15, level 61, hits 655
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=15424; -- old 3.4, level 61, hits 247

-- Captain Blackanvil
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=15440; -- old 3.15, level 60, hits 95

-- Ironforge Brigade Rifleman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15441; -- old 1.2, level 60, hits 44
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=15441; -- old 1.05, level 60, hits 116

-- Ironforge Brigade Footman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15442; -- old 1.05, level 60, hits 425

-- Janela Stouthammer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15443; -- old 1.35, level 60, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15443; -- old 3.5, level 60, hits 102

-- Arcanist Nozzlespring
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15444; -- old 2.15, level 60, hits 16

-- Hive'Zora Abomination
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15449; -- old 1.35, level 60, hits 123
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.5 WHERE `entry`=15449; -- old 9.8, level 60, hits 68

-- Shrieker Scarab
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=15461; -- old 2.9, level 60, hits 291

-- Spitting Scarab
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15462; -- old 1.2, level 60, hits 303
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=15462; -- old 4.15, level 60, hits 333

-- Omen
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15467; -- old 1.3, level 63, hits 70
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=15467; -- old 13.3, level 63, hits 280

-- Lieutenant General Andorov
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=15471; -- old 13, level 61, hits 901

-- Kaldorei Elite
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15473; -- old 0.7, level 60, hits 807
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.75 WHERE `entry`=15473; -- old 12.3, level 60, hits 3114

-- Eranikus, Tyrant of the Dream
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.5 WHERE `entry`=15491; -- old 1.3, level 63, hits 35
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=23 WHERE `entry`=15491; -- old 13, level 63, hits 17

-- Nighthaven Defender
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15495; -- old 1.35, level 61, hits 239
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=15495; -- old 3.6, level 61, hits 575

-- Canal Frenzy
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15505; -- old 1.1, level 60, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=15505; -- old 12.3, level 60, hits 39

-- Princess Huhuran
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15509; -- old 1.3, level 63, hits 6

-- Fankriss the Unyielding
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15510; -- old 1.3, level 63, hits 1

-- Battleguard Sartura
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15516; -- old 1.3, level 63, hits 2

-- Ouro
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15517; -- old 1.3, level 63, hits 4
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=15517; -- old 0.14, level 63, hits 25

-- Hive'Zara Hatchling
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15521; -- old 12.3, level 60, hits 605

-- Anubisath Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15537; -- old 1.15, level 62, hits 313

-- Anubisath Swarmguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15538; -- old 1.15, level 62, hits 163

-- Twilight Marauder Morna
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=15541; -- old 1.7, level 60, hits 23
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.23 WHERE `entry`=15541; -- old 0.14, level 60, hits 23

-- Twilight Marauder
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.21 WHERE `entry`=15542; -- old 0.14, level 58, hits 72
UPDATE `creature_template` SET `damage_variance`=0.22 WHERE `entry`=15542; -- old 0.14, level 59, hits 59

-- Cenarion Outrider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15545; -- old 1.1, level 60, hits 632

-- Hive'Zara Swarmer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15546; -- old 1.1, level 60, hits 6
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=15546; -- old 1.1, level 60, hits 71

-- Doctor Weavil
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15552; -- old 3.8, level 63, hits 1

-- Maws
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15571; -- old 1.3, level 63, hits 1

-- Eye of C'Thun
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15589; -- old 1.3, level 63, hits 7

-- Minion of Weavil
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15591; -- old 13.95, level 60, hits 54

-- Krug Skullsplit
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.5 WHERE `entry`=15612; -- old 4.15, level 60, hits 88

-- Merok Longstride
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15613; -- old 2.75, level 60, hits 91

-- Orgrimmar Legion Grunt
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15616; -- old 1.05, level 60, hits 284

-- Orgrimmar Legion Axe Thrower
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15617; -- old 1.05, level 60, hits 319

-- Hive'Regal Hunter-Killer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15620; -- old 1.35, level 60, hits 67
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.5 WHERE `entry`=15620; -- old 9.8, level 60, hits 15

-- Yauj Brood
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.75 WHERE `entry`=15621; -- old 3.3, level 60, hits 761

-- Vekniss Borer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15622; -- old 1.1, level 60, hits 700
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=15622; -- old 7.05, level 60, hits 2654

-- Twilight Corrupter
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15625; -- old 1.95, level 63, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=21.15 WHERE `entry`=15625; -- old 16.1, level 63, hits 16

-- Nightmare Phantasm
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15629; -- old 1.2, level 62, hits 518
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9.1 WHERE `entry`=15629; -- old 3.4, level 62, hits 209

-- Spawn of Fankriss
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15630; -- old 1.3, level 63, hits 35

-- Priestess of the Moon
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15634; -- old 1.35, level 60, hits 6004
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15634; -- old 3.65, level 60, hits 2091

-- Auctioneer Stockton
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15675; -- old 0.85, level 50, hits 12

-- Auctioneer Yarly
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15676; -- old 0.85, level 50, hits 9

-- Auctioneer Cain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15682; -- old 0.85, level 50, hits 29

-- Auctioneer Naxxremis
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15683; -- old 0.85, level 50, hits 83

-- Auctioneer Rhyker
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15686; -- old 0.85, level 50, hits 93
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=15686; -- old 0.14, level 50, hits 93

-- Ouro Scarab
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15718; -- old 0.7, level 60, hits 295
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=15718; -- old 2.25, level 60, hits 1781

-- Claw Tentacle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15725; -- old 1.35, level 60, hits 142

-- Eye Tentacle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15726; -- old 1.35, level 60, hits 983

-- Giant Claw Tentacle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15728; -- old 1.35, level 60, hits 130
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=15728; -- old 0.14, level 60, hits 85

-- Colossus of Zora
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.15 WHERE `entry`=15740; -- old 2.6, level 63, hits 2

-- Colossus of Ashi
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.996966 WHERE `entry`=15742; -- old 2.6, level 63, hits 500
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=60 WHERE `entry`=15742; -- old 39.95, level 63, hits 72

-- Colossal Anubisath Warbringer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15743; -- old 2.3, level 61, hits 40643
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=15743; -- old 12.45, level 62, hits 7097
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.22 WHERE `entry`=15743; -- old 0.14, level 61, hits 6196

-- Imperial Qiraji Destroyer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15744; -- old 2.55, level 62, hits 3962
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=24 WHERE `entry`=15744; -- old 16.75, level 62, hits 1771

-- Qiraji Captain
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15747; -- old 1.4, level 35, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15747; -- old 9.3, level 35, hits 56

-- Lesser Anubisath Warbringer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15748; -- old 1.5, level 33, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=15748; -- old 7, level 35, hits 48

-- Lesser Silithid Flayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15749; -- old 1.35, level 31, hits 76
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=15749; -- old 4.35, level 31, hits 164

-- Qiraji Major
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.9 WHERE `entry`=15750; -- old 8.65, level 48, hits 14

-- Anubisath Warbringer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=15751; -- old 6.2, level 45, hits 17

-- Silithid Flayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15752; -- old 0.9, level 44, hits 12
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=15752; -- old 5.5, level 44, hits 79

-- Qiraji Brigadier General
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15753; -- old 7.75, level 60, hits 184

-- Greater Anubisath Warbringer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=15754; -- old 6.55, level 58, hits 511

-- Greater Silithid Flayer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=15756; -- old 5.3, level 57, hits 620

-- Qiraji Lieutenant General
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15757; -- old 2.05, level 63, hits 431
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14.25 WHERE `entry`=15757; -- old 11.9, level 63, hits 55

-- Supreme Anubisath Warbringer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15758; -- old 1.8, level 62, hits 27

-- Supreme Silithid Flayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15759; -- old 1.65, level 61, hits 206
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=15759; -- old 6.55, level 60, hits 111

-- Officer Maloof
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15766; -- old 1.4, level 55, hits 53
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15766; -- old 3.7, level 55, hits 340

-- Officer Gothena
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15768; -- old 0.6, level 55, hits 3633

-- Flesh Tentacle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15802; -- old 1.35, level 60, hits 200

-- Qiraji Lieutenant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15806; -- old 1.4, level 28, hits 1
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=15806; -- old 7.5, level 28, hits 388

-- Minor Anubisath Warbringer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15807; -- old 1.3, level 25, hits 15
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=15807; -- old 4.25, level 25, hits 415

-- Minor Silithid Flayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15808; -- old 1.15, level 23, hits 2
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=15808; -- old 3.85, level 23, hits 287

-- Eroded Anubisath Warbringer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15810; -- old 3.75, level 18, hits 178

-- Faltering Silithid Flayer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15811; -- old 0.4, level 13, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=15811; -- old 3.5, level 14, hits 237

-- Qiraji Officer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=15812; -- old 7.45, level 20, hits 186

-- Qiraji Officer Zod
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=15813; -- old 8.65, level 20, hits 169

-- Qiraji Captain Ka'ark
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15815; -- old 9.05, level 40, hits 19

-- Qiraji Brigadier General Pax-lish
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15817; -- old 1.7, level 60, hits 622

-- Lieutenant General Nokhor
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=21.25 WHERE `entry`=15818; -- old 14.65, level 63, hits 4

-- Might of Kalimdor Sergeant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=15840; -- old 1.05, level 15, hits 5
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15840; -- old 0.1, level 16, hits 7

-- Might of Kalimdor Lieutenant
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15841; -- old 0.05, level 45, hits 19

-- Might of Kalimdor Mage
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=15842; -- old 1.9, level 36, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15842; -- old 0.05, level 36, hits 10

-- Might of Kalimdor Priest
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15843; -- old 1.65, level 56, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15843; -- old 0.05, level 55, hits 4

-- Might of Kalimdor Captain
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15845; -- old 1.3, level 26, hits 3

-- Might of Kalimdor Archer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=0.9 WHERE `entry`=15846; -- old 2, level 46, hits 13
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15846; -- old 0.05, level 46, hits 3

-- Might of Kalimdor Shaman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15847; -- old 1.25, level 25, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15847; -- old 0.75, level 25, hits 6

-- Might of Kalimdor Infantry
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15848; -- old 0.05, level 59, hits 98

-- Might of Kalimdor Druid
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15849; -- old 1.35, level 36, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15849; -- old 0.05, level 35, hits 6

-- Might of Kalimdor Skirmisher
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15850; -- old 0.05, level 35, hits 27

-- Might of Kalimdor Marshal
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15851; -- old 0.05, level 59, hits 4

-- Orgrimmar Elite Shieldguard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=4 WHERE `entry`=15852; -- old 0.85, level 60, hits 32
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=15852; -- old 1.35, level 60, hits 120

-- Orgrimmar Elite Infantryman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15853; -- old 6.7, level 59, hits 68

-- Orgrimmar Elite Cavalryman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.2 WHERE `entry`=15854; -- old 5.55, level 61, hits 681

-- Tauren Rifleman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.05 WHERE `entry`=15855; -- old 1.35, level 60, hits 1577
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10.1 WHERE `entry`=15855; -- old 3.65, level 60, hits 479

-- Tauren Primalist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15856; -- old 6.45, level 60, hits 170
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15856; -- old 4.2, level 60, hits 18

-- Stormwind Cavalryman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=15857; -- old 1.15, level 61, hits 1489
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.3 WHERE `entry`=15857; -- old 5, level 61, hits 177

-- Stormwind Infantryman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=15858; -- old 1.1, level 59, hits 82
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15858; -- old 3.45, level 59, hits 64

-- Stormwind Archmage
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15859; -- old 1.5, level 62, hits 486
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15859; -- old 2.3, level 62, hits 71

-- Kaldorei Marksman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15860; -- old 1.35, level 60, hits 989
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=13.6 WHERE `entry`=15860; -- old 3.65, level 60, hits 331

-- Ironforge Infantryman
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=15861; -- old 6.7, level 60, hits 52

-- Ironforge Cavalryman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15862; -- old 1.15, level 61, hits 824
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8.2 WHERE `entry`=15862; -- old 5.55, level 61, hits 1143

-- Darkspear Shaman
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15863; -- old 1.35, level 60, hits 84
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15863; -- old 1.1, level 60, hits 40

-- Might of Kalimdor Major
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15865; -- old 0.85, level 56, hits 23
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15865; -- old 0.05, level 56, hits 9

-- High Commander Lynore Windstryke
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.05 WHERE `entry`=15866; -- old 1.3, level 63, hits 1670
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=30 WHERE `entry`=15866; -- old 4.85, level 63, hits 74

-- Might of Kalimdor Archmage
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15867; -- old 2, level 60, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15867; -- old 0.05, level 60, hits 3

-- Highlord Leoric Von Zeldig
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=4.15 WHERE `entry`=15868; -- old 1.6, level 63, hits 1408
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20 WHERE `entry`=15868; -- old 6.05, level 63, hits 66

-- Malagav the Tactician
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.1 WHERE `entry`=15869; -- old 1.35, level 60, hits 1226
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=28 WHERE `entry`=15869; -- old 5.6, level 60, hits 70

-- Duke August Foehammer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=4 WHERE `entry`=15870; -- old 1.3, level 63, hits 1926
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20 WHERE `entry`=15870; -- old 5.75, level 63, hits 206

-- Sergeant Carnes
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15903; -- old 4.25, level 60, hits 93

-- Grobbulus
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15931; -- old 1.3, level 63, hits 2

-- Gluth
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15932; -- old 1.3, level 63, hits 2

-- Hive'Zara Hornet
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15934; -- old 1.15, level 61, hits 4
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=15934; -- old 10, level 61, hits 18

-- Heigan the Unclean
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15936; -- old 1.3, level 63, hits 2

-- Maexxna
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15952; -- old 1.3, level 63, hits 4

-- Grand Widow Faerlina
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15953; -- old 1.3, level 63, hits 5

-- Noth the Plaguebringer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15954; -- old 1.3, level 63, hits 1

-- Anub'Rekhan
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15956; -- old 1.3, level 63, hits 4
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=15956; -- old 0.14, level 63, hits 86

-- Lunar Festival Sentinel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6.1 WHERE `entry`=15961; -- old 4.8, level 60, hits 45

-- Vekniss Hatchling
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15962; -- old 1.1, level 60, hits 153
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=9 WHERE `entry`=15962; -- old 7.95, level 60, hits 1544

-- Dread Creeper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15974; -- old 1.15, level 61, hits 302
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=24 WHERE `entry`=15974; -- old 19.4, level 61, hits 741

-- Carrion Spinner
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15975; -- old 1.15, level 61, hits 546
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=15975; -- old 26.4, level 61, hits 1038

-- Venom Stalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15976; -- old 1.15, level 61, hits 66
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=32 WHERE `entry`=15976; -- old 27.35, level 61, hits 129

-- Infectious Skitterer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15977; -- old 1.15, level 61, hits 3095
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=15977; -- old 11.5, level 61, hits 3711

-- Crypt Reaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15978; -- old 1.15, level 61, hits 43
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=30 WHERE `entry`=15978; -- old 26.95, level 61, hits 73

-- Tomb Horror
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15979; -- old 1.15, level 61, hits 35
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=32 WHERE `entry`=15979; -- old 27.35, level 61, hits 51

-- Naxxramas Cultist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15980; -- old 2.2, level 61, hits 854
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14 WHERE `entry`=15980; -- old 30.75, level 61, hits 1710

-- Naxxramas Acolyte
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15981; -- old 2.2, level 61, hits 1219
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=14 WHERE `entry`=15981; -- old 30.75, level 61, hits 609

-- Sartura's Royal Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15984; -- old 1.15, level 61, hits 46

-- Sapphiron
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15989; -- old 1.3, level 63, hits 14

-- Kel'Thuzad
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15990; -- old 1.3, level 63, hits 4

-- Loatheb
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16011; -- old 1.5, level 63, hits 122

-- Mokvar
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16012; -- old 2.4, level 60, hits 5

-- Deliana
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16013; -- old 1.85, level 60, hits 60
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=16013; -- old 2.3, level 60, hits 16

-- Patchwork Golem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16017; -- old 1.15, level 61, hits 157

-- Bile Retcher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16018; -- old 1.15, level 61, hits 138

-- Mad Scientist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16020; -- old 1.15, level 61, hits 458
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=16020; -- old 22.6, level 61, hits 886

-- Living Monstrosity
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16021; -- old 1.2, level 62, hits 85

-- Surgical Assistant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16022; -- old 1.1, level 60, hits 1034

-- Stitched Spewer
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16025; -- old 1.3, level 63, hits 13

-- Patchwerk
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16028; -- old 1.5, level 63, hits 8
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.03 WHERE `entry`=16028; -- old 0.14, level 63, hits 40

-- Sludge Belcher
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16029; -- old 1.2, level 62, hits 20

-- Plague Beast
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16034; -- old 1.15, level 61, hits 30
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16034; -- old 1, level 61, hits 135

-- Frenzied Bat
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16036; -- old 1.1, level 60, hits 1149
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=16036; -- old 0.75, level 60, hits 2252

-- Plagued Bat
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16037; -- old 1.1, level 60, hits 1238
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=16037; -- old 1, level 60, hits 1877

-- Korv
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=16053; -- old 3.65, level 60, hits 3

-- Diseased Maggot
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16056; -- old 1.1, level 60, hits 34
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12.3 WHERE `entry`=16056; -- old 6.65, level 60, hits 195

-- Theldren
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.3 WHERE `entry`=16059; -- old 1.1, level 60, hits 6

-- Gothik the Harvester
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16060; -- old 1.3, level 63, hits 6

-- Instructor Razuvious
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16061; -- old 1.3, level 63, hits 36

-- Highlord Mograine
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16062; -- old 1.3, level 63, hits 25

-- Sir Zeliek
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16063; -- old 1.3, level 63, hits 33

-- Thane Korth'azz
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16064; -- old 1.3, level 63, hits 7

-- Lady Blaumeux
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16065; -- old 1.3, level 63, hits 78

-- Skeletal Steed
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16067; -- old 1.15, level 61, hits 92

-- Commander Eligor Dawnbringer
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=4.6 WHERE `entry`=16115; -- old 66.7, level 60, hits 5

-- Unrelenting Deathknight
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16125; -- old 1.15, level 61, hits 440

-- Unrelenting Rider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16126; -- old 1.25, level 62, hits 63

-- Spectral Trainee
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16127; -- old 1.15, level 61, hits 1267

-- Cenarion Hold Reservist
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16139; -- old 1.1, level 60, hits 34
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=16139; -- old 3.4, level 60, hits 256

-- Ghoul Berserker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16141; -- old 1.1, level 59, hits 5225

-- Bile Sludge
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16142; -- old 1.15, level 62, hits 30
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=16142; -- old 13.95, level 62, hits 151

-- Shadow of Doom
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16143; -- old 1.1, level 60, hits 2260

-- Deathknight Captain
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16145; -- old 1.15, level 61, hits 150
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=45 WHERE `entry`=16145; -- old 31.5, level 61, hits 127
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=16145; -- old 0.14, level 61, hits 127

-- Deathknight
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=16146; -- old 1.45, level 61, hits 152

-- Spectral Deathknight
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16148; -- old 1.2, level 62, hits 437

-- Spectral Horse
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=33.5 WHERE `entry`=16149; -- old 26.3, level 63, hits 96

-- Spectral Rider
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16150; -- old 1.3, level 63, hits 66

-- Risen Deathknight
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16154; -- old 1.15, level 61, hits 132
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16154; -- old 25, level 61, hits 379

-- Dark Touched Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16156; -- old 1.15, level 61, hits 45
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16156; -- old 25, level 61, hits 190

-- Doom Touched Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16157; -- old 1.15, level 61, hits 54
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16157; -- old 17.1, level 61, hits 157

-- Death Touched Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16158; -- old 1.15, level 61, hits 82
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16158; -- old 25, level 61, hits 252

-- Deathknight Cavalier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16163; -- old 1.15, level 61, hits 79

-- Shade of Naxxramas
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16164; -- old 1.15, level 61, hits 47
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16164; -- old 37.35, level 61, hits 198

-- Necro Knight
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16165; -- old 1.15, level 61, hits 68
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=21 WHERE `entry`=16165; -- old 31.1, level 61, hits 114

-- Bony Construct
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16167; -- old 1.15, level 61, hits 45
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=26.3 WHERE `entry`=16167; -- old 22.6, level 61, hits 85

-- Stoneskin Gargoyle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16168; -- old 1.45, level 61, hits 385

-- Skeletal Smith
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16193; -- old 1.15, level 61, hits 40
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=16193; -- old 22.6, level 61, hits 203

-- Unholy Axe
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16194; -- old 1.15, level 61, hits 39

-- Unholy Staff
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16215; -- old 1.15, level 61, hits 32

-- Unholy Swords
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16216; -- old 1.15, level 61, hits 22

-- Guard Didier
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16226; -- old 1.1, level 60, hits 1380
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=16226; -- old 3.65, level 60, hits 1025

-- Argent Dawn Infantry
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16228; -- old 2.4, level 60, hits 53
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=16228; -- old 3.65, level 60, hits 120

-- Caravan Mule
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16232; -- old 0, level 50, hits 947
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.1 WHERE `entry`=16232; -- old 3.75, level 50, hits 2140
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=16232; -- old 0.14, level 50, hits 2140

-- Eye Stalk
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16236; -- old 1.15, level 61, hits 17
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=16236; -- old 22.6, level 61, hits 9

-- Argent Recruiter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16241; -- old 0.05, level 55, hits 9

-- Plague Slime
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16243; -- old 1.15, level 61, hits 255
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=54 WHERE `entry`=16243; -- old 81.2, level 61, hits 152

-- Infectious Ghoul
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16244; -- old 1.15, level 61, hits 150

-- Argent Scout
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16255; -- old 0.05, level 55, hits 11

-- Argent Emissary
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16285; -- old 0.05, level 55, hits 8

-- Spore
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16286; -- old 0.7, level 60, hits 195
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.1 WHERE `entry`=16286; -- old 0.6, level 60, hits 823
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=16286; -- old 0.14, level 60, hits 823

-- Fallout Slime
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=29 WHERE `entry`=16290; -- old 46.2, level 60, hits 202

-- Mutated Grub
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16297; -- old 1.15, level 61, hits 758
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=8 WHERE `entry`=16297; -- old 1, level 61, hits 1066

-- Skeletal Shocktrooper
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16299; -- old 1.1, level 59, hits 4859

-- Zombie Chow
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16360; -- old 1.1, level 60, hits 311
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=7.5 WHERE `entry`=16360; -- old 3.4, level 60, hits 2053

-- Necropolis Acolyte
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16368; -- old 1.25, level 62, hits 177

-- Sewage Slime
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16375; -- old 1.1, level 60, hits 147

-- Argent Sentry
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=15 WHERE `entry`=16378; -- old 1.7, level 60, hits 62

-- Spirit of the Damned
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16379; -- old 1.15, level 61, hits 24
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=16379; -- old 0.14, level 61, hits 33

-- Bone Witch
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16380; -- old 1.15, level 61, hits 43

-- Lightning Totem
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16385; -- old 1.15, level 62, hits 48

-- Atiesh
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16387; -- old 1.35, level 63, hits 1

-- Deathchill Servant
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16390; -- old 1.15, level 61, hits 91
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=24 WHERE `entry`=16390; -- old 30.1, level 61, hits 187

-- Ghost of Naxxramas
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=27 WHERE `entry`=16419; -- old 15.05, level 60, hits 7

-- Soldier of the Frozen Wastes
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=16427; -- old 8.1, level 60, hits 15

-- Unstoppable Abomination
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=48 WHERE `entry`=16428; -- old 74.45, level 60, hits 121
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=16428; -- old 0.14, level 60, hits 121

-- Soul Weaver
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16429; -- old 1.1, level 60, hits 121

-- Argent Dawn Priest
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16436; -- old 0.05, level 55, hits 4

-- Skeletal Trooper
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=16438; -- old 0.14, level 9, hits 166

-- Guardian of Icecrown
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16441; -- old 1.1, level 60, hits 88

-- Plagued Gargoyle
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16446; -- old 1.45, level 61, hits 103

-- Plagued Ghoul
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16447; -- old 1.15, level 61, hits 376

-- Plagued Deathhound
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16448; -- old 1.15, level 61, hits 3
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=30.4 WHERE `entry`=16448; -- old 22.6, level 61, hits 11

-- Spirit of Naxxramas
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16449; -- old 1.15, level 61, hits 51
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=25 WHERE `entry`=16449; -- old 37.35, level 61, hits 113

-- Deathknight Vindicator
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16451; -- old 1.25, level 62, hits 8
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=39 WHERE `entry`=16451; -- old 32.85, level 62, hits 40
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.11 WHERE `entry`=16451; -- old 0.14, level 62, hits 40

-- Necro Knight Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16452; -- old 1.25, level 62, hits 26
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=22 WHERE `entry`=16452; -- old 26, level 62, hits 118

-- Necro Stalker
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16453; -- old 1.15, level 61, hits 119

-- Naxxramas Follower
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16505; -- old 1.15, level 61, hits 56
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=50 WHERE `entry`=16505; -- old 59.2, level 61, hits 104

-- Crypt Guard
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16573; -- old 1.15, level 61, hits 45

-- Corpse Scarab
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16698; -- old 0.7, level 60, hits 880
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=16698; -- old 2.1, level 60, hits 13419

-- Spirit of Mograine
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=16.5 WHERE `entry`=16775; -- old 3, level 63, hits 12

-- Spirit of Blaumeux
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=25.5 WHERE `entry`=16776; -- old 1.7, level 63, hits 6

-- Spirit of Zeliek
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=25 WHERE `entry`=16777; -- old 1.7, level 63, hits 8

-- Spirit of Korth'azz
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=26.5 WHERE `entry`=16778; -- old 1.7, level 63, hits 5

-- Argent Quartermaster
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=16786; -- old 0.05, level 55, hits 5

-- Argent Outfitter
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16787; -- old 0.05, level 55, hits 14

-- Death Lord
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16861; -- old 1.15, level 61, hits 11
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=40.5 WHERE `entry`=16861; -- old 35.85, level 61, hits 30

-- Plagued Guardian
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16981; -- old 1.15, level 61, hits 9
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=20 WHERE `entry`=16981; -- old 24.25, level 61, hits 4

-- Plagued Champion
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16983; -- old 1.15, level 61, hits 172
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=16 WHERE `entry`=16983; -- old 26.85, level 61, hits 392

-- Plagued Warrior
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16984; -- old 1.15, level 61, hits 324

-- Mr. Bigglesworth
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=16998; -- old 400, level 5, hits 142
-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=16998; -- old 0.14, level 5, hits 142

-- Cinder Elemental
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=17003; -- old 1.3, level 58, hits 16

-- Maexxna Spiderling
-- Armor Multiplier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17055; -- old 1.1, level 60, hits 203
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=17055; -- old 1.85, level 60, hits 6101

-- Alliance Silithyst Sentinel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=17765; -- old 3.65, level 60, hits 5

-- Horde Silithyst Sentinel
-- Damage Multiplier
UPDATE `creature_template` SET `damage_multiplier`=6 WHERE `entry`=17766; -- old 3, level 60, hits 5


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
