DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230215211451');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230215211451');
-- Add your query below.


-- Rhahk'Zor (644)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(644, 14166 /*Buccaneer's Bracers*/, 0.28466, 1, 1),
(644, 14173 /*Buccaneer's Cord*/, 0.168687, 1, 1);

-- Cookie (645)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(645, 1738 /*Laced Mail Belt*/, 0.222469, 1, 1);

-- Mr. Smite (646)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(646, 1793 /*Patched Leather Shoulderpads*/, 0.265554, 1, 1);

-- Black Bear (1129)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(1129, 2318 /*Light Leather*/, 33.3333, 1, 1, 1),
(1129, 2934 /*Ruined Leather Scraps*/, 66.6666, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=1129 WHERE `entry`=1129;

-- Tunnel Rat Vermin (1172)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1172, 2212 /*Cracked Buckler*/, 0.263783, 1, 1),
(1172, 2642 /*Loose Chain Boots*/, 0.209377, 1, 1),
(1172, 3373 /*Patchwork Bracers*/, 0.295107, 1, 1);

-- Tunnel Rat Scout (1173)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1173, 1415 /*Carpenter's Mallet*/, 0.405933, 1, 1);

-- Rotting Ancestor (1530)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1530, 1411 /*Withered Staff*/, 0.535318, 1, 1),
(1530, 1423 /*Worn Leather Pants*/, 0.378639, 1, 1),
(1530, 1427 /*Patchwork Shoes*/, 0.404753, 1, 1),
(1530, 1431 /*Patchwork Pants*/, 0.398224, 1, 1),
(1530, 2635 /*Loose Chain Belt*/, 0.241546, 1, 1);

-- Wandering Spirit (1532)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1532, 1416 /*Rusty Hatchet*/, 0.483289, 1, 1);

-- Bloodsail Elder Magus (1653)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1653, 13021 /*Needle Threader*/, 3.84615, 1, 1);

-- Moonrage Whitescalp (1769)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(1769, 1431 /*Patchwork Pants*/, 1.10497, 1, 1),
(1769, 2773 /*Cracked Shortbow*/, 1.42068, 1, 1);

-- Moonrage Watcher (1892)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(1892, 2318 /*Light Leather*/, 60, 1, 1, 1),
(1892, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(1892, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=1892 WHERE `entry`=1892;

-- Moonrage Sentry (1893)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(1893, 2318 /*Light Leather*/, 60, 1, 1, 1),
(1893, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(1893, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=1893 WHERE `entry`=1893;

-- Moonrage Elder (1896)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(1896, 2318 /*Light Leather*/, 60, 1, 1, 1),
(1896, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(1896, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=1896 WHERE `entry`=1896;

-- Shadowclaw (2175)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2175, 9755 /*Gypsy Gloves*/, 5.43131, 1, 1);

-- Vile Sprite (2189)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2189, 2648 /*Loose Chain Vest*/, 0.2114, 1, 1);

-- Syndicate Thief (2241)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2241, 17124 /*Syndicate Emblem*/, 0.0814459, 1, 1);

-- Enraged Stanley (2275)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(2275, 783 /*Light Hide*/, 50, 1, 1, 1),
(2275, 2319 /*Medium Leather*/, 50, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=2275 WHERE `entry`=2275;

-- Giant Foreststrider (2323)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2323, 7288 /*Pattern: Rugged Leather Pants*/, 0.00732815, 1, 1);

-- Yenniku (2530)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2530, 4016 /*Zanzil's Mixture*/, -43, 1, 1);

-- Maury "Club Foot" Wilkins (2535)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2535, 4016 /*Zanzil's Mixture*/, -26, 1, 1);

-- Chucky "Ten Thumbs" (2537)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2537, 6530 /*Nightcrawlers*/, 18.5964, 1, 1);

-- Dagun the Ravenous (2937)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2937, 3358 /*Khadgar's Whisker*/, 5, 1, 1);

