DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200111182648');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200111182648');
-- Add your query below.


CREATE TABLE IF NOT EXISTS `player_premade_item_template` (
  `entry` int(10) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '60',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `player_premade_item_template` (`entry`, `class`, `level`, `name`) VALUES
(1, 1, 60, 'dpspreraidbis'),
(2, 2, 60, 'dpspreraidbis'),
(3, 3, 60, 'dpspreraidbis'),
(4, 4, 60, 'dpspreraidbis'),
(5, 5, 60, 'dpspreraidbis'),
(6, 7, 60, 'dpspreraidbis'),
(7, 8, 60, 'dpspreraidbis'),
(8, 9, 60, 'dpspreraidbis'),
(9, 11, 60, 'dpspreraidbis');

CREATE TABLE IF NOT EXISTS `player_premade_spell_template` (
  `entry` int(10) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '60',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `player_premade_spell_template` (`entry`, `class`, `level`, `name`) VALUES
(1, 1, 60, 'dw-fury-pve'),
(2, 2, 60, 'retribution-pve'),
(3, 3, 60, 'mm-sv-pve'),
(4, 4, 60, 'combat-swords-pve'),
(5, 5, 60, 'holy-pve'),
(6, 7, 60, 'elemental-pve'),
(7, 8, 60, 'arcane-power-frost-pve'),
(8, 9, 60, 'ds-ruin-pve'),
(9, 11, 60, 'balance-pve');

CREATE TABLE IF NOT EXISTS `player_premade_item` (
  `entry` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL,
  `enchant` int(10) unsigned NOT NULL DEFAULT '0',
  `team` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE IF NOT EXISTS `player_premade_spell` (
  `entry` int(10) unsigned NOT NULL,
  `spell` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry`,`spell`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Fury Warrior Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(1, 12640, 1506, 0), -- Lionheart Helm
(1, 15411, 0, 0), -- Mark of Fordring
(1, 12927, 2488, 0), -- Truestrike Shoulders
(1, 13340, 849, 0), -- Cape of the Black Baron
(1, 11726, 1891, 0), -- Savage Gladiator Chain
(1, 12936, 1885, 0), -- Battleborn Armbraces
(1, 15063, 927, 0), -- Devilsaur Gauntlets
(1, 13142, 0, 0), -- Brigam Girdle
(1, 15062, 1506, 0), -- Devilsaur Leggings
(1, 12555, 911, 0), -- Battlechaser's Greaves
(1, 17713, 0, 0), -- Blackstone Ring
(1, 18500, 0, 0), -- Tarnished Elven Ring
(1, 11815, 0, 0), -- Hand of Justice
(1, 13965, 0, 0), -- Blackhand's Breadth
(1, 11684, 1900, 0), -- Ironfoe
(1, 15806, 1900, 0), -- Mirah's Song
(1, 12651, 664, 0); -- Blackcrow

-- Dual Wield Fury Warrior PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(1, 71),
(1, 355),
(1, 676),
(1, 871),
(1, 1161),
(1, 1672),
(1, 1680),
(1, 1719),
(1, 2458),
(1, 2565),
(1, 2687),
(1, 3127),
(1, 5246),
(1, 6554),
(1, 7373),
(1, 11556),
(1, 11574),
(1, 11578),
(1, 11581),
(1, 11585),
(1, 11597),
(1, 11605),
(1, 12290),
(1, 12296),
(1, 12328),
(1, 12659),
(1, 12663),
(1, 12679),
(1, 12856),
(1, 12861),
(1, 12867),
(1, 12974),
(1, 13002),
(1, 13048),
(1, 16494),
(1, 18499),
(1, 20230),
(1, 20503),
(1, 20560),
(1, 20569),
(1, 20617),
(1, 20662),
(1, 23588),
(1, 23894),
(1, 25286),
(1, 25288),
(1, 25289);

-- Retribution Paladin Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(2, 12640, 1506, 0), -- Lionheart Helm
(2, 15411, 0, 0), -- Mark of Fordring
(2, 12927, 2488, 0), -- Truestrike Shoulders
(2, 13340, 849, 0), -- Cape of the Black Baron
(2, 11726, 1891, 0), -- Savage Gladiator Chain
(2, 12936, 1885, 0), -- Battleborn Armbraces
(2, 13957, 927, 0), -- Gargoyle Slashers
(2, 13959, 0, 0), -- Omokk's Girth Restrainer
(2, 14554, 1506, 0), -- Cloudkeeper Legplates
(2, 14616, 1887, 0), -- Bloodmail Boots
(2, 13098, 0, 0), -- Painweaver Band
(2, 12548, 469, 0), -- Magni's Will
(2, 17713, 67, 0), -- Blackstone Ring
(2, 11815, 0, 0), -- Hand of Justice
(2, 13965, 0, 0), -- Blackhand's Breadth
(2, 12784, 1900, 0); -- Arcanite Reaper

-- Retribution Paladin PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(2, 1020),
(2, 1038),
(2, 1044),
(2, 1152),
(2, 3127),
(2, 4987),
(2, 5573),
(2, 10278),
(2, 10293),
(2, 10301),
(2, 10308),
(2, 10310),
(2, 10314),
(2, 10318),
(2, 10326),
(2, 13819),
(2, 19746),
(2, 19752),
(2, 19896),
(2, 19898),
(2, 19900),
(2, 19943),
(2, 19979),
(2, 20048),
(2, 20059),
(2, 20066),
(2, 20104),
(2, 20113),
(2, 20121),
(2, 20142),
(2, 20164),
(2, 20193),
(2, 20208),
(2, 20218),
(2, 20266),
(2, 20271),
(2, 20293),
(2, 20308),
(2, 20337),
(2, 20349),
(2, 20357),
(2, 20729),
(2, 20773),
(2, 20920),
(2, 20924),
(2, 23214),
(2, 24239),
(2, 25290),
(2, 25291),
(2, 25292),
(2, 25780),
(2, 25890),
(2, 25895),
(2, 25916),
(2, 25918),
(2, 25957),
(2, 26023),
(2, 33391);

-- Hunter Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(3, 13404, 1508, 0), -- Mask of the Unforgiven
(3, 15411, 0, 0), -- Mark of Fordring
(3, 12927, 2488, 0), -- Truestrike Shoulders
(3, 13340, 849, 0), -- Cape of the Black Baron
(3, 11726, 1891, 0), -- Savage Gladiator Chain
(3, 13211, 247, 0), -- Slashclaw Bracers
(3, 15062, 1508, 0), -- Devilsaur Leggings
(3, 15063, 1887, 0), -- Devilsaur Gauntlets
(3, 12634, 0, 0), -- Chiselbrand Girdle
(3, 16675, 1887, 0), -- Beaststalker's Boots
(3, 17713, 0, 0), -- Blackstone Ring
(3, 13098, 0, 0), -- Painweaver Band
(3, 13965, 0, 0), -- Blackhand's Breadth
(3, 11815, 0, 0), -- Hand of Justice
(3, 12940, 1897, 0), -- Dal'Rend's Sacred Charge
(3, 12939, 1897, 0), -- Dal'Rend's Tribal Guardian
(3, 2099, 664, 0); -- Dwarven Hand Cannon

-- Marksmanship / Survival PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(3, 883),
(3, 982),
(3, 1002),
(3, 1462),
(3, 1494),
(3, 1515),
(3, 1543),
(3, 2641),
(3, 3045),
(3, 3127),
(3, 4195),
(3, 4196),
(3, 4197),
(3, 4198),
(3, 4199),
(3, 4200),
(3, 4201),
(3, 4202),
(3, 5048),
(3, 5049),
(3, 5116),
(3, 5118),
(3, 5149),
(3, 5384),
(3, 6197),
(3, 6991),
(3, 13159),
(3, 13161),
(3, 13163),
(3, 13544),
(3, 13809),
(3, 14266),
(3, 14268),
(3, 14271),
(3, 14273),
(3, 14277),
(3, 14280),
(3, 14287),
(3, 14295),
(3, 14305),
(3, 14311),
(3, 14317),
(3, 14325),
(3, 14327),
(3, 14923),
(3, 14924),
(3, 14925),
(3, 14926),
(3, 14927),
(3, 15632),
(3, 19153),
(3, 19160),
(3, 19258),
(3, 19263),
(3, 19297),
(3, 19420),
(3, 19422),
(3, 19431),
(3, 19490),
(3, 19500),
(3, 19503),
(3, 19511),
(3, 19553),
(3, 19878),
(3, 19879),
(3, 19880),
(3, 19882),
(3, 19883),
(3, 19884),
(3, 19885),
(3, 20190),
(3, 20904),
(3, 20906),
(3, 24283),
(3, 24295),
(3, 24440),
(3, 24441),
(3, 24463),
(3, 24464),
(3, 24475),
(3, 24476),
(3, 24477),
(3, 24478),
(3, 24490),
(3, 24494),
(3, 24495),
(3, 24508),
(3, 24509),
(3, 24510),
(3, 24511),
(3, 24512),
(3, 24513),
(3, 24514),
(3, 24515),
(3, 24516),
(3, 24547),
(3, 24556),
(3, 24557),
(3, 24558),
(3, 24559),
(3, 24560),
(3, 24561),
(3, 24562),
(3, 24631),
(3, 24632),
(3, 24691),
(3, 25294),
(3, 25295),
(3, 25296);

-- Rogue Sword Spec Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(4, 13404, 1508, 0), -- Mask of the Unforgiven
(4, 15411, 0, 0), -- Mark of Fordring
(4, 12927, 2488, 0), -- Truestrike Shoulders
(4, 13340, 849, 0), -- Cape of the Black Baron
(4, 14637, 1891, 0), -- Cadaverous Armor
(4, 13120, 1885, 0), -- Deepfury Bracers
(4, 15062, 1508, 0), -- Devilsaur Leggings
(4, 15063, 1887, 0), -- Devilsaur Gauntlets
(4, 13252, 0, 0), -- Cloudrunner Girdle
(4, 12553, 1887, 0), -- Swiftwalker Boots
(4, 17713, 0, 0), -- Blackstone Ring
(4, 13098, 0, 0), -- Painweaver Band
(4, 11815, 0, 0), -- Hand of Justice
(4, 13965, 0, 0), -- Blackhand's Breadth
(4, 12940, 1897, 0), -- Dal'Rend's Sacred Charge
(4, 12939, 1900, 0), -- Dal'Rend's Tribal Guardian
(4, 12651, 664, 0); -- Blackcrow

-- Combat Swords Rogue PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(4, 921),
(4, 1725),
(4, 1769),
(4, 1787),
(4, 1804),
(4, 1833),
(4, 1842),
(4, 1857),
(4, 1860),
(4, 2094),
(4, 2836),
(4, 2842),
(4, 3127),
(4, 3421),
(4, 5277),
(4, 6510),
(4, 6774),
(4, 8643),
(4, 11198),
(4, 11269),
(4, 11275),
(4, 11286),
(4, 11290),
(4, 11294),
(4, 11297),
(4, 11300),
(4, 11305),
(4, 11343),
(4, 11400),
(4, 13230),
(4, 13712),
(4, 13750),
(4, 13792),
(4, 13845),
(4, 13852),
(4, 13863),
(4, 13872),
(4, 13875),
(4, 13877),
(4, 13964),
(4, 14137),
(4, 14142),
(4, 14159),
(4, 14161),
(4, 14167),
(4, 14179),
(4, 18429),
(4, 25300),
(4, 25302),
(4, 25347),
(4, 30920);

-- Shadow Priest Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(5, 14111, 1509, 0), -- Felcloth Hood
(5, 12103, 0, 0), -- Star of Mystaria
(5, 14112, 2488, 0), -- Felcloth Shoulders
(5, 15421, 1888, 0), -- Shroud of the Exile
(5, 14136, 1891, 0), -- Robe of Winter Night
(5, 11766, 1883, 0), -- Flameweave Cuffs of Shadow Wrath
(5, 13170, 1509, 0), -- Skyshroud Leggings
(5, 13253, 0, 0), -- Hands of Power
(5, 11662, 0, 0), -- Ban'thok Sash
(5, 11822, 911, 0), -- Omnicast Boots
(5, 12543, 0, 469), -- Songstone of Ironforge
(5, 12545, 0, 67), -- Eye of Orgrimmar
(5, 13001, 0, 0), -- Maiden's Circle
(5, 12930, 0, 0), -- Briarwood Reed
(5, 11832, 0, 0), -- Burst of Knowledge
(5, 13349, 2504, 0), -- Scepter of the Unholy
(5, 11904, 0, 0), -- Spirit of Aquementas
(5, 13396, 0, 0); -- Skul's Ghastly Touch

-- Shadow Priest PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(5, 528),
(5, 552),
(5, 988),
(5, 1706),
(5, 2053),
(5, 6064),
(5, 9485),
(5, 10876),
(5, 10890),
(5, 10894),
(5, 10901),
(5, 10909),
(5, 10912),
(5, 10917),
(5, 10934),
(5, 10938),
(5, 10942),
(5, 10947),
(5, 10952),
(5, 10953),
(5, 10958),
(5, 14523),
(5, 14528),
(5, 14751),
(5, 14767),
(5, 14769),
(5, 14777),
(5, 14783),
(5, 15261),
(5, 15286),
(5, 15310),
(5, 15317),
(5, 15320),
(5, 15330),
(5, 15334),
(5, 15338),
(5, 15473),
(5, 17325),
(5, 18807),
(5, 20770),
(5, 21564),
(5, 25314),
(5, 25315),
(5, 25316),
(5, 27683);

-- Elemental Shaman Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(6, 12752, 2544, 0), -- Cap of the Scarlet Savant
(6, 12103, 0, 0), -- Star of Mystaria
(6, 13133, 2488, 0), -- Drakesfire Epaulets
(6, 11623, 1888, 0), -- Spritecaster Cape
(6, 12624, 1891, 0), -- Wildthorn Mail
(6, 11765, 1883, 0), -- Pyremail Wristguards of Nature's Wrath
(6, 13170, 2544, 0), -- Skyshroud Leggings
(6, 13253, 0, 0), -- Hands of Power
(6, 11662, 0, 0), -- Ban'thok Sash
(6, 13954, 911, 0), -- Verdant Footpads
(6, 13001, 0, 0), -- Maiden's Circle
(6, 12545, 0, 67), -- Eye of Orgrimmar
(6, 11824, 0, 469), -- Cyclopean Band
(6, 12930, 0, 0), -- Briarwood Reed
(6, 13968, 0, 0), -- Eye of the Beast
(6, 13161, 2504, 0); -- Trindlehaven Staff

-- Elemental Shaman PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(6, 131),
(6, 526),
(6, 546),
(6, 556),
(6, 2484),
(6, 2645),
(6, 2870),
(6, 6196),
(6, 6495),
(6, 8012),
(6, 8143),
(6, 8166),
(6, 8170),
(6, 8177),
(6, 10408),
(6, 10414),
(6, 10428),
(6, 10432),
(6, 10438),
(6, 10463),
(6, 10468),
(6, 10473),
(6, 10479),
(6, 10497),
(6, 10538),
(6, 10587),
(6, 10601),
(6, 10605),
(6, 10614),
(6, 10623),
(6, 11315),
(6, 15112),
(6, 15208),
(6, 16089),
(6, 16108),
(6, 16112),
(6, 16120),
(6, 16161),
(6, 16164),
(6, 16166),
(6, 16189),
(6, 16198),
(6, 16209),
(6, 16217),
(6, 16221),
(6, 16224),
(6, 16316),
(6, 16342),
(6, 16356),
(6, 16362),
(6, 16387),
(6, 16582),
(6, 20608),
(6, 20777),
(6, 25357),
(6, 25359),
(6, 25361),
(6, 25908),
(6, 28998),
(6, 29000),
(6, 29228);

-- Frost Mage Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(7, 14332, 1509, 0), -- Eternal Crown
(7, 12103, 0, 0), -- Star of Mystaria
(7, 11782, 2488, 0), -- Boreal Mantle
(7, 13386, 1888, 0), -- Archivist Cape
(7, 14152, 1891, 0), -- Robe of the Archmage
(7, 11766, 1883, 0), -- Flameweave Cuffs
(7, 13170, 1509, 0), -- Skyshroud Leggings
(7, 13253, 930, 0), -- Hands of Power
(7, 11662, 0, 0), -- Ban'thok Sash
(7, 11822, 911, 0), -- Omnicast Boots
(7, 942, 0, 0), -- Freezing Band
(7, 942, 0, 0), -- Freezing Band
(7, 12930, 0, 0), -- Briarwood Reed
(7, 13968, 0, 0), -- Eye of the Beast
(7, 13964, 2443, 0), -- Witchblade
(7, 10796, 0, 0), -- Drakestone
(7, 13938, 0, 0); -- Bonecreeper Stylus

-- Arcane Power / Frost Mage PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(7, 130),
(7, 475),
(7, 759),
(7, 1953),
(7, 2139),
(7, 2855),
(7, 3552),
(7, 3561),
(7, 3562),
(7, 3565),
(7, 7301),
(7, 10053),
(7, 10054),
(7, 10059),
(7, 10139),
(7, 10157),
(7, 10161),
(7, 10170),
(7, 10174),
(7, 10187),
(7, 10193),
(7, 10199),
(7, 10202),
(7, 10207),
(7, 10216),
(7, 10220),
(7, 10225),
(7, 10230),
(7, 11416),
(7, 11419),
(7, 12042),
(7, 12043),
(7, 12051),
(7, 12469),
(7, 12503),
(7, 12519),
(7, 12577),
(7, 12592),
(7, 12826),
(7, 12840),
(7, 12953),
(7, 15053),
(7, 15060),
(7, 16757),
(7, 16766),
(7, 18464),
(7, 22783),
(7, 23028),
(7, 25304),
(7, 25306),
(7, 25345),
(7, 28272),
(7, 28574),
(7, 28609),
(7, 28612),
(7, 29440),
(7, 29446);

-- Warlock Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(8, 12752, 1509, 0), -- Cap of the Scarlet Savant
(8, 12103, 0, 0), -- Star of Mystaria
(8, 14112, 2488, 0), -- Felcloth Shoulders
(8, 10249, 1888, 0), -- Master's Cloak
(8, 14153, 1891, 0), -- Robe of the Void
(8, 10248, 1883, 0), -- Master's Bracers
(8, 13170, 1509, 0), -- Skyshroud Leggings
(8, 14146, 930, 0), -- Gloves of Spell Mastery
(8, 11662, 0, 0), -- Ban'thok Sash
(8, 11822, 911, 0), -- Omnicast Boots
(8, 12543, 0, 469), -- Songstone of Ironforge
(8, 12545, 0, 67), -- Eye of Orgrimmar
(8, 13001, 0, 0), -- Maiden's Circle
(8, 13968, 0, 0), -- Eye of the Beast
(8, 12930, 0, 0), -- Briarwood Reed
(8, 17719, 0, 0), -- Inventor's Focal Sword
(8, 10796, 0, 0), -- Drakestone
(8, 13396, 0, 0); -- Skul's Ghastly Touch

-- Demonic Sacrifice / Ruin Warlock PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(8, 126),
(8, 132),
(8, 603),
(8, 688),
(8, 691),
(8, 696),
(8, 697),
(8, 698),
(8, 712),
(8, 2970),
(8, 5500),
(8, 5697),
(8, 5784),
(8, 6215),
(8, 11675),
(8, 11678),
(8, 11684),
(8, 11689),
(8, 11695),
(8, 11700),
(8, 11703),
(8, 11708),
(8, 11713),
(8, 11717),
(8, 11719),
(8, 11722),
(8, 11726),
(8, 11730),
(8, 11735),
(8, 11743),
(8, 17728),
(8, 17779),
(8, 17792),
(8, 17803),
(8, 17814),
(8, 17862),
(8, 17918),
(8, 17923),
(8, 17924),
(8, 17926),
(8, 17928),
(8, 17953),
(8, 17959),
(8, 18134),
(8, 18175),
(8, 18183),
(8, 18647),
(8, 18693),
(8, 18701),
(8, 18707),
(8, 18708),
(8, 18710),
(8, 18751),
(8, 18771),
(8, 18788),
(8, 18871),
(8, 20757),
(8, 23161),
(8, 25307),
(8, 25309),
(8, 25311),
(8, 28610),
(8, 33391);

-- Balance Druid Pre Raid Bis
INSERT INTO `player_premade_item` (`entry`, `item`, `enchant`, `team`) VALUES
(9, 10504, 1509, 0), -- Green Lens
(9, 12103, 0, 0), -- Star of Mystaria
(9, 13013, 2488, 0), -- Elder Wizard's Mantle
(9, 11623, 1888, 0), -- Spritecaster Cape
(9, 11924, 1891, 0), -- Robes of the Royal Crown
(9, 11766, 1883, 0), -- Flameweave Cuffs
(9, 13170, 1509, 0), -- Skyshroud Leggings
(9, 13253, 930, 0), -- Hands of Power
(9, 11662, 0, 0), -- Ban'thok Sash
(9, 11822, 911, 0), -- Omnicast Boots 
(9, 12543, 0, 469), -- Songstone of Ironforge
(9, 12545, 0, 67), -- Eye of Orgrimmar
(9, 13001, 0, 0), -- Maiden's Circle
(9, 12930, 0, 0), -- Briarwood Reed
(9, 13968, 0, 0), -- Eye of the Beast
(9, 13964, 0, 0), -- Witchblade
(9, 10796, 0, 0); -- Drakestone

-- Balance Druid PvE
INSERT INTO `player_premade_spell` (`entry`, `spell`) VALUES 
(9, 768),
(9, 783),
(9, 1066),
(9, 2782),
(9, 2893),
(9, 5209),
(9, 5225),
(9, 5229),
(9, 6795),
(9, 8983),
(9, 9634),
(9, 9821),
(9, 9827),
(9, 9830),
(9, 9835),
(9, 9846),
(9, 9850),
(9, 9853),
(9, 9858),
(9, 9863),
(9, 9867),
(9, 9881),
(9, 9885),
(9, 9892),
(9, 9896),
(9, 9898),
(9, 9901),
(9, 9904),
(9, 9907),
(9, 9908),
(9, 9910),
(9, 9912),
(9, 9913),
(9, 16820),
(9, 16825),
(9, 16835),
(9, 16847),
(9, 16880),
(9, 16901),
(9, 16913),
(9, 16919),
(9, 16926),
(9, 17055),
(9, 17068),
(9, 17108),
(9, 17249),
(9, 17329),
(9, 17402),
(9, 18658),
(9, 20719),
(9, 20748),
(9, 21850),
(9, 22812),
(9, 22829),
(9, 22896),
(9, 24858),
(9, 24977),
(9, 25297),
(9, 25298),
(9, 25299),
(9, 29166);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
