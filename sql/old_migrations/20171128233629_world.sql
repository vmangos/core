DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171128233629');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171128233629');
-- Add your query below.

-- TOWER OF ALTHALAXX
-- Using Master Guide zone classifications
-- The comments are for the quests that have different level requirements.
-- All links from wowhead coincide with the Master Guide levels. Where I commented another site there was no quest level on wowhead, or the levels had been changed due to Cataclysm.

UPDATE quest_template SET MinLevel = 35, QuestLevel = 60, ZoneOrSort = -101 WHERE entry = 8228;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 60, ZoneOrSort = -101 WHERE entry = 8229;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60, ZoneOrSort = -22 WHERE entry = 9029;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1, ZoneOrSort = -161 WHERE entry = 3111;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40, ZoneOrSort = 3 WHERE entry = 3482;

-- Ahn'Qiraj War
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8792;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8793;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8794;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8795;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8796;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8797;

-- Arathi Highlands
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 635;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 636;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 687;

-- Azshara
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 3381;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 56 WHERE entry = 6804;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 6805;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6821;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 6822;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6823;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6824;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7486;

-- Ashenvale
UPDATE quest_template SET MinLevel = 21, QuestLevel = 27 WHERE entry = 908;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 30 WHERE entry = 909;

-- Blackfathom Deeps
UPDATE quest_template SET MinLevel = 18, QuestLevel = 27 WHERE entry = 1200;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 27 WHERE entry = 6561;

-- Blackrock Depths
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 3982;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4001;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 60 WHERE entry = 4004;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 4083;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4123;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4126;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4128;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4133;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4134;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4136;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4201;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4242;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 4264;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 4282;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 4286;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 4295;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 4322;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4324;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 4342;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 4361;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 4363;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7604;

-- Blackrock Spire
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4742;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4743;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4768;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4769;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4867;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4982;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4983;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 5001;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 5002;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5047;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5089;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5160;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 7761;

-- Burning Steppes
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4224;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5522;

-- Blacksmithing
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5103;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7649;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7650;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7651;

-- Druid
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5924;

-- Dire Maul
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 1193;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 1318;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5518;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5519;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5525;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5528;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 7429;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 7441;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 7461;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7462;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7463;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7478;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7479;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7480;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7481;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7482;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7483;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7484;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7485;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 7488;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 7489;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 7492;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 7494;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7498;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7499;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7500;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7501;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7502;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7503;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7504;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7505;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 7506;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7507;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7508;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7509;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7703;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 7877;

-- Dustwallow Marsh
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1288;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1289;

-- Fishing
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8193;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8194;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8221;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8224;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8225;

-- Eastern Plaguelands
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9121;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9122;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9123;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9665;

-- Gnomeregan
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 2904;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 2922;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 2923;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 2924;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 2925;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 2926;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 34 WHERE entry = 2945;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 34 WHERE entry = 2947;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 34 WHERE entry = 2949;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 2951;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 2952;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 2953;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4601;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4602;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4603;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4604;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4605;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 4606;

-- Invasion
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9085;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9094;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9153;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9154;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9247;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9292;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9295;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9299;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9300;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9301;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9302;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 9304;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9310;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9317;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9318;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9320;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9321;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9341;

-- Legendary
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9250;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9251;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9257;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9269;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9270;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9271;

-- Mage
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9362;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9364;

-- Maraudon
UPDATE quest_template SET MinLevel = 41, QuestLevel = 47 WHERE entry = 7028;
UPDATE quest_template SET MinLevel = 41, QuestLevel = 47 WHERE entry = 7029;
UPDATE quest_template SET MinLevel = 41, QuestLevel = 47 WHERE entry = 7041;
UPDATE quest_template SET MinLevel = 41, QuestLevel = 49 WHERE entry = 7044;
UPDATE quest_template SET MinLevel = 41, QuestLevel = 49 WHERE entry = 7046;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 51 WHERE entry = 7064;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 51 WHERE entry = 7065;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 51 WHERE entry = 7066;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 7067;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 42 WHERE entry = 7068;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 42 WHERE entry = 7070;

-- Midsummer
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9319;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9322;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9323;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9324;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9325;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9326;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9330;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9331;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9332;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9339;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9365;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9367;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9368;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 9386;

-- Molten Core
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6642;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6643;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6644;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6645;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6646;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 7487;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 7848;

-- Razorfen Downs
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 3523;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 3525;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 36 WHERE entry = 6521;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 36 WHERE entry = 6522;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 6626;

-- Razorfen Kraul
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 1221;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1142;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 30 WHERE entry = 1144;

-- Rogue
UPDATE quest_template SET MinLevel = 16, QuestLevel = 22 WHERE entry = 2358;

-- Ruins of Ahn'Qiraj
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8791;

-- Seasonal
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8860;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8861;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8897;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8898;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8899;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8900;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8901;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8902;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8903;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8904;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8979;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8980;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8981;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8982;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8983;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8984;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8993;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9024;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9025;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9026;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9027;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9028;

-- Shadowfang Keep
UPDATE quest_template SET MinLevel = 16, QuestLevel = 26 WHERE entry = 101;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 25 WHERE entry = 1098;

-- Scarlet Monastery
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1051;

-- Scholomance
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4771;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 58 WHERE entry = 5529;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5531;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 58 WHERE entry = 5582;

-- Silithus
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8800;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9260;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9261;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9262;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9263;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9264;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 9265;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9415;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9416;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9419;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 9422;

-- Special
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 171;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 558;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 910;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 911;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 915;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 925;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 1479;

-- Stranglethorn Vale
UPDATE quest_template SET MinLevel = 35, QuestLevel = 47 WHERE entry = 614;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 50 WHERE entry = 615;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 50 WHERE entry = 618;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1127;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8183;

-- Stratholme
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5122;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5125;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5262;

-- Sunken Temple
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 3380;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 3373;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 3444;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 3445;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 3446;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 3447;

-- Uldaman
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 2198;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 43 WHERE entry = 2201;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 44 WHERE entry = 2204;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 2240;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2278;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2279;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2280;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 2318;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 2398;

-- Wailing Cavers
UPDATE quest_template SET MinLevel = 13, QuestLevel = 17 WHERE entry = 1486;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 21 WHERE entry = 1487;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 1489;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 1490;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 22 WHERE entry = 914;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 25 WHERE entry = 3366;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 25 WHERE entry = 3369;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 25 WHERE entry = 3370;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 26 WHERE entry = 6981;

-- Zul'Farrak
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2768;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 2846;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 2861;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2864;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2865;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 3042;

-- Alterac Mountains
UPDATE quest_template SET MinLevel = 29, QuestLevel = 40 WHERE entry = 508;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 535;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 551; -- http://www.wowhead.com/quest=551/deprecated-the-ensorcelled-parchment
UPDATE quest_template SET MinLevel = 26, QuestLevel = 37 WHERE entry = 1136;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 6983; -- http://web.archive.org/web/20101113032651/wowhead.com/quest=6983
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7043; -- http://web.archive.org/web/20101021081713/wowhead.com/quest=7043

-- Alterac Valley
-- Alliance
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 5892; -- http://web.archive.org/web/20070410034812/http://www.thottbot.com:80/q6985
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 6982; -- http://web.archive.org/web/20070525012927/http://www.thottbot.com:80/q6982
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6781;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 6846; -- http://www.wowhead.com/quest=6846/begin-the-attack
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6881;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6941;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6942;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6943;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7026;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7027;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7081;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7102;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7121;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7122;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7141;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7162;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7168;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7169;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7170;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7171;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7172;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7223;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7261;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7282;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7301;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7386;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8271;
-- Horde
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6741;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6801;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6825;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6826;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 6827;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 6901; -- http://www.wowhead.com/quest=6901/launch-the-attack
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 5893; -- http://web.archive.org/web/20070410053434/http://www.thottbot.com:80/q5893
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 6985; -- http://web.archive.org/web/20070410034812/http://www.thottbot.com:80/q6985
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7001;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7002;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7082;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7101;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7123;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7124;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7142;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7161;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7163;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7164;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7165;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7166;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7167;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7224;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7241;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7281;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7302;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 7385;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8272;

-- Arathi Basin
-- Alliance
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 8168; -- http://www.wowhead.com/quest=8168/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 8167; -- http://www.wowhead.com/quest=8167/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 8166; -- http://www.wowhead.com/quest=8166/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 8105; -- http://www.wowhead.com/quest=8105/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8114;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8115;
-- Horde
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 8171; -- http://www.wowhead.com/quest=8171/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 8170; -- http://www.wowhead.com/quest=8170/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 8169; -- http://www.wowhead.com/quest=8169/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 8120; -- http://www.wowhead.com/quest=8120/the-battle-for-arathi-basin
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8121;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8122;

-- Arathi Highlands
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 639;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 40 WHERE entry = 640;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 40 WHERE entry = 641;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 642;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 41 WHERE entry = 643;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 42 WHERE entry = 644; -- http://www.wowhead.com/quest=644/sigil-of-trollbane
UPDATE quest_template SET MinLevel = 32, QuestLevel = 42 WHERE entry = 645; -- http://www.wowhead.com/quest=645/trolkalar
UPDATE quest_template SET MinLevel = 32, QuestLevel = 42 WHERE entry = 646; -- http://www.wowhead.com/quest=646/trolkalar
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 651;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 652;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 653; -- http://www.wowhead.com/quest=653/myzraels-allies
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 655;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 50 WHERE entry = 656; -- http://www.wowhead.com/quest=656/summoning-the-princess
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 659; -- http://www.wowhead.com/quest=659/hints-of-a-new-plague
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 658; -- http://www.wowhead.com/quest=658/hints-of-a-new-plague
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 657; -- http://www.wowhead.com/quest=657/hints-of-a-new-plague
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 660; -- http://www.wowhead.com/quest=660/hints-of-a-new-plague
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 661; -- http://www.wowhead.com/quest=661/hints-of-a-new-plague
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 662;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 663; -- http://www.wowhead.com/quest=663/land-ho
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 664;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 665;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 666;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 667; -- http://www.wowhead.com/quest=667/death-from-below
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 668;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 669;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 670; -- http://www.wowhead.com/quest=670/sunken-treasure
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 671;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 672;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 673;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 674;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 675;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 677;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 678;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 679; -- http://www.wowhead.com/quest=679/call-to-arms
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 680;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 31 WHERE entry = 681;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 682;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 39 WHERE entry = 684; -- http://web.archive.org/web/20070317195605/http://www.thottbot.com:80/q684
UPDATE quest_template SET MinLevel = 29, QuestLevel = 40 WHERE entry = 685; -- http://web.archive.org/web/20070320012832/http://www.thottbot.com:80/q685
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 688; -- http://www.wowhead.com/quest=688/myzraels-allies
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 690;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 691;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 41 WHERE entry = 692; -- http://www.wowhead.com/quest=692/the-lost-fragments
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 693; -- http://www.wowhead.com/quest=693/wand-over-fist
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 694;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 695; -- http://www.wowhead.com/quest=695/an-apprentices-enchantment
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 696; -- http://www.wowhead.com/quest=696/attack-on-the-tower
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 697; -- http://www.wowhead.com/quest=697/malins-request
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 701;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 702;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 847;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5146;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6622;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 34 WHERE entry = 8260; -- http://www.wowhead.com/quest=8260/arathor-basic-care-package
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 8261;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8262;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 34 WHERE entry = 8263; -- http://www.wowhead.com/quest=8263/defilers-basic-care-package
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 8264;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8265;

