DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220224200448');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220224200448');
-- Add your query below.


-- STV
-- https://classic.wowhead.com/npc=588/bloodscalp-scout
-- https://classic.wowhead.com/npc=595/bloodscalp-hunter
-- https://classic.wowhead.com/npc=701/bloodscalp-mystic
UPDATE `creature` SET `id2` = 595, `id3` = 701 WHERE `id` = 588;
UPDATE `creature` SET `id2` = 588, `id3` = 701 WHERE `id` = 595;
UPDATE `creature` SET `id2` = 588, `id3` = 595 WHERE `id` = 701;

-- https://classic.wowhead.com/npc=597/bloodscalp-berserker
-- https://classic.wowhead.com/npc=660/bloodscalp-witch-doctor
-- https://classic.wowhead.com/npc=671/bloodscalp-headhunter
UPDATE `creature` SET `id2` = 660, `id3` = 671 WHERE `id` = 597;
UPDATE `creature` SET `id2` = 597, `id3` = 671 WHERE `id` = 660;
UPDATE `creature` SET `id2` = 597, `id3` = 660 WHERE `id` = 671;

-- https://classic.wowhead.com/npc=587/bloodscalp-warrior
-- https://classic.wowhead.com/npc=694/bloodscalp-axe-thrower
-- https://classic.wowhead.com/npc=697/bloodscalp-shaman
UPDATE `creature` SET `id2` = 694, `id3` = 697 WHERE `id` = 587;
UPDATE `creature` SET `id2` = 587, `id3` = 697 WHERE `id` = 694;
UPDATE `creature` SET `id2` = 587, `id3` = 694 WHERE `id` = 697;

-- https://classic.wowhead.com/npc=4457/murkgill-forager
-- https://classic.wowhead.com/npc=4458/murkgill-hunter
-- https://classic.wowhead.com/npc=4461/murkgill-warrior
UPDATE `creature` SET `id2` = 4458, `id3` = 4461 WHERE `id` = 4457;
UPDATE `creature` SET `id2` = 4457, `id3` = 4461 WHERE `id` = 4458;
UPDATE `creature` SET `id2` = 4457, `id3` = 4458 WHERE `id` = 4461;

-- https://classic.wowhead.com/npc=4458/murkgill-hunter
-- https://classic.wowhead.com/npc=4459/murkgill-oracle
-- https://classic.wowhead.com/npc=4460/murkgill-lord
-- https://classic.wowhead.com/npc=4461/murkgill-warrior
UPDATE `creature` SET `id2` = 4458, `id3` = 4460, `id4` = 4461 WHERE `id` = 4459;
UPDATE `creature` SET `id2` = 4458, `id3` = 4459, `id4` = 4461 WHERE `id` = 4460;

-- https://classic.wowhead.com/npc=1142/moshogg-brute
-- https://classic.wowhead.com/npc=1144/moshogg-witch-doctor
UPDATE `creature` SET `id2` = 1144 WHERE `id` = 1142;
UPDATE `creature` SET `id2` = 1142 WHERE `id` = 1144;

-- https://classic.wowhead.com/npc=937/kurzen-jungle-fighter
-- https://classic.wowhead.com/npc=940/kurzen-medicine-man
UPDATE `creature` SET `id2` = 940 WHERE `id` = 937;
UPDATE `creature` SET `id2` = 937 WHERE `id` = 940;

-- https://classic.wowhead.com/npc=667/skullsplitter-warrior
-- https://classic.wowhead.com/npc=696/skullsplitter-axe-thrower
-- https://classic.wowhead.com/npc=780/skullsplitter-mystic
UPDATE `creature` SET `id2` = 696, `id3` = 780 WHERE `id` = 667;
UPDATE `creature` SET `id2` = 667, `id3` = 780 WHERE `id` = 696;
UPDATE `creature` SET `id2` = 667, `id3` = 696 WHERE `id` = 780;

-- https://classic.wowhead.com/npc=669/skullsplitter-hunter
-- https://classic.wowhead.com/npc=670/skullsplitter-witch-doctor
-- https://classic.wowhead.com/npc=782/skullsplitter-scout
-- https://classic.wowhead.com/npc=784/skullsplitter-beastmaster
UPDATE `creature` SET `id2` = 670, `id3` = 782, `id4` = 784 WHERE `id` = 669;
UPDATE `creature` SET `id2` = 669, `id3` = 782, `id4` = 784 WHERE `id` = 670;
UPDATE `creature` SET `id2` = 669, `id3` = 670, `id4` = 784 WHERE `id` = 782;
UPDATE `creature` SET `id2` = 669, `id3` = 670, `id4` = 782 WHERE `id` = 784;

-- https://classic.wowhead.com/npc=1488/zanzil-zombie
-- https://classic.wowhead.com/npc=1489/zanzil-hunter
-- https://classic.wowhead.com/npc=1490/zanzil-witch-doctor
-- https://classic.wowhead.com/npc=1491/zanzil-naga
UPDATE `creature` SET `id2` = 1489, `id3` = 1490, `id4` = 1491 WHERE `id` = 1488;
UPDATE `creature` SET `id2` = 1488, `id3` = 1490, `id4` = 1491 WHERE `id` = 1489;
UPDATE `creature` SET `id2` = 1488, `id3` = 1489, `id4` = 1491 WHERE `id` = 1490;
UPDATE `creature` SET `id2` = 1488, `id3` = 1489, `id4` = 1490 WHERE `id` = 1491;

-- https://classic.wowhead.com/npc=1565/bloodsail-sea-dog
-- https://classic.wowhead.com/npc=1653/bloodsail-elder-magus
UPDATE `creature` SET `id2` = 1653 WHERE `id` = 1565;
UPDATE `creature` SET `id2` = 1565 WHERE `id` = 1653;

-- https://classic.wowhead.com/npc=1563/bloodsail-swashbuckler
-- https://classic.wowhead.com/npc=1564/bloodsail-warlock
UPDATE `creature` SET `id2` = 1564 WHERE `id` = 1563;
UPDATE `creature` SET `id2` = 1563 WHERE `id` = 1564;

-- https://classic.wowhead.com/npc=1561/bloodsail-raider
-- https://classic.wowhead.com/npc=1562/bloodsail-mage
UPDATE `creature` SET `id2` = 1562 WHERE `id` = 1561;
UPDATE `creature` SET `id2` = 1561 WHERE `id` = 1562;

-- https://classic.wowhead.com/npc=675/venture-co-foreman
-- https://classic.wowhead.com/npc=676/venture-co-surveyor
-- https://classic.wowhead.com/npc=677/venture-co-tinkerer
UPDATE `creature` SET `id2` = 676, `id3` = 677 WHERE `id` = 675;
UPDATE `creature` SET `id2` = 675, `id3` = 677 WHERE `id` = 676;
UPDATE `creature` SET `id2` = 675, `id3` = 676 WHERE `id` = 677;

-- ----------------------------------------------------------------------

-- DARKSHORE
-- https://classic.wowhead.com/npc=2207/greymist-oracle
-- https://classic.wowhead.com/npc=2208/greymist-tidehunter
UPDATE `creature` SET `id2` = 2208 WHERE `id` = 2207;
UPDATE `creature` SET `id2` = 2207 WHERE `id` = 2208;

-- Greymist Hunter Can Be Greymist Warrior
-- https://classic.wowhead.com/npc=2206/greymist-hunter
UPDATE `creature` SET `id` = 2206 WHERE `guid` IN (
37981,
37985,
37984,
37986,
37982
);
UPDATE `creature` SET `id2` = 2205 WHERE `id` = 2206;

-- Greymist Netter Can Be Greymist Seer
-- https://classic.wowhead.com/npc=2204/greymist-netter
UPDATE `creature` SET `id` = 2204 WHERE `guid` IN (
37966,
37951,
37967,
37968
);
UPDATE `creature` SET `id2` = 2203 WHERE `guid` IN (
37972,
37973,
37974
);

-- Greymist Coastrunner Can Be Greymist Seer
-- https://classic.wowhead.com/npc=2202/greymist-coastrunner
UPDATE `creature` SET `id2` = 2202 WHERE `guid` IN (
37964,
37965,
37959,
37957,
37958,
37955,
37963,
37953,
37948,
37945,
37949,
37960,
37947,
37946,
37950,
37952,
37961,
37962
);
UPDATE `creature` SET `id2` = 2203 WHERE `guid` IN (
37855,
37856,
37857,
37858,
37859,
37860,
37861,
37863,
37864,
37866,
37867,
37930,
37931,
37932,
37933,
37934,
37935,
37936,
37941,
37942,
37943,
37944
);

-- Greymist Raider Can Be Greymist Coastrunner
-- https://classic.wowhead.com/npc=2201/greymist-raider
UPDATE `creature` SET `id` = 2201 WHERE `guid` IN (
37862,
37937,
37938,
37940,
37939
);
UPDATE `creature` SET `id2` = 2202 WHERE `id` = 2201;

-- Mixed Greymist Spawns
UPDATE `creature` SET `id` = 2205, `id2` = 2204 WHERE `guid` IN (
37977,
37978,
37969,
37976,
37983,
37970,
37979
);

-- https://classic.wowhead.com/npc=2338/twilight-disciple
-- https://classic.wowhead.com/npc=2339/twilight-thug
UPDATE `creature` SET `id2` = 2339 WHERE `id` = 2338;
UPDATE `creature` SET `id2` = 2338 WHERE `guid` IN (
37016,
37017,
37020,
37021,
37024,
37025,
37026,
37027,
37028,
37040,
37044,
37045
);

-- ----------------------------------------------------------------------