-- Windfury Matriarch (2965)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(2965, 1412 /*Crude Bastard Sword*/, 0.347385, 1, 1),
(2965, 1417 /*Beaten Battle Axe*/, 0.3067, 1, 1),
(2965, 2773 /*Cracked Shortbow*/, 0.38807, 1, 1);

-- Ghost Howl (3056)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3056, 6716 /*Schematic: EZ-Thro Dynamite*/, 0.02, 1, 1);

-- Dustwind Storm Witch (3118)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3118, 1414 /*Cracked Sledge*/, 0.434879, 1, 1);

-- Razormane Water Seeker (3267)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3267, 1416 /*Rusty Hatchet*/, 0.566217, 1, 1),
(3267, 1427 /*Patchwork Shoes*/, 0.362053, 1, 1),
(3267, 1431 /*Patchwork Pants*/, 0.440996, 1, 1);

-- Razormane Thornweaver (3268)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3268, 1433 /*Patchwork Armor*/, 0.399843, 1, 1),
(3268, 2212 /*Cracked Buckler*/, 0.310368, 1, 1);

-- Moonrage Armorer (3529)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3529, 2318 /*Light Leather*/, 60, 1, 1, 1),
(3529, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(3529, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=3529 WHERE `entry`=3529;

-- Moonrage Tailor (3531)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3531, 2318 /*Light Leather*/, 60, 1, 1, 1),
(3531, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(3531, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=3531 WHERE `entry`=3531;

-- Moonrage Leatherworker (3533)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3533, 2318 /*Light Leather*/, 60, 1, 1, 1),
(3533, 2934 /*Ruined Leather Scraps*/, 35, 1, 1, 1),
(3533, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=3533 WHERE `entry`=3533;

-- Kresh (3653)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3653, 14367 /*Mystic's Gloves*/, 0.253635, 1, 1);

-- Mutanus the Devourer (3654)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3654, 1795 /*Rawhide Belt*/, 1, 1, 1),
(3654, 9812 /*Fortified Cloak*/, 2.33888, 1, 1);

-- Lord Pythas (3670)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3670, 15506 /*Grunt's AnkleWraps*/, 1, 1, 1);

-- Lady Anacondra (3671)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3671, 1741 /*Laced Cloak*/, 0.195722, 1, 1);

-- Razorclaw the Butcher (3886)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3886, 3193 /*Oak Mallet*/, 33.3333, 1, 1);

-- Baron Silverlaine (3887)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3887, 1822 /*Cedar Walking Stick*/, 0.310454, 1, 1),
(3887, 9792 /*Ivycloth Boots*/, 0.492677, 1, 1);

-- Rethilgore (3914)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3914, 1815 /*Ornamental Mace*/, 0.742477, 1, 1),
(3914, 6575 /*Defender Cloak*/, 0.244236, 1, 1);

-- Wolf Master Nandos (3927)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3927, 9816 /*Fortified Shield*/, 16.6667, 1, 1);

-- Houndmaster Loksey (3974)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3974, 1708 /*Sweet Nectar*/, 1.26215, 1, 1),
(3974, 7417 /*Phalanx Boots*/, 0.0422731, 1, 1);

-- Herod (3975)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3975, 3811 /*Double-stitched Cloak*/, 0.0616631, 1, 1);

-- Interrogator Vishas (3983)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(3983, 3797 /*Interlaced Pants*/, 0.163132, 1, 1),
(3983, 4338 /*Mageweave Cloth*/, 0.815661, 2, 2),
(3983, 6389 /*Glimmering Mail Coif*/, 0.0233046, 1, 1);

-- Dark Iron Bombardier (4062)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4062, 5108 /*Dark Iron Leather*/, 4.41213, 1, 1);

-- Archmage Arugal (4275)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4275, 1758 /*Reinforced Chain Gloves*/, 0.12, 1, 1),
(4275, 1826 /*Rock Maul*/, 0.309191, 1, 1),
(4275, 3385 /*Lesser Mana Potion*/, 51.5189, 1, 4),
(4275, 9794 /*Ivycloth Cloak*/, 0.12, 1, 1);