-- Ashenvale
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 2;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 23;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 24;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 25 WHERE entry = 25;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 24 WHERE entry = 216;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 247; -- http://www.wowhead.com/quest=247/the-hunt-completed
UPDATE quest_template SET MinLevel = 23, QuestLevel = 27 WHERE entry = 824;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 21 WHERE entry = 970; -- http://www.wowhead.com/quest=970/the-tower-of-althalaxx
UPDATE quest_template SET MinLevel = 13, QuestLevel = 24 WHERE entry = 973; -- http://www.wowhead.com/quest=973/the-tower-of-althalaxx
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 976; -- http://www.wowhead.com/quest=976/supplies-to-auberdine
UPDATE quest_template SET MinLevel = 15, QuestLevel = 19 WHERE entry = 990;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 19 WHERE entry = 991;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 20 WHERE entry = 1007; -- http://web.archive.org/web/20070317180549/http://www.thottbot.com:80/q1007
UPDATE quest_template SET MinLevel = 14, QuestLevel = 19 WHERE entry = 1008; -- http://www.wowhead.com/quest=1008/the-zoram-strand
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1009;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1010; -- http://web.archive.org/web/20070315145555/http://www.thottbot.com:80/q1010
UPDATE quest_template SET MinLevel = 24, QuestLevel = 29 WHERE entry = 1011;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 32 WHERE entry = 1012; -- http://web.archive.org/web/20100825175252/http://thottbot.com:80/q1012
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 1016; -- http://web.archive.org/web/20100825175252/http://thottbot.com:80/q1012
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1017; -- http://www.wowhead.com/quest=1017/mage-summoner
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1020;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 32 WHERE entry = 1021;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1022; -- http://www.wowhead.com/quest=1022/the-howling-vale
UPDATE quest_template SET MinLevel = 18, QuestLevel = 21 WHERE entry = 1023;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 21 WHERE entry = 1024;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 1025; -- http://www.wowhead.com/quest=1025/an-aggressive-defense
UPDATE quest_template SET MinLevel = 18, QuestLevel = 27 WHERE entry = 1026;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 28 WHERE entry = 1027;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 28 WHERE entry = 1028;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 28 WHERE entry = 1029;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 28 WHERE entry = 1030;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 32 WHERE entry = 1031; -- http://web.archive.org/web/20070318163413/http://thottbot.com:80/q1031
UPDATE quest_template SET MinLevel = 26, QuestLevel = 32 WHERE entry = 1032; -- http://web.archive.org/web/20070316003731/http://thottbot.com:80/q1032
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1033;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 1034;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1035;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1037;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 30 WHERE entry = 1045;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 30 WHERE entry = 1046;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 25 WHERE entry = 1054;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 28 WHERE entry = 1055;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 18 WHERE entry = 1056;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 28 WHERE entry = 1140; -- http://www.wowhead.com/quest=1140/the-tower-of-althalaxx
UPDATE quest_template SET MinLevel = 13, QuestLevel = 28 WHERE entry = 1167; -- http://www.wowhead.com/quest=1167/the-tower-of-althalaxx
UPDATE quest_template SET MinLevel = 23, QuestLevel = 27 WHERE entry = 1918;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 29 WHERE entry = 4581;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 6383;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 26 WHERE entry = 6441;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 19 WHERE entry = 6442; -- http://www.wowhead.com/quest=6442/naga-at-the-zoram-strand
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 6462;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 6482; -- http://www.wowhead.com/quest=6482/freedom-to-ruul
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 6503;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 30 WHERE entry = 6504;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 19 WHERE entry = 6541;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 19 WHERE entry = 6542;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 19 WHERE entry = 6543;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 6544;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 19 WHERE entry = 6545;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 25 WHERE entry = 6546;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 6547;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 6562; -- http://web.archive.org/web/20101029075024/http://thottbot.com:80/q6562
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 6563;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 6564; -- http://www.wowhead.com/quest=6564/allegiance-to-the-old-gods
UPDATE quest_template SET MinLevel = 17, QuestLevel = 26 WHERE entry = 6565; -- http://www.wowhead.com/quest=6565/allegiance-to-the-old-gods
UPDATE quest_template SET MinLevel = 22, QuestLevel = 27 WHERE entry = 6571;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 27 WHERE entry = 6581;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 26 WHERE entry = 6621; -- http://web.archive.org/web/20070319190011/http://thottbot.com/q6621
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 6641; -- http://web.archive.org/web/20100809095311/http://thottbot.com:80/q6641
UPDATE quest_template SET MinLevel = 21, QuestLevel = 27 WHERE entry = 6921;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 30 WHERE entry = 6922; -- http://www.wowhead.com/quest=6922/baron-aquanis
UPDATE quest_template SET MinLevel = 25, QuestLevel = 34 WHERE entry = 7863; -- http://www.wowhead.com/quest=7863/sentinel-basic-care-package
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 7864;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7865;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 34 WHERE entry = 7866; -- http://www.wowhead.com/quest=7866/outrider-basic-care-package
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 7867;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7868;

-- Azshara
UPDATE quest_template SET MinLevel = 48, QuestLevel = 57 WHERE entry = 3382; -- http://www.wowhead.com/quest=3382/a-crew-under-fire
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 3421; -- http://www.wowhead.com/quest=3421/return-trip
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 3503; -- http://www.wowhead.com/quest=3503/meeting-with-the-master
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3517;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3518;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3541;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3542;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3561;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3562; -- http://www.wowhead.com/quest=3562/deprecated-magathas-payment-to-jediga
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3563;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3564;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3565;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 3601;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5141;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 5534; -- http://www.wowhead.com/quest=5534/kimjaels-missing-equipment
UPDATE quest_template SET MinLevel = 45, QuestLevel = 47 WHERE entry = 5535;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 47 WHERE entry = 5536;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8153;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8231;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8232;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8234;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8235;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8236;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8251;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8252;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8253;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8255;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8256;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8257;

-- Badlands
UPDATE quest_template SET MinLevel = 33, QuestLevel = 40 WHERE entry = 703;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 704; -- http://www.wowhead.com/quest=704/agmonds-fate
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 705; -- http://www.wowhead.com/quest=705/pearl-diving
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 706;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 708; -- http://www.wowhead.com/quest=708/the-black-box
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 709; -- http://www.wowhead.com/quest=709/solution-to-doom
UPDATE quest_template SET MinLevel = 35, QuestLevel = 37 WHERE entry = 710;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 39 WHERE entry = 711;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 712; -- http://www.wowhead.com/quest=712/study-of-the-elements-rock
UPDATE quest_template SET MinLevel = 35, QuestLevel = 37 WHERE entry = 713;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 37 WHERE entry = 714;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 37 WHERE entry = 715; -- http://www.wowhead.com/quest=715/liquid-stone
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 716; -- http://www.wowhead.com/quest=716/stone-is-better-than-cloth
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 717;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 38 WHERE entry = 718;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 719;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 720; -- http://www.wowhead.com/quest=720/a-sign-of-hope
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 721; -- http://www.wowhead.com/quest=721/a-sign-of-hope
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 722; -- http://www.wowhead.com/quest=722/amulet-of-secrets
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 723; -- http://www.wowhead.com/quest=723/prospect-of-faith
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 724; -- http://www.wowhead.com/quest=724/prospect-of-faith
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 725; -- http://www.wowhead.com/quest=725/passing-word-of-a-threat
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 726; -- http://www.wowhead.com/quest=726/passing-word-of-a-threat
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 727; -- http://www.wowhead.com/quest=727/to-ironforge-for-yagyins-digest
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 728; -- http://www.wowhead.com/quest=728/to-the-undercity-for-yagyins-digest
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 732;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 733; -- http://www.wowhead.com/quest=733/scrounging
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 734; -- http://www.wowhead.com/quest=734/this-is-going-to-be-hard
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 737; -- http://www.wowhead.com/quest=737/forbidden-knowledge
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 738;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 739; -- http://www.wowhead.com/quest=739/murdaloc
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 762; -- http://www.wowhead.com/quest=762/an-ambassador-of-evil
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 777; -- http://www.wowhead.com/quest=777/this-is-going-to-be-hard
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 778; -- http://www.wowhead.com/quest=778/this-is-going-to-be-hard
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 779;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 782;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 793;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 795;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 1139; -- http://www.wowhead.com/quest=1139/the-lost-tablets-of-will
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1559; -- http://www.wowhead.com/quest=1559/flash-bomb-recipe
UPDATE quest_template SET MinLevel = 36, QuestLevel = 42 WHERE entry = 2202; -- http://www.wowhead.com/quest=2202/uldaman-reagent-run
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 2203;
UPDATE quest_template SET MinLevel = 36, QuestLevel = 39 WHERE entry = 2258; -- http://www.wowhead.com/quest=2202/uldaman-reagent-run
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 2338;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 44 WHERE entry = 2339; -- http://www.wowhead.com/quest=2339/find-the-gems-and-power-source
UPDATE quest_template SET MinLevel = 37, QuestLevel = 44 WHERE entry = 2340; -- http://www.wowhead.com/quest=2340/deliver-the-gems
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 2418; -- http://www.wowhead.com/quest=2418/power-stones
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3821;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3906;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 56 WHERE entry = 3907; -- http://www.wowhead.com/quest=3907/disharmony-of-fire
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3981; -- http://www.wowhead.com/quest=3981/commander-gorshak
UPDATE quest_template SET MinLevel = 52, QuestLevel = 54 WHERE entry = 4061;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 54 WHERE entry = 4062;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4063; -- http://www.wowhead.com/quest=4063/the-rise-of-the-machines
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4081; -- http://www.wowhead.com/quest=4081/kill-on-sight-dark-iron-dwarves
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4082; -- http://www.wowhead.com/quest=4082/kill-on-sight-high-ranking-dark-iron-officials
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4122; -- http://www.wowhead.com/quest=4122/grark-lorkrub
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4132; -- http://www.wowhead.com/quest=4132/operation-death-to-angerforge
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4724;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4903;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4941;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4981;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5145;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 7201; -- http://www.wowhead.com/quest=7201/the-last-element