-- TELDRASIL
-- https://classic.wowhead.com/npc=2015/bloodfeather-harpy
-- https://classic.wowhead.com/npc=2017/bloodfeather-rogue
-- https://classic.wowhead.com/npc=2018/bloodfeather-sorceress
UPDATE `creature` SET `id2` = 2017, `id3` = 2018 WHERE `id` = 2015;
UPDATE `creature` SET `id2` = 2015, `id3` = 2018 WHERE `id` = 2017;
UPDATE `creature` SET `id2` = 2015, `id3` = 2017 WHERE `id` = 2018;

-- https://classic.wowhead.com/npc=2019/bloodfeather-fury
-- https://classic.wowhead.com/npc=2020/bloodfeather-wind-witch
-- https://classic.wowhead.com/npc=2021/bloodfeather-matriarch
UPDATE `creature` SET `id2` = 2020, `id3` = 2021 WHERE `id` = 2019;
UPDATE `creature` SET `id2` = 2019, `id3` = 2021 WHERE `id` = 2020;
UPDATE `creature` SET `id2` = 2019, `id3` = 2020 WHERE `id` = 2021;

-- https://classic.wowhead.com/npc=2009/gnarlpine-shaman
-- https://classic.wowhead.com/npc=2010/gnarlpine-defender
UPDATE `creature` SET `id2` = 2010 WHERE `id` = 2009;
UPDATE `creature` SET `id2` = 2009 WHERE `id` = 2010;

-- https://classic.wowhead.com/npc=2012/gnarlpine-pathfinder
-- https://classic.wowhead.com/npc=2013/gnarlpine-avenger
UPDATE `creature` SET `id2` = 2013 WHERE `id` = 2012;
UPDATE `creature` SET `id2` = 2012 WHERE `id` = 2013;

-- ----------------------------------------------------------------------

-- AZSHARA
-- https://classic.wowhead.com/npc=6116/highborne-apparition
-- https://classic.wowhead.com/npc=6117/highborne-lichling
UPDATE `creature` SET `id2` = 6117 WHERE `id` = 6116;
UPDATE `creature` SET `id2` = 6116 WHERE `id` = 6117;

-- https://classic.wowhead.com/npc=6125/haldarr-satyr
-- https://classic.wowhead.com/npc=6126/haldarr-trickster
-- https://classic.wowhead.com/npc=6127/haldarr-felsworn
UPDATE `creature` SET `id2` = 6126, `id3` = 6127 WHERE `id` = 6125;
UPDATE `creature` SET `id2` = 6125, `id3` = 6127 WHERE `id` = 6126;
UPDATE `creature` SET `id2` = 6125, `id3` = 6126 WHERE `id` = 6127;

-- https://classic.wowhead.com/npc=6190/spitelash-warrior
-- https://classic.wowhead.com/npc=6193/spitelash-screamer
UPDATE `creature` SET `id2` = 6193 WHERE `id` = 6190;
UPDATE `creature` SET `id2` = 6190 WHERE `id` = 6193;

-- Spitelash Serpent Guard Can Be Spitelash Siren
-- https://classic.wowhead.com/npc=6194/spitelash-serpent-guard
UPDATE `creature` SET `id` = 6194 WHERE `guid` IN (
35439,
35453,
35447,
35443,
35463,
35481,
35464,
35431,
35482,
35449,
35421,
35420,
35473,
35469,
35423,
35430,
35461,
35468,
35465,
35424,
35428,
35487,
35462,
35455,
35467,
35484,
35440,
35486,
35457,
35459,
35432,
35479,
35419,
35416
);
UPDATE `creature` SET `id2` = 6195 WHERE `id` = 6194;

-- Spitelash Myrmidon Guard Can Be Spitelash Siren
-- https://classic.wowhead.com/npc=6196/spitelash-myrmidon
UPDATE `creature` SET `id` = 6196 WHERE `guid` IN (
35494,
35475,
35438,
35446,
35496,
35472,
35437,
35501,
35499,
35497,
35500,
35433,
35489,
35488,
35490,
35456,
35491,
35425,
35503,
35422,
35477,
35471,
35483,
35454,
35478,
35480,
35451,
35441,
35474,
35448,
35452,
35470,
35429,
35507,
35485,
35458,
35450,
35442,
35498,
35495,
35434,
35460,
35492,
35493,
35506,
35445,
35504,
35502,
35476
);
UPDATE `creature` SET `id2` = 6195 WHERE `id` = 6196;

-- https://classic.wowhead.com/npc=7885/spitelash-battlemaster
-- https://classic.wowhead.com/npc=7886/spitelash-enchantress
UPDATE `creature` SET `id2` = 7886 WHERE `id` = 7885;
UPDATE `creature` SET `id2` = 7885 WHERE `id` = 7886;

-- Timbermaw Totemic Can Be Timbermaw Warrior
-- https://classic.wowhead.com/npc=6186/timbermaw-totemic
UPDATE `creature` SET `id` = 6186, `movement_type` = 1, `wander_distance` = 1  WHERE `guid` IN (
35226,
35214,
35232
);
UPDATE `creature` SET `id2` = 6185 WHERE `id` = 6186;

-- Add Missing Timbermaw Spawns
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(35224, 6186, 6185, 0, 0, 1, 3978.12, -5035.42, 136.33, 2.74885, 333, 333, 1, 100, 100, 1, 0, 0, 0, 10),
(35229, 6186, 6185, 0, 0, 1, 3948.55, -5018.79, 138.09, 0.722561, 333, 333, 1, 100, 100, 1, 0, 0, 0, 10),
(35239, 6186, 6185, 0, 0, 1, 3962.61, -5023.06, 137.442, 5.67093, 333, 333, 1, 100, 100, 1, 0, 0, 0, 10),
(35240, 6186, 6185, 0, 0, 1, 3967.71, -5029.17, 136.693, 3.59627, 333, 333, 1, 100, 100, 1, 0, 0, 0, 10),
(35243, 6186, 6185, 0, 0, 1, 3964.08, -5039.61, 137.109, 3.15164, 333, 333, 1, 100, 100, 1, 0, 0, 0, 10);
DELETE FROM `creature` WHERE `guid` = 35198;

-- Timbermaw Pathfinder Can Be Timbermaw Warrior
-- https://classic.wowhead.com/npc=6184/timbermaw-pathfinder
UPDATE `creature` SET `id` = 6184 WHERE `guid` IN (
35213,
35212,
35209,
35208,
35207,
35227,
35218,
35217
);
UPDATE `creature` SET `id2` = 6185 WHERE `id` = 6184;

-- Add Missing Timbermaw Spawns
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(35245, 6184, 6185, 0, 0, 1, 3947.23, -5049.63, 133.611, 3.15227, 333, 333, 3, 100, 0, 1, 0, 0, 0, 10),
(35246, 6184, 6185, 0, 0, 1, 4020.5, -5046.54, 132.482, 3.9683, 333, 333, 3, 100, 0, 1, 0, 0, 0, 10),
(35418, 6184, 6185, 0, 0, 1, 3983.16, -5049.67, 135.471, 0.0991868, 333, 333, 3, 100, 0, 1, 0, 0, 0, 10),
(35868, 6184, 6185, 0, 0, 1, 3917.41, -5016.51, 141.021, 0.559616, 333, 333, 3, 100, 0, 1, 0, 0, 0, 10),
(35869, 6184, 6185, 0, 0, 1, 3914.86, -4980.88, 142.913, 4.33968, 333, 333, 3, 100, 0, 1, 0, 0, 0, 10);

-- https://classic.wowhead.com/npc=6198/blood-elf-surveyor
-- https://classic.wowhead.com/npc=6199/blood-elf-reclaimer
UPDATE `creature` SET `id2` = 6199 WHERE `id` = 6198;
UPDATE `creature` SET `id2` = 6198 WHERE `id` = 6199;

-- https://classic.wowhead.com/npc=6200/legashi-satyr
-- https://classic.wowhead.com/npc=6201/legashi-rogue
-- https://classic.wowhead.com/npc=6202/legashi-hellcaller
UPDATE `creature` SET `id2` = 6201, `id3` = 6202 WHERE `id` = 6200;
UPDATE `creature` SET `id2` = 6200, `id3` = 6202 WHERE `id` = 6201;
UPDATE `creature` SET `id2` = 6200, `id3` = 6201 WHERE `id` = 6202;

-- Timbermaw Ursa Can Be Timbermaw Shaman
-- https://classic.wowhead.com/npc=6189/timbermaw-ursa
UPDATE `creature` SET `id` = 6189 WHERE `guid` IN (
35280,
35293,
35286,
35284,
35291,
35285,
35292,
35279,
35268,
35273,
35278,
35282,
35289,
35267,
35264,
35270,
35269
);
UPDATE `creature` SET `id2` = 6188 WHERE `id` = 6189;

-- Timbermaw Den Watcher Can Be Timbermaw Shaman
-- https://classic.wowhead.com/npc=6187/timbermaw-den-watcher
UPDATE `creature` SET `id` = 6187 WHERE `guid` IN (
35283,
35271,
35275,
35294,
35274,
35265,
35288
);
UPDATE `creature` SET `id2` = 6188 WHERE `id` = 6187;

-- https://classic.wowhead.com/npc=193/blue-dragonspawn
-- https://classic.wowhead.com/npc=6131/draconic-mageweaver
UPDATE `creature` SET `id2` = 6131 WHERE `id` = 193;
UPDATE `creature` SET `id2` = 193 WHERE `guid` IN (
36413,
36419,
36420,
36422,
36423,
36429,
36430,
36431,
36432
);

-- ----------------------------------------------------------------------

-- WINTERSPRING
-- Winterfall Totemic Can Be Winterfall Den Watcher
-- https://classic.wowhead.com/npc=7441/winterfall-totemic
UPDATE `creature` SET `id2` = 7441 WHERE `guid` IN (
41038,
41040,
41039
);
UPDATE `creature` SET `id2` = 7440 WHERE `id` = 7441;