-- Commander Springvale (4278)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4278, 2220 /*Box Shield*/, 0.195299, 1, 1),
(4278, 9773 /*Greenweave Robe*/, 0.753296, 1, 1);

-- Odo the Blindwatcher (4279)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4279, 2782 /*Mishandled Recurve Bow*/, 0.319791, 1, 1);

-- Bloodfen Lashtail (4357)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4357, 7992 /*Plans: Blue Glittering Axe*/, 5.26316, 1, 1);

-- Strashaz Serpent Guard (4366)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4366, 10308 /*Scroll of Intellect IV*/, 5, 1, 1);

-- Strashaz Siren (4371)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4371, 10305 /*Scroll of Protection IV*/, 5, 1, 1);

-- Darkfang Lurker (4411)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4411, 3866 /*Plans: Jade Serpentblade*/, 2.85714, 1, 1);

-- Aggem Thorncurse (4424)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4424, 6610 /*Sage's Robe*/, 0.565463, 1, 1);

-- Death Speaker Jargba (4428)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4428, 5007 /*Band of Thorns*/, 1, 1, 1);

-- Frostmaw (4504)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(4504, 4234 /*Heavy Leather*/, 60, 1, 1, 1),
(4504, 4304 /*Thick Leather*/, 40, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=4504 WHERE `entry`=4504;

-- Mage Hunter (4681)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4681, 4352 /*Pattern: Boots of the Enchanter*/, 5, 1, 1);

-- Aku'mai (4829)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(4829, 15340 /*Pathfinder Cloak*/, 0.112461, 1, 1);

-- Shade of Eranikus (5709)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5709, 10148 /*Mighty Cloak*/, 1, 1, 1);

-- Hukku (5715)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5715, 10073 /*Righteous Helmet*/, 0.0766479, 1, 1);

-- Weaver (5720)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5720, 4557 /*Fiery Gland*/, 6.62393, 1, 1);

-- Enforcer Emilgund (5787)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5787, 6513 /*Disciple's Sash*/, 2.25734, 1, 1);

-- Felweaver Scornn (5822)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5822, 9744 /*Simple Bands*/, 2.29592, 1, 1);

-- Captain Flat Tusk (5824)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(5824, 6509 /*Infantry Belt*/, 3.16302, 1, 1);

-- Ironspine (6489)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(6489, 9836 /*Banded Armor*/, 0.295983, 1, 1);

-- Revelosh (6910)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(6910, 2289 /*Scroll of Strength II*/, 0.12, 1, 1);

-- Witch Doctor Zum'rah (7271)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(7271, 4019 /*Heavy Flint Axe*/, 0.231513, 1, 1),
(7271, 7540 /*Champion's Helmet*/, 0.526579, 1, 1),
(7271, 9913 /*Royal Gown*/, 0.272368, 1, 1),
(7271, 9960 /*Warmonger's Gauntlets*/, 0.671842, 1, 1),
(7271, 10090 /*Gothic Plate Helmet*/, 1.20296, 1, 1),
(7271, 10206 /*Overlord's Girdle*/, 0.299605, 1, 1);

-- Zul'Farrak Zombie (7286)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(7286, 3869 /*Plans: Shadow Crescent Axe*/, 0.00594948, 1, 1);

-- Grubbis (7361)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(7361, 7422 /*Phalanx Girdle*/, 2.75634, 1, 1);

-- Mekgineer Thermaplugg (7800)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(7800, 4371 /*Bronze Tube*/, 0.504756, 2, 2),
(7800, 9836 /*Banded Armor*/, 1.20365, 1, 1),
(7800, 9871 /*Renegade Leggings*/, 0.407688, 1, 1);