-- Barrens
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 63;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 96;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 100;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 220;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 15 WHERE entry = 819;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 15 WHERE entry = 821;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 24 WHERE entry = 822; -- http://www.wowhead.com/quest=822/chens-empty-keg
UPDATE quest_template SET MinLevel = 17, QuestLevel = 23 WHERE entry = 843;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 844; -- http://web.archive.org/web/20070410110302/http://www.thottbot.com:80/q844
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 845;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 26 WHERE entry = 846; -- http://www.wowhead.com/quest=846/revenge-of-gann
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 848;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 26 WHERE entry = 849; -- http://www.wowhead.com/quest=849/revenge-of-gann
UPDATE quest_template SET MinLevel = 11, QuestLevel = 16 WHERE entry = 850;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 18 WHERE entry = 851;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 19 WHERE entry = 852; -- http://web.archive.org/web/20100722085736/http://www.wowhead.com:80/quest=852/hezrul-bloodmark
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 853; -- http://www.wowhead.com/quest=853/deprecated-apothecary-zamah
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 855;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 30 WHERE entry = 857;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 858; -- http://www.wowhead.com/quest=858/ignition
UPDATE quest_template SET MinLevel = 15, QuestLevel = 23 WHERE entry = 862;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 863; -- http://www.wowhead.com/quest=863/the-escape
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 865;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 866; -- http://www.wowhead.com/quest=866/root-samples
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 867;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 868;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 13 WHERE entry = 869;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 870;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 871;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 872;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 27 WHERE entry = 873; -- http://www.wowhead.com/quest=873/isha-awak
UPDATE quest_template SET MinLevel = 9, QuestLevel = 27 WHERE entry = 874; -- http://www.wowhead.com/quest=874/mahren-skyseer
UPDATE quest_template SET MinLevel = 12, QuestLevel = 16 WHERE entry = 875; -- http://www.wowhead.com/quest=875/harpy-lieutenants
UPDATE quest_template SET MinLevel = 12, QuestLevel = 20 WHERE entry = 876; -- http://www.wowhead.com/quest=876/serena-bloodfeather
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 877;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 21 WHERE entry = 878;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 25 WHERE entry = 879;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 880; -- http://web.archive.org/web/20100821222957/http://thottbot.com:80/q880
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 881; -- http://web.archive.org/web/20070315144040/http://www.thottbot.com:80/q881
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 882; -- http://www.wowhead.com/quest=882/ishamuhale
UPDATE quest_template SET MinLevel = 10, QuestLevel = 22 WHERE entry = 883; -- http://www.wowhead.com/quest=883/lakotamani
UPDATE quest_template SET MinLevel = 10, QuestLevel = 24 WHERE entry = 884; -- http://www.wowhead.com/quest=884/owatanka
UPDATE quest_template SET MinLevel = 10, QuestLevel = 25 WHERE entry = 885; -- http://www.wowhead.com/quest=885/washte-pawne
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 887;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 888; -- http://www.wowhead.com/quest=888/depricated-stolen-booty
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 889; -- http://www.wowhead.com/quest=889/spirit-of-the-wind
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 890; -- http://www.wowhead.com/quest=890/deprecated-the-missing-shipment
UPDATE quest_template SET MinLevel = 13, QuestLevel = 20 WHERE entry = 891;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 892; -- http://www.wowhead.com/quest=892/deprecated-the-missing-shipment
UPDATE quest_template SET MinLevel = 17, QuestLevel = 24 WHERE entry = 893;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 894;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 16 WHERE entry = 895;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 896;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 24 WHERE entry = 897; -- http://www.wowhead.com/quest=897/the-harvester
UPDATE quest_template SET MinLevel = 13, QuestLevel = 20 WHERE entry = 898; -- http://www.wowhead.com/quest=898/free-from-the-hold
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 899;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 900; -- http://www.wowhead.com/quest=900/samophlange
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 901; -- http://www.wowhead.com/quest=901/samophlange
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 902; -- http://www.wowhead.com/quest=902/samophlange
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 903; -- http://web.archive.org/web/20070410034551/http://www.thottbot.com:80/q903
UPDATE quest_template SET MinLevel = 10, QuestLevel = 17 WHERE entry = 905; -- http://web.archive.org/web/20070408160742/http://thottbot.com:80/q905
UPDATE quest_template SET MinLevel = 17, QuestLevel = 25 WHERE entry = 906;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 18 WHERE entry = 907; -- http://www.wowhead.com/quest=907/enraged-thunder-lizards
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 913; -- http://www.wowhead.com/quest=913/cry-of-the-thunderhawk
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 924;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 14 WHERE entry = 926; -- http://www.wowhead.com/quest=926/flawed-power-stone
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 959;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 972;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1040; -- http://www.wowhead.com/quest=1040/passage-to-booty-bay
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 1060; -- http://www.wowhead.com/quest=1060/deprecated-letter-to-jinzil
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 1069;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 27 WHERE entry = 1095; -- http://www.wowhead.com/quest=1095/deprecated-further-instructions
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 1103; -- http://web.archive.org/web/20070511214905/http://thottbot.com:80/q1103
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1178;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 21 WHERE entry = 1483;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 1491; -- http://www.wowhead.com/quest=1491/smart-drinks
UPDATE quest_template SET MinLevel = 9, QuestLevel = 11 WHERE entry = 1492; -- http://www.wowhead.com/quest=1492/depricated-wharfmaster-dizzywig
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1528;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1529;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1530;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 1534;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1535;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1536;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1740;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1758;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1795;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 31 WHERE entry = 1796;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1799;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1801;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 2381;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 2478;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2985; -- http://www.wowhead.com/quest=2985/call-of-water
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2986; -- http://www.wowhead.com/quest=2986/call-of-water
UPDATE quest_template SET MinLevel = 10, QuestLevel = 18 WHERE entry = 3261; -- http://www.wowhead.com/quest=3261/deprecated-in-4-x-jorn-skyseer
UPDATE quest_template SET MinLevel = 9, QuestLevel = 18 WHERE entry = 3281; -- http://www.wowhead.com/quest=3281/deprecated-stolen-silver
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 3301; -- http://www.wowhead.com/quest=3301/mura-runetotem
UPDATE quest_template SET MinLevel = 15, QuestLevel = 25 WHERE entry = 3513; -- http://www.wowhead.com/quest=3513/the-runed-scroll
UPDATE quest_template SET MinLevel = 15, QuestLevel = 29 WHERE entry = 3514; -- http://www.wowhead.com/quest=3514/horde-presence
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3633;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3634;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3635;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3646; -- http://www.wowhead.com/quest=3646/membership-card-renewal
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 3921; -- http://www.wowhead.com/quest=3921/wenikee-boltbucket
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 3922; -- http://www.wowhead.com/quest=3922/nugget-slugs
UPDATE quest_template SET MinLevel = 10, QuestLevel = 18 WHERE entry = 3923; -- http://www.wowhead.com/quest=3923/deprecated-rilli-greasygob
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 3924; -- http://www.wowhead.com/quest=3924/depricated-samophlange-manual
UPDATE quest_template SET MinLevel = 11, QuestLevel = 20 WHERE entry = 4021; -- http://www.wowhead.com/quest=4021/counterattack
UPDATE quest_template SET MinLevel = 31, QuestLevel = 31 WHERE entry = 4736;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 31 WHERE entry = 4737;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 31 WHERE entry = 4738;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 31 WHERE entry = 4739;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 34 WHERE entry = 4781;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 34 WHERE entry = 4782;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 37 WHERE entry = 4783;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 37 WHERE entry = 4784;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 37 WHERE entry = 4785;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 38 WHERE entry = 4786;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 4921;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4961;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4962;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4963;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4964; -- http://www.wowhead.com/quest=4964/the-completed-orb-of-darorahil
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 4965;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 4967;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 4968;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 35 WHERE entry = 4969;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4975; -- http://www.wowhead.com/quest=4975/the-completed-orb-of-nohorahil
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 4976;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 5041;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 5042; -- http://www.wowhead.com/quest=5042/agamaggans-strength
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 5043; -- http://www.wowhead.com/quest=5043/agamaggans-agility
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 5044; -- http://www.wowhead.com/quest=5044/wisdom-of-agamaggan
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 5045; -- http://www.wowhead.com/quest=5045/rising-spirit
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 5046; -- http://www.wowhead.com/quest=5046/razorhide
UPDATE quest_template SET MinLevel = 14, QuestLevel = 21 WHERE entry = 5052; -- http://www.wowhead.com/quest=5052/blood-shards-of-agamaggan
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6128;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6129;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6361; -- http://web.archive.org/web/20070419144304/http://www.thottbot.com:80/q6361
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6362;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6363;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6364;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6365;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 6382;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6384;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6385; -- http://web.archive.org/web/20070410131959/http://www.thottbot.com:80/q6385
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6386;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 60 WHERE entry = 9267; -- http://www.wowhead.com/quest=9267/mending-old-wounds

-- Blasted Lands
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 1395;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 1477;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 2521; -- http://www.wowhead.com/quest=2521/to-serve-kumisha
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 2522; -- http://www.wowhead.com/quest=2522/kumishas-endeavors
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2581;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2582;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2583;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2584;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2585;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2586;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2601;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2602;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2603;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2604;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2621; -- http://www.wowhead.com/quest=2621/the-disgraced-one
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2622; -- http://www.wowhead.com/quest=2622/the-missing-orders
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 2623; -- http://www.wowhead.com/quest=2623/the-swamp-talker
UPDATE quest_template SET MinLevel = 45, QuestLevel = 57 WHERE entry = 2681; -- http://www.wowhead.com/quest=2681/the-stones-that-bind-us
UPDATE quest_template SET MinLevel = 45, QuestLevel = 57 WHERE entry = 2701; -- http://www.wowhead.com/quest=2701/heroes-of-old
UPDATE quest_template SET MinLevel = 45, QuestLevel = 57 WHERE entry = 2702; -- http://www.wowhead.com/quest=2702/heroes-of-old
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 2721; -- http://www.wowhead.com/quest=2721/kirith
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 2743; -- http://www.wowhead.com/quest=2743/the-cover-of-darkness
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 2744; -- http://www.wowhead.com/quest=2744/the-demon-hunter
UPDATE quest_template SET MinLevel = 50, QuestLevel = 57 WHERE entry = 2783;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2784; -- http://www.wowhead.com/quest=2784/fall-from-grace
UPDATE quest_template SET MinLevel = 45, QuestLevel = 57 WHERE entry = 2801; -- http://www.wowhead.com/quest=2801/a-tale-of-sorrow
UPDATE quest_template SET MinLevel = 45, QuestLevel = 57 WHERE entry = 3141; -- http://www.wowhead.com/quest=3141/loramus
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 3501; -- http://www.wowhead.com/quest=3501/everything-counts-in-large-amounts
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 3502; -- http://www.wowhead.com/quest=3502/one-draeneis-junk
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3508; -- http://www.wowhead.com/quest=3508/breaking-the-ward
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3509; -- http://www.wowhead.com/quest=3509/the-name-of-the-beast
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3510; -- http://www.wowhead.com/quest=3510/the-name-of-the-beast
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3511; -- http://www.wowhead.com/quest=3511/the-name-of-the-beast
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3602; -- http://www.wowhead.com/quest=3602/azsharite
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3621; -- http://www.wowhead.com/quest=3621/the-formation-of-felbane
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3625; -- http://www.wowhead.com/quest=3625/enchanted-azsharite-fel-weaponry
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 3626; -- http://www.wowhead.com/quest=3626/return-to-the-blasted-lands
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 3627; -- http://www.wowhead.com/quest=3627/uniting-the-shattered-amulet
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 3628; -- http://www.wowhead.com/quest=3628/you-are-rakhlikh-demon
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8423;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 8424;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8425;