-- Winterfall Den Watcher Can Be Winterfall Shaman
-- https://classic.wowhead.com/npc=7440/winterfall-den-watcher
UPDATE `creature` SET `id2` = 7440 WHERE `guid` IN (
41030,
41034
);
UPDATE `creature` SET `id2` = 7439 WHERE `guid` IN (
41035,
41037,
41041,
41042,
41043,
41044,
41045,
41046,
41047,
41048,
41049
);

-- Winterfall Ursa Can Be Winterfall Shaman
-- https://classic.wowhead.com/npc=7438/winterfall-ursa
UPDATE `creature` SET `id` = 7438 WHERE `guid` IN (
41033,
41032,
41031
);
UPDATE `creature` SET `id2` = 7439 WHERE `guid` IN (
41017,
41019,
41020,
41022,
41023,
41024,
41025,
41026,
41027,
41028
);

-- Winterfall Den Watcher Just Outside Can Only Be Den Watcher
UPDATE `creature` SET `id2` = 0 WHERE `guid` IN (
41035,
41044,
41043,
41042,
41037,
41041
);

-- https://classic.wowhead.com/npc=7523/suffering-highborne
-- https://classic.wowhead.com/npc=7524/anguished-highborne
UPDATE `creature` SET `id2` = 7524 WHERE `id` = 7523;
UPDATE `creature` SET `id2` = 7523 WHERE `id` = 7524;

-- https://classic.wowhead.com/npc=7459/ice-thistle-matriarch
-- https://classic.wowhead.com/npc=7460/ice-thistle-patriarch
UPDATE `creature` SET `id2` = 7460 WHERE `id` = 7459;
UPDATE `creature` SET `id2` = 7459 WHERE `id` = 7460;

-- https://classic.wowhead.com/npc=7452/crazed-owlbeast
-- https://classic.wowhead.com/npc=7453/moontouched-owlbeast
-- https://classic.wowhead.com/npc=7454/berserk-owlbeast
UPDATE `creature` SET `id2` = 7453, `id3` = 7454 WHERE `id` = 7452;
UPDATE `creature` SET `id2` = 7452, `id3` = 7454 WHERE `id` = 7453;
UPDATE `creature` SET `id2` = 7452, `id3` = 7453 WHERE `id` = 7454;

-- https://classic.wowhead.com/npc=7428/frostmaul-giant
-- https://classic.wowhead.com/npc=7429/frostmaul-preserver
UPDATE `creature` SET `id2` = 7429 WHERE `id` = 7428;
UPDATE `creature` SET `id2` = 7428 WHERE `id` = 7429;

-- https://classic.wowhead.com/npc=7435/cobalt-wyrmkin
-- https://classic.wowhead.com/npc=7436/cobalt-scalebane
-- https://classic.wowhead.com/npc=7437/cobalt-mageweaver
UPDATE `creature` SET `id2` = 7436, `id3` = 7437 WHERE `id` = 7435;
UPDATE `creature` SET `id2` = 7435, `id3` = 7437 WHERE `id` = 7436;
UPDATE `creature` SET `id2` = 7435, `id3` = 7436 WHERE `id` = 7437;

-- ----------------------------------------------------------------------

-- ASHENVALE
-- https://classic.wowhead.com/npc=12474/emeraldon-boughguard
-- https://classic.wowhead.com/npc=12475/emeraldon-tree-warder
-- https://classic.wowhead.com/npc=12476/emeraldon-oracle
UPDATE `creature` SET `id2` = 12475, `id3` = 12476 WHERE `id` = 12474;
UPDATE `creature` SET `id2` = 12474, `id3` = 12476 WHERE `id` = 12475;
UPDATE `creature` SET `id2` = 12474, `id3` = 12475 WHERE `id` = 12476;

-- https://classic.wowhead.com/npc=6073/searing-infernal
-- https://classic.wowhead.com/npc=6115/felguard
-- https://classic.wowhead.com/npc=11697/mannoroc-lasher
UPDATE `creature` SET `id2` = 6115, `id3` = 11697 WHERE `id` = 6073;
UPDATE `creature` SET `id2` = 6073, `id3` = 11697 WHERE `id` = 6115;
UPDATE `creature` SET `id2` = 6073, `id3` = 6115 WHERE `id` = 11697;

-- https://classic.wowhead.com/npc=3804/forsaken-intruder
-- https://classic.wowhead.com/npc=3807/forsaken-assassin
-- https://classic.wowhead.com/npc=3808/forsaken-dark-stalker
UPDATE `creature` SET `id2` = 3807, `id3` = 3808 WHERE `id` = 3804;
UPDATE `creature` SET `id2` = 3804, `id3` = 3808 WHERE `id` = 3807;
UPDATE `creature` SET `id2` = 3804, `id3` = 3807 WHERE `id` = 3808;

-- https://classic.wowhead.com/npc=3758/felmusk-satyr
-- https://classic.wowhead.com/npc=3762/felmusk-felsworn
UPDATE `creature` SET `id2` = 3762 WHERE `id` = 3758;
UPDATE `creature` SET `id2` = 3758 WHERE `id` = 3762;

-- https://classic.wowhead.com/npc=3759/felmusk-rogue
-- https://classic.wowhead.com/npc=3763/felmusk-shadowstalker
UPDATE `creature` SET `id2` = 3763 WHERE `id` = 3759;
UPDATE `creature` SET `id2` = 3759 WHERE `id` = 3763;

-- https://classic.wowhead.com/npc=3765/bleakheart-satyr
-- https://classic.wowhead.com/npc=3771/bleakheart-hellcaller
UPDATE `creature` SET `id2` = 3771 WHERE `id` = 3765;
UPDATE `creature` SET `id2` = 3765 WHERE `id` = 3771;

-- https://classic.wowhead.com/npc=3767/bleakheart-trickster
-- https://classic.wowhead.com/npc=3770/bleakheart-shadowstalker
UPDATE `creature` SET `id2` = 3770 WHERE `id` = 3767;
UPDATE `creature` SET `id2` = 3767 WHERE `id` = 3770;

-- https://classic.wowhead.com/npc=3752/xavian-rogue
-- https://classic.wowhead.com/npc=3757/xavian-hellcaller
UPDATE `creature` SET `id2` = 3757 WHERE `id` = 3752;
UPDATE `creature` SET `id2` = 3752 WHERE `id` = 3757;

-- https://classic.wowhead.com/npc=3754/xavian-betrayer
-- https://classic.wowhead.com/npc=3755/xavian-felsworn
UPDATE `creature` SET `id2` = 3755 WHERE `id` = 3754;
UPDATE `creature` SET `id2` = 3754 WHERE `id` = 3755;

-- https://classic.wowhead.com/npc=3782/shadethicket-stone-mover
-- https://classic.wowhead.com/npc=3784/shadethicket-bark-ripper
UPDATE `creature` SET `id2` = 3784 WHERE `id` = 3782;
UPDATE `creature` SET `id2` = 3782 WHERE `id` = 3784;

-- https://classic.wowhead.com/npc=3746/foulweald-den-watcher
-- https://classic.wowhead.com/npc=3748/foulweald-shaman
-- https://classic.wowhead.com/npc=3749/foulweald-ursa
UPDATE `creature` SET `id2` = 3748, `id3` = 3749 WHERE `id` = 3746;
UPDATE `creature` SET `id2` = 3746, `id3` = 3749 WHERE `id` = 3748;
UPDATE `creature` SET `id2` = 3746, `id3` = 3748 WHERE `id` = 3749;

-- https://classic.wowhead.com/npc=3743/foulweald-warrior
-- https://classic.wowhead.com/npc=3750/foulweald-totemic
UPDATE `creature` SET `id2` = 3750 WHERE `id` = 3743;
UPDATE `creature` SET `id2` = 3743 WHERE `id` = 3750;

-- https://classic.wowhead.com/npc=3737/saltspittle-puddlejumper
-- https://classic.wowhead.com/npc=3739/saltspittle-warrior
UPDATE `creature` SET `id2` = 3739 WHERE `id` = 3737;
UPDATE `creature` SET `id2` = 3737 WHERE `id` = 3739;

-- https://classic.wowhead.com/npc=3740/saltspittle-muckdweller
-- https://classic.wowhead.com/npc=3742/saltspittle-oracle
UPDATE `creature` SET `id2` = 3742 WHERE `id` = 3740;
UPDATE `creature` SET `id2` = 3740 WHERE `id` = 3742;

-- https://classic.wowhead.com/npc=3713/wrathtail-wave-rider
-- https://classic.wowhead.com/npc=3717/wrathtail-sorceress
UPDATE `creature` SET `id2` = 3717 WHERE `id` = 3713;
UPDATE `creature` SET `id2` = 3713 WHERE `id` = 3717;

-- https://classic.wowhead.com/npc=3711/wrathtail-myrmidon
-- https://classic.wowhead.com/npc=3944/wrathtail-priestess
UPDATE `creature` SET `id2` = 3944 WHERE `id` = 3711;
UPDATE `creature` SET `id2` = 3711 WHERE `id` = 3944;

-- https://classic.wowhead.com/npc=3781/shadethicket-wood-shaper
-- https://classic.wowhead.com/npc=3783/shadethicket-raincaller
UPDATE `creature` SET `id2` = 3783 WHERE `id` = 3781;
UPDATE `creature` SET `id2` = 3781 WHERE `id` = 3783;

-- https://classic.wowhead.com/npc=3725/dark-strand-cultist
-- https://classic.wowhead.com/npc=3728/dark-strand-adept
UPDATE `creature` SET `id2` = 3728 WHERE `id` = 3725;
UPDATE `creature` SET `id2` = 3725 WHERE `id` = 3728;

-- https://classic.wowhead.com/npc=3727/dark-strand-enforcer
-- https://classic.wowhead.com/npc=3730/dark-strand-excavator
UPDATE `creature` SET `id2` = 3730 WHERE `id` = 3727;
UPDATE `creature` SET `id2` = 3727 WHERE `id` = 3730;

