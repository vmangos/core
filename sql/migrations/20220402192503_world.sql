DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220402192503');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220402192503');
-- Add your query below.


-- These spawns should use Sheath None.
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32067, 0); -- Grizzle Halfmane 347
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (39664, 0); -- Nalesette Wildbringer 543
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (78, 0); -- Donal Osgood 857
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46570, 0); -- Keras Wolfheart 907
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (50796, 0); -- Rendow 1695
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (49936, 0); -- Aethalas 2302
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32071, 0); -- Kurden Bloodclaw 2804
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (573, 0); -- Gyll 2859
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4765, 0); -- Brakgul Deathbringer 3890
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (30663, 0); -- Guard Kahil 5091
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (30658, 0); -- Guard Narrisha 5093
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (30664, 0); -- Guard Tark 5094
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (49937, 0); -- Brogun Stoneshield 5118
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79779, 0); -- Wu Shen 5479
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79778, 0); -- Ilsa Corbin 5480
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (55, 0); -- Tisa Martine 5605
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38431, 0); -- Robert Gossom 5655
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31892, 0); -- Richard Van Brunt 5656
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38434, 0); -- Marla Fowler 5657
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38427, 0); -- Chloe Curthas 5658
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (41836, 0); -- Andrew Hartwell 5659
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31895, 0); -- Brother Malach 5661
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38435, 0); -- Sergeant Houser 5662
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38429, 0); -- Mattie Alred 5668
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38430, 0); -- Edrick Killian 5670
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38425, 0); -- Gerard Abernathy 5696
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38112, 0); -- Joanna Whitehall 5698
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38111, 0); -- Leona Tharpe 5699
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38417, 0); -- Jezelle Pruitt 5702
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (42893, 0); -- Thelman Slatefist 7410
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (24670, 0); -- Taim Ragetotem 7427
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (50058, 0); -- Dulciea Frostmoon 10293
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (24794, 0); -- Kergul Bloodaxe 10360
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (15074, 0); -- Sanuye Runetotem 10380
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (266, 0); -- Rifleman Wheeler 10803
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (268, 0); -- Rifleman Middlecamp 10804
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (2017, 0); -- Glordrum Steelbeard 12197
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26564, 0); -- Martin Lindsey 12198
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52721, 0); -- Captain Dirgehammer 12777
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (16, 0); -- Lieutenant Rachel Vaccar 12778
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (950, 0); -- Archmage Gaiman 12779
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52726, 0); -- Captain O'Neal 12782
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (22, 0); -- Lieutenant Karter 12783
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (13, 0); -- Sergeant Major Clate 12785
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86422, 0); -- Legionnaire Teena 12788
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86421, 0); -- Blood Guard Hini'wana 12789
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52722, 0); -- Lady Palanseer 12792
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86381, 0); -- Brave Stonehide 12793
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86419, 0); -- Stone Guard Zarg 12794
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52724, 0); -- First Sergeant Hola'mahi 12795
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86378, 0); -- Raider Bork 12796
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (28414, 0); -- Werg Thickblade 12943
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (14831, 0); -- Myrokos Silentform 13085
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79787, 0); -- Lord Tony Romano 13283
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4664, 0); -- Sagorne Creststrider 13417
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52727, 0); -- Sergeant Thunderhorn 14581
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (54382, 0); -- Burth 14827
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (56611, 0); -- Burth 14827
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4764, 0); -- Kartra Bloodsnarl 14942
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (54614, 0); -- Elfarran 14981
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79, 0); -- Lylandris 14982
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (11915, 0); -- Field Marshal Oslight 14983
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4761, 0); -- Deze Snowbane 15006
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32068, 0); -- Sir Malory Wheeler 15007
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (54625, 0); -- Lady Hoteshem 15008
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110004, 0); -- Sergeant Stonebrow 15383
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110005, 0); -- Corporal Carnes 15431
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110007, 0); -- Private Draxlegauge 15434
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110009, 0); -- Sergeant Major Germaine 15445
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110010, 0); -- Bonnie Stoneflayer 15446
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110011, 0); -- Private Porter 15448
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110012, 0); -- Marta Finespindle 15450
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110013, 0); -- Sentinel Silversky 15451
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (87529, 0); -- Kandrostrasz 15503
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111010, 0); -- Skinner Jamani 15515
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111011, 0); -- Sergeant Umala 15522
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111015, 0); -- Stoneguard Clayhoof 15532
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111024, 0); -- Senior Sergeant Taiga 15702
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111025, 0); -- Senior Sergeant Grimsford 15703
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (111026, 0); -- Senior Sergeant Kai'jin 15704
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110025, 0); -- Master Sergeant Fizzlebolt 15707
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86424, 0); -- Master Sergeant Maclure 15708
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110026, 0); -- Master Sergeant Moonshadow 15709
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (88460, 0); -- Instructor Razuvious 16061