-- Burning Steppes
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3801; -- http://www.wowhead.com/quest=3801/dark-iron-legacy
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3802; -- http://www.wowhead.com/quest=3802/dark-iron-legacy
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 3822; -- http://www.wowhead.com/quest=3822/kromgrul
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3823;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 3824; -- http://www.wowhead.com/quest=3824/gortesh-the-brute-lord
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 3825; -- http://www.wowhead.com/quest=3825/ogre-head-on-a-stick-party
UPDATE quest_template SET MinLevel = 52, QuestLevel = 54 WHERE entry = 4022;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 54 WHERE entry = 4023; -- http://www.wowhead.com/quest=4023/a-taste-of-flame
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4024;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4121; -- http://www.wowhead.com/quest=4121/precarious-predicament
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4182;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4183; -- true masters
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4241;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4262;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 56 WHERE entry = 4263; -- http://www.wowhead.com/quest=4263/incendius
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 4283;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 4296;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4463; -- http://www.wowhead.com/quest=4463/libram-of-rumination
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4481; -- http://www.wowhead.com/quest=4481/libram-of-constitution
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4482; -- http://www.wowhead.com/quest=4482/libram-of-tenacity
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4483; -- http://www.wowhead.com/quest=4483/libram-of-resilience
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4484; -- http://www.wowhead.com/quest=4484/libram-of-voracity
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4701;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 4726;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4729;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4734;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4735; -- http://www.wowhead.com/quest=4735/egg-collection
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4764;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4765; -- http://www.wowhead.com/quest=4765/delivery-to-ridgewell
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4766;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4808; -- http://www.wowhead.com/quest=4808/felnok-steelspring
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4809; -- http://www.wowhead.com/quest=4809/chillwind-horns
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4810; -- http://www.wowhead.com/quest=4810/return-to-tinkee
UPDATE quest_template SET MinLevel = 55, QuestLevel = 59 WHERE entry = 4862;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4866;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 4907;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5081; -- http://www.wowhead.com/quest=5081/maxwells-mission
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5102;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 6402; -- http://www.wowhead.com/quest=6402/stormwind-rendezvous
UPDATE quest_template SET MinLevel = 60, QuestLevel = 58 WHERE entry = 7562; -- http://web.archive.org/web/20070410190453/http://www.thottbot.com:80/q7562
UPDATE quest_template SET MinLevel = 60, QuestLevel = 58 WHERE entry = 7563; -- http://web.archive.org/web/20070410131416/http://www.thottbot.com:80/q7563
UPDATE quest_template SET MinLevel = 60, QuestLevel = 58 WHERE entry = 7564; -- http://web.archive.org/web/20070322112248/http://www.thottbot.com:80/q7564
UPDATE quest_template SET MinLevel = 60, QuestLevel = 58 WHERE entry = 7623; -- http://web.archive.org/web/20070322112319/http://www.thottbot.com:80/q7623
UPDATE quest_template SET MinLevel = 60, QuestLevel = 58 WHERE entry = 7624; -- http://web.archive.org/web/20070320211742/http://www.thottbot.com:80/q7624
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7625;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7626;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7627;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7628;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7629;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7630;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7631;

-- Coldridge Valley
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 170;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 179;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 182;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 183;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 218; -- http://web.archive.org/web/20110509010415/http://www.wowhead.com/quest=218
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 233;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 234;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 282; -- http://web.archive.org/web/20101118062859/http://www.wowhead.com:80/quest=282
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 420; -- http://web.archive.org/web/20100924054636/http://www.wowhead.com:80/quest=420
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 1599;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 2160;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3106;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3107;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3108;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3109;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3110;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3112;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3113;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3114;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3115;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 3 WHERE entry = 3361; -- http://web.archive.org/web/20070408194840/http://www.thottbot.com:80/q3361
UPDATE quest_template SET MinLevel = 4, QuestLevel = 5 WHERE entry = 3364;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 5 WHERE entry = 3365;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5841; -- http://www.wowhead.com/quest=5841/welcome

-- Darkmoon Faire
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7881;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7882; -- http://web.archive.org/web/20070716215352/http://www.thottbot.com:80/q7882
UPDATE quest_template SET MinLevel = 20, QuestLevel = 60 WHERE entry = 7883; -- http://web.archive.org/web/20070527103756/http://www.thottbot.com:80/q7883
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7884; -- http://web.archive.org/web/20070716215550/http://www.thottbot.com:80/q7884
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7885; -- http://web.archive.org/web/20070515085228/http://thottbot.com:80/q7885
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7889;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7890; -- http://web.archive.org/web/20070607181053/http://www.thottbot.com:80/q7890
UPDATE quest_template SET MinLevel = 20, QuestLevel = 60 WHERE entry = 7891; -- http://web.archive.org/web/20070510090450/http://www.thottbot.com:80/q7891
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7892;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7893;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7894;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7895;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 60 WHERE entry = 7896;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7897;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7898;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7899;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7900;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 60 WHERE entry = 7901;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7902;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7903;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7907;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7927;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7928;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 7929;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 60 WHERE entry = 7930;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 60 WHERE entry = 7931;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7932;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7933;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 60 WHERE entry = 7934;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 7935;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7936;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7937;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7938;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7939;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 7940;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7941;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7942;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7943;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7944;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7945;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 7946;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 7981;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8222;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8223;

-- Darkshore
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 729;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 731;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 741;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 942;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 24 WHERE entry = 943;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 944;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 18 WHERE entry = 945;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 947;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 948;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 949;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 950;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 20 WHERE entry = 951;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 953;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 12 WHERE entry = 954;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 12 WHERE entry = 955;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 13 WHERE entry = 956;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 13 WHERE entry = 957;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 958;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 960;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 961;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 16 WHERE entry = 963;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 965;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 966;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 967;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 968;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 31 WHERE entry = 981;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 17 WHERE entry = 982;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 983;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 984;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 985;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 986;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 993;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 22 WHERE entry = 994;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 995;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 12 WHERE entry = 1001;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 14 WHERE entry = 1002;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 16 WHERE entry = 1003;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 17 WHERE entry = 1138;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 1141;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 31 WHERE entry = 1143;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 1275;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 1579;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 1580;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 2078;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 2098;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 2118;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 2138;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 18 WHERE entry = 2139;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 2178;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 13 WHERE entry = 3524;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 14 WHERE entry = 4681;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 13 WHERE entry = 4722;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 13 WHERE entry = 4723;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 4725;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 4727;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 14 WHERE entry = 4728;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 16 WHERE entry = 4730;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 19 WHERE entry = 4731;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 19 WHERE entry = 4732;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 19 WHERE entry = 4733;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 18 WHERE entry = 4740;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 15 WHERE entry = 4761;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 15 WHERE entry = 4762;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 18 WHERE entry = 4763;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 14 WHERE entry = 4811;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 14 WHERE entry = 4812;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 14 WHERE entry = 4813;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 20 WHERE entry = 5321;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 5713;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6123;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6124;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6341;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6342;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6343;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6344;

-- Darnassus
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 27;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 730;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 923;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1038;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1039;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1047;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 1198;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1199;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 18 WHERE entry = 1582;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2260;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3763;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3764;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3781;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3785;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 3803;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 4493;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4510;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5091;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5627;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5628;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5629;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5630;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5631;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5632;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5633;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5672;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5673;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5674;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5675;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5921;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5925;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6001;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6121;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 6761;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 6762;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7671;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7672;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7797;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7798;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7799;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7800;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7801;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8357;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8872;

-- Deathknell
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 8;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 363;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 364;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 2 WHERE entry = 376;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 380;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 381;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 5 WHERE entry = 382;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 5 WHERE entry = 383;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 590;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 1470;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3095;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3096;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3097;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3098;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3099;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 3901;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 3 WHERE entry = 3902;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5847;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 5 WHERE entry = 6395;

-- Deeprun Tram
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 6661;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 6662;

-- Desolace
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 6132;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 6134;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 261;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 1361;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 1362;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1365;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 31 WHERE entry = 1366;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1367;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1368;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1369;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1370;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1371;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1373;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1374;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1375;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 1380;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 1381;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1382;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 1384;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1385;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 1386;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 31 WHERE entry = 1387;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1437;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1438;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1439;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1440;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 1454;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 1455;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 1456;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 1457;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1458;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1459;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1465;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1466;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1467;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 38 WHERE entry = 5381;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 5386;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 1 WHERE entry = 5421;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 39 WHERE entry = 5501;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 5561;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 38 WHERE entry = 5581;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 5741;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 5763;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 5821;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 38 WHERE entry = 5943;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 6027;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 6141;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 35 WHERE entry = 6142;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 36 WHERE entry = 6143;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 6161;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6568;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6602;

-- Dun Morogh
UPDATE quest_template SET MinLevel = 7, QuestLevel = 9 WHERE entry = 287;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 10 WHERE entry = 291;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 7 WHERE entry = 308;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 6 WHERE entry = 310;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 7 WHERE entry = 311;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 12 WHERE entry = 312;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 313;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 12 WHERE entry = 314;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 9 WHERE entry = 315;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 6 WHERE entry = 317;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 7 WHERE entry = 318;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 8 WHERE entry = 319;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 8 WHERE entry = 320;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 7 WHERE entry = 384;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 5 WHERE entry = 400;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 403;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 412;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 10 WHERE entry = 413;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 10 WHERE entry = 414;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 10 WHERE entry = 415;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 11 WHERE entry = 417;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 10 WHERE entry = 419;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 9 WHERE entry = 432;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 433;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1645;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1646;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1647;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1648;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1778;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1779;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1783;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1784;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1785;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1789;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2218;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2239;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2298;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2299;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 2962;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 2997;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 2999;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 3000;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 5541;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5625;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5626;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7673;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7674;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7675;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7676;

-- Dungeon Set
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8905;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8906;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8907;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8908;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8909;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8910;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8911;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8912;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8913;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8914;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8915;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8916;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8917;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8918;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8919;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8920;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8921;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8922;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8923;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8924;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8925;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8926;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8927;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8928;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8929;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8930;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8931;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8932;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8933;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8934;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8935;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8936;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8937;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8938;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8939;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8940;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8941;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8942;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8943;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8944;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8945;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8946;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8947;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8948;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8949;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8950;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8951;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8952;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8953;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8954;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8955;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8956;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8957;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8958;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8959;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8960;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8961;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8962;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8963;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8964;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8965;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8966;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8967;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8968;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8969;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8970;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8977;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8978;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8985;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8986;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8987;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8988;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8989;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8990;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8991;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8992;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8994;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8995;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8996;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8997;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8998;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8999;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9000;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9001;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9002;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9003;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9004;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9005;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9006;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9007;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9008;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9009;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9010;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9011;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9012;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9013;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9014;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9015;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9016;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9017;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9018;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9019;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9020;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9021;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9022;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9032;

-- Durotar
UPDATE quest_template SET MinLevel = 3, QuestLevel = 7 WHERE entry = 784;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 786;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 791;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 806;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 808;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 13 WHERE entry = 809;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 9 WHERE entry = 812;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 9 WHERE entry = 813;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 8 WHERE entry = 815;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 11 WHERE entry = 816;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 817;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 7 WHERE entry = 818;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 823;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 8 WHERE entry = 825;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 826;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 827;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 828;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 829;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 7 WHERE entry = 830;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 7 WHERE entry = 831;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 832;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 9 WHERE entry = 834;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 11 WHERE entry = 835;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 10 WHERE entry = 837;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 840;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 842;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1464;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1506;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1522;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1523;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1524;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 1525;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1526;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1527;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1859;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 2161;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2380;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2983;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2984;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 4641;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5648;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5649;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5652;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5654;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5655;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5656;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5657;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6062;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6068;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6069;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6070;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6081;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6082;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6083;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7664;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7665;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8358;

-- Duskwood
UPDATE quest_template SET MinLevel = 17, QuestLevel = 20 WHERE entry = 5;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 32 WHERE entry = 55;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 56;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 26 WHERE entry = 57;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 30 WHERE entry = 58;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 66;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 67;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 68;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 69;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 70;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 72;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 74;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 75;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 78;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 79;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 80;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 25 WHERE entry = 90;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 20 WHERE entry = 93;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 95;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 97;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 35 WHERE entry = 98;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 25 WHERE entry = 101;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 133;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 134;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 148;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 149;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 154;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 156;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 157;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 158;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 159;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 160;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 20 WHERE entry = 163;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 23 WHERE entry = 164;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 25 WHERE entry = 165;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 173;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 174;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 175;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 177;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 181;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 29 WHERE entry = 221;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 31 WHERE entry = 222;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 31 WHERE entry = 223;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 225;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 21 WHERE entry = 226;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 227;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 228;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 229;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 230;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 231;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 20 WHERE entry = 240;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 245;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 251;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 252;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 253;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 35 WHERE entry = 254;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 262;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 265;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 266;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 268;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 269;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 323;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 337;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 26 WHERE entry = 377;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 401;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 453;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1042;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1043;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1044;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 1372;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 1383;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 1388;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 1391;