-- https://classic.wowhead.com/npc=3732/forsaken-seeker
-- https://classic.wowhead.com/npc=3733/forsaken-herbalist
UPDATE `creature` SET `id2` = 3733 WHERE `id` = 3732;
UPDATE `creature` SET `id2` = 3732 WHERE `id` = 3733;

-- ----------------------------------------------------------------------

-- STONETALON
-- https://classic.wowhead.com/npc=11910/grimtotem-ruffian
-- https://classic.wowhead.com/npc=11911/grimtotem-mercenary
UPDATE `creature` SET `id2` = 11911 WHERE `id` = 11910;
UPDATE `creature` SET `id2` = 11910 WHERE `id` = 11911;

-- https://classic.wowhead.com/npc=11912/grimtotem-brute
-- https://classic.wowhead.com/npc=11913/grimtotem-sorcerer
UPDATE `creature` SET `id2` = 11913 WHERE `id` = 11912;
UPDATE `creature` SET `id2` = 11912 WHERE `id` = 11913;

-- https://classic.wowhead.com/npc=3989/venture-co-logger
-- https://classic.wowhead.com/npc=3991/venture-co-deforester
UPDATE `creature` SET `id2` = 3991 WHERE `id` = 3989;
UPDATE `creature` SET `id2` = 3989 WHERE `id` = 3991;

-- https://classic.wowhead.com/npc=3992/venture-co-engineer
-- https://classic.wowhead.com/npc=4070/venture-co-builder
UPDATE `creature` SET `id2` = 4070 WHERE `id` = 3992;
UPDATE `creature` SET `id2` = 3992 WHERE `id` = 4070;

-- https://classic.wowhead.com/npc=4022/bloodfury-harpy
-- https://classic.wowhead.com/npc=4025/bloodfury-ambusher
-- https://classic.wowhead.com/npc=4026/bloodfury-windcaller
UPDATE `creature` SET `id2` = 4025, `id3` = 4026 WHERE `guid` IN (
30419,
30420,
30421,
30422,
30423,
30426,
30427,
30428,
30429,
30430,
30431
);
UPDATE `creature` SET `id2` = 4022, `id3` = 4026 WHERE `id` = 4025;
UPDATE `creature` SET `id2` = 4022, `id3` = 4025 WHERE `id` = 4026;

-- https://classic.wowhead.com/npc=4023/bloodfury-roguefeather
-- https://classic.wowhead.com/npc=4024/bloodfury-slayer
-- https://classic.wowhead.com/npc=4027/bloodfury-storm-witch
UPDATE `creature` SET `id2` = 4024, `id3` = 4027 WHERE `id` = 4023;
UPDATE `creature` SET `id2` = 4023, `id3` = 4027 WHERE `id` = 4024;
UPDATE `creature` SET `id2` = 4023, `id3` = 4024 WHERE `id` = 4027;

-- ----------------------------------------------------------------------

-- DUROTAR
-- https://classic.wowhead.com/npc=3115/dustwind-harpy
-- https://classic.wowhead.com/npc=3116/dustwind-pillager
UPDATE `creature` SET `id2` = 3116 WHERE `id` = 3115;
UPDATE `creature` SET `id2` = 3115 WHERE `id` = 3116;

-- ----------------------------------------------------------------------

-- WPL
-- https://classic.wowhead.com/npc=1831/scarlet-hunter
-- https://classic.wowhead.com/npc=1835/scarlet-invoker
-- https://classic.wowhead.com/npc=10605/scarlet-medic
UPDATE `creature` SET `id2` = 1835, `id3` = 10605 WHERE `id` = 1831;
UPDATE `creature` SET `id2` = 1831, `id3` = 10605 WHERE `id` = 1835;
UPDATE `creature` SET `id2` = 1831, `id3` = 1835 WHERE `id` = 10605;

-- Scarlet Mage (1826) Can Be Scarlet Knight (1833)
-- https://classic.wowhead.com/npc=1826/scarlet-mage
UPDATE `creature` SET `id` = 1826 WHERE `guid` IN (
47151,
46772,
45367,
46770,
46767,
47146,
45375,
47144,
47148
);
UPDATE `creature` SET `id2` = 1833 WHERE `id` = 1826;

-- https://classic.wowhead.com/npc=1802/hungering-wraith
-- https://classic.wowhead.com/npc=1804/wailing-death
-- https://classic.wowhead.com/npc=4472/haunting-vision
UPDATE `creature` SET `id2` = 1804, `id3` = 4472 WHERE `id` = 1802;
UPDATE `creature` SET `id2` = 1802, `id3` = 4472 WHERE `id` = 1804;
UPDATE `creature` SET `id2` = 1802, `id3` = 1804 WHERE `id` = 4472;

-- https://classic.wowhead.com/npc=1793/rotting-ghoul
-- https://classic.wowhead.com/npc=1796/freezing-ghoul
UPDATE `creature` SET `id2` = 1796 WHERE `id` = 1793;
UPDATE `creature` SET `id2` = 1793 WHERE `id` = 1796;

-- https://classic.wowhead.com/npc=1787/skeletal-executioner
-- https://classic.wowhead.com/npc=1789/skeletal-acolyte
UPDATE `creature` SET `id2` = 1789 WHERE `id` = 1787;
UPDATE `creature` SET `id2` = 1787 WHERE `id` = 1789;

-- https://classic.wowhead.com/npc=1794/soulless-ghoul
-- https://classic.wowhead.com/npc=1795/searing-ghoul
UPDATE `creature` SET `id2` = 1795 WHERE `id` = 1794;
UPDATE `creature` SET `id2` = 1794 WHERE `id` = 1795;

-- ----------------------------------------------------------------------

-- UNGORO
-- https://classic.wowhead.com/npc=6520/scorching-elemental
-- https://classic.wowhead.com/npc=6521/living-blaze
UPDATE `creature` SET `id2` = 6521 WHERE `id` = 6520;
UPDATE `creature` SET `id2` = 6520 WHERE `id` = 6521;

-- Gorishi Wasp And Gorishi Worker Can Be 6551, 6552 or 6553
-- https://classic.wowhead.com/npc=6551/gorishi-wasp
-- https://classic.wowhead.com/npc=6552/gorishi-worker
UPDATE `creature` SET `id` = 6552 WHERE `guid` IN (
24293,
24297,
24305,
24303,
24292,
24299,
24306,
24295,
24302,
24309,
24301,
24322,
24307,
24310,
24316,
24298,
24300,
24296,
24308,
24315,
24291,
24304,
24294
);
UPDATE `creature` SET `id2` = 6552 WHERE `id` = 6551;
UPDATE `creature` SET `id2` = 6551 WHERE `id` = 6552;

-- Gorishi Stinger And Gorishi Tunneler Can Be 6553, 6554 or 6555
-- https://classic.wowhead.com/npc=6554/gorishi-stinger
-- https://classic.wowhead.com/npc=6555/gorishi-tunneler
UPDATE `creature` SET `id` = 6554 WHERE `guid` IN (
24320,
24321,
24311,
24314,
24321,
24317,
24319,
24318,
24313,
24312
);
UPDATE `creature` SET `id2` = 6553, `id3` = 6555 WHERE `id` = 6554;
UPDATE `creature` SET `id2` = 6553, `id3` = 6554 WHERE `id` = 6555;

-- https://classic.wowhead.com/npc=6518/tar-lurker
-- https://classic.wowhead.com/npc=6519/tar-lord
UPDATE `creature` SET `id2` = 6519 WHERE `id` = 6518;
UPDATE `creature` SET `id2` = 6518 WHERE `id` = 6519;

-- https://classic.wowhead.com/npc=6517/tar-beast
-- https://classic.wowhead.com/npc=6527/tar-creeper
UPDATE `creature` SET `id2` = 6527 WHERE `id` = 6517;
UPDATE `creature` SET `id2` = 6517 WHERE `id` = 6527;

-- https://classic.wowhead.com/npc=6509/bloodpetal-lasher
-- https://classic.wowhead.com/npc=6511/bloodpetal-thresher
UPDATE `creature` SET `id2` = 6511 WHERE `id` = 6509;
UPDATE `creature` SET `id2` = 6509 WHERE `id` = 6511;

-- https://classic.wowhead.com/npc=6507/ravasaur-hunter
-- https://classic.wowhead.com/npc=6508/venomhide-ravasaur
UPDATE `creature` SET `id2` = 6508 WHERE `id` = 6507;
UPDATE `creature` SET `id2` = 6507 WHERE `id` = 6508;

-- https://classic.wowhead.com/npc=6505/ravasaur
-- https://classic.wowhead.com/npc=6506/ravasaur-runner
UPDATE `creature` SET `id2` = 6506 WHERE `id` = 6505;
UPDATE `creature` SET `id2` = 6505 WHERE `id` = 6506;

-- Ungoro Stomper Can Be 6514
-- https://classic.wowhead.com/npc=6513/ungoro-stomper
UPDATE `creature` SET `id` = 6513 WHERE `guid` IN (
24073,
24074
);
UPDATE `creature` SET `id2` = 6514 WHERE `id` = 6513;

-- Ungoro Thunderer Can Be 6513 Or 6514
-- https://classic.wowhead.com/npc=6516/ungoro-thunderer
UPDATE `creature` SET `id` = 6516 WHERE `guid` IN (
24068,
24070,
24066,
24069,
24060,
24072,
24076,
24075,
24061,
24067,
24071
);
UPDATE `creature` SET `id2` = 6513, `id3` = 6514 WHERE `id` = 6516;

-- ----------------------------------------------------------------------

