DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230314125943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230314125943');
-- Add your query below.


UPDATE `creature` SET `position_x`=-6484.59, `position_y`=-3916.68, `position_z`=-58.6667, `orientation`=5.51537 WHERE `guid`=21521; -- Saltstone Crystalhide
UPDATE `creature` SET `id`=4150 WHERE `guid`=21521; -- Saltstone Gazer
UPDATE `creature` SET `id2`=4151 WHERE `guid`=21521; -- Saltstone Crystalhide
UPDATE `creature` SET `position_x`=-750.757, `position_y`=984.427, `position_z`=91.7928, `orientation`=1.31643 WHERE `guid`=27013; -- Kolkar Mauler
UPDATE `creature` SET `id`=4634 WHERE `guid`=27013; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27013; -- Kolkar Windchaser
UPDATE `creature` SET `id3`=4637 WHERE `guid`=27013; -- Kolkar Destroyer
UPDATE `creature` SET `position_x`=-969.116, `position_y`=886.51, `position_z`=91.5977, `orientation`=2.84489 WHERE `guid`=27016; -- Kolkar Mauler
UPDATE `creature` SET `id`=4634 WHERE `guid`=27016; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27016; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-251.553, `position_y`=850.031, `position_z`=90.3937, `orientation`=2.34974 WHERE `guid`=27775; -- Hatefury Rogue
UPDATE `creature` SET `id`=4670 WHERE `guid`=27775; -- Hatefury Rogue
UPDATE `creature` SET `id2`=4671 WHERE `guid`=27775; -- Hatefury Trickster
UPDATE `creature` SET `id3`=4672 WHERE `guid`=27775; -- Hatefury Felsworn
UPDATE `creature` SET `id4`=4673 WHERE `guid`=27775; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-1923, `position_y`=2590.56, `position_z`=61.8897, `orientation`=5.77836 WHERE `guid`=27215; -- Gelkis Stamper
UPDATE `creature` SET `id`=4646 WHERE `guid`=27215; -- Gelkis Outrunner
UPDATE `creature` SET `id2`=4648 WHERE `guid`=27215; -- Gelkis Stamper
UPDATE `creature` SET `id3`=4649 WHERE `guid`=27215; -- Gelkis Windchaser
UPDATE `creature` SET `position_x`=-3001.08, `position_y`=-2521.09, `position_z`=11.5754, `orientation`=3.91322 WHERE `guid`=10565; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-8201.07, `position_y`=-3015.69, `position_z`=12.615, `orientation`=4.73902 WHERE `guid`=23175; -- Dunemaul Brute
UPDATE `creature` SET `id`=5472 WHERE `guid`=23175; -- Dunemaul Enforcer
UPDATE `creature` SET `id2`=5474 WHERE `guid`=23175; -- Dunemaul Brute
UPDATE `creature` SET `position_x`=-14972.9, `position_y`=347.014, `position_z`=13.1563, `orientation`=4.43358 WHERE `guid`=2607; -- Bloodsail Deckhand
UPDATE `creature` SET `id`=1565 WHERE `guid`=2607; -- Bloodsail Sea Dog
UPDATE `creature` SET `id2`=1653 WHERE `guid`=2607; -- Bloodsail Elder Magus
UPDATE `creature` SET `id3`=4505 WHERE `guid`=2607; -- Bloodsail Deckhand
UPDATE `creature` SET `id4`=4506 WHERE `guid`=2607; -- Bloodsail Swabby
UPDATE `creature` SET `position_x`=-14935.2, `position_y`=351.202, `position_z`=7.62574, `orientation`=0.723565 WHERE `guid`=445; -- Bloodsail Sea Dog
UPDATE `creature` SET `id`=1565 WHERE `guid`=445; -- Bloodsail Sea Dog
UPDATE `creature` SET `id2`=1653 WHERE `guid`=445; -- Bloodsail Elder Magus
UPDATE `creature` SET `id3`=4505 WHERE `guid`=445; -- Bloodsail Deckhand
UPDATE `creature` SET `position_x`=-1432.59, `position_y`=2867.39, `position_z`=87.3225, `orientation`=3.3505 WHERE `guid`=29082; -- Ghostly Marauder
UPDATE `creature` SET `id`=11686 WHERE `guid`=29082; -- Ghostly Raider
UPDATE `creature` SET `id2`=11687 WHERE `guid`=29082; -- Ghostly Marauder
UPDATE `creature` SET `position_x`=-1300.86, `position_y`=2896.78, `position_z`=88.8516, `orientation`=4.20292 WHERE `guid`=26982; -- Rock Worm
UPDATE `creature` SET `id`=11787 WHERE `guid`=26982; -- Rock Borer
UPDATE `creature` SET `id2`=11788 WHERE `guid`=26982; -- Rock Worm
UPDATE `creature` SET `position_x`=-294.191, `position_y`=83.1415, `position_z`=-91.3837, `orientation`=2.2994 WHERE `guid`=33719; -- Nightmare Scalebane
UPDATE `creature` SET `id`=5277 WHERE `guid`=33719; -- Nightmare Scalebane
UPDATE `creature` SET `id2`=5280 WHERE `guid`=33719; -- Nightmare Wyrmkin
UPDATE `creature` SET `id3`=8319 WHERE `guid`=33719; -- Nightmare Whelp
UPDATE `creature` SET `position_x`=-286.008, `position_y`=115.576, `position_z`=-172.92, `orientation`=4.41568 WHERE `guid`=33675; -- Murk Worm
UPDATE `creature` SET `id`=5226 WHERE `guid`=33675; -- Murk Worm
UPDATE `creature` SET `id2`=5228 WHERE `guid`=33675; -- Saturated Ooze
UPDATE `creature` SET `id3`=8311 WHERE `guid`=33675; -- Slime Maggot
UPDATE `creature` SET `position_x`=-369.253, `position_y`=82.675, `position_z`=-148.719, `orientation`=3.56047 WHERE `guid`=34519; -- Deep Lurker
UPDATE `creature` SET `id`=5226 WHERE `guid`=34519; -- Murk Worm
UPDATE `creature` SET `id2`=8311 WHERE `guid`=34519; -- Slime Maggot
UPDATE `creature` SET `id3`=8384 WHERE `guid`=34519; -- Deep Lurker
UPDATE `creature` SET `position_x`=-406.892, `position_y`=99.0353, `position_z`=-172.851, `orientation`=4.22325 WHERE `guid`=34166; -- Deep Lurker
UPDATE `creature` SET `id`=5226 WHERE `guid`=34166; -- Murk Worm
UPDATE `creature` SET `id2`=8311 WHERE `guid`=34166; -- Slime Maggot
UPDATE `creature` SET `id3`=8384 WHERE `guid`=34166; -- Deep Lurker
UPDATE `creature` SET `position_x`=-524.044, `position_y`=17.4125, `position_z`=-148.719, `orientation`=0.0495213 WHERE `guid`=33625; -- Slime Maggot
UPDATE `creature` SET `id`=5226 WHERE `guid`=33625; -- Murk Worm
UPDATE `creature` SET `id2`=8311 WHERE `guid`=33625; -- Slime Maggot
UPDATE `creature` SET `position_x`=-521.618, `position_y`=10.3077, `position_z`=-148.719, `orientation`=2.16228 WHERE `guid`=33624; -- Slime Maggot
UPDATE `creature` SET `id`=5226 WHERE `guid`=33624; -- Murk Worm
UPDATE `creature` SET `id2`=8311 WHERE `guid`=33624; -- Slime Maggot
UPDATE `creature` SET `position_x`=-7892.93, `position_y`=-2651.6, `position_z`=168.126, `orientation`=5.06145 WHERE `guid`=5423; -- Firegut Ogre
UPDATE `creature` SET `id`=7033 WHERE `guid`=5423; -- Firegut Ogre
UPDATE `creature` SET `id2`=7034 WHERE `guid`=5423; -- Firegut Ogre Mage
UPDATE `creature` SET `id3`=7035 WHERE `guid`=5423; -- Firegut Brute
UPDATE `creature` SET `position_x`=52.4136, `position_y`=-255.367, `position_z`=65.4592, `orientation`=3.63028 WHERE `guid`=300435; -- Scarshield Spellbinder
UPDATE `creature` SET `position_x`=-83.8709, `position_y`=-5015.58, `position_z`=15.7328, `orientation`=2.62776 WHERE `guid`=12302; -- Kul Tiras Marine
UPDATE `creature` SET `id`=3128 WHERE `guid`=12302; -- Kul Tiras Sailor
UPDATE `creature` SET `id2`=3129 WHERE `guid`=12302; -- Kul Tiras Marine
UPDATE `creature` SET `position_x`=-4124.49, `position_y`=411.89, `position_z`=52.4904, `orientation`=4.09377 WHERE `guid`=50387; -- Woodpaw Mongrel
UPDATE `creature` SET `id`=5249 WHERE `guid`=50387; -- Woodpaw Mongrel
UPDATE `creature` SET `id2`=5251 WHERE `guid`=50387; -- Woodpaw Trapper
UPDATE `creature` SET `id3`=5253 WHERE `guid`=50387; -- Woodpaw Brute
UPDATE `creature` SET `position_x`=-4149.17, `position_y`=381.681, `position_z`=56.5279, `orientation`=1.20132 WHERE `guid`=50404; -- Woodpaw Mongrel
UPDATE `creature` SET `id`=5249 WHERE `guid`=50404; -- Woodpaw Mongrel
UPDATE `creature` SET `id2`=5251 WHERE `guid`=50404; -- Woodpaw Trapper
UPDATE `creature` SET `id3`=5253 WHERE `guid`=50404; -- Woodpaw Brute
UPDATE `creature` SET `position_x`=-9250.67, `position_y`=-2481.36, `position_z`=48.0754, `orientation`=0.766494 WHERE `guid`=10100; -- Murloc Scout
UPDATE `creature` SET `id`=422 WHERE `guid`=10100; -- Murloc Flesheater
UPDATE `creature` SET `id2`=578 WHERE `guid`=10100; -- Murloc Scout
UPDATE `creature` SET `position_x`=-6161.32, `position_y`=-2970.52, `position_z`=210.443, `orientation`=5.80422 WHERE `guid`=7803; -- Shadowforge Surveyor
UPDATE `creature` SET `id`=4844 WHERE `guid`=7803; -- Shadowforge Surveyor
UPDATE `creature` SET `id2`=4845 WHERE `guid`=7803; -- Shadowforge Ruffian
UPDATE `creature` SET `position_x`=-9371.1, `position_y`=146.134, `position_z`=61.5761, `orientation`=3.94082 WHERE `guid`=80324; -- Sheep
UPDATE `creature` SET `id`=883 WHERE `guid`=80324; -- Deer
UPDATE `creature` SET `id2`=1933 WHERE `guid`=80324; -- Sheep
UPDATE `creature` SET `position_x`=-585.025, `position_y`=181.571, `position_z`=-69.3181, `orientation`=5.429 WHERE `guid`=39771; -- Unliving Atal'ai
UPDATE `creature` SET `id`=5259 WHERE `guid`=39771; -- Atal'ai Witch Doctor
UPDATE `creature` SET `id2`=5267 WHERE `guid`=39771; -- Unliving Atal'ai
UPDATE `creature` SET `position_x`=179.885, `position_y`=73.8904, `position_z`=104.799, `orientation`=0.447566 WHERE `guid`=91417; -- Risen Aberration
UPDATE `creature` SET `id`=10481 WHERE `guid`=91417; -- Reanimated Corpse
UPDATE `creature` SET `id2`=10485 WHERE `guid`=91417; -- Risen Aberration
UPDATE `creature` SET `id3`=10495 WHERE `guid`=91417; -- Diseased Ghoul
UPDATE `creature` SET `position_x`=1345.48, `position_y`=-1349.07, `position_z`=49.2178, `orientation`=0.218755 WHERE `guid`=46879; -- Soulless Ghoul
UPDATE `creature` SET `id`=1789 WHERE `guid`=46879; -- Skeletal Acolyte
UPDATE `creature` SET `id2`=1794 WHERE `guid`=46879; -- Soulless Ghoul
UPDATE `creature` SET `id3`=1795 WHERE `guid`=46879; -- Searing Ghoul
UPDATE `creature` SET `position_x`=185.168, `position_y`=95.0084, `position_z`=104.799, `orientation`=1.19847 WHERE `guid`=91409; -- Risen Aberration
UPDATE `creature` SET `position_x`=-5249.07, `position_y`=350.257, `position_z`=58.6813, `orientation`=6.25759 WHERE `guid`=50339; -- Zukk'ash Wasp
UPDATE `creature` SET `id`=5245 WHERE `guid`=50339; -- Zukk'ash Wasp
UPDATE `creature` SET `id2`=5246 WHERE `guid`=50339; -- Zukk'ash Worker
UPDATE `creature` SET `position_x`=-2413.77, `position_y`=-4081.05, `position_z`=2.69323, `orientation`=0.824192 WHERE `guid`=30691; -- Mirefin Muckdweller
UPDATE `creature` SET `id`=4360 WHERE `guid`=30691; -- Mirefin Warrior
UPDATE `creature` SET `id2`=4361 WHERE `guid`=30691; -- Mirefin Muckdweller
UPDATE `creature` SET `id3`=4363 WHERE `guid`=30691; -- Mirefin Oracle
UPDATE `creature` SET `position_x`=-2385.32, `position_y`=-4049.05, `position_z`=7.40195, `orientation`=2.34532 WHERE `guid`=30825; -- Mirefin Warrior
UPDATE `creature` SET `id`=4360 WHERE `guid`=30825; -- Mirefin Warrior
UPDATE `creature` SET `id2`=4361 WHERE `guid`=30825; -- Mirefin Muckdweller
UPDATE `creature` SET `id3`=4363 WHERE `guid`=30825; -- Mirefin Oracle
UPDATE `creature` SET `position_x`=-184.387, `position_y`=-2959.99, `position_z`=91.9243, `orientation`=2.09891 WHERE `guid`=20404; -- Razormane Thornweaver
UPDATE `creature` SET `id`=3267 WHERE `guid`=20404; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20404; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-4918.25, `position_y`=-2994.12, `position_z`=319.738, `orientation`=3.83977 WHERE `guid`=9325; -- Tunnel Rat Digger
UPDATE `creature` SET `id`=1174 WHERE `guid`=9325; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9325; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-7320.62, `position_y`=-4617.68, `position_z`=8.96268, `orientation`=4.45059 WHERE `guid`=23519; -- Wastewander Thief
UPDATE `creature` SET `id`=5616 WHERE `guid`=23519; -- Wastewander Thief
UPDATE `creature` SET `id2`=5617 WHERE `guid`=23519; -- Wastewander Shadow Mage
UPDATE `creature` SET `id3`=5618 WHERE `guid`=23519; -- Wastewander Bandit
UPDATE `creature` SET `position_x`=118.751, `position_y`=196.82, `position_z`=-3.39151, `orientation`=0.244346 WHERE `guid`=84251; -- Petrified Guardian
UPDATE `creature` SET `id`=11458 WHERE `guid`=84251; -- Petrified Treant
UPDATE `creature` SET `id2`=14303 WHERE `guid`=84251; -- Petrified Guardian
UPDATE `creature` SET `position_x`=-25.9732, `position_y`=198.634, `position_z`=-3.4136, `orientation`=0.000686588 WHERE `guid`=84250; -- Petrified Guardian
UPDATE `creature` SET `id`=11458 WHERE `guid`=84250; -- Petrified Treant
UPDATE `creature` SET `id2`=14303 WHERE `guid`=84250; -- Petrified Guardian
UPDATE `creature` SET `position_x`=-268.325, `position_y`=-5129.34, `position_z`=24.4246, `orientation`=5.23599 WHERE `guid`=12362; -- Kul Tiras Sailor
UPDATE `creature` SET `id`=3128 WHERE `guid`=12362; -- Kul Tiras Sailor
UPDATE `creature` SET `id2`=3129 WHERE `guid`=12362; -- Kul Tiras Marine
UPDATE `creature` SET `position_x`=5635.68, `position_y`=-676.285, `position_z`=343.851, `orientation`=4.06991 WHERE `guid`=40696; -- Entropic Beast
UPDATE `creature` SET `id`=9878 WHERE `guid`=40696; -- Entropic Beast
UPDATE `creature` SET `id2`=9879 WHERE `guid`=40696; -- Entropic Horror
UPDATE `creature` SET `position_x`=5615.65, `position_y`=-716.25, `position_z`=343.193, `orientation`=2.48204 WHERE `guid`=40719; -- Entropic Horror
UPDATE `creature` SET `id`=9878 WHERE `guid`=40719; -- Entropic Beast
UPDATE `creature` SET `id2`=9879 WHERE `guid`=40719; -- Entropic Horror
UPDATE `creature` SET `position_x`=3460.12, `position_y`=-3391.96, `position_z`=140.238, `orientation`=4.99164 WHERE `guid`=52652; -- Skeletal Guardian
UPDATE `creature` SET `id`=10382 WHERE `guid`=52652; -- Mangled Cadaver
UPDATE `creature` SET `id2`=10390 WHERE `guid`=52652; -- Skeletal Guardian
UPDATE `creature` SET `position_x`=3425.2, `position_y`=-3375.6, `position_z`=141.644, `orientation`=0.994838 WHERE `guid`=52998; -- Skeletal Guardian
UPDATE `creature` SET `id`=10390 WHERE `guid`=52998; -- Skeletal Guardian
UPDATE `creature` SET `id2`=10391 WHERE `guid`=52998; -- Skeletal Berserker
UPDATE `creature` SET `position_x`=3436.71, `position_y`=-3376.48, `position_z`=141.127, `orientation`=0.15708 WHERE `guid`=53148; -- Skeletal Berserker
UPDATE `creature` SET `position_x`=108.058, `position_y`=80.0361, `position_z`=-34.7729, `orientation`=0.226893 WHERE `guid`=79080; -- Defias Inmate
UPDATE `creature` SET `id`=1706 WHERE `guid`=79080; -- Defias Prisoner
UPDATE `creature` SET `id2`=1708 WHERE `guid`=79080; -- Defias Inmate
UPDATE `creature` SET `position_x`=-1717.48, `position_y`=1149.83, `position_z`=89.0135, `orientation`=1.29427 WHERE `guid`=27097; -- Magram Wrangler
UPDATE `creature` SET `id`=4639 WHERE `guid`=27097; -- Magram Outrunner
UPDATE `creature` SET `id2`=4640 WHERE `guid`=27097; -- Magram Wrangler
UPDATE `creature` SET `id3`=4641 WHERE `guid`=27097; -- Magram Windchaser
UPDATE `creature` SET `position_x`=-1749.89, `position_y`=1183.69, `position_z`=88.4642, `orientation`=4.96673 WHERE `guid`=27083; -- Magram Wrangler
UPDATE `creature` SET `id`=4639 WHERE `guid`=27083; -- Magram Outrunner
UPDATE `creature` SET `id2`=4640 WHERE `guid`=27083; -- Magram Wrangler
UPDATE `creature` SET `id3`=4641 WHERE `guid`=27083; -- Magram Windchaser
UPDATE `creature` SET `position_x`=-7584.55, `position_y`=-2814.06, `position_z`=134.434, `orientation`=3.41841 WHERE `guid`=5334; -- Black Dragonspawn
UPDATE `creature` SET `id`=7040 WHERE `guid`=5334; -- Black Dragonspawn
UPDATE `creature` SET `id2`=7041 WHERE `guid`=5334; -- Black Wyrmkin
UPDATE `creature` SET `position_x`=-5550.61, `position_y`=-4116.91, `position_z`=-58.6666, `orientation`=4.96307 WHERE `guid`=21395; -- Sparkleshell Tortoise
UPDATE `creature` SET `id`=4142 WHERE `guid`=21395; -- Sparkleshell Tortoise
UPDATE `creature` SET `id2`=4143 WHERE `guid`=21395; -- Sparkleshell Snapper
UPDATE `creature` SET `position_x`=-5066.89, `position_y`=-951.062, `position_z`=-5.34668, `orientation`=0.877635 WHERE `guid`=21138; -- Highperch Wyvern
UPDATE `creature` SET `id`=4107 WHERE `guid`=21138; -- Highperch Wyvern
UPDATE `creature` SET `id2`=4109 WHERE `guid`=21138; -- Highperch Consort
UPDATE `creature` SET `position_x`=-4978.29, `position_y`=-1885.76, `position_z`=-44.3603, `orientation`=2.69159 WHERE `guid`=21061; -- Boiling Elemental
UPDATE `creature` SET `id`=10756 WHERE `guid`=21061; -- Scalding Elemental
UPDATE `creature` SET `id2`=10757 WHERE `guid`=21061; -- Boiling Elemental
UPDATE `creature` SET `position_x`=-6683.74, `position_y`=1618.02, `position_z`=9.90185, `orientation`=2.32341 WHERE `guid`=42947; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42947; -- Twilight Avenger
UPDATE `creature` SET `id2`=11881 WHERE `guid`=42947; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-9054.13, `position_y`=1419.32, `position_z`=-106.088, `orientation`=3.31613 WHERE `guid`=302278; -- Qiraji Scarab
UPDATE `creature` SET `position_x`=-11612, `position_y`=413.43, `position_z`=47.2806, `orientation`=4.19984 WHERE `guid`=1733; -- Panther
UPDATE `creature` SET `id`=682 WHERE `guid`=1733; -- Stranglethorn Tiger
UPDATE `creature` SET `id2`=736 WHERE `guid`=1733; -- Panther
UPDATE `creature` SET `position_x`=-9075.86, `position_y`=1399.42, `position_z`=-106.766, `orientation`=0.139626 WHERE `guid`=302284; -- Qiraji Scarab
UPDATE `creature` SET `position_x`=2561.93, `position_y`=1058.15, `position_z`=52.8307, `orientation`=3.32265 WHERE `guid`=13362; -- Skeletal Summoner
UPDATE `creature` SET `id`=7342 WHERE `guid`=13362; -- Skeletal Summoner
UPDATE `creature` SET `id2`=7347 WHERE `guid`=13362; -- Boneflayer Ghoul
UPDATE `creature` SET `position_x`=-8451.36, `position_y`=-3883.63, `position_z`=14.4365, `orientation`=6.18862 WHERE `guid`=22005; -- Glasshide Gazer
UPDATE `creature` SET `id`=5420 WHERE `guid`=22005; -- Glasshide Gazer
UPDATE `creature` SET `id2`=5424 WHERE `guid`=22005; -- Scorpid Dunestalker
UPDATE `creature` SET `id3`=5426 WHERE `guid`=22005; -- Blisterpaw Hyena
UPDATE `creature` SET `position_x`=3123.7, `position_y`=-3212.6, `position_z`=294.146, `orientation`=2.98451 WHERE `guid`=88287; -- Embalming Slime
UPDATE `creature` SET `position_x`=3182.88, `position_y`=-3721.44, `position_z`=135.331, `orientation`=4.69774 WHERE `guid`=84394; -- Cursed Mage
UPDATE `creature` SET `id`=8523 WHERE `guid`=84394; -- Scourge Soldier
UPDATE `creature` SET `id2`=8524 WHERE `guid`=84394; -- Cursed Mage
UPDATE `creature` SET `id3`=8530 WHERE `guid`=84394; -- Cannibal Ghoul
UPDATE `creature` SET `id4`=8540 WHERE `guid`=84394; -- Torn Screamer
UPDATE `creature` SET `id5`=8543 WHERE `guid`=84394; -- Stitched Horror
UPDATE `creature` SET `position_x`=690.571, `position_y`=-934.561, `position_z`=165.034, `orientation`=0.115305 WHERE `guid`=17006; -- Syndicate Spy
UPDATE `creature` SET `id`=2242 WHERE `guid`=17006; -- Syndicate Spy
UPDATE `creature` SET `id2`=2319 WHERE `guid`=17006; -- Syndicate Wizard
UPDATE `creature` SET `position_x`=-11152.4, `position_y`=1236.6, `position_z`=79.3002, `orientation`=2.91949 WHERE `guid`=54606; -- Defias Highwayman
UPDATE `creature` SET `id`=122 WHERE `guid`=54606; -- Defias Highwayman
UPDATE `creature` SET `id2`=449 WHERE `guid`=54606; -- Defias Knuckleduster
UPDATE `creature` SET `position_x`=-9731.03, `position_y`=-2156.43, `position_z`=59.3004, `orientation`=1.86621 WHERE `guid`=10413; -- Great Goretusk
UPDATE `creature` SET `id`=441 WHERE `guid`=10413; -- Black Dragon Whelp
UPDATE `creature` SET `id2`=547 WHERE `guid`=10413; -- Great Goretusk
UPDATE `creature` SET `position_x`=-4890.15, `position_y`=-2968.82, `position_z`=316.717, `orientation`=0 WHERE `guid`=9408; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id`=1174 WHERE `guid`=9408; -- Tunnel Rat Geomancer
UPDATE `creature` SET `id2`=1175 WHERE `guid`=9408; -- Tunnel Rat Digger
UPDATE `creature` SET `position_x`=-8117.02, `position_y`=-3817.82, `position_z`=12.0778, `orientation`=0.862654 WHERE `guid`=22531; -- Blisterpaw Hyena
UPDATE `creature` SET `id`=5420 WHERE `guid`=22531; -- Glasshide Gazer
UPDATE `creature` SET `id2`=5423 WHERE `guid`=22531; -- Scorpid Tail Lasher
UPDATE `creature` SET `id3`=5426 WHERE `guid`=22531; -- Blisterpaw Hyena
UPDATE `creature` SET `position_x`=-8848.49, `position_y`=-2616.04, `position_z`=22.1651, `orientation`=4.03211 WHERE `guid`=22316; -- Scorpid Dunestalker
UPDATE `creature` SET `id`=5420 WHERE `guid`=22316; -- Glasshide Gazer
UPDATE `creature` SET `id2`=5424 WHERE `guid`=22316; -- Scorpid Dunestalker
UPDATE `creature` SET `id3`=5427 WHERE `guid`=22316; -- Rabid Blisterpaw
UPDATE `creature` SET `position_x`=2446.59, `position_y`=-5148.25, `position_z`=80.0887, `orientation`=0.590237 WHERE `guid`=92476; -- Death Singer
UPDATE `creature` SET `id`=8528 WHERE `guid`=92476; -- Dread Weaver
UPDATE `creature` SET `id2`=8529 WHERE `guid`=92476; -- Scourge Champion
UPDATE `creature` SET `id3`=8532 WHERE `guid`=92476; -- Diseased Flayer
UPDATE `creature` SET `id4`=8542 WHERE `guid`=92476; -- Death Singer
UPDATE `creature` SET `position_x`=-1020.14, `position_y`=-351.724, `position_z`=5.73378, `orientation`=3.45663 WHERE `guid`=16114; -- Torn Fin Oracle
UPDATE `creature` SET `id`=2376 WHERE `guid`=16114; -- Torn Fin Oracle
UPDATE `creature` SET `id2`=2377 WHERE `guid`=16114; -- Torn Fin Tidehunter
UPDATE `creature` SET `position_x`=4849.8, `position_y`=317.495, `position_z`=50.5124, `orientation`=1.50951 WHERE `guid`=37298; -- Grizzled Thistle Bear
UPDATE `creature` SET `id`=2165 WHERE `guid`=37298; -- Grizzled Thistle Bear
UPDATE `creature` SET `id2`=2237 WHERE `guid`=37298; -- Moonstalker Sire
UPDATE `creature` SET `position_x`=-9252.45, `position_y`=-2419.49, `position_z`=54.0784, `orientation`=2.12525 WHERE `guid`=11674; -- Murloc Flesheater
UPDATE `creature` SET `id`=422 WHERE `guid`=11674; -- Murloc Flesheater
UPDATE `creature` SET `id2`=578 WHERE `guid`=11674; -- Murloc Scout
UPDATE `creature` SET `position_x`=-9617.3, `position_y`=-2654.66, `position_z`=58.3941, `orientation`=2.61799 WHERE `guid`=16226; -- Murloc Shorestriker
UPDATE `creature` SET `id`=548 WHERE `guid`=16226; -- Murloc Minor Tidecaller
UPDATE `creature` SET `id2`=1083 WHERE `guid`=16226; -- Murloc Shorestriker
UPDATE `creature` SET `position_x`=-218.665, `position_y`=-2917.04, `position_z`=91.75, `orientation`=0.755229 WHERE `guid`=20403; -- Razormane Thornweaver
UPDATE `creature` SET `id`=3267 WHERE `guid`=20403; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20403; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-9600.44, `position_y`=-2599.1, `position_z`=59.0815, `orientation`=2.98451 WHERE `guid`=10052; -- Murloc Minor Tidecaller
UPDATE `creature` SET `id`=548 WHERE `guid`=10052; -- Murloc Minor Tidecaller
UPDATE `creature` SET `id2`=1083 WHERE `guid`=10052; -- Murloc Shorestriker
UPDATE `creature` SET `position_x`=-3050.42, `position_y`=-4283.55, `position_z`=0.0195113, `orientation`=5.11288 WHERE `guid`=73504; -- Mirefin Warrior
UPDATE `creature` SET `id`=4360 WHERE `guid`=73504; -- Mirefin Warrior
UPDATE `creature` SET `id2`=4361 WHERE `guid`=73504; -- Mirefin Muckdweller
UPDATE `creature` SET `id3`=4362 WHERE `guid`=73504; -- Mirefin Coastrunner
UPDATE `creature` SET `position_x`=10666.9, `position_y`=733.638, `position_z`=1323.49, `orientation`=3.78736 WHERE `guid`=49645; -- Mangy Nightsaber
UPDATE `creature` SET `id`=1985 WHERE `guid`=49645; -- Thistle Boar
UPDATE `creature` SET `id2`=2032 WHERE `guid`=49645; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=-10715.2, `position_y`=548.104, `position_z`=33.6304, `orientation`=4.69494 WHERE `guid`=6017; -- Pygmy Venom Web Spider
UPDATE `creature` SET `id`=217 WHERE `guid`=6017; -- Venom Web Spider
UPDATE `creature` SET `id2`=539 WHERE `guid`=6017; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-5735.78, `position_y`=-1678.79, `position_z`=361.964, `orientation`=5.23901 WHERE `guid`=4514; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4514; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4514; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-3905.02, `position_y`=1562.9, `position_z`=122.241, `orientation`=3.19395 WHERE `guid`=51106; -- Ferocious Rage Scar
UPDATE `creature` SET `id`=5297 WHERE `guid`=51106; -- Elder Rage Scar
UPDATE `creature` SET `id2`=5299 WHERE `guid`=51106; -- Ferocious Rage Scar
UPDATE `creature` SET `position_x`=-12167.3, `position_y`=268.552, `position_z`=2.87673, `orientation`=2.5048 WHERE `guid`=2386; -- Lashtail Raptor
UPDATE `creature` SET `position_x`=-5614.29, `position_y`=-1763.16, `position_z`=356.622, `orientation`=0.374587 WHERE `guid`=4547; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4547; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4547; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5050.06, `position_y`=-2047.83, `position_z`=-48.5987, `orientation`=2.79253 WHERE `guid`=21062; -- Boiling Elemental
UPDATE `creature` SET `id`=10756 WHERE `guid`=21062; -- Scalding Elemental
UPDATE `creature` SET `id2`=10757 WHERE `guid`=21062; -- Boiling Elemental
UPDATE `creature` SET `position_x`=-150.697, `position_y`=-3017.27, `position_z`=91.75, `orientation`=3.36849 WHERE `guid`=20399; -- Razormane Thornweaver
UPDATE `creature` SET `id`=3267 WHERE `guid`=20399; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20399; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-9084.56, `position_y`=-2149.29, `position_z`=138.247, `orientation`=4.07112 WHERE `guid`=10712; -- Redridge Mystic
UPDATE `creature` SET `id`=426 WHERE `guid`=10712; -- Redridge Brute
UPDATE `creature` SET `id2`=430 WHERE `guid`=10712; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-9084.01, `position_y`=-2085.94, `position_z`=128.742, `orientation`=2.54269 WHERE `guid`=8921; -- Redridge Brute
UPDATE `creature` SET `id`=426 WHERE `guid`=8921; -- Redridge Brute
UPDATE `creature` SET `id2`=430 WHERE `guid`=8921; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-190.734, `position_y`=-2946.77, `position_z`=91.7759, `orientation`=5.84118 WHERE `guid`=20384; -- Razormane Water Seeker
UPDATE `creature` SET `id`=3267 WHERE `guid`=20384; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20384; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-187.807, `position_y`=-3028.35, `position_z`=91.75, `orientation`=2.22658 WHERE `guid`=20390; -- Razormane Water Seeker (WAYPOINTS)
UPDATE `creature` SET `id`=3267 WHERE `guid`=20390; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20390; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-3321.05, `position_y`=-2256.21, `position_z`=51.9026, `orientation`=1.05336 WHERE `guid`=9752; -- Dragonmaw Raider
UPDATE `creature` SET `id`=1034 WHERE `guid`=9752; -- Dragonmaw Raider
UPDATE `creature` SET `id2`=1057 WHERE `guid`=9752; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=-5590.37, `position_y`=-1661.61, `position_z`=344.34, `orientation`=4.40422 WHERE `guid`=4544; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4544; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4544; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5649.2, `position_y`=-1683.93, `position_z`=360.879, `orientation`=6.09295 WHERE `guid`=4500; -- Rockjaw Skullthumper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4500; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4500; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-10852.1, `position_y`=1315.57, `position_z`=37.1035, `orientation`=4.40168 WHERE `guid`=89687; -- Riverpaw Brute
UPDATE `creature` SET `id`=124 WHERE `guid`=89687; -- Riverpaw Brute
UPDATE `creature` SET `id2`=452 WHERE `guid`=89687; -- Riverpaw Bandit
UPDATE `creature` SET `position_x`=-178.922, `position_y`=-254.415, `position_z`=150.987, `orientation`=4.58729 WHERE `guid`=17587; -- Hulking Mountain Lion
UPDATE `creature` SET `id`=2406 WHERE `guid`=17587; -- Mountain Lion
UPDATE `creature` SET `id2`=2407 WHERE `guid`=17587; -- Hulking Mountain Lion
UPDATE `creature` SET `position_x`=-10961.5, `position_y`=-981.198, `position_z`=71.2463, `orientation`=4.31096 WHERE `guid`=5011; -- Nightbane Dark Runner
UPDATE `creature` SET `id`=205 WHERE `guid`=5011; -- Nightbane Dark Runner
UPDATE `creature` SET `id2`=533 WHERE `guid`=5011; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=1986.01, `position_y`=-4449.97, `position_z`=73.7739, `orientation`=6.21303 WHERE `guid`=92522; -- Hate Shrieker
UPDATE `creature` SET `id`=8525 WHERE `guid`=92522; -- Scourge Warder
UPDATE `creature` SET `id2`=8531 WHERE `guid`=92522; -- Gibbering Ghoul
UPDATE `creature` SET `id3`=8541 WHERE `guid`=92522; -- Hate Shrieker
UPDATE `creature` SET `position_x`=2050.36, `position_y`=-4550.83, `position_z`=74.802, `orientation`=4.18859 WHERE `guid`=92596; -- Hate Shrieker
UPDATE `creature` SET `id`=8541 WHERE `guid`=92596; -- Hate Shrieker
UPDATE `creature` SET `id2`=8543 WHERE `guid`=92596; -- Stitched Horror
UPDATE `creature` SET `position_x`=-9380.89, `position_y`=-2449.52, `position_z`=29.2163, `orientation`=6.066 WHERE `guid`=10106; -- Murloc Flesheater
UPDATE `creature` SET `id`=422 WHERE `guid`=10106; -- Murloc Flesheater
UPDATE `creature` SET `id2`=578 WHERE `guid`=10106; -- Murloc Scout
UPDATE `creature` SET `position_x`=-12685.5, `position_y`=-245.515, `position_z`=38.4312, `orientation`=3.44551 WHERE `guid`=2582; -- Stranglethorn Tigress
UPDATE `creature` SET `id`=684 WHERE `guid`=2582; -- Shadowmaw Panther
UPDATE `creature` SET `id2`=772 WHERE `guid`=2582; -- Stranglethorn Tigress
UPDATE `creature` SET `position_x`=-9788.75, `position_y`=-3200.82, `position_z`=58.7922, `orientation`=0.695122 WHERE `guid`=7770; -- Blackrock Grunt
UPDATE `creature` SET `id`=440 WHERE `guid`=7770; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=7770; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9751.65, `position_y`=-2232.47, `position_z`=59.4397, `orientation`=0 WHERE `guid`=16325; -- Redridge Mongrel
UPDATE `creature` SET `id`=423 WHERE `guid`=16325; -- Redridge Mongrel
UPDATE `creature` SET `id2`=424 WHERE `guid`=16325; -- Redridge Poacher
UPDATE `creature` SET `id3`=712 WHERE `guid`=16325; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-11233.7, `position_y`=1235.98, `position_z`=89.6398, `orientation`=4.90693 WHERE `guid`=89911; -- Defias Knuckleduster
UPDATE `creature` SET `id`=122 WHERE `guid`=89911; -- Defias Highwayman
UPDATE `creature` SET `id2`=449 WHERE `guid`=89911; -- Defias Knuckleduster
UPDATE `creature` SET `position_x`=-1015.34, `position_y`=1116.14, `position_z`=88.3012, `orientation`=5.27685 WHERE `guid`=27008; -- Kolkar Centaur
UPDATE `creature` SET `id`=4632 WHERE `guid`=27008; -- Kolkar Centaur
UPDATE `creature` SET `id2`=4633 WHERE `guid`=27008; -- Kolkar Scout
UPDATE `creature` SET `id3`=4635 WHERE `guid`=27008; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-351.694, `position_y`=927.327, `position_z`=132.973, `orientation`=1.71328 WHERE `guid`=28400; -- Ravenclaw Drudger
UPDATE `creature` SET `position_x`=683.247, `position_y`=1017.56, `position_z`=41.4318, `orientation`=3.34019 WHERE `guid`=18254; -- Hand of Ravenclaw
UPDATE `creature` SET `position_x`=-1210.85, `position_y`=-2725.29, `position_z`=106.779, `orientation`=1.515 WHERE `guid`=13993; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1247.53, `position_y`=-2751.34, `position_z`=91.7988, `orientation`=4.08192 WHERE `guid`=20584; -- Kolkar Marauder
UPDATE `creature` SET `position_x`=-1217.07, `position_y`=-2776.09, `position_z`=92.406, `orientation`=3.92716 WHERE `guid`=20578; -- Kolkar Marauder (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1154.1, `position_y`=-2780.16, `position_z`=91.7534, `orientation`=3.65871 WHERE `guid`=20572; -- Kolkar Pack Runner
UPDATE `creature` SET `position_x`=-1151.8, `position_y`=-2779.69, `position_z`=91.7745, `orientation`=3.4067 WHERE `guid`=20868; -- Kolkar Packhound
UPDATE `creature` SET `position_x`=-1147.12, `position_y`=-2797.95, `position_z`=92.088, `orientation`=4.15185 WHERE `guid`=13996; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1127.29, `position_y`=-2796.91, `position_z`=92.036, `orientation`=4.76475 WHERE `guid`=13995; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1106.85, `position_y`=-2788.52, `position_z`=91.7561, `orientation`=5.08994 WHERE `guid`=20512; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=-1290.21, `position_y`=-2842.35, `position_z`=93.5535, `orientation`=3.6702 WHERE `guid`=20586; -- Kolkar Marauder
UPDATE `creature` SET `position_x`=1017.31, `position_y`=714.182, `position_z`=74.0867, `orientation`=0.804981 WHERE `guid`=18272; -- Raging Rot Hide
UPDATE `creature` SET `position_x`=-1287.78, `position_y`=-2820.83, `position_z`=93.1558, `orientation`=3.22886 WHERE `guid`=20580; -- Kolkar Marauder
UPDATE `creature` SET `position_x`=-2111.75, `position_y`=-3648.2, `position_z`=87.4877, `orientation`=3.12414 WHERE `guid`=13932; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2111.03, `position_y`=-3636.61, `position_z`=96.2727, `orientation`=5.07891 WHERE `guid`=13930; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2086.39, `position_y`=-3658.66, `position_z`=96.2542, `orientation`=2.08179 WHERE `guid`=13885; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2150.28, `position_y`=-3594.85, `position_z`=92.2274, `orientation`=3.07267 WHERE `guid`=13936; -- Theramore Preserver
UPDATE `creature` SET `position_x`=-2118.18, `position_y`=-3524.97, `position_z`=92.5123, `orientation`=3.26377 WHERE `guid`=13901; -- Theramore Marine
UPDATE `creature` SET `position_x`=-1714.21, `position_y`=-3852.16, `position_z`=9.52246, `orientation`=0.982617 WHERE `guid`=13786; -- Southsea Brigand
UPDATE `creature` SET `position_x`=1064.88, `position_y`=-3031.6, `position_z`=82.8101, `orientation`=2.05721 WHERE `guid`=20800; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=445.066, `position_y`=560.534, `position_z`=84.8809, `orientation`=4.13233 WHERE `guid`=29678; -- Deepmoss Creeper
UPDATE `creature` SET `position_x`=-12115.4, `position_y`=50.2957, `position_z`=-7.15695, `orientation`=3.7109 WHERE `guid`=1192; -- Murkgill Forager
UPDATE `creature` SET `position_x`=-115.563, `position_y`=-4317.46, `position_z`=132.31, `orientation`=4.39095 WHERE `guid`=93351; -- Silvermane Stalker
UPDATE `creature` SET `position_x`=-12049.9, `position_y`=51.9722, `position_z`=-0.829704, `orientation`=4.60373 WHERE `guid`=1197; -- Murkgill Forager
UPDATE `creature` SET `position_x`=1957.64, `position_y`=-2699.37, `position_z`=107.796, `orientation`=1.28163 WHERE `guid`=32360; -- Ashenvale Outrunner
UPDATE `creature` SET `position_x`=1968.8, `position_y`=-2658.62, `position_z`=98.6224, `orientation`=2.29652 WHERE `guid`=32361; -- Ashenvale Outrunner
UPDATE `creature` SET `position_x`=-2917.68, `position_y`=-2784.46, `position_z`=32.1655, `orientation`=4.92474 WHERE `guid`=33891; -- Darkmist Spider
UPDATE `creature` SET `id`=4376 WHERE `guid`=33891; -- Darkmist Spider
UPDATE `creature` SET `id2`=4378 WHERE `guid`=33891; -- Darkmist Recluse
UPDATE `creature` SET `position_x`=-12084.1, `position_y`=50.1865, `position_z`=-5.54387, `orientation`=1.45922 WHERE `guid`=1184; -- Murkgill Forager
UPDATE `creature` SET `position_x`=-10951, `position_y`=-3680.67, `position_z`=8.32344, `orientation`=4.99223 WHERE `guid`=43595; -- Marsh Flesheater
UPDATE `creature` SET `position_x`=-10859.4, `position_y`=-3650.71, `position_z`=16.9707, `orientation`=2.28219 WHERE `guid`=43600; -- Marsh Flesheater
UPDATE `creature` SET `position_x`=-10881.3, `position_y`=-3642.88, `position_z`=11.983, `orientation`=3.25511 WHERE `guid`=43593; -- Marsh Flesheater
UPDATE `creature` SET `position_x`=-11466.6, `position_y`=-759.28, `position_z`=31.4827, `orientation`=0.331613 WHERE `guid`=1619; -- Kurzen Commando
UPDATE `creature` SET `position_x`=-273.915, `position_y`=-9.28498, `position_z`=-105.502, `orientation`=5.65487 WHERE `guid`=38135; -- Biletoad
UPDATE `creature` SET `position_x`=-4012, `position_y`=-154.123, `position_z`=136.516, `orientation`=6.16043 WHERE `guid`=50254; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-3991.36, `position_y`=-140.839, `position_z`=139.212, `orientation`=1.37207 WHERE `guid`=50198; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-3983.53, `position_y`=-130.433, `position_z`=141.03, `orientation`=0.0523599 WHERE `guid`=50253; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-3384.09, `position_y`=-2544.7, `position_z`=20.9999, `orientation`=1.52434 WHERE `guid`=10752; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-11493.5, `position_y`=-793.252, `position_z`=32.1257, `orientation`=4.49851 WHERE `guid`=1617; -- Kurzen Commando
UPDATE `creature` SET `position_x`=-11586.5, `position_y`=315.137, `position_z`=42.9595, `orientation`=2.64041 WHERE `guid`=1708; -- Panther
UPDATE `creature` SET `id`=682 WHERE `guid`=1708; -- Stranglethorn Tiger
UPDATE `creature` SET `id2`=736 WHERE `guid`=1708; -- Panther
UPDATE `creature` SET `position_x`=-11478.1, `position_y`=-775.005, `position_z`=31.8618, `orientation`=4.18227 WHERE `guid`=1622; -- Kurzen Headshrinker
UPDATE `creature` SET `position_x`=-12750.8, `position_y`=84.3681, `position_z`=10.3576, `orientation`=5.625 WHERE `guid`=1949; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-783.98, `position_y`=-2115.47, `position_z`=37.5058, `orientation`=2.78076 WHERE `guid`=14769; -- Syndicate Highwayman
UPDATE `creature` SET `position_x`=-3975.56, `position_y`=-94.1456, `position_z`=150.152, `orientation`=0.483484 WHERE `guid`=50177; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=285.265, `position_y`=-449.25, `position_z`=154.248, `orientation`=2.20901 WHERE `guid`=17359; -- Giant Yeti
UPDATE `creature` SET `position_x`=-11440.9, `position_y`=71.8213, `position_z`=39.2201, `orientation`=0 WHERE `guid`=790; -- Stone Maw Basilisk
UPDATE `creature` SET `position_x`=-2014.68, `position_y`=2518.14, `position_z`=61.5516, `orientation`=1.07015 WHERE `guid`=27168; -- Gelkis Stamper
UPDATE `creature` SET `position_x`=323.061, `position_y`=-4156.1, `position_z`=119.43, `orientation`=1.57124 WHERE `guid`=93632; -- Vilebranch Scalper
UPDATE `creature` SET `position_x`=-12746, `position_y`=-213.938, `position_z`=39.5802, `orientation`=2.13679 WHERE `guid`=2157; -- Stranglethorn Tigress
UPDATE `creature` SET `id`=684 WHERE `guid`=2157; -- Shadowmaw Panther
UPDATE `creature` SET `id2`=772 WHERE `guid`=2157; -- Stranglethorn Tigress
UPDATE `creature` SET `position_x`=-3439.55, `position_y`=-2438.29, `position_z`=52.1575, `orientation`=1.02974 WHERE `guid`=9771; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=250.813, `position_y`=-415.667, `position_z`=153.19, `orientation`=6.13456 WHERE `guid`=17364; -- Giant Yeti
UPDATE `creature` SET `position_x`=-12718.8, `position_y`=119.785, `position_z`=7.81756, `orientation`=3.40184 WHERE `guid`=1962; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-12681.3, `position_y`=-154.41, `position_z`=21.2554, `orientation`=5.83003 WHERE `guid`=1872; -- Stranglethorn Tigress
UPDATE `creature` SET `id`=684 WHERE `guid`=1872; -- Shadowmaw Panther
UPDATE `creature` SET `id2`=772 WHERE `guid`=1872; -- Stranglethorn Tigress
UPDATE `creature` SET `position_x`=-11461.2, `position_y`=-821.959, `position_z`=15.5941, `orientation`=3.73701 WHERE `guid`=1450; -- Kurzen Elite
UPDATE `creature` SET `position_x`=-11449.7, `position_y`=-819.232, `position_z`=15.8781, `orientation`=0.71791 WHERE `guid`=1443; -- Kurzen Witch Doctor
UPDATE `creature` SET `position_x`=-6918.5, `position_y`=-2753.09, `position_z`=242.707, `orientation`=3.64007 WHERE `guid`=7807; -- Elder Crag Coyote
UPDATE `creature` SET `position_x`=-11457.4, `position_y`=-837.599, `position_z`=14.0551, `orientation`=3.42061 WHERE `guid`=1453; -- Kurzen Elite
UPDATE `creature` SET `position_x`=-11427.6, `position_y`=-835.566, `position_z`=14.7526, `orientation`=2.10789 WHERE `guid`=1439; -- Kurzen Witch Doctor
UPDATE `creature` SET `position_x`=-6946.96, `position_y`=-2722.25, `position_z`=249.884, `orientation`=4.92164 WHERE `guid`=7107; -- Ridge Stalker Patriarch
UPDATE `creature` SET `position_x`=-11437.3, `position_y`=-835.583, `position_z`=14.8126, `orientation`=5.44527 WHERE `guid`=1441; -- Kurzen Elite
UPDATE `creature` SET `position_x`=-11635.9, `position_y`=639.07, `position_z`=51.3598, `orientation`=3.08923 WHERE `guid`=1083; -- Bloodscalp Scout (WAYPOINTS)
UPDATE `creature` SET `position_x`=-11448.2, `position_y`=-799.098, `position_z`=15.2394, `orientation`=0.515984 WHERE `guid`=1444; -- Kurzen Elite
UPDATE `creature` SET `position_x`=1893.69, `position_y`=-1326.66, `position_z`=59.8602, `orientation`=2.0944 WHERE `guid`=45343; -- Scarlet Hunter
UPDATE `creature` SET `position_x`=-11419.9, `position_y`=-770.034, `position_z`=15.0478, `orientation`=0.61678 WHERE `guid`=1455; -- Kurzen Witch Doctor
UPDATE `creature` SET `position_x`=5582.62, `position_y`=-916.062, `position_z`=378.648, `orientation`=1.49062 WHERE `guid`=40726; -- Entropic Beast
UPDATE `creature` SET `position_x`=-5082.2, `position_y`=-1014.86, `position_z`=-4.77221, `orientation`=0.83635 WHERE `guid`=21131; -- Highperch Wyvern
UPDATE `creature` SET `id`=4107 WHERE `guid`=21131; -- Highperch Wyvern
UPDATE `creature` SET `id2`=4109 WHERE `guid`=21131; -- Highperch Consort
UPDATE `creature` SET `position_x`=-11432.5, `position_y`=-760.812, `position_z`=12.8917, `orientation`=5.62516 WHERE `guid`=1451; -- Kurzen Elite
UPDATE `creature` SET `position_x`=-11411.3, `position_y`=-801.602, `position_z`=15.0478, `orientation`=2.66977 WHERE `guid`=1452; -- Kurzen Witch Doctor
UPDATE `creature` SET `position_x`=-11624, `position_y`=683.795, `position_z`=49.1435, `orientation`=0.835035 WHERE `guid`=2235; -- Bloodscalp Berserker
UPDATE `creature` SET `position_x`=-7245.93, `position_y`=-1151.29, `position_z`=-252.818, `orientation`=3.3721 WHERE `guid`=24140; -- Scorching Elemental
UPDATE `creature` SET `position_x`=60.13, `position_y`=257.346, `position_z`=43.6961, `orientation`=4.16046 WHERE `guid`=16797; -- Dalaran Summoner
UPDATE `creature` SET `position_x`=-2113.92, `position_y`=2417.16, `position_z`=62.6078, `orientation`=0.495711 WHERE `guid`=27209; -- Gelkis Stamper
UPDATE `creature` SET `id`=4646 WHERE `guid`=27209; -- Gelkis Outrunner
UPDATE `creature` SET `id2`=4648 WHERE `guid`=27209; -- Gelkis Stamper
UPDATE `creature` SET `id3`=4649 WHERE `guid`=27209; -- Gelkis Windchaser
UPDATE `creature` SET `position_x`=-2123.45, `position_y`=2479.54, `position_z`=17.3137, `orientation`=1.42068 WHERE `guid`=27153; -- Gelkis Stamper
UPDATE `creature` SET `position_x`=-2093.99, `position_y`=2484.78, `position_z`=18.0619, `orientation`=4.20004 WHERE `guid`=27136; -- Gelkis Outrunner
UPDATE `creature` SET `position_x`=-5049.74, `position_y`=-918.142, `position_z`=-5.54227, `orientation`=5.58765 WHERE `guid`=21150; -- Highperch Consort
UPDATE `creature` SET `position_x`=-11846.9, `position_y`=-452.411, `position_z`=11.4444, `orientation`=5.04136 WHERE `guid`=2489; -- Snapjaw Crocolisk
UPDATE `creature` SET `position_x`=282.63, `position_y`=-3117.2, `position_z`=120.017, `orientation`=3.9298 WHERE `guid`=93275; -- Primitive Owlbeast
UPDATE `creature` SET `position_x`=-14285.9, `position_y`=84.5272, `position_z`=6.3212, `orientation`=0.635775 WHERE `guid`=2568; -- Bloodsail Raider
UPDATE `creature` SET `position_x`=315.964, `position_y`=-3082.11, `position_z`=118.744, `orientation`=4.0558 WHERE `guid`=93145; -- Primitive Owlbeast
UPDATE `creature` SET `position_x`=-13603, `position_y`=-327.645, `position_z`=13.3631, `orientation`=4.35688 WHERE `guid`=2388; -- Zanzil Zombie
UPDATE `creature` SET `position_x`=-13582.4, `position_y`=-250.478, `position_z`=21.0122, `orientation`=0.394312 WHERE `guid`=2257; -- Zanzil Zombie
UPDATE `creature` SET `position_x`=5211.91, `position_y`=-742.095, `position_z`=345.431, `orientation`=1.73924 WHERE `guid`=40437; -- Tainted Ooze
UPDATE `creature` SET `position_x`=5232.65, `position_y`=-773.551, `position_z`=344.779, `orientation`=4.78567 WHERE `guid`=40420; -- Tainted Ooze
UPDATE `creature` SET `position_x`=-6083.86, `position_y`=-4248.29, `position_z`=-58.6667, `orientation`=5.13554 WHERE `guid`=21538; -- Saltstone Crystalhide
UPDATE `creature` SET `position_x`=-11645.7, `position_y`=744.522, `position_z`=40.0095, `orientation`=1.71632 WHERE `guid`=1390; -- Bloodscalp Berserker
UPDATE `creature` SET `position_x`=-2084.11, `position_y`=2418.05, `position_z`=61.5599, `orientation`=5.25132 WHERE `guid`=27210; -- Gelkis Stamper
UPDATE `creature` SET `position_x`=-1321.14, `position_y`=-3880.71, `position_z`=11.4778, `orientation`=0.743979 WHERE `guid`=13777; -- Southsea Brigand
UPDATE `creature` SET `position_x`=1804.86, `position_y`=-1258.73, `position_z`=61.9001, `orientation`=0.367981 WHERE `guid`=48132; -- Skeletal Flayer
UPDATE `creature` SET `position_x`=-11549.4, `position_y`=349.149, `position_z`=44.2579, `orientation`=0.130861 WHERE `guid`=1877; -- Panther
UPDATE `creature` SET `position_x`=-7983.15, `position_y`=-5184.09, `position_z`=2.14128, `orientation`=1.8526 WHERE `guid`=23311; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-2015.77, `position_y`=2482.76, `position_z`=61.5099, `orientation`=0.517768 WHERE `guid`=27143; -- Gelkis Outrunner
UPDATE `creature` SET `position_x`=-1616.14, `position_y`=-3883.25, `position_z`=14.4435, `orientation`=5.26279 WHERE `guid`=13799; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=-11682.7, `position_y`=206.408, `position_z`=43.8369, `orientation`=0 WHERE `guid`=1303; -- Bloodscalp Scavenger
UPDATE `creature` SET `position_x`=-4564.53, `position_y`=858.474, `position_z`=60.8714, `orientation`=0.751662 WHERE `guid`=50036; -- Grimtotem Raider
UPDATE `creature` SET `position_x`=-13572.9, `position_y`=-440.851, `position_z`=0.522643, `orientation`=2.51929 WHERE `guid`=760; -- Zanzil Zombie
UPDATE `creature` SET `position_x`=-1016.37, `position_y`=-3351.26, `position_z`=52.7191, `orientation`=4.69647 WHERE `guid`=14507; -- Highland Strider
UPDATE `creature` SET `position_x`=-12818.8, `position_y`=-814.662, `position_z`=60.5565, `orientation`=3.0412 WHERE `guid`=1952; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-11462.6, `position_y`=-732.909, `position_z`=31.3174, `orientation`=4.3421 WHERE `guid`=1623; -- Kurzen Headshrinker
UPDATE `creature` SET `position_x`=-5018.44, `position_y`=-2315.83, `position_z`=-47.9164, `orientation`=5.71036 WHERE `guid`=20978; -- Galak Wrangler
UPDATE `creature` SET `position_x`=695.89, `position_y`=-935.953, `position_z`=171.889, `orientation`=6.08583 WHERE `guid`=17010; -- Syndicate Spy
UPDATE `creature` SET `position_x`=-2865.64, `position_y`=-3931.2, `position_z`=38.2594, `orientation`=0.378029 WHERE `guid`=73673; -- Bloodfen Raptor
UPDATE `creature` SET `position_x`=-12860.7, `position_y`=-807.555, `position_z`=54.8803, `orientation`=5.75959 WHERE `guid`=1253; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-5085.63, `position_y`=-2255.33, `position_z`=-54.4042, `orientation`=3.91902 WHERE `guid`=21715; -- Galak Wrangler
UPDATE `creature` SET `position_x`=-5001.2, `position_y`=-2351.74, `position_z`=-55.5589, `orientation`=5.70172 WHERE `guid`=21037; -- Galak Mauler
UPDATE `creature` SET `position_x`=1481.41, `position_y`=883.148, `position_z`=130.43, `orientation`=5.44272 WHERE `guid`=29755; -- Deepmoss Venomspitter
UPDATE `creature` SET `position_x`=3311.63, `position_y`=-480.315, `position_z`=154.341, `orientation`=2.23785 WHERE `guid`=32488; -- Thistlefur Shaman
UPDATE `creature` SET `position_x`=-4962.53, `position_y`=-2345.88, `position_z`=-60.4069, `orientation`=0.15708 WHERE `guid`=21015; -- Galak Mauler
UPDATE `creature` SET `position_x`=-4993.37, `position_y`=-2315.58, `position_z`=-57.914, `orientation`=6.16424 WHERE `guid`=21038; -- Galak Mauler
UPDATE `creature` SET `position_x`=6480.68, `position_y`=-1581.05, `position_z`=439.056, `orientation`=1.72139 WHERE `guid`=40292; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=-4981.29, `position_y`=-2326.74, `position_z`=-56.4513, `orientation`=1.21981 WHERE `guid`=21771; -- Galak Mauler
UPDATE `creature` SET `position_x`=6454.91, `position_y`=-1544.6, `position_z`=439.748, `orientation`=0.665447 WHERE `guid`=40295; -- Warpwood Moss Flayer
UPDATE `creature` SET `position_x`=-4973.32, `position_y`=-2278.48, `position_z`=-63.5163, `orientation`=1.4627 WHERE `guid`=21767; -- Galak Mauler
UPDATE `creature` SET `position_x`=3615.52, `position_y`=984.012, `position_z`=-2.5191, `orientation`=2.50219 WHERE `guid`=32803; -- Wrathtail Wave Rider
UPDATE `creature` SET `position_x`=-12350.8, `position_y`=-180.524, `position_z`=21.3016, `orientation`=1.54149 WHERE `guid`=1837; -- Lashtail Raptor
UPDATE `creature` SET `position_x`=-883.05, `position_y`=1117.73, `position_z`=92.126, `orientation`=3.79388 WHERE `guid`=27007; -- Kolkar Centaur
UPDATE `creature` SET `position_x`=2448.94, `position_y`=1482.78, `position_z`=265.363, `orientation`=5.02723 WHERE `guid`=32213; -- Cenarion Botanist
UPDATE `creature` SET `id`=4051 WHERE `guid`=32213; -- Cenarion Botanist
UPDATE `creature` SET `id2`=4053 WHERE `guid`=32213; -- Daughter of Cenarius
UPDATE `creature` SET `position_x`=2527.94, `position_y`=1472.74, `position_z`=263.158, `orientation`=2.48664 WHERE `guid`=32214; -- Cenarion Botanist
UPDATE `creature` SET `position_x`=-7212.82, `position_y`=-4630.14, `position_z`=8.97289, `orientation`=2.21657 WHERE `guid`=23503; -- Wastewander Thief
UPDATE `creature` SET `position_x`=-2170.98, `position_y`=-1722.9, `position_z`=-39.903, `orientation`=4.16179 WHERE `guid`=11470; -- Daggerspine Sorceress
UPDATE `creature` SET `position_x`=-1385.73, `position_y`=2852.6, `position_z`=125.554, `orientation`=2.11659 WHERE `guid`=27303; -- Maraudine Scout
UPDATE `creature` SET `position_x`=6214.13, `position_y`=-1047.62, `position_z`=384.531, `orientation`=5.47306 WHERE `guid`=40376; -- Irontree Stomper
UPDATE `creature` SET `position_x`=6125.01, `position_y`=-1106.74, `position_z`=377.938, `orientation`=5.24597 WHERE `guid`=40374; -- Irontree Stomper
UPDATE `creature` SET `position_x`=6168.68, `position_y`=-1044.63, `position_z`=384.594, `orientation`=1.20855 WHERE `guid`=40373; -- Irontree Stomper
UPDATE `creature` SET `position_x`=-1014.81, `position_y`=1050.45, `position_z`=90.3611, `orientation`=0.552963 WHERE `guid`=27022; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-1049.11, `position_y`=1084.41, `position_z`=88.3012, `orientation`=2.82159 WHERE `guid`=27010; -- Kolkar Centaur
UPDATE `creature` SET `position_x`=-5015.98, `position_y`=416.29, `position_z`=14.6004, `orientation`=5.69188 WHERE `guid`=50517; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=-982.611, `position_y`=1017.28, `position_z`=89.4381, `orientation`=0.30239 WHERE `guid`=27047; -- Kolkar Windchaser
UPDATE `creature` SET `id`=4634 WHERE `guid`=27047; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27047; -- Kolkar Windchaser
UPDATE `creature` SET `id3`=4636 WHERE `guid`=27047; -- Kolkar Battle Lord
UPDATE `creature` SET `id4`=4637 WHERE `guid`=27047; -- Kolkar Destroyer
UPDATE `creature` SET `position_x`=-7407.91, `position_y`=-4584.22, `position_z`=8.92526, `orientation`=5.70936 WHERE `guid`=23521; -- Wastewander Thief
UPDATE `creature` SET `id`=5616 WHERE `guid`=23521; -- Wastewander Thief
UPDATE `creature` SET `id2`=5617 WHERE `guid`=23521; -- Wastewander Shadow Mage
UPDATE `creature` SET `id3`=5618 WHERE `guid`=23521; -- Wastewander Bandit
UPDATE `creature` SET `position_x`=-1066.21, `position_y`=1045.3, `position_z`=90.4762, `orientation`=3.1765 WHERE `guid`=27018; -- Kolkar Mauler
UPDATE `creature` SET `position_x`=6015.12, `position_y`=-1215.73, `position_z`=375.266, `orientation`=4.82363 WHERE `guid`=40377; -- Irontree Stomper
UPDATE `creature` SET `position_x`=-5498.43, `position_y`=-1624.74, `position_z`=26.8312, `orientation`=0.527838 WHERE `guid`=21051; -- Screeching Harpy
UPDATE `creature` SET `position_x`=6258.06, `position_y`=-1068.55, `position_z`=374.509, `orientation`=5.2495 WHERE `guid`=40375; -- Irontree Stomper
UPDATE `creature` SET `position_x`=-5532.99, `position_y`=-1601.91, `position_z`=29.3368, `orientation`=3.94274 WHERE `guid`=21050; -- Screeching Harpy
UPDATE `creature` SET `position_x`=-5539.4, `position_y`=-1593.17, `position_z`=29.0201, `orientation`=2.43409 WHERE `guid`=21102; -- Screeching Harpy
UPDATE `creature` SET `position_x`=5987.3, `position_y`=-1153.31, `position_z`=384.917, `orientation`=2.12942 WHERE `guid`=40379; -- Irontree Stomper
UPDATE `creature` SET `position_x`=-4943.61, `position_y`=1197.56, `position_z`=60.1416, `orientation`=5.01698 WHERE `guid`=50223; -- Gordunni Mauler
UPDATE `creature` SET `position_x`=-5557.96, `position_y`=-1631.92, `position_z`=22.0621, `orientation`=5.70034 WHERE `guid`=21099; -- Screeching Harpy
UPDATE `creature` SET `position_x`=-885.626, `position_y`=216.513, `position_z`=8.90677, `orientation`=3.04576 WHERE `guid`=15803; -- Hillsbrad Sentry
UPDATE `creature` SET `position_x`=-252.424, `position_y`=1687.53, `position_z`=102.503, `orientation`=0.0480042 WHERE `guid`=27614; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=349.776, `position_y`=-2815.59, `position_z`=120.633, `orientation`=1.44361 WHERE `guid`=93282; -- Highvale Marksman
UPDATE `creature` SET `position_x`=-5612.58, `position_y`=-1607.92, `position_z`=14.6203, `orientation`=3.04845 WHERE `guid`=21054; -- Screeching Harpy
UPDATE `creature` SET `position_x`=-863.4, `position_y`=237.99, `position_z`=10.7573, `orientation`=2.68662 WHERE `guid`=15804; -- Hillsbrad Sentry
UPDATE `creature` SET `position_x`=-5578.65, `position_y`=-1576.33, `position_z`=10.5393, `orientation`=5.32011 WHERE `guid`=21039; -- Screeching Harpy
UPDATE `creature` SET `position_x`=-4053.65, `position_y`=-2146.14, `position_z`=90.1436, `orientation`=3.5197 WHERE `guid`=13593; -- Bael'dun Excavator
UPDATE `creature` SET `position_x`=-228.199, `position_y`=1682.02, `position_z`=99.8361, `orientation`=1.51493 WHERE `guid`=27608; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=-219.901, `position_y`=1657.29, `position_z`=99.3047, `orientation`=2.25147 WHERE `guid`=27626; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=-210.054, `position_y`=1684.53, `position_z`=104.19, `orientation`=0.693115 WHERE `guid`=27611; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=-235.311, `position_y`=1671.04, `position_z`=101.067, `orientation`=1.84242 WHERE `guid`=27615; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=3823.84, `position_y`=-786.405, `position_z`=307.822, `orientation`=2.74017 WHERE `guid`=40799; -- Jadefire Felsworn
UPDATE `creature` SET `id`=7105 WHERE `guid`=40799; -- Jadefire Satyr
UPDATE `creature` SET `id2`=7109 WHERE `guid`=40799; -- Jadefire Felsworn
UPDATE `creature` SET `position_x`=3812.21, `position_y`=-805.755, `position_z`=300.567, `orientation`=4.02354 WHERE `guid`=39579; -- Jadefire Satyr
UPDATE `creature` SET `position_x`=5382.3, `position_y`=-712.759, `position_z`=346.932, `orientation`=3.59795 WHERE `guid`=40512; -- Tainted Ooze
UPDATE `creature` SET `position_x`=-1016.17, `position_y`=276.836, `position_z`=2.31336, `orientation`=0.850878 WHERE `guid`=15685; -- Torn Fin Muckdweller
UPDATE `creature` SET `position_x`=3797.85, `position_y`=-775.798, `position_z`=315.221, `orientation`=1.50098 WHERE `guid`=39423; -- Jadefire Satyr
UPDATE `creature` SET `id`=7105 WHERE `guid`=39423; -- Jadefire Satyr
UPDATE `creature` SET `id2`=7109 WHERE `guid`=39423; -- Jadefire Felsworn
UPDATE `creature` SET `position_x`=-986.415, `position_y`=285.767, `position_z`=4.73462, `orientation`=0.174904 WHERE `guid`=15681; -- Torn Fin Muckdweller
UPDATE `creature` SET `id`=2374 WHERE `guid`=15681; -- Torn Fin Muckdweller
UPDATE `creature` SET `id2`=2375 WHERE `guid`=15681; -- Torn Fin Coastrunner
UPDATE `creature` SET `position_x`=3792.88, `position_y`=-758.61, `position_z`=321.933, `orientation`=5.58536 WHERE `guid`=39425; -- Jadefire Satyr
UPDATE `creature` SET `position_x`=3849.44, `position_y`=-750.025, `position_z`=315.029, `orientation`=4.13204 WHERE `guid`=40796; -- Jadefire Satyr
UPDATE `creature` SET `id`=7105 WHERE `guid`=40796; -- Jadefire Satyr
UPDATE `creature` SET `id2`=7109 WHERE `guid`=40796; -- Jadefire Felsworn
UPDATE `creature` SET `position_x`=-11614.3, `position_y`=-781.342, `position_z`=41.9306, `orientation`=3.12511 WHERE `guid`=2248; -- Kurzen Jungle Fighter
UPDATE `creature` SET `position_x`=3782.28, `position_y`=-852.175, `position_z`=302.705, `orientation`=2.48769 WHERE `guid`=39578; -- Jadefire Satyr
UPDATE `creature` SET `position_x`=-8084.49, `position_y`=-2686.01, `position_z`=13.2056, `orientation`=3.93528 WHERE `guid`=23024; -- Centipaar Wasp
UPDATE `creature` SET `position_x`=-653.607, `position_y`=-151.705, `position_z`=43.7285, `orientation`=4.01526 WHERE `guid`=15601; -- Elder Gray Bear
UPDATE `creature` SET `position_x`=-10018.3, `position_y`=-3701.83, `position_z`=17.8179, `orientation`=3.51147 WHERE `guid`=38800; -- Lost One Muckdweller
UPDATE `creature` SET `position_x`=-4214.85, `position_y`=351.653, `position_z`=55.708, `orientation`=1.68839 WHERE `guid`=50475; -- Woodpaw Mongrel
UPDATE `creature` SET `position_x`=-4148.77, `position_y`=449.588, `position_z`=67.4713, `orientation`=5.41753 WHERE `guid`=50445; -- Woodpaw Mongrel
UPDATE `creature` SET `position_x`=3837.7, `position_y`=-720.194, `position_z`=325.025, `orientation`=1.52798 WHERE `guid`=39586; -- Jadefire Satyr
UPDATE `creature` SET `position_x`=-8918.69, `position_y`=-2150.8, `position_z`=11.1794, `orientation`=4.93247 WHERE `guid`=23265; -- Gnarled Thistleshrub
UPDATE `creature` SET `position_x`=-6519.16, `position_y`=-3516.54, `position_z`=-58.9262, `orientation`=2.08938 WHERE `guid`=21315; -- Silithid Hive Drone
UPDATE `creature` SET `position_x`=-11514.8, `position_y`=16.3943, `position_z`=13.469, `orientation`=4.46928 WHERE `guid`=777; -- River Crocolisk
UPDATE `creature` SET `position_x`=-11517.5, `position_y`=-54.9028, `position_z`=12.4666, `orientation`=3.29738 WHERE `guid`=2505; -- River Crocolisk
UPDATE `creature` SET `position_x`=-416.53, `position_y`=-2852.81, `position_z`=78.3987, `orientation`=4.38347 WHERE `guid`=93342; -- Witherbark Broodguard
UPDATE `creature` SET `position_x`=-12765.8, `position_y`=312.211, `position_z`=6.62563, `orientation`=3.14752 WHERE `guid`=918; -- Cold Eye Basilisk
UPDATE `creature` SET `position_x`=-4897.85, `position_y`=-2076.61, `position_z`=83.8109, `orientation`=1.71027 WHERE `guid`=21107; -- Grimtotem Bandit
UPDATE `creature` SET `position_x`=-4217.6, `position_y`=-2342.07, `position_z`=91.8196, `orientation`=4.38521 WHERE `guid`=14138; -- Feegly the Exiled (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1916.15, `position_y`=-2681.63, `position_z`=68.9234, `orientation`=4.07475 WHERE `guid`=14672; -- Boulderfist Magus
UPDATE `creature` SET `position_x`=2205.51, `position_y`=-1745.43, `position_z`=63.0743, `orientation`=1.12031 WHERE `guid`=46767; -- Scarlet Mage
UPDATE `creature` SET `position_x`=-1947.66, `position_y`=-2650.76, `position_z`=80.3905, `orientation`=0.244308 WHERE `guid`=14673; -- Boulderfist Brute
UPDATE `creature` SET `position_x`=-12916.5, `position_y`=450.406, `position_z`=20.9349, `orientation`=0.853244 WHERE `guid`=951; -- Cold Eye Basilisk
UPDATE `creature` SET `position_x`=-12881.4, `position_y`=-651.527, `position_z`=54.5851, `orientation`=2.45129 WHERE `guid`=1848; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12940.3, `position_y`=-449.111, `position_z`=36.9902, `orientation`=0.840858 WHERE `guid`=2241; -- Venture Co. Foreman
UPDATE `creature` SET `position_x`=-3776.66, `position_y`=1742.8, `position_z`=149.09, `orientation`=0.480788 WHERE `guid`=51116; -- Ferocious Rage Scar
UPDATE `creature` SET `position_x`=2049.58, `position_y`=-4588.74, `position_z`=73.8077, `orientation`=5.31483 WHERE `guid`=92631; -- Gibbering Ghoul
UPDATE `creature` SET `id`=8531 WHERE `guid`=92631; -- Gibbering Ghoul
UPDATE `creature` SET `id2`=8543 WHERE `guid`=92631; -- Stitched Horror
UPDATE `creature` SET `position_x`=7484.45, `position_y`=-4817.13, `position_z`=685.406, `orientation`=1.24982 WHERE `guid`=41452; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=3621.15, `position_y`=-1211.16, `position_z`=216.305, `orientation`=3.86895 WHERE `guid`=40734; -- Deadwood Warrior
UPDATE `creature` SET `position_x`=3004.24, `position_y`=-2828.8, `position_z`=106.257, `orientation`=1.0821 WHERE `guid`=92216; -- Scourge Soldier
UPDATE `creature` SET `position_x`=2978.06, `position_y`=-2830.97, `position_z`=105.259, `orientation`=0.978448 WHERE `guid`=92212; -- Crypt Fiend
UPDATE `creature` SET `position_x`=1421.84, `position_y`=-1747.62, `position_z`=67.5798, `orientation`=2.58309 WHERE `guid`=46900; -- Skeletal Executioner
UPDATE `creature` SET `position_x`=5248.96, `position_y`=-569.58, `position_z`=326.526, `orientation`=1.1197 WHERE `guid`=40447; -- Tainted Ooze
UPDATE `creature` SET `position_x`=1836.02, `position_y`=-1656.4, `position_z`=61.7334, `orientation`=0.0893841 WHERE `guid`=46290; -- Blighted Zombie
UPDATE `creature` SET `position_x`=-578.744, `position_y`=-3803.8, `position_z`=235.04, `orientation`=5.50455 WHERE `guid`=93559; -- Vilebranch Aman'zasi Guard
UPDATE `creature` SET `position_x`=2015.83, `position_y`=-3479.59, `position_z`=110.625, `orientation`=5.29763 WHERE `guid`=92788; -- Plaguebat
UPDATE `creature` SET `position_x`=-7051.9, `position_y`=277.478, `position_z`=5.81898, `orientation`=4.18879 WHERE `guid`=43135; -- Tortured Druid
UPDATE `creature` SET `id`=12178 WHERE `guid`=43135; -- Tortured Druid
UPDATE `creature` SET `id2`=12179 WHERE `guid`=43135; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-7080.29, `position_y`=249.155, `position_z`=4.57355, `orientation`=3.43693 WHERE `guid`=43153; -- Tortured Sentinel
UPDATE `creature` SET `id`=12178 WHERE `guid`=43153; -- Tortured Druid
UPDATE `creature` SET `id2`=12179 WHERE `guid`=43153; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-7075.41, `position_y`=352.802, `position_z`=4.91356, `orientation`=1.81323 WHERE `guid`=43165; -- Tortured Sentinel
UPDATE `creature` SET `position_x`=-7176.54, `position_y`=441.411, `position_z`=64.1541, `orientation`=3.45575 WHERE `guid`=300178; -- Hive'Ashi Ambusher
UPDATE `creature` SET `position_x`=-7183.78, `position_y`=439.759, `position_z`=64.2477, `orientation`=6.14356 WHERE `guid`=300179; -- Hive'Ashi Ambusher
UPDATE `creature` SET `position_x`=-6849.77, `position_y`=1050.44, `position_z`=4.20399, `orientation`=5.12243 WHERE `guid`=43962; -- Stonelash Scorpid
UPDATE `creature` SET `id`=11735 WHERE `guid`=43962; -- Stonelash Scorpid
UPDATE `creature` SET `id2`=11740 WHERE `guid`=43962; -- Dredge Striker
UPDATE `creature` SET `position_x`=-9450.62, `position_y`=342.944, `position_z`=54.3123, `orientation`=4.77707 WHERE `guid`=80379; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-10367.9, `position_y`=-3251.56, `position_z`=19.25, `orientation`=2.79942 WHERE `guid`=31853; -- Stonard Grunt
UPDATE `creature` SET `position_x`=-5546.46, `position_y`=-1750.63, `position_z`=340.931, `orientation`=5.52558 WHERE `guid`=4841; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4841; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4841; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-9027.34, `position_y`=-84.0094, `position_z`=88.5697, `orientation`=3.94585 WHERE `guid`=80166; -- Rabbit
UPDATE `creature` SET `position_x`=-9284.25, `position_y`=-2990.19, `position_z`=119.789, `orientation`=5.25344 WHERE `guid`=10138; -- Blackrock Scout
UPDATE `creature` SET `position_x`=-3638.45, `position_y`=-2598.47, `position_z`=52.3428, `orientation`=3.15905 WHERE `guid`=9774; -- Dragonmaw Centurion
UPDATE `creature` SET `position_x`=-2965.52, `position_y`=-2967.15, `position_z`=33.5894, `orientation`=4.50992 WHERE `guid`=10638; -- Dark Iron Dwarf
UPDATE `creature` SET `id`=1051 WHERE `guid`=10638; -- Dark Iron Dwarf
UPDATE `creature` SET `id2`=1052 WHERE `guid`=10638; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-9400.14, `position_y`=-3010.42, `position_z`=136.87, `orientation`=5.61996 WHERE `guid`=18435; -- Blackrock Sentry
UPDATE `creature` SET `position_x`=-9404.86, `position_y`=-3009.31, `position_z`=136.87, `orientation`=5.91667 WHERE `guid`=18436; -- Blackrock Sentry
UPDATE `creature` SET `id`=436 WHERE `guid`=18436; -- Blackrock Shadowcaster
UPDATE `creature` SET `id2`=4065 WHERE `guid`=18436; -- Blackrock Sentry
UPDATE `creature` SET `position_x`=-6734.15, `position_y`=-717.8, `position_z`=232.968, `orientation`=4.71399 WHERE `guid`=5858; -- Muck Splash
UPDATE `creature` SET `position_x`=-2940.74, `position_y`=-2948.93, `position_z`=31.7639, `orientation`=5.77028 WHERE `guid`=10649; -- Dark Iron Dwarf
UPDATE `creature` SET `position_x`=-12433, `position_y`=202.399, `position_z`=25.9443, `orientation`=2.85846 WHERE `guid`=661; -- Steamwheedle Bruiser
UPDATE `creature` SET `position_x`=-6511.2, `position_y`=-849.843, `position_z`=323.699, `orientation`=1.42217 WHERE `guid`=6846; -- Twilight Geomancer
UPDATE `creature` SET `position_x`=-3147.73, `position_y`=-2050.5, `position_z`=9.46743, `orientation`=3.47151 WHERE `guid`=10646; -- Young Wetlands Crocolisk
UPDATE `creature` SET `position_x`=-6609.4, `position_y`=-3689.49, `position_z`=265.917, `orientation`=1.81514 WHERE `guid`=7162; -- Stonevault Seer
UPDATE `creature` SET `position_x`=-6634.27, `position_y`=-678.038, `position_z`=233.837, `orientation`=3.27421 WHERE `guid`=5803; -- Muck Splash
UPDATE `creature` SET `position_x`=-12186.6, `position_y`=656.223, `position_z`=-66.6704, `orientation`=3.77672 WHERE `guid`=437; -- Saltscale Oracle
UPDATE `creature` SET `position_x`=-12233, `position_y`=652.812, `position_z`=-69.2444, `orientation`=4.57478 WHERE `guid`=1319; -- Saltscale Oracle
UPDATE `creature` SET `position_x`=-9226.43, `position_y`=-3303.31, `position_z`=101.419, `orientation`=3.14159 WHERE `guid`=7540; -- Shadowhide Warrior
UPDATE `creature` SET `position_x`=-9229.09, `position_y`=-3300.47, `position_z`=101.477, `orientation`=4.67748 WHERE `guid`=7541; -- Shadowhide Darkweaver
UPDATE `creature` SET `position_x`=-11582.8, `position_y`=621.591, `position_z`=50.5346, `orientation`=0 WHERE `guid`=1140; -- Bloodscalp Scout
UPDATE `creature` SET `position_x`=-616.908, `position_y`=-4416.2, `position_z`=46.028, `orientation`=2.84489 WHERE `guid`=10372; -- Mottled Boar
UPDATE `creature` SET `position_x`=-647.761, `position_y`=-4352.94, `position_z`=44.4354, `orientation`=2.26893 WHERE `guid`=10374; -- Mottled Boar
UPDATE `creature` SET `position_x`=-5117.32, `position_y`=-2056.15, `position_z`=426.788, `orientation`=6.24032 WHERE `guid`=6374; -- Mangeclaw
UPDATE `creature` SET `position_x`=1190.72, `position_y`=-3048.41, `position_z`=94.865, `orientation`=4.10759 WHERE `guid`=19457; -- Ornery Plainstrider
UPDATE `creature` SET `position_x`=-713.925, `position_y`=-4318.18, `position_z`=43.0204, `orientation`=0.331613 WHERE `guid`=10376; -- Mottled Boar
UPDATE `creature` SET `position_x`=-712.067, `position_y`=-4347.83, `position_z`=47.4242, `orientation`=3.36849 WHERE `guid`=8660; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-715.933, `position_y`=-4283.75, `position_z`=43.0123, `orientation`=5.67232 WHERE `guid`=8547; -- Mottled Boar
UPDATE `creature` SET `position_x`=-748.935, `position_y`=-4283.05, `position_z`=43.3027, `orientation`=1.23918 WHERE `guid`=10377; -- Mottled Boar
UPDATE `creature` SET `position_x`=-748.498, `position_y`=-4250.59, `position_z`=42.934, `orientation`=1.3439 WHERE `guid`=7488; -- Mottled Boar
UPDATE `creature` SET `position_x`=-749.003, `position_y`=-4217.49, `position_z`=41.7093, `orientation`=5.11381 WHERE `guid`=7980; -- Mottled Boar
UPDATE `creature` SET `position_x`=-749.294, `position_y`=-4182.3, `position_z`=30.1681, `orientation`=3.7001 WHERE `guid`=6632; -- Mottled Boar
UPDATE `creature` SET `position_x`=-721.284, `position_y`=-4183.73, `position_z`=30.2144, `orientation`=3.89208 WHERE `guid`=8546; -- Mottled Boar
UPDATE `creature` SET `position_x`=-550.229, `position_y`=-4117.02, `position_z`=67.1178, `orientation`=2.80998 WHERE `guid`=7982; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-579.618, `position_y`=-4118.12, `position_z`=74.3351, `orientation`=2.21657 WHERE `guid`=8658; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-550.717, `position_y`=-4083.33, `position_z`=70.1871, `orientation`=2.46091 WHERE `guid`=10382; -- Scorpid Worker
UPDATE `creature` SET `position_x`=-215.562, `position_y`=-3851.12, `position_z`=20.145, `orientation`=5.30526 WHERE `guid`=13572; -- Dreadmaw Crocolisk
UPDATE `creature` SET `position_x`=846.699, `position_y`=-4819.48, `position_z`=11.3984, `orientation`=5.05942 WHERE `guid`=12261; -- Dustwind Savage
UPDATE `creature` SET `position_x`=-2843.77, `position_y`=2681.12, `position_z`=69.6052, `orientation`=3.78712 WHERE `guid`=51754; -- Northspring Harpy
UPDATE `creature` SET `position_x`=10333.5, `position_y`=666.815, `position_z`=1331.73, `orientation`=6.03884 WHERE `guid`=49621; -- Young Nightsaber
UPDATE `creature` SET `position_x`=3180.06, `position_y`=-4250.33, `position_z`=97.6024, `orientation`=5.44543 WHERE `guid`=36387; -- Haldarr Satyr
UPDATE `creature` SET `position_x`=2916.4, `position_y`=-2847.99, `position_z`=211.303, `orientation`=3.1967 WHERE `guid`=33113; -- Xavian Betrayer
UPDATE `creature` SET `id`=3752 WHERE `guid`=33113; -- Xavian Rogue
UPDATE `creature` SET `id2`=3754 WHERE `guid`=33113; -- Xavian Betrayer
UPDATE `creature` SET `id3`=3755 WHERE `guid`=33113; -- Xavian Felsworn
UPDATE `creature` SET `position_x`=2951.69, `position_y`=-2810.01, `position_z`=212.653, `orientation`=4.86947 WHERE `guid`=33120; -- Xavian Rogue
UPDATE `creature` SET `position_x`=2930.52, `position_y`=-2803.84, `position_z`=212.895, `orientation`=4.24119 WHERE `guid`=33098; -- Xavian Rogue
UPDATE `creature` SET `position_x`=2964.98, `position_y`=-2789.48, `position_z`=214.389, `orientation`=0.860026 WHERE `guid`=33117; -- Xavian Rogue
UPDATE `creature` SET `position_x`=3039.18, `position_y`=-2787.62, `position_z`=195.343, `orientation`=3.95373 WHERE `guid`=33114; -- Xavian Rogue
UPDATE `creature` SET `position_x`=-2732.6, `position_y`=-446.49, `position_z`=-4.30547, `orientation`=6.12611 WHERE `guid`=24830; -- Palemane Skinner
UPDATE `creature` SET `position_x`=-2715.23, `position_y`=-481.503, `position_z`=-0.523942, `orientation`=5.49779 WHERE `guid`=24822; -- Palemane Tanner
UPDATE `creature` SET `position_x`=-2751.59, `position_y`=-435.655, `position_z`=-2.59467, `orientation`=2.77507 WHERE `guid`=24802; -- Palemane Tanner
UPDATE `creature` SET `position_x`=-2729.87, `position_y`=-435.071, `position_z`=-5.83465, `orientation`=4.86947 WHERE `guid`=24801; -- Palemane Tanner
UPDATE `creature` SET `position_x`=-1113.75, `position_y`=-4847.8, `position_z`=-4.77317, `orientation`=1.02017 WHERE `guid`=7937; -- Pygmy Surf Crawler
UPDATE `creature` SET `position_x`=-1084.82, `position_y`=-4850.36, `position_z`=2.5318, `orientation`=3.2216 WHERE `guid`=13011; -- Pygmy Surf Crawler
UPDATE `creature` SET `position_x`=-2381.6, `position_y`=-1185.47, `position_z`=-6.93497, `orientation`=5.42035 WHERE `guid`=25706; -- Prairie Wolf Alpha
UPDATE `creature` SET `position_x`=-2984.43, `position_y`=-1150.18, `position_z`=58.3768, `orientation`=2.92519 WHERE `guid`=24940; -- Bristleback Battleboar
UPDATE `creature` SET `position_x`=-2933.17, `position_y`=-1234.43, `position_z`=67.6243, `orientation`=5.65034 WHERE `guid`=24945; -- Bristleback Battleboar
UPDATE `creature` SET `position_x`=-2919.39, `position_y`=-1246.2, `position_z`=71.8768, `orientation`=3.42278 WHERE `guid`=24895; -- Bristleback Quilboar
UPDATE `creature` SET `position_x`=-2939.57, `position_y`=-1277.17, `position_z`=72.2877, `orientation`=5.25528 WHERE `guid`=24931; -- Bristleback Shaman
UPDATE `creature` SET `position_x`=-7276.64, `position_y`=-1219.87, `position_z`=-240.255, `orientation`=2.76314 WHERE `guid`=24141; -- Scorching Elemental
UPDATE `creature` SET `position_x`=-7321.19, `position_y`=-1460.84, `position_z`=-241.072, `orientation`=4.77276 WHERE `guid`=24139; -- Scorching Elemental
UPDATE `creature` SET `position_x`=-3012.17, `position_y`=-1034.03, `position_z`=53.1447, `orientation`=0.250407 WHERE `guid`=24910; -- Bristleback Quilboar
UPDATE `creature` SET `position_x`=-2982.22, `position_y`=-1017.43, `position_z`=55.2015, `orientation`=0.540022 WHERE `guid`=24914; -- Bristleback Quilboar
UPDATE `creature` SET `position_x`=-2959.41, `position_y`=-998.56, `position_z`=54.7631, `orientation`=1.20863 WHERE `guid`=24884; -- Bristleback Quilboar (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1717.65, `position_y`=414.889, `position_z`=92.2719, `orientation`=0.785398 WHERE `guid`=25811; -- Windfury Harpy
UPDATE `creature` SET `position_x`=-1686.18, `position_y`=413.64, `position_z`=93.9671, `orientation`=4.13643 WHERE `guid`=25841; -- Windfury Wind Witch
UPDATE `creature` SET `position_x`=-1653.26, `position_y`=314.096, `position_z`=58.1451, `orientation`=1.73484 WHERE `guid`=25846; -- Windfury Wind Witch
UPDATE `creature` SET `position_x`=-1717.23, `position_y`=317.477, `position_z`=67.2104, `orientation`=0.352482 WHERE `guid`=25840; -- Windfury Wind Witch
UPDATE `creature` SET `position_x`=-1718.72, `position_y`=350.069, `position_z`=74.6314, `orientation`=4.48446 WHERE `guid`=25843; -- Windfury Wind Witch
UPDATE `creature` SET `position_x`=-1752.41, `position_y`=315.176, `position_z`=79.0599, `orientation`=5.56105 WHERE `guid`=25799; -- Windfury Harpy
UPDATE `creature` SET `position_x`=-1717.27, `position_y`=384.774, `position_z`=81.9523, `orientation`=6.12408 WHERE `guid`=25807; -- Windfury Harpy
UPDATE `creature` SET `position_x`=-1683.48, `position_y`=285.166, `position_z`=47.6708, `orientation`=5.16525 WHERE `guid`=25832; -- Windfury Wind Witch
UPDATE `creature` SET `position_x`=-1927.91, `position_y`=365.016, `position_z`=118.54, `orientation`=2.53073 WHERE `guid`=26606; -- Bael'dun Appraiser
UPDATE `creature` SET `position_x`=-3017.69, `position_y`=-751.159, `position_z`=47.0018, `orientation`=0.742953 WHERE `guid`=25992; -- Battleboar
UPDATE `creature` SET `position_x`=-1933.17, `position_y`=431.273, `position_z`=133.673, `orientation`=1.94979 WHERE `guid`=26602; -- Bael'dun Appraiser
UPDATE `creature` SET `position_x`=-3084.28, `position_y`=-682.765, `position_z`=31.9099, `orientation`=0.802851 WHERE `guid`=24966; -- Plainstrider
UPDATE `creature` SET `position_x`=-9549.12, `position_y`=-449.401, `position_z`=60.6209, `orientation`=5.86328 WHERE `guid`=79625; -- Murloc Streamrunner
UPDATE `creature` SET `position_x`=-2115.57, `position_y`=-916.761, `position_z`=8.0194, `orientation`=2.64101 WHERE `guid`=25308; -- Elder Plainstrider
UPDATE `creature` SET `position_x`=-1942.13, `position_y`=-1020.7, `position_z`=38.5828, `orientation`=2.44118 WHERE `guid`=26435; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1918.44, `position_y`=-1029.4, `position_z`=44.0922, `orientation`=3.8895 WHERE `guid`=26433; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1929.87, `position_y`=-1019.03, `position_z`=43.4163, `orientation`=1.01169 WHERE `guid`=26436; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1908.86, `position_y`=-1033.59, `position_z`=48.8025, `orientation`=5.40482 WHERE `guid`=26434; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1916.37, `position_y`=-1015.22, `position_z`=44.7523, `orientation`=0.616611 WHERE `guid`=26432; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1954.67, `position_y`=-1056.72, `position_z`=45.5932, `orientation`=2.97469 WHERE `guid`=26441; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1951.9, `position_y`=-1037.09, `position_z`=38.3403, `orientation`=4.02853 WHERE `guid`=26439; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-1902.86, `position_y`=-1093.42, `position_z`=84.8393, `orientation`=2.21894 WHERE `guid`=26448; -- Venture Co. Worker
UPDATE `creature` SET `position_x`=-117.397, `position_y`=-2817.11, `position_z`=91.75, `orientation`=4.9691 WHERE `guid`=20392; -- Razormane Water Seeker
UPDATE `creature` SET `position_x`=-2248.12, `position_y`=-1116.24, `position_z`=-3.36696, `orientation`=3.5667 WHERE `guid`=25681; -- Prairie Wolf Alpha
UPDATE `creature` SET `position_x`=-2283.09, `position_y`=-1150.76, `position_z`=-4.88657, `orientation`=3.90058 WHERE `guid`=25660; -- Prairie Wolf Alpha
UPDATE `creature` SET `position_x`=-2317.91, `position_y`=-1249.56, `position_z`=2.69754, `orientation`=5.52021 WHERE `guid`=25678; -- Prairie Wolf Alpha
UPDATE `creature` SET `position_x`=-246.941, `position_y`=-4018.3, `position_z`=187.387, `orientation`=0.942478 WHERE `guid`=301310; -- Minor Manifestation of Fire
UPDATE `creature` SET `position_x`=5685.9, `position_y`=-730.695, `position_z`=376.757, `orientation`=5.21916 WHERE `guid`=40689; -- Entropic Beast
UPDATE `creature` SET `position_x`=-1586.65, `position_y`=1917.12, `position_z`=61.4458, `orientation`=6.14594 WHERE `guid`=27895; -- Mana Eater
UPDATE `creature` SET `position_x`=-6263.93, `position_y`=389.987, `position_z`=382.754, `orientation`=0 WHERE `guid`=1014; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-5492.7, `position_y`=-286.367, `position_z`=353.369, `orientation`=4.79966 WHERE `guid`=3232; -- Wendigo
UPDATE `creature` SET `position_x`=-5494.42, `position_y`=-297.496, `position_z`=353.367, `orientation`=0.296706 WHERE `guid`=3233; -- Wendigo
UPDATE `creature` SET `position_x`=-6181.75, `position_y`=249.506, `position_z`=386.376, `orientation`=6.12611 WHERE `guid`=337; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-5407.18, `position_y`=-191.465, `position_z`=349.985, `orientation`=4.451 WHERE `guid`=3136; -- Wendigo
UPDATE `creature` SET `position_x`=-6278.25, `position_y`=276.598, `position_z`=382.855, `orientation`=1.90241 WHERE `guid`=346; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6352.9, `position_y`=418.264, `position_z`=376.198, `orientation`=4.86947 WHERE `guid`=1002; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6367.86, `position_y`=366.376, `position_z`=380.108, `orientation`=1.11701 WHERE `guid`=1033; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6303.4, `position_y`=262.023, `position_z`=381.832, `orientation`=0 WHERE `guid`=338; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6329.78, `position_y`=288.459, `position_z`=380.1, `orientation`=5.35816 WHERE `guid`=347; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6342.8, `position_y`=287.864, `position_z`=380.875, `orientation`=0.401426 WHERE `guid`=1523; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5495.45, `position_y`=-225.17, `position_z`=354.421, `orientation`=5.24604 WHERE `guid`=3568; -- Wendigo
UPDATE `creature` SET `position_x`=-6374.78, `position_y`=337.339, `position_z`=386.343, `orientation`=3.12932 WHERE `guid`=1053; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6380.73, `position_y`=301.698, `position_z`=385.763, `orientation`=1.65806 WHERE `guid`=1514; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6390.25, `position_y`=435.528, `position_z`=379.383, `orientation`=6.0912 WHERE `guid`=1003; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5419.92, `position_y`=-146.375, `position_z`=399.77, `orientation`=0 WHERE `guid`=3124; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-6382.15, `position_y`=342.212, `position_z`=386.246, `orientation`=0.296706 WHERE `guid`=1057; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6411.43, `position_y`=375.887, `position_z`=385.226, `orientation`=1.65806 WHERE `guid`=1046; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6384.09, `position_y`=384.03, `position_z`=380.508, `orientation`=4.7822 WHERE `guid`=1038; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6364.2, `position_y`=292.224, `position_z`=382.46, `orientation`=5.32325 WHERE `guid`=1524; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6314.32, `position_y`=445.369, `position_z`=383.374, `orientation`=1.58825 WHERE `guid`=998; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6281.46, `position_y`=431.899, `position_z`=384.433, `orientation`=0 WHERE `guid`=1016; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6270.13, `position_y`=455.999, `position_z`=386.458, `orientation`=2.74017 WHERE `guid`=422; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6276, `position_y`=504.324, `position_z`=386.493, `orientation`=5.09636 WHERE `guid`=426; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6286.26, `position_y`=458.627, `position_z`=386.317, `orientation`=0.663225 WHERE `guid`=424; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6238.44, `position_y`=489.737, `position_z`=386.423, `orientation`=2.28638 WHERE `guid`=454; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6244.83, `position_y`=446.061, `position_z`=385.486, `orientation`=0 WHERE `guid`=418; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6295.12, `position_y`=490.391, `position_z`=386.155, `orientation`=5.28835 WHERE `guid`=960; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6279.66, `position_y`=416.813, `position_z`=384.893, `orientation`=0 WHERE `guid`=413; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-5464.55, `position_y`=-111.308, `position_z`=346.91, `orientation`=5.23599 WHERE `guid`=3129; -- Wendigo
UPDATE `creature` SET `position_x`=-6216.64, `position_y`=449.36, `position_z`=387.745, `orientation`=0 WHERE `guid`=419; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6271.51, `position_y`=475.346, `position_z`=386.428, `orientation`=6.18368 WHERE `guid`=427; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6262.64, `position_y`=472.03, `position_z`=386.307, `orientation`=4.7563 WHERE `guid`=455; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6364.18, `position_y`=320.127, `position_z`=382.019, `orientation`=4.43314 WHERE `guid`=1058; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6353.87, `position_y`=263.348, `position_z`=384.699, `orientation`=0.733038 WHERE `guid`=1537; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6416.82, `position_y`=323.042, `position_z`=393.379, `orientation`=5.32325 WHERE `guid`=1512; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6369.31, `position_y`=263.509, `position_z`=386.669, `orientation`=0 WHERE `guid`=1535; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6396.32, `position_y`=324.476, `position_z`=388.978, `orientation`=5.14872 WHERE `guid`=1513; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6378.63, `position_y`=280.969, `position_z`=388.59, `orientation`=1.88496 WHERE `guid`=1538; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6334.91, `position_y`=270.367, `position_z`=381.459, `orientation`=5.61996 WHERE `guid`=1540; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6380.43, `position_y`=249.48, `position_z`=389.914, `orientation`=0.610865 WHERE `guid`=1532; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6402.39, `position_y`=290.512, `position_z`=394.987, `orientation`=1.48353 WHERE `guid`=1511; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6298.93, `position_y`=243.345, `position_z`=390.887, `orientation`=1.76278 WHERE `guid`=336; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6381.92, `position_y`=226.965, `position_z`=404.776, `orientation`=1.5708 WHERE `guid`=1543; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6340.95, `position_y`=301.687, `position_z`=380.203, `orientation`=3.61283 WHERE `guid`=1521; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6246.53, `position_y`=463.627, `position_z`=385.888, `orientation`=5.28835 WHERE `guid`=417; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6204.47, `position_y`=215.335, `position_z`=397.765, `orientation`=4.04916 WHERE `guid`=332; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6328.13, `position_y`=233.839, `position_z`=385.598, `orientation`=1.50098 WHERE `guid`=1533; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6322.07, `position_y`=214.021, `position_z`=392.046, `orientation`=1.69297 WHERE `guid`=335; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6345.76, `position_y`=215.336, `position_z`=391.347, `orientation`=1.79769 WHERE `guid`=1534; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6349.35, `position_y`=186.729, `position_z`=397.454, `orientation`=1.09956 WHERE `guid`=1546; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5316.44, `position_y`=-247.917, `position_z`=440.807, `orientation`=3.18414 WHERE `guid`=3182; -- Frostmane Seer
UPDATE `creature` SET `position_x`=-6229.91, `position_y`=217.81, `position_z`=395.954, `orientation`=0 WHERE `guid`=333; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6157.19, `position_y`=83.367, `position_z`=415.332, `orientation`=0 WHERE `guid`=322; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6137.65, `position_y`=122.852, `position_z`=420.929, `orientation`=0 WHERE `guid`=321; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6032.76, `position_y`=47.0596, `position_z`=406.193, `orientation`=0 WHERE `guid`=1558; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-5083.78, `position_y`=-49.8835, `position_z`=397.605, `orientation`=0.837758 WHERE `guid`=3167; -- Snow Leopard
UPDATE `creature` SET `position_x`=-6071.44, `position_y`=41.8642, `position_z`=409.238, `orientation`=0 WHERE `guid`=1562; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6106.69, `position_y`=48.5685, `position_z`=412.312, `orientation`=0 WHERE `guid`=1556; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6168.8, `position_y`=134.652, `position_z`=423.068, `orientation`=0 WHERE `guid`=323; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6124.1, `position_y`=77.877, `position_z`=417.287, `orientation`=0 WHERE `guid`=319; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-5002.08, `position_y`=206.653, `position_z`=388.975, `orientation`=0 WHERE `guid`=2311; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-5073.84, `position_y`=459.422, `position_z`=410.409, `orientation`=3.69563 WHERE `guid`=2414; -- Leper Gnome
UPDATE `creature` SET `position_x`=-6152.73, `position_y`=255.049, `position_z`=391.358, `orientation`=2.19911 WHERE `guid`=339; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6221.98, `position_y`=359.024, `position_z`=385.111, `orientation`=1.21093 WHERE `guid`=357; -- Rabbit
UPDATE `creature` SET `position_x`=-6149.36, `position_y`=519.902, `position_z`=388.17, `orientation`=4.27606 WHERE `guid`=434; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6177.6, `position_y`=484.319, `position_z`=386.871, `orientation`=0 WHERE `guid`=416; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6265.68, `position_y`=493.035, `position_z`=386.294, `orientation`=5.044 WHERE `guid`=448; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6235.21, `position_y`=512.585, `position_z`=386.194, `orientation`=3.4383 WHERE `guid`=450; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6209.19, `position_y`=515.44, `position_z`=387.797, `orientation`=0 WHERE `guid`=430; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6256.28, `position_y`=537.581, `position_z`=386.194, `orientation`=4.72984 WHERE `guid`=459; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6181.64, `position_y`=547.78, `position_z`=384.83, `orientation`=0 WHERE `guid`=458; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6148.41, `position_y`=585.333, `position_z`=386.597, `orientation`=0.837758 WHERE `guid`=463; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6283.26, `position_y`=549.741, `position_z`=387.36, `orientation`=0.506145 WHERE `guid`=460; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=460; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=460; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6248.49, `position_y`=517.418, `position_z`=387.199, `orientation`=3.9619 WHERE `guid`=433; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=433; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=433; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6263.71, `position_y`=515.525, `position_z`=386.197, `orientation`=2.82743 WHERE `guid`=453; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6292.07, `position_y`=660.779, `position_z`=386.191, `orientation`=1.78024 WHERE `guid`=957; -- Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=957; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=957; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6244.11, `position_y`=580.615, `position_z`=387.811, `orientation`=3.49066 WHERE `guid`=464; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=464; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=464; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6316.37, `position_y`=610.772, `position_z`=386.926, `orientation`=5.48033 WHERE `guid`=939; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6326.85, `position_y`=675.702, `position_z`=386.058, `orientation`=1.95477 WHERE `guid`=958; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=958; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=958; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6348.27, `position_y`=679.903, `position_z`=385.76, `orientation`=3.4383 WHERE `guid`=937; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6250.06, `position_y`=613.585, `position_z`=388.171, `orientation`=0.139626 WHERE `guid`=469; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6282.39, `position_y`=681.819, `position_z`=385.913, `orientation`=3.45575 WHERE `guid`=479; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6149.55, `position_y`=650.618, `position_z`=388.03, `orientation`=3.92699 WHERE `guid`=468; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6316.04, `position_y`=781.287, `position_z`=389.641, `orientation`=1.20428 WHERE `guid`=487; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=487; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=487; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6367.24, `position_y`=750.249, `position_z`=388.14, `orientation`=2.14675 WHERE `guid`=866; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6366.63, `position_y`=783.724, `position_z`=388.288, `orientation`=5.46288 WHERE `guid`=865; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6416.04, `position_y`=680.391, `position_z`=387.717, `orientation`=0.610865 WHERE `guid`=883; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=883; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=883; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6353.23, `position_y`=749.79, `position_z`=388.927, `orientation`=5.06145 WHERE `guid`=864; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6433.76, `position_y`=656.566, `position_z`=386.756, `orientation`=5.8294 WHERE `guid`=890; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6350.07, `position_y`=766.781, `position_z`=386.491, `orientation`=4.4855 WHERE `guid`=867; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6382.88, `position_y`=616.303, `position_z`=387.872, `orientation`=3.75246 WHERE `guid`=930; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6416.53, `position_y`=748.938, `position_z`=388.82, `orientation`=5.75959 WHERE `guid`=876; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=876; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=876; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6437.37, `position_y`=629.101, `position_z`=387.272, `orientation`=5.89921 WHERE `guid`=892; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6383.11, `position_y`=719.772, `position_z`=388.596, `orientation`=1.0821 WHERE `guid`=877; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6381.84, `position_y`=685.567, `position_z`=386.286, `orientation`=2.84489 WHERE `guid`=878; -- Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=878; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=878; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6444.82, `position_y`=692.448, `position_z`=387.516, `orientation`=2.47837 WHERE `guid`=884; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6435.06, `position_y`=549.299, `position_z`=385.715, `orientation`=4.13643 WHERE `guid`=972; -- Ragged Young Wolf
UPDATE `creature` SET `position_x`=-6443.85, `position_y`=585.467, `position_z`=386.119, `orientation`=5.63741 WHERE `guid`=968; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6354.4, `position_y`=518.834, `position_z`=386.124, `orientation`=5.48033 WHERE `guid`=979; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6344.62, `position_y`=483.785, `position_z`=381.965, `orientation`=4.97419 WHERE `guid`=1005; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6416.33, `position_y`=614.247, `position_z`=388.033, `orientation`=4.86947 WHERE `guid`=898; -- Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=898; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=898; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6301.97, `position_y`=562.545, `position_z`=387.16, `orientation`=3.72586 WHERE `guid`=961; -- Rabbit
UPDATE `creature` SET `position_x`=-5593.04, `position_y`=619.926, `position_z`=395.231, `orientation`=4.16198 WHERE `guid`=2933; -- Frostmane Hideskinner
UPDATE `creature` SET `position_x`=-6383.2, `position_y`=483.622, `position_z`=380.244, `orientation`=4.39823 WHERE `guid`=980; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6466.63, `position_y`=435.494, `position_z`=415.629, `orientation`=0.0698132 WHERE `guid`=1061; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-10450.4, `position_y`=1250.7, `position_z`=50.8891, `orientation`=3.19722 WHERE `guid`=90410; -- Coyote
UPDATE `creature` SET `position_x`=-6437.07, `position_y`=396.101, `position_z`=390.579, `orientation`=1.16937 WHERE `guid`=1048; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5523.86, `position_y`=714.454, `position_z`=392.486, `orientation`=4.17416 WHERE `guid`=2940; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-6351.57, `position_y`=450.693, `position_z`=376.921, `orientation`=3.03687 WHERE `guid`=1004; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6319.25, `position_y`=518.993, `position_z`=386.866, `orientation`=0.401426 WHERE `guid`=959; -- Burly Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=959; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=959; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6380.93, `position_y`=567.37, `position_z`=386.113, `orientation`=0.909996 WHERE `guid`=966; -- Rabbit
UPDATE `creature` SET `position_x`=-5284.4, `position_y`=-73.1375, `position_z`=401.845, `orientation`=1.31471 WHERE `guid`=3170; -- Ice Claw Bear
UPDATE `creature` SET `position_x`=-5584.91, `position_y`=661.223, `position_z`=395.026, `orientation`=5.32325 WHERE `guid`=2934; -- Frostmane Snowstrider
UPDATE `creature` SET `position_x`=-5566.3, `position_y`=651.942, `position_z`=397.961, `orientation`=5.18363 WHERE `guid`=2921; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-5595.31, `position_y`=713.894, `position_z`=382.406, `orientation`=0 WHERE `guid`=2946; -- Frostmane Shadowcaster
UPDATE `creature` SET `position_x`=-6452.37, `position_y`=656.319, `position_z`=387.287, `orientation`=1.55334 WHERE `guid`=897; -- Rockjaw Trogg
UPDATE `creature` SET `id`=707 WHERE `guid`=897; -- Rockjaw Trogg
UPDATE `creature` SET `id2`=724 WHERE `guid`=897; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5572.94, `position_y`=761.704, `position_z`=383.459, `orientation`=5.89873 WHERE `guid`=2950; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-5586.95, `position_y`=737.133, `position_z`=392.238, `orientation`=4.43017 WHERE `guid`=2943; -- Frostmane Shadowcaster
UPDATE `creature` SET `position_x`=-5547.2, `position_y`=604.804, `position_z`=396.107, `orientation`=0 WHERE `guid`=2925; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-6445.79, `position_y`=711.919, `position_z`=393.731, `orientation`=0.907571 WHERE `guid`=882; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6446.04, `position_y`=701.131, `position_z`=390.413, `orientation`=5.5676 WHERE `guid`=885; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-5556.33, `position_y`=551.894, `position_z`=392.609, `orientation`=0.0293268 WHERE `guid`=2919; -- Frostmane Troll
UPDATE `creature` SET `position_x`=-6349.65, `position_y`=782.986, `position_z`=387.458, `orientation`=4.66003 WHERE `guid`=870; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6179.75, `position_y`=685.259, `position_z`=386.441, `orientation`=1.41372 WHERE `guid`=473; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-5682.05, `position_y`=721.297, `position_z`=386.993, `orientation`=5.60251 WHERE `guid`=2955; -- Frostmane Hideskinner
UPDATE `creature` SET `position_x`=-5637.96, `position_y`=759.85, `position_z`=387.873, `orientation`=0 WHERE `guid`=2951; -- Frostmane Shadowcaster
UPDATE `creature` SET `position_x`=-5618.21, `position_y`=749.743, `position_z`=385.692, `orientation`=0 WHERE `guid`=2948; -- Frostmane Hideskinner
UPDATE `creature` SET `position_x`=-6249.9, `position_y`=695.166, `position_z`=386.194, `orientation`=0.161945 WHERE `guid`=713; -- Rabbit
UPDATE `creature` SET `position_x`=-6150.12, `position_y`=717.846, `position_z`=392.438, `orientation`=3.01942 WHERE `guid`=714; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6125.81, `position_y`=644.408, `position_z`=393.976, `orientation`=4.15388 WHERE `guid`=471; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6122.48, `position_y`=549.817, `position_z`=405.118, `orientation`=2.42601 WHERE `guid`=465; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6151.12, `position_y`=691.147, `position_z`=392.26, `orientation`=2.33874 WHERE `guid`=860; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6216.87, `position_y`=514.978, `position_z`=387.545, `orientation`=0 WHERE `guid`=435; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-5583.03, `position_y`=550.927, `position_z`=387.7, `orientation`=0.0823599 WHERE `guid`=2918; -- Frostmane Snowstrider
UPDATE `creature` SET `position_x`=-6358.04, `position_y`=360.158, `position_z`=378.413, `orientation`=4.10152 WHERE `guid`=1037; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-10979.1, `position_y`=1367.36, `position_z`=45.9979, `orientation`=0 WHERE `guid`=48883; -- Harvest Golem
UPDATE `creature` SET `position_x`=-6428.55, `position_y`=383.797, `position_z`=389.119, `orientation`=1.37881 WHERE `guid`=1047; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6447.77, `position_y`=416.751, `position_z`=395.21, `orientation`=5.65487 WHERE `guid`=995; -- Ragged Timber Wolf
UPDATE `creature` SET `position_x`=-6484.1, `position_y`=615.751, `position_z`=387.403, `orientation`=1.67552 WHERE `guid`=896; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-11019.8, `position_y`=1538.9, `position_z`=49.1045, `orientation`=4.60767 WHERE `guid`=54439; -- Defias Pillager
UPDATE `creature` SET `position_x`=-6317.9, `position_y`=813.725, `position_z`=398.027, `orientation`=2.30383 WHERE `guid`=500; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-5548.39, `position_y`=641.298, `position_z`=399.196, `orientation`=6.2018 WHERE `guid`=2924; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-6366.51, `position_y`=811.533, `position_z`=393.851, `orientation`=5.55015 WHERE `guid`=871; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6282.52, `position_y`=810.484, `position_z`=396.147, `orientation`=2.18166 WHERE `guid`=492; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6351.97, `position_y`=817.335, `position_z`=396.946, `orientation`=5.16617 WHERE `guid`=498; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-10692, `position_y`=1743.84, `position_z`=41.409, `orientation`=0.488692 WHERE `guid`=89672; -- Defias Pillager
UPDATE `creature` SET `position_x`=-5603.89, `position_y`=657.689, `position_z`=384.094, `orientation`=1.2201 WHERE `guid`=2932; -- Frostmane Shadowcaster
UPDATE `creature` SET `position_x`=-10648.8, `position_y`=1768.95, `position_z`=37.285, `orientation`=0 WHERE `guid`=89676; -- Defias Pillager
UPDATE `creature` SET `position_x`=-10650.3, `position_y`=1618.45, `position_z`=43.287, `orientation`=0 WHERE `guid`=90168; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-5534.59, `position_y`=690.913, `position_z`=396.69, `orientation`=5.89921 WHERE `guid`=2937; -- Frostmane Snowstrider
UPDATE `creature` SET `position_x`=-5548.7, `position_y`=662.273, `position_z`=395.648, `orientation`=1.02974 WHERE `guid`=2923; -- Frostmane Headhunter
UPDATE `creature` SET `position_x`=-6467.31, `position_y`=683.513, `position_z`=387.477, `orientation`=5.63741 WHERE `guid`=887; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-5565.35, `position_y`=637.721, `position_z`=399.024, `orientation`=2.85951 WHERE `guid`=2920; -- Frostmane Snowstrider
UPDATE `creature` SET `position_x`=-5556.3, `position_y`=521.664, `position_z`=382.518, `orientation`=4.04916 WHERE `guid`=2916; -- Frostmane Shadowcaster
UPDATE `creature` SET `position_x`=-5380.8, `position_y`=449.051, `position_z`=385.418, `orientation`=5.54081 WHERE `guid`=2905; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-5091.43, `position_y`=463.147, `position_z`=404.948, `orientation`=4.72557 WHERE `guid`=2413; -- Leper Gnome (WAYPOINTS)
UPDATE `creature` SET `position_x`=-5073.6, `position_y`=441.779, `position_z`=411.05, `orientation`=5.7629 WHERE `guid`=2415; -- Leper Gnome
UPDATE `creature` SET `position_x`=-5054.46, `position_y`=453.724, `position_z`=411.887, `orientation`=5.58781 WHERE `guid`=2420; -- Leper Gnome
UPDATE `creature` SET `position_x`=-5233.64, `position_y`=100.088, `position_z`=392.402, `orientation`=3.1515 WHERE `guid`=3161; -- Winter Wolf
UPDATE `creature` SET `position_x`=-6247.94, `position_y`=284.583, `position_z`=384.368, `orientation`=1.03551 WHERE `guid`=1030; -- Rabbit
UPDATE `creature` SET `position_x`=-10616.9, `position_y`=1717.2, `position_z`=41.3093, `orientation`=4.93928 WHERE `guid`=90171; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-10729.5, `position_y`=1831.79, `position_z`=38.4058, `orientation`=4.88288 WHERE `guid`=89615; -- Defias Pillager
UPDATE `creature` SET `position_x`=-10723.3, `position_y`=1667.3, `position_z`=43.9882, `orientation`=5.79757 WHERE `guid`=90070; -- Chicken
UPDATE `creature` SET `position_x`=-10752.1, `position_y`=1712.03, `position_z`=43.62, `orientation`=3.92902 WHERE `guid`=89668; -- Defias Pillager
UPDATE `creature` SET `position_x`=-6267.56, `position_y`=422.717, `position_z`=385.867, `orientation`=1.70034 WHERE `guid`=429; -- Rabbit
UPDATE `creature` SET `position_x`=-6480.62, `position_y`=585.221, `position_z`=391.792, `orientation`=5.27089 WHERE `guid`=970; -- Small Crag Boar
UPDATE `creature` SET `position_x`=-6469.02, `position_y`=360.22, `position_z`=378.318, `orientation`=2.49582 WHERE `guid`=1492; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6421.61, `position_y`=358.664, `position_z`=390.002, `orientation`=5.06145 WHERE `guid`=1045; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6494.67, `position_y`=334.347, `position_z`=368.596, `orientation`=3.76991 WHERE `guid`=1494; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6475.05, `position_y`=388.488, `position_z`=382.743, `orientation`=1.15192 WHERE `guid`=1080; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6477.45, `position_y`=346.925, `position_z`=377.529, `orientation`=0 WHERE `guid`=1493; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6420.49, `position_y`=337.378, `position_z`=391.563, `orientation`=5.67232 WHERE `guid`=1510; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6496.66, `position_y`=317.836, `position_z`=368.926, `orientation`=1.48353 WHERE `guid`=1505; -- Frostmane Troll Whelp
UPDATE `creature` SET `position_x`=-6491.28, `position_y`=298.387, `position_z`=371.519, `orientation`=2.42601 WHERE `guid`=1507; -- Frostmane Novice
UPDATE `creature` SET `position_x`=-6403.96, `position_y`=235.578, `position_z`=403.353, `orientation`=0.401426 WHERE `guid`=1544; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6364.15, `position_y`=234.825, `position_z`=393.828, `orientation`=1.18682 WHERE `guid`=1531; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6423.17, `position_y`=307.792, `position_z`=402.04, `orientation`=1.74533 WHERE `guid`=1509; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6360.83, `position_y`=203.026, `position_z`=400.104, `orientation`=1.97222 WHERE `guid`=1547; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6368.05, `position_y`=243.334, `position_z`=391.402, `orientation`=3.71755 WHERE `guid`=1536; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-10550.4, `position_y`=1715.75, `position_z`=41.754, `orientation`=2.32129 WHERE `guid`=90156; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-10582.8, `position_y`=1683.2, `position_z`=40.9863, `orientation`=0.959931 WHERE `guid`=90154; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-6392.12, `position_y`=258.654, `position_z`=391.301, `orientation`=4.83456 WHERE `guid`=1542; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-6364.81, `position_y`=220.449, `position_z`=397.049, `orientation`=1.27409 WHERE `guid`=1548; -- Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5698.14, `position_y`=-1705.81, `position_z`=361.749, `orientation`=5.93412 WHERE `guid`=4530; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-10652.2, `position_y`=1952, `position_z`=35.1449, `orientation`=2.5069 WHERE `guid`=90308; -- Riverpaw Mongrel
UPDATE `creature` SET `position_x`=-5607.12, `position_y`=-1654.55, `position_z`=351.982, `orientation`=0.767945 WHERE `guid`=4504; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5595.33, `position_y`=-1683.61, `position_z`=347.134, `orientation`=6.21337 WHERE `guid`=4545; -- Rockjaw Bonesnapper (WAYPOINTS)
UPDATE `creature` SET `id`=1115 WHERE `guid`=4545; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4545; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5691.3, `position_y`=-1674.72, `position_z`=360.879, `orientation`=5.48033 WHERE `guid`=4498; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5529.59, `position_y`=-1724.91, `position_z`=340.475, `orientation`=3.97935 WHERE `guid`=4838; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4838; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4838; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5587.66, `position_y`=-1745.12, `position_z`=372.5, `orientation`=2.96706 WHERE `guid`=4550; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4550; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4550; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5558.58, `position_y`=-1756.6, `position_z`=342.063, `orientation`=5.18363 WHERE `guid`=4834; -- Rockjaw Skullthumper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4834; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4834; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5594.95, `position_y`=-1667.45, `position_z`=345.475, `orientation`=0.0349066 WHERE `guid`=4543; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4543; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4543; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5558.67, `position_y`=-1725.46, `position_z`=342.533, `orientation`=0.244346 WHERE `guid`=4558; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4558; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4558; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5604.98, `position_y`=-1705.73, `position_z`=359.05, `orientation`=3.89208 WHERE `guid`=4536; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4536; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4536; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5589.37, `position_y`=-1730.93, `position_z`=363.646, `orientation`=1.23918 WHERE `guid`=4556; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5565.72, `position_y`=-1771.75, `position_z`=347.378, `orientation`=0.785398 WHERE `guid`=4842; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4842; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4842; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5526.82, `position_y`=-1742.57, `position_z`=337.797, `orientation`=1.44862 WHERE `guid`=4845; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5606.35, `position_y`=-1648.08, `position_z`=353.392, `orientation`=1.64061 WHERE `guid`=4501; -- Rockjaw Skullthumper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4501; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4501; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5517.15, `position_y`=-1744.61, `position_z`=337.021, `orientation`=5.09636 WHERE `guid`=4844; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4844; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4844; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5605.82, `position_y`=-1674.05, `position_z`=350.733, `orientation`=0.767945 WHERE `guid`=4537; -- Rockjaw Bonesnapper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4537; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4537; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5611.09, `position_y`=-1678.21, `position_z`=351.285, `orientation`=0.366519 WHERE `guid`=4540; -- Rockjaw Skullthumper
UPDATE `creature` SET `id`=1115 WHERE `guid`=4540; -- Rockjaw Skullthumper
UPDATE `creature` SET `id2`=1117 WHERE `guid`=4540; -- Rockjaw Bonesnapper
UPDATE `creature` SET `position_x`=-5572.79, `position_y`=-1713.35, `position_z`=370.288, `orientation`=3.1765 WHERE `guid`=4555; -- Rockjaw Skullthumper
UPDATE `creature` SET `position_x`=-6202.89, `position_y`=100.456, `position_z`=430.132, `orientation`=0 WHERE `guid`=326; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-5943.12, `position_y`=7.07628, `position_z`=368.367, `orientation`=0 WHERE `guid`=1563; -- Crag Boar
UPDATE `creature` SET `position_x`=-10526.5, `position_y`=2083.52, `position_z`=8.54427, `orientation`=3.09438 WHERE `guid`=89837; -- Murloc Warrior
UPDATE `creature` SET `position_x`=-10591.9, `position_y`=1995.42, `position_z`=-4.89131, `orientation`=5.77704 WHERE `guid`=44232; -- Defias Pillager
UPDATE `creature` SET `position_x`=-10553.3, `position_y`=2100.64, `position_z`=4.73485, `orientation`=1.17801 WHERE `guid`=90027; -- Murloc Warrior
UPDATE `creature` SET `position_x`=-10488.5, `position_y`=1839.24, `position_z`=38.431, `orientation`=0 WHERE `guid`=90312; -- Harvest Golem
UPDATE `creature` SET `position_x`=-10474.5, `position_y`=1808.15, `position_z`=36.6755, `orientation`=3.68264 WHERE `guid`=89900; -- Harvest Golem
UPDATE `creature` SET `position_x`=-5580.08, `position_y`=-1773.47, `position_z`=351.287, `orientation`=5.3058 WHERE `guid`=4846; -- Rockjaw Skullthumper
UPDATE `creature` SET `position_x`=-5735.13, `position_y`=-574.069, `position_z`=399.182, `orientation`=4.55531 WHERE `guid`=3642; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5552.81, `position_y`=-1766.19, `position_z`=343.504, `orientation`=4.02897 WHERE `guid`=4843; -- Rockjaw Skullthumper
UPDATE `creature` SET `position_x`=-9907.48, `position_y`=1784.04, `position_z`=9.68609, `orientation`=0 WHERE `guid`=90092; -- Murloc Warrior
UPDATE `creature` SET `position_x`=-5465.81, `position_y`=-264.245, `position_z`=354.563, `orientation`=3.77079 WHERE `guid`=3244; -- Wendigo
UPDATE `creature` SET `position_x`=-9851.09, `position_y`=1384.95, `position_z`=51.5335, `orientation`=0 WHERE `guid`=51648; -- Young Goretusk
UPDATE `creature` SET `position_x`=-5783.49, `position_y`=-1582.53, `position_z`=358.825, `orientation`=3.19065 WHERE `guid`=4517; -- Rockjaw Skullthumper
UPDATE `creature` SET `position_x`=-5514.26, `position_y`=-305.453, `position_z`=354.826, `orientation`=0.837758 WHERE `guid`=3234; -- Wendigo
UPDATE `creature` SET `position_x`=-9914.59, `position_y`=1752.35, `position_z`=12.9768, `orientation`=0.20944 WHERE `guid`=89481; -- Murloc Minor Oracle (WAYPOINTS)
UPDATE `creature` SET `position_x`=-10078.4, `position_y`=1825.8, `position_z`=34.9505, `orientation`=0.713827 WHERE `guid`=90326; -- Riverpaw Scout
UPDATE `creature` SET `position_x`=-5626.32, `position_y`=-1660.43, `position_z`=363.634, `orientation`=5.16617 WHERE `guid`=4503; -- Rockjaw Skullthumper
UPDATE `creature` SET `position_x`=-5493.26, `position_y`=-213.731, `position_z`=354.337, `orientation`=0 WHERE `guid`=3569; -- Wendigo
UPDATE `creature` SET `position_x`=-9943.94, `position_y`=1916.39, `position_z`=-0.414062, `orientation`=2.90269 WHERE `guid`=47460; -- Sea Crawler
UPDATE `creature` SET `position_x`=-5418.67, `position_y`=-298.154, `position_z`=358.004, `orientation`=3.94444 WHERE `guid`=3221; -- Wendigo
UPDATE `creature` SET `position_x`=-5493.93, `position_y`=-330.081, `position_z`=355.681, `orientation`=2.28638 WHERE `guid`=3230; -- Wendigo
UPDATE `creature` SET `position_x`=-9927.92, `position_y`=1905.41, `position_z`=-0.63719, `orientation`=6.21583 WHERE `guid`=47435; -- Sea Crawler
UPDATE `creature` SET `position_x`=-9943.95, `position_y`=1901.3, `position_z`=3.46019, `orientation`=2.70572 WHERE `guid`=47447; -- Sea Crawler
UPDATE `creature` SET `position_x`=-5441.46, `position_y`=-272.169, `position_z`=356.897, `orientation`=6.17847 WHERE `guid`=3238; -- Wendigo
UPDATE `creature` SET `position_x`=-5408.64, `position_y`=-96.1034, `position_z`=395.288, `orientation`=0 WHERE `guid`=3131; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5479.66, `position_y`=-153.727, `position_z`=346.91, `orientation`=5.84685 WHERE `guid`=3119; -- Wendigo
UPDATE `creature` SET `position_x`=-5500.8, `position_y`=-127.106, `position_z`=346.91, `orientation`=5.96903 WHERE `guid`=3126; -- Young Wendigo
UPDATE `creature` SET `position_x`=-5432.07, `position_y`=-134.393, `position_z`=350.506, `orientation`=4.36332 WHERE `guid`=3122; -- Wendigo (WAYPOINTS)
UPDATE `creature` SET `position_x`=-5441.73, `position_y`=-153.084, `position_z`=351.309, `orientation`=3.05433 WHERE `guid`=3121; -- Wendigo
UPDATE `creature` SET `position_x`=-5456, `position_y`=-140.935, `position_z`=346.91, `orientation`=0 WHERE `guid`=3120; -- Wendigo
UPDATE `creature` SET `position_x`=-4984.76, `position_y`=-2714.89, `position_z`=326.702, `orientation`=0 WHERE `guid`=9336; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-10580.4, `position_y`=1979.46, `position_z`=-4.32576, `orientation`=5.27089 WHERE `guid`=89855; -- Riverpaw Miner
UPDATE `creature` SET `position_x`=-5480.97, `position_y`=-122.51, `position_z`=346.91, `orientation`=0 WHERE `guid`=3125; -- Wendigo
UPDATE `creature` SET `position_x`=-10556.1, `position_y`=2007, `position_z`=-6.5613, `orientation`=4.72984 WHERE `guid`=44291; -- Defias Pillager
UPDATE `creature` SET `position_x`=-10535.2, `position_y`=2002.37, `position_z`=-8.87876, `orientation`=4.92183 WHERE `guid`=44231; -- Riverpaw Miner
UPDATE `creature` SET `position_x`=-10560.3, `position_y`=1955.81, `position_z`=-2.94239, `orientation`=4.41568 WHERE `guid`=89858; -- Riverpaw Miner
UPDATE `creature` SET `position_x`=-10579.3, `position_y`=2001.88, `position_z`=-6.09168, `orientation`=2.46091 WHERE `guid`=89853; -- Riverpaw Miner
UPDATE `creature` SET `position_x`=-10587.3, `position_y`=1913.32, `position_z`=39.9456, `orientation`=5.95515 WHERE `guid`=89606; -- Riverpaw Mongrel
UPDATE `creature` SET `position_x`=-10583.9, `position_y`=1947.39, `position_z`=35.6777, `orientation`=2.71384 WHERE `guid`=89602; -- Riverpaw Mongrel
UPDATE `creature` SET `position_x`=-10551.1, `position_y`=1923.34, `position_z`=37.5753, `orientation`=4.30484 WHERE `guid`=89599; -- Riverpaw Mongrel
UPDATE `creature` SET `position_x`=-5544.19, `position_y`=-2730.56, `position_z`=366.684, `orientation`=0 WHERE `guid`=9006; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5388.97, `position_y`=-2726.34, `position_z`=363.24, `orientation`=4.5204 WHERE `guid`=9022; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-10972.6, `position_y`=2109.85, `position_z`=0.703631, `orientation`=0 WHERE `guid`=48226; -- Shore Crawler
UPDATE `creature` SET `position_x`=-10941.3, `position_y`=2109.63, `position_z`=3.45834, `orientation`=0 WHERE `guid`=48552; -- Shore Crawler
UPDATE `creature` SET `position_x`=-10719.8, `position_y`=1966.89, `position_z`=37.5201, `orientation`=5.86936 WHERE `guid`=89619; -- Riverpaw Mongrel
UPDATE `creature` SET `position_x`=-4983.92, `position_y`=-296.154, `position_z`=449.265, `orientation`=1.67793 WHERE `guid`=3210; -- Frostmane Seer
UPDATE `creature` SET `position_x`=-5056.98, `position_y`=418.321, `position_z`=421.421, `orientation`=5.7792 WHERE `guid`=2421; -- Leper Gnome
UPDATE `creature` SET `position_x`=-11138.9, `position_y`=2045.01, `position_z`=-0.877761, `orientation`=3.47289 WHERE `guid`=89516; -- Murloc Tidehunter
UPDATE `creature` SET `position_x`=-11164.6, `position_y`=2064.97, `position_z`=-4.73268, `orientation`=4.13319 WHERE `guid`=89972; -- Murloc Tidehunter
UPDATE `creature` SET `position_x`=-11366.4, `position_y`=1779.73, `position_z`=9.86444, `orientation`=4.65876 WHERE `guid`=90115; -- Murloc Tidehunter
UPDATE `creature` SET `position_x`=-10250.6, `position_y`=881.254, `position_z`=37.2886, `orientation`=0 WHERE `guid`=52570; -- Young Goretusk
UPDATE `creature` SET `position_x`=-5371.49, `position_y`=-271.287, `position_z`=438.887, `orientation`=4.58122 WHERE `guid`=3184; -- Frostmane Seer
UPDATE `creature` SET `position_x`=-5612.34, `position_y`=-375.451, `position_z`=399.767, `orientation`=0.506145 WHERE `guid`=3251; -- Crag Boar
UPDATE `creature` SET `position_x`=-5422.98, `position_y`=-567.549, `position_z`=396.756, `orientation`=5.84685 WHERE `guid`=1726; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5531.37, `position_y`=-2720.57, `position_z`=367.301, `orientation`=4.79966 WHERE `guid`=8997; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5537.03, `position_y`=-2742.93, `position_z`=367.412, `orientation`=5.72468 WHERE `guid`=9004; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-6032.94, `position_y`=-277.931, `position_z`=418.365, `orientation`=0 WHERE `guid`=3612; -- Crag Boar
UPDATE `creature` SET `position_x`=-5395.74, `position_y`=-2713.9, `position_z`=365.862, `orientation`=0 WHERE `guid`=8981; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5378.18, `position_y`=-2717.18, `position_z`=362.744, `orientation`=4.60767 WHERE `guid`=9028; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-6048.83, `position_y`=-324.054, `position_z`=426.659, `orientation`=0 WHERE `guid`=262; -- Crag Boar
UPDATE `creature` SET `position_x`=-5250.22, `position_y`=-2748.44, `position_z`=350.905, `orientation`=5.33417 WHERE `guid`=9096; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5150.11, `position_y`=-2817.23, `position_z`=330.135, `orientation`=1.93732 WHERE `guid`=9383; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5653.59, `position_y`=-1090.15, `position_z`=392.158, `orientation`=0 WHERE `guid`=4143; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5091.31, `position_y`=-2712.85, `position_z`=343.322, `orientation`=3.79124 WHERE `guid`=9046; -- Squirrel
UPDATE `creature` SET `position_x`=-5015.75, `position_y`=-2749.47, `position_z`=328.574, `orientation`=1.65806 WHERE `guid`=9404; -- Elder Black Bear
UPDATE `creature` SET `position_x`=-5051.03, `position_y`=-2851.03, `position_z`=328.654, `orientation`=6.16101 WHERE `guid`=9190; -- Forest Lurker
UPDATE `creature` SET `position_x`=-4979.96, `position_y`=-2943.12, `position_z`=316.348, `orientation`=0 WHERE `guid`=9156; -- Tunnel Rat Surveyor
UPDATE `creature` SET `position_x`=-4944.64, `position_y`=-3014.24, `position_z`=328.92, `orientation`=5.39307 WHERE `guid`=8398; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-5016.8, `position_y`=-3085.39, `position_z`=314.964, `orientation`=5.49779 WHERE `guid`=9287; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5445.4, `position_y`=-960.015, `position_z`=394.171, `orientation`=0 WHERE `guid`=4136; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5118.08, `position_y`=-3049.69, `position_z`=327.617, `orientation`=4.83456 WHERE `guid`=9403; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5400.69, `position_y`=-738.647, `position_z`=396.089, `orientation`=3.49219 WHERE `guid`=4076; -- Winter Wolf
UPDATE `creature` SET `position_x`=-5150.84, `position_y`=-3019.01, `position_z`=333.235, `orientation`=2.47837 WHERE `guid`=9389; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5150.76, `position_y`=-2949.87, `position_z`=332.123, `orientation`=0.750492 WHERE `guid`=9385; -- Mountain Boar
UPDATE `creature` SET `id`=1190 WHERE `guid`=9385; -- Mountain Boar
UPDATE `creature` SET `id2`=1195 WHERE `guid`=9385; -- Forest Lurker
UPDATE `creature` SET `position_x`=-5117.74, `position_y`=-3018.21, `position_z`=329.269, `orientation`=0.872665 WHERE `guid`=9392; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5084.38, `position_y`=50.1084, `position_z`=397.11, `orientation`=0.593412 WHERE `guid`=3164; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-5184.43, `position_y`=316.535, `position_z`=398.8, `orientation`=5.70723 WHERE `guid`=2409; -- Snow Leopard
UPDATE `creature` SET `position_x`=-5216.04, `position_y`=283.1, `position_z`=396.861, `orientation`=1.78024 WHERE `guid`=3018; -- Ice Claw Bear
UPDATE `creature` SET `position_x`=-5237.77, `position_y`=360.441, `position_z`=397.4, `orientation`=0.471239 WHERE `guid`=3014; -- Ice Claw Bear
UPDATE `creature` SET `position_x`=-5513.53, `position_y`=-3035.81, `position_z`=358.714, `orientation`=3.45575 WHERE `guid`=9379; -- Elder Black Bear
UPDATE `creature` SET `position_x`=-5467.33, `position_y`=199.6, `position_z`=397.332, `orientation`=2.26893 WHERE `guid`=3147; -- Snow Leopard
UPDATE `creature` SET `position_x`=-5450.61, `position_y`=150.892, `position_z`=400.486, `orientation`=3.68264 WHERE `guid`=3148; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-5437.85, `position_y`=105.075, `position_z`=396.632, `orientation`=1.6057 WHERE `guid`=3146; -- Snow Leopard
UPDATE `creature` SET `position_x`=-5184.96, `position_y`=-3049.14, `position_z`=331.083, `orientation`=6.16101 WHERE `guid`=9400; -- Mountain Boar
UPDATE `creature` SET `position_x`=-5322.99, `position_y`=-25.7484, `position_z`=393.792, `orientation`=1.85005 WHERE `guid`=3143; -- Ice Claw Bear
UPDATE `creature` SET `position_x`=-5352.81, `position_y`=-351.707, `position_z`=396.506, `orientation`=5.27089 WHERE `guid`=3213; -- Young Black Bear
UPDATE `creature` SET `position_x`=-5083.45, `position_y`=-2750.25, `position_z`=337.7, `orientation`=2.61587 WHERE `guid`=9352; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5384.51, `position_y`=-450.873, `position_z`=397.194, `orientation`=0 WHERE `guid`=1731; -- Snow Tracker Wolf
UPDATE `creature` SET `position_x`=-5083.36, `position_y`=-2684.34, `position_z`=335.893, `orientation`=0 WHERE `guid`=9349; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-4941.14, `position_y`=-3014.38, `position_z`=328.43, `orientation`=3.94444 WHERE `guid`=8670; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-5076.75, `position_y`=-2717.56, `position_z`=320.583, `orientation`=0.680678 WHERE `guid`=9337; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5066.39, `position_y`=-2716.22, `position_z`=319.198, `orientation`=0 WHERE `guid`=9335; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5294.14, `position_y`=-2720.25, `position_z`=342.608, `orientation`=2.93215 WHERE `guid`=9110; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-5348.99, `position_y`=-2733.52, `position_z`=360.76, `orientation`=5.3777 WHERE `guid`=9026; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5252.23, `position_y`=-2850.61, `position_z`=344.963, `orientation`=0.383972 WHERE `guid`=9288; -- Forest Lurker
UPDATE `creature` SET `position_x`=-4937.69, `position_y`=-3023.38, `position_z`=326.916, `orientation`=3.63028 WHERE `guid`=8951; -- Tunnel Rat Forager
UPDATE `creature` SET `position_x`=-5233.04, `position_y`=-2918.67, `position_z`=338.319, `orientation`=5.34071 WHERE `guid`=9394; -- Forest Lurker
UPDATE `creature` SET `position_x`=-5242.71, `position_y`=-433.201, `position_z`=387.268, `orientation`=0 WHERE `guid`=156; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-5016.45, `position_y`=-2683.57, `position_z`=323.994, `orientation`=0 WHERE `guid`=9356; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-4717.7, `position_y`=-2916.22, `position_z`=322.185, `orientation`=0 WHERE `guid`=9295; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5653.3, `position_y`=12.9137, `position_z`=404.552, `orientation`=0 WHERE `guid`=3104; -- Large Crag Boar
UPDATE `creature` SET `position_x`=-10117, `position_y`=715.883, `position_z`=30.7686, `orientation`=0 WHERE `guid`=80533; -- Riverpaw Outrunner
UPDATE `creature` SET `position_x`=-10110.2, `position_y`=692.573, `position_z`=32.0774, `orientation`=4.55531 WHERE `guid`=80535; -- Riverpaw Outrunner
UPDATE `creature` SET `position_x`=-10117.8, `position_y`=686.296, `position_z`=32.0774, `orientation`=6.17847 WHERE `guid`=80536; -- Riverpaw Outrunner
UPDATE `creature` SET `position_x`=-5752.17, `position_y`=105.662, `position_z`=366.655, `orientation`=0 WHERE `guid`=3093; -- Crag Boar
UPDATE `creature` SET `position_x`=-9819.72, `position_y`=553.937, `position_z`=37.4616, `orientation`=0 WHERE `guid`=80546; -- Riverpaw Outrunner
UPDATE `creature` SET `position_x`=-5034.79, `position_y`=-2685.5, `position_z`=319.393, `orientation`=1.93732 WHERE `guid`=9354; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-9814.38, `position_y`=351.415, `position_z`=37.5357, `orientation`=0.81431 WHERE `guid`=80573; -- Stonetusk Boar
UPDATE `creature` SET `position_x`=-5683.3, `position_y`=449.982, `position_z`=387.337, `orientation`=2.58309 WHERE `guid`=2966; -- Snow Leopard
UPDATE `creature` SET `position_x`=-5583.99, `position_y`=317.596, `position_z`=394.369, `orientation`=4.29351 WHERE `guid`=3065; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-5649.24, `position_y`=451.142, `position_z`=384.228, `orientation`=3.26377 WHERE `guid`=2964; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-9551.99, `position_y`=211.653, `position_z`=57.8532, `orientation`=4.9278 WHERE `guid`=80418; -- Forest Spider
UPDATE `creature` SET `position_x`=-5440.97, `position_y`=409.263, `position_z`=391.136, `orientation`=2.18166 WHERE `guid`=3006; -- Ice Claw Bear
UPDATE `creature` SET `position_x`=-5074.25, `position_y`=-2712.34, `position_z`=320.047, `orientation`=0 WHERE `guid`=9357; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5033.7, `position_y`=-2674.35, `position_z`=319.349, `orientation`=4.15388 WHERE `guid`=9343; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-5350.95, `position_y`=416.662, `position_z`=388.748, `orientation`=1.41372 WHERE `guid`=3008; -- Snow Leopard
UPDATE `creature` SET `position_x`=-5285.04, `position_y`=485.721, `position_z`=385.676, `orientation`=4.13643 WHERE `guid`=2456; -- Elder Crag Boar
UPDATE `creature` SET `position_x`=-11016.6, `position_y`=1525.85, `position_z`=43.5755, `orientation`=4.35512 WHERE `guid`=90358; -- Defias Pillager (WAYPOINTS)
UPDATE `creature` SET `position_x`=-11278, `position_y`=1704.37, `position_z`=41.5558, `orientation`=0 WHERE `guid`=89772; -- Defias Highwayman
UPDATE `creature` SET `position_x`=-5382.47, `position_y`=-2706.48, `position_z`=366.018, `orientation`=0 WHERE `guid`=8986; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5409.46, `position_y`=-2725.87, `position_z`=376.372, `orientation`=6.07375 WHERE `guid`=9017; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5483.01, `position_y`=-2749.8, `position_z`=364.292, `orientation`=0 WHERE `guid`=9070; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5448.36, `position_y`=-2715.99, `position_z`=366.005, `orientation`=0 WHERE `guid`=9030; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5389.54, `position_y`=-2715.18, `position_z`=364.601, `orientation`=2.58309 WHERE `guid`=9018; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5820.09, `position_y`=-2957.01, `position_z`=358.295, `orientation`=5.02655 WHERE `guid`=9272; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5810.66, `position_y`=-2968.62, `position_z`=366.13, `orientation`=2.3911 WHERE `guid`=9276; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5894.86, `position_y`=-2860.64, `position_z`=370.989, `orientation`=0.802851 WHERE `guid`=9167; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5908.12, `position_y`=-2863.62, `position_z`=372.458, `orientation`=3.49066 WHERE `guid`=9174; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5946.49, `position_y`=-2897.21, `position_z`=368.544, `orientation`=4.01426 WHERE `guid`=9132; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5940.89, `position_y`=-2880.15, `position_z`=372.514, `orientation`=1.27409 WHERE `guid`=9140; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5891.37, `position_y`=-2945.58, `position_z`=366.469, `orientation`=0.20944 WHERE `guid`=9091; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5953.76, `position_y`=-2857.1, `position_z`=375.994, `orientation`=1.50098 WHERE `guid`=9136; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5917.62, `position_y`=-3007.59, `position_z`=378.067, `orientation`=2.37365 WHERE `guid`=9074; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6013.31, `position_y`=-2994.87, `position_z`=400.23, `orientation`=3.9968 WHERE `guid`=9118; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6049.58, `position_y`=-2950.16, `position_z`=402.512, `orientation`=0 WHERE `guid`=9251; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6071.11, `position_y`=-2994.77, `position_z`=410.317, `orientation`=3.01942 WHERE `guid`=9050; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6054.34, `position_y`=-3018.18, `position_z`=403.069, `orientation`=2.77507 WHERE `guid`=9079; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6052.15, `position_y`=-2932.09, `position_z`=401.807, `orientation`=4.66003 WHERE `guid`=9253; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6096.48, `position_y`=-2965.77, `position_z`=401.457, `orientation`=1.11064 WHERE `guid`=9257; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6203.65, `position_y`=-3022, `position_z`=386.729, `orientation`=0.527396 WHERE `guid`=8337; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-6161.04, `position_y`=-2912.41, `position_z`=404.693, `orientation`=0 WHERE `guid`=9268; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-5985.79, `position_y`=-3000.16, `position_z`=392.067, `orientation`=0.279253 WHERE `guid`=9242; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-5912.99, `position_y`=-2568.33, `position_z`=311.976, `orientation`=0.366519 WHERE `guid`=9256; -- Elder Black Bear
UPDATE `creature` SET `position_x`=-10990, `position_y`=1448.93, `position_z`=43.385, `orientation`=5.32214 WHERE `guid`=90069; -- Chicken
UPDATE `creature` SET `position_x`=-10994.3, `position_y`=1451.03, `position_z`=43.385, `orientation`=2.65751 WHERE `guid`=90074; -- Chicken
UPDATE `creature` SET `position_x`=-10866.8, `position_y`=1197.25, `position_z`=33.5864, `orientation`=4.4188 WHERE `guid`=90370; -- Riverpaw Brute
UPDATE `creature` SET `position_x`=-10879.5, `position_y`=1146.13, `position_z`=37.5948, `orientation`=6.0106 WHERE `guid`=89689; -- Riverpaw Bandit
UPDATE `creature` SET `position_x`=-10150.7, `position_y`=316.212, `position_z`=25.6013, `orientation`=2.14675 WHERE `guid`=5922; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-9933.72, `position_y`=1233.33, `position_z`=42.486, `orientation`=0.471239 WHERE `guid`=90159; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-11032.2, `position_y`=1436.57, `position_z`=43.9694, `orientation`=4.81511 WHERE `guid`=89928; -- Chicken
UPDATE `creature` SET `position_x`=-11326.8, `position_y`=1538.96, `position_z`=28.5673, `orientation`=3.22738 WHERE `guid`=89572; -- Foreman Thistlenettle
UPDATE `creature` SET `position_x`=-11297.3, `position_y`=1564.03, `position_z`=35.9701, `orientation`=5.5765 WHERE `guid`=89565; -- Skeletal Miner
UPDATE `creature` SET `position_x`=-11319.8, `position_y`=1592.28, `position_z`=35.8212, `orientation`=5.52035 WHERE `guid`=89990; -- Skeletal Miner
UPDATE `creature` SET `position_x`=-10233.6, `position_y`=1510.58, `position_z`=40.4745, `orientation`=4.24115 WHERE `guid`=90307; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-11331.7, `position_y`=1581.06, `position_z`=34.4016, `orientation`=0.754808 WHERE `guid`=89994; -- Undead Excavator
UPDATE `creature` SET `position_x`=-11343.3, `position_y`=1564.1, `position_z`=31.9432, `orientation`=3.85718 WHERE `guid`=89569; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11343.3, `position_y`=1530.93, `position_z`=28.5278, `orientation`=2.80811 WHERE `guid`=90124; -- Undead Dynamiter
UPDATE `creature` SET `position_x`=-11335.8, `position_y`=1541.87, `position_z`=29.2218, `orientation`=4.47709 WHERE `guid`=89570; -- Undead Excavator
UPDATE `creature` SET `position_x`=-11252, `position_y`=1582.01, `position_z`=66.1323, `orientation`=6.14356 WHERE `guid`=62086; -- Defias Highwayman
UPDATE `creature` SET `position_x`=-11324.5, `position_y`=1547.18, `position_z`=28.5209, `orientation`=3.42085 WHERE `guid`=89996; -- Undead Excavator
UPDATE `creature` SET `position_x`=-10084.2, `position_y`=1083.33, `position_z`=40.1448, `orientation`=3.79232 WHERE `guid`=90425; -- Coyote
UPDATE `creature` SET `position_x`=-10047.7, `position_y`=1316.66, `position_z`=44.2219, `orientation`=3.0804 WHERE `guid`=51559; -- Young Fleshripper
UPDATE `creature` SET `position_x`=-10218.1, `position_y`=847.678, `position_z`=37.4856, `orientation`=0.93894 WHERE `guid`=52562; -- Young Fleshripper
UPDATE `creature` SET `position_x`=-10618.2, `position_y`=1485.19, `position_z`=47.6789, `orientation`=0 WHERE `guid`=89778; -- Goretusk
UPDATE `creature` SET `position_x`=-10491.2, `position_y`=1214.77, `position_z`=67.3319, `orientation`=4.4855 WHERE `guid`=90409; -- Defias Smuggler
UPDATE `creature` SET `position_x`=-9951.92, `position_y`=1217.64, `position_z`=42.9212, `orientation`=2.86867 WHERE `guid`=88910; -- Young Goretusk
UPDATE `creature` SET `position_x`=-9785.32, `position_y`=1481.66, `position_z`=44.3886, `orientation`=6.14117 WHERE `guid`=86783; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-9783.61, `position_y`=1451.08, `position_z`=44.6199, `orientation`=6.18716 WHERE `guid`=86782; -- Riverpaw Gnoll
UPDATE `creature` SET `position_x`=-9663.65, `position_y`=1574.9, `position_z`=8.1919, `orientation`=0 WHERE `guid`=47311; -- Sand Crawler
UPDATE `creature` SET `position_x`=-9667.5, `position_y`=1590.45, `position_z`=10.3762, `orientation`=0 WHERE `guid`=47291; -- Sand Crawler
UPDATE `creature` SET `position_x`=-9684.17, `position_y`=1630.52, `position_z`=9.19335, `orientation`=0 WHERE `guid`=46993; -- Sand Crawler
UPDATE `creature` SET `position_x`=-9600.61, `position_y`=1462, `position_z`=4.47585, `orientation`=1.13345 WHERE `guid`=89938; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-9685.08, `position_y`=1615.88, `position_z`=12.2393, `orientation`=0 WHERE `guid`=47306; -- Sand Crawler
UPDATE `creature` SET `position_x`=-9615.42, `position_y`=1486.34, `position_z`=8.00431, `orientation`=0.461256 WHERE `guid`=90147; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-9595.08, `position_y`=1447.2, `position_z`=3.00257, `orientation`=4.57692 WHERE `guid`=89459; -- Murloc Coastrunner
UPDATE `creature` SET `position_x`=-9851.56, `position_y`=1401.07, `position_z`=37.3428, `orientation`=2.20947 WHERE `guid`=90127; -- Kobold Digger
UPDATE `creature` SET `position_x`=-9932.48, `position_y`=1266.14, `position_z`=42.039, `orientation`=5.3058 WHERE `guid`=90055; -- Harvest Watcher
UPDATE `creature` SET `position_x`=-10121.6, `position_y`=1069.49, `position_z`=36.5409, `orientation`=3.69123 WHERE `guid`=86385; -- Chicken
UPDATE `creature` SET `position_x`=-10133.7, `position_y`=1068.4, `position_z`=36.4668, `orientation`=2.07448 WHERE `guid`=90316; -- Chicken
UPDATE `creature` SET `position_x`=-11230.4, `position_y`=1173.42, `position_z`=89.8215, `orientation`=0 WHERE `guid`=54598; -- Defias Highwayman
UPDATE `creature` SET `position_x`=-11201.6, `position_y`=1334.28, `position_z`=89.4442, `orientation`=4.31096 WHERE `guid`=89910; -- Defias Highwayman
UPDATE `creature` SET `position_x`=10245.9, `position_y`=844.359, `position_z`=1343.91, `orientation`=0.506145 WHERE `guid`=49566; -- Young Nightsaber
UPDATE `creature` SET `position_x`=10582.2, `position_y`=784.113, `position_z`=1310.54, `orientation`=4.31096 WHERE `guid`=46952; -- Thistle Boar
UPDATE `creature` SET `id`=1985 WHERE `guid`=46952; -- Thistle Boar
UPDATE `creature` SET `id2`=2032 WHERE `guid`=46952; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=10400.1, `position_y`=633.016, `position_z`=1325.88, `orientation`=6.17847 WHERE `guid`=49565; -- Young Nightsaber
UPDATE `creature` SET `position_x`=10516.6, `position_y`=648.409, `position_z`=1324.91, `orientation`=5.65487 WHERE `guid`=49630; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=10564.1, `position_y`=579.128, `position_z`=1340.27, `orientation`=2.25061 WHERE `guid`=47876; -- Rabbit
UPDATE `creature` SET `position_x`=10515, `position_y`=585.233, `position_z`=1339, `orientation`=2.04204 WHERE `guid`=49627; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=10649.8, `position_y`=749.357, `position_z`=1319.73, `orientation`=1.71042 WHERE `guid`=46946; -- Thistle Boar
UPDATE `creature` SET `id`=1985 WHERE `guid`=46946; -- Thistle Boar
UPDATE `creature` SET `id2`=2032 WHERE `guid`=46946; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=10677.7, `position_y`=749.87, `position_z`=1322.51, `orientation`=2.25147 WHERE `guid`=46950; -- Thistle Boar
UPDATE `creature` SET `position_x`=10666.8, `position_y`=766.711, `position_z`=1320.6, `orientation`=3.90954 WHERE `guid`=49639; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=10648.8, `position_y`=849.706, `position_z`=1315.51, `orientation`=5.70723 WHERE `guid`=46947; -- Thistle Boar
UPDATE `creature` SET `position_x`=10517.4, `position_y`=1014.58, `position_z`=1318.37, `orientation`=1.3439 WHERE `guid`=47340; -- Grellkin
UPDATE `creature` SET `position_x`=10516.4, `position_y`=1048.02, `position_z`=1322.99, `orientation`=3.36849 WHERE `guid`=47331; -- Grellkin
UPDATE `creature` SET `position_x`=10501.4, `position_y`=1056.54, `position_z`=1325.55, `orientation`=4.08407 WHERE `guid`=47321; -- Grellkin
UPDATE `creature` SET `position_x`=10529.2, `position_y`=1033.27, `position_z`=1322.61, `orientation`=0.20944 WHERE `guid`=47330; -- Grellkin
UPDATE `creature` SET `position_x`=10531.5, `position_y`=1065.13, `position_z`=1321.44, `orientation`=1.95477 WHERE `guid`=47324; -- Grellkin
UPDATE `creature` SET `position_x`=10493.2, `position_y`=1044.01, `position_z`=1326.46, `orientation`=3.59538 WHERE `guid`=47329; -- Grellkin
UPDATE `creature` SET `position_x`=10482.6, `position_y`=1065.87, `position_z`=1327.51, `orientation`=0.418879 WHERE `guid`=47314; -- Grellkin
UPDATE `creature` SET `position_x`=10344, `position_y`=1036.66, `position_z`=1339.48, `orientation`=2.53073 WHERE `guid`=47341; -- Grellkin
UPDATE `creature` SET `position_x`=10333.4, `position_y`=1018.82, `position_z`=1337.8, `orientation`=0.767945 WHERE `guid`=47346; -- Grellkin
UPDATE `creature` SET `position_x`=10331.6, `position_y`=1030.69, `position_z`=1339.14, `orientation`=1.88496 WHERE `guid`=47338; -- Grellkin
UPDATE `creature` SET `position_x`=10350.3, `position_y`=651.252, `position_z`=1329.25, `orientation`=3.94444 WHERE `guid`=49568; -- Young Nightsaber
UPDATE `creature` SET `position_x`=10507.5, `position_y`=1064.39, `position_z`=1325.98, `orientation`=6.16101 WHERE `guid`=47319; -- Grellkin
UPDATE `creature` SET `position_x`=9850.38, `position_y`=818.646, `position_z`=1308.09, `orientation`=3.7001 WHERE `guid`=49897; -- Nightsaber
UPDATE `creature` SET `position_x`=10075.4, `position_y`=583.697, `position_z`=1326.4, `orientation`=4.92183 WHERE `guid`=47382; -- Strigid Owl
UPDATE `creature` SET `position_x`=-6954.29, `position_y`=876.18, `position_z`=14.1427, `orientation`=4.72582 WHERE `guid`=43199; -- Hive'Ashi Stinger
UPDATE `creature` SET `position_x`=-1397.51, `position_y`=2841.12, `position_z`=77.9726, `orientation`=0.249428 WHERE `guid`=29083; -- Ghostly Marauder
UPDATE `creature` SET `position_x`=-7782.92, `position_y`=-1215.19, `position_z`=-268.231, `orientation`=3.72235 WHERE `guid`=24291; -- Gorishi Wasp
UPDATE `creature` SET `position_x`=-7517.78, `position_y`=1448.98, `position_z`=4.49926, `orientation`=3.19395 WHERE `guid`=43706; -- Hive'Zora Hive Sister
UPDATE `creature` SET `position_x`=-7050.03, `position_y`=1782.87, `position_z`=0.194014, `orientation`=2.81635 WHERE `guid`=43715; -- Hive'Zora Hive Sister
UPDATE `creature` SET `position_x`=-7081.79, `position_y`=1683.2, `position_z`=4.94626, `orientation`=3.7062 WHERE `guid`=43643; -- Hive'Zora Reaver
UPDATE `creature` SET `position_x`=-9725.18, `position_y`=-2188.28, `position_z`=59.4407, `orientation`=0 WHERE `guid`=16321; -- Great Goretusk
UPDATE `creature` SET `position_x`=-9618.17, `position_y`=-2250.48, `position_z`=84.9, `orientation`=0 WHERE `guid`=10160; -- Great Goretusk
UPDATE `creature` SET `position_x`=-9726.47, `position_y`=-2188.51, `position_z`=59.3784, `orientation`=0 WHERE `guid`=16324; -- Redridge Poacher
UPDATE `creature` SET `id`=423 WHERE `guid`=16324; -- Redridge Mongrel
UPDATE `creature` SET `id2`=424 WHERE `guid`=16324; -- Redridge Poacher
UPDATE `creature` SET `id3`=712 WHERE `guid`=16324; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-9739.55, `position_y`=-2163.38, `position_z`=59.003, `orientation`=0 WHERE `guid`=10416; -- Redridge Thrasher
UPDATE `creature` SET `id`=423 WHERE `guid`=10416; -- Redridge Mongrel
UPDATE `creature` SET `id2`=424 WHERE `guid`=10416; -- Redridge Poacher
UPDATE `creature` SET `id3`=712 WHERE `guid`=10416; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-9769.44, `position_y`=-2266.68, `position_z`=59.5911, `orientation`=4.08407 WHERE `guid`=10259; -- Redridge Mongrel
UPDATE `creature` SET `position_x`=-9662.76, `position_y`=-2374.01, `position_z`=62.7456, `orientation`=5.77593 WHERE `guid`=13325; -- Rabbit
UPDATE `creature` SET `position_x`=-9662.99, `position_y`=-2884.77, `position_z`=50.8446, `orientation`=0 WHERE `guid`=7587; -- Black Dragon Whelp
UPDATE `creature` SET `position_x`=-9681.74, `position_y`=-2958.51, `position_z`=51.8829, `orientation`=0 WHERE `guid`=7767; -- Dire Condor
UPDATE `creature` SET `position_x`=-9676.02, `position_y`=-3019.51, `position_z`=51.9021, `orientation`=3.24631 WHERE `guid`=6760; -- Black Dragon Whelp
UPDATE `creature` SET `position_x`=-9683.31, `position_y`=-2990.24, `position_z`=52.3282, `orientation`=3.85482 WHERE `guid`=6282; -- Rabbit
UPDATE `creature` SET `position_x`=-9638.64, `position_y`=-2760.09, `position_z`=58.8025, `orientation`=4.4855 WHERE `guid`=7549; -- Black Dragon Whelp
UPDATE `creature` SET `position_x`=-9687.19, `position_y`=-1785.26, `position_z`=57.1286, `orientation`=0.665057 WHERE `guid`=8774; -- Tarantula
UPDATE `creature` SET `position_x`=-9202.3, `position_y`=-2742, `position_z`=88.9876, `orientation`=0 WHERE `guid`=10419; -- Greater Tarantula
UPDATE `creature` SET `position_x`=-9116.21, `position_y`=-2715.68, `position_z`=92.2821, `orientation`=0 WHERE `guid`=10451; -- Greater Tarantula
UPDATE `creature` SET `position_x`=-9179.02, `position_y`=-2812.58, `position_z`=93.5338, `orientation`=0 WHERE `guid`=18380; -- Dire Condor
UPDATE `creature` SET `id`=428 WHERE `guid`=18380; -- Dire Condor
UPDATE `creature` SET `id2`=547 WHERE `guid`=18380; -- Great Goretusk
UPDATE `creature` SET `position_x`=-9150.86, `position_y`=-2753.72, `position_z`=91.3457, `orientation`=0 WHERE `guid`=10417; -- Dire Condor
UPDATE `creature` SET `position_x`=-9123.18, `position_y`=-2740.33, `position_z`=94.1881, `orientation`=0 WHERE `guid`=10415; -- Greater Tarantula
UPDATE `creature` SET `position_x`=-9198.02, `position_y`=-2793.02, `position_z`=92.2523, `orientation`=0 WHERE `guid`=10446; -- Greater Tarantula
UPDATE `creature` SET `position_x`=-9445.21, `position_y`=-2317.8, `position_z`=66.3873, `orientation`=1.928 WHERE `guid`=8759; -- Rabbit
UPDATE `creature` SET `position_x`=-9243.62, `position_y`=-2805.14, `position_z`=94.328, `orientation`=0 WHERE `guid`=10456; -- Greater Tarantula
UPDATE `creature` SET `position_x`=-9641.36, `position_y`=-2404.7, `position_z`=62.7869, `orientation`=0 WHERE `guid`=16320; -- Great Goretusk
UPDATE `creature` SET `position_x`=-9657.4, `position_y`=-3120.04, `position_z`=50.6398, `orientation`=4.67107 WHERE `guid`=6727; -- Blackrock Outrunner
UPDATE `creature` SET `id`=440 WHERE `guid`=6727; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=6727; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9753.61, `position_y`=-3198.43, `position_z`=58.7922, `orientation`=0 WHERE `guid`=8309; -- Blackrock Grunt
UPDATE `creature` SET `id`=440 WHERE `guid`=8309; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=8309; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9739.99, `position_y`=-3226.03, `position_z`=59.6004, `orientation`=0 WHERE `guid`=6746; -- Blackrock Grunt
UPDATE `creature` SET `position_x`=-9772.4, `position_y`=-3228.19, `position_z`=58.7922, `orientation`=0 WHERE `guid`=8168; -- Blackrock Grunt
UPDATE `creature` SET `id`=440 WHERE `guid`=8168; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=8168; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9652.37, `position_y`=-3236.17, `position_z`=48.6625, `orientation`=0 WHERE `guid`=6731; -- Blackrock Grunt
UPDATE `creature` SET `id`=440 WHERE `guid`=6731; -- Blackrock Grunt
UPDATE `creature` SET `id2`=485 WHERE `guid`=6731; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9762.96, `position_y`=-3235.79, `position_z`=58.8753, `orientation`=1.40719 WHERE `guid`=6748; -- Rabbit
UPDATE `creature` SET `position_x`=-9536.05, `position_y`=-3247.16, `position_z`=49.4882, `orientation`=2.22786 WHERE `guid`=6738; -- Blackrock Renegade
UPDATE `creature` SET `position_x`=-9537.83, `position_y`=-3244.73, `position_z`=50.1823, `orientation`=3.34214 WHERE `guid`=6737; -- Blackrock Outrunner
UPDATE `creature` SET `position_x`=-9439.3, `position_y`=-3080.77, `position_z`=136.87, `orientation`=1.09956 WHERE `guid`=18397; -- Tharil'zun
UPDATE `creature` SET `position_x`=-9441.58, `position_y`=-3077.65, `position_z`=136.87, `orientation`=0.436332 WHERE `guid`=18394; -- Blackrock Hunter
UPDATE `creature` SET `position_x`=-9440.13, `position_y`=-3073.22, `position_z`=136.855, `orientation`=5.02655 WHERE `guid`=18377; -- Blackrock Sentry (WAYPOINTS)
UPDATE `creature` SET `position_x`=-9435.27, `position_y`=-3078.54, `position_z`=136.875, `orientation`=2.3911 WHERE `guid`=31824; -- Blackrock Shadowcaster
UPDATE `creature` SET `position_x`=-9190.15, `position_y`=-2302.01, `position_z`=90.1599, `orientation`=5.52459 WHERE `guid`=6700; -- Rabbit
UPDATE `creature` SET `position_x`=-8946.07, `position_y`=-2287.28, `position_z`=132.54, `orientation`=1.56171 WHERE `guid`=28334; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-8933.68, `position_y`=-2307.92, `position_z`=132.638, `orientation`=3.80482 WHERE `guid`=28335; -- Redridge Basher
UPDATE `creature` SET `position_x`=-8901.56, `position_y`=-2299.46, `position_z`=145.157, `orientation`=1.65697 WHERE `guid`=8786; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-8947.68, `position_y`=-2333.15, `position_z`=132.641, `orientation`=3.35082 WHERE `guid`=16405; -- Redridge Basher
UPDATE `creature` SET `id`=430 WHERE `guid`=16405; -- Redridge Mystic
UPDATE `creature` SET `id2`=446 WHERE `guid`=16405; -- Redridge Basher
UPDATE `creature` SET `position_x`=-8946.03, `position_y`=-2196.92, `position_z`=138.246, `orientation`=6.02139 WHERE `guid`=16354; -- Redridge Basher
UPDATE `creature` SET `position_x`=-8988.29, `position_y`=-2190.42, `position_z`=132.876, `orientation`=4.11898 WHERE `guid`=8911; -- Redridge Mystic
UPDATE `creature` SET `position_x`=-9284.26, `position_y`=-2515.66, `position_z`=32.2287, `orientation`=0 WHERE `guid`=10102; -- Murloc Scout
UPDATE `creature` SET `id`=422 WHERE `guid`=10102; -- Murloc Flesheater
UPDATE `creature` SET `id2`=578 WHERE `guid`=10102; -- Murloc Scout
UPDATE `creature` SET `position_x`=-9257.86, `position_y`=-1988.15, `position_z`=76.7962, `orientation`=4.20975 WHERE `guid`=8669; -- Sheep
UPDATE `creature` SET `position_x`=-4235.7, `position_y`=-2349.77, `position_z`=204.321, `orientation`=5.60587 WHERE `guid`=11088; -- Dragonmaw Grunt
UPDATE `creature` SET `position_x`=-3034.53, `position_y`=-1668.02, `position_z`=11.2421, `orientation`=3.29867 WHERE `guid`=9996; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-3109.35, `position_y`=-2209.46, `position_z`=9.72384, `orientation`=1.95477 WHERE `guid`=10678; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3120.2, `position_y`=-2191.12, `position_z`=12.0663, `orientation`=4.29351 WHERE `guid`=10690; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3049.23, `position_y`=-2152.83, `position_z`=11.1606, `orientation`=0.890118 WHERE `guid`=10675; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-3089.03, `position_y`=-2200.06, `position_z`=10.8214, `orientation`=1.18682 WHERE `guid`=10676; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3028.26, `position_y`=-2150.45, `position_z`=10.0497, `orientation`=2.89725 WHERE `guid`=10672; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-3246.23, `position_y`=-2086, `position_z`=25.6494, `orientation`=0.307233 WHERE `guid`=10885; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-3026.01, `position_y`=-2275.17, `position_z`=9.78339, `orientation`=3.40339 WHERE `guid`=10664; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3042.87, `position_y`=-2266.43, `position_z`=9.20893, `orientation`=4.5204 WHERE `guid`=10689; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3091.24, `position_y`=-2180.64, `position_z`=9.53232, `orientation`=4.2586 WHERE `guid`=10697; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3015.97, `position_y`=-2239.97, `position_z`=10.1237, `orientation`=2.18166 WHERE `guid`=10685; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3099.1, `position_y`=-2195.7, `position_z`=9.39657, `orientation`=3.14159 WHERE `guid`=10662; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-3021.8, `position_y`=-2256.95, `position_z`=9.41154, `orientation`=2.68781 WHERE `guid`=10688; -- Mosshide Mistweaver
UPDATE `creature` SET `position_x`=-3050.79, `position_y`=-2362.51, `position_z`=6.27086, `orientation`=4.9035 WHERE `guid`=10637; -- Fen Creeper
UPDATE `creature` SET `position_x`=-2917.77, `position_y`=-2585.84, `position_z`=34.3783, `orientation`=1.27409 WHERE `guid`=10693; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-2899.91, `position_y`=-2593.15, `position_z`=34.4992, `orientation`=3.4383 WHERE `guid`=10682; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-10274.7, `position_y`=-3944.27, `position_z`=-70.5712, `orientation`=1.24354 WHERE `guid`=38926; -- Fungal Ooze
UPDATE `creature` SET `position_x`=-10302.5, `position_y`=-3963.43, `position_z`=-70.5712, `orientation`=0.824484 WHERE `guid`=38924; -- Murk Slitherer
UPDATE `creature` SET `position_x`=-8114.26, `position_y`=-2570.27, `position_z`=133.468, `orientation`=0.709252 WHERE `guid`=5361; -- Firegut Ogre
UPDATE `creature` SET `position_x`=7548.99, `position_y`=-4883.9, `position_z`=696.998, `orientation`=3.39723 WHERE `guid`=41418; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=4447.9, `position_y`=-6213.8, `position_z`=98.7063, `orientation`=4.08644 WHERE `guid`=35584; -- Blood Elf Surveyor
UPDATE `creature` SET `position_x`=4414.82, `position_y`=-6252.59, `position_z`=95.1485, `orientation`=3.90127 WHERE `guid`=35575; -- Blood Elf Surveyor
UPDATE `creature` SET `position_x`=7617.35, `position_y`=-4950.77, `position_z`=699.444, `orientation`=0.133406 WHERE `guid`=41467; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=4351.83, `position_y`=-6276.2, `position_z`=95.6757, `orientation`=4.28959 WHERE `guid`=35600; -- Blood Elf Surveyor
UPDATE `creature` SET `position_x`=4313.54, `position_y`=-6213.27, `position_z`=108.781, `orientation`=2.3987 WHERE `guid`=35603; -- Blood Elf Surveyor (WAYPOINTS)
UPDATE `creature` SET `position_x`=4295.01, `position_y`=-6233.08, `position_z`=108.245, `orientation`=5.98989 WHERE `guid`=35586; -- Blood Elf Surveyor
UPDATE `creature` SET `position_x`=-6416.25, `position_y`=-1283.63, `position_z`=-269.623, `orientation`=5.30858 WHERE `guid`=24108; -- Tar Lurker
UPDATE `creature` SET `position_x`=-376.488, `position_y`=11.4517, `position_z`=-148.703, `orientation`=3.40339 WHERE `guid`=33640; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-374.832, `position_y`=8.99056, `position_z`=-148.648, `orientation`=5.34071 WHERE `guid`=33641; -- Unliving Atal'ai
UPDATE `creature` SET `id`=5259 WHERE `guid`=33641; -- Atal'ai Witch Doctor
UPDATE `creature` SET `id2`=5267 WHERE `guid`=33641; -- Unliving Atal'ai
UPDATE `creature` SET `position_x`=-378.042, `position_y`=7.51446, `position_z`=-148.593, `orientation`=4.18879 WHERE `guid`=33642; -- Atal'ai Witch Doctor
UPDATE `creature` SET `position_x`=-354.516, `position_y`=3.40563, `position_z`=-69.309, `orientation`=1.0821 WHERE `guid`=39788; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-347.854, `position_y`=8.60216, `position_z`=-69.309, `orientation`=4.38078 WHERE `guid`=38080; -- Atal'ai Witch Doctor
UPDATE `creature` SET `position_x`=-355.321, `position_y`=11.4361, `position_z`=-69.309, `orientation`=2.86234 WHERE `guid`=38082; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-8253.62, `position_y`=-1862.68, `position_z`=143.762, `orientation`=1.47617 WHERE `guid`=5256; -- Lava Crab
UPDATE `creature` SET `position_x`=7582.36, `position_y`=-4981.83, `position_z`=701.096, `orientation`=2.20239 WHERE `guid`=41449; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7450.44, `position_y`=-5048.68, `position_z`=729.465, `orientation`=1.64598 WHERE `guid`=41416; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7519.23, `position_y`=-5050.82, `position_z`=717.921, `orientation`=3.94305 WHERE `guid`=41448; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7483.63, `position_y`=-5084.5, `position_z`=731.049, `orientation`=5.30472 WHERE `guid`=41466; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7449.26, `position_y`=-4981.58, `position_z`=702.182, `orientation`=2.2058 WHERE `guid`=41447; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7417.36, `position_y`=-5017.4, `position_z`=725.165, `orientation`=4.5834 WHERE `guid`=41465; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=7549.7, `position_y`=-5017.46, `position_z`=709.079, `orientation`=4.3877 WHERE `guid`=41417; -- Crazed Owlbeast
UPDATE `creature` SET `position_x`=6685.12, `position_y`=-3117.04, `position_z`=577.166, `orientation`=5.71161 WHERE `guid`=41155; -- Shardtooth Bear
UPDATE `creature` SET `position_x`=-8069.91, `position_y`=-1255.74, `position_z`=-332.364, `orientation`=1.83638 WHERE `guid`=24332; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-8080.09, `position_y`=-1278.85, `position_z`=-336.051, `orientation`=1.19437 WHERE `guid`=24317; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-520.808, `position_y`=99.6601, `position_z`=-148.659, `orientation`=1.25664 WHERE `guid`=33609; -- Deep Lurker
UPDATE `creature` SET `id`=5228 WHERE `guid`=33609; -- Saturated Ooze
UPDATE `creature` SET `id2`=8384 WHERE `guid`=33609; -- Deep Lurker
UPDATE `creature` SET `position_x`=360.106, `position_y`=-211.102, `position_z`=-73.7992, `orientation`=0.628319 WHERE `guid`=91057; -- Anvilrage Guardsman
UPDATE `creature` SET `position_x`=-2217.81, `position_y`=-2315.03, `position_z`=93.3408, `orientation`=5.46325 WHERE `guid`=17390; -- Stormsnout
UPDATE `creature` SET `position_x`=5323.93, `position_y`=-555.499, `position_z`=341.461, `orientation`=4.79887 WHERE `guid`=39337; -- Felpaw Scavenger
UPDATE `creature` SET `position_x`=124.691, `position_y`=-68.8523, `position_z`=-33.8562, `orientation`=1.18682 WHERE `guid`=79075; -- Defias Convict
UPDATE `creature` SET `position_x`=-3347.72, `position_y`=-2198.61, `position_z`=44.6631, `orientation`=2.84555 WHERE `guid`=11172; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-3400.14, `position_y`=-2284.15, `position_z`=52.0819, `orientation`=4.9871 WHERE `guid`=9610; -- Dragonmaw Raider
UPDATE `creature` SET `id`=1034 WHERE `guid`=9610; -- Dragonmaw Raider
UPDATE `creature` SET `id2`=1057 WHERE `guid`=9610; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=-10708.7, `position_y`=309.084, `position_z`=40.2243, `orientation`=0.7299 WHERE `guid`=151183; -- Unseen
UPDATE `creature` SET `position_x`=-10715.7, `position_y`=262.004, `position_z`=43.9875, `orientation`=1.85659 WHERE `guid`=151196; -- Unseen
UPDATE `creature` SET `position_x`=-10684, `position_y`=314.524, `position_z`=40.8136, `orientation`=6.03735 WHERE `guid`=151205; -- Unseen
UPDATE `creature` SET `position_x`=-10679.1, `position_y`=309.58, `position_z`=33.6584, `orientation`=5.13082 WHERE `guid`=151204; -- Unseen
UPDATE `creature` SET `position_x`=-10732.4, `position_y`=361.599, `position_z`=37.6422, `orientation`=6.00578 WHERE `guid`=151193; -- Unseen
UPDATE `creature` SET `position_x`=-10732.2, `position_y`=337.197, `position_z`=38.6376, `orientation`=6.17808 WHERE `guid`=4273; -- Jitters (WAYPOINTS)
UPDATE `creature` SET `position_x`=-10698.2, `position_y`=347.275, `position_z`=39.8053, `orientation`=2.49341 WHERE `guid`=151194; -- Unseen
UPDATE `creature` SET `position_x`=-10705.2, `position_y`=357.762, `position_z`=39.8067, `orientation`=4.33199 WHERE `guid`=151182; -- Unseen
UPDATE `creature` SET `position_x`=4352.83, `position_y`=-6916.4, `position_z`=102.154, `orientation`=3.735 WHERE `guid`=35856; -- Forest Ooze
UPDATE `creature` SET `position_x`=4285.68, `position_y`=-6854.62, `position_z`=95.2273, `orientation`=1.01431 WHERE `guid`=35851; -- Forest Ooze
UPDATE `creature` SET `position_x`=-11011.3, `position_y`=-351.124, `position_z`=43.1651, `orientation`=2.75826 WHERE `guid`=6057; -- Black Rat
UPDATE `creature` SET `position_x`=-10949.1, `position_y`=-1319.16, `position_z`=52.5235, `orientation`=4.97419 WHERE `guid`=5988; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10498.5, `position_y`=211.704, `position_z`=32.6644, `orientation`=3.83972 WHERE `guid`=5040; -- Skeletal Fiend
UPDATE `creature` SET `id`=202 WHERE `guid`=5040; -- Skeletal Horror
UPDATE `creature` SET `id2`=531 WHERE `guid`=5040; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10753.5, `position_y`=-1304.63, `position_z`=49.3843, `orientation`=0.785398 WHERE `guid`=5932; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10423.3, `position_y`=187.594, `position_z`=36.6918, `orientation`=5.69496 WHERE `guid`=4968; -- Flesh Eater
UPDATE `creature` SET `position_x`=-10783.4, `position_y`=-1343.68, `position_z`=38.1605, `orientation`=4.95674 WHERE `guid`=5931; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10420.6, `position_y`=141.854, `position_z`=36.1857, `orientation`=5.79449 WHERE `guid`=5044; -- Flesh Eater
UPDATE `creature` SET `position_x`=-10337.1, `position_y`=136.644, `position_z`=33.6518, `orientation`=3.64774 WHERE `guid`=4964; -- Flesh Eater
UPDATE `creature` SET `id`=3 WHERE `guid`=4964; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4964; -- Rotted One
UPDATE `creature` SET `position_x`=-10419.2, `position_y`=211.553, `position_z`=34.7431, `orientation`=1.23918 WHERE `guid`=4970; -- Flesh Eater
UPDATE `creature` SET `position_x`=-10330.5, `position_y`=219.545, `position_z`=33.039, `orientation`=4.7822 WHERE `guid`=4984; -- Bone Chewer
UPDATE `creature` SET `id`=210 WHERE `guid`=4984; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=4984; -- Rotted One
UPDATE `creature` SET `position_x`=-10306.2, `position_y`=211.824, `position_z`=34.0608, `orientation`=2.74017 WHERE `guid`=5005; -- Bone Chewer
UPDATE `creature` SET `id`=210 WHERE `guid`=5005; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=5005; -- Rotted One
UPDATE `creature` SET `position_x`=-10624.6, `position_y`=-1194.09, `position_z`=27.976, `orientation`=0 WHERE `guid`=5941; -- Watcher Jordan (WAYPOINTS)
UPDATE `creature` SET `position_x`=-10804.8, `position_y`=-1334.82, `position_z`=37.4546, `orientation`=1.23874 WHERE `guid`=5164; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10824.7, `position_y`=-1356.5, `position_z`=44.5021, `orientation`=5.70439 WHERE `guid`=4457; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10467.4, `position_y`=176.672, `position_z`=33.4991, `orientation`=4.18879 WHERE `guid`=5043; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10906.5, `position_y`=-1318.58, `position_z`=53.325, `orientation`=1.85005 WHERE `guid`=6000; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-10384.6, `position_y`=233.471, `position_z`=33.8048, `orientation`=2.60054 WHERE `guid`=5004; -- Flesh Eater
UPDATE `creature` SET `id`=3 WHERE `guid`=5004; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=5004; -- Rotted One
UPDATE `creature` SET `position_x`=-10360, `position_y`=226.598, `position_z`=32.7722, `orientation`=0.785398 WHERE `guid`=4440; -- Bone Chewer
UPDATE `creature` SET `id`=210 WHERE `guid`=4440; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=4440; -- Rotted One
UPDATE `creature` SET `position_x`=-10759.2, `position_y`=-1360.1, `position_z`=38.8878, `orientation`=2.67035 WHERE `guid`=5933; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10490.3, `position_y`=229.969, `position_z`=32.8983, `orientation`=0.785398 WHERE `guid`=5039; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10810.3, `position_y`=-1370.43, `position_z`=41.809, `orientation`=1.25664 WHERE `guid`=4454; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10568.8, `position_y`=270.533, `position_z`=30.4897, `orientation`=3.97935 WHERE `guid`=5942; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10581.9, `position_y`=361.838, `position_z`=29.7072, `orientation`=3.7001 WHERE `guid`=4927; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10790.3, `position_y`=-1307.06, `position_z`=35.6678, `orientation`=0.471239 WHERE `guid`=5162; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10385.9, `position_y`=255.907, `position_z`=34.2449, `orientation`=3.85718 WHERE `guid`=5001; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=5001; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=5001; -- Rotted One
UPDATE `creature` SET `position_x`=-10732.6, `position_y`=-1355.09, `position_z`=38.677, `orientation`=2.6529 WHERE `guid`=4455; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10483.3, `position_y`=202.921, `position_z`=31.3278, `orientation`=2.33874 WHERE `guid`=5041; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10495.2, `position_y`=255.979, `position_z`=30.9044, `orientation`=0.296706 WHERE `guid`=5178; -- Skeletal Horror
UPDATE `creature` SET `id`=202 WHERE `guid`=5178; -- Skeletal Horror
UPDATE `creature` SET `id2`=531 WHERE `guid`=5178; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10782, `position_y`=-923.754, `position_z`=54.3343, `orientation`=2.05486 WHERE `guid`=4352; -- Black Rat
UPDATE `creature` SET `position_x`=-10497.5, `position_y`=175.299, `position_z`=33.9611, `orientation`=1.53589 WHERE `guid`=5042; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10740.9, `position_y`=-1381.45, `position_z`=36.6516, `orientation`=5.72468 WHERE `guid`=4456; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10360.9, `position_y`=247.389, `position_z`=36.0323, `orientation`=4.37873 WHERE `guid`=4439; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=4439; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4439; -- Rotted One
UPDATE `creature` SET `position_x`=-10444.5, `position_y`=222.343, `position_z`=31.9356, `orientation`=5.75959 WHERE `guid`=4973; -- Skeletal Fiend
UPDATE `creature` SET `id`=202 WHERE `guid`=4973; -- Skeletal Horror
UPDATE `creature` SET `id2`=531 WHERE `guid`=4973; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-120.014, `position_y`=1218.57, `position_z`=93.9678, `orientation`=5.79946 WHERE `guid`=28162; -- Scorpashi Snapper
UPDATE `creature` SET `id`=4696 WHERE `guid`=28162; -- Scorpashi Snapper
UPDATE `creature` SET `id2`=4728 WHERE `guid`=28162; -- Gritjaw Basilisk
UPDATE `creature` SET `position_x`=-10362.4, `position_y`=182.08, `position_z`=33.9547, `orientation`=5.03155 WHERE `guid`=5975; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10401.3, `position_y`=189.193, `position_z`=34.9644, `orientation`=3.08923 WHERE `guid`=4981; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=4981; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4981; -- Rotted One
UPDATE `creature` SET `position_x`=-10385.8, `position_y`=177.338, `position_z`=35.102, `orientation`=0 WHERE `guid`=4990; -- Bone Chewer
UPDATE `creature` SET `id`=210 WHERE `guid`=4990; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=4990; -- Rotted One
UPDATE `creature` SET `position_x`=-10365.6, `position_y`=133.841, `position_z`=1.74415, `orientation`=0.174533 WHERE `guid`=4986; -- Brain Eater
UPDATE `creature` SET `position_x`=-10333.7, `position_y`=242.446, `position_z`=34.1223, `orientation`=3.03687 WHERE `guid`=4978; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=4978; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4978; -- Rotted One
UPDATE `creature` SET `position_x`=-10339.6, `position_y`=156.98, `position_z`=5.89841, `orientation`=5.74213 WHERE `guid`=5980; -- Brain Eater
UPDATE `creature` SET `position_x`=-10311.1, `position_y`=239.881, `position_z`=34.9396, `orientation`=6.15823 WHERE `guid`=4988; -- Flesh Eater
UPDATE `creature` SET `id`=3 WHERE `guid`=4988; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4988; -- Rotted One
UPDATE `creature` SET `position_x`=-86.4952, `position_y`=1116.87, `position_z`=92.0314, `orientation`=4.04187 WHERE `guid`=28215; -- Scorpashi Snapper
UPDATE `creature` SET `position_x`=-3306.08, `position_y`=-956.736, `position_z`=9.32941, `orientation`=5.31168 WHERE `guid`=10913; -- Bluegill Murloc
UPDATE `creature` SET `position_x`=-154.03, `position_y`=1108.77, `position_z`=85.2402, `orientation`=2.6136 WHERE `guid`=28037; -- Dread Swoop
UPDATE `creature` SET `position_x`=-10395, `position_y`=149.91, `position_z`=35.4997, `orientation`=2.02458 WHERE `guid`=6099; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=6099; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=6099; -- Rotted One
UPDATE `creature` SET `position_x`=-10407.8, `position_y`=160.078, `position_z`=35.3744, `orientation`=4.04916 WHERE `guid`=4961; -- Flesh Eater
UPDATE `creature` SET `id`=3 WHERE `guid`=4961; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4961; -- Rotted One
UPDATE `creature` SET `position_x`=-10344.2, `position_y`=203.699, `position_z`=35.1682, `orientation`=1.11701 WHERE `guid`=5977; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10987, `position_y`=-1148.74, `position_z`=40.2711, `orientation`=0.785398 WHERE `guid`=6082; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-10333, `position_y`=121.279, `position_z`=3.0352, `orientation`=3.7001 WHERE `guid`=5983; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10330.4, `position_y`=161.375, `position_z`=36.6788, `orientation`=5.07891 WHERE `guid`=6094; -- Rotted One
UPDATE `creature` SET `id`=210 WHERE `guid`=6094; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=6094; -- Rotted One
UPDATE `creature` SET `position_x`=-10362.4, `position_y`=204.227, `position_z`=34.2575, `orientation`=3.76991 WHERE `guid`=5978; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10335.7, `position_y`=138.453, `position_z`=4.16865, `orientation`=3.28122 WHERE `guid`=5981; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10951.9, `position_y`=-1118.15, `position_z`=39.0945, `orientation`=0.994838 WHERE `guid`=6084; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-10329.7, `position_y`=193.229, `position_z`=34.4206, `orientation`=3.35103 WHERE `guid`=4979; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10407.6, `position_y`=243.006, `position_z`=35.7544, `orientation`=4.34587 WHERE `guid`=5003; -- Flesh Eater
UPDATE `creature` SET `position_x`=-10364.5, `position_y`=156.128, `position_z`=35.6775, `orientation`=3.57792 WHERE `guid`=6098; -- Bone Chewer
UPDATE `creature` SET `id`=210 WHERE `guid`=6098; -- Bone Chewer
UPDATE `creature` SET `id2`=948 WHERE `guid`=6098; -- Rotted One
UPDATE `creature` SET `position_x`=-10341.7, `position_y`=172.289, `position_z`=15.684, `orientation`=0.15708 WHERE `guid`=5979; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10374, `position_y`=193.866, `position_z`=34.0884, `orientation`=6.22527 WHERE `guid`=5976; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10331.9, `position_y`=108.032, `position_z`=1.74415, `orientation`=1.22173 WHERE `guid`=4987; -- Brain Eater
UPDATE `creature` SET `position_x`=-10317.1, `position_y`=135.792, `position_z`=39.8942, `orientation`=1.20428 WHERE `guid`=4965; -- Rotted One
UPDATE `creature` SET `id`=3 WHERE `guid`=4965; -- Flesh Eater
UPDATE `creature` SET `id2`=948 WHERE `guid`=4965; -- Rotted One
UPDATE `creature` SET `position_x`=-10321.1, `position_y`=139.615, `position_z`=1.86389, `orientation`=1.65806 WHERE `guid`=5982; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10549.8, `position_y`=278.043, `position_z`=28.7183, `orientation`=0 WHERE `guid`=5958; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10268.6, `position_y`=147.779, `position_z`=0.961871, `orientation`=6.23083 WHERE `guid`=5971; -- Plague Spreader
UPDATE `creature` SET `id`=570 WHERE `guid`=5971; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=5971; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10253.1, `position_y`=160, `position_z`=0.129943, `orientation`=4.66003 WHERE `guid`=4992; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4992; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4992; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10254.3, `position_y`=256.023, `position_z`=0.914357, `orientation`=4.13643 WHERE `guid`=4395; -- Brain Eater
UPDATE `creature` SET `position_x`=-10216.5, `position_y`=315.674, `position_z`=36.3187, `orientation`=4.67336 WHERE `guid`=5893; -- Rabid Dire Wolf
UPDATE `creature` SET `position_x`=-718.854, `position_y`=-756.212, `position_z`=12.8243, `orientation`=0.590214 WHERE `guid`=15629; -- Elder Moss Creeper
UPDATE `creature` SET `position_x`=-1898.7, `position_y`=987.711, `position_z`=90.7055, `orientation`=1.68502 WHERE `guid`=27126; -- Magram Marauder
UPDATE `creature` SET `position_x`=-2817.45, `position_y`=-993.282, `position_z`=-8.91584, `orientation`=1.24406 WHERE `guid`=9926; -- Cursed Marine
UPDATE `creature` SET `position_x`=-2795.3, `position_y`=-1008.76, `position_z`=-4.7156, `orientation`=4.51109 WHERE `guid`=9925; -- Cursed Marine
UPDATE `creature` SET `position_x`=-2808.62, `position_y`=-979.485, `position_z`=-8.4262, `orientation`=6.15809 WHERE `guid`=10224; -- Cursed Marine
UPDATE `creature` SET `position_x`=-10887.7, `position_y`=-482.976, `position_z`=50.5775, `orientation`=2.63593 WHERE `guid`=4881; -- Young Black Ravager
UPDATE `creature` SET `position_x`=-184.296, `position_y`=670.02, `position_z`=91.4187, `orientation`=4.20731 WHERE `guid`=27855; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-183.399, `position_y`=717.899, `position_z`=91.1696, `orientation`=2.67318 WHERE `guid`=27780; -- Hatefury Rogue
UPDATE `creature` SET `position_x`=-176.952, `position_y`=665.209, `position_z`=91.4187, `orientation`=0.761246 WHERE `guid`=27841; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-317.399, `position_y`=718.657, `position_z`=88.9788, `orientation`=1.98385 WHERE `guid`=27840; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-385.856, `position_y`=852.294, `position_z`=91.1764, `orientation`=6.19592 WHERE `guid`=27824; -- Hatefury Rogue
UPDATE `creature` SET `position_x`=-347.586, `position_y`=813.831, `position_z`=94.9436, `orientation`=6.19902 WHERE `guid`=27852; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=-3100.18, `position_y`=-1890.86, `position_z`=9.47903, `orientation`=3.01942 WHERE `guid`=10674; -- Mosshide Trapper
UPDATE `creature` SET `position_x`=-10327.2, `position_y`=-1303.18, `position_z`=42.9789, `orientation`=0.729304 WHERE `guid`=4316; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-10270.2, `position_y`=-1234.32, `position_z`=36.0703, `orientation`=5.5156 WHERE `guid`=6092; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-346.118, `position_y`=833.033, `position_z`=97.1611, `orientation`=5.5676 WHERE `guid`=27854; -- Hatefury Betrayer
UPDATE `creature` SET `position_x`=2483.44, `position_y`=1518.42, `position_z`=264.56, `orientation`=0.519073 WHERE `guid`=32253; -- Son of Cenarius
UPDATE `creature` SET `position_x`=-10317, `position_y`=469.688, `position_z`=15.9101, `orientation`=4.08407 WHERE `guid`=4340; -- Skeletal Warder
UPDATE `creature` SET `position_x`=-10368.2, `position_y`=473.547, `position_z`=25.0862, `orientation`=1.8675 WHERE `guid`=4983; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-10344.1, `position_y`=-1277.94, `position_z`=35.4849, `orientation`=2.75692 WHERE `guid`=4829; -- Fetid Corpse
UPDATE `creature` SET `position_x`=-10315.2, `position_y`=372.345, `position_z`=65.3517, `orientation`=2.26893 WHERE `guid`=4801; -- Brain Eater
UPDATE `creature` SET `position_x`=-10321.9, `position_y`=376.283, `position_z`=65.3515, `orientation`=5.55015 WHERE `guid`=4803; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-10231.9, `position_y`=238.149, `position_z`=31.1267, `orientation`=3.31613 WHERE `guid`=5895; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-10368.7, `position_y`=-1254.95, `position_z`=35.9922, `orientation`=1.02886 WHERE `guid`=5010; -- Stalvan Mistmantle
UPDATE `creature` SET `position_x`=-3309, `position_y`=-2245.16, `position_z`=54.0832, `orientation`=0.488692 WHERE `guid`=10919; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-3454.33, `position_y`=-2364.75, `position_z`=51.9819, `orientation`=1.09956 WHERE `guid`=10543; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=-414.912, `position_y`=1051.45, `position_z`=91.0663, `orientation`=3.61647 WHERE `guid`=28151; -- Scorpashi Snapper
UPDATE `creature` SET `position_x`=-3483.51, `position_y`=-2450.07, `position_z`=46.5624, `orientation`=0.605204 WHERE `guid`=10758; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-182.698, `position_y`=982.791, `position_z`=90.7575, `orientation`=5.10943 WHERE `guid`=27819; -- Hatefury Rogue
UPDATE `creature` SET `position_x`=-3407.31, `position_y`=-2296.21, `position_z`=52.1129, `orientation`=4.95476 WHERE `guid`=9627; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=-3327.28, `position_y`=-2266.09, `position_z`=51.9917, `orientation`=4.32842 WHERE `guid`=9737; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-3318.9, `position_y`=-2276.81, `position_z`=51.9819, `orientation`=1.41375 WHERE `guid`=9739; -- Dragonmaw Bonewarder
UPDATE `creature` SET `position_x`=-548.93, `position_y`=850.786, `position_z`=91.0162, `orientation`=1.89252 WHERE `guid`=28155; -- Scorpashi Snapper
UPDATE `creature` SET `position_x`=-517.837, `position_y`=951.138, `position_z`=90.0144, `orientation`=5.73453 WHERE `guid`=28153; -- Scorpashi Snapper
UPDATE `creature` SET `position_x`=-10388.4, `position_y`=377.992, `position_z`=47.1131, `orientation`=0.788104 WHERE `guid`=4991; -- Skeletal Healer
UPDATE `creature` SET `position_x`=-10388.6, `position_y`=368.54, `position_z`=24.4756, `orientation`=1.62172 WHERE `guid`=4452; -- Skeletal Warder
UPDATE `creature` SET `position_x`=-10355.2, `position_y`=362.976, `position_z`=16.057, `orientation`=0.287936 WHERE `guid`=4337; -- Skeletal Warder
UPDATE `creature` SET `position_x`=-10317, `position_y`=363.339, `position_z`=65.3547, `orientation`=3.49066 WHERE `guid`=5052; -- Skeletal Raider
UPDATE `creature` SET `position_x`=-552.357, `position_y`=814.876, `position_z`=90.6246, `orientation`=5.31622 WHERE `guid`=28036; -- Dread Swoop
UPDATE `creature` SET `position_x`=-10225.8, `position_y`=484.6, `position_z`=29.947, `orientation`=2.51327 WHERE `guid`=5894; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-10349.9, `position_y`=135.403, `position_z`=3.62789, `orientation`=4.04916 WHERE `guid`=5970; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10235.3, `position_y`=146.804, `position_z`=1.76787, `orientation`=1.32645 WHERE `guid`=4898; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4898; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4898; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10223.8, `position_y`=226.666, `position_z`=2.88275, `orientation`=5.44543 WHERE `guid`=4397; -- Plague Spreader
UPDATE `creature` SET `id`=570 WHERE `guid`=4397; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4397; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10235.5, `position_y`=174.175, `position_z`=0.288609, `orientation`=5.42797 WHERE `guid`=4989; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4989; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4989; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10267.5, `position_y`=170.402, `position_z`=0.549451, `orientation`=0.10472 WHERE `guid`=4386; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4386; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4386; -- Plague Spreader
UPDATE `creature` SET `position_x`=-10557.5, `position_y`=212.589, `position_z`=30.6497, `orientation`=5.18363 WHERE `guid`=4946; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10508.7, `position_y`=191.289, `position_z`=31.6327, `orientation`=0.994838 WHERE `guid`=5038; -- Skeletal Fiend
UPDATE `creature` SET `position_x`=-10584.5, `position_y`=277.426, `position_z`=32.2524, `orientation`=2.14675 WHERE `guid`=5959; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10956.3, `position_y`=-1148.11, `position_z`=39.1443, `orientation`=5.27089 WHERE `guid`=4892; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-10980.7, `position_y`=-1119.14, `position_z`=38.7934, `orientation`=4.62512 WHERE `guid`=6083; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-11015.6, `position_y`=-1134.63, `position_z`=39.0391, `orientation`=0.296706 WHERE `guid`=5021; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-2800.13, `position_y`=-2850.11, `position_z`=42.4489, `orientation`=3.07759 WHERE `guid`=11196; -- Dark Iron Dwarf
UPDATE `creature` SET `position_x`=-2822.17, `position_y`=-2868.12, `position_z`=32.8621, `orientation`=3.80482 WHERE `guid`=9710; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-2827.15, `position_y`=-2875.44, `position_z`=32.8621, `orientation`=1.01229 WHERE `guid`=9711; -- Dark Iron Tunneler
UPDATE `creature` SET `position_x`=-10182, `position_y`=217.299, `position_z`=23.8248, `orientation`=1.95477 WHERE `guid`=5913; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-10580.5, `position_y`=226.267, `position_z`=32.6945, `orientation`=0.802851 WHERE `guid`=4945; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10212, `position_y`=183.414, `position_z`=1.75613, `orientation`=5.82408 WHERE `guid`=4387; -- Plague Spreader
UPDATE `creature` SET `id`=570 WHERE `guid`=4387; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4387; -- Plague Spreader
UPDATE `creature` SET `position_x`=-2792.95, `position_y`=-1024.5, `position_z`=-2.56807, `orientation`=0.523599 WHERE `guid`=9890; -- Cursed Marine
UPDATE `creature` SET `position_x`=-10183.5, `position_y`=149.922, `position_z`=27.0197, `orientation`=3.68264 WHERE `guid`=5926; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-10875.2, `position_y`=-293.261, `position_z`=37.622, `orientation`=2.56951 WHERE `guid`=6056; -- Black Rat
UPDATE `creature` SET `position_x`=-2899.23, `position_y`=-2933.42, `position_z`=33.9273, `orientation`=3.03542 WHERE `guid`=10040; -- Dark Iron Tunneler
UPDATE `creature` SET `position_x`=-10206.8, `position_y`=149.882, `position_z`=1.94151, `orientation`=5.8294 WHERE `guid`=4391; -- Brain Eater
UPDATE `creature` SET `position_x`=-10548.2, `position_y`=444.163, `position_z`=38.0008, `orientation`=2.02458 WHERE `guid`=5139; -- Skeletal Horror
UPDATE `creature` SET `position_x`=-10222.4, `position_y`=206.991, `position_z`=2.88773, `orientation`=5.70723 WHERE `guid`=4394; -- Plague Spreader (WAYPOINTS)
UPDATE `creature` SET `position_x`=-2941.2, `position_y`=-3006.66, `position_z`=39.617, `orientation`=5.47878 WHERE `guid`=10025; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-2085.28, `position_y`=1349.24, `position_z`=84.9895, `orientation`=3.49114 WHERE `guid`=27187; -- Undead Ravager
UPDATE `creature` SET `position_x`=-2879.58, `position_y`=-2953.58, `position_z`=33.8879, `orientation`=1.32633 WHERE `guid`=9748; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-10748.8, `position_y`=570.405, `position_z`=31.6069, `orientation`=5.02655 WHERE `guid`=6028; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-2873.01, `position_y`=-2958.33, `position_z`=33.8879, `orientation`=1.48353 WHERE `guid`=9749; -- Dark Iron Demolitionist
UPDATE `creature` SET `position_x`=-2880.25, `position_y`=-2946.53, `position_z`=34.4616, `orientation`=4.62512 WHERE `guid`=9750; -- Dark Iron Demolitionist
UPDATE `creature` SET `position_x`=-2187.11, `position_y`=1350.41, `position_z`=73.7777, `orientation`=1.1166 WHERE `guid`=27188; -- Undead Ravager
UPDATE `creature` SET `position_x`=-10952.6, `position_y`=516.917, `position_z`=37.4896, `orientation`=2.49582 WHERE `guid`=4423; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-10683.2, `position_y`=571.519, `position_z`=28.7237, `orientation`=2.86234 WHERE `guid`=6027; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-1020.8, `position_y`=-648.799, `position_z`=-2.86444, `orientation`=4.93545 WHERE `guid`=16012; -- Daggerspine Shorehunter
UPDATE `creature` SET `position_x`=-27.3595, `position_y`=-561.716, `position_z`=151.406, `orientation`=3.26293 WHERE `guid`=17382; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-1984.37, `position_y`=1350.6, `position_z`=63.9808, `orientation`=1.03429 WHERE `guid`=27194; -- Undead Ravager
UPDATE `creature` SET `position_x`=-2809.8, `position_y`=-1248.01, `position_z`=6.4406, `orientation`=5.20108 WHERE `guid`=11102; -- Giant Wetlands Crocolisk
UPDATE `creature` SET `position_x`=-10549.5, `position_y`=589.639, `position_z`=31.9616, `orientation`=2.14675 WHERE `guid`=6054; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-10452.2, `position_y`=617.778, `position_z`=24.6728, `orientation`=2.79253 WHERE `guid`=6023; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-14158.7, `position_y`=429.696, `position_z`=11.5538, `orientation`=1.32339 WHERE `guid`=2572; -- Bloodsail Raider
UPDATE `creature` SET `position_x`=-2637.02, `position_y`=-2391.12, `position_z`=90.0338, `orientation`=2.6529 WHERE `guid`=10484; -- Dark Iron Dwarf
UPDATE `creature` SET `position_x`=-583.259, `position_y`=2083.26, `position_z`=90.263, `orientation`=2.37629 WHERE `guid`=28793; -- Raging Thunder Lizard
UPDATE `creature` SET `id`=4726 WHERE `guid`=28793; -- Raging Thunder Lizard
UPDATE `creature` SET `id2`=11576 WHERE `guid`=28793; -- Whirlwind Ripper
UPDATE `creature` SET `position_x`=-2600.38, `position_y`=-2326.58, `position_z`=86.9726, `orientation`=5.3072 WHERE `guid`=10629; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-2650.27, `position_y`=-1349.32, `position_z`=-13.4532, `orientation`=1.0813 WHERE `guid`=9481; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-2618.31, `position_y`=-2341.55, `position_z`=80.394, `orientation`=3.67134 WHERE `guid`=10487; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-10201.9, `position_y`=237.82, `position_z`=0.914358, `orientation`=0.401426 WHERE `guid`=4398; -- Brain Eater
UPDATE `creature` SET `position_x`=-2645.93, `position_y`=-2379.02, `position_z`=90.7725, `orientation`=3.27984 WHERE `guid`=10257; -- Dark Iron Saboteur
UPDATE `creature` SET `position_x`=-10208.4, `position_y`=287.371, `position_z`=1.98543, `orientation`=5.20108 WHERE `guid`=4405; -- Brain Eater
UPDATE `creature` SET `position_x`=-10256.4, `position_y`=279.425, `position_z`=0.89841, `orientation`=1.85005 WHERE `guid`=4400; -- Brain Eater
UPDATE `creature` SET `position_x`=-2187.88, `position_y`=1547.07, `position_z`=73.7871, `orientation`=4.70493 WHERE `guid`=27172; -- Undead Ravager
UPDATE `creature` SET `position_x`=-10156.1, `position_y`=-18.1878, `position_z`=26.98, `orientation`=0.942478 WHERE `guid`=5142; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-10186.2, `position_y`=-116.417, `position_z`=28.6522, `orientation`=4.18879 WHERE `guid`=5147; -- Rabid Dire Wolf
UPDATE `creature` SET `position_x`=-3945.55, `position_y`=-901.374, `position_z`=1.24047, `orientation`=1.51844 WHERE `guid`=10875; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3947.8, `position_y`=-851.594, `position_z`=-15.7364, `orientation`=6.23083 WHERE `guid`=10879; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3921.76, `position_y`=-875.774, `position_z`=1.0146, `orientation`=0.191986 WHERE `guid`=10882; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3915.26, `position_y`=-949.209, `position_z`=7.63746, `orientation`=1.6057 WHERE `guid`=10896; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3920.79, `position_y`=-911.349, `position_z`=-3.26268, `orientation`=4.62512 WHERE `guid`=10876; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3899.83, `position_y`=-932.95, `position_z`=-10.2151, `orientation`=3.28122 WHERE `guid`=10890; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4049.76, `position_y`=-783.394, `position_z`=-12.95, `orientation`=0.715585 WHERE `guid`=10895; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3981.7, `position_y`=-816.994, `position_z`=-14.5911, `orientation`=2.40855 WHERE `guid`=10878; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-10053, `position_y`=-250.451, `position_z`=27.8287, `orientation`=0.698132 WHERE `guid`=5131; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-8679.01, `position_y`=450.028, `position_z`=99.7432, `orientation`=1.82586 WHERE `guid`=79742; -- Rat
UPDATE `creature` SET `position_x`=-4117.65, `position_y`=-781.83, `position_z`=-5.65594, `orientation`=3.76991 WHERE `guid`=10899; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4147.31, `position_y`=-781.794, `position_z`=-0.879038, `orientation`=5.77704 WHERE `guid`=10897; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4047.88, `position_y`=-748.886, `position_z`=-13.3935, `orientation`=0.139626 WHERE `guid`=10905; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-483.207, `position_y`=2748.93, `position_z`=-29.5406, `orientation`=2.31334 WHERE `guid`=27274; -- Drysnap Pincer
UPDATE `creature` SET `position_x`=-4085.62, `position_y`=-747.712, `position_z`=-15.0888, `orientation`=5.84685 WHERE `guid`=10901; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-4116.28, `position_y`=-845.925, `position_z`=15.1981, `orientation`=1.32645 WHERE `guid`=10892; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-3982.19, `position_y`=-900.959, `position_z`=9.30408, `orientation`=1.16937 WHERE `guid`=10894; -- Bluegill Raider
UPDATE `creature` SET `position_x`=-10052.4, `position_y`=-1049.91, `position_z`=29.0167, `orientation`=1.5708 WHERE `guid`=4350; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-1750.3, `position_y`=1053.38, `position_z`=91.6291, `orientation`=4.13837 WHERE `guid`=27080; -- Magram Wrangler
UPDATE `creature` SET `id`=4640 WHERE `guid`=27080; -- Magram Wrangler
UPDATE `creature` SET `id2`=4641 WHERE `guid`=27080; -- Magram Windchaser
UPDATE `creature` SET `id3`=4642 WHERE `guid`=27080; -- Magram Stormer
UPDATE `creature` SET `position_x`=-1715.11, `position_y`=1086.13, `position_z`=91.7601, `orientation`=3.52471 WHERE `guid`=27111; -- Magram Stormer
UPDATE `creature` SET `position_x`=-1416.8, `position_y`=-1050.32, `position_z`=1.14022, `orientation`=2.40512 WHERE `guid`=15385; -- Daggerspine Shorestalker
UPDATE `creature` SET `position_x`=-1615.74, `position_y`=1082.42, `position_z`=89.0103, `orientation`=3.7296 WHERE `guid`=27059; -- Magram Scout (WAYPOINTS)
UPDATE `creature` SET `position_x`=-1783.05, `position_y`=1083.8, `position_z`=90.158, `orientation`=4.0316 WHERE `guid`=27109; -- Magram Stormer
UPDATE `creature` SET `id`=4640 WHERE `guid`=27109; -- Magram Wrangler
UPDATE `creature` SET `id2`=4642 WHERE `guid`=27109; -- Magram Stormer
UPDATE `creature` SET `position_x`=-1750.67, `position_y`=1116.19, `position_z`=88.4642, `orientation`=1.53941 WHERE `guid`=27081; -- Magram Wrangler
UPDATE `creature` SET `id`=4640 WHERE `guid`=27081; -- Magram Wrangler
UPDATE `creature` SET `id2`=4641 WHERE `guid`=27081; -- Magram Windchaser
UPDATE `creature` SET `id3`=4642 WHERE `guid`=27081; -- Magram Stormer
UPDATE `creature` SET `position_x`=-1782.11, `position_y`=1151.23, `position_z`=90.683, `orientation`=5.06145 WHERE `guid`=27110; -- Magram Stormer
UPDATE `creature` SET `position_x`=-2817.57, `position_y`=-2881.88, `position_z`=32.8621, `orientation`=2.04204 WHERE `guid`=9628; -- Dark Iron Tunneler
UPDATE `creature` SET `position_x`=-1586.54, `position_y`=849.782, `position_z`=113.206, `orientation`=2.21657 WHERE `guid`=29111; -- Warug's Bodyguard
UPDATE `creature` SET `position_x`=-2819.34, `position_y`=-2875.17, `position_z`=32.8621, `orientation`=3.10669 WHERE `guid`=9712; -- Dark Iron Demolitionist
UPDATE `creature` SET `position_x`=-1588.33, `position_y`=845.964, `position_z`=114.366, `orientation`=2.42111 WHERE `guid`=29110; -- Warug's Bodyguard
UPDATE `creature` SET `position_x`=-10230, `position_y`=266.051, `position_z`=2.88275, `orientation`=3.49066 WHERE `guid`=4392; -- Brain Eater
UPDATE `creature` SET `id`=570 WHERE `guid`=4392; -- Brain Eater
UPDATE `creature` SET `id2`=604 WHERE `guid`=4392; -- Plague Spreader
UPDATE `creature` SET `position_x`=-1850.41, `position_y`=1085.8, `position_z`=91.1086, `orientation`=5.25344 WHERE `guid`=27112; -- Magram Stormer
UPDATE `creature` SET `id`=4640 WHERE `guid`=27112; -- Magram Wrangler
UPDATE `creature` SET `id2`=4641 WHERE `guid`=27112; -- Magram Windchaser
UPDATE `creature` SET `id3`=4642 WHERE `guid`=27112; -- Magram Stormer
UPDATE `creature` SET `position_x`=-1651.62, `position_y`=1114.01, `position_z`=90.4794, `orientation`=0.118861 WHERE `guid`=27096; -- Magram Wrangler
UPDATE `creature` SET `position_x`=-10611.1, `position_y`=576.274, `position_z`=30.0674, `orientation`=4.27606 WHERE `guid`=6053; -- Pygmy Venom Web Spider
UPDATE `creature` SET `position_x`=-10788.3, `position_y`=-107.454, `position_z`=35.0451, `orientation`=1.18526 WHERE `guid`=5034; -- Black Widow Hatchling
UPDATE `creature` SET `position_x`=-1800.07, `position_y`=1041.88, `position_z`=92.8703, `orientation`=3.69123 WHERE `guid`=27128; -- Magram Marauder
UPDATE `creature` SET `position_x`=-1800.94, `position_y`=1061.32, `position_z`=91.5765, `orientation`=4.41693 WHERE `guid`=27120; -- Magram Marauder
UPDATE `creature` SET `position_x`=-1878.84, `position_y`=1115.92, `position_z`=92.3497, `orientation`=5.60723 WHERE `guid`=27124; -- Magram Marauder
UPDATE `creature` SET `position_x`=-1897.06, `position_y`=1100.38, `position_z`=92.667, `orientation`=5.98697 WHERE `guid`=27125; -- Magram Marauder
UPDATE `creature` SET `position_x`=-816.161, `position_y`=-616.04, `position_z`=13.8808, `orientation`=6.05449 WHERE `guid`=14896; -- Chicken
UPDATE `creature` SET `position_x`=-10389.1, `position_y`=1115.92, `position_z`=40.0474, `orientation`=5.59066 WHERE `guid`=52590; -- Young Goretusk
UPDATE `creature` SET `position_x`=-749.909, `position_y`=-1969.21, `position_z`=34.7174, `orientation`=2.88588 WHERE `guid`=11612; -- Syndicate Highwayman
UPDATE `creature` SET `position_x`=-1032.81, `position_y`=-338.949, `position_z`=3.51101, `orientation`=5.73175 WHERE `guid`=16121; -- Torn Fin Tidehunter
UPDATE `creature` SET `position_x`=-1852.81, `position_y`=-3068.69, `position_z`=60.1853, `orientation`=3.71664 WHERE `guid`=14733; -- Witherbark Axe Thrower
UPDATE `creature` SET `position_x`=-1884.93, `position_y`=-3210.95, `position_z`=55.4737, `orientation`=0.628319 WHERE `guid`=13336; -- Witherbark Axe Thrower
UPDATE `creature` SET `position_x`=-1896.07, `position_y`=-3206.18, `position_z`=56.648, `orientation`=6.0311 WHERE `guid`=13317; -- Witherbark Witch Doctor
UPDATE `creature` SET `position_x`=-750.565, `position_y`=1117.24, `position_z`=89.6902, `orientation`=2.82743 WHERE `guid`=27004; -- Kolkar Centaur
UPDATE `creature` SET `id`=4632 WHERE `guid`=27004; -- Kolkar Centaur
UPDATE `creature` SET `id2`=4633 WHERE `guid`=27004; -- Kolkar Scout
UPDATE `creature` SET `id3`=4635 WHERE `guid`=27004; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-882.926, `position_y`=1050.69, `position_z`=91.9367, `orientation`=4.74563 WHERE `guid`=27053; -- Kolkar Windchaser
UPDATE `creature` SET `id`=4634 WHERE `guid`=27053; -- Kolkar Mauler
UPDATE `creature` SET `id2`=4635 WHERE `guid`=27053; -- Kolkar Windchaser
UPDATE `creature` SET `id3`=4636 WHERE `guid`=27053; -- Kolkar Battle Lord
UPDATE `creature` SET `id4`=4637 WHERE `guid`=27053; -- Kolkar Destroyer
UPDATE `creature` SET `position_x`=-983.664, `position_y`=950.303, `position_z`=92.7032, `orientation`=4.5217 WHERE `guid`=27031; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-854.88, `position_y`=1053.47, `position_z`=91.2774, `orientation`=5.3024 WHERE `guid`=27011; -- Kolkar Mauler
UPDATE `creature` SET `position_x`=-10552.7, `position_y`=849.008, `position_z`=44.843, `orientation`=4.8496 WHERE `guid`=89829; -- Greater Fleshripper
UPDATE `creature` SET `position_x`=-1899.96, `position_y`=-3175.24, `position_z`=65.089, `orientation`=1.96816 WHERE `guid`=13309; -- Witherbark Axe Thrower
UPDATE `creature` SET `position_x`=-728.714, `position_y`=20.1432, `position_z`=31.3364, `orientation`=5.31891 WHERE `guid`=15400; -- Giant Moss Creeper
UPDATE `creature` SET `position_x`=-1897.02, `position_y`=-3283.8, `position_z`=67.9788, `orientation`=3.59235 WHERE `guid`=13337; -- Witherbark Witch Doctor
UPDATE `creature` SET `position_x`=-2040.61, `position_y`=-3322.21, `position_z`=58.4934, `orientation`=2.52469 WHERE `guid`=11597; -- Witherbark Headhunter
UPDATE `creature` SET `position_x`=-2022.56, `position_y`=-3350.4, `position_z`=51.1465, `orientation`=0.593412 WHERE `guid`=11406; -- Witherbark Headhunter
UPDATE `creature` SET `position_x`=-2005.3, `position_y`=-3377.94, `position_z`=50.8529, `orientation`=3.49027 WHERE `guid`=11403; -- Witherbark Headhunter
UPDATE `creature` SET `position_x`=-1065.05, `position_y`=1008.55, `position_z`=90.187, `orientation`=3.49814 WHERE `guid`=27035; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-9379.2, `position_y`=56.2764, `position_z`=60.4236, `orientation`=6.0175 WHERE `guid`=80341; -- Young Wolf
UPDATE `creature` SET `position_x`=-9379.75, `position_y`=53.5255, `position_z`=60.4531, `orientation`=3.92311 WHERE `guid`=80342; -- Mangy Wolf
UPDATE `creature` SET `position_x`=-9349.67, `position_y`=52.3593, `position_z`=61.3031, `orientation`=5.53922 WHERE `guid`=80343; -- Young Wolf
UPDATE `creature` SET `position_x`=-1115.89, `position_y`=-350.149, `position_z`=-7.88976, `orientation`=3.68264 WHERE `guid`=15627; -- Torn Fin Oracle
UPDATE `creature` SET `position_x`=-1508.83, `position_y`=1205.67, `position_z`=98.273, `orientation`=2.62142 WHERE `guid`=29163; -- Rat
UPDATE `creature` SET `position_x`=-1564.46, `position_y`=-1909.47, `position_z`=47.421, `orientation`=1.74489 WHERE `guid`=11531; -- Caretaker Alaric
UPDATE `creature` SET `position_x`=-991.202, `position_y`=-783.806, `position_z`=9.18935, `orientation`=1.94303 WHERE `guid`=16006; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-1086.24, `position_y`=-715.721, `position_z`=-4.07477, `orientation`=4.13643 WHERE `guid`=15441; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-1007.8, `position_y`=-809.837, `position_z`=13.7699, `orientation`=3.66576 WHERE `guid`=16007; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-1013.62, `position_y`=-745.016, `position_z`=0.376172, `orientation`=3.39085 WHERE `guid`=16003; -- Daggerspine Siren
UPDATE `creature` SET `position_x`=-10917.4, `position_y`=-1279.73, `position_z`=53.4866, `orientation`=4.95674 WHERE `guid`=6005; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10961.9, `position_y`=-1354.55, `position_z`=51.5476, `orientation`=2.32129 WHERE `guid`=6001; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10993.7, `position_y`=-1311.35, `position_z`=52.7914, `orientation`=1.23918 WHERE `guid`=5992; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-10969.2, `position_y`=-1317.66, `position_z`=52.571, `orientation`=2.7887 WHERE `guid`=5993; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-10981.8, `position_y`=-1344.92, `position_z`=51.6432, `orientation`=5.43241 WHERE `guid`=5987; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-11026.9, `position_y`=-1351.75, `position_z`=52.2896, `orientation`=0 WHERE `guid`=6002; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11031.5, `position_y`=-1288.56, `position_z`=51.5806, `orientation`=5.18363 WHERE `guid`=5997; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-10942.1, `position_y`=-1275.94, `position_z`=53.2989, `orientation`=3.54302 WHERE `guid`=6004; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11054.1, `position_y`=-1315.98, `position_z`=53.8049, `orientation`=0 WHERE `guid`=5996; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11038.2, `position_y`=-1257.51, `position_z`=59.8906, `orientation`=0 WHERE `guid`=4914; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10991.2, `position_y`=-1292.14, `position_z`=53.0934, `orientation`=1.11701 WHERE `guid`=5986; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10978.3, `position_y`=-1244.7, `position_z`=53.1114, `orientation`=5.44543 WHERE `guid`=5985; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-11012.5, `position_y`=-1294.46, `position_z`=53.5674, `orientation`=5.5676 WHERE `guid`=5994; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11076.5, `position_y`=-1275.13, `position_z`=58.9746, `orientation`=1.5708 WHERE `guid`=4895; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11008.4, `position_y`=-1266.49, `position_z`=51.5888, `orientation`=0.733038 WHERE `guid`=5984; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10972.1, `position_y`=-1298.86, `position_z`=53.0686, `orientation`=0 WHERE `guid`=5968; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10940.6, `position_y`=-1248.84, `position_z`=50.9097, `orientation`=3.63028 WHERE `guid`=6003; -- Skeletal Mage
UPDATE `creature` SET `position_x`=-11015.8, `position_y`=-1242.98, `position_z`=60.2757, `orientation`=4.53786 WHERE `guid`=5008; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-11014, `position_y`=-1329.39, `position_z`=52.8005, `orientation`=2.82743 WHERE `guid`=5974; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10919.1, `position_y`=-1342.94, `position_z`=52.9365, `orientation`=1.25664 WHERE `guid`=5999; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-11031, `position_y`=-1317.38, `position_z`=53.492, `orientation`=4.30027 WHERE `guid`=5998; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-10954.4, `position_y`=-1376.45, `position_z`=59.7359, `orientation`=0.594741 WHERE `guid`=5989; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-11046.9, `position_y`=-1347.33, `position_z`=54.6918, `orientation`=0.994838 WHERE `guid`=5995; -- Skeletal Warrior
UPDATE `creature` SET `position_x`=-2143.92, `position_y`=1299.5, `position_z`=63.6714, `orientation`=4.32815 WHERE `guid`=27195; -- Undead Ravager
UPDATE `creature` SET `position_x`=-2943.37, `position_y`=-3188.1, `position_z`=35.9735, `orientation`=1.86734 WHERE `guid`=31314; -- Theramore Infiltrator
UPDATE `creature` SET `position_x`=-2966.29, `position_y`=-3163.08, `position_z`=33.1563, `orientation`=4.45554 WHERE `guid`=31316; -- Theramore Infiltrator
UPDATE `creature` SET `position_x`=-3085.21, `position_y`=-4283.25, `position_z`=-13.1189, `orientation`=4.57128 WHERE `guid`=30694; -- Mudrock Spikeshell
UPDATE `creature` SET `position_x`=-3086.77, `position_y`=-4348.53, `position_z`=1.25081, `orientation`=2.4466 WHERE `guid`=30622; -- Mudrock Spikeshell
UPDATE `creature` SET `position_x`=-8687.27, `position_y`=443.283, `position_z`=99.6748, `orientation`=6.06803 WHERE `guid`=79743; -- Rat
UPDATE `creature` SET `position_x`=-3014.3, `position_y`=-4283.18, `position_z`=0.577838, `orientation`=2.16725 WHERE `guid`=73498; -- Mirefin Warrior
UPDATE `creature` SET `position_x`=-3015.83, `position_y`=-4350.75, `position_z`=7.33702, `orientation`=0.585296 WHERE `guid`=73501; -- Mirefin Warrior
UPDATE `creature` SET `position_x`=-3048.67, `position_y`=-4315.44, `position_z`=8.6753, `orientation`=1.20602 WHERE `guid`=73507; -- Mirefin Warrior
UPDATE `creature` SET `id`=4360 WHERE `guid`=73507; -- Mirefin Warrior
UPDATE `creature` SET `id2`=4361 WHERE `guid`=73507; -- Mirefin Muckdweller
UPDATE `creature` SET `id3`=4363 WHERE `guid`=73507; -- Mirefin Oracle
UPDATE `creature` SET `position_x`=-3051.05, `position_y`=-4355.19, `position_z`=8.27365, `orientation`=3.66864 WHERE `guid`=73513; -- Mirefin Muckdweller
UPDATE `creature` SET `id`=4360 WHERE `guid`=73513; -- Mirefin Warrior
UPDATE `creature` SET `id2`=4361 WHERE `guid`=73513; -- Mirefin Muckdweller
UPDATE `creature` SET `id3`=4362 WHERE `guid`=73513; -- Mirefin Coastrunner
UPDATE `creature` SET `id4`=4363 WHERE `guid`=73513; -- Mirefin Oracle
UPDATE `creature` SET `position_x`=-3014.33, `position_y`=-4315.34, `position_z`=10.9318, `orientation`=3.80338 WHERE `guid`=73510; -- Mirefin Warrior
UPDATE `creature` SET `position_x`=-10475.6, `position_y`=-799.271, `position_z`=53.7164, `orientation`=4.43314 WHERE `guid`=6104; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10458.5, `position_y`=-818.013, `position_z`=50.8164, `orientation`=2.30383 WHERE `guid`=6109; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10453.4, `position_y`=-787.991, `position_z`=53.186, `orientation`=5.13127 WHERE `guid`=6103; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10383.5, `position_y`=-881.366, `position_z`=46.6246, `orientation`=2.25147 WHERE `guid`=6066; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10984.2, `position_y`=-882.881, `position_z`=65.6611, `orientation`=0.715585 WHERE `guid`=4953; -- Nightbane Shadow Weaver
UPDATE `creature` SET `position_x`=-10618.3, `position_y`=-895.108, `position_z`=49.4855, `orientation`=1.58825 WHERE `guid`=6117; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10633.2, `position_y`=-903.478, `position_z`=49.6837, `orientation`=1.5708 WHERE `guid`=6118; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10185.8, `position_y`=82.6921, `position_z`=25.0685, `orientation`=2.3911 WHERE `guid`=5924; -- Starving Dire Wolf
UPDATE `creature` SET `position_x`=-6850.43, `position_y`=-2915.94, `position_z`=8.9601, `orientation`=1.20221 WHERE `guid`=21813; -- Sandfury Hideskinner
UPDATE `creature` SET `position_x`=-6748.69, `position_y`=-1649.86, `position_z`=-273.723, `orientation`=2.04991 WHERE `guid`=24105; -- Tar Beast
UPDATE `creature` SET `position_x`=-12852, `position_y`=-653.683, `position_z`=59.6376, `orientation`=3.21141 WHERE `guid`=1213; -- Skullsplitter Hunter (WAYPOINTS)
UPDATE `creature` SET `position_x`=-6484.37, `position_y`=-1116.66, `position_z`=307.005, `orientation`=2.03188 WHERE `guid`=6219; -- Fire Beetle
UPDATE `creature` SET `position_x`=-6385.19, `position_y`=-1117.57, `position_z`=-269.869, `orientation`=5.27467 WHERE `guid`=24133; -- Tar Lurker
UPDATE `creature` SET `position_x`=-10435.5, `position_y`=-2680.57, `position_z`=22.0334, `orientation`=2.56158 WHERE `guid`=38953; -- Sorrow Spinner
UPDATE `creature` SET `position_x`=-7083.63, `position_y`=-2281.74, `position_z`=-268.364, `orientation`=5.47268 WHERE `guid`=23972; -- Bloodpetal Lasher
UPDATE `creature` SET `position_x`=-10067.7, `position_y`=-3074.07, `position_z`=22.767, `orientation`=3.77435 WHERE `guid`=38810; -- Sorrow Spinner
UPDATE `creature` SET `position_x`=-10098.8, `position_y`=-3138.72, `position_z`=23.4369, `orientation`=1.20389 WHERE `guid`=38809; -- Swamp Jaguar
UPDATE `creature` SET `position_x`=-2719.58, `position_y`=-4259.73, `position_z`=26.753, `orientation`=1.61848 WHERE `guid`=73469; -- Mirefin Coastrunner
UPDATE `creature` SET `position_x`=-2248.34, `position_y`=-2518.18, `position_z`=94.365, `orientation`=5.70725 WHERE `guid`=20248; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-10181.9, `position_y`=-3477.83, `position_z`=22.1819, `orientation`=5.82901 WHERE `guid`=41802; -- Sawtooth Crocolisk
UPDATE `creature` SET `position_x`=-8088.75, `position_y`=-5241.92, `position_z`=2.01137, `orientation`=4.86257 WHERE `guid`=23403; -- Southsea Swashbuckler
UPDATE `creature` SET `position_x`=-9999.8, `position_y`=-3548.54, `position_z`=22.9796, `orientation`=0.667697 WHERE `guid`=38905; -- Lost One Hunter
UPDATE `creature` SET `position_x`=-1815.93, `position_y`=1419.43, `position_z`=61.1945, `orientation`=2.9555 WHERE `guid`=28128; -- Dread Ripper
UPDATE `creature` SET `position_x`=-7848.96, `position_y`=-3217.2, `position_z`=75.4105, `orientation`=2.35596 WHERE `guid`=22219; -- Scorpid Tail Lasher
UPDATE `creature` SET `position_x`=-8278.09, `position_y`=-2863.65, `position_z`=16.535, `orientation`=1.2531 WHERE `guid`=23178; -- Dunemaul Brute
UPDATE `creature` SET `position_x`=-1612.33, `position_y`=-3384.15, `position_z`=34.2912, `orientation`=1.51088 WHERE `guid`=13247; -- Witherbark Witch Doctor
UPDATE `creature` SET `position_x`=-8070.73, `position_y`=-5236.58, `position_z`=2.45676, `orientation`=3.51307 WHERE `guid`=23376; -- Southsea Swashbuckler
UPDATE `creature` SET `position_x`=-8111.12, `position_y`=-5215.16, `position_z`=7.2269, `orientation`=3.88276 WHERE `guid`=23323; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-439.57, `position_y`=186.536, `position_z`=-53.863, `orientation`=4.20624 WHERE `guid`=38074; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-578.453, `position_y`=187.782, `position_z`=-69.3181, `orientation`=0.401426 WHERE `guid`=39770; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-4851.26, `position_y`=-1056.75, `position_z`=502.273, `orientation`=0.0262338 WHERE `guid`=2028; -- Ironforge Guard
UPDATE `creature` SET `position_x`=-6618.02, `position_y`=-1948.81, `position_z`=-272.139, `orientation`=6.1131 WHERE `guid`=23990; -- Bloodpetal Lasher
UPDATE `creature` SET `position_x`=-8396, `position_y`=-3178.85, `position_z`=8.83552, `orientation`=0.650261 WHERE `guid`=23181; -- Dunemaul Brute
UPDATE `creature` SET `position_x`=-8478.98, `position_y`=-3084.98, `position_z`=10.2401, `orientation`=4.96959 WHERE `guid`=23195; -- Dunemaul Brute
UPDATE `creature` SET `position_x`=-8275.95, `position_y`=-3054.61, `position_z`=9.79255, `orientation`=2.93651 WHERE `guid`=23187; -- Dunemaul Brute
UPDATE `creature` SET `position_x`=-6458.36, `position_y`=-3359.52, `position_z`=241.842, `orientation`=3.67146 WHERE `guid`=7032; -- Shadowforge Darkweaver
UPDATE `creature` SET `position_x`=-529.532, `position_y`=21.5432, `position_z`=-148.719, `orientation`=0.750492 WHERE `guid`=33622; -- Deep Lurker
UPDATE `creature` SET `position_x`=-495.876, `position_y`=44.3337, `position_z`=-148.661, `orientation`=2.51327 WHERE `guid`=33620; -- Murk Worm
UPDATE `creature` SET `position_x`=-499.285, `position_y`=47.752, `position_z`=-148.66, `orientation`=4.10152 WHERE `guid`=33618; -- Slime Maggot
UPDATE `creature` SET `position_x`=-499.306, `position_y`=53.8002, `position_z`=-148.658, `orientation`=4.10152 WHERE `guid`=33619; -- Murk Worm
UPDATE `creature` SET `position_x`=-490.009, `position_y`=43.206, `position_z`=-148.66, `orientation`=4.20624 WHERE `guid`=33617; -- Slime Maggot
UPDATE `creature` SET `position_x`=-425.874, `position_y`=4.53803, `position_z`=-148.719, `orientation`=0.20944 WHERE `guid`=33636; -- Slime Maggot
UPDATE `creature` SET `position_x`=-437.135, `position_y`=7.8404, `position_z`=-148.719, `orientation`=1.58825 WHERE `guid`=33635; -- Slime Maggot
UPDATE `creature` SET `position_x`=-438.476, `position_y`=1.72121, `position_z`=-148.719, `orientation`=1.48353 WHERE `guid`=33632; -- Slime Maggot
UPDATE `creature` SET `position_x`=-426.882, `position_y`=10.3378, `position_z`=-148.719, `orientation`=5.13127 WHERE `guid`=33633; -- Slime Maggot
UPDATE `creature` SET `position_x`=-8048.62, `position_y`=-5149.97, `position_z`=10.5815, `orientation`=2.53285 WHERE `guid`=23342; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-497.946, `position_y`=136.467, `position_z`=-148.658, `orientation`=0.244346 WHERE `guid`=34172; -- Slime Maggot
UPDATE `creature` SET `position_x`=-7956.91, `position_y`=-5478.09, `position_z`=7.61212, `orientation`=4.38437 WHERE `guid`=23392; -- Southsea Swashbuckler
UPDATE `creature` SET `id`=7856 WHERE `guid`=23392; -- Southsea Freebooter
UPDATE `creature` SET `id2`=7858 WHERE `guid`=23392; -- Southsea Swashbuckler
UPDATE `creature` SET `position_x`=-424.931, `position_y`=120.831, `position_z`=-173.548, `orientation`=4.76475 WHERE `guid`=33734; -- Slime Maggot
UPDATE `creature` SET `position_x`=-421.131, `position_y`=127.997, `position_z`=-172.855, `orientation`=2.58309 WHERE `guid`=33738; -- Deep Lurker
UPDATE `creature` SET `position_x`=-419.396, `position_y`=118.521, `position_z`=-172.855, `orientation`=5.93412 WHERE `guid`=33735; -- Slime Maggot
UPDATE `creature` SET `position_x`=-423.023, `position_y`=115.357, `position_z`=-173.69, `orientation`=0.907571 WHERE `guid`=33736; -- Slime Maggot
UPDATE `creature` SET `position_x`=-6203.17, `position_y`=-3038.82, `position_z`=220.365, `orientation`=3.96193 WHERE `guid`=7046; -- Obsidian Golem
UPDATE `creature` SET `position_x`=-411.148, `position_y`=94.5658, `position_z`=-172.855, `orientation`=2.72271 WHERE `guid`=33838; -- Slime Maggot
UPDATE `creature` SET `position_x`=-1287.28, `position_y`=2656.31, `position_z`=111.639, `orientation`=5.34265 WHERE `guid`=27305; -- Maraudine Scout
UPDATE `creature` SET `position_x`=-7715.11, `position_y`=-4685.26, `position_z`=8.97869, `orientation`=2.97469 WHERE `guid`=23610; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-6880.36, `position_y`=-2882.6, `position_z`=10.7151, `orientation`=3.19248 WHERE `guid`=21786; -- Sandfury Hideskinner
UPDATE `creature` SET `position_x`=-1277.95, `position_y`=3009.32, `position_z`=88.8362, `orientation`=3.34277 WHERE `guid`=26923; -- Shadowshard Rumbler
UPDATE `creature` SET `position_x`=-477.27, `position_y`=-2810.41, `position_z`=110.625, `orientation`=0.185676 WHERE `guid`=93036; -- Witherbark Sadist
UPDATE `creature` SET `position_x`=-467.068, `position_y`=-2833.9, `position_z`=110.207, `orientation`=3.71001 WHERE `guid`=93386; -- Witherbark Sadist
UPDATE `creature` SET `position_x`=-7681.89, `position_y`=-4615.08, `position_z`=9.19278, `orientation`=3.93375 WHERE `guid`=23490; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-6846.95, `position_y`=-951.158, `position_z`=243.054, `orientation`=5.10606 WHERE `guid`=5910; -- Greater Lava Spider
UPDATE `creature` SET `position_x`=-13984.7, `position_y`=582.96, `position_z`=6.14781, `orientation`=2.69624 WHERE `guid`=2599; -- Bloodsail Raider
UPDATE `creature` SET `position_x`=-7752.36, `position_y`=-1548.93, `position_z`=-269.74, `orientation`=5.55009 WHERE `guid`=24497; -- Diemetradon
UPDATE `creature` SET `position_x`=-6818.52, `position_y`=-922.123, `position_z`=244.123, `orientation`=3.82199 WHERE `guid`=5909; -- Greater Lava Spider
UPDATE `creature` SET `position_x`=-1911.93, `position_y`=-2710.74, `position_z`=92.2855, `orientation`=0.494018 WHERE `guid`=20161; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-930.612, `position_y`=888.221, `position_z`=91.8594, `orientation`=5.22225 WHERE `guid`=27046; -- Kolkar Windchaser
UPDATE `creature` SET `position_x`=-7048.91, `position_y`=-784.188, `position_z`=-271.578, `orientation`=5.79514 WHERE `guid`=24019; -- Bloodpetal Trapper
UPDATE `creature` SET `position_x`=-383.633, `position_y`=-915.721, `position_z`=55.807, `orientation`=3.62518 WHERE `guid`=16169; -- Gray Bear
UPDATE `creature` SET `position_x`=-8159.78, `position_y`=-1291.05, `position_z`=131.595, `orientation`=3.23821 WHERE `guid`=5416; -- Lava Crab
UPDATE `creature` SET `position_x`=-6947.16, `position_y`=-3448.83, `position_z`=241.788, `orientation`=3.35912 WHERE `guid`=7090; -- Feral Crag Coyote
UPDATE `creature` SET `position_x`=-6905.18, `position_y`=-864.003, `position_z`=251.464, `orientation`=0.635649 WHERE `guid`=5701; -- Magma Elemental
UPDATE `creature` SET `position_x`=-6714.79, `position_y`=-3614.52, `position_z`=241.762, `orientation`=5.18005 WHERE `guid`=6957; -- Feral Crag Coyote
UPDATE `creature` SET `position_x`=-6570.66, `position_y`=-3674.91, `position_z`=264.568, `orientation`=3.41513 WHERE `guid`=7033; -- Stonevault Seer
UPDATE `creature` SET `position_x`=-7234.67, `position_y`=-3213.02, `position_z`=296.836, `orientation`=2.26034 WHERE `guid`=6940; -- Rock Elemental
UPDATE `creature` SET `position_x`=-7413.92, `position_y`=-248.638, `position_z`=-216.262, `orientation`=0.610565 WHERE `guid`=24654; -- Frenzied Pterrordax
UPDATE `creature` SET `position_x`=-7250.08, `position_y`=-2318.52, `position_z`=245.07, `orientation`=3.29469 WHERE `guid`=7037; -- Dustbelcher Mauler
UPDATE `creature` SET `position_x`=-7220.35, `position_y`=-2315.24, `position_z`=244.692, `orientation`=1.84751 WHERE `guid`=7147; -- Dustbelcher Mauler
UPDATE `creature` SET `position_x`=-3518.93, `position_y`=-2283.25, `position_z`=96.8202, `orientation`=4.84734 WHERE `guid`=15176; -- Stormhide
UPDATE `creature` SET `position_x`=2302.62, `position_y`=-5170.09, `position_z`=54.3708, `orientation`=1.72665 WHERE `guid`=92722; -- Living Decay
UPDATE `creature` SET `id`=8606 WHERE `guid`=92722; -- Living Decay
UPDATE `creature` SET `id2`=8607 WHERE `guid`=92722; -- Rotting Sludge
UPDATE `creature` SET `position_x`=2334.3, `position_y`=-5127.98, `position_z`=53.8878, `orientation`=0.426468 WHERE `guid`=92486; -- Living Decay
UPDATE `creature` SET `id`=8606 WHERE `guid`=92486; -- Living Decay
UPDATE `creature` SET `id2`=8607 WHERE `guid`=92486; -- Rotting Sludge
UPDATE `creature` SET `position_x`=2280.67, `position_y`=-5143.07, `position_z`=53.7048, `orientation`=5.10515 WHERE `guid`=92487; -- Living Decay
UPDATE `creature` SET `id`=8606 WHERE `guid`=92487; -- Living Decay
UPDATE `creature` SET `id2`=8607 WHERE `guid`=92487; -- Rotting Sludge
UPDATE `creature` SET `position_x`=-7349.99, `position_y`=-2415.69, `position_z`=290.52, `orientation`=0.403835 WHERE `guid`=7238; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-6851.75, `position_y`=-3082.74, `position_z`=242.974, `orientation`=0.640376 WHERE `guid`=6954; -- Ridge Huntress
UPDATE `creature` SET `position_x`=2648.36, `position_y`=-4184.3, `position_z`=80.8617, `orientation`=3.94685 WHERE `guid`=69695; -- Monstrous Plaguebat
UPDATE `creature` SET `position_x`=-7084.83, `position_y`=-4885.73, `position_z`=-0.374831, `orientation`=3.60438 WHERE `guid`=21874; -- Steeljaw Snapper
UPDATE `creature` SET `position_x`=-7186.4, `position_y`=-4912.88, `position_z`=0.0873013, `orientation`=5.30202 WHERE `guid`=21893; -- Steeljaw Snapper
UPDATE `creature` SET `position_x`=-7239.5, `position_y`=-4894.28, `position_z`=0.456353, `orientation`=5.5063 WHERE `guid`=21907; -- Steeljaw Snapper
UPDATE `creature` SET `position_x`=-7186.27, `position_y`=-3083.49, `position_z`=286.597, `orientation`=4.23817 WHERE `guid`=7243; -- Rock Elemental
UPDATE `creature` SET `position_x`=2756.34, `position_y`=-419.003, `position_z`=111.559, `orientation`=3.57792 WHERE `guid`=89399; -- Winter Reveler
UPDATE `creature` SET `position_x`=-84.9693, `position_y`=-4916.04, `position_z`=18.3464, `orientation`=5.63354 WHERE `guid`=12292; -- Kul Tiras Sailor
UPDATE `creature` SET `position_x`=-8057.35, `position_y`=-5258.65, `position_z`=1.6971, `orientation`=1.55713 WHERE `guid`=89442; -- Southsea Kidnapper
UPDATE `creature` SET `position_x`=-4932.47, `position_y`=-2317.33, `position_z`=-69.241, `orientation`=2.7364 WHERE `guid`=21770; -- Galak Mauler
UPDATE `creature` SET `position_x`=-4922.8, `position_y`=-2304.02, `position_z`=-68.5403, `orientation`=1.37653 WHERE `guid`=20971; -- Galak Mauler
UPDATE `creature` SET `position_x`=-6603.28, `position_y`=-1839.53, `position_z`=244.234, `orientation`=1.71314 WHERE `guid`=5714; -- Tempered War Golem
UPDATE `creature` SET `position_x`=-6636.32, `position_y`=-1834.1, `position_z`=248.088, `orientation`=2.27348 WHERE `guid`=89426; -- Dark Iron Kidnapper
UPDATE `creature` SET `position_x`=-6592.49, `position_y`=-1834.92, `position_z`=244.319, `orientation`=0.875438 WHERE `guid`=89425; -- Dark Iron Kidnapper
UPDATE `creature` SET `position_x`=-6602.08, `position_y`=-1885.17, `position_z`=245.174, `orientation`=4.03277 WHERE `guid`=89430; -- Dark Iron Kidnapper
UPDATE `creature` SET `position_x`=-7752.54, `position_y`=-2912.49, `position_z`=132.715, `orientation`=2.65875 WHERE `guid`=5245; -- Black Dragonspawn
UPDATE `creature` SET `id`=7040 WHERE `guid`=5245; -- Black Dragonspawn
UPDATE `creature` SET `id2`=7041 WHERE `guid`=5245; -- Black Wyrmkin
UPDATE `creature` SET `position_x`=-7741.72, `position_y`=-2859.87, `position_z`=133.522, `orientation`=1.72788 WHERE `guid`=5335; -- Black Dragonspawn
UPDATE `creature` SET `id`=7040 WHERE `guid`=5335; -- Black Dragonspawn
UPDATE `creature` SET `id2`=7041 WHERE `guid`=5335; -- Black Wyrmkin
UPDATE `creature` SET `position_x`=-7763.23, `position_y`=-2852.6, `position_z`=133.522, `orientation`=5.65202 WHERE `guid`=5503; -- Black Wyrmkin
UPDATE `creature` SET `position_x`=-7710.97, `position_y`=-2515.78, `position_z`=143.951, `orientation`=1.2219 WHERE `guid`=5436; -- Firegut Ogre
UPDATE `creature` SET `position_x`=-8527.8, `position_y`=441.726, `position_z`=105.215, `orientation`=5.38489 WHERE `guid`=10527; -- Stormwind Royal Guard (WAYPOINTS)
UPDATE `creature` SET `position_x`=780.244, `position_y`=-9.44037, `position_z`=-53.6513, `orientation`=1.72788 WHERE `guid`=300809; -- Ragereaver Golem
UPDATE `creature` SET `position_x`=789.356, `position_y`=-42.4263, `position_z`=-53.6514, `orientation`=1.95477 WHERE `guid`=47256; -- Ragereaver Golem
UPDATE `creature` SET `position_x`=638.004, `position_y`=-823.848, `position_z`=160.023, `orientation`=4.05774 WHERE `guid`=17001; -- Argus Shadow Mage
UPDATE `creature` SET `position_x`=6815.9, `position_y`=-4182.1, `position_z`=715.959, `orientation`=2.38599 WHERE `guid`=41573; -- Rogue Ice Thistle
UPDATE `creature` SET `position_x`=6650.94, `position_y`=-4113, `position_z`=659.178, `orientation`=2.64874 WHERE `guid`=42177; -- Suffering Highborne
UPDATE `creature` SET `position_x`=6584.17, `position_y`=-4083.32, `position_z`=658.429, `orientation`=3.23563 WHERE `guid`=41789; -- Suffering Highborne
UPDATE `creature` SET `position_x`=6520.17, `position_y`=-4115.43, `position_z`=661.752, `orientation`=1.31094 WHERE `guid`=41773; -- Suffering Highborne
UPDATE `creature` SET `position_x`=6487.63, `position_y`=-4282.32, `position_z`=665.775, `orientation`=1.40842 WHERE `guid`=41815; -- Suffering Highborne
UPDATE `creature` SET `position_x`=-8131.95, `position_y`=-2495.47, `position_z`=140.042, `orientation`=5.80129 WHERE `guid`=5544; -- Firegut Ogre
UPDATE `creature` SET `position_x`=1816.83, `position_y`=-4515.97, `position_z`=66.1339, `orientation`=0.81697 WHERE `guid`=54259; -- Plague Ravager
UPDATE `creature` SET `position_x`=-7717.79, `position_y`=-1116.08, `position_z`=-271.807, `orientation`=4.63766 WHERE `guid`=23903; -- Bloodpetal Flayer
UPDATE `creature` SET `position_x`=1547.9, `position_y`=-1584.54, `position_z`=65.5463, `orientation`=3.70908 WHERE `guid`=48281; -- Soulless Ghoul
UPDATE `creature` SET `position_x`=1558.05, `position_y`=-1469.97, `position_z`=68.4814, `orientation`=4.38261 WHERE `guid`=46964; -- Skeletal Warlord
UPDATE `creature` SET `position_x`=4051.42, `position_y`=-1213.33, `position_z`=280.811, `orientation`=0.744737 WHERE `guid`=39347; -- Felpaw Wolf
UPDATE `creature` SET `position_x`=4011.89, `position_y`=-1112.87, `position_z`=270.071, `orientation`=1.90695 WHERE `guid`=39623; -- Felpaw Wolf
UPDATE `creature` SET `position_x`=3780.3, `position_y`=-5253.98, `position_z`=88.1721, `orientation`=0.919045 WHERE `guid`=35482; -- Spitelash Serpent Guard
UPDATE `creature` SET `position_x`=3550.73, `position_y`=-4786.23, `position_z`=117.45, `orientation`=0.372168 WHERE `guid`=35365; -- Spitelash Warrior
UPDATE `creature` SET `position_x`=3583.71, `position_y`=-4881.76, `position_z`=125.141, `orientation`=6.20935 WHERE `guid`=35367; -- Spitelash Warrior
UPDATE `creature` SET `position_x`=3549.84, `position_y`=-4851.37, `position_z`=121.367, `orientation`=5.26963 WHERE `guid`=35358; -- Spitelash Warrior
UPDATE `creature` SET `position_x`=3452.29, `position_y`=-5117.41, `position_z`=82.6285, `orientation`=2.89772 WHERE `guid`=35428; -- Spitelash Serpent Guard
UPDATE `creature` SET `position_x`=-5030.94, `position_y`=-1269.32, `position_z`=505.383, `orientation`=0.296706 WHERE `guid`=190170; -- Silverwing Emissary
UPDATE `creature` SET `position_x`=1287.83, `position_y`=-411.418, `position_z`=-91.9711, `orientation`=0.436332 WHERE `guid`=53491; -- Anvilrage Reservist
UPDATE `creature` SET `position_x`=204.995, `position_y`=-2852.12, `position_z`=91.6328, `orientation`=4.13643 WHERE `guid`=23; -- Swine
UPDATE `creature` SET `position_x`=223.989, `position_y`=-2843.47, `position_z`=91.4432, `orientation`=2.5578 WHERE `guid`=20181; -- Swine
UPDATE `creature` SET `position_x`=212.36, `position_y`=-2839.1, `position_z`=91.5796, `orientation`=1.48366 WHERE `guid`=20186; -- Swine
UPDATE `creature` SET `position_x`=224.168, `position_y`=-2856.56, `position_z`=91.6094, `orientation`=0.92526 WHERE `guid`=80; -- Swine
UPDATE `creature` SET `position_x`=214.582, `position_y`=-2859.43, `position_z`=91.6248, `orientation`=4.29566 WHERE `guid`=24; -- Swine
UPDATE `creature` SET `position_x`=-11612.6, `position_y`=-3394.85, `position_z`=7.59244, `orientation`=1.40568 WHERE `guid`=2967; -- Servant of Allistarj
UPDATE `creature` SET `position_x`=-11499.9, `position_y`=-2679.5, `position_z`=7.64266, `orientation`=5.37512 WHERE `guid`=2729; -- Shadowsworn Enforcer
UPDATE `creature` SET `position_x`=7650.48, `position_y`=-2909.23, `position_z`=463.993, `orientation`=5.35816 WHERE `guid`=302407; -- Minion of Omen
UPDATE `creature` SET `position_x`=7354.9, `position_y`=-2728.84, `position_z`=462.654, `orientation`=3.91292 WHERE `guid`=42347; -- Great Cat Spirit
UPDATE `creature` SET `position_x`=7421.31, `position_y`=-2874.68, `position_z`=467.763, `orientation`=1.0821 WHERE `guid`=302404; -- Minion of Omen
UPDATE `creature` SET `position_x`=7457.12, `position_y`=-2781.85, `position_z`=465.095, `orientation`=4.17134 WHERE `guid`=302388; -- Minion of Omen
UPDATE `creature` SET `position_x`=7483.98, `position_y`=-2783.65, `position_z`=463.48, `orientation`=6.24828 WHERE `guid`=302389; -- Minion of Omen
UPDATE `creature` SET `position_x`=7554.19, `position_y`=-2900.94, `position_z`=461.711, `orientation`=3.34503 WHERE `guid`=42393; -- Moonglade Warden (WAYPOINTS)
UPDATE `creature` SET `position_x`=7651.78, `position_y`=-2882.93, `position_z`=465.686, `orientation`=4.69494 WHERE `guid`=302408; -- Minion of Omen
UPDATE `creature` SET `position_x`=7623.34, `position_y`=-2940.6, `position_z`=462.556, `orientation`=6.03884 WHERE `guid`=302393; -- Minion of Omen
UPDATE `creature` SET `position_x`=7683.01, `position_y`=-2886.23, `position_z`=463.334, `orientation`=0.244346 WHERE `guid`=302396; -- Minion of Omen
UPDATE `creature` SET `position_x`=7785.45, `position_y`=-2884.82, `position_z`=466.28, `orientation`=6.14356 WHERE `guid`=302400; -- Minion of Omen
UPDATE `creature` SET `position_x`=7716.26, `position_y`=-2911.6, `position_z`=471.695, `orientation`=0.645772 WHERE `guid`=302397; -- Minion of Omen
UPDATE `creature` SET `position_x`=7754.18, `position_y`=-2886.53, `position_z`=466.044, `orientation`=3.50811 WHERE `guid`=302399; -- Minion of Omen
UPDATE `creature` SET `position_x`=7750.89, `position_y`=-2841.83, `position_z`=462.66, `orientation`=5.02655 WHERE `guid`=302410; -- Minion of Omen
UPDATE `creature` SET `position_x`=7782.26, `position_y`=-2849.51, `position_z`=464.16, `orientation`=4.86947 WHERE `guid`=302401; -- Minion of Omen
UPDATE `creature` SET `position_x`=7679.64, `position_y`=-2910.04, `position_z`=462.141, `orientation`=6.05629 WHERE `guid`=302395; -- Minion of Omen
UPDATE `creature` SET `position_x`=7722.11, `position_y`=-2850.9, `position_z`=463.009, `orientation`=1.09956 WHERE `guid`=302403; -- Minion of Omen
UPDATE `creature` SET `position_x`=7722.81, `position_y`=-2886.1, `position_z`=465.799, `orientation`=1.41372 WHERE `guid`=302398; -- Minion of Omen
UPDATE `creature` SET `position_x`=7690.94, `position_y`=-2899.59, `position_z`=462.81, `orientation`=3.34818 WHERE `guid`=42520; -- Deer
UPDATE `creature` SET `position_x`=7662.53, `position_y`=-2940.67, `position_z`=465.743, `orientation`=0.42229 WHERE `guid`=42524; -- Deer
UPDATE `creature` SET `position_x`=7652.06, `position_y`=-2872.79, `position_z`=466.88, `orientation`=0.782679 WHERE `guid`=42500; -- Deer
UPDATE `creature` SET `position_x`=7613.06, `position_y`=-2893.16, `position_z`=465.002, `orientation`=5.67425 WHERE `guid`=42353; -- Squirrel
UPDATE `creature` SET `position_x`=7620.96, `position_y`=-2923.92, `position_z`=462.124, `orientation`=3.99259 WHERE `guid`=42420; -- Deer
UPDATE `creature` SET `position_x`=10069, `position_y`=2233.09, `position_z`=1327.93, `orientation`=3.7778 WHERE `guid`=46456; -- Deer
UPDATE `creature` SET `position_x`=-11983.2, `position_y`=-1526.47, `position_z`=48.7585, `orientation`=0.660952 WHERE `guid`=51435; -- Snake
UPDATE `creature` SET `position_x`=-12287.6, `position_y`=-1655.38, `position_z`=131.297, `orientation`=4.07926 WHERE `guid`=91526; -- Spider
UPDATE `creature` SET `position_x`=-12256.8, `position_y`=-1807.58, `position_z`=131.439, `orientation`=1.19464 WHERE `guid`=91544; -- Snake
UPDATE `creature` SET `position_x`=-11593.4, `position_y`=-1457.61, `position_z`=56.651, `orientation`=1.75572 WHERE `guid`=51630; -- Snake
UPDATE `creature` SET `position_x`=-7163.41, `position_y`=1389.06, `position_z`=2.89281, `orientation`=2.87979 WHERE `guid`=42904; -- Ironforge Brigade Rifleman
UPDATE `creature` SET `position_x`=-7166.92, `position_y`=1387.33, `position_z`=3.00275, `orientation`=1.36136 WHERE `guid`=42907; -- Ironforge Brigade Rifleman
UPDATE `creature` SET `position_x`=-14438, `position_y`=467.679, `position_z`=4.0026, `orientation`=6.09131 WHERE `guid`=2566; -- Rat
UPDATE `creature` SET `position_x`=-714.37, `position_y`=-2749.97, `position_z`=91.8759, `orientation`=6.26155 WHERE `guid`=19620; -- Fleeting Plainstrider
UPDATE `creature` SET `position_x`=3.67383, `position_y`=-684.21, `position_z`=-19.0443, `orientation`=1.55843 WHERE `guid`=29342; -- Grimtotem Ruffian
UPDATE `creature` SET `position_x`=1340.11, `position_y`=-3500.52, `position_z`=93.4443, `orientation`=5.93267 WHERE `guid`=20740; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1357.71, `position_y`=-3524.65, `position_z`=95.3681, `orientation`=0.368138 WHERE `guid`=20839; -- Venture Co. Overseer
UPDATE `creature` SET `position_x`=1339.81, `position_y`=-3485.74, `position_z`=93.2768, `orientation`=0.0821124 WHERE `guid`=20759; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=-5584.76, `position_y`=-1623.68, `position_z`=15.5431, `orientation`=3.09769 WHERE `guid`=21052; -- Screeching Harpy
UPDATE `creature` SET `position_x`=-5599.3, `position_y`=-1607.22, `position_z`=13.5665, `orientation`=4.89216 WHERE `guid`=21040; -- Screeching Harpy (WAYPOINTS)
UPDATE `creature` SET `position_x`=871.955, `position_y`=-2720.7, `position_z`=100.12, `orientation`=5.60629 WHERE `guid`=20766; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=-1743.07, `position_y`=-3729.55, `position_z`=13.834, `orientation`=5.3365 WHERE `guid`=13789; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-1750.37, `position_y`=-3733.32, `position_z`=13.0707, `orientation`=2.23335 WHERE `guid`=13818; -- Southsea Cannoneer
UPDATE `creature` SET `position_x`=-150.042, `position_y`=-3289.79, `position_z`=92.2152, `orientation`=5.27089 WHERE `guid`=20434; -- Razormane Mystic
UPDATE `creature` SET `position_x`=-182.185, `position_y`=-3316.3, `position_z`=91.7834, `orientation`=2.87979 WHERE `guid`=20437; -- Razormane Mystic
UPDATE `creature` SET `position_x`=-3103.19, `position_y`=-1728.25, `position_z`=93.8182, `orientation`=0.782995 WHERE `guid`=19773; -- Silithid Grub
UPDATE `creature` SET `position_x`=-23.4349, `position_y`=-3361.98, `position_z`=91.809, `orientation`=0.18161 WHERE `guid`=20413; -- Razormane Geomancer
UPDATE `creature` SET `position_x`=-3112.65, `position_y`=-1715.97, `position_z`=95.7898, `orientation`=3.40339 WHERE `guid`=19772; -- Silithid Grub
UPDATE `creature` SET `position_x`=-982.442, `position_y`=-4952.02, `position_z`=2.41016, `orientation`=4.04749 WHERE `guid`=12975; -- Pygmy Surf Crawler
UPDATE `creature` SET `position_x`=-2125.11, `position_y`=-3514.14, `position_z`=92.4351, `orientation`=0.0282437 WHERE `guid`=13898; -- Theramore Marine
UPDATE `creature` SET `position_x`=1116.87, `position_y`=-16.1907, `position_z`=-0.677449, `orientation`=4.27606 WHERE `guid`=29498; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=-551.362, `position_y`=-3450.39, `position_z`=93.6533, `orientation`=0.779806 WHERE `guid`=20012; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-915.101, `position_y`=-5183.78, `position_z`=-2.01156, `orientation`=3.74792 WHERE `guid`=8512; -- Makrura Clacker
UPDATE `creature` SET `position_x`=-783.861, `position_y`=-5119.53, `position_z`=-1.56664, `orientation`=2.97693 WHERE `guid`=7392; -- Pygmy Surf Crawler
UPDATE `creature` SET `position_x`=3438.78, `position_y`=-656.952, `position_z`=176.055, `orientation`=4.73126 WHERE `guid`=32442; -- Thistlefur Ursa
UPDATE `creature` SET `position_x`=-1180.23, `position_y`=-5116.54, `position_z`=3.31059, `orientation`=1.35819 WHERE `guid`=12994; -- Durotar Tiger
UPDATE `creature` SET `position_x`=-2004.58, `position_y`=-3639.31, `position_z`=22.9932, `orientation`=3.29982 WHERE `guid`=13874; -- Theramore Marine
UPDATE `creature` SET `position_x`=-2039.16, `position_y`=-3680.75, `position_z`=21.9591, `orientation`=0.9364 WHERE `guid`=13928; -- Theramore Marine (WAYPOINTS)
UPDATE `creature` SET `position_x`=310.736, `position_y`=-2173.21, `position_z`=214.545, `orientation`=4.85645 WHERE `guid`=13748; -- Burning Blade Acolyte
UPDATE `creature` SET `position_x`=299.722, `position_y`=-2190.52, `position_z`=213.326, `orientation`=4.99324 WHERE `guid`=13733; -- Burning Blade Acolyte
UPDATE `creature` SET `position_x`=314.529, `position_y`=-2194.36, `position_z`=213.01, `orientation`=4.74773 WHERE `guid`=13726; -- Burning Blade Bruiser
UPDATE `creature` SET `position_x`=299.147, `position_y`=-2178.62, `position_z`=213.424, `orientation`=6.27146 WHERE `guid`=13717; -- Burning Blade Bruiser
UPDATE `creature` SET `position_x`=667.215, `position_y`=-1289.75, `position_z`=92.8437, `orientation`=4.59644 WHERE `guid`=20676; -- Witchwing Slayer
UPDATE `creature` SET `position_x`=1649.16, `position_y`=102.758, `position_z`=110.983, `orientation`=3.52557 WHERE `guid`=29579; -- Venture Co. Engineer
UPDATE `creature` SET `position_x`=670.269, `position_y`=-1315.96, `position_z`=93.1482, `orientation`=2.53929 WHERE `guid`=20696; -- Witchwing Windcaller
UPDATE `creature` SET `position_x`=703.543, `position_y`=-1249.83, `position_z`=91.75, `orientation`=1.38651 WHERE `guid`=20659; -- Witchwing Slayer
UPDATE `creature` SET `position_x`=-83.3619, `position_y`=-2852.47, `position_z`=91.7998, `orientation`=4.64258 WHERE `guid`=20379; -- Razormane Water Seeker
UPDATE `creature` SET `id`=3267 WHERE `guid`=20379; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20379; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-116.651, `position_y`=-2916.85, `position_z`=91.75, `orientation`=3.59538 WHERE `guid`=20401; -- Razormane Thornweaver
UPDATE `creature` SET `id`=3267 WHERE `guid`=20401; -- Razormane Water Seeker
UPDATE `creature` SET `id2`=3268 WHERE `guid`=20401; -- Razormane Thornweaver
UPDATE `creature` SET `position_x`=-112.432, `position_y`=-2877.87, `position_z`=91.8011, `orientation`=0.261799 WHERE `guid`=20383; -- Razormane Water Seeker
UPDATE `creature` SET `position_x`=988.396, `position_y`=-3089.64, `position_z`=81.8022, `orientation`=5.72943 WHERE `guid`=20731; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=998.422, `position_y`=-3133, `position_z`=91.2249, `orientation`=2.07597 WHERE `guid`=20804; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1035.51, `position_y`=-3051.85, `position_z`=98.9013, `orientation`=3.03488 WHERE `guid`=20721; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=1048.53, `position_y`=-3071.17, `position_z`=105.278, `orientation`=3.46154 WHERE `guid`=20798; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1031.33, `position_y`=-3071.88, `position_z`=105.208, `orientation`=0.610739 WHERE `guid`=20730; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=1035.3, `position_y`=-3086.81, `position_z`=105.114, `orientation`=1.12736 WHERE `guid`=20814; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=2383.14, `position_y`=-1681.73, `position_z`=146.828, `orientation`=3.36054 WHERE `guid`=34212; -- Laughing Sister
UPDATE `creature` SET `position_x`=2518.83, `position_y`=-1649.61, `position_z`=144.08, `orientation`=2.32129 WHERE `guid`=34223; -- Laughing Sister
UPDATE `creature` SET `position_x`=-1495.52, `position_y`=-2704.27, `position_z`=92.1511, `orientation`=5.35911 WHERE `guid`=20066; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=-1537.39, `position_y`=-2687.91, `position_z`=91.329, `orientation`=4.77917 WHERE `guid`=20073; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=817.045, `position_y`=-4057.7, `position_z`=-12.8887, `orientation`=6.11621 WHERE `guid`=12222; -- Thunder Lizard
UPDATE `creature` SET `position_x`=-1583.82, `position_y`=-2615.43, `position_z`=95.3764, `orientation`=5.14952 WHERE `guid`=19465; -- Ornery Plainstrider
UPDATE `creature` SET `position_x`=-1534.5, `position_y`=-2655.26, `position_z`=91.8826, `orientation`=1.06465 WHERE `guid`=20019; -- Sunscale Scytheclaw
UPDATE `creature` SET `position_x`=649.788, `position_y`=1775.19, `position_z`=-12.8982, `orientation`=4.87696 WHERE `guid`=31789; -- Bloodfury Roguefeather
UPDATE `creature` SET `position_x`=623.711, `position_y`=1814.99, `position_z`=-10.976, `orientation`=3.65305 WHERE `guid`=30476; -- Bloodfury Roguefeather
UPDATE `creature` SET `position_x`=7889.87, `position_y`=-2557.63, `position_z`=486.82, `orientation`=1.74265 WHERE `guid`=42729; -- Rabbit
UPDATE `creature` SET `position_x`=2016.2, `position_y`=-4452.22, `position_z`=75.1356, `orientation`=2.31626 WHERE `guid`=92525; -- Hate Shrieker
UPDATE `creature` SET `position_x`=1948.47, `position_y`=-4449.14, `position_z`=77.1223, `orientation`=3.65432 WHERE `guid`=92523; -- Hate Shrieker
UPDATE `creature` SET `position_x`=1983.06, `position_y`=-4549.3, `position_z`=73.7059, `orientation`=2.73519 WHERE `guid`=92703; -- Scourge Warder
UPDATE `creature` SET `position_x`=1384.33, `position_y`=-1718.41, `position_z`=68.0003, `orientation`=5.07489 WHERE `guid`=52545; -- Soulless Ghoul
UPDATE `creature` SET `position_x`=-9337.84, `position_y`=277.606, `position_z`=68.0722, `orientation`=3.71217 WHERE `guid`=80302; -- Chicken
UPDATE `creature` SET `position_x`=-4714.65, `position_y`=3460.29, `position_z`=21.0437, `orientation`=2.1941 WHERE `guid`=51550; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4754.83, `position_y`=3444.98, `position_z`=14.1371, `orientation`=1.35893 WHERE `guid`=51478; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4721.01, `position_y`=3443, `position_z`=21.9155, `orientation`=3.68216 WHERE `guid`=51481; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4851.2, `position_y`=3384.84, `position_z`=19.4787, `orientation`=0.191986 WHERE `guid`=51483; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4884.77, `position_y`=3449.63, `position_z`=15.5509, `orientation`=4.05226 WHERE `guid`=51551; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-4854.09, `position_y`=3417.4, `position_z`=13.45, `orientation`=0.593017 WHERE `guid`=51548; -- Hatecrest Warrior
UPDATE `creature` SET `position_x`=-2751.83, `position_y`=-3383.39, `position_z`=28.6058, `orientation`=3.98093 WHERE `guid`=31042; -- Drywallow Crocolisk
UPDATE `creature` SET `position_x`=742.862, `position_y`=-961.265, `position_z`=166.311, `orientation`=2.20095 WHERE `guid`=17026; -- Argus Shadow Mage
UPDATE `creature` SET `position_x`=683.55, `position_y`=-999.843, `position_z`=170.444, `orientation`=4.63763 WHERE `guid`=17019; -- Argus Shadow Mage
UPDATE `creature` SET `position_x`=-4406.3, `position_y`=3290.4, `position_z`=12.5644, `orientation`=3.24631 WHERE `guid`=49972; -- Feathermoon Sentinel
UPDATE `creature` SET `position_x`=688.577, `position_y`=-984.503, `position_z`=165.678, `orientation`=3.75246 WHERE `guid`=17020; -- Jailor Borhuin
UPDATE `creature` SET `position_x`=-1882.81, `position_y`=1314.57, `position_z`=87.3775, `orientation`=1.28543 WHERE `guid`=27094; -- Magram Wrangler
UPDATE `creature` SET `position_x`=-1888.38, `position_y`=1797.9, `position_z`=68.0313, `orientation`=4.52494 WHERE `guid`=27921; -- Nether Sister
UPDATE `creature` SET `position_x`=-2116.74, `position_y`=1915.83, `position_z`=62.8935, `orientation`=1.47752 WHERE `guid`=27935; -- Ley Hunter
UPDATE `creature` SET `position_x`=-10255.2, `position_y`=-3532.91, `position_z`=17.5574, `orientation`=5.4091 WHERE `guid`=42110; -- Tangled Horror
UPDATE `creature` SET `position_x`=-10653.1, `position_y`=-3815.47, `position_z`=23.0202, `orientation`=2.06955 WHERE `guid`=38865; -- Deathstrike Tarantula
UPDATE `creature` SET `position_x`=-2151.13, `position_y`=-1631.88, `position_z`=-38.9054, `orientation`=0.540514 WHERE `guid`=11484; -- Daggerspine Sorceress
UPDATE `creature` SET `position_x`=-6834.13, `position_y`=838.981, `position_z`=50.7133, `orientation`=4.72984 WHERE `guid`=113015; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6820.16, `position_y`=832.859, `position_z`=49.5774, `orientation`=3.33358 WHERE `guid`=113017; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6824.19, `position_y`=827.934, `position_z`=49.5407, `orientation`=2.35619 WHERE `guid`=113011; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6838.17, `position_y`=827.95, `position_z`=50.9367, `orientation`=0.820305 WHERE `guid`=113014; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6838.16, `position_y`=840.405, `position_z`=49.3667, `orientation`=5.34071 WHERE `guid`=113016; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6827.21, `position_y`=823.577, `position_z`=49.6126, `orientation`=5.67232 WHERE `guid`=113013; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-6824.47, `position_y`=825.423, `position_z`=49.5562, `orientation`=2.70526 WHERE `guid`=113012; -- Priestess of the Moon
UPDATE `creature` SET `position_x`=-10116.6, `position_y`=-3616.03, `position_z`=22.8436, `orientation`=5.67561 WHERE `guid`=40448; -- Sawtooth Crocolisk
UPDATE `creature` SET `position_x`=-7085.42, `position_y`=-2281.25, `position_z`=268.205, `orientation`=2.61211 WHERE `guid`=7029; -- Dustbelcher Wyrmhunter
UPDATE `creature` SET `position_x`=-7217.94, `position_y`=-2218.06, `position_z`=295.975, `orientation`=3.96084 WHERE `guid`=7171; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=-7193.67, `position_y`=-2098.5, `position_z`=328.003, `orientation`=4.13372 WHERE `guid`=7182; -- Greater Rock Elemental
UPDATE `creature` SET `position_x`=5.87766, `position_y`=2691.31, `position_z`=-72.9925, `orientation`=3.82446 WHERE `guid`=28731; -- Slitherblade Myrmidon
UPDATE `creature` SET `position_x`=-2647.92, `position_y`=-3085.45, `position_z`=44.901, `orientation`=4.18165 WHERE `guid`=73741; -- Bloodfen Raptor
UPDATE `creature` SET `position_x`=2508.62, `position_y`=1997.27, `position_z`=346.928, `orientation`=2.48801 WHERE `guid`=32238; -- Mirkfallon Keeper
UPDATE `creature` SET `position_x`=2491.7, `position_y`=2005.38, `position_z`=342.511, `orientation`=1.38634 WHERE `guid`=32247; -- Mirkfallon Keeper
UPDATE `creature` SET `position_x`=2462.06, `position_y`=1928.84, `position_z`=362.652, `orientation`=6.26912 WHERE `guid`=32260; -- Mirkfallon Dryad
UPDATE `creature` SET `position_x`=2541.67, `position_y`=1994.54, `position_z`=348.211, `orientation`=0.628319 WHERE `guid`=32242; -- Mirkfallon Keeper
UPDATE `creature` SET `position_x`=-6960.55, `position_y`=923.85, `position_z`=13.5121, `orientation`=1.11701 WHERE `guid`=113042; -- Tauren Rifleman
UPDATE `creature` SET `position_x`=-6969.38, `position_y`=928.674, `position_z`=12.1395, `orientation`=1.3439 WHERE `guid`=113045; -- Tauren Rifleman
UPDATE `creature` SET `position_x`=-6964.77, `position_y`=926.146, `position_z`=12.4562, `orientation`=1.06465 WHERE `guid`=113043; -- Tauren Rifleman
UPDATE `creature` SET `position_x`=-7224.45, `position_y`=325.212, `position_z`=46.4215, `orientation`=5.28516 WHERE `guid`=43137; -- Tortured Druid
UPDATE `creature` SET `position_x`=-7216.87, `position_y`=383.36, `position_z`=23.9171, `orientation`=1.47475 WHERE `guid`=43141; -- Tortured Druid
UPDATE `creature` SET `position_x`=-6861.73, `position_y`=800.821, `position_z`=42.7743, `orientation`=3.12414 WHERE `guid`=113056; -- Kaldorei Marksman
UPDATE `creature` SET `position_x`=-6867.31, `position_y`=814.426, `position_z`=42.7554, `orientation`=2.96706 WHERE `guid`=113055; -- Kaldorei Marksman
UPDATE `creature` SET `position_x`=-3417.45, `position_y`=-1914.54, `position_z`=94.6304, `orientation`=3.01942 WHERE `guid`=112702; -- Minor Silithid Flayer
UPDATE `creature` SET `position_x`=996.044, `position_y`=-393.06, `position_z`=8.5181, `orientation`=2.98526 WHERE `guid`=29542; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=1006.59, `position_y`=-394.98, `position_z`=7.26771, `orientation`=5.03816 WHERE `guid`=29540; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=984.908, `position_y`=-393.822, `position_z`=8.09083, `orientation`=6.18522 WHERE `guid`=29549; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=999.52, `position_y`=-409.942, `position_z`=4.00981, `orientation`=3.1488 WHERE `guid`=29473; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=988.89, `position_y`=-420.426, `position_z`=7.48858, `orientation`=4.48074 WHERE `guid`=29541; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=969.23, `position_y`=-388.901, `position_z`=8.42239, `orientation`=4.29152 WHERE `guid`=29598; -- Windshear Digger
UPDATE `creature` SET `position_x`=1016.3, `position_y`=-385.149, `position_z`=1.62535, `orientation`=5.17731 WHERE `guid`=29639; -- Windshear Geomancer
UPDATE `creature` SET `position_x`=974.064, `position_y`=-385.964, `position_z`=8.28032, `orientation`=5.29965 WHERE `guid`=29485; -- Venture Co. Logger
UPDATE `creature` SET `position_x`=-12449.4, `position_y`=-750.627, `position_z`=37.0612, `orientation`=0.115391 WHERE `guid`=1997; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12440.6, `position_y`=-243.555, `position_z`=14.4419, `orientation`=1.35267 WHERE `guid`=1935; -- Snapjaw Crocolisk
UPDATE `creature` SET `position_x`=-7383.48, `position_y`=-4405.6, `position_z`=9.39973, `orientation`=2.54033 WHERE `guid`=23601; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=-12782.3, `position_y`=-716.021, `position_z`=63.3597, `orientation`=2.38247 WHERE `guid`=1131; -- Skullsplitter Warrior
UPDATE `creature` SET `position_x`=-12949.1, `position_y`=149.923, `position_z`=24.1081, `orientation`=2.13638 WHERE `guid`=1902; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-12964.9, `position_y`=-686.114, `position_z`=53.5462, `orientation`=0 WHERE `guid`=1388; -- Skullsplitter Hunter
UPDATE `creature` SET `position_x`=-13051, `position_y`=382.209, `position_z`=19.2316, `orientation`=1.74892 WHERE `guid`=1970; -- Jungle Stalker
UPDATE `creature` SET `position_x`=-12988.5, `position_y`=-689.448, `position_z`=54.3133, `orientation`=0 WHERE `guid`=1362; -- Skullsplitter Hunter
UPDATE `creature` SET `position_x`=-13051.4, `position_y`=-650.752, `position_z`=53.4113, `orientation`=4.75932 WHERE `guid`=1344; -- Skullsplitter Hunter
UPDATE `creature` SET `position_x`=-13269.1, `position_y`=-497.587, `position_z`=13.8957, `orientation`=0 WHERE `guid`=756; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-13256.9, `position_y`=-580.244, `position_z`=12.6606, `orientation`=3.05433 WHERE `guid`=981; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-347.061, `position_y`=-2769.91, `position_z`=77.2455, `orientation`=4.11319 WHERE `guid`=93126; -- Witherbark Broodguard
UPDATE `creature` SET `position_x`=-335.748, `position_y`=-2804.31, `position_z`=81.1902, `orientation`=3.93682 WHERE `guid`=93458; -- Witherbark Sadist
UPDATE `creature` SET `position_x`=-642.567, `position_y`=-3645.99, `position_z`=94.5906, `orientation`=3.61957 WHERE `guid`=14132; -- Savannah Matriarch
UPDATE `creature` SET `position_x`=5317.83, `position_y`=-727.458, `position_z`=343.35, `orientation`=5.81343 WHERE `guid`=40434; -- Tainted Ooze
UPDATE `creature` SET `position_x`=-8930.45, `position_y`=2162.49, `position_z`=5.26124, `orientation`=0.314159 WHERE `guid`=87494; -- Canal Frenzy
UPDATE `creature` SET `position_x`=-8915.97, `position_y`=2154.23, `position_z`=5.85223, `orientation`=0.10472 WHERE `guid`=87495; -- Canal Frenzy
UPDATE `creature` SET `position_x`=-6979.15, `position_y`=-317.932, `position_z`=-223.579, `orientation`=3.98889 WHERE `guid`=24605; -- Frenzied Pterrordax
UPDATE `creature` SET `position_x`=-7055.46, `position_y`=-944.363, `position_z`=264.101, `orientation`=2.46876 WHERE `guid`=5765; -- Inferno Elemental
UPDATE `creature` SET `position_x`=-8719.41, `position_y`=-2213.76, `position_z`=10.9481, `orientation`=5.4561 WHERE `guid`=23246; -- Thistleshrub Rootshaper
UPDATE `creature` SET `position_x`=-7004.47, `position_y`=-1151.25, `position_z`=241.782, `orientation`=5.88491 WHERE `guid`=300647; -- Dark Iron Lookout
UPDATE `creature` SET `position_x`=-8027.76, `position_y`=-1127.05, `position_z`=-317.807, `orientation`=4.17337 WHERE `guid`=24336; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-7988.15, `position_y`=-1093.16, `position_z`=-329.034, `orientation`=1.34561 WHERE `guid`=24337; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-6454.82, `position_y`=-1196.93, `position_z`=181.014, `orientation`=1.0472 WHERE `guid`=5811; -- Enslaved Archaeologist
UPDATE `creature` SET `position_x`=4480.78, `position_y`=-6350.46, `position_z`=122.943, `orientation`=0.220153 WHERE `guid`=35640; -- Legashi Satyr
UPDATE `creature` SET `position_x`=4515.85, `position_y`=-6351.57, `position_z`=125.279, `orientation`=0.838525 WHERE `guid`=35673; -- Legashi Satyr
UPDATE `creature` SET `position_x`=4494.48, `position_y`=-6355.2, `position_z`=124.919, `orientation`=0.677866 WHERE `guid`=35689; -- Legashi Satyr
UPDATE `creature` SET `position_x`=4516.32, `position_y`=-6318.76, `position_z`=118.264, `orientation`=3.54752 WHERE `guid`=35636; -- Legashi Satyr
UPDATE `creature` SET `position_x`=4449.46, `position_y`=-6379.95, `position_z`=122.44, `orientation`=3.33075 WHERE `guid`=35690; -- Legashi Satyr
UPDATE `creature` SET `position_x`=4488.66, `position_y`=-6390.14, `position_z`=125.687, `orientation`=6.16101 WHERE `guid`=35639; -- Legashi Satyr
UPDATE `creature` SET `position_x`=-4201.5, `position_y`=-2707.57, `position_z`=41.0641, `orientation`=2.00713 WHERE `guid`=10338; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-4221.43, `position_y`=-2701.4, `position_z`=41.3804, `orientation`=4.76475 WHERE `guid`=10343; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-7851.41, `position_y`=-2666.04, `position_z`=172.932, `orientation`=5.12129 WHERE `guid`=5395; -- Firegut Ogre Mage
UPDATE `creature` SET `position_x`=-4278.07, `position_y`=-3004.07, `position_z`=9.46143, `orientation`=2.34313 WHERE `guid`=9959; -- Dark Iron Insurgent
UPDATE `creature` SET `position_x`=6829.18, `position_y`=-791.834, `position_z`=66.2725, `orientation`=2.10219 WHERE `guid`=37487; -- Stormscale Wave Rider
UPDATE `creature` SET `position_x`=6818.4, `position_y`=-714.549, `position_z`=62.3787, `orientation`=2.77507 WHERE `guid`=37516; -- Stormscale Siren
UPDATE `creature` SET `position_x`=6861.44, `position_y`=-769.224, `position_z`=60.3075, `orientation`=1.70426 WHERE `guid`=37488; -- Stormscale Wave Rider
UPDATE `creature` SET `position_x`=-4075.21, `position_y`=-2962.31, `position_z`=11.7839, `orientation`=5.18363 WHERE `guid`=10501; -- Mosshide Mongrel
UPDATE `creature` SET `position_x`=1642.18, `position_y`=-5438.89, `position_z`=88.2457, `orientation`=1.18682 WHERE `guid`=92786; -- Scarlet Praetorian
UPDATE `creature` SET `position_x`=7278.03, `position_y`=-914.638, `position_z`=33.89, `orientation`=1.18682 WHERE `guid`=37534; -- Stormscale Myrmidon
UPDATE `creature` SET `position_x`=9559.95, `position_y`=1882.64, `position_z`=1314.17, `orientation`=1.51844 WHERE `guid`=48453; -- Gnarlpine Shaman
UPDATE `creature` SET `position_x`=9527.54, `position_y`=1861.89, `position_z`=1317.76, `orientation`=3.49362 WHERE `guid`=48472; -- Gnarlpine Shaman
UPDATE `creature` SET `position_x`=2288.77, `position_y`=-5326.83, `position_z`=90.9632, `orientation`=5.34641 WHERE `guid`=69677; -- Argent Sentry
UPDATE `creature` SET `position_x`=-5453.25, `position_y`=-2468.24, `position_z`=89.3594, `orientation`=0.907571 WHERE `guid`=21476; -- Freewind Brave
UPDATE `creature` SET `position_x`=-5406.78, `position_y`=-2405.43, `position_z`=89.4715, `orientation`=3.38598 WHERE `guid`=21473; -- Freewind Brave
UPDATE `creature` SET `position_x`=-5461.5, `position_y`=-2441.93, `position_z`=89.4933, `orientation`=1.64061 WHERE `guid`=21466; -- Freewind Brave (WAYPOINTS)
UPDATE `creature` SET `position_x`=6729.07, `position_y`=-4662.94, `position_z`=720.875, `orientation`=5.9877 WHERE `guid`=42290; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=6750.75, `position_y`=-4707.24, `position_z`=721.295, `orientation`=1.47516 WHERE `guid`=42291; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=2259.6, `position_y`=312.752, `position_z`=36.1071, `orientation`=5.28835 WHERE `guid`=29777; -- Deathguard Morris
UPDATE `creature` SET `position_x`=6350.45, `position_y`=148.453, `position_z`=25.7792, `orientation`=5.66904 WHERE `guid`=38227; -- Young Moonkin
UPDATE `creature` SET `position_x`=-11264.3, `position_y`=1538.29, `position_z`=28.2284, `orientation`=3.63519 WHERE `guid`=89574; -- Marisa du'Paige
UPDATE `creature` SET `position_x`=2316.21, `position_y`=287.9, `position_z`=37.394, `orientation`=3.06556 WHERE `guid`=31921; -- Jamie Nore
UPDATE `creature` SET `position_x`=2253.34, `position_y`=270.22, `position_z`=34.8849, `orientation`=4.229 WHERE `guid`=38291; -- Mrs. Winters
UPDATE `creature` SET `position_x`=2239.4, `position_y`=257.123, `position_z`=34.8427, `orientation`=2.58309 WHERE `guid`=34113; -- Deathguard Mort (WAYPOINTS)
UPDATE `creature` SET `position_x`=-12152.8, `position_y`=-8.31348, `position_z`=-6.27573, `orientation`=2.15432 WHERE `guid`=791; -- Murkgill Hunter
UPDATE `creature` SET `position_x`=-3463.65, `position_y`=-4129.85, `position_z`=17.1876, `orientation`=4.67383 WHERE `guid`=30814; -- Sentry Point Guard (WAYPOINTS)
UPDATE `creature` SET `position_x`=-14453.5, `position_y`=493.137, `position_z`=26.3682, `orientation`=6.08993 WHERE `guid`=696; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=-14433, `position_y`=504.295, `position_z`=8.83608, `orientation`=3.83973 WHERE `guid`=656; -- Booty Bay Bruiser (WAYPOINTS)
UPDATE `creature` SET `position_x`=-14465, `position_y`=483.814, `position_z`=14.9799, `orientation`=3.92433 WHERE `guid`=694; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=2593.29, `position_y`=-3402.34, `position_z`=121.401, `orientation`=1.53589 WHERE `guid`=32835; -- Horde Peon
UPDATE `creature` SET `position_x`=-11187.7, `position_y`=-854.136, `position_z`=77.2269, `orientation`=2.285 WHERE `guid`=4260; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=-11196.6, `position_y`=-830.644, `position_z`=77.2414, `orientation`=5.66609 WHERE `guid`=4237; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-6114.13, `position_y`=-2995.05, `position_z`=399.481, `orientation`=1.20977 WHERE `guid`=9264; -- Stonesplinter Skullthumper
UPDATE `creature` SET `position_x`=-6223.44, `position_y`=-2952.45, `position_z`=403.066, `orientation`=2.25147 WHERE `guid`=8963; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-6206.5, `position_y`=-2981.13, `position_z`=397.448, `orientation`=2.98451 WHERE `guid`=8961; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=-6183.28, `position_y`=-2984.08, `position_z`=388.325, `orientation`=4.95433 WHERE `guid`=8968; -- Stonesplinter Bonesnapper
UPDATE `creature` SET `position_x`=3716.88, `position_y`=-5250.05, `position_z`=84.9577, `orientation`=5.73258 WHERE `guid`=35419; -- Spitelash Serpent Guard
UPDATE `creature` SET `position_x`=-613.485, `position_y`=-4652.59, `position_z`=5.12754, `orientation`=0.478344 WHERE `guid`=92906; -- Revantusk Watcher
UPDATE `creature` SET `position_x`=2448.43, `position_y`=-1617.53, `position_z`=107.405, `orientation`=3.95534 WHERE `guid`=47160; -- Scarlet Knight
UPDATE `creature` SET `position_x`=-1648.94, `position_y`=-1790.69, `position_z`=91.75, `orientation`=1.11077 WHERE `guid`=20114; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-11482.3, `position_y`=-2849.01, `position_z`=3.20056, `orientation`=5.05106 WHERE `guid`=3894; -- Dreadmaul Mauler
UPDATE `creature` SET `position_x`=-11479.8, `position_y`=-2818.19, `position_z`=-0.909903, `orientation`=2.86802 WHERE `guid`=2715; -- Dreadmaul Mauler
UPDATE `creature` SET `position_x`=2382.26, `position_y`=-1554.62, `position_z`=109.227, `orientation`=1.08875 WHERE `guid`=45379; -- Scarlet Knight
UPDATE `creature` SET `position_x`=1939.43, `position_y`=-1619.96, `position_z`=66.0199, `orientation`=3.21141 WHERE `guid`=47636; -- Blighted Zombie
UPDATE `creature` SET `position_x`=-4005.97, `position_y`=-184.2, `position_z`=139.627, `orientation`=5.54822 WHERE `guid`=50176; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-3953.87, `position_y`=-91.5755, `position_z`=150.856, `orientation`=3.29279 WHERE `guid`=50200; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-4883.96, `position_y`=549.838, `position_z`=11.3322, `orientation`=0.94737 WHERE `guid`=50394; -- Woodpaw Mongrel
UPDATE `creature` SET `position_x`=-4915.27, `position_y`=648.859, `position_z`=38.8906, `orientation`=4.00084 WHERE `guid`=50543; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=-4945.22, `position_y`=613.298, `position_z`=23.1234, `orientation`=5.659 WHERE `guid`=50503; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=-4949.79, `position_y`=584.459, `position_z`=13.9958, `orientation`=5.78209 WHERE `guid`=50501; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=-3947.3, `position_y`=181.165, `position_z`=106.157, `orientation`=1.01386 WHERE `guid`=50216; -- Gordunni Ogre
UPDATE `creature` SET `position_x`=-5515.08, `position_y`=1650.05, `position_z`=53.1598, `orientation`=2.41184 WHERE `guid`=51162; -- Frayfeather Stagwing
UPDATE `creature` SET `position_x`=1793.35, `position_y`=-1508.28, `position_z`=60.3062, `orientation`=3.29867 WHERE `guid`=48186; -- Rotting Cadaver
UPDATE `creature` SET `position_x`=-5550.88, `position_y`=1684.12, `position_z`=69.4902, `orientation`=5.095 WHERE `guid`=51163; -- Frayfeather Stagwing
UPDATE `creature` SET `position_x`=-5244.97, `position_y`=217.465, `position_z`=58.1993, `orientation`=5.97981 WHERE `guid`=50348; -- Zukk'ash Worker
UPDATE `creature` SET `position_x`=-3005.05, `position_y`=2754.76, `position_z`=53.3688, `orientation`=0.820227 WHERE `guid`=51774; -- Northspring Harpy
UPDATE `creature` SET `position_x`=-3850.61, `position_y`=1646.06, `position_z`=144.982, `orientation`=3.61373 WHERE `guid`=51105; -- Ferocious Rage Scar
UPDATE `creature` SET `position_x`=-8547.5, `position_y`=1476.41, `position_z`=31.9904, `orientation`=1.76278 WHERE `guid`=301017; -- Hive'Zara Wasp
UPDATE `creature` SET `position_x`=-8517.44, `position_y`=1505.66, `position_z`=33.3647, `orientation`=0.837758 WHERE `guid`=301003; -- Qiraji Gladiator
UPDATE `creature` SET `position_x`=-8531.85, `position_y`=1515.69, `position_z`=33.2644, `orientation`=0.767945 WHERE `guid`=87526; -- Qiraji Gladiator
UPDATE `creature` SET `position_x`=-8619.19, `position_y`=1514.31, `position_z`=32.138, `orientation`=1.71042 WHERE `guid`=301045; -- Hive'Zara Stinger (WAYPOINTS)
UPDATE `creature` SET `position_x`=-8600.62, `position_y`=1483.55, `position_z`=32.8614, `orientation`=3.00197 WHERE `guid`=301044; -- Qiraji Swarmguard (WAYPOINTS)
UPDATE `creature` SET `position_x`=-7251.44, `position_y`=-383.722, `position_z`=-267.52, `orientation`=4.13586 WHERE `guid`=24038; -- Bloodpetal Trapper
UPDATE `creature` SET `position_x`=-11953.4, `position_y`=-1542.74, `position_z`=39.7212, `orientation`=3.6209 WHERE `guid`=91531; -- Snake
UPDATE `creature` SET `position_x`=-13250.5, `position_y`=-508.277, `position_z`=18.0681, `orientation`=6.04866 WHERE `guid`=1279; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=-13222.1, `position_y`=-502.274, `position_z`=9.68024, `orientation`=2.65217 WHERE `guid`=612; -- Ironjaw Basilisk
UPDATE `creature` SET `position_x`=222.07, `position_y`=-2722.03, `position_z`=120.83, `orientation`=5.4427 WHERE `guid`=93502; -- Highvale Marksman
UPDATE `creature` SET `position_x`=-12049.7, `position_y`=-1739.52, `position_z`=52.7133, `orientation`=1.87496 WHERE `guid`=91539; -- Snake
UPDATE `creature` SET `position_x`=-7389.45, `position_y`=-1524.65, `position_z`=-271.057, `orientation`=4.4144 WHERE `guid`=24152; -- Scorching Elemental
UPDATE `creature` SET `position_x`=-7019.7, `position_y`=-1420.68, `position_z`=-247.92, `orientation`=0.890413 WHERE `guid`=24149; -- Scorching Elemental (WAYPOINTS)
UPDATE `creature` SET `position_x`=-7884.32, `position_y`=-5183.77, `position_z`=2.72993, `orientation`=5.26387 WHERE `guid`=23305; -- Southsea Pirate
UPDATE `creature` SET `position_x`=-7957.61, `position_y`=-1094.21, `position_z`=-329.622, `orientation`=0 WHERE `guid`=24329; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-7971.01, `position_y`=-1076.3, `position_z`=-328.844, `orientation`=0.0731864 WHERE `guid`=24338; -- Gorishi Reaver
UPDATE `creature` SET `position_x`=-6486.04, `position_y`=682.768, `position_z`=5.44479, `orientation`=4.1578 WHERE `guid`=44406; -- Sand Skitterer
UPDATE `creature` SET `position_x`=-6348.97, `position_y`=615.531, `position_z`=0.6834, `orientation`=2.39176 WHERE `guid`=45503; -- Sand Skitterer
UPDATE `creature` SET `id`=11738 WHERE `guid`=45503; -- Sand Skitterer
UPDATE `creature` SET `id2`=11740 WHERE `guid`=45503; -- Dredge Striker
UPDATE `creature` SET `position_x`=-6281.97, `position_y`=617.766, `position_z`=7.2031, `orientation`=6.22838 WHERE `guid`=43955; -- Stonelash Scorpid
UPDATE `creature` SET `position_x`=6401.24, `position_y`=-1289.55, `position_z`=378.552, `orientation`=4.6328 WHERE `guid`=39478; -- Irontree Stomper
UPDATE `creature` SET `position_x`=3681.75, `position_y`=-5213.63, `position_z`=81.6161, `orientation`=0.407658 WHERE `guid`=35449; -- Spitelash Serpent Guard
UPDATE `creature` SET `position_x`=-12150.5, `position_y`=-1821.87, `position_z`=88.6047, `orientation`=2.50342 WHERE `guid`=49695; -- Snake
UPDATE `creature` SET `position_x`=1816.94, `position_y`=651.214, `position_z`=39.3614, `orientation`=4.16297 WHERE `guid`=44580; -- Scarlet Missionary (WAYPOINTS)
UPDATE `creature` SET `position_x`=-6918.65, `position_y`=1215.92, `position_z`=1.5079, `orientation`=3.98368 WHERE `guid`=43006; -- Twilight Geolord
UPDATE `creature` SET `id`=11880 WHERE `guid`=43006; -- Twilight Avenger
UPDATE `creature` SET `id2`=11881 WHERE `guid`=43006; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-14584.4, `position_y`=-149.76, `position_z`=5.60917, `orientation`=5.21002 WHERE `guid`=632; -- Jaguero Stalker
UPDATE `creature` SET `position_x`=-14732.5, `position_y`=-361.508, `position_z`=6.65323, `orientation`=1.70799 WHERE `guid`=924; -- Skymane Gorilla
UPDATE `creature` SET `position_x`=-12349.6, `position_y`=-982.153, `position_z`=13.8001, `orientation`=1.0472 WHERE `guid`=855; -- Mosh'Ogg Shaman
UPDATE `creature` SET `position_x`=-12348.6, `position_y`=-1019.49, `position_z`=8.0292, `orientation`=5.04078 WHERE `guid`=755; -- Mosh'Ogg Mauler
UPDATE `creature` SET `position_x`=3014.48, `position_y`=-4187.32, `position_z`=98.9261, `orientation`=2.02811 WHERE `guid`=36159; -- Highborne Apparition
UPDATE `creature` SET `position_x`=-6913.68, `position_y`=1149.65, `position_z`=2.34599, `orientation`=5.99664 WHERE `guid`=42956; -- Twilight Avenger (WAYPOINTS)
UPDATE `creature` SET `position_x`=-6717.44, `position_y`=1582.06, `position_z`=8.064, `orientation`=4.81047 WHERE `guid`=43032; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-11146.1, `position_y`=-2067.86, `position_z`=47.8752, `orientation`=1.54659 WHERE `guid`=4042; -- Unliving Resident
UPDATE `creature` SET `position_x`=-11164.4, `position_y`=-2072.64, `position_z`=48.1879, `orientation`=5.81332 WHERE `guid`=4015; -- Unliving Resident
UPDATE `creature` SET `position_x`=-6454.08, `position_y`=1851.62, `position_z`=5.81059, `orientation`=1.8257 WHERE `guid`=46105; -- Dust Stormer
UPDATE `creature` SET `position_x`=-409.405, `position_y`=-4022.63, `position_z`=195.321, `orientation`=2.91588 WHERE `guid`=93677; -- Vilebranch Hideskinner (WAYPOINTS)
UPDATE `creature` SET `position_x`=-7015.06, `position_y`=1212.91, `position_z`=8.45344, `orientation`=4.10152 WHERE `guid`=42991; -- Twilight Avenger
UPDATE `creature` SET `id`=11880 WHERE `guid`=42991; -- Twilight Avenger
UPDATE `creature` SET `id2`=11881 WHERE `guid`=42991; -- Twilight Geolord
UPDATE `creature` SET `position_x`=-369.332, `position_y`=-3976.06, `position_z`=195.125, `orientation`=1.07087 WHERE `guid`=93726; -- Vilebranch Shadow Hunter
UPDATE `creature` SET `position_x`=-295.934, `position_y`=-3989.05, `position_z`=195.222, `orientation`=5.57523 WHERE `guid`=93733; -- Vilebranch Shadow Hunter
UPDATE `creature` SET `position_x`=-6245.43, `position_y`=-42.8366, `position_z`=-5.05335, `orientation`=3.74035 WHERE `guid`=42930; -- Twilight Flamereaver
UPDATE `creature` SET `position_x`=-6253.36, `position_y`=61.094, `position_z`=17.3447, `orientation`=4.99164 WHERE `guid`=42924; -- Twilight Flamereaver
UPDATE `creature` SET `position_x`=-6260.24, `position_y`=-9.77062, `position_z`=2.00612, `orientation`=0.845407 WHERE `guid`=42931; -- Twilight Flamereaver
UPDATE `creature` SET `position_x`=-368.026, `position_y`=-3884.09, `position_z`=215.944, `orientation`=1.1715 WHERE `guid`=93689; -- Vilebranch Soul Eater
UPDATE `creature` SET `position_x`=-392.529, `position_y`=-3947.25, `position_z`=215.944, `orientation`=5.69379 WHERE `guid`=93599; -- Vilebranch Blood Drinker
UPDATE `creature` SET `position_x`=-297.212, `position_y`=-3913.92, `position_z`=215.944, `orientation`=0.767944 WHERE `guid`=93693; -- Vilebranch Blood Drinker
UPDATE `creature` SET `position_x`=-283.834, `position_y`=-3901.89, `position_z`=215.944, `orientation`=0.602481 WHERE `guid`=93704; -- Vilebranch Blood Drinker
UPDATE `creature` SET `position_x`=-7688.68, `position_y`=-1470.46, `position_z`=140.837, `orientation`=5.00556 WHERE `guid`=5536; -- Blackrock Warlock
UPDATE `creature` SET `position_x`=-274.529, `position_y`=-3915.49, `position_z`=215.944, `orientation`=5.16435 WHERE `guid`=93703; -- Vilebranch Blood Drinker
UPDATE `creature` SET `position_x`=2922.04, `position_y`=-3359.7, `position_z`=298.229, `orientation`=6.14356 WHERE `guid`=88395; -- Deathknight Captain
UPDATE `creature` SET `position_x`=2951.98, `position_y`=-3347.99, `position_z`=298.214, `orientation`=4.20624 WHERE `guid`=88401; -- Risen Deathknight
UPDATE `creature` SET `position_x`=2871.92, `position_y`=-3540.69, `position_z`=297.699, `orientation`=0.837758 WHERE `guid`=88090; -- Plague Slime
UPDATE `creature` SET `position_x`=2899.31, `position_y`=-3481.33, `position_z`=297.949, `orientation`=3.66519 WHERE `guid`=88084; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=2933.47, `position_y`=-3349.99, `position_z`=298.229, `orientation`=5.20108 WHERE `guid`=88396; -- Deathknight Captain
UPDATE `creature` SET `position_x`=2928.97, `position_y`=-3386.11, `position_z`=298.214, `orientation`=0.925025 WHERE `guid`=88403; -- Risen Deathknight
UPDATE `creature` SET `position_x`=3136.61, `position_y`=-3353.29, `position_z`=294.051, `orientation`=2.46091 WHERE `guid`=88268; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2921.82, `position_y`=-3378.72, `position_z`=298.214, `orientation`=0.680678 WHERE `guid`=88402; -- Risen Deathknight
UPDATE `creature` SET `position_x`=2840.63, `position_y`=-3479.6, `position_z`=297.95, `orientation`=5.02655 WHERE `guid`=88092; -- Stoneskin Gargoyle
UPDATE `creature` SET `position_x`=3096.72, `position_y`=-3292.51, `position_z`=294.597, `orientation`=5.60251 WHERE `guid`=88271; -- Bile Retcher
UPDATE `creature` SET `position_x`=2929.95, `position_y`=-3527.89, `position_z`=297.837, `orientation`=2.21657 WHERE `guid`=88080; -- Plague Slime
UPDATE `creature` SET `position_x`=2932.04, `position_y`=-3521.47, `position_z`=297.423, `orientation`=2.58309 WHERE `guid`=88081; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3053.63, `position_y`=-3354.67, `position_z`=298.401, `orientation`=4.95674 WHERE `guid`=88264; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2875.72, `position_y`=-3547.32, `position_z`=297.698, `orientation`=0.925025 WHERE `guid`=88091; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3149.04, `position_y`=-3345.12, `position_z`=294.592, `orientation`=2.46091 WHERE `guid`=88272; -- Bile Retcher
UPDATE `creature` SET `position_x`=2936.26, `position_y`=-3517.2, `position_z`=297.738, `orientation`=1.51844 WHERE `guid`=88079; -- Plague Slime
UPDATE `creature` SET `position_x`=2939.56, `position_y`=-3513.23, `position_z`=297.712, `orientation`=1.06465 WHERE `guid`=88083; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3074.45, `position_y`=-3353.69, `position_z`=298.401, `orientation`=4.31096 WHERE `guid`=88261; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2955.9, `position_y`=-3351.68, `position_z`=299.084, `orientation`=3.85718 WHERE `guid`=88394; -- Deathknight
UPDATE `creature` SET `position_x`=2920.97, `position_y`=-3290.25, `position_z`=298.229, `orientation`=0.820305 WHERE `guid`=88408; -- Skeletal Smith
UPDATE `creature` SET `position_x`=2885.54, `position_y`=-3477.05, `position_z`=297.705, `orientation`=3.7001 WHERE `guid`=88087; -- Plague Slime
UPDATE `creature` SET `position_x`=2931.76, `position_y`=-3513.61, `position_z`=297.806, `orientation`=2.25147 WHERE `guid`=88082; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3087.42, `position_y`=-3367.65, `position_z`=298.401, `orientation`=3.7001 WHERE `guid`=88262; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2924.77, `position_y`=-3382.63, `position_z`=299.084, `orientation`=0.802851 WHERE `guid`=88393; -- Deathknight
UPDATE `creature` SET `position_x`=2911.86, `position_y`=-3298.02, `position_z`=298.63, `orientation`=5.044 WHERE `guid`=88409; -- Skeletal Smith
UPDATE `creature` SET `position_x`=2897.14, `position_y`=-3489.76, `position_z`=297.95, `orientation`=3.87463 WHERE `guid`=88086; -- Plague Slime
UPDATE `creature` SET `position_x`=2888.01, `position_y`=-3486.66, `position_z`=297.704, `orientation`=3.92699 WHERE `guid`=88088; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3086.04, `position_y`=-3386.81, `position_z`=298.401, `orientation`=3.1765 WHERE `guid`=88263; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2960.05, `position_y`=-3355.76, `position_z`=298.214, `orientation`=4.10152 WHERE `guid`=88400; -- Risen Deathknight
UPDATE `creature` SET `position_x`=2894.23, `position_y`=-3474.81, `position_z`=297.718, `orientation`=3.735 WHERE `guid`=88085; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3088.14, `position_y`=-3305.5, `position_z`=294.025, `orientation`=5.5676 WHERE `guid`=88265; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2839.23, `position_y`=-3337.89, `position_z`=300.911, `orientation`=0.349066 WHERE `guid`=88419; -- Bony Construct
UPDATE `creature` SET `position_x`=3109.14, `position_y`=-3284.2, `position_z`=294.035, `orientation`=5.63741 WHERE `guid`=88266; -- Patchwork Golem
UPDATE `creature` SET `position_x`=2840.73, `position_y`=-3499.91, `position_z`=297.94, `orientation`=1.25664 WHERE `guid`=88093; -- Stoneskin Gargoyle
UPDATE `creature` SET `position_x`=2866.23, `position_y`=-3547.93, `position_z`=297.947, `orientation`=0.418879 WHERE `guid`=88276; -- Infectious Ghoul
UPDATE `creature` SET `position_x`=3157.59, `position_y`=-3332.37, `position_z`=294.048, `orientation`=2.54818 WHERE `guid`=88267; -- Patchwork Golem
UPDATE `creature` SET `position_x`=3000.67, `position_y`=-3251.03, `position_z`=294.146, `orientation`=0.663225 WHERE `guid`=302560; -- Living Monstrosity
UPDATE `creature` SET `position_x`=2908.99, `position_y`=-3276.91, `position_z`=298.229, `orientation`=1.58825 WHERE `guid`=88410; -- Skeletal Smith (WAYPOINTS)
UPDATE `creature` SET `position_x`=3002.89, `position_y`=-3247.09, `position_z`=294.146, `orientation`=4.36332 WHERE `guid`=302565; -- Mad Scientist
UPDATE `creature` SET `position_x`=3004.33, `position_y`=-3247.28, `position_z`=294.146, `orientation`=3.97935 WHERE `guid`=302564; -- Surgical Assistant
UPDATE `creature` SET `position_x`=2999.81, `position_y`=-3246.63, `position_z`=294.146, `orientation`=5.23599 WHERE `guid`=302566; -- Mad Scientist
UPDATE `creature` SET `position_x`=3001.93, `position_y`=-3246, `position_z`=294.146, `orientation`=4.67748 WHERE `guid`=302563; -- Surgical Assistant
UPDATE `creature` SET `position_x`=2997.29, `position_y`=-3247.82, `position_z`=294.146, `orientation`=5.81195 WHERE `guid`=302561; -- Surgical Assistant
UPDATE `creature` SET `position_x`=-419.14, `position_y`=-3922.7, `position_z`=215.268, `orientation`=1.62014 WHERE `guid`=93226; -- Jade Sludge
UPDATE `creature` SET `position_x`=-385.127, `position_y`=-3933.59, `position_z`=215.944, `orientation`=5.25344 WHERE `guid`=93232; -- Vilebranch Blood Drinker
UPDATE `creature` SET `position_x`=-6416.96, `position_y`=1484.29, `position_z`=2.4479, `orientation`=1.40838 WHERE `guid`=46091; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6283.69, `position_y`=1550.08, `position_z`=4.70046, `orientation`=3.82929 WHERE `guid`=46138; -- Desert Rumbler (WAYPOINTS)
UPDATE `creature` SET `position_x`=-6351.01, `position_y`=1482.79, `position_z`=6.65775, `orientation`=2.21336 WHERE `guid`=46078; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6284.8, `position_y`=1416.28, `position_z`=11.0424, `orientation`=1.51434 WHERE `guid`=46080; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6315.99, `position_y`=1383.67, `position_z`=5.30556, `orientation`=1.12195 WHERE `guid`=46085; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6384.41, `position_y`=1449.9, `position_z`=0.769446, `orientation`=6.21878 WHERE `guid`=46083; -- Dust Stormer
UPDATE `creature` SET `position_x`=2946.03, `position_y`=-3163.86, `position_z`=273.87, `orientation`=3.42821 WHERE `guid`=128389; -- Rat
UPDATE `creature` SET `position_x`=-6286.04, `position_y`=1483.79, `position_z`=8.25814, `orientation`=1.33435 WHERE `guid`=46077; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6386.17, `position_y`=1516.14, `position_z`=4.33633, `orientation`=5.98524 WHERE `guid`=46090; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6319.2, `position_y`=1517.24, `position_z`=3.05767, `orientation`=4.86928 WHERE `guid`=46079; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6349.84, `position_y`=1416.77, `position_z`=1.87424, `orientation`=2.00241 WHERE `guid`=46081; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6451.11, `position_y`=1514.61, `position_z`=5.58365, `orientation`=3.51813 WHERE `guid`=46089; -- Dust Stormer
UPDATE `creature` SET `position_x`=-6418.75, `position_y`=1542.74, `position_z`=13.2335, `orientation`=2.30413 WHERE `guid`=46076; -- Dust Stormer
UPDATE `creature` SET `position_x`=2637.99, `position_y`=-3520.7, `position_z`=261.978, `orientation`=5.0185 WHERE `guid`=128407; -- Rat
UPDATE `creature` SET `position_x`=2862.9, `position_y`=-3674.58, `position_z`=277.701, `orientation`=3.08511 WHERE `guid`=128320; -- Larva
UPDATE `creature` SET `position_x`=7726.14, `position_y`=-3883.09, `position_z`=691.171, `orientation`=4.37396 WHERE `guid`=40867; -- Frostsaber Cub
UPDATE `creature` SET `position_x`=9915.41, `position_y`=1850.48, `position_z`=1320.35, `orientation`=3.25445 WHERE `guid`=49925; -- Nightsaber Stalker
UPDATE `creature` SET `position_x`=-5191.06, `position_y`=-623.539, `position_z`=399.448, `orientation`=5.84918 WHERE `guid`=67087; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5143.07, `position_y`=-588.042, `position_z`=399.502, `orientation`=2.62044 WHERE `guid`=67097; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5141.23, `position_y`=-659.017, `position_z`=401.799, `orientation`=4.33643 WHERE `guid`=67099; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5176.3, `position_y`=-591.736, `position_z`=397.886, `orientation`=4.81711 WHERE `guid`=67089; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5144.77, `position_y`=-609.512, `position_z`=398.967, `orientation`=4.495 WHERE `guid`=67098; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5208.71, `position_y`=-611.287, `position_z`=404.816, `orientation`=2.63866 WHERE `guid`=67084; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5172.09, `position_y`=-606.646, `position_z`=397.746, `orientation`=3.72271 WHERE `guid`=67093; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5193.07, `position_y`=-661.447, `position_z`=413.937, `orientation`=3.61884 WHERE `guid`=67088; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5157.45, `position_y`=-574.434, `position_z`=398.998, `orientation`=4.903 WHERE `guid`=67095; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5178.42, `position_y`=-553.342, `position_z`=398.102, `orientation`=2.9553 WHERE `guid`=67090; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5125.61, `position_y`=-572.409, `position_z`=403.128, `orientation`=4.56886 WHERE `guid`=67082; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5172.85, `position_y`=-666.148, `position_z`=408.721, `orientation`=1.18356 WHERE `guid`=67075; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5194.43, `position_y`=-559.338, `position_z`=396.88, `orientation`=1.14633 WHERE `guid`=67072; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5124.48, `position_y`=-608.489, `position_z`=398.888, `orientation`=0.292252 WHERE `guid`=67083; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5126.87, `position_y`=-672.696, `position_z`=408.134, `orientation`=2.83411 WHERE `guid`=67081; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5193.28, `position_y`=-638.902, `position_z`=403.036, `orientation`=3.00478 WHERE `guid`=67071; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5141.73, `position_y`=-625.044, `position_z`=396, `orientation`=2.51587 WHERE `guid`=67079; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5159.11, `position_y`=-659.359, `position_z`=401.477, `orientation`=0.618696 WHERE `guid`=67076; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5208.49, `position_y`=-576.049, `position_z`=400.961, `orientation`=4.15947 WHERE `guid`=67069; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5193.44, `position_y`=-608.284, `position_z`=398.297, `orientation`=0.593264 WHERE `guid`=67070; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5158.14, `position_y`=-641.97, `position_z`=395.852, `orientation`=0.0418265 WHERE `guid`=67094; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5193.83, `position_y`=-589.28, `position_z`=398.769, `orientation`=0.75173 WHERE `guid`=67086; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5157.25, `position_y`=-624.006, `position_z`=396.869, `orientation`=0.585034 WHERE `guid`=67096; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5177.64, `position_y`=-647.163, `position_z`=401.092, `orientation`=1.63087 WHERE `guid`=67091; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-5173.32, `position_y`=-574.801, `position_z`=396.83, `orientation`=4.19687 WHERE `guid`=67092; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=2010.31, `position_y`=292.357, `position_z`=47.9491, `orientation`=5.46729 WHERE `guid`=67066; -- Spectral Apparition
UPDATE `creature` SET `position_x`=2025.48, `position_y`=326.184, `position_z`=46.5013, `orientation`=3.27346 WHERE `guid`=67067; -- Spectral Apparition
UPDATE `creature` SET `position_x`=1189.68, `position_y`=-4321.83, `position_z`=21.7062, `orientation`=2.60527 WHERE `guid`=67119; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1226.92, `position_y`=-4325.25, `position_z`=25.8494, `orientation`=2.14814 WHERE `guid`=67126; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1147.36, `position_y`=-4324.34, `position_z`=23.8895, `orientation`=2.57482 WHERE `guid`=67115; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1242.5, `position_y`=-4308.1, `position_z`=28.4669, `orientation`=1.46432 WHERE `guid`=67130; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1210.3, `position_y`=-4323.29, `position_z`=23.2734, `orientation`=1.10274 WHERE `guid`=67124; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-9208.3, `position_y`=324.625, `position_z`=73.6151, `orientation`=3.94444 WHERE `guid`=67008; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9225.41, `position_y`=354.81, `position_z`=73.3402, `orientation`=0.366519 WHERE `guid`=67003; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9207.19, `position_y`=255.207, `position_z`=73.9707, `orientation`=4.55531 WHERE `guid`=67009; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9223.56, `position_y`=323.409, `position_z`=73.3968, `orientation`=2.61799 WHERE `guid`=67005; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9209.55, `position_y`=353.762, `position_z`=73.849, `orientation`=1.23918 WHERE `guid`=67007; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9226.52, `position_y`=257.796, `position_z`=72.3674, `orientation`=5.27089 WHERE `guid`=67004; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-5159.66, `position_y`=-606.987, `position_z`=399.423, `orientation`=5.30307 WHERE `guid`=67077; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5157.64, `position_y`=-589.138, `position_z`=399.107, `orientation`=0.0929254 WHERE `guid`=67078; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5138.2, `position_y`=-640.783, `position_z`=396.344, `orientation`=3.21955 WHERE `guid`=67080; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5176.13, `position_y`=-624.952, `position_z`=396.463, `orientation`=5.98386 WHERE `guid`=67074; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-5193.22, `position_y`=-574.374, `position_z`=398.728, `orientation`=5.74848 WHERE `guid`=67073; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-9226.37, `position_y`=306.575, `position_z`=74.5378, `orientation`=2.75762 WHERE `guid`=67037; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9225.49, `position_y`=373.623, `position_z`=73.1641, `orientation`=5.89921 WHERE `guid`=67038; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9223.56, `position_y`=339.456, `position_z`=73.8513, `orientation`=4.71239 WHERE `guid`=67040; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9241.08, `position_y`=322.691, `position_z`=74.4411, `orientation`=3.57792 WHERE `guid`=67036; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9192.88, `position_y`=357.69, `position_z`=75.1755, `orientation`=0.0872665 WHERE `guid`=67044; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9190.56, `position_y`=374.964, `position_z`=74.6175, `orientation`=5.61996 WHERE `guid`=67045; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9207.78, `position_y`=339.332, `position_z`=72.7628, `orientation`=3.07178 WHERE `guid`=67043; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9208.61, `position_y`=307.017, `position_z`=74.7344, `orientation`=2.75762 WHERE `guid`=67042; -- Spectral Apparition
UPDATE `creature` SET `position_x`=1990.49, `position_y`=345.272, `position_z`=40.0696, `orientation`=1.65913 WHERE `guid`=67062; -- Spectral Apparition
UPDATE `creature` SET `position_x`=1977.61, `position_y`=292.986, `position_z`=41.515, `orientation`=5.68878 WHERE `guid`=67060; -- Spectral Apparition
UPDATE `creature` SET `position_x`=2041.46, `position_y`=326.857, `position_z`=50.2251, `orientation`=2.88294 WHERE `guid`=67068; -- Spectral Apparition
UPDATE `creature` SET `position_x`=1992.55, `position_y`=310.513, `position_z`=41.3644, `orientation`=4.70379 WHERE `guid`=67063; -- Spectral Apparition
UPDATE `creature` SET `position_x`=1992.29, `position_y`=277.838, `position_z`=47.1022, `orientation`=2.48893 WHERE `guid`=67061; -- Spectral Apparition
UPDATE `creature` SET `position_x`=9926.35, `position_y`=1840.37, `position_z`=1323.2, `orientation`=2.17947 WHERE `guid`=67186; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9889.47, `position_y`=1860.38, `position_z`=1317.56, `orientation`=5.09769 WHERE `guid`=67179; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9892.34, `position_y`=1844.96, `position_z`=1319.13, `orientation`=4.72984 WHERE `guid`=67180; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9906.6, `position_y`=1860.25, `position_z`=1319.66, `orientation`=0.255044 WHERE `guid`=67182; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9872.75, `position_y`=1869.78, `position_z`=1322.73, `orientation`=1.03947 WHERE `guid`=67178; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1977.65, `position_y`=323.949, `position_z`=39.8178, `orientation`=2.22497 WHERE `guid`=67028; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=1974.25, `position_y`=341.438, `position_z`=41.4593, `orientation`=1.05711 WHERE `guid`=67027; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=2009.02, `position_y`=309.944, `position_z`=44.3937, `orientation`=4.32473 WHERE `guid`=67030; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=2025.8, `position_y`=310.15, `position_z`=48.1345, `orientation`=3.89455 WHERE `guid`=67034; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=1992.23, `position_y`=291.987, `position_z`=45.7473, `orientation`=4.00686 WHERE `guid`=67029; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=9939.2, `position_y`=1924.07, `position_z`=1329.66, `orientation`=5.9987 WHERE `guid`=67142; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9940.23, `position_y`=1954.28, `position_z`=1335.71, `orientation`=0.020871 WHERE `guid`=67141; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9957.71, `position_y`=1925.8, `position_z`=1327.6, `orientation`=5.77138 WHERE `guid`=67146; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9940.2, `position_y`=1939.91, `position_z`=1330.9, `orientation`=3.65807 WHERE `guid`=67143; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9943.01, `position_y`=1888.31, `position_z`=1327.05, `orientation`=1.66524 WHERE `guid`=67144; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9907.36, `position_y`=1840.28, `position_z`=1319.96, `orientation`=5.66048 WHERE `guid`=67135; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9924.32, `position_y`=1824.72, `position_z`=1324.44, `orientation`=4.05846 WHERE `guid`=67138; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9907.63, `position_y`=1890.99, `position_z`=1323.66, `orientation`=3.76371 WHERE `guid`=67136; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9927.95, `position_y`=1861.29, `position_z`=1322.51, `orientation`=3.68901 WHERE `guid`=67140; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9873.98, `position_y`=1881.84, `position_z`=1325.2, `orientation`=1.74748 WHERE `guid`=67132; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9923.78, `position_y`=1878.97, `position_z`=1324.58, `orientation`=5.44933 WHERE `guid`=67139; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9920.43, `position_y`=1906.32, `position_z`=1327.07, `orientation`=3.98254 WHERE `guid`=67137; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9894.58, `position_y`=1873.58, `position_z`=1320.51, `orientation`=2.22655 WHERE `guid`=67134; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9873.22, `position_y`=1860.1, `position_z`=1319.36, `orientation`=0.150392 WHERE `guid`=67133; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1227.44, `position_y`=-4308.01, `position_z`=25.112, `orientation`=4.36058 WHERE `guid`=67127; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1171.95, `position_y`=-4342.67, `position_z`=25.3053, `orientation`=5.77195 WHERE `guid`=67118; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1204.55, `position_y`=-4339.09, `position_z`=25.5045, `orientation`=5.52536 WHERE `guid`=67122; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1173.62, `position_y`=-4308.4, `position_z`=20.8017, `orientation`=4.50295 WHERE `guid`=67117; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9941.27, `position_y`=1875.73, `position_z`=1325.67, `orientation`=0.542241 WHERE `guid`=67187; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9907.55, `position_y`=1872.97, `position_z`=1320.55, `orientation`=1.79572 WHERE `guid`=67181; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9942.75, `position_y`=1859.53, `position_z`=1324.35, `orientation`=3.97699 WHERE `guid`=67188; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9960.69, `position_y`=1873.77, `position_z`=1324.49, `orientation`=3.40416 WHERE `guid`=67190; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9923.62, `position_y`=1891.61, `position_z`=1326.37, `orientation`=4.13039 WHERE `guid`=67183; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1475.24, `position_y`=7.83225, `position_z`=26.2654, `orientation`=0.361255 WHERE `guid`=67114; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1575.6, `position_y`=44.6215, `position_z`=1.63601, `orientation`=3.02242 WHERE `guid`=67100; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1541.86, `position_y`=89.9928, `position_z`=-0.836067, `orientation`=0.837758 WHERE `guid`=67106; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1557.58, `position_y`=-22.776, `position_z`=8.83432, `orientation`=0.884217 WHERE `guid`=67104; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1523.54, `position_y`=54.8383, `position_z`=6.13107, `orientation`=0.125006 WHERE `guid`=67108; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1172.73, `position_y`=-4327.02, `position_z`=22.0216, `orientation`=1.09122 WHERE `guid`=67163; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1244.84, `position_y`=-4374.43, `position_z`=27.9372, `orientation`=5.04125 WHERE `guid`=67176; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1240.89, `position_y`=-4325.15, `position_z`=29.9222, `orientation`=0.398358 WHERE `guid`=67175; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1175.07, `position_y`=-4357.89, `position_z`=26.8588, `orientation`=5.32325 WHERE `guid`=67165; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1225.33, `position_y`=-4341.79, `position_z`=26.5733, `orientation`=3.82625 WHERE `guid`=67171; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-8606.58, `position_y`=859.028, `position_z`=96.7636, `orientation`=2.10943 WHERE `guid`=12093; -- Stormwind City Patroller (WAYPOINTS)
UPDATE `creature` SET `position_x`=1191.08, `position_y`=-4357.62, `position_z`=27.749, `orientation`=2.41905 WHERE `guid`=67121; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1156.1, `position_y`=-4343.53, `position_z`=25.8797, `orientation`=1.78485 WHERE `guid`=67116; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1258.84, `position_y`=-4373.13, `position_z`=28.7774, `orientation`=3.82573 WHERE `guid`=67131; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1207.68, `position_y`=-4287.86, `position_z`=22.485, `orientation`=3.83972 WHERE `guid`=67123; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1191.45, `position_y`=-4286.37, `position_z`=21.2201, `orientation`=0.593412 WHERE `guid`=67120; -- Spectral Spirit
UPDATE `creature` SET `position_x`=9958.77, `position_y`=1904.66, `position_z`=1326.6, `orientation`=2.12705 WHERE `guid`=67189; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9972.98, `position_y`=1926.66, `position_z`=1326.75, `orientation`=2.7647 WHERE `guid`=67191; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9926.43, `position_y`=1959.37, `position_z`=1339.14, `orientation`=4.4009 WHERE `guid`=67184; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9972.37, `position_y`=1941.5, `position_z`=1327.35, `orientation`=0.409531 WHERE `guid`=67192; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9925.01, `position_y`=1938.92, `position_z`=1331.95, `orientation`=0.582976 WHERE `guid`=67185; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1246.95, `position_y`=-4385.95, `position_z`=28.4688, `orientation`=4.33315 WHERE `guid`=67177; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1226.42, `position_y`=-4372.58, `position_z`=28.7022, `orientation`=1.99807 WHERE `guid`=67173; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1173.75, `position_y`=-4283.53, `position_z`=20.7698, `orientation`=0.408861 WHERE `guid`=67164; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1189.31, `position_y`=-4343.56, `position_z`=25.8441, `orientation`=4.3805 WHERE `guid`=67166; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1224.77, `position_y`=-4287.22, `position_z`=23.3625, `orientation`=3.3798 WHERE `guid`=67172; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1541.74, `position_y`=24.4095, `position_z`=12.7886, `orientation`=3.24659 WHERE `guid`=67107; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1574.84, `position_y`=77.7345, `position_z`=-7.23697, `orientation`=2.74253 WHERE `guid`=67101; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1506.54, `position_y`=76.2188, `position_z`=6.25629, `orientation`=0.750718 WHERE `guid`=67111; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1542.25, `position_y`=57.6243, `position_z`=3.68054, `orientation`=3.77022 WHERE `guid`=67105; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1489.36, `position_y`=58.1138, `position_z`=12.7463, `orientation`=2.78068 WHERE `guid`=67112; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1509.16, `position_y`=92.1356, `position_z`=3.19217, `orientation`=4.27606 WHERE `guid`=67110; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1523.32, `position_y`=42.4703, `position_z`=10.2417, `orientation`=0.774447 WHERE `guid`=67109; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1558.53, `position_y`=41.1742, `position_z`=7.06617, `orientation`=1.16937 WHERE `guid`=67103; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1489.11, `position_y`=91.5441, `position_z`=6.36338, `orientation`=5.49487 WHERE `guid`=67113; -- Spectral Spirit
UPDATE `creature` SET `position_x`=-1575.05, `position_y`=23.9854, `position_z`=4.85027, `orientation`=4.3839 WHERE `guid`=67102; -- Spectral Spirit
UPDATE `creature` SET `position_x`=1192.17, `position_y`=-4306.93, `position_z`=21.2328, `orientation`=3.55576 WHERE `guid`=67167; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1155.88, `position_y`=-4309.86, `position_z`=20.9188, `orientation`=3.81997 WHERE `guid`=67162; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1209.29, `position_y`=-4358.01, `position_z`=27.4716, `orientation`=0.748028 WHERE `guid`=67168; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=1209.36, `position_y`=-4310.8, `position_z`=22.9504, `orientation`=5.41146 WHERE `guid`=67169; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1559.1, `position_y`=24.0625, `position_z`=8.7196, `orientation`=1.91986 WHERE `guid`=67151; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1543.48, `position_y`=42.5353, `position_z`=8.50159, `orientation`=2.76799 WHERE `guid`=67154; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1508.9, `position_y`=42.3158, `position_z`=11.5504, `orientation`=2.42609 WHERE `guid`=67159; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1557.8, `position_y`=76.2171, `position_z`=-3.3495, `orientation`=0.536828 WHERE `guid`=67153; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1488.71, `position_y`=76.3296, `position_z`=9.2439, `orientation`=1.40822 WHERE `guid`=67161; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1558.06, `position_y`=57.5885, `position_z`=2.02549, `orientation`=5.03573 WHERE `guid`=67152; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1540.14, `position_y`=-22.9825, `position_z`=13.7193, `orientation`=2.99244 WHERE `guid`=67155; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1523.79, `position_y`=26.224, `position_z`=14.3512, `orientation`=4.93879 WHERE `guid`=67158; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1523.47, `position_y`=76.5106, `position_z`=3.67229, `orientation`=5.12642 WHERE `guid`=67157; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1539.75, `position_y`=76.8899, `position_z`=0.381858, `orientation`=2.72271 WHERE `guid`=67156; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1507.54, `position_y`=58.8243, `position_z`=8.78051, `orientation`=3.86994 WHERE `guid`=67160; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1593.79, `position_y`=23.9679, `position_z`=-0.107843, `orientation`=5.18309 WHERE `guid`=67147; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1593.03, `position_y`=41.182, `position_z`=-3.30581, `orientation`=0.878813 WHERE `guid`=67149; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1592.87, `position_y`=57.2176, `position_z`=-8.33858, `orientation`=5.88176 WHERE `guid`=67148; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=-1573.32, `position_y`=61.2735, `position_z`=-2.99172, `orientation`=4.41404 WHERE `guid`=67150; -- Skeletal Trooper
UPDATE `creature` SET `position_x`=9898.72, `position_y`=1885.7, `position_z`=1322.65, `orientation`=4.08407 WHERE `guid`=47920; -- Rabbit
UPDATE `creature` SET `position_x`=-9222.97, `position_y`=409.064, `position_z`=86.3431, `orientation`=4.76326 WHERE `guid`=67039; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9173.54, `position_y`=393.35, `position_z`=85.455, `orientation`=3.99305 WHERE `guid`=67046; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9190.32, `position_y`=424.626, `position_z`=91.5562, `orientation`=4.03192 WHERE `guid`=67011; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9153.97, `position_y`=408.422, `position_z`=92.5331, `orientation`=2.76085 WHERE `guid`=67014; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9206.37, `position_y`=426.964, `position_z`=89.4854, `orientation`=4.14536 WHERE `guid`=67010; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9215.54, `position_y`=424.984, `position_z`=88.8037, `orientation`=4.57132 WHERE `guid`=80285; -- Cow
UPDATE `creature` SET `position_x`=-9030.87, `position_y`=883.516, `position_z`=110.279, `orientation`=5.68977 WHERE `guid`=90445; -- Erich Lohan (WAYPOINTS)
UPDATE `creature` SET `position_x`=7650.46, `position_y`=-3850.05, `position_z`=685.096, `orientation`=4.85561 WHERE `guid`=40902; -- Frostsaber
UPDATE `creature` SET `id`=7431 WHERE `guid`=40902; -- Frostsaber
UPDATE `creature` SET `id2`=7432 WHERE `guid`=40902; -- Frostsaber Stalker
UPDATE `creature` SET `position_x`=7715.04, `position_y`=-3852.92, `position_z`=692.489, `orientation`=3.44567 WHERE `guid`=40928; -- Frostsaber Stalker
UPDATE `creature` SET `id`=7432 WHERE `guid`=40928; -- Frostsaber Stalker
UPDATE `creature` SET `id2`=7433 WHERE `guid`=40928; -- Frostsaber Huntress
UPDATE `creature` SET `position_x`=7682.78, `position_y`=-3881.55, `position_z`=687.24, `orientation`=4.63814 WHERE `guid`=40934; -- Frostsaber Stalker
UPDATE `creature` SET `id`=7432 WHERE `guid`=40934; -- Frostsaber Stalker
UPDATE `creature` SET `id2`=7433 WHERE `guid`=40934; -- Frostsaber Huntress
UPDATE `creature` SET `position_x`=-9108.16, `position_y`=308.57, `position_z`=93.9508, `orientation`=5.85173 WHERE `guid`=67050; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9091.68, `position_y`=341.222, `position_z`=94.2467, `orientation`=4.92252 WHERE `guid`=67051; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9047.96, `position_y`=339.823, `position_z`=94.8636, `orientation`=0.472567 WHERE `guid`=67054; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9125.72, `position_y`=356.334, `position_z`=93.168, `orientation`=3.68107 WHERE `guid`=67049; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9045.48, `position_y`=355.503, `position_z`=94.379, `orientation`=4.06777 WHERE `guid`=67055; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9126.39, `position_y`=325.608, `position_z`=93.5681, `orientation`=5.57384 WHERE `guid`=67047; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9091.55, `position_y`=326.751, `position_z`=94.2161, `orientation`=0.877631 WHERE `guid`=67052; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9059.74, `position_y`=357.756, `position_z`=93.1185, `orientation`=0.0629808 WHERE `guid`=67053; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9044, `position_y`=323.21, `position_z`=93.7645, `orientation`=3.66519 WHERE `guid`=67056; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9127.29, `position_y`=339.268, `position_z`=93.9964, `orientation`=1.05193 WHERE `guid`=67048; -- Spectral Apparition
UPDATE `creature` SET `position_x`=-9074.97, `position_y`=304.922, `position_z`=92.7926, `orientation`=1.58089 WHERE `guid`=67022; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9109.42, `position_y`=357.807, `position_z`=93.6503, `orientation`=2.70421 WHERE `guid`=67017; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9139.32, `position_y`=340.707, `position_z`=92.0264, `orientation`=1.01229 WHERE `guid`=67015; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9073.69, `position_y`=339.895, `position_z`=93.1489, `orientation`=1.05052 WHERE `guid`=67023; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9108.85, `position_y`=325.219, `position_z`=93.3783, `orientation`=4.01843 WHERE `guid`=67018; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9123.93, `position_y`=308.548, `position_z`=93.2522, `orientation`=4.09884 WHERE `guid`=67016; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9094.11, `position_y`=308.377, `position_z`=94.9155, `orientation`=2.21233 WHERE `guid`=67020; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9060.14, `position_y`=340.087, `position_z`=93.8768, `orientation`=2.11632 WHERE `guid`=67025; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=-9110.32, `position_y`=341.523, `position_z`=93.5801, `orientation`=0.0180196 WHERE `guid`=67019; -- Skeletal Soldier
UPDATE `creature` SET `position_x`=7716.45, `position_y`=-3917.24, `position_z`=693.517, `orientation`=3.92941 WHERE `guid`=40932; -- Frostsaber Stalker
UPDATE `creature` SET `id`=7432 WHERE `guid`=40932; -- Frostsaber Stalker
UPDATE `creature` SET `id2`=7433 WHERE `guid`=40932; -- Frostsaber Huntress
UPDATE `creature` SET `position_x`=-8989.6, `position_y`=857.96, `position_z`=105.807, `orientation`=3.56047 WHERE `guid`=86597; -- Lisan Pierce
UPDATE `creature` SET `position_x`=7649.47, `position_y`=-3915.68, `position_z`=689.523, `orientation`=3.96679 WHERE `guid`=40933; -- Frostsaber Stalker
UPDATE `creature` SET `id`=7431 WHERE `guid`=40933; -- Frostsaber
UPDATE `creature` SET `id2`=7432 WHERE `guid`=40933; -- Frostsaber Stalker
UPDATE `creature` SET `position_x`=3449.45, `position_y`=-5781.2, `position_z`=1.01358, `orientation`=3.27677 WHERE `guid`=35503; -- Spitelash Siren
UPDATE `creature` SET `position_x`=3683.58, `position_y`=-5619.48, `position_z`=7.68665, `orientation`=0.897117 WHERE `guid`=35516; -- Spitelash Siren
UPDATE `creature` SET `position_x`=-7612.29, `position_y`=-2564.97, `position_z`=132.818, `orientation`=2.16425 WHERE `guid`=5553; -- Fire Beetle
UPDATE `creature` SET `position_x`=3617.38, `position_y`=-5619.98, `position_z`=9.89047, `orientation`=4.63018 WHERE `guid`=35474; -- Spitelash Siren
UPDATE `creature` SET `position_x`=7949.82, `position_y`=-3817.08, `position_z`=693.636, `orientation`=2.31761 WHERE `guid`=40979; -- Frostsaber Pride Watcher
UPDATE `creature` SET `id`=7433 WHERE `guid`=40979; -- Frostsaber Huntress
UPDATE `creature` SET `id2`=7434 WHERE `guid`=40979; -- Frostsaber Pride Watcher
UPDATE `creature` SET `position_x`=7850.55, `position_y`=-3848.79, `position_z`=695.41, `orientation`=1.35962 WHERE `guid`=40941; -- Frostsaber Stalker
UPDATE `creature` SET `position_x`=1429.26, `position_y`=173.23, `position_z`=-62.0602, `orientation`=3.3968 WHERE `guid`=38297; -- Undercity Guardian (WAYPOINTS)
UPDATE `creature` SET `position_x`=-8991.8, `position_y`=856.143, `position_z`=106.009, `orientation`=1.23918 WHERE `guid`=89294; -- Suzanne
UPDATE `creature` SET `position_x`=7884.04, `position_y`=-4149.66, `position_z`=685.104, `orientation`=0.599541 WHERE `guid`=40914; -- Frostsaber Stalker
UPDATE `creature` SET `id`=7431 WHERE `guid`=40914; -- Frostsaber
UPDATE `creature` SET `id2`=7432 WHERE `guid`=40914; -- Frostsaber Stalker
UPDATE `creature` SET `position_x`=7915.84, `position_y`=-4187.02, `position_z`=683.666, `orientation`=2.12898 WHERE `guid`=40898; -- Frostsaber
UPDATE `creature` SET `id`=7431 WHERE `guid`=40898; -- Frostsaber
UPDATE `creature` SET `id2`=7432 WHERE `guid`=40898; -- Frostsaber Stalker
UPDATE `creature` SET `position_x`=1721.25, `position_y`=-2850.46, `position_z`=81.5285, `orientation`=5.86908 WHERE `guid`=90973; -- Plaguebat
UPDATE `creature` SET `position_x`=-6549.48, `position_y`=487.094, `position_z`=4.6888, `orientation`=3.99466 WHERE `guid`=43994; -- Stonelash Scorpid
UPDATE `creature` SET `position_x`=-6292.88, `position_y`=34.177, `position_z`=-10.5022, `orientation`=3.57713 WHERE `guid`=42925; -- Twilight Flamereaver
UPDATE `creature` SET `position_x`=-9227.16, `position_y`=-2058.07, `position_z`=77.8242, `orientation`=2.63328 WHERE `guid`=31839; -- Lakeshire Guard
UPDATE `creature` SET `position_x`=-8990.76, `position_y`=1030.89, `position_z`=101.487, `orientation`=3.92699 WHERE `guid`=90447; -- Rat
UPDATE `creature` SET `position_x`=-9848.63, `position_y`=-3617.42, `position_z`=9.14228, `orientation`=1.65093 WHERE `guid`=23690; -- Surf Glider
UPDATE `creature` SET `position_x`=-9799.21, `position_y`=-3619.02, `position_z`=9.28513, `orientation`=5.19754 WHERE `guid`=23675; -- Surf Glider
UPDATE `creature` SET `position_x`=-9883.33, `position_y`=-3580.97, `position_z`=0.741402, `orientation`=4.39903 WHERE `guid`=23617; -- Surf Glider
UPDATE `creature` SET `position_x`=-9950.43, `position_y`=-3583.21, `position_z`=0.448158, `orientation`=2.67184 WHERE `guid`=23624; -- Surf Glider
UPDATE `creature` SET `position_x`=-9849.95, `position_y`=-3551.08, `position_z`=0.720392, `orientation`=2.57482 WHERE `guid`=23677; -- Surf Glider
UPDATE `creature` SET `position_x`=-9918.38, `position_y`=-3617.56, `position_z`=6.84987, `orientation`=1.05825 WHERE `guid`=23647; -- Surf Glider
UPDATE `creature` SET `position_x`=-10017.4, `position_y`=-3582.19, `position_z`=-0.105239, `orientation`=2.14037 WHERE `guid`=23683; -- Surf Glider
UPDATE `creature` SET `position_x`=-10052.2, `position_y`=-3548.65, `position_z`=-9.02222, `orientation`=5.51161 WHERE `guid`=23649; -- Surf Glider
UPDATE `creature` SET `position_x`=-10083, `position_y`=-3649.24, `position_z`=0.706281, `orientation`=4.14226 WHERE `guid`=23614; -- Surf Glider
UPDATE `creature` SET `position_x`=-10020.7, `position_y`=-3515.68, `position_z`=-9.02222, `orientation`=1.90761 WHERE `guid`=23676; -- Surf Glider
UPDATE `creature` SET `position_x`=-10047.5, `position_y`=-3680.75, `position_z`=2.39252, `orientation`=3.96752 WHERE `guid`=23616; -- Surf Glider
UPDATE `creature` SET `position_x`=-9986.19, `position_y`=-3550.28, `position_z`=-4.59971, `orientation`=0.614486 WHERE `guid`=23663; -- Surf Glider
UPDATE `creature` SET `position_x`=2117.57, `position_y`=-282.828, `position_z`=84.8544, `orientation`=0.544066 WHERE `guid`=33418; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=2086.47, `position_y`=-214.228, `position_z`=97.205, `orientation`=4.70938 WHERE `guid`=33463; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=2082.65, `position_y`=-282.295, `position_z`=90.8859, `orientation`=1.98413 WHERE `guid`=33419; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=10733.8, `position_y`=2100.29, `position_z`=1316.75, `orientation`=1.14386 WHERE `guid`=47617; -- Webwood Silkspinner
UPDATE `creature` SET `position_x`=2051.68, `position_y`=-221.049, `position_z`=97.1828, `orientation`=3.05669 WHERE `guid`=33464; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=2048.53, `position_y`=-187.38, `position_z`=97.1503, `orientation`=5.10523 WHERE `guid`=33461; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=2082.04, `position_y`=-179.424, `position_z`=94.8177, `orientation`=4.1893 WHERE `guid`=33467; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=2123.66, `position_y`=-234.152, `position_z`=95.0757, `orientation`=0.694844 WHERE `guid`=33465; -- Shadethicket Wood Shaper
UPDATE `creature` SET `position_x`=10379.9, `position_y`=1651.22, `position_z`=1292.07, `orientation`=0.947312 WHERE `guid`=49529; -- Timberling Trampler
UPDATE `creature` SET `position_x`=10414.7, `position_y`=1685.23, `position_z`=1293.88, `orientation`=2.71455 WHERE `guid`=49532; -- Timberling Trampler
UPDATE `creature` SET `position_x`=6753.3, `position_y`=-702.387, `position_z`=89.4933, `orientation`=0.837758 WHERE `guid`=37508; -- Stormscale Siren
UPDATE `creature` SET `position_x`=10649.4, `position_y`=715.814, `position_z`=1325.78, `orientation`=1.97222 WHERE `guid`=49641; -- Mangy Nightsaber
UPDATE `creature` SET `position_x`=6760.53, `position_y`=-688.936, `position_z`=69.6429, `orientation`=6.07468 WHERE `guid`=37504; -- Stormscale Siren
UPDATE `creature` SET `position_x`=6852.4, `position_y`=-792.58, `position_z`=62.4407, `orientation`=4.00862 WHERE `guid`=37517; -- Stormscale Siren
UPDATE `creature` SET `position_x`=974.068, `position_y`=-364.487, `position_z`=16.1575, `orientation`=3.77488 WHERE `guid`=29661; -- Windshear Overlord
UPDATE `creature` SET `position_x`=982.396, `position_y`=-373.226, `position_z`=16.2079, `orientation`=2.30798 WHERE `guid`=29645; -- Windshear Geomancer
UPDATE `creature` SET `position_x`=989.628, `position_y`=-354.782, `position_z`=12.4233, `orientation`=1.6478 WHERE `guid`=29644; -- Windshear Geomancer
UPDATE `creature` SET `position_x`=6804.89, `position_y`=-759.241, `position_z`=69.2914, `orientation`=4.39108 WHERE `guid`=37510; -- Stormscale Siren
UPDATE `creature` SET `position_x`=929.306, `position_y`=-326.544, `position_z`=17.8099, `orientation`=4.61043 WHERE `guid`=29642; -- Windshear Geomancer
UPDATE `creature` SET `position_x`=2951.04, `position_y`=518.55, `position_z`=6.03828, `orientation`=0.390949 WHERE `guid`=32926; -- Saltspittle Puddlejumper
UPDATE `creature` SET `position_x`=1600.91, `position_y`=569.875, `position_z`=183.552, `orientation`=3.28423 WHERE `guid`=29971; -- Pridewing Consort
UPDATE `creature` SET `position_x`=6668.45, `position_y`=31.2887, `position_z`=43.3395, `orientation`=3.83518 WHERE `guid`=37816; -- Vile Sprite
UPDATE `creature` SET `position_x`=6686.27, `position_y`=12.2186, `position_z`=42.8102, `orientation`=5.892 WHERE `guid`=37815; -- Vile Sprite (WAYPOINTS)
UPDATE `creature` SET `position_x`=6630.39, `position_y`=27.712, `position_z`=35.7021, `orientation`=3.76736 WHERE `guid`=37810; -- Vile Sprite
UPDATE `creature` SET `position_x`=6695.33, `position_y`=31.7945, `position_z`=43.3602, `orientation`=3.76445 WHERE `guid`=37809; -- Vile Sprite
UPDATE `creature` SET `position_x`=6667.79, `position_y`=-432.429, `position_z`=74.8347, `orientation`=2.70542 WHERE `guid`=37566; -- Thistle Cub
UPDATE `creature` SET `position_x`=6681.98, `position_y`=-435.323, `position_z`=74.8136, `orientation`=4.79963 WHERE `guid`=37567; -- Thistle Cub
UPDATE `creature` SET `position_x`=3752.63, `position_y`=-50.8364, `position_z`=-1.76512, `orientation`=2.77152 WHERE `guid`=32894; -- Forsaken Seeker
UPDATE `creature` SET `position_x`=-9383.25, `position_y`=-1415.43, `position_z`=61.5627, `orientation`=0.041602 WHERE `guid`=81396; -- Prowler (WAYPOINTS)
UPDATE `creature` SET `position_x`=2216.6, `position_y`=-1422.52, `position_z`=90.7136, `orientation`=1.53069 WHERE `guid`=32954; -- Foulweald Warrior
UPDATE `creature` SET `position_x`=2217.85, `position_y`=-1384.25, `position_z`=86.7714, `orientation`=5.33761 WHERE `guid`=32955; -- Foulweald Warrior
UPDATE `creature` SET `position_x`=2250.78, `position_y`=-1449.28, `position_z`=89.23, `orientation`=2.18327 WHERE `guid`=32952; -- Foulweald Warrior
UPDATE `creature` SET `position_x`=10095.6, `position_y`=1087.94, `position_z`=1327.76, `orientation`=2.81859 WHERE `guid`=47954; -- Shadow Sprite
UPDATE `creature` SET `position_x`=6107.75, `position_y`=573.844, `position_z`=-1.07616, `orientation`=3.90449 WHERE `guid`=37939; -- Greymist Raider
UPDATE `creature` SET `position_x`=5623.24, `position_y`=62.6463, `position_z`=34.2699, `orientation`=3.4383 WHERE `guid`=37469; -- Wailing Highborne
UPDATE `creature` SET `position_x`=5633.79, `position_y`=118.302, `position_z`=29.8537, `orientation`=0.512443 WHERE `guid`=37479; -- Wailing Highborne
UPDATE `creature` SET `position_x`=5680.83, `position_y`=414.82, `position_z`=19.7759, `orientation`=1.42779 WHERE `guid`=37229; -- Rabid Thistle Bear
UPDATE `creature` SET `position_x`=-1366, `position_y`=-3902.17, `position_z`=10.8722, `orientation`=5.86431 WHERE `guid`=13758; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-10155.5, `position_y`=-2985.08, `position_z`=22.8276, `orientation`=2.22225 WHERE `guid`=37613; -- Swamp Jaguar
UPDATE `creature` SET `position_x`=-10971.4, `position_y`=-3674.35, `position_z`=27.7467, `orientation`=3.08933 WHERE `guid`=43448; -- Marsh Flesheater
UPDATE `creature` SET `position_x`=-10951.6, `position_y`=1357.6, `position_z`=44.7457, `orientation`=5.26075 WHERE `guid`=90275; -- Harvest Golem
UPDATE `creature` SET `position_x`=-10806.7, `position_y`=738.47, `position_z`=35.5885, `orientation`=1.93034 WHERE `guid`=90387; -- Harvest Reaper
UPDATE `creature` SET `position_x`=-9266.25, `position_y`=354.62, `position_z`=76.8765, `orientation`=0 WHERE `guid`=79881; -- Clara Charles (WAYPOINTS)
UPDATE `creature` SET `position_x`=1603.98, `position_y`=181.492, `position_z`=104.757, `orientation`=3.35802 WHERE `guid`=29582; -- Venture Co. Machine Smith
UPDATE `creature` SET `position_x`=1588.17, `position_y`=176.174, `position_z`=99.4123, `orientation`=3.71881 WHERE `guid`=29578; -- Venture Co. Engineer
UPDATE `creature` SET `position_x`=1653.16, `position_y`=118.287, `position_z`=120.978, `orientation`=3.29726 WHERE `guid`=29581; -- Venture Co. Engineer
UPDATE `creature` SET `position_x`=-189.049, `position_y`=-481.524, `position_z`=54.1313, `orientation`=5.43224 WHERE `guid`=79177; -- Defias Evoker
UPDATE `creature` SET `position_x`=-185.334, `position_y`=-481.715, `position_z`=54.1287, `orientation`=3.17113 WHERE `guid`=79170; -- Defias Overseer (WAYPOINTS)

-- Round 2

UPDATE `creature` SET `position_x`=-335.05, `position_y`=149.032, `position_z`=-69.4045, `orientation`=4.17787 WHERE `guid`=39751; -- Atal'ai Witch Doctor
UPDATE `creature` SET `id`=5259 WHERE `guid`=39751; -- Atal'ai Witch Doctor
UPDATE `creature` SET `id2`=8318 WHERE `guid`=39751; -- Atal'ai Slave
UPDATE `creature` SET `position_x`=-523.151, `position_y`=22.1328, `position_z`=-148.719, `orientation`=3.39492 WHERE `guid`=33627; -- Slime Maggot
UPDATE `creature` SET `id`=5226 WHERE `guid`=33627; -- Murk Worm
UPDATE `creature` SET `id2`=8311 WHERE `guid`=33627; -- Slime Maggot
UPDATE `creature` SET `position_x`=574.438, `position_y`=-122.639, `position_z`=-65.229, `orientation`=6.15876 WHERE `guid`=90918; -- Bloodhound
UPDATE `creature` SET `position_x`=3455.18, `position_y`=-3391.59, `position_z`=140.725, `orientation`=3.84083 WHERE `guid`=53128; -- Skeletal Berserker
UPDATE `creature` SET `id`=10382 WHERE `guid`=53128; -- Mangled Cadaver
UPDATE `creature` SET `id2`=10391 WHERE `guid`=53128; -- Skeletal Berserker
UPDATE `creature` SET `position_x`=-3039.04, `position_y`=-2164.95, `position_z`=9.56829, `orientation`=2.58309 WHERE `guid`=10665; -- Mosshide Trapper
UPDATE `creature` SET `id`=1011 WHERE `guid`=10665; -- Mosshide Trapper
UPDATE `creature` SET `id2`=1012 WHERE `guid`=10665; -- Mosshide Brute
UPDATE `creature` SET `position_x`=-6286.55, `position_y`=475.157, `position_z`=386.194, `orientation`=3.66519 WHERE `guid`=423; -- Burly Rockjaw Trogg
UPDATE `creature` SET `position_x`=-5532.29, `position_y`=-2731.88, `position_z`=367.351, `orientation`=2.3911 WHERE `guid`=9012; -- Stonesplinter Trogg
UPDATE `creature` SET `position_x`=-5043.02, `position_y`=-2679.03, `position_z`=319.376, `orientation`=6.16101 WHERE `guid`=9350; -- Tunnel Rat Vermin
UPDATE `creature` SET `position_x`=-9767.68, `position_y`=-2267.87, `position_z`=59.8317, `orientation`=3.735 WHERE `guid`=10142; -- Redridge Poacher
UPDATE `creature` SET `position_x`=-9000.36, `position_y`=-2271.87, `position_z`=145.062, `orientation`=0.471239 WHERE `guid`=7514; -- Redridge Mystic
UPDATE `creature` SET `id`=430 WHERE `guid`=7514; -- Redridge Mystic
UPDATE `creature` SET `id2`=446 WHERE `guid`=7514; -- Redridge Basher
UPDATE `creature` SET `position_x`=-8542.54, `position_y`=1478.01, `position_z`=31.9904, `orientation`=4.06662 WHERE `guid`=301016; -- Hive'Zara Wasp


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