-- Lurking Feral Scar (7848)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(7848, 4304 /*Thick Leather*/, 78, 1, 1, 1),
(7848, 8170 /*Rugged Leather*/, 20, 1, 1, 1),
(7848, 8169 /*Thick Hide*/, 2, 1, 1, 1),
(7848, 18947 /*Rage Scar Yeti Hide*/, 7, 0, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=7848 WHERE `entry`=7848;

-- Muck Frenzy (8236)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(8236, 6342 /*Formula: Enchant Chest - Minor Mana*/, 9.09091, 1, 1);

-- High Interrogator Gerstahn (9018)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9018, 3973 /*Smooth Leather Gloves*/, 16.6667, 1, 1),
(9018, 8754 /*Twill Cover*/, 16.6667, 1, 1);

-- Hedrum the Creeper (9032)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9032, 10108 /*Wanderer's Cloak*/, 0.14, 1, 1);

-- Ambassador Flamelash (9156)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9156, 8766 /*Morning Glory Dew*/, 0.791699, 1, 1);

-- Highlord Omokk (9196)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9196, 8766 /*Morning Glory Dew*/, 0.647359, 1, 1);

-- Shadow Hunter Vosh'gajin (9236)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9236, 3975 /*Smooth Leather Shoulderpads*/, 12.5, 1, 1),
(9236, 10279 /*Emerald Helm*/, 12.5, 1, 1);

-- Smolderthorn Seer (9269)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9269, 10144 /*High Councillor's Sash*/, 5.26316, 1, 1);

-- Plugger Spazzring (9499)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9499, 10099 /*Councillor's Gloves*/, 0.753962, 1, 1);

-- Hurley Blackbreath (9537)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9537, 3975 /*Smooth Leather Shoulderpads*/, 0.13, 1, 1);

-- Ribbly Screwspigot (9543)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9543, 10098 /*Councillor's Cloak*/, 1, 1, 1);

-- Overlord Wyrmthalak (9568)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9568, 10138 /*High Councillor's Cloak*/, 1.22324, 1, 1),
(9568, 10210 /*Elegant Mantle*/, 2.32416, 1, 1),
(9568, 10219 /*Elegant Circlet*/, 2.263, 1, 1);

-- Lar'korwi Mate (9683)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(9683, 4304 /*Thick Leather*/, 78, 1, 1, 1),
(9683, 8170 /*Rugged Leather*/, 19, 1, 1, 1),
(9683, 8169 /*Thick Hide*/, 3, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=9683 WHERE `entry`=9683;

-- Quartermaster Zigris (9736)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9736, 13247 /*Quartermaster Zigris' Footlocker*/, 12.4312, 1, 1);

-- Pyroguard Emberseer (9816)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(9816, 10374 /*Imbued Plate Pauldrons*/, 0.0334681, 1, 1);

-- Bayne (10356)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10356, 6509 /*Infantry Belt*/, 4.36187, 1, 1),
(10356, 6513 /*Disciple's Sash*/, 7.75444, 1, 1);

-- Ressan the Needler (10357)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(10357, 2318 /*Light Leather*/, 70, 1, 1, 2),
(10357, 2934 /*Ruined Leather Scraps*/, 25, 1, 1, 1),
(10357, 783 /*Light Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=10357 WHERE `entry`=10357;

-- General Drakkisath (10363)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10363, 8952 /*Roasted Quail*/, 20, 1, 1),
(10363, 10251 /*Master's Gloves*/, 0.290416, 1, 1),
(10363, 10382 /*Commander's Leggings*/, 1.13746, 1, 1);

-- Skeletal Berserker (10391)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(10391, 12840 /*Minion's Scourgestone*/, 50, 1, 1, 17);

-- Crimson Guardsman (10418)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10418, 10210 /*Elegant Mantle*/, 0.0412005, 1, 1);

-- The Beast (10430)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10430, 15943 /*Imbued Shield*/, 0.14, 1, 1);

-- Magistrate Barthilas (10435)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(10435, 3990 /*Crested Buckler*/, 20, 1, 1, 0),
(10435, 3997 /*Laminated Scale Pants*/, 20, 1, 1, 0),
(10435, 20400 /*Pumpkin Bag*/, 20, 1, 1, 108);