-- TANARIS
-- Wastewander Bandit And Wastewander Thief Can Be 5616, 5618 or 5617
-- https://classic.wowhead.com/npc=5616/wastewander-thief
-- https://classic.wowhead.com/npc=5618/wastewander-bandit
UPDATE `creature` SET `id2` = 5618 WHERE `id` = 5616;
UPDATE `creature` SET `id2` = 5616 WHERE `id` = 5618;

-- Wastewander Rogue And Wastewander Assassin Can Be 5615, 5623 or 5617
-- https://classic.wowhead.com/npc=5615/wastewander-rogue
-- https://classic.wowhead.com/npc=5623/wastewander-assassin
UPDATE `creature` SET `id` = 5623 WHERE `guid` IN (
23544,
23542,
23539,
23530,
23533,
23538,
23540,
23527,
23522,
23525,
23545,
23535,
23526,
23528,
23523,
23536,
23541,
23531,
23524,
23529,
23534,
23537,
23532,
23546
);
UPDATE `creature` SET `id2` = 5617, `id3` = 5623 WHERE `id` = 5615;
UPDATE `creature` SET `id2` = 5615, `id3` = 5617 WHERE `id` = 5623;

-- https://classic.wowhead.com/npc=7855/southsea-pirate
-- https://classic.wowhead.com/npc=7856/southsea-freebooter
UPDATE `creature` SET `id2` = 7856 WHERE `id` = 7855;
UPDATE `creature` SET `id2` = 7855 WHERE `id` = 7856;

-- https://classic.wowhead.com/npc=5471/dunemaul-ogre
-- https://classic.wowhead.com/npc=5472/dunemaul-enforcer
-- https://classic.wowhead.com/npc=5473/dunemaul-ogre-mage
-- https://classic.wowhead.com/npc=5475/dunemaul-warlock
UPDATE `creature` SET `id2` = 5472, `id3` = 5473, `id4` = 5475 WHERE `id` = 5471;
UPDATE `creature` SET `id2` = 5471, `id3` = 5473, `id4` = 5475 WHERE `id` = 5472;
UPDATE `creature` SET `id2` = 5471, `id3` = 5472, `id4` = 5475 WHERE `id` = 5473;
UPDATE `creature` SET `id2` = 5471, `id3` = 5472, `id4` = 5473 WHERE `id` = 5475;

-- https://classic.wowhead.com/npc=5645/sandfury-hideskinner
-- https://classic.wowhead.com/npc=5646/sandfury-axe-thrower
-- https://classic.wowhead.com/npc=5647/sandfury-firecaller
UPDATE `creature` SET `id2` = 5646, `id3` = 5647 WHERE `id` = 5645;
UPDATE `creature` SET `id2` = 5645, `id3` = 5647 WHERE `id` = 5646;
UPDATE `creature` SET `id2` = 5645, `id3` = 5646 WHERE `id` = 5647;

-- https://classic.wowhead.com/npc=5455/centipaar-wasp
-- https://classic.wowhead.com/npc=5456/centipaar-stinger
-- https://classic.wowhead.com/npc=5457/centipaar-swarmer
UPDATE `creature` SET `id2` = 5456, `id3` = 5457 WHERE `id` = 5455;
UPDATE `creature` SET `id2` = 5455, `id3` = 5457 WHERE `id` = 5456;
UPDATE `creature` SET `id2` = 5455, `id3` = 5456 WHERE `id` = 5457;

-- https://classic.wowhead.com/npc=5458/centipaar-worker
-- https://classic.wowhead.com/npc=5459/centipaar-tunneler
-- https://classic.wowhead.com/npc=5460/centipaar-sandreaver
UPDATE `creature` SET `id2` = 5460 WHERE `id` = 5458;
UPDATE `creature` SET `id2` = 5458 WHERE `id` = 5460;

-- https://classic.wowhead.com/npc=5441/hazzali-wasp
-- https://classic.wowhead.com/npc=5450/hazzali-stinger
-- https://classic.wowhead.com/npc=5451/hazzali-swarmer
UPDATE `creature` SET `id2` = 5450, `id3` = 5451 WHERE `id` = 5441;
UPDATE `creature` SET `id2` = 5441, `id3` = 5451 WHERE `id` = 5450;
UPDATE `creature` SET `id2` = 5441, `id3` = 5450 WHERE `id` = 5451;

-- https://classic.wowhead.com/npc=5452/hazzali-worker
-- https://classic.wowhead.com/npc=5453/hazzali-tunneler
-- https://classic.wowhead.com/npc=5454/hazzali-sandreaver
UPDATE `creature` SET `id2` = 5453, `id3` = 5454 WHERE `id` = 5452;
UPDATE `creature` SET `id2` = 5452, `id3` = 5454 WHERE `id` = 5453;
UPDATE `creature` SET `id2` = 5452, `id3` = 5453 WHERE `id` = 5454;

-- ----------------------------------------------------------------------

-- THOUSAND NEEDLES
-- https://classic.wowhead.com/npc=4093/galak-wrangler
-- https://classic.wowhead.com/npc=4094/galak-scout
-- https://classic.wowhead.com/npc=4096/galak-windchaser
UPDATE `creature` SET `id2` = 4094, `id3` = 4096 WHERE `id` = 4093;
UPDATE `creature` SET `id2` = 4093, `id3` = 4096 WHERE `id` = 4094;
UPDATE `creature` SET `id2` = 4093, `id3` = 4094 WHERE `id` = 4096;

-- https://classic.wowhead.com/npc=4095/galak-mauler
-- https://classic.wowhead.com/npc=4097/galak-stormer
-- https://classic.wowhead.com/npc=4099/galak-marauder
UPDATE `creature` SET `id2` = 4097, `id3` = 4099 WHERE `id` = 4095;
UPDATE `creature` SET `id2` = 4095, `id3` = 4099 WHERE `id` = 4097;
UPDATE `creature` SET `id2` = 4095, `id3` = 4097 WHERE `id` = 4099;

-- https://classic.wowhead.com/npc=10758/grimtotem-bandit
-- https://classic.wowhead.com/npc=10759/grimtotem-stomper
-- https://classic.wowhead.com/npc=10760/grimtotem-geomancer
UPDATE `creature` SET `id2` = 10759, `id3` = 10760 WHERE `id` = 10758;
UPDATE `creature` SET `id2` = 10758, `id3` = 10760 WHERE `id` = 10759;
UPDATE `creature` SET `id2` = 10758, `id3` = 10759 WHERE `id` = 10760;

-- Screeching Roguefeather Can Be 4100
-- https://classic.wowhead.com/npc=4101/screeching-roguefeather
UPDATE `creature` SET `id` = 4101 WHERE `guid` IN (
21043,
21042,
21044
);
UPDATE `creature` SET `id2` = 4100 WHERE `id` = 4101;

-- Screeching Windcaller Can Be 4100 Or 4101
-- https://classic.wowhead.com/npc=4104/screeching-windcaller
UPDATE `creature` SET `id` = 4104 WHERE `guid` IN (
21039,
21054,
21050,
21056,
21041,
21051,
21040,
21052
);
UPDATE `creature` SET `id2` = 4100, `id3` = 4101 WHERE `id` = 4104;

-- ----------------------------------------------------------------------

-- FERALAS
-- https://classic.wowhead.com/npc=5254/woodpaw-mystic
-- https://classic.wowhead.com/npc=5255/woodpaw-reaver
-- https://classic.wowhead.com/npc=5258/woodpaw-alpha
UPDATE `creature` SET `id2` = 5255, `id3` = 5258 WHERE `id` = 5254;
UPDATE `creature` SET `id2` = 5254, `id3` = 5258 WHERE `id` = 5255;
UPDATE `creature` SET `id2` = 5254, `id3` = 5255 WHERE `id` = 5258;

-- https://classic.wowhead.com/npc=5249/woodpaw-mongrel
-- https://classic.wowhead.com/npc=5251/woodpaw-trapper
-- https://classic.wowhead.com/npc=5253/woodpaw-brute
UPDATE `creature` SET `id2` = 5251 WHERE `id` = 5249;
UPDATE `creature` SET `id2` = 5249 WHERE `id` = 5251;
UPDATE `creature` SET `id2` = 5249, `id3` = 5251 WHERE `id` = 5253;

-- https://classic.wowhead.com/npc=7725/grimtotem-raider
-- https://classic.wowhead.com/npc=7726/grimtotem-naturalist
-- https://classic.wowhead.com/npc=7727/grimtotem-shaman
UPDATE `creature` SET `id2` = 7726, `id3` = 7727 WHERE `id` = 7725;
UPDATE `creature` SET `id2` = 7725, `id3` = 7727 WHERE `id` = 7726;
UPDATE `creature` SET `id2` = 7725, `id3` = 7726 WHERE `id` = 7727;

-- Gordok Enforcer Can Be Gordok Ogre Mage
-- https://classic.wowhead.com/npc=11440/gordok-enforcer
UPDATE `creature` SET `id` = 11440 WHERE `guid` IN (
51131,
51134,
51086,
51081,
51083,
51088,
51066,
51091,
51097,
51079,
51084,
51092,
51080,
51129,
51077,
51108,
51072,
51071,
51067,
51082,
51070,
51076,
51132,
51130,
51113,
51099,
51110,
51109,
51103,
51135,
51087,
51098,
51073,
51112,
51078,
51115,
51111,
51128,
51133
);
UPDATE `creature` SET `id2` = 11443 WHERE `id` = 11440;

-- Gordok Mauler Can Be Ogre Mage
-- https://classic.wowhead.com/npc=11442/gordok-mauler
UPDATE `creature` SET `id` = 11442 WHERE `guid` IN (
51074,
51121,
51122,
51123,
51124,
51125,
51127,
51126,
51096,
51100,
51095,
51094,
51101,
51102,
51119,
51118,
51120,
51090,
51093
);
UPDATE `creature` SET `id2` = 11443 WHERE `id` = 11442;