-- These spawns should use Sheath Melee.
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81107; -- Thuros Lightfingers 61
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 83185; -- Thuros Lightfingers 61
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 83187; -- Thuros Lightfingers 61
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79666; -- Stormwind City Guard 68
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79857; -- Stormwind City Guard 68
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 187; -- Ironforge Mountaineer 727
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190199; -- Ironforge Mountaineer 727
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190201; -- Ironforge Mountaineer 727
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81181; -- Antonio Perelli 844
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 398; -- Coldridge Mountaineer 853
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 4378; -- Rockjaw Skullthumper 1115
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 4522; -- Rockjaw Skullthumper 1115
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190244; -- Black Bear 1129
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 2413; -- Leper Gnome 1211
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 2418; -- Leper Gnome 1211
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 2439; -- Leper Gnome 1211
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 2453; -- Leper Gnome 1211
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 2464; -- Leper Gnome 1211
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79815; -- Justin 1368
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79817; -- Brandon 1370
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79816; -- Roman 1371
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79927; -- Northshire Guard 1642
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 326; -- Rockjaw Raider 1718
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 10527; -- Stormwind Royal Guard 1756
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 10528; -- Stormwind Royal Guard 1756
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 45378; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 45380; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 45383; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 45384; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 45386; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 46775; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 46776; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 46777; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 46784; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 47156; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 47159; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 47161; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 47164; -- Scarlet Lumberjack 1884
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 12088; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 12093; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79670; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79675; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79690; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79807; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79814; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 90438; -- Stormwind City Patroller 1976
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 79723; -- Thomas Miller 3518
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40129; -- Scarlet Soldier 4286
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40047; -- Scarlet Gallant 4287
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40082; -- Scarlet Gallant 4287
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40068; -- Scarlet Beastmaster 4288
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40058; -- Scarlet Adept 4296
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40015; -- Scarlet Wizard 4300
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40034; -- Scarlet Wizard 4300
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40031; -- Scarlet Champion 4302
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87446; -- Razorfen Warden 4437
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87354; -- Razorfen Defender 4442
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87377; -- Razorfen Defender 4442
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87396; -- Razorfen Defender 4442
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87363; -- Death's Head Adept 4516
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87289; -- Razorfen Geomancer 4520
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87430; -- Quilguard Champion 4623
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 87431; -- Quilguard Champion 4623
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 27402; -- Old Serra'kis 4830
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 134; -- Ironforge Guard 5595
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 1895; -- Ironforge Guard 5595
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190211; -- Ironforge Guard 5595
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81526; -- Sandfury Witch Doctor 5650
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 285024; -- Cat 6368
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 285025; -- Cat 6368
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 40124; -- Arcanist Doan 6487
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81529; -- Sandfury Shadowhunter 7246
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81577; -- Sandfury Shadowhunter 7246
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81550; -- Sandfury Soul Eater 7247
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 81463; -- Theka the Martyr 7272
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 46818; -- Rageclaw 7318
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 28777; -- Withered Spearhide 7332
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 80119; -- Northshire Peasant 11260
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 80127; -- Northshire Peasant 11260
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 80137; -- Northshire Peasant 11260
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 80145; -- Northshire Peasant 11260
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 80262; -- Northshire Peasant 11260
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 48648; -- Ragefire Trogg 11318
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 48655; -- Ragefire Trogg 11318
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 48707; -- Searing Blade Enforcer 11323
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 56952; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300172; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300851; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300852; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300853; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300854; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300855; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300856; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 300857; -- Highborne Summoner 11466
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 3031; -- Tristane Shadowstone 11807
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 285021; -- Dwarven Farmer 12998
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190236; -- Gnome Engineer 13000
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190237; -- Gnome Engineer 13000
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190239; -- Gnome Engineer 13000
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 190240; -- Gnome Engineer 13000
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 3022; -- Dun Morogh Mountaineer 13076
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 90484; -- Officer Pomeroy 14438
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 566; -- Darkmoon Faire Carnie 14849
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 724; -- Darkmoon Faire Carnie 14849
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 725; -- Darkmoon Faire Carnie 14849
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 12604; -- Darkmoon Faire Carnie 14849
UPDATE `creature_addon` SET `sheath_state` = 1 WHERE `guid` = 42598; -- Darkmoon Faire Carnie 14849