-- Dustwallow
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1166;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1168;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1169;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1170;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1171;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 1172;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 1173;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 36 WHERE entry = 1177;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1201;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1202;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1203;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 38 WHERE entry = 1204;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 1205;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1206;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1218;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1219;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1220;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1222;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1238;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1239;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1240;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1251;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1252;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1253;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 40 WHERE entry = 1258;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1259;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 38 WHERE entry = 1260;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1261;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1262;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1268;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1269;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1270;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1271;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1273;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1276;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1282;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1284;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1285;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1286;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1287;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1301;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1302;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1319;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1320;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1321;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1322;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1323;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6582;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6583;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6584;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6585;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6601;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6607;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 7541;

-- Eastern Plaguelands
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5142;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5149;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5152;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5153;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5154;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5168;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 57 WHERE entry = 5181;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5206;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5210;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5211;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5212;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5213;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5214;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5241;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5243;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5251;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5263;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5264;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5265;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5281;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5282;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5463;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5464;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5465;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5503;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5508;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5509;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5510;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5513;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5517;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5601;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5721;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5901;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5902;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5903;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5904;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5941;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5942;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 6021;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 6022;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 6024;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 6026;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 6041;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 6042;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 6133;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6135;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6136;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6144;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6145;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6146;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6147;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6148;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6163;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 6164;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 6389;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 6390;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7621;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7622;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9211;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9213;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9131;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9132;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9128;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9129;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9126;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9127;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9136;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9137;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9124;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9125;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9141;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9221;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9222;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9223;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9224;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9225;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9226;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9227;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9228;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9142;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9188;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9178;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9203;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9197;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9195;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9201;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9182;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9179;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9206;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9202;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9200;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9205;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9183;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9185;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9191;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9190;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9187;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9204;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9196;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9198;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9181;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9186;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9184;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9194;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9232;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9233;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9234;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9235;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9236;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9237;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9238;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9239;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9240;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9241;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9242;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9243;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9244;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9245;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9246;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9229;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9230;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9165;

-- Elwynn Forest
UPDATE quest_template SET MinLevel = 6, QuestLevel = 10 WHERE entry = 11;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 16;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 35;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 37;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 39;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 40;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 45;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 46;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 47;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 52;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 59;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 7 WHERE entry = 60;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 7 WHERE entry = 61;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 62;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 71;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 76;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 83;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 84;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 85;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 86;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 87;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 9 WHERE entry = 88;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 21 WHERE entry = 94;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 106;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 107;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 10 WHERE entry = 109;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 111;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 7 WHERE entry = 112;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 7 WHERE entry = 114;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 123;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 147;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 11 WHERE entry = 176;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 9 WHERE entry = 184;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 10 WHERE entry = 239;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1641;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1642;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1643;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1644;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1685;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1780;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1781;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1786;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1787;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 13 WHERE entry = 1788;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 1790;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 2158;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2205;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2281;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2300;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 2998;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 12 WHERE entry = 3681;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 9 WHERE entry = 5545;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5623;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5624;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7677;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7678;

-- Felwood
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 939;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 996;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 998;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 1514;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 2523;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 2878;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 3363;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4101;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4102;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4103;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4104;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4105;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4106;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4107;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4108;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4109;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4110;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4111;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4112;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4113;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4114;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4115;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4116;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4117;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4118;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4119;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4221;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4222;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 56 WHERE entry = 4261;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4343;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4401;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4403;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4421;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4441;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4442;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4443;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4444;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4445;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4446;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4447;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4448;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4461;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4462;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4464;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4465;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4466;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4467;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4505;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4506;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 4906;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 51 WHERE entry = 5155;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 5156;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 5157;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 5158;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 5159;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5165;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 55 WHERE entry = 5202;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 55 WHERE entry = 5203;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 57 WHERE entry = 5204;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 58 WHERE entry = 5242;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 57 WHERE entry = 5385;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5882;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5883;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5884;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5885;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5886;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5887;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5888;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5889;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5890;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 5891;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 6162;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 7601;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 7602;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 7603;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7632;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7633;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7634;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7635;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7636;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8420;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8421;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8422;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 6131;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8461;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8462;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8465;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8466;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8467;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 8470;

-- Feralas
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2766;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2767;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 2821;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 2822;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2844;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2845;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2847;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2848;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2849;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2850;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2851;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2852;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2853;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2854;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2855;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2856;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2857;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2858;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2859;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 2860;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 42 WHERE entry = 2862;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 43 WHERE entry = 2863;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 2866;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 2867;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 2869;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2870;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2871;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 50 WHERE entry = 2879;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 43 WHERE entry = 2902;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 43 WHERE entry = 2903;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2939;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2940;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 2941;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 50 WHERE entry = 2942;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 2943;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 2944;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 2969;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 2970;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 2972;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 2973;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 2974;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 2975;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 45 WHERE entry = 2976;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 2978;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 2979;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 44 WHERE entry = 2980;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 2981;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 44 WHERE entry = 2982;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 2987;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 3002;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 3062;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 3063;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 3121;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 3122;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 3123;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 3124;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 3125;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3126;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3127;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3128;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3129;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 3130;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 25 WHERE entry = 3567;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3787;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3788;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3791;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 3792;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 3841;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 3842;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 3843;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4041;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4120;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 4124;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 4125;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 4127;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 4129;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 4130;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 4131;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 4135;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 4265;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 4266;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 4267;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 4281;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 47 WHERE entry = 4297;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 48 WHERE entry = 4298;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5143;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 7003;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 7721;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 7725;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 7726;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 45 WHERE entry = 7730;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 47 WHERE entry = 7731;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 7732;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 7733;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 7734;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 7735;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 7738;

-- Hillsbrad Foothills
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 7321;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 20 WHERE entry = 494;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 22 WHERE entry = 496;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 498;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 22 WHERE entry = 499;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 500;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 24 WHERE entry = 501;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 24 WHERE entry = 502;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 36 WHERE entry = 503;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 504;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 33 WHERE entry = 505;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 36 WHERE entry = 506;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 42 WHERE entry = 507;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 28 WHERE entry = 509;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 34 WHERE entry = 510;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 511;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 36 WHERE entry = 512;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 28 WHERE entry = 513;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 514;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 515;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 517;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 518;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 41 WHERE entry = 519;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 43 WHERE entry = 520;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 43 WHERE entry = 521;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 522;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 523;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 524;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 527;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 25 WHERE entry = 528;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 26 WHERE entry = 529;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 26 WHERE entry = 532;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 533;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 536;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 537;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 28 WHERE entry = 539;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 38 WHERE entry = 540;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 30 WHERE entry = 541;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 38 WHERE entry = 542;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 544;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 545;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 546;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 30 WHERE entry = 547;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 549;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 32 WHERE entry = 550;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 33 WHERE entry = 552;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 33 WHERE entry = 553;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 40 WHERE entry = 554;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 555;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 556;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 557;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 32 WHERE entry = 559;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 32 WHERE entry = 560;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 32 WHERE entry = 561;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 32 WHERE entry = 562;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 32 WHERE entry = 563;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 564;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 565;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 566;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 28 WHERE entry = 567;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 676;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 23 WHERE entry = 1066;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 23 WHERE entry = 1067;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 23 WHERE entry = 1086;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 1658;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2480;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 24 WHERE entry = 6681;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 60 WHERE entry = 6701;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 6701;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 8249;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 8373;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 8411;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8412;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8413;

-- Hinterlands
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 77;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 48 WHERE entry = 485;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 48 WHERE entry = 836;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 53 WHERE entry = 1446;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2742;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2782;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 2877;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2880;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2881;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 2932;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 2933;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2934;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2935;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2936;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 2937;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 2938;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2988;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 2989;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2990;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2991;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2992;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2993;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 53 WHERE entry = 2994;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 3661;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 50 WHERE entry = 7815;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7816;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7828;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7829;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7830;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7839;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 7840;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7841;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7842;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 50 WHERE entry = 7843;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 48 WHERE entry = 7844;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 7845;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 7846;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 7847;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 50 WHERE entry = 7849;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 50 WHERE entry = 7850;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 7861;
UPDATE quest_template SET MinLevel = 46, QuestLevel = 51 WHERE entry = 7862;

-- Ironforge
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 467;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 525;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 683;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 686;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 31 WHERE entry = 689;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 31 WHERE entry = 700;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 707;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 44 WHERE entry = 735;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 23 WHERE entry = 971;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1019;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 1050;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 43 WHERE entry = 1360;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1442;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1453;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 12 WHERE entry = 1578;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 16 WHERE entry = 1618;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 21 WHERE entry = 1653;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1654;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1655;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1715;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1717;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1794;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1802;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1804;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1806;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 2039;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 2041;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 2199;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 2200;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2238;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 44 WHERE entry = 2361;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2439;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 46 WHERE entry = 2769;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 2927;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 35 WHERE entry = 2929;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 2930;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 28 WHERE entry = 2931;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2946;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 2948;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2963;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 3375;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3448;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3449;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3450;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3451;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3461;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3483;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3632;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3640;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3641;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3645;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 3701;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 3702;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3790;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3629;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 4341;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 4362;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4512;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4513;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5090;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 5283;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 5284;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5641;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5645;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6609;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6612;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6625;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7022;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7025;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7042;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 7045;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7062;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7063;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 7342;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7638;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7639;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7802;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7803;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7804;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7805;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7806;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7807;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7808;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7809;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7811;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7812;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 60 WHERE entry = 7905;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8353;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8355;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8762;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8763;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8870;

-- Kharanos
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6064;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6074;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6075;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6076;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6084;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6085;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6086;

-- Loch Modan
UPDATE quest_template SET MinLevel = 38, QuestLevel = 42 WHERE entry = 17;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 161;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 199;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 17 WHERE entry = 217;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 224;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 237;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 250;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 19 WHERE entry = 255;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 256;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 16 WHERE entry = 257;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 17 WHERE entry = 258;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 263;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 267;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 271;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 273;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 274;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 278;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 18 WHERE entry = 280;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 20 WHERE entry = 283;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 297;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 298;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 301;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 302;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 307;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 309;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 385;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 416;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 11 WHERE entry = 418;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 436;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 454;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 531;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 1338;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 1339;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 2038;
UPDATE quest_template SET MinLevel = 36, QuestLevel = 39 WHERE entry = 2500;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 2501;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6387;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6388;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6391;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6392;

-- Moonglade
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 28;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 29;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 30;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 31;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 272;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1124;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 1185;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 5061;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5526;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 5527;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5929;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5930;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5931;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5932;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6122;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6125;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6127;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6130;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 6845;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8862;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8863;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8864;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8865;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8868;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 8876;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8877;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 8878;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 60 WHERE entry = 8879;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8880;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 8881;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 8882;

-- Mulgore
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 743;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 6 WHERE entry = 745;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 8 WHERE entry = 746;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 5 WHERE entry = 748;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 749;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 751;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 6 WHERE entry = 754;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 756;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 8 WHERE entry = 758;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 759;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 760;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 6 WHERE entry = 761;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 10 WHERE entry = 764;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 765;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 766;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 6 WHERE entry = 767;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 12 WHERE entry = 770;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 7 WHERE entry = 771;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 7 WHERE entry = 772;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 10 WHERE entry = 773;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 10 WHERE entry = 775;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 14 WHERE entry = 776;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 833;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 854;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 861;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5926;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6061;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6065;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6066;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6067;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6087;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6088;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6089;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7662;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7663;