-- Gordunni Mauler Can Be Gordunni Warlock
-- https://classic.wowhead.com/npc=5234/gordunni-mauler
UPDATE `creature` SET `id` = 5234 WHERE `guid` IN (
50298,
50302,
50300,
50301,
50295,
50299,
50297
);
UPDATE `creature` SET `id2` = 5240 WHERE `id` = 5234;

-- https://classic.wowhead.com/npc=5236/gordunni-shaman
-- https://classic.wowhead.com/npc=5238/gordunni-battlemaster
-- https://classic.wowhead.com/npc=5239/gordunni-mage-lord
UPDATE `creature` SET `id2` = 5238, `id3` = 5239 WHERE `id` = 5236;
UPDATE `creature` SET `id2` = 5236, `id3` = 5239 WHERE `id` = 5238;
UPDATE `creature` SET `id2` = 5236, `id3` = 5238 WHERE `id` = 5239;

-- https://classic.wowhead.com/npc=5359/shore-strider
-- https://classic.wowhead.com/npc=5360/deep-strider
-- https://classic.wowhead.com/npc=5361/wave-strider
UPDATE `creature` SET `id2` = 5360, `id3` = 5361 WHERE `id` = 5359;
UPDATE `creature` SET `id2` = 5359, `id3` = 5361 WHERE `id` = 5360;
UPDATE `creature` SET `id2` = 5359, `id3` = 5360 WHERE `id` = 5361;

-- https://classic.wowhead.com/npc=5317/jademir-oracle
-- https://classic.wowhead.com/npc=5319/jademir-tree-warder
-- https://classic.wowhead.com/npc=5320/jademir-boughguard
UPDATE `creature` SET `id2` = 5319, `id3` = 5320 WHERE `id` = 5317;
UPDATE `creature` SET `id2` = 5317, `id3` = 5320 WHERE `id` = 5319;
UPDATE `creature` SET `id2` = 5317, `id3` = 5319 WHERE `id` = 5320;

-- https://classic.wowhead.com/npc=5357/land-walker
-- https://classic.wowhead.com/npc=5358/cliff-giant
UPDATE `creature` SET `id2` = 5358 WHERE `id` = 5357;
UPDATE `creature` SET `id2` = 5357 WHERE `id` = 5358;

-- Gordunni Ogre Can Be Gordunni Mage Or Gordunni Brute
-- https://classic.wowhead.com/npc=5229/gordunni-ogre
UPDATE `creature` SET `id2` = 5229, `id3` = 5237 WHERE `guid` IN (
50186,
50188,
50187,
50205,
50195,
50204,
50218,
50194,
50217,
50215,
50203,
50216,
50198,
50200,
50202,
50201
);
UPDATE `creature` SET `id2` = 5229, `id3` = 5232 WHERE `id` = 5237;
UPDATE `creature` SET `id2` = 5232, `id3` = 5237 WHERE `id` = 5229;

-- https://classic.wowhead.com/npc=5331/hatecrest-warrior
-- https://classic.wowhead.com/npc=5332/hatecrest-wave-rider
-- https://classic.wowhead.com/npc=5335/hatecrest-screamer
-- https://classic.wowhead.com/npc=5337/hatecrest-siren
UPDATE `creature` SET `id2` = 5332, `id3` = 5335, `id4` = 5337 WHERE `id` = 5331;
UPDATE `creature` SET `id2` = 5331, `id3` = 5335, `id4` = 5337 WHERE `id` = 5332;
UPDATE `creature` SET `id2` = 5331, `id3` = 5332, `id4` = 5337 WHERE `id` = 5335;
UPDATE `creature` SET `id2` = 5331, `id3` = 5332, `id4` = 5335 WHERE `id` = 5337;

-- Hatecrest Myrmidon Can Be Hatecrest Sorcress
-- https://classic.wowhead.com/npc=5334/hatecrest-myrmidon
UPDATE `creature` SET `id` = 5334 WHERE `guid` IN (
51655,
51607,
51626,
51557,
51625,
51638,
51628,
51634
);
UPDATE `creature` SET `id2` = 5336 WHERE `id` = 5334;

-- Hatecrest Serpent Guard Can Be Hatecrest Sorcress
-- https://classic.wowhead.com/npc=5333/hatecrest-serpent-guard
UPDATE `creature` SET `id` = 5333 WHERE `guid` IN (
51656,
51664,
51663,
51653,
51650,
51652,
51645,
51643,
51642,
51662,
51660,
51661,
51659,
51654
);
UPDATE `creature` SET `id2` = 5336 WHERE `id` = 5333;

-- https://classic.wowhead.com/npc=5362/northspring-harpy
-- https://classic.wowhead.com/npc=5363/northspring-roguefeather
-- https://classic.wowhead.com/npc=5364/northspring-slayer
-- https://classic.wowhead.com/npc=5366/northspring-windcaller
UPDATE `creature` SET `id2` = 5363, `id3` = 5364, `id4` = 5366 WHERE `id` = 5362;
UPDATE `creature` SET `id2` = 5362, `id3` = 5364, `id4` = 5366 WHERE `id` = 5363;
UPDATE `creature` SET `id2` = 5362, `id3` = 5363, `id4` = 5366 WHERE `id` = 5364;
UPDATE `creature` SET `id2` = 5362, `id3` = 5363, `id4` = 5364 WHERE `id` = 5366;

-- ----------------------------------------------------------------------

-- HINTERLANDS
-- https://classic.wowhead.com/npc=12477/verdantine-boughguard
-- https://classic.wowhead.com/npc=12478/verdantine-oracle
-- https://classic.wowhead.com/npc=12479/verdantine-tree-warder
UPDATE `creature` SET `id2` = 12478, `id3` = 12479 WHERE `id` = 12477;
UPDATE `creature` SET `id2` = 12477, `id3` = 12479 WHERE `id` = 12478;
UPDATE `creature` SET `id2` = 12477, `id3` = 12478 WHERE `id` = 12479;

-- ----------------------------------------------------------------------

-- FELWOOD
-- https://classic.wowhead.com/npc=7106/jadefire-rogue
-- https://classic.wowhead.com/npc=7109/jadefire-felsworn
-- https://classic.wowhead.com/npc=7110/jadefire-shadowstalker
UPDATE `creature` SET `id2` = 7109, `id3` = 7110 WHERE `id` = 7106;
UPDATE `creature` SET `id2` = 7106, `id3` = 7110 WHERE `guid` IN (
40695,
40730,
40735,
40738,
40747,
40757,
40764,
40769,
40829,
40835
);
UPDATE `creature` SET `id2` = 7106, `id3` = 7109 WHERE `id` = 7110;

-- https://classic.wowhead.com/npc=7112/jaedenar-cultist
-- https://classic.wowhead.com/npc=7115/jaedenar-adept
UPDATE `creature` SET `id2` = 7115 WHERE `id` = 7112;
UPDATE `creature` SET `id2` = 7112 WHERE `id` = 7115;

-- https://classic.wowhead.com/npc=7118/jaedenar-darkweaver
-- https://classic.wowhead.com/npc=7120/jaedenar-warlock
UPDATE `creature` SET `id2` = 7120 WHERE `id` = 7118;
UPDATE `creature` SET `id2` = 7118 WHERE `id` = 7120;

-- https://classic.wowhead.com/npc=7107/jadefire-trickster
-- https://classic.wowhead.com/npc=7108/jadefire-betrayer
UPDATE `creature` SET `id2` = 7108 WHERE `guid` IN (
40193,
40194,
40195,
40240,
40241,
40242,
40284,
40288,
40289,
40291,
40296,
40677,
40678,
40713,
40714
);
UPDATE `creature` SET `id2` = 7107 WHERE `id` = 7108;

-- https://classic.wowhead.com/npc=7100/warpwood-moss-flayer
-- https://classic.wowhead.com/npc=7101/warpwood-shredder
UPDATE `creature` SET `id2` = 7101 WHERE `id` = 7100;
UPDATE `creature` SET `id2` = 7100 WHERE `id` = 7101;

-- https://classic.wowhead.com/npc=7156/deadwood-den-watcher
-- https://classic.wowhead.com/npc=7157/deadwood-avenger
-- https://classic.wowhead.com/npc=7158/deadwood-shaman
UPDATE `creature` SET `id2` = 7157, `id3` = 7158 WHERE `id` = 7156;
UPDATE `creature` SET `id2` = 7156, `id3` = 7158 WHERE `id` = 7157;
UPDATE `creature` SET `id2` = 7156, `id3` = 7157 WHERE `id` = 7158;

-- ----------------------------------------------------------------------

-- BURNING STEPPES
-- https://classic.wowhead.com/npc=7042/flamescale-dragonspawn
-- https://classic.wowhead.com/npc=7043/flamescale-wyrmkin
UPDATE `creature` SET `id2` = 7043 WHERE `id` = 7042;
UPDATE `creature` SET `id2` = 7042 WHERE `id` = 7043;

-- https://classic.wowhead.com/npc=7036/thaurissan-spy
-- https://classic.wowhead.com/npc=7037/thaurissan-firewalker
-- https://classic.wowhead.com/npc=7038/thaurissan-agent
UPDATE `creature` SET `id2` = 7037, `id3` = 7038 WHERE `id` = 7036;
UPDATE `creature` SET `id2` = 7036, `id3` = 7038 WHERE `id` = 7037;
UPDATE `creature` SET `id2` = 7036, `id3` = 7037 WHERE `id` = 7038;

-- Firegut Ogres (7033) Can Spawn As Firegut Ogre Mage (7034)
-- https://classic.wowhead.com/npc=7033/firegut-ogre
UPDATE `creature` SET `id` = 7033 WHERE `id` = 7034;
UPDATE `creature` SET `id2` = 7034 WHERE `id` = 7033;