-- Baroness Anastari (10436)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10436, 13446 /*Major Healing Potion*/, 0.476054, 1, 1);

-- Risen Aberration (10485)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10485, 10228 /*Nightshade Spaulders*/, 0.00568844, 1, 1);

-- Kirtonos the Herald (10506)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10506, 10258 /*Adventurer's Cape*/, 0.744019, 1, 1);

-- The Unforgiven (10516)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10516, 3946 /*Twill Bracers*/, 33.3333, 1, 1);

-- Archivist Galford (10811)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10811, 8932 /*Alterac Swiss*/, 1.56606, 1, 1),
(10811, 13817 /*Tapered Greatsword*/, 25, 1, 1);

-- Arikara (10882)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10882, 6826 /*Brilliant Scale*/, 17.4206, 1, 1);

-- Goraluk Anvilcrack (10899)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(10899, 8952 /*Roasted Quail*/, 0.6, 1, 1);

-- Alterac Ram (10990)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(10990, 4304 /*Thick Leather*/, 76, 1, 1, 1),
(10990, 8170 /*Rugged Leather*/, 21, 1, 1, 1),
(10990, 8169 /*Thick Hide*/, 3, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=10990 WHERE `entry`=10990;

-- Doctor Theolen Krastinov (11261)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(11261, 13444 /*Major Mana Potion*/, 16.6667, 1, 1);

-- Gurubashi Headhunter (11351)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(11351, 14557 /*The Lion Horn of Stormwind*/, 0.02, 1, 1);

-- Magister Kalendris (11487)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(11487, 3970 /*Smooth Leather Boots*/, 66.6667, 1, 1),
(11487, 8948 /*Dried King Bolete*/, 1, 1, 1);

-- Jergosh the Invoker (11518)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(11518, 2764 /*Small Dagger*/, 0.498351, 1, 1);

-- Stormpike Defender (12050)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12050, 17326 /*Stormpike Soldier's Flesh*/, 32, 1, 1);

-- Stormpike Guardsman (12127)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12127, 17326 /*Stormpike Soldier's Flesh*/, 32.1784, 1, 1),
(12127, 17327 /*Stormpike Lieutenant's Flesh*/, 16.3426, 1, 1);

-- Princess Theradras (12201)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12201, 10061 /*Duskwoven Turban*/, 1.25081, 1, 1),
(12201, 10072 /*Righteous Gloves*/, 1.27811, 1, 1),
(12201, 10128 /*Revenant Chestplate*/, 0.26803, 1, 1),
(12201, 10171 /*Templar Bracers*/, 0.263067, 1, 1);

-- Razorlash (12258)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12258, 14446 /*Venomshroud Belt*/, 1, 1, 1),
(12258, 14662 /*Keeper's Hooves*/, 1, 1, 1);

-- Lord Kazzak (12397)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12397, 10250 /*Master's Hat*/, 4.11215, 1, 1),
(12397, 10273 /*Masterwork Legplates*/, 3.80062, 1, 1);

-- Gorefang (12431)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12431, 9743 /*Simple Shoes*/, 4.12486, 1, 1);