-- These spawns should use Sheath Ranged.
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4204, 2); -- Avette Fellwood 228
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (407, 2); -- Thorgas Grimson 895
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31949, 2); -- Ogromm 987
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (81346, 2); -- Rallic Finn 1198
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (265, 2); -- Hegnar Rumbleshot 1243
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79799, 2); -- Lina Stover 1297
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (79797, 2); -- Frederick Stover 1298
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (52925, 2); -- Ardwyn Cailen 1312
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (364, 2); -- Kragg 1404
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32694, 2); -- Helgrum the Swift 1442
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (9563, 2); -- Naela Trance 1459
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (9527, 2); -- Murndan Derth 1461
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (8295, 2); -- Vrok Blunderblast 1469
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32052, 2); -- Bethor Iceshard 1498
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (48881, 2); -- William MacGregor 1668
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (8273, 2); -- Irene Sureshot 1686
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (6340, 2); -- Mountaineer Barleybrew 1959
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (11219, 2); -- First Mate Nilzlix 2767
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (5, 2); -- Haren Kanmae 2839
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (24798, 2); -- Harken Windtotem 2947
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26634, 2); -- Kuna Thunderhorn 3015
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26637, 2); -- Hogor Thunderhoof 3018
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26758, 2); -- Urek Thunderhorn 3040
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26776, 2); -- Thurston Xane 3049
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (21704, 2); -- Synge 3053
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26899, 2); -- Lanka Farshot 3061
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (24674, 2); -- Kennah Hawkseye 3078
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (6263, 2); -- Henry Chapal 3088
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (7667, 2); -- Ghrawt 3165
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (4657, 2); -- Kaja 3322
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (7449, 2); -- Ormak Grimshot 3352
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (7451, 2); -- Jin'sora 3410
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (15103, 2); -- Uthrok 3488
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46173, 2); -- Keina 3589
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46198, 2); -- Jeena Featherbow 3610
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (36537, 2); -- Caylais Moonfeather 3841
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32344, 2); -- Sentinel Melyria Frostshadow 3880
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32647, 2); -- Bhaldaran Ravenshade 3951
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32703, 2); -- Danlaar Nightstride 3963
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46217, 2); -- Jeen'ra Nightrunner 4138
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46221, 2); -- Jocaste 4146
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46340, 2); -- Landria 4173
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46415, 2); -- Dorion 4205
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46811, 2); -- Nightshade 4243
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46814, 2); -- Shadow 4244
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (51678, 2); -- Thyssiana 4319
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (8461, 2); -- Baldruc 4321
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (29234, 2); -- Teloren 4407
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (41839, 2); -- Nicholas Atwood 4603
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31896, 2); -- Abigail Sawyer 4604
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31874, 2); -- Thaddeus Webb 4617
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (21178, 2); -- Trackmaster Zherin 4629
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (8482, 2); -- Torq Ironblast 4889
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (30489, 2); -- Jensen Farran 4892
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (90452, 2); -- Argos Nightwhisper 4984
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (87, 2); -- Olmin Burningbeard 5116
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (82, 2); -- Regnus Thundergranite 5117
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (39, 2); -- Skolmin Goldfury 5122
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (1761, 2); -- Harick Boulderdrum 5133
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (37603, 2); -- Thulman Flintcrag 5510
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (37609, 2); -- Ulfir Ironbeard 5516
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (33816, 2); -- Dar 5591
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (26936, 2); -- Kreldig Ungor 5638
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38418, 2); -- Adrian Bartlett 5704
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38090, 2); -- Apothecary Vallia 5731
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (38414, 2); -- Martha Strain 5753
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31862, 2); -- Zane Bradford 5754
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (17618, 2); -- Lilly 5757
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (3460, 2); -- Katis 5816
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (3474, 2); -- Deino 5885
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (60, 2); -- Thalgus Thunderfist 7976
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (46242, 2); -- Tyrande Whisperwind 7999
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (50078, 2); -- Fyldren Moonfeather 8019
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (23417, 2); -- Blizrik Buckshot 8131
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (35907, 2); -- Sanath Lim-yo 8395
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (35873, 2); -- Haggrum Bloodfist 8586
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (37060, 2); -- Gershala Nightwhisper 8997
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (6879, 2); -- Galamav the Marksman 9081
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (50076, 2); -- Cawind Trueaim 9548
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (21560, 2); -- Starn 9551
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (11204, 2); -- Mu'uta 9555
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32039, 2); -- Lady Sylvanas Windrunner 10181
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (8277, 2); -- Dargh Trueaim 10930
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (39077, 2); -- Jessir Moonbow 11019
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (39078, 2); -- Della 11024
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (28312, 2); -- Aboda 11105
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (53679, 2); -- Egan 11140
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (42271, 2); -- Wixxrak 11184
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (31925, 2); -- Bardu Sharpeye 11608
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (45226, 2); -- Huntsman Radley 11613
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (42328, 2); -- Celes Earthborne 11716
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (32345, 2); -- Locke Okarr 11820
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (28504, 2); -- Roon Wildmane 11877
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (42429, 2); -- Narianna 12029
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (25, 2); -- Sergeant Major Skyshadow 12780
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (86367, 2); -- Chieftain Earthbind 12791
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (92914, 2); -- Huntsman Markhor 14741
INSERT INTO `creature_addon` (`guid`, `sheath_state`) VALUES (110018, 2); -- Huntress Swiftriver 15457


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