-- Firegut Brutes (7035) Can Spawn As Firegut Ogre Mage (7034)
-- https://classic.wowhead.com/npc=7035/firegut-brute
UPDATE `creature` SET `id` = 7035 WHERE `guid` = 5353;
UPDATE `creature` SET `id2` = 7034 WHERE `id` = 7035;

-- https://classic.wowhead.com/npc=9778/flamekin-torcher
-- https://classic.wowhead.com/npc=9779/flamekin-rager
UPDATE `creature` SET `id2` = 9779 WHERE `id` = 9778;
UPDATE `creature` SET `id2` = 9778 WHERE `id` = 9779;

-- ----------------------------------------------------------------------

-- SWAMP OF SORROWS
-- https://classic.wowhead.com/npc=765/swampwalker-elder
-- https://classic.wowhead.com/npc=766/tangled-horror
UPDATE `creature` SET `id2` = 766 WHERE `id` = 765;
UPDATE `creature` SET `id2` = 765 WHERE `guid` IN (
42823,
42825,
42828,
42832,
42834
);

-- https://classic.wowhead.com/npc=761/lost-one-seer
-- https://classic.wowhead.com/npc=762/lost-one-riftseeker
UPDATE `creature` SET `id2` = 762 WHERE `id` = 761;
UPDATE `creature` SET `id2` = 761 WHERE `id` = 762;

-- https://classic.wowhead.com/npc=751/marsh-flesheater
-- https://classic.wowhead.com/npc=752/marsh-oracle
UPDATE `creature` SET `id2` = 752 WHERE `id` = 751;
UPDATE `creature` SET `id2` = 751 WHERE `id` = 752;

-- ----------------------------------------------------------------------

-- ALTERAC
-- https://classic.wowhead.com/npc=2240/syndicate-footpad
-- https://classic.wowhead.com/npc=2241/syndicate-thief
UPDATE `creature` SET `id2` = 2241 WHERE `id` = 2240;
UPDATE `creature` SET `id2` = 2240 WHERE `id` = 2241;

-- TIRISFAL
-- https://classic.wowhead.com/npc=1525/rotting-dead
-- https://classic.wowhead.com/npc=1526/ravaged-corpse
UPDATE `creature` SET `id2` = 1526 WHERE `id` = 1525;
UPDATE `creature` SET `id2` = 1525 WHERE `id` = 1526;

--  Scarlet Missionary (1536) Can Be Scarlet Zealot(1537)
-- https://classic.wowhead.com/npc=1536/scarlet-missionary
UPDATE `creature` SET `id` = 1536 WHERE `guid` IN (
44276,
44573,
44874,
44865,
44574,
44578,
44580,
45059,
45067,
44582,
45057,
45065,
44601,
44483,
38340
);
UPDATE `creature` SET `id2` = 1537 WHERE `id` = 1536;

-- https://classic.wowhead.com/npc=1527/hungering-dead
-- https://classic.wowhead.com/npc=1528/shambling-horror
UPDATE `creature` SET `id2` = 1528 WHERE `id` = 1527;
UPDATE `creature` SET `id2` = 1527 WHERE `id` = 1528;

-- https://classic.wowhead.com/npc=4280/scarlet-preserver
-- https://classic.wowhead.com/npc=4281/scarlet-scout
-- https://classic.wowhead.com/npc=4282/scarlet-magician
UPDATE `creature` SET `id2` = 4281, `id3` = 4282 WHERE `id` = 4280;
UPDATE `creature` SET `id2` = 4280, `id3` = 4282 WHERE `id` = 4281;
UPDATE `creature` SET `id2` = 4280, `id3` = 4281 WHERE `id` = 4282;

-- ----------------------------------------------------------------------

-- LOCH MODAN
-- https://classic.wowhead.com/npc=1172/tunnel-rat-vermin
-- https://classic.wowhead.com/npc=1173/tunnel-rat-scout
UPDATE `creature` SET `id2` = 1173 WHERE `id` = 1172;
UPDATE `creature` SET `id2` = 1172 WHERE `id` = 1173;

-- https://classic.wowhead.com/npc=1176/tunnel-rat-forager
-- https://classic.wowhead.com/npc=1202/tunnel-rat-kobold
UPDATE `creature` SET `id2` = 1202 WHERE `id` = 1176;
UPDATE `creature` SET `id2` = 1176 WHERE `id` = 1202;

-- https://classic.wowhead.com/npc=1161/stonesplinter-trogg
-- https://classic.wowhead.com/npc=1162/stonesplinter-scout
UPDATE `creature` SET `id2` = 1162 WHERE `id` = 1161;
UPDATE `creature` SET `id2` = 1161 WHERE `id` = 1162;

-- https://classic.wowhead.com/npc=1164/stonesplinter-bonesnapper
-- https://classic.wowhead.com/npc=1197/stonesplinter-shaman
UPDATE `creature` SET `id2` = 1197 WHERE `id` = 1164;
UPDATE `creature` SET `id2` = 1164 WHERE `id` = 1197;

-- https://classic.wowhead.com/npc=1163/stonesplinter-skullthumper
-- https://classic.wowhead.com/npc=1166/stonesplinter-seer
UPDATE `creature` SET `id2` = 1166 WHERE `id` = 1163;
UPDATE `creature` SET `id2` = 1163 WHERE `id` = 1166;

-- https://classic.wowhead.com/npc=1165/stonesplinter-geomancer
-- https://classic.wowhead.com/npc=1167/stonesplinter-digger
-- https://classic.wowhead.com/npc=1393/berserk-trogg
UPDATE `creature` SET `id2` = 1167, `id3` = 1393 WHERE `id` = 1165;
UPDATE `creature` SET `id2` = 1165, `id3` = 1393 WHERE `id` = 1167;
UPDATE `creature` SET `id2` = 1165, `id3` = 1167 WHERE `id` = 1393;

-- https://classic.wowhead.com/npc=1178/mogrosh-ogre
-- https://classic.wowhead.com/npc=1179/mogrosh-enforcer
-- https://classic.wowhead.com/npc=1181/mogrosh-shaman
UPDATE `creature` SET `id2` = 1179, `id3` = 1181 WHERE `id` = 1178;
UPDATE `creature` SET `id2` = 1178, `id3` = 1181 WHERE `id` = 1179;
UPDATE `creature` SET `id2` = 1178, `id3` = 1179 WHERE `id` = 1181;

-- https://classic.wowhead.com/npc=1180/mogrosh-brute
-- https://classic.wowhead.com/npc=1183/mogrosh-mystic
UPDATE `creature` SET `id2` = 1183 WHERE `id` = 1180;
UPDATE `creature` SET `id2` = 1180 WHERE `id` = 1183;

-- ----------------------------------------------------------------------

-- SEARING GEORGE
-- https://classic.wowhead.com/npc=5844/dark-iron-slaver
-- https://classic.wowhead.com/npc=5846/dark-iron-taskmaster
UPDATE `creature` SET `id2` = 5846 WHERE `id` = 5844;
UPDATE `creature` SET `id2` = 5844 WHERE `id` = 5846;

-- https://classic.wowhead.com/npc=5839/dark-iron-geologist
-- https://classic.wowhead.com/npc=8637/dark-iron-watchman
UPDATE `creature` SET `id2` = 8637 WHERE `id` = 5839;
UPDATE `creature` SET `id2` = 5839 WHERE `id` = 8637;

-- ----------------------------------------------------------------------

-- BLASTED LANDS
-- https://classic.wowhead.com/npc=5974/dreadmaul-ogre
-- https://classic.wowhead.com/npc=5975/dreadmaul-ogre-mage
-- https://classic.wowhead.com/npc=5976/dreadmaul-brute
UPDATE `creature` SET `id2` = 5975, `id3` = 5976 WHERE `id` = 5974;
UPDATE `creature` SET `id2` = 5974, `id3` = 5976 WHERE `id` = 5975;
UPDATE `creature` SET `id2` = 5974, `id3` = 5975 WHERE `id` = 5976;

-- https://classic.wowhead.com/npc=6007/shadowsworn-enforcer
-- https://classic.wowhead.com/npc=6008/shadowsworn-warlock
-- https://classic.wowhead.com/npc=6009/shadowsworn-dreadweaver
UPDATE `creature` SET `id2` = 6008, `id3` = 6009 WHERE `id` = 6007;
UPDATE `creature` SET `id2` = 6007, `id3` = 6009 WHERE `id` = 6008;
UPDATE `creature` SET `id2` = 6007, `id3` = 6008 WHERE `id` = 6009;

-- https://classic.wowhead.com/npc=5978/dreadmaul-warlock
-- https://classic.wowhead.com/npc=5977/dreadmaul-mauler
UPDATE `creature` SET `id2` = 5977 WHERE `id` = 5978;
UPDATE `creature` SET `id2` = 5978 WHERE `id` = 5977;

-- https://classic.wowhead.com/npc=6004/shadowsworn-cultist
-- https://classic.wowhead.com/npc=6005/shadowsworn-thug
-- https://classic.wowhead.com/npc=6006/shadowsworn-adept
UPDATE `creature` SET `id2` = 6005, `id3` = 6006 WHERE `id` = 6004;
UPDATE `creature` SET `id2` = 6004, `id3` = 6006 WHERE `id` = 6005;
UPDATE `creature` SET `id2` = 6004, `id3` = 6005 WHERE `id` = 6006;

-- ----------------------------------------------------------------------

-- WESTFALL
-- Murloc Raider Can Be Murloc Coastrunner
-- https://classic.wowhead.com/npc=515/murloc-raider
UPDATE `creature` SET `id` = 515 WHERE `guid` IN (
89938,
90088,
90077,
89459,
89934,
90076,
89940,
90405,
89464,
89461,
89466,
90090,
89936,
90385,
90081,
90078,
90075,
89458
);
UPDATE `creature` SET `id2` = 126 WHERE `id` = 515;