-- Vorsha the Lasher (12940)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(12940, 2319 /*Medium Leather*/, 48, 1, 1, 1),
(12940, 2318 /*Light Leather*/, 44, 1, 1, 2),
(12940, 4232 /*Medium Hide*/, 6, 1, 1, 1),
(12940, 783 /*Light Hide*/, 2, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=12940 WHERE `entry`=12940;

-- Kolkar Waylayer (12976)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(12976, 3020 /*Enduring Cap*/, 5.88235, 1, 1);

-- Wing Commander Mulverick (13181)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(13181, 17503 /*Frostwolf Lieutenant's Medal*/, 100, 1, 1);

-- Lieutenant Largent (13296)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(13296, 17328 /*Stormpike Commander's Flesh*/, 19.2296, 1, 1);

-- Frostwolf Bowman (13359)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(13359, 17502 /*Frostwolf Soldier's Medal*/, 31, 1, 1);

-- Tinkerer Gizlock (13601)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(13601, 9061 /*Goblin Rocket Fuel*/, 0.35572, 1, 1),
(13601, 10561 /*Mithril Casing*/, 2.14979, 1, 1);

-- Mountaineer Boombellow (13797)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(13797, 17328 /*Stormpike Commander's Flesh*/, 20, 1, 1);

-- Big Samras (14280)
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(14280, 2319 /*Medium Leather*/, 60, 1, 1, 1),
(14280, 4234 /*Heavy Leather*/, 35, 1, 1, 1),
(14280, 4235 /*Heavy Hide*/, 5, 1, 1, 1);
UPDATE `creature_template` SET `skinning_loot_id`=14280 WHERE `entry`=14280;

-- Guard Fengus (14321)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(14321, 8952 /*Roasted Quail*/, 3.55791, 1, 1);

-- Lethtendris (14327)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(14327, 7910 /*Star Ruby*/, 0.202634, 1, 1);

-- Grimmaw (14429)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(14429, 1516 /*Worn Hatchet*/, 0.767263, 1, 1),
(14429, 6337 /*Infantry Leggings*/, 2.17391, 1, 1),
(14429, 6513 /*Disciple's Sash*/, 3, 1, 1);

-- Sever (14682)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(14682, 1751 /*Linked Chain Pants*/, 20, 1, 1),
(14682, 4709 /*Forest Leather Mantle*/, 20, 1, 1);

-- Lady Falther'ess (14686)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(14686, 3783 /*Light Scimitar*/, 33.3333, 1, 1),
(14686, 15978 /*Geomancer's Rod*/, 33.3333, 1, 1);

-- Mad Servant (15111)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15111, 15757 /*Pattern: Wicked Leather Pants*/, 0.00550995, 1, 1);

-- Ossirian the Unscarred (15339)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15339, 20884 /*Qiraji Magisterial Ring*/, 9.57583, 1, 1);

-- Minor Anubisath Warbringer (15807)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15807, 791 /*Gnarled Ash Staff*/, 5.55556, 1, 1);

-- Minor Silithid Flayer (15808)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15808, 6661 /*Recipe: Savory Deviate Delight*/, 1.36986, 1, 1);

-- Eroded Anubisath Warbringer (15810)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15810, 1121 /*Feet of the Lynx*/, 1.92308, 1, 1),
(15810, 2256 /*Skeletal Club*/, 1.92308, 1, 1),
(15810, 9766 /*Greenweave Sash*/, 3.84615, 1, 1),
(15810, 9767 /*Greenweave Sandals*/, 1.92308, 1, 1),
(15810, 9771 /*Greenweave Gloves*/, 0.787402, 1, 1),
(15810, 12988 /*Starsight Tunic*/, 1.92308, 1, 1),
(15810, 12990 /*Razor's Edge*/, 1.92308, 1, 1),
(15810, 12998 /*Magician's Mantle*/, 1.92308, 1, 1);

-- Faltering Silithid Flayer (15811)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15811, 14099 /*Native Sash*/, 0.735294, 1, 1),
(15811, 14115 /*Aboriginal Bands*/, 0.735294, 1, 1);

-- Qiraji Officer (15812)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15812, 9772 /*Greenweave Leggings*/, 4.54545, 1, 1);

-- Naxxramas Cultist (15980)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(15980, 14499 /*Pattern: Mooncloth Bag*/, 0.00833646, 1, 1),
(15980, 19264 /*Seven of Warlords*/, 0.0166729, 1, 1);

-- Risen Deathknight (16154)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(16154, 16251 /*Formula: Enchant Bracer - Superior Stamina*/, 0.106707, 1, 1);

-- Deathknight Vindicator (16451)
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `mincountOrRef`, `maxcount`) VALUES
(16451, 22708 /*Fate of Ramaladni*/, -0.123153, 1, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