-- Northshire
UPDATE quest_template SET MinLevel = 2, QuestLevel = 5 WHERE entry = 6;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 7;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 15;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 18;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 21;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 33;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 54;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 783;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 1598;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3100;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3101;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3102;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3103;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3104;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3105;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3903;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3904;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3905;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 5261;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5805;

-- Orgrimmar
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 81;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 172;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 235;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 649;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 48 WHERE entry = 650;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 936;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1018;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 17 WHERE entry = 1061;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1431;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1432;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1433;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1434;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1435;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1436;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1480;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1481;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 35 WHERE entry = 1482;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 33 WHERE entry = 1484;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 40 WHERE entry = 1488;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1501;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1504;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1507;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1508;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1509;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1510;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1511;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1512;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1513;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1515;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1858;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1963;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 2283;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 2284;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 44 WHERE entry = 2341;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2379;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2382;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2458;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2460;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 2479;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 32 WHERE entry = 2751;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 32 WHERE entry = 2752;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 36 WHERE entry = 2753;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 36 WHERE entry = 2754;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 36 WHERE entry = 2755;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 2756;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 2757;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 35 WHERE entry = 2841;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 35 WHERE entry = 2842;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 2950;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 2996;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 53 WHERE entry = 3504;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 53 WHERE entry = 3505;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 56 WHERE entry = 3506;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 56 WHERE entry = 3507;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4002;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 59 WHERE entry = 4003;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4300;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 4494;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4511;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4974;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5093;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 5301;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 5302;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5642;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5643;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5680;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 5726;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 5727;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5728;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 5729;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5730;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5761;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5927;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6566;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6567;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6608;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6611;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6623;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 6961;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 6962;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 6963;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 6964;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 6984;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7061;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 7341;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7490;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7491;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7493;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7660;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 1 WHERE entry = 7661;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 7666;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 7667;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7783;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7784;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7824;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7826;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7827;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7831;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7832;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7833;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7834;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7835;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7836;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7837;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 60 WHERE entry = 7926;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8258;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8312;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8359;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8746;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 8763;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8873;

-- Ratchet
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 3631;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4487;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4488;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4489;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4490;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 55 WHERE entry = 4502;

-- Red Cloud Mesa
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 747;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 750;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 752;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 753;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 755;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 757;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 763;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 780;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 781;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1462;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1519;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1520;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1521;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 1656;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3091;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3092;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3093;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3094;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 5 WHERE entry = 3376;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5844;

-- Redridge Mountains
UPDATE quest_template SET MinLevel = 18, QuestLevel = 25 WHERE entry = 19;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 21 WHERE entry = 20;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 34;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 89;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 23 WHERE entry = 91;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 18 WHERE entry = 92;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 23 WHERE entry = 115;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 116;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 118;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 119;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 120;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 121;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 122;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 124;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 16 WHERE entry = 125;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 25 WHERE entry = 126;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 21 WHERE entry = 127;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 128;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 129;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 130;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 131;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 143;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 144;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 18 WHERE entry = 145;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 18 WHERE entry = 146;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 150;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 26 WHERE entry = 169;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 23 WHERE entry = 178;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 26 WHERE entry = 180;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 25 WHERE entry = 219;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 16 WHERE entry = 244;
UPDATE quest_template SET MinLevel = 11, QuestLevel = 17 WHERE entry = 246;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 248;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 249;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 25 WHERE entry = 386;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 20 WHERE entry = 2282;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 3741;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4184;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4223;

-- Searing Gorge
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3181;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3182;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3201;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3367;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3368;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 3371;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 52 WHERE entry = 3372;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3377;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3378;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3379;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3385;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3402;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3441;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3442;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 48 WHERE entry = 3443;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3452;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3453;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3454;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3462;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 52 WHERE entry = 3463;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3481;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 52 WHERE entry = 3566;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 45 WHERE entry = 4449;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 46 WHERE entry = 4450;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 47 WHERE entry = 4451;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5144;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 7701;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 7722;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 49 WHERE entry = 7723;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 49 WHERE entry = 7724;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 49 WHERE entry = 7727;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 7728;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 48 WHERE entry = 7729;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7736;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 7737;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8241;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8242;

-- Shadowglen
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 456;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 457;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 458;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 459;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 4 WHERE entry = 916;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 917;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 920;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 921;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 928;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3116;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3117;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3118;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3119;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3120;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 4495;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5842;

-- Silithus
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1125;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 1126;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 6844;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7521;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7785;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7786;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7787;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 8275;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 8276;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 8277;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 8278;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 8279;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 8280;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 8281;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 8282;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 59 WHERE entry = 8283;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 58 WHERE entry = 8284;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 59 WHERE entry = 8285;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8286;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 60 WHERE entry = 8287;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8288;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8301;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8302;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8303;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8304;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8305;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8306;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 8307;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8308;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8309;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8310;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 8313;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8314;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8315;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8316;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 57 WHERE entry = 8317;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 8318;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 8319;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8320;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8321;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 59 WHERE entry = 8323;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 59 WHERE entry = 8324;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8331;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8332;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8333;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8341;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8342;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8343;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8348;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8349;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8351;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8352;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8361;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8362;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8363;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8364;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8376;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8377;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8378;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8379;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8380;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8381;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 8382;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8496;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8497;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8498;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8501;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8502;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8507;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8508;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8519;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8534;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8535;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8536;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8537;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8538;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8539;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8540;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8541;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8548;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8555;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8572;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8573;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8574;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8687;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8731;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8732;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8737;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8738;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8739;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8740;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8770;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8771;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8772;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8773;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8774;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8775;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8776;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8777;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8778;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8779;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8780;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8781;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8782;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8783;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8785;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8786;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8787;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8804;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8805;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8806;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8807;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8808;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8809;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8810;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8829;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8857;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8858;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8859;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9023;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 9248;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 9338;

-- Silverpine
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 99;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 10 WHERE entry = 421;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 11 WHERE entry = 422;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 423;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 424;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 425;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 428;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 429;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 430;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 435;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 437;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 438;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 439;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 440;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 441;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 24 WHERE entry = 442;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 17 WHERE entry = 443;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 17 WHERE entry = 444;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 446;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 447;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 448;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 449;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 450;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 18 WHERE entry = 451;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 452;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 17 WHERE entry = 460;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 461;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 477;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 478;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 479;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 22 WHERE entry = 480;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 481;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 14 WHERE entry = 482;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 491;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 20 WHERE entry = 493;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 21 WHERE entry = 516;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 27 WHERE entry = 1014;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 1358;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 1359;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 12 WHERE entry = 3221;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6321;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6322;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6323;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6324;

-- Stonetalon Mountains
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 1057;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 1058;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 27 WHERE entry = 1059;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 19 WHERE entry = 1062;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 1063;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 23 WHERE entry = 1068;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1070;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1071;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1072;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1073;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1074;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1075;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1076;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1077;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 26 WHERE entry = 1078;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1079;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1080;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 28 WHERE entry = 1081;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1082;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 1083;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 28 WHERE entry = 1084;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 21 WHERE entry = 1085;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1087;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 1088;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 1089;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1090;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1091;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 22 WHERE entry = 1092;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 21 WHERE entry = 1093;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 21 WHERE entry = 1094;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 27 WHERE entry = 1096;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 21 WHERE entry = 1134;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 5881;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 26 WHERE entry = 6282;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 26 WHERE entry = 6283;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 21 WHERE entry = 6284;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 23 WHERE entry = 6301;
UPDATE quest_template SET MinLevel = 17, QuestLevel = 25 WHERE entry = 6381;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 25 WHERE entry = 6393;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 6401;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 6421;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 19 WHERE entry = 6461;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 20 WHERE entry = 6481;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 6523;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 6548;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 18 WHERE entry = 6629;

-- Stormwind
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 167;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 168;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 212;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 270;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 325;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 332;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 333;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 334;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 335;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 336;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 343;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 344;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 345;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 346;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 347;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 350;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 353;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 22 WHERE entry = 373;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 26 WHERE entry = 387;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 26 WHERE entry = 388;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 22 WHERE entry = 389;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 29 WHERE entry = 391;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 29 WHERE entry = 392;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 29 WHERE entry = 393;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 394;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 395;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 396;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 397;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 399;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 434;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 38 WHERE entry = 538;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 543;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 579;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1015;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 40 WHERE entry = 1052;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 40 WHERE entry = 1053;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 1097;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 28 WHERE entry = 1241;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 28 WHERE entry = 1242;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 28 WHERE entry = 1243;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 1244;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 1245;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 1246;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 1247;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 1248;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 1249;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 1250;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 1264;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 1265;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 36 WHERE entry = 1266;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 1267;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 28 WHERE entry = 1274;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 1324;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 1363;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 1364;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 1447;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1448;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1449;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1450;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1451;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1452;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 1468;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1469;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 50 WHERE entry = 1475;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1649;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 1650;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1651;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1652;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 1661;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1688;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1689;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1716;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1738;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1739;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1793;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1798;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 2040;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2206;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2360;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2607;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2608;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 2609;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 2745;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 31 WHERE entry = 2746;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 2758;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 2759;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 2928;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 4181;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3630;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 42 WHERE entry = 3636;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 24 WHERE entry = 3765;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3788;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3789;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4185;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4186;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4485;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 4486;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5048;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5066;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5634;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5635;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5636;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5637;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5638;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5639;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5676;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5677;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5923;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6182;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6183;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6184;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6187;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 6403;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 6501;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 6502;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7023;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7495;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7496;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7497;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7637;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7638;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7640;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7641;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7642;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7643;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7644;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7645;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7646;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7647;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7648;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7666;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7781;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7782;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7791;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7793;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7794;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7795;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7796;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8311;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8356;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8871;

-- Stranglethorn Vale
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 185;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 186;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 187;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 37 WHERE entry = 188;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 189;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 190;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 191;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 192;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 40 WHERE entry = 193;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 34 WHERE entry = 194;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 36 WHERE entry = 195;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 41 WHERE entry = 196;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 43 WHERE entry = 197;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 32 WHERE entry = 198;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 200;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 32 WHERE entry = 201;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 202;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 203;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 204;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 205;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 46 WHERE entry = 206;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 207;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 43 WHERE entry = 208;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 209;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 210;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 36 WHERE entry = 213;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 215;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 328;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 329;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 330;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 331;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 338;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 339;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 340;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 341;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 342;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 348;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 35 WHERE entry = 349;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 36 WHERE entry = 568;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 37 WHERE entry = 569;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 38 WHERE entry = 570;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 41 WHERE entry = 571;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 41 WHERE entry = 572;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 44 WHERE entry = 573;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 574;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 31 WHERE entry = 575;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 576;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 36 WHERE entry = 577;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 578;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 580;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 34 WHERE entry = 581;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 582;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 583;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 41 WHERE entry = 584;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 585;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 46 WHERE entry = 586;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 587;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 588;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 45 WHERE entry = 589;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 46 WHERE entry = 591;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 46 WHERE entry = 592;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 46 WHERE entry = 593;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 45 WHERE entry = 594;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 595;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 596;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 597;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 598;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 41 WHERE entry = 599;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 41 WHERE entry = 600;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 601;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 602;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 603;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 43 WHERE entry = 604;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 605;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 41 WHERE entry = 606;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 41 WHERE entry = 607;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 45 WHERE entry = 608;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 44 WHERE entry = 609;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 39 WHERE entry = 610;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 40 WHERE entry = 611;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 44 WHERE entry = 613;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 616;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 617;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 52 WHERE entry = 619;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 621;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 622;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 623;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 43 WHERE entry = 624;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 43 WHERE entry = 625;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 51 WHERE entry = 626;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 627;
UPDATE quest_template SET MinLevel = 31, QuestLevel = 38 WHERE entry = 628;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 629;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 51 WHERE entry = 630;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 37 WHERE entry = 638;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 1036;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1041;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1180;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1181;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1182;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1183;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 2760;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2761;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2762;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2763;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2764;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2765;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 35 WHERE entry = 2843;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3642;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3643;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3647;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3721;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4621;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 55 WHERE entry = 5148;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 55 WHERE entry = 7810;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 55 WHERE entry = 7838;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 8551;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 50 WHERE entry = 8552;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 50 WHERE entry = 8553;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 50 WHERE entry = 8554;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 55 WHERE entry = 9272;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 9259;