-- Murloc Minor Oracle Can Be Murloc Coastrunner
-- https://classic.wowhead.com/npc=456/murloc-minor-oracle
UPDATE `creature` SET `id` = 456 WHERE `guid` IN (
90080,
90079,
89939,
90089,
90083,
90086,
90084
);
UPDATE `creature` SET `id2` = 126 WHERE `id` = 456;

-- Murloc Netter Can Be Murloc Minor Oracle
-- https://classic.wowhead.com/npc=513/murloc-netter
UPDATE `creature` SET `id` = 513 WHERE `guid` IN (
89922,
68756,
89921,
90064,
69492,
89923,
81709,
89919,
90067,
89917,
89918,
68754,
90060,
89470,
89473
);
UPDATE `creature` SET `id2` = 456 WHERE `id` = 513;

-- Murloc Warrior Can Be Murloc Netter
-- https://classic.wowhead.com/npc=171/murloc-warrior
UPDATE `creature` SET `id` = 171 WHERE `guid` IN (
89943,
89944,
90099,
89488,
89479,
90093,
90094,
89947
);
UPDATE `creature` SET `id2` = 513 WHERE `id` = 171;

-- Murloc Hunter Can Be Murloc Warrior
-- https://classic.wowhead.com/npc=458/murloc-hunter
UPDATE `creature` SET `id` = 458 WHERE `guid` IN (
89948,
89949,
89485,
89487,
89486,
89476,
89954,
89494,
89952,
89497,
90024,
90027,
90022,
89832,
89833,
90026,
89836,
89478,
89480,
89946,
89483,
89484,
90098,
89834,
89835
);
UPDATE `creature` SET `id2` = 171 WHERE `id` = 458;

-- Murloc Oracle Can Be Murloc Hunter
-- https://classic.wowhead.com/npc=517/murloc-oracle
UPDATE `creature` SET `id` = 517 WHERE `guid` IN (
89506,
89956,
89957,
89962,
89970,
90111,
90110,
90109
);
UPDATE `creature` SET `id2` = 458 WHERE `id` = 517;

-- Murloc Tidehunter Can Be Murloc Oracle
-- https://classic.wowhead.com/npc=127/murloc-tidehunter
UPDATE `creature` SET `id` = 127 WHERE `guid` IN (
89975,
89513,
89519,
89508,
89507,
89960,
89501,
89972,
89512,
89974,
90148,
90112,
90106,
90105
);
UPDATE `creature` SET `id2` = 517 WHERE `id` = 127;

-- Riverpaw Gnoll Can Be Riverpaw Scout
-- https://classic.wowhead.com/npc=117/riverpaw-gnoll
UPDATE `creature` SET `id` = 117 WHERE `guid` IN (
86616,
86620,
90332,
86783,
90335,
86662,
86785,
86661,
86786,
87025,
86793
);
UPDATE `creature` SET `id2` = 500 WHERE `id` = 117;

-- Riverpaw Gnoll Or Riverpaw Shaman
UPDATE `creature` SET `id` = 500, `id2` = 1065 WHERE `guid` IN (
86791,
86790,
87024,
86792
);

-- Riverpaw Herbalist Can Be Riverpaw Mongrel
-- https://classic.wowhead.com/npc=501/riverpaw-herbalist
UPDATE `creature` SET `id` = 501 WHERE `guid` IN (
89609,
89610,
89611,
89602,
90309,
89601,
89600,
89597,
89598,
89604,
89605,
87027,
89632,
90304,
89623,
89620,
89624,
89619,
89658,
89659,
89621,
89626,
89627,
89630,
89629,
89628,
89633
);
UPDATE `creature` SET `id2` = 123 WHERE `id` = 501;

-- Riverpaw Mystic Can Be Riverpaw Taskmaster
-- https://classic.wowhead.com/npc=453/riverpaw-mystic
UPDATE `creature` SET `id` = 453 WHERE `guid` IN (
90258,
90262,
89724,
89723,
89721,
89725,
89753,
89755,
89754,
90260,
90240,
90247,
89741,
89764,
89762,
89763,
89761,
89759,
89738,
89734,
89739,
89737,
89727,
89733,
89747,
89744,
89746,
89745,
89732,
89731,
89730,
90266,
89758
);
UPDATE `creature` SET `id2` = 98 WHERE `id` = 453;

-- https://classic.wowhead.com/npc=589/defias-pillager
-- https://classic.wowhead.com/npc=590/defias-looter
UPDATE `creature` SET `id2` = 590 WHERE `id` = 589;
UPDATE `creature` SET `id2` = 589 WHERE `id` = 590;

-- https://classic.wowhead.com/npc=95/defias-smuggler
-- https://classic.wowhead.com/npc=504/defias-trapper
UPDATE `creature` SET `id2` = 504 WHERE `id` = 95;
UPDATE `creature` SET `id2` = 95 WHERE `id` = 504 && `guid` NOT IN (89451, 89452, 89453, 89454, 89455, 89456, 89457, 90317, 90320, 90322);

-- ----------------------------------------------------------------------

-- DESOLACE
-- https://classic.wowhead.com/npc=4670/hatefury-rogue
-- https://classic.wowhead.com/npc=4671/hatefury-trickster
-- https://classic.wowhead.com/npc=4672/hatefury-felsworn
UPDATE `creature` SET `id2` = 4671, `id3` = 4672 WHERE `id` = 4670;
UPDATE `creature` SET `id2` = 4670, `id3` = 4672 WHERE `id` = 4671;
UPDATE `creature` SET `id2` = 4670, `id3` = 4671 WHERE `id` = 4672;

-- https://classic.wowhead.com/npc=4673/hatefury-betrayer
-- https://classic.wowhead.com/npc=4674/hatefury-shadowstalker
-- https://classic.wowhead.com/npc=4675/hatefury-hellcaller
UPDATE `creature` SET `id2` = 4674, `id3` = 4675 WHERE `id` = 4673;
UPDATE `creature` SET `id2` = 4673, `id3` = 4675 WHERE `id` = 4674;
UPDATE `creature` SET `id2` = 4673, `id3` = 4674 WHERE `id` = 4675;

-- https://classic.wowhead.com/npc=4632/kolkar-centaur
-- https://classic.wowhead.com/npc=4633/kolkar-scout
-- https://classic.wowhead.com/npc=4634/kolkar-mauler
UPDATE `creature` SET `id2` = 4633 WHERE `id` = 4632;
UPDATE `creature` SET `id2` = 4632 WHERE `id` = 4633;

-- https://classic.wowhead.com/npc=4635/kolkar-windchaser
-- https://classic.wowhead.com/npc=4636/kolkar-battle-lord
-- https://classic.wowhead.com/npc=4637/kolkar-destroyer
UPDATE `creature` SET `id2` = 4636, `id3` = 4637 WHERE `id` = 4635;
UPDATE `creature` SET `id2` = 4635, `id3` = 4637 WHERE `id` = 4636;
UPDATE `creature` SET `id2` = 4635, `id3` = 4636 WHERE `id` = 4637;

-- https://classic.wowhead.com/npc=4638/magram-scout
-- https://classic.wowhead.com/npc=4639/magram-outrunner
UPDATE `creature` SET `id2` = 4639 WHERE `id` = 4638;
UPDATE `creature` SET `id2` = 4638 WHERE `id` = 4639;

-- https://classic.wowhead.com/npc=4640/magram-wrangler
-- https://classic.wowhead.com/npc=4641/magram-windchaser
UPDATE `creature` SET `id2` = 4641 WHERE `id` = 4640;
UPDATE `creature` SET `id2` = 4640 WHERE `id` = 4641;

-- https://classic.wowhead.com/npc=4644/magram-marauder
-- https://classic.wowhead.com/npc=4645/magram-mauler
UPDATE `creature` SET `id2` = 4645 WHERE `id` = 4644;
UPDATE `creature` SET `id2` = 4644 WHERE `id` = 4645;

-- https://classic.wowhead.com/npc=4646/gelkis-outrunner
-- https://classic.wowhead.com/npc=4647/gelkis-scout
UPDATE `creature` SET `id2` = 4647 WHERE `id` = 4646;
UPDATE `creature` SET `id2` = 4646 WHERE `id` = 4647;

-- https://classic.wowhead.com/npc=4648/gelkis-stamper
-- https://classic.wowhead.com/npc=4649/gelkis-windchaser
UPDATE `creature` SET `id2` = 4649 WHERE `id` = 4648;
UPDATE `creature` SET `id2` = 4648 WHERE `id` = 4649;

-- https://classic.wowhead.com/npc=4652/gelkis-mauler
-- https://classic.wowhead.com/npc=4653/gelkis-marauder
UPDATE `creature` SET `id2` = 4653 WHERE `id` = 4652;
UPDATE `creature` SET `id2` = 4652 WHERE `id` = 4653;

-- https://classic.wowhead.com/npc=4654/maraudine-scout
-- https://classic.wowhead.com/npc=4655/maraudine-wrangler
UPDATE `creature` SET `id2` = 4655 WHERE `id` = 4654;
UPDATE `creature` SET `id2` = 4654 WHERE `id` = 4655;

-- https://classic.wowhead.com/npc=4656/maraudine-mauler
-- https://classic.wowhead.com/npc=4657/maraudine-windchaser
UPDATE `creature` SET `id2` = 4657 WHERE `id` = 4656;
UPDATE `creature` SET `id2` = 4656 WHERE `id` = 4657;

-- https://classic.wowhead.com/npc=4658/maraudine-stormer
-- https://classic.wowhead.com/npc=4659/maraudine-marauder
UPDATE `creature` SET `id2` = 4659 WHERE `id` = 4658;
UPDATE `creature` SET `id2` = 4658 WHERE `id` = 4659;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