-- Swamp of Sorrows
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 698;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 42 WHERE entry = 699;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1389;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 39 WHERE entry = 1392;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1393;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1396;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 1398;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1418;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1419;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1420;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 35 WHERE entry = 1421;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 1422;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1423;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 43 WHERE entry = 1424;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 42 WHERE entry = 1425;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 43 WHERE entry = 1426;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 43 WHERE entry = 1427;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 1428;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 44 WHERE entry = 1429;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1430;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 44 WHERE entry = 1444;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 50 WHERE entry = 1445;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 3374;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 3512;

-- Tainted Scar
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7581;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7582;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 7583;

-- Tanaris
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 10;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 32;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 47 WHERE entry = 82;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 110;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 48 WHERE entry = 113;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 49 WHERE entry = 162;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 48 WHERE entry = 351;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 379;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 48 WHERE entry = 648;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 654;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 841;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 864;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 992;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 1560;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 43 WHERE entry = 1690;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 1691;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 1707;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 1878;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2605;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2606;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2641;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2661;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 2662;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2741;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 60 WHERE entry = 2747;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 60 WHERE entry = 2748;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 60 WHERE entry = 2749;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 60 WHERE entry = 2750;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2771;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2772;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2773;
UPDATE quest_template SET MinLevel = 39, QuestLevel = 46 WHERE entry = 2781;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2872;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2873;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2874;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2875;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2876;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 2882;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2954;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2964;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2967;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2968;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2977;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 3022;
UPDATE quest_template SET MinLevel = 43, QuestLevel = 48 WHERE entry = 3161;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 3321;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 3362;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 3520;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 3527;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 53 WHERE entry = 3528;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3638;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3639;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3644;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 4496;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 54 WHERE entry = 4504;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4507;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4508;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 4509;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 4787;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 58 WHERE entry = 4788;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 58 WHERE entry = 5065;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 5801;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 5802;
UPDATE quest_template SET MinLevel = 44, QuestLevel = 49 WHERE entry = 5863;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6610;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 58 WHERE entry = 8181;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 58 WHERE entry = 8182;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 8365;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 45 WHERE entry = 8366;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8747;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8748;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8749;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8750;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8751;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8752;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8753;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8754;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8755;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8756;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8757;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8758;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8759;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8760;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8761;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8764;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8765;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8766;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 8893;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 9268;

-- Teldrassil
UPDATE quest_template SET MinLevel = 4, QuestLevel = 6 WHERE entry = 475;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 6 WHERE entry = 476;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 483;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 12 WHERE entry = 486;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 487;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 5 WHERE entry = 488;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 489;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 918;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 919;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 922;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 927;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 929;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 930;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 931;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 932;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 9 WHERE entry = 933;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 11 WHERE entry = 935;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 937;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 12 WHERE entry = 938;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 940;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 941;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 952;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 5 WHERE entry = 997;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 8 WHERE entry = 1581;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 2159;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2241;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 2242;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2259;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 2399;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 6 WHERE entry = 2438;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 8 WHERE entry = 2459;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 2498;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 9 WHERE entry = 2499;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 2518;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 10 WHERE entry = 2519;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 2520;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 8 WHERE entry = 2541;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 10 WHERE entry = 2561;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3519;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3521;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 3522;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 7 WHERE entry = 4161;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5621;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5622;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5923;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6063;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6071;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6072;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6073;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6101;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6102;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6103;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6721;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6722;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 11 WHERE entry = 934;

-- Theramore
UPDATE quest_template SET MinLevel = 35, QuestLevel = 45 WHERE entry = 6624;

-- Thousand Needles
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 1100;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 1101;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 1104;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 1105;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 35 WHERE entry = 1106;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 1107;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 39 WHERE entry = 1108;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 1110;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1111;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1112;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1114;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1115;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1116;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 36 WHERE entry = 1117;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 43 WHERE entry = 1118;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1119;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1120;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1121;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 44 WHERE entry = 1122;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1130;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1131;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 20 WHERE entry = 1132;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 20 WHERE entry = 1133;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1135;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 1137;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 33 WHERE entry = 1145;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 33 WHERE entry = 1146;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 35 WHERE entry = 1147;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 1148;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 26 WHERE entry = 1149;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1150;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1151;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1152;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 29 WHERE entry = 1153;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1154;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 1159;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 36 WHERE entry = 1160;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 33 WHERE entry = 1175;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 30 WHERE entry = 1176;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1178;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 1179;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 35 WHERE entry = 1184;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 37 WHERE entry = 1186;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1187;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1188;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1189;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1190;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1191;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 42 WHERE entry = 1192;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 41 WHERE entry = 1194;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 1197;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 36 WHERE entry = 1394;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1531;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1532;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 50 WHERE entry = 2770;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 25 WHERE entry = 4542;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 29 WHERE entry = 4767;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 29 WHERE entry = 4770;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 26 WHERE entry = 4821;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 25 WHERE entry = 4841;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 26 WHERE entry = 4865;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 4881;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 29 WHERE entry = 4904;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 4966;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 27 WHERE entry = 5062;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 28 WHERE entry = 5064;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 28 WHERE entry = 5088;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 29 WHERE entry = 5147;
UPDATE quest_template SET MinLevel = 24, QuestLevel = 30 WHERE entry = 5151;
UPDATE quest_template SET MinLevel = 32, QuestLevel = 35 WHERE entry = 5361;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 5762;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 6627;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 6628;

-- Thunder Bluff
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 26;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 15 WHERE entry = 264;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 742;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 11 WHERE entry = 744;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 8 WHERE entry = 768;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 10 WHERE entry = 769;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 860;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 886;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 962;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1000;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 38 WHERE entry = 1049;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 1064;
UPDATE quest_template SET MinLevel = 13, QuestLevel = 18 WHERE entry = 1065;
UPDATE quest_template SET MinLevel = 29, QuestLevel = 34 WHERE entry = 1102;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1123;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 1195;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 1196;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 47 WHERE entry = 2440;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2965;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 50 WHERE entry = 2966;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3761;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3762;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3782;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3786;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 3804;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5095;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5722;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 15 WHERE entry = 5723;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5724;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5922;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5928;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6002;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 14 WHERE entry = 6126;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7021;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7820;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7821;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7822;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7823;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7825;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8360;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8875;

-- Timbermaw Hold
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 6031;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 6032;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 55 WHERE entry = 6221;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8481;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8484;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 60 WHERE entry = 8485;

-- Tirisfal Glades
UPDATE quest_template SET MinLevel = 7, QuestLevel = 11 WHERE entry = 354;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 355;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 356;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 8 WHERE entry = 358;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 9 WHERE entry = 359;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 9 WHERE entry = 360;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 361;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 10 WHERE entry = 362;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 365;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 6 WHERE entry = 367;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 9 WHERE entry = 368;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 369;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 9 WHERE entry = 370;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 10 WHERE entry = 371;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 372;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 7 WHERE entry = 374;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 8 WHERE entry = 375;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 10 WHERE entry = 398;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 6 WHERE entry = 404;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 405;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 7 WHERE entry = 407;
UPDATE quest_template SET MinLevel = 7, QuestLevel = 13 WHERE entry = 408;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 409;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 10 WHERE entry = 410;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 12 WHERE entry = 411;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 8 WHERE entry = 426;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 427;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 10 WHERE entry = 431;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 10 WHERE entry = 445;
UPDATE quest_template SET MinLevel = 6, QuestLevel = 11 WHERE entry = 492;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1478;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 1657;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1885;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 5 WHERE entry = 5481;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 6 WHERE entry = 5482;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5650;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 4 WHERE entry = 5651;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 8322;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 60 WHERE entry = 8409;

-- Undercity
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 232;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 45 WHERE entry = 238;
UPDATE quest_template SET MinLevel = 38, QuestLevel = 46 WHERE entry = 243;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 357;
UPDATE quest_template SET MinLevel = 5, QuestLevel = 8 WHERE entry = 366;
UPDATE quest_template SET MinLevel = 34, QuestLevel = 39 WHERE entry = 495;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 20 WHERE entry = 530;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 44 WHERE entry = 736;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 55 WHERE entry = 1004;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 42 WHERE entry = 1048;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1109;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 33 WHERE entry = 1113;
UPDATE quest_template SET MinLevel = 27, QuestLevel = 36 WHERE entry = 1164;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1471;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1472;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1473;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1474;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1476;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1803;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1805;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1886;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1898;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1899;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 13 WHERE entry = 1978;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 1998;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 20 WHERE entry = 1999;
UPDATE quest_template SET MinLevel = 33, QuestLevel = 43 WHERE entry = 2342;
UPDATE quest_template SET MinLevel = 16, QuestLevel = 16 WHERE entry = 2378;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 2995;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 3001;
UPDATE quest_template SET MinLevel = 37, QuestLevel = 42 WHERE entry = 3341;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3526;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3568;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3569;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 52 WHERE entry = 3570;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 47 WHERE entry = 3637;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 50 WHERE entry = 3784;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4293;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 56 WHERE entry = 4294;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4561;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 55 WHERE entry = 4642;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 4661;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5049;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 5094;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5644;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5646;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5658;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5659;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5660;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5661;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5662;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 5663;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 5679;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 16 WHERE entry = 5725;
UPDATE quest_template SET MinLevel = 54, QuestLevel = 56 WHERE entry = 5961;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 7024;
UPDATE quest_template SET MinLevel = 12, QuestLevel = 60 WHERE entry = 7813;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 60 WHERE entry = 7814;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 7817;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7818;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7819;
UPDATE quest_template SET MinLevel = 42, QuestLevel = 47 WHERE entry = 8273;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 8354;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8874;

-- Un'Goro Crater
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 974;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 55 WHERE entry = 980;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3844;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3845;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 3881;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 51 WHERE entry = 3882;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 52 WHERE entry = 3883;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 50 WHERE entry = 3884;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3908;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3909;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3912;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3913;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3914;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 3941;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 54 WHERE entry = 3942;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 54 WHERE entry = 3961;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 56 WHERE entry = 3962;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 54 WHERE entry = 4005;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 54 WHERE entry = 4084;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4141;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4142;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4143;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4144;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4145;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4146;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 52 WHERE entry = 4147;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4148;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4243;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4244;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4245;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4284;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4285;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4287;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4288;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 4289;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4290;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 53 WHERE entry = 4291;
UPDATE quest_template SET MinLevel = 48, QuestLevel = 56 WHERE entry = 4292;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4301;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4321;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4381;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4382;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4383;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4384;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4385;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 53 WHERE entry = 4386;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4491;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 4492;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 55 WHERE entry = 4501;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 51 WHERE entry = 4503;
UPDATE quest_template SET MinLevel = 47, QuestLevel = 55 WHERE entry = 5150;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 9051;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 9052;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 9053;

-- Valley of Trials
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 787;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 2 WHERE entry = 788;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 789;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 790;
UPDATE quest_template SET MinLevel = 2, QuestLevel = 4 WHERE entry = 792;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 794;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 804;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 5 WHERE entry = 805;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1463;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 1485;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 4 WHERE entry = 1499;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1516;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1517;
UPDATE quest_template SET MinLevel = 4, QuestLevel = 4 WHERE entry = 1518;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 2383;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3065;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3082;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3083;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3084;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3085;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3086;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3087;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3088;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3089;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3090;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 3 WHERE entry = 4402;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 4 WHERE entry = 5441;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 5843;
UPDATE quest_template SET MinLevel = 3, QuestLevel = 4 WHERE entry = 6394;

-- Western Plaguelands
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 105;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 211;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 55 WHERE entry = 838;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 964;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 4971;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 4972;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 4973;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 54 WHERE entry = 4984;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 56 WHERE entry = 4985;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 56 WHERE entry = 4986;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 56 WHERE entry = 4987;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5021;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5022;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5023;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5050;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 54 WHERE entry = 5051;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 55 WHERE entry = 5058;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 55 WHERE entry = 5059;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 55 WHERE entry = 5060;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 5092;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5096;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5097;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 5098;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5164;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5166;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5167;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5215;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5216;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5217;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5218;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5219;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5220;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5221;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5222;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5223;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5224;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5225;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5226;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5227;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5228;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5229;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 53 WHERE entry = 5230;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5231;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5232;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5233;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5234;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5235;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5236;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5237;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 5238;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5341;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5342;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5343;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5344;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5382;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5384;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5401;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5402;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5403;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5404;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5405;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5406;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5407;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 55 WHERE entry = 5408;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5461;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5462;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5466;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5504;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5505;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5507;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5511;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 5514;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5515;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5521;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5524;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 55 WHERE entry = 5533;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 5537;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 57 WHERE entry = 5538;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5542;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5543;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5544;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5742;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 57 WHERE entry = 5781;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5803;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5804;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 5845;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 5846;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5848;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5861;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5862;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 60 WHERE entry = 5944;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 6004;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 57 WHERE entry = 6023;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 58 WHERE entry = 6025;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6185;
UPDATE quest_template SET MinLevel = 56, QuestLevel = 60 WHERE entry = 6186;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6569;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6570;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8414;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8416;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8418;

-- Westfall
UPDATE quest_template SET MinLevel = 8, QuestLevel = 15 WHERE entry = 9;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 12;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 13;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 17 WHERE entry = 14;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 22;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 10 WHERE entry = 36;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 13 WHERE entry = 38;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 48;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 49;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 50;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 51;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 44 WHERE entry = 53;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 12 WHERE entry = 64;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 65;
UPDATE quest_template SET MinLevel = 8, QuestLevel = 14 WHERE entry = 102;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 103;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 20 WHERE entry = 104;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 15 WHERE entry = 117;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 132;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 135;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 136;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 138;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 139;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 16 WHERE entry = 140;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 141;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 142;
UPDATE quest_template SET MinLevel = 9, QuestLevel = 14 WHERE entry = 151;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 152;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 15 WHERE entry = 153;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 18 WHERE entry = 155;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 22 WHERE entry = 166;
UPDATE quest_template SET MinLevel = 14, QuestLevel = 17 WHERE entry = 214;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 24 WHERE entry = 2359;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6181;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6261;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6281;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 6285;

-- Wetlands
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 637;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 30 WHERE entry = 647;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 26 WHERE entry = 275;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 21 WHERE entry = 276;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 23 WHERE entry = 277;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 279;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 281;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 284;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 285;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 25 WHERE entry = 286;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 27 WHERE entry = 288;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 29 WHERE entry = 289;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 30 WHERE entry = 290;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 30 WHERE entry = 292;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 30 WHERE entry = 293;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 24 WHERE entry = 294;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 27 WHERE entry = 295;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 29 WHERE entry = 296;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 28 WHERE entry = 299;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 30 WHERE entry = 303;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 34 WHERE entry = 304;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 24 WHERE entry = 305;
UPDATE quest_template SET MinLevel = 21, QuestLevel = 24 WHERE entry = 306;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 321;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 322;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 324;
UPDATE quest_template SET MinLevel = 22, QuestLevel = 27 WHERE entry = 378;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 21 WHERE entry = 455;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 21 WHERE entry = 463;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 464;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 31 WHERE entry = 465;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 466;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 21 WHERE entry = 468;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 21 WHERE entry = 469;
UPDATE quest_template SET MinLevel = 19, QuestLevel = 24 WHERE entry = 470;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 26 WHERE entry = 471;
UPDATE quest_template SET MinLevel = 25, QuestLevel = 25 WHERE entry = 472;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 28 WHERE entry = 473;
UPDATE quest_template SET MinLevel = 23, QuestLevel = 32 WHERE entry = 474;
UPDATE quest_template SET MinLevel = 18, QuestLevel = 22 WHERE entry = 484;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 526;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 631;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 632;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 633;
UPDATE quest_template SET MinLevel = 28, QuestLevel = 31 WHERE entry = 634;

-- Winterspring
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 6603;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 969;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 975;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 977;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 55 WHERE entry = 978;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 57 WHERE entry = 979;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 3783;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 4521;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 4721;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 4741;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4801;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4802;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4803;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4804;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4805;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4806;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 4807;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 56 WHERE entry = 4842;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 59 WHERE entry = 4861;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 59 WHERE entry = 4863;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 59 WHERE entry = 4864;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 4882;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 4883;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 4901;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 57 WHERE entry = 4902;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 4970;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5054;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 58 WHERE entry = 5055;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 60 WHERE entry = 5056;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 60 WHERE entry = 5057;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5063;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5067;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5068;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5082;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5083;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5084;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5085;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 56 WHERE entry = 5086;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 57 WHERE entry = 5087;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 5121;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 5123;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5124;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5126;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 5127;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 59 WHERE entry = 5128;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5161;
UPDATE quest_template SET MinLevel = 57, QuestLevel = 60 WHERE entry = 5162;
UPDATE quest_template SET MinLevel = 52, QuestLevel = 58 WHERE entry = 5163;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 5201;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5244;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5245;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5246;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 57 WHERE entry = 5247;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 58 WHERE entry = 5248;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5249;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 56 WHERE entry = 5250;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 58 WHERE entry = 5252;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 58 WHERE entry = 5253;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5305;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5306;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 5307;
UPDATE quest_template SET MinLevel = 58, QuestLevel = 60 WHERE entry = 5981;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 6028;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 6029;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 6030;
UPDATE quest_template SET MinLevel = 53, QuestLevel = 59 WHERE entry = 6604;
UPDATE quest_template SET MinLevel = 49, QuestLevel = 54 WHERE entry = 6605;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 6606;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7652;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7653;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7654;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7655;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7656;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7657;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7658;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 7659;
UPDATE quest_template SET MinLevel = 45, QuestLevel = 58 WHERE entry = 6241;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 8469;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 56 WHERE entry = 8471;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 8798;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 60 WHERE entry = 9266;

-- Global
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 3861;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8575;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8576;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8577;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8578;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8584;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8585;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8586;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8587;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8597;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8598;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8599;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8606;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8620;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8728;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8729;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8730;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8733;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8734;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8735;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8736;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8741;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8742;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8743;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8745;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1498;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1502;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1503;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1505;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 1558;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1638;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1639;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1640;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1665;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1666;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1667;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1678;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1679;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1680;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1681;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1682;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1683;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1684;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1686;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 1687;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1692;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1693;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1698;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1699;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1700;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1701;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 22 WHERE entry = 1702;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1703;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1704;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1705;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1706;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 1708;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1709;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1710;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1711;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1712;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1713;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 37 WHERE entry = 1714;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1718;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1719;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 28 WHERE entry = 1782;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1791;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1792;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 1800;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1818;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1819;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1820;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1821;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 11 WHERE entry = 1822;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1823;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1824;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 1825;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1838;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1839;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1840;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1841;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1842;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1843;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1844;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1845;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1846;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1847;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 30 WHERE entry = 1848;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1860;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1861;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1879;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1880;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1881;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1882;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1883;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 1884;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1919;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 16 WHERE entry = 1920;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1921;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 28 WHERE entry = 1938;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1939;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1940;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1941;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1942;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1943;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1944;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1945;
UPDATE quest_template SET MinLevel = 26, QuestLevel = 26 WHERE entry = 1946;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1947;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1948;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 38 WHERE entry = 1949;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 30 WHERE entry = 1950;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1951;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 40 WHERE entry = 1952;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1953;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1954;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1955;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1956;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1957;
UPDATE quest_template SET MinLevel = 35, QuestLevel = 40 WHERE entry = 1958;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1959;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 16 WHERE entry = 1960;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1961;
UPDATE quest_template SET MinLevel = 15, QuestLevel = 15 WHERE entry = 1962;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 4822;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 60 WHERE entry = 5502;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 8149;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 60 WHERE entry = 8150;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8151;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8233;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8250;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8254;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8367;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8368;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8369;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8370;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8371;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8372;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8374;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8375;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8383;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8384;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8385;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8386;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8387;
UPDATE quest_template SET MinLevel = 51, QuestLevel = 60 WHERE entry = 8388;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8389;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8390;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8391;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8392;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8393;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8394;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8395;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8396;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8397;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8398;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8399;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8400;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8401;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8402;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8403;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8404;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8405;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8406;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8407;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8408;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 8410;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 8415;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 50 WHERE entry = 8417;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 8419;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8426;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8427;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8428;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8429;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8430;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8431;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8432;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8433;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8434;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8435;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8436;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8437;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8438;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8439;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8440;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8441;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 59 WHERE entry = 8442;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8443;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8446;
UPDATE quest_template SET MinLevel = 60, QuestLevel = 60 WHERE entry = 8447;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8565;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8566;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8567;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8568;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8569;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8570;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8619;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8635;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8636;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8642;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8643;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8644;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8645;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8646;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8647;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8648;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8649;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8650;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8651;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8652;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8653;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8654;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8670;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8671;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8672;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8673;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8674;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8675;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8676;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8677;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8678;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8679;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8680;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8681;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8682;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8683;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8684;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8685;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8686;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8688;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8713;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8714;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8715;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8716;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8717;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8718;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8719;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8720;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8721;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8722;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8723;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8724;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8725;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8726;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8727;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8744;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8767;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 20 WHERE entry = 8768;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 40 WHERE entry = 8769;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8788;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 10 WHERE entry = 8803;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8811;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8812;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8813;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8814;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8815;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8816;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8817;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8818;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8819;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8820;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8821;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8822;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8823;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8824;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8825;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8826;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8827;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 1 WHERE entry = 8828;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8830;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8831;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8832;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8833;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8834;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8835;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8836;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8837;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8838;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8839;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8840;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8841;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8842;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8843;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8844;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8845;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8846;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8847;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8848;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8849;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 8850;
UPDATE quest_template SET MinLevel = 10, QuestLevel = 19 WHERE entry = 8851;
UPDATE quest_template SET MinLevel = 20, QuestLevel = 29 WHERE entry = 8852;
UPDATE quest_template SET MinLevel = 30, QuestLevel = 39 WHERE entry = 8853;
UPDATE quest_template SET MinLevel = 40, QuestLevel = 49 WHERE entry = 8854;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 60 WHERE entry = 8855;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8866;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8867;
UPDATE quest_template SET MinLevel = 1, QuestLevel = 60 WHERE entry = 8883;
UPDATE quest_template SET MinLevel = 50, QuestLevel = 52 WHERE entry = 9063;
UPDATE quest_template SET MinLevel = 55, QuestLevel = 60 WHERE entry = 9664;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
