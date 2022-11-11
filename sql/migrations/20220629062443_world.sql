DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220629062443');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220629062443');
-- Add your query below.


-- Correct base stats for some paladin levels.
UPDATE `creature_classlevelstats` SET `melee_damage` = 33.00647062 WHERE `class`=2 && `level`=21; -- Seen 5 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 67.49181572 WHERE `class`=2 && `level`=42; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 99.62660217 WHERE `class`=2 && `level`=54; -- Seen 2 times.

-- Correct base stats for some mage levels.
UPDATE `creature_classlevelstats` SET `melee_damage` = 7.527945042 WHERE `class`=8 && `level`=7; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 8.761404991 WHERE `class`=8 && `level`=8; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 10.05632591 WHERE `class`=8 && `level`=9; -- Seen 5 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 11.16280937 WHERE `class`=8 && `level`=10; -- Seen 6 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 12.60544968 WHERE `class`=8 && `level`=11; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 14.47480011 WHERE `class`=8 && `level`=12; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 15.71164989 WHERE `class`=8 && `level`=13; -- Seen 2 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 28.06985092 WHERE `class`=8 && `level`=23; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `melee_damage` = 31.38304901 WHERE `class`=8 && `level`=26; -- Seen 2 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 4.708533951 WHERE `class`=8 && `level`=5; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 6.367605870 WHERE `class`=8 && `level`=6; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 8.177945137 WHERE `class`=8 && `level`=7; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 9.361405373 WHERE `class`=8 && `level`=8; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 10.59202957 WHERE `class`=8 && `level`=9; -- Seen 5 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 11.96280003 WHERE `class`=8 && `level`=10; -- Seen 6 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 13.33405018 WHERE `class`=8 && `level`=11; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 15.11769962 WHERE `class`=8 && `level`=12; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 16.25444984 WHERE `class`=8 && `level`=13; -- Seen 3 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 27.06985092 WHERE `class`=8 && `level`=23; -- Seen 2 times.
UPDATE `creature_classlevelstats` SET `ranged_damage` = 30.09730148 WHERE `class`=8 && `level`=26; -- Seen 6 times.
UPDATE `creature_classlevelstats` SET `armor` = 19 WHERE `class`=8 && `level`=4; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `armor` = 111 WHERE `class`=8 && `level`=7; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `armor` = 151 WHERE `class`=8 && `level`=8; -- Seen 1 times.
UPDATE `creature_classlevelstats` SET `armor` = 198 WHERE `class`=8 && `level`=9; -- Seen 5 times.
UPDATE `creature_classlevelstats` SET `armor` = 248 WHERE `class`=8 && `level`=10; -- Seen 6 times.
UPDATE `creature_classlevelstats` SET `armor` = 264 WHERE `class`=8 && `level`=11; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `armor` = 283 WHERE `class`=8 && `level`=12; -- Seen 4 times.
UPDATE `creature_classlevelstats` SET `armor` = 303 WHERE `class`=8 && `level`=13; -- Seen 3 times.
UPDATE `creature_classlevelstats` SET `armor` = 495 WHERE `class`=8 && `level`=23; -- Seen 2 times.
UPDATE `creature_classlevelstats` SET `armor` = 552 WHERE `class`=8 && `level`=26; -- Seen 6 times.

-- Damage Variance
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=6; -- Kobold Vermin
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=30; -- Forest Spider
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=38; -- Defias Thug
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=69; -- Timber Wolf
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=80; -- Kobold Laborer
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=94; -- Defias Cutpurse
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=103; -- Garrick Padfoot
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=113; -- Stonetusk Boar
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=241; -- Remy "Two Times"
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=257; -- Kobold Worker
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=299; -- Young Wolf
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=397; -- Morganth
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=436; -- Blackrock Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=474; -- Defias Rogue Wizard
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=476; -- Kobold Geomancer
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=525; -- Mangy Wolf
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=619; -- Defias Conjurer
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=704; -- Ragged Timber Wolf
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=705; -- Ragged Young Wolf
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=708; -- Small Crag Boar
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=710; -- Mosh'Ogg Spellcrafter
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=808; -- Grik'nir the Cold
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=881; -- Surena Caledon
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=946; -- Frostmane Novice
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1028; -- Bluegill Muckdweller
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1038; -- Dragonmaw Shadowwarder
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1057; -- Dragonmaw Bonewarder
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=1124; -- Frostmane Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1125; -- Crag Boar
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1128; -- Young Black Bear
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1129; -- Black Bear
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=1165; -- Stonesplinter Geomancer
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=1174; -- Tunnel Rat Geomancer
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1199; -- Juvenile Snow Leopard
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=1504; -- Young Night Web Spider
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1505; -- Night Web Spider
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=1506; -- Scarlet Convert
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=1508; -- Young Scavenger
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=1509; -- Ragged Scavenger
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=1512; -- Duskbat
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1513; -- Mangy Duskbat
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1547; -- Decrepit Darkhound
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1562; -- Bloodsail Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1564; -- Bloodsail Warlock
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1653; -- Bloodsail Elder Magus
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=1667; -- Meven Korgal
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=1688; -- Night Web Matriarch
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=1726; -- Defias Magician
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=1733; -- Zggi
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1826; -- Scarlet Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=1832; -- Scarlet Magus
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1935; -- Tirisfal Farmhand
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=1984; -- Young Thistle Boar
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=1985; -- Thistle Boar
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1986; -- Webwood Spider
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=1988; -- Grell
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=1989; -- Grellkin
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=1994; -- Githyiss the Vile
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1995; -- Strigid Owl
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=1998; -- Webwood Lurker
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2002; -- Rascal Sprite
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2003; -- Shadow Sprite
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2018; -- Bloodfeather Sorceress
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=2031; -- Young Nightsaber
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=2032; -- Mangy Nightsaber
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2042; -- Nightsaber
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=2182; -- Stormscale Sorceress
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=2191; -- Licillin
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=2230; -- Umpi
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2244; -- Syndicate Shadow Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2255; -- Crushridge Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2306; -- Baron Vardus
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2318; -- Argus Shadow Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2319; -- Syndicate Wizard
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=2335; -- Magistrate Burnside
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2373; -- Mudsnout Shaman
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2387; -- Hillsbrad Councilman
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2553; -- Witherbark Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2567; -- Boulderfist Magus
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2573; -- Drywhisker Surveyor
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2577; -- Dark Iron Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2590; -- Syndicate Conjuror
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2591; -- Syndicate Magus
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2596; -- Daggerspine Sorceress
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=2642; -- Vilebranch Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=2953; -- Bristleback Shaman
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=2954; -- Bristleback Battleboar
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=2955; -- Plainstrider
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2958; -- Prairie Wolf
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=2961; -- Mountain Cougar
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=2964; -- Windfury Sorceress
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=2966; -- Battleboar
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=2969; -- Wiry Swoop
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3098; -- Mottled Boar
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=3101; -- Vile Familiar
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=3102; -- Felstalker
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=3106; -- Pygmy Surf Crawler
UPDATE `creature_template` SET `damage_variance`=0.09 WHERE `entry`=3124; -- Scorpid Worker
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=3125; -- Clattering Scorpid
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=3128; -- Kul Tiras Sailor
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=3129; -- Kul Tiras Marine
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3198; -- Burning Blade Apprentice
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3199; -- Burning Blade Cultist
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3203; -- Fizzle Darkstorm
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3269; -- Razormane Geomancer
UPDATE `creature_template` SET `damage_variance`=0.1 WHERE `entry`=3281; -- Sarkoth
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3380; -- Burning Blade Acolyte
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3662; -- Delmanis the Hated
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=3664; -- Ilkrud Magthrull
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3717; -- Wrathtail Sorceress
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=3850; -- Sorcerer Ashcrombe
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3894; -- Pelturas Whitemoon
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3914; -- Rethilgore
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3953; -- Tandaan Lightmane
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3954; -- Dalria
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3958; -- Lardan
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3959; -- Nantar
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3961; -- Maliynn
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3962; -- Haljan Oakheart
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3967; -- Aayndia Floralwind
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3969; -- Fahran Silentblade
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3970; -- Llana
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3983; -- Interrogator Vishas
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3984; -- Nancy Vishas
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=3985; -- Grandpa Vishas
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=3986; -- Sarilus Foulborne
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=3991; -- Venture Co. Deforester
UPDATE `creature_template` SET `damage_variance`=0.08 WHERE `entry`=4003; -- Windshear Geomancer
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4004; -- Windshear Overlord
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4005; -- Deepmoss Creeper
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4006; -- Deepmoss Webspinner
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4007; -- Deepmoss Venomspitter
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4008; -- Cliff Stormer
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4009; -- Raging Cliff Stormer
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4011; -- Young Pridewing
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4012; -- Pridewing Wyvern
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4013; -- Pridewing Skyhunter
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4014; -- Pridewing Consort
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4015; -- Pridewing Patriarch
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4018; -- Antlered Courser
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4019; -- Great Courser
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4031; -- Fledgling Chimaera
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4032; -- Young Chimaera
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4041; -- Scorched Basilisk
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4042; -- Singed Basilisk
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4044; -- Blackened Basilisk
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4063; -- Feeboz
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4067; -- Twilight Runner
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4263; -- Deepmoss Hatchling
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4264; -- Deepmoss Matriarch
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=4279; -- Odo the Blindwatcher
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=4282; -- Scarlet Magician
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4289; -- Scarlet Evoker
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4297; -- Scarlet Conjuror
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4463; -- Blackrock Summoner
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4494; -- Scarlet Spellbinder
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4516; -- Death's Head Adept
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4684; -- Nether Sorceress
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=4813; -- Twilight Shadowmage
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=4814; -- Twilight Elementalist
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4844; -- Shadowforge Surveyor
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=5403; -- White Stallion
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=5404; -- Black Stallion
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=5405; -- Pinto
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=5406; -- Palomino
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5617; -- Wastewander Shadow Mage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5647; -- Sandfury Firecaller
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5648; -- Sandfury Shadowcaster
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5694; -- High Sorcerer Andromath
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=5750; -- Gina Lang
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=5774; -- Riding Wolf
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5839; -- Dark Iron Geologist
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5862; -- Twilight Geomancer
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=5981; -- Portal Seeker
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6008; -- Shadowsworn Warlock
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6009; -- Shadowsworn Dreadweaver
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6127; -- Haldarr Felsworn
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=6167; -- Chimaera Matriarch
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=6202; -- Legashi Hellcaller
UPDATE `creature_template` SET `damage_variance`=0.12 WHERE `entry`=6367; -- Donni Anthania
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7111; -- Jadefire Hellcaller
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7335; -- Death's Head Geomancer
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7789; -- Sandfury Cretin
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7795; -- Hydromancer Velratha
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7872; -- Death's Head Cultist
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7874; -- Razorfen Thornweaver
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7995; -- Vile Priestess Hexx
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=7996; -- Qiaga the Keeper
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=8503; -- Gibblewilt
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=8550; -- Shadowmage
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=8636; -- Morta'gya the Keeper
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=8882; -- Riding Tiger
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=8883; -- Riding Horse
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=8885; -- Riding Raptor
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=10760; -- Grimtotem Geomancer
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=10802; -- Hitah'ya the Keeper
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=11137; -- Xai'ander
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=11324; -- Searing Blade Warlock
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=11383; -- High Priestess Hai'watna
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=11518; -- Jergosh the Invoker
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=11683; -- Horde Shaman
UPDATE `creature_template` SET `damage_variance`=0.32 WHERE `entry`=11896; -- Borelgore
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=11921; -- Besseleth
UPDATE `creature_template` SET `damage_variance`=0.13 WHERE `entry`=11937; -- Demon Portal Guardian
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12346; -- Emerald Raptor
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12349; -- Turquoise Raptor
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12350; -- Violet Raptor
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12372; -- Brown Ram
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12373; -- Gray Ram
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=12374; -- White Riding Ram
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12375; -- Chestnut Mare
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12376; -- Brown Horse
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=12579; -- Bloodfury Ripper
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=14277; -- Lady Zephris
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14542; -- Great White Kodo
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14543; -- Swift Olive Raptor
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14544; -- Swift Orange Raptor
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14545; -- Swift Blue Raptor
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14546; -- Swift Brown Ram
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14547; -- Swift White Ram
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14548; -- Swift Gray Ram
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14549; -- Great Brown Kodo
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14559; -- Swift Palamino
UPDATE `creature_template` SET `damage_variance`=0.07 WHERE `entry`=14560; -- Swift White Steed
UPDATE `creature_template` SET `damage_variance`=0.02 WHERE `entry`=14561; -- Swift Brown Steed
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=15191; -- Windcaller Proudhorn
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=15308; -- Twilight Prophet
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=16506; -- Naxxramas Worshipper

-- Damage Multipliers
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6 && `patch` IN (0); -- Kobold Vermin
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=30 && `patch` IN (0); -- Forest Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=38 && `patch` IN (0); -- Defias Thug
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=43 && `patch` IN (0); -- Mine Spider
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=68 && `patch` IN (0); -- Stormwind City Guard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=69 && `patch` IN (0); -- Timber Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=80 && `patch` IN (0); -- Kobold Laborer
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=89 && `patch` IN (7); -- Infernal
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=94 && `patch` IN (0); -- Defias Cutpurse
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=103 && `patch` IN (0); -- Garrick Padfoot
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=113 && `patch` IN (0, 7); -- Stonetusk Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=116 && `patch` IN (0); -- Defias Bandit
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=118 && `patch` IN (0); -- Prowler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=119 && `patch` IN (0, 7); -- Longsnout
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=154 && `patch` IN (0, 5); -- Greater Fleshripper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=157 && `patch` IN (0, 7); -- Goretusk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=213 && `patch` IN (0); -- Starving Dire Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=217 && `patch` IN (0); -- Venom Web Spider
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=240 && `patch` IN (0); -- Marshal Dughan
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=241 && `patch` IN (0); -- Remy "Two Times"
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=257 && `patch` IN (0); -- Kobold Worker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=299 && `patch` IN (0); -- Young Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=330 && `patch` IN (0, 7); -- Princess
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=334 && `patch` IN (0); -- Gath'Ilzogg
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=390 && `patch` IN (0, 7); -- Porcine Entourage
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=397 && `patch` IN (0); -- Morganth
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=428 && `patch` IN (0); -- Dire Condor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=433 && `patch` IN (0); -- Shadowhide Gnoll
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=436 && `patch` IN (0); -- Blackrock Shadowcaster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=437 && `patch` IN (0); -- Blackrock Renegade
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=440 && `patch` IN (0); -- Blackrock Grunt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=452 && `patch` IN (0); -- Riverpaw Bandit
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=453 && `patch` IN (0); -- Riverpaw Mystic
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=454 && `patch` IN (0, 7); -- Young Goretusk
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=462 && `patch` IN (0); -- Vultros
UPDATE `creature_template` SET `damage_multiplier`=7 WHERE `entry`=466 && `patch` IN (0); -- General Marcus Jonathan
UPDATE `creature_template` SET `damage_multiplier`=10 WHERE `entry`=469 && `patch` IN (0); -- Lieutenant Doren
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=471 && `patch` IN (0); -- Mother Fang
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=473 && `patch` IN (0); -- Morgan the Collector
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=474 && `patch` IN (0); -- Defias Rogue Wizard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=486 && `patch` IN (0); -- Tharil'zun
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=505 && `patch` IN (0); -- Greater Tarantula
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=521 && `patch` IN (0); -- Lupos
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=524 && `patch` IN (0, 7); -- Rockhide Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=539 && `patch` IN (0); -- Pygmy Venom Web Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=547 && `patch` IN (0, 7); -- Great Goretusk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=569 && `patch` IN (0); -- Green Recluse
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=574 && `patch` IN (0); -- Naraxis
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=594 && `patch` IN (0); -- Defias Henchman
UPDATE `creature_template` SET `damage_multiplier`=1.56 WHERE `entry`=597 && `patch` IN (0); -- Bloodscalp Berserker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=616 && `patch` IN (0); -- Chatter
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=619 && `patch` IN (0); -- Defias Conjurer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=659 && `patch` IN (0); -- El Pollo Grande
UPDATE `creature_template` SET `damage_multiplier`=4.9 WHERE `entry`=678 && `patch` IN (0); -- Mosh'Ogg Mauler
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=679 && `patch` IN (0); -- Mosh'Ogg Shaman
UPDATE `creature_template` SET `damage_multiplier`=3.375 WHERE `entry`=680 && `patch` IN (0); -- Mosh'Ogg Lord
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=685 && `patch` IN (0); -- Stranglethorn Raptor
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=687 && `patch` IN (0); -- Jungle Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=704 && `patch` IN (0); -- Ragged Timber Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=705 && `patch` IN (0); -- Ragged Young Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=708 && `patch` IN (0, 7); -- Small Crag Boar
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=709 && `patch` IN (0); -- Mosh'Ogg Warmonger
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=710 && `patch` IN (0); -- Mosh'Ogg Spellcrafter
UPDATE `creature_template` SET `damage_multiplier`=1.425 WHERE `entry`=728 && `patch` IN (0); -- Bhag'thera
UPDATE `creature_template` SET `damage_multiplier`=0.91 WHERE `entry`=729 && `patch` IN (0); -- Sin'Dall
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=730 && `patch` IN (0); -- Tethis
UPDATE `creature_template` SET `damage_multiplier`=1.61 WHERE `entry`=731 && `patch` IN (0); -- King Bangalash
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=733 && `patch` IN (0); -- Sergeant Yohwa
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=734 && `patch` IN (0); -- Corporal Bluth
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=738 && `patch` IN (0); -- Private Thorsen
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=739 && `patch` IN (0); -- Brother Nimetz
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=756 && `patch` IN (0); -- Skullsplitter Panther
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=770 && `patch` IN (0); -- Corporal Kaleb
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=783 && `patch` IN (0); -- Skullsplitter Berserker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=808 && `patch` IN (0); -- Grik'nir the Cold
UPDATE `creature_template` SET `damage_multiplier`=2.3375 WHERE `entry`=813 && `patch` IN (0); -- Colonel Kurzen
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=814 && `patch` IN (0); -- Sergeant Malthus
UPDATE `creature_template` SET `damage_multiplier`=3.65 WHERE `entry`=818 && `patch` IN (0); -- Mai'Zoth
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=819 && `patch` IN (0); -- Servant of Ilgalar
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=822 && `patch` IN (0); -- Young Forest Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=830 && `patch` IN (0); -- Sand Crawler
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=856 && `patch` IN (0); -- Young Lashtail Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=861 && `patch` IN (0); -- Stonard Scout
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=862 && `patch` IN (0); -- Stonard Explorer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=866 && `patch` IN (0); -- Stonard Grunt
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=871 && `patch` IN (0); -- Saltscale Warrior
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=873 && `patch` IN (0); -- Saltscale Oracle
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=875 && `patch` IN (0); -- Saltscale Tide Lord
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=877 && `patch` IN (0); -- Saltscale Forager
UPDATE `creature_template` SET `damage_multiplier`=2.25 WHERE `entry`=879 && `patch` IN (0); -- Saltscale Hunter
UPDATE `creature_template` SET `damage_multiplier`=1.625 WHERE `entry`=880 && `patch` IN (0); -- Erlan Drudgemoor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=881 && `patch` IN (0); -- Surena Caledon
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=913 && `patch` IN (0); -- Lyria Du Lac
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=927 && `patch` IN (0); -- Brother Wilhelm
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=1015 && `patch` IN (0); -- Highland Raptor
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=1016 && `patch` IN (0); -- Highland Lashtail
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=1020 && `patch` IN (0); -- Mottled Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1034 && `patch` IN (0); -- Dragonmaw Raider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1035 && `patch` IN (0); -- Dragonmaw Swamprunner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1036 && `patch` IN (0); -- Dragonmaw Centurion
UPDATE `creature_template` SET `damage_multiplier`=0.96 WHERE `entry`=1037 && `patch` IN (0); -- Dragonmaw Battlemaster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1038 && `patch` IN (0); -- Dragonmaw Shadowwarder
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1051 && `patch` IN (0); -- Dark Iron Dwarf
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1052 && `patch` IN (0); -- Dark Iron Saboteur
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1053 && `patch` IN (0); -- Dark Iron Tunneler
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1054 && `patch` IN (0); -- Dark Iron Demolitionist
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1057 && `patch` IN (0); -- Dragonmaw Bonewarder
UPDATE `creature_template` SET `damage_multiplier`=1.68 WHERE `entry`=1059 && `patch` IN (0); -- Ana'thek the Cruel
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=1060 && `patch` IN (0); -- Mogh the Undying
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1064 && `patch` IN (0); -- Grom'gol Grunt
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=1087 && `patch` IN (0); -- Sawtooth Snapper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1088 && `patch` IN (0); -- Monstrous Crawler
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=1108 && `patch` IN (0, 7); -- Mistvale Gorilla
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1109 && `patch` IN (0); -- Fleshripper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1111 && `patch` IN (0); -- Leech Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1112 && `patch` IN (0); -- Leech Widow
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1115 && `patch` IN (0); -- Rockjaw Skullthumper
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=1118 && `patch` IN (0); -- Rockjaw Backbreaker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1121 && `patch` IN (0); -- Frostmane Snowstrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1124 && `patch` IN (0); -- Frostmane Shadowcaster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1125 && `patch` IN (0, 7); -- Crag Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1126 && `patch` IN (0, 7); -- Large Crag Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1127 && `patch` IN (0, 7); -- Elder Crag Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1128 && `patch` IN (0); -- Young Black Bear
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=1129 && `patch` IN (0); -- Black Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1131 && `patch` IN (0); -- Winter Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1133 && `patch` IN (0); -- Starving Winter Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1138 && `patch` IN (0); -- Snow Tracker Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1140 && `patch` IN (0); -- Razormaw Matriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1165 && `patch` IN (0); -- Stonesplinter Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1167 && `patch` IN (0); -- Stonesplinter Digger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1169 && `patch` IN (0); -- Dark Iron Insurgent
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1172 && `patch` IN (0); -- Tunnel Rat Vermin
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1174 && `patch` IN (0); -- Tunnel Rat Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1178 && `patch` IN (0); -- Mo'grosh Ogre
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1179 && `patch` IN (0); -- Mo'grosh Enforcer
UPDATE `creature_template` SET `damage_multiplier`=3.675 WHERE `entry`=1180 && `patch` IN (0, 1); -- Mo'grosh Brute
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1181 && `patch` IN (0); -- Mo'grosh Shaman
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1183 && `patch` IN (0); -- Mo'grosh Mystic
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1185 && `patch` IN (0); -- Wood Lurker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1188 && `patch` IN (0); -- Grizzled Black Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1189 && `patch` IN (0); -- Black Bear Patriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1191 && `patch` IN (0, 7); -- Mangy Mountain Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1192 && `patch` IN (0, 7); -- Elder Mountain Boar
UPDATE `creature_template` SET `damage_multiplier`=0.165 WHERE `entry`=1193 && `patch` IN (0); -- Loch Frenzy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1194 && `patch` IN (0); -- Mountain Buzzard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1196 && `patch` IN (0); -- Ice Claw Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1197 && `patch` IN (0); -- Stonesplinter Shaman
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1199 && `patch` IN (0); -- Juvenile Snow Leopard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1201 && `patch` IN (0); -- Snow Leopard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1210 && `patch` IN (0); -- Chok'sul
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1224 && `patch` IN (0); -- Young Threshadon
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1225 && `patch` IN (0); -- Ol' Sooty
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1271 && `patch` IN (0); -- Old Icebeard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1344 && `patch` IN (0); -- Prospector Ironband
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1388 && `patch` IN (0); -- Vagash
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1398 && `patch` IN (0); -- Boss Galgosh
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=1400 && `patch` IN (0); -- Wetlands Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1422 && `patch` IN (0); -- Corporal Sethman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1423 && `patch` IN (0); -- Stormwind Guard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1490 && `patch` IN (0); -- Zanzil Witch Doctor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1504 && `patch` IN (0); -- Young Night Web Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1505 && `patch` IN (0); -- Night Web Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1506 && `patch` IN (0); -- Scarlet Convert
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1507 && `patch` IN (0); -- Scarlet Initiate
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1508 && `patch` IN (0); -- Young Scavenger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1509 && `patch` IN (0); -- Ragged Scavenger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1511 && `patch` IN (0); -- Enraged Silverback Gorilla
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1512 && `patch` IN (0); -- Duskbat
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1513 && `patch` IN (0); -- Mangy Duskbat
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1514 && `patch` IN (0); -- Mokk the Savage
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1535 && `patch` IN (0); -- Scarlet Warrior
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1536 && `patch` IN (0); -- Scarlet Missionary
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=1537 && `patch` IN (0); -- Scarlet Zealot
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1538 && `patch` IN (0); -- Scarlet Friar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1539 && `patch` IN (0); -- Scarlet Neophyte
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1543 && `patch` IN (0); -- Vile Fin Puddlejumper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1544 && `patch` IN (0); -- Vile Fin Minor Oracle
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1547 && `patch` IN (0); -- Decrepit Darkhound
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1548 && `patch` IN (0); -- Cursed Darkhound
UPDATE `creature_template` SET `damage_multiplier`=2.24 WHERE `entry`=1551 && `patch` IN (0); -- Ironjaw Basilisk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1552 && `patch` IN (0); -- Scale Belly
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1553 && `patch` IN (0); -- Greater Duskbat
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1554 && `patch` IN (0); -- Vampiric Duskbat
UPDATE `creature_template` SET `damage_multiplier`=4.9 WHERE `entry`=1559 && `patch` IN (0); -- King Mukla
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1563 && `patch` IN (0); -- Bloodsail Swashbuckler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1564 && `patch` IN (0); -- Bloodsail Warlock
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1565 && `patch` IN (0); -- Bloodsail Sea Dog
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1642 && `patch` IN (0); -- Northshire Guard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1653 && `patch` IN (0); -- Bloodsail Elder Magus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1662 && `patch` IN (0); -- Captain Perrine
UPDATE `creature_template` SET `damage_multiplier`=2.04 WHERE `entry`=1663 && `patch` IN (0); -- Dextren Ward
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=1665 && `patch` IN (0); -- Captain Melrache
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1666 && `patch` IN (0); -- Kam Deepfury
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1667 && `patch` IN (0); -- Meven Korgal
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1688 && `patch` IN (0); -- Night Web Matriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1693 && `patch` IN (0); -- Loch Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1696 && `patch` IN (0); -- Targorr the Dread
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1706 && `patch` IN (0); -- Defias Prisoner
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1707 && `patch` IN (0); -- Defias Captive
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1708 && `patch` IN (0); -- Defias Inmate
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1711 && `patch` IN (0); -- Defias Convict
UPDATE `creature_template` SET `damage_multiplier`=2.21 WHERE `entry`=1715 && `patch` IN (0); -- Defias Insurgent
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=1716 && `patch` IN (0); -- Bazil Thredd
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=1717 && `patch` IN (0); -- Hamhock
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=1720 && `patch` IN (0); -- Bruegal Ironknuckle
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1725 && `patch` IN (0); -- Defias Watchman
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1726 && `patch` IN (0); -- Defias Magician
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1733 && `patch` IN (0); -- Zggi
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=1765 && `patch` IN (0); -- Worg
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=1766 && `patch` IN (0); -- Mottled Worg
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1767 && `patch` IN (0); -- Vile Fin Shredder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1769 && `patch` IN (0); -- Moonrage Whitescalp
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=1770 && `patch` IN (0); -- Moonrage Darkrunner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1779 && `patch` IN (0); -- Moonrage Glutton
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1780 && `patch` IN (0); -- Moss Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1781 && `patch` IN (0); -- Mist Creeper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1782 && `patch` IN (0); -- Moonrage Darksoul
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1797 && `patch` IN (0); -- Giant Grizzled Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1809 && `patch` IN (0); -- Carrion Vulture
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1826 && `patch` IN (0); -- Scarlet Mage
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1827 && `patch` IN (0); -- Scarlet Sentinel
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1832 && `patch` IN (0); -- Scarlet Magus
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1834 && `patch` IN (0); -- Scarlet Paladin
UPDATE `creature_template` SET `damage_multiplier`=2.04 WHERE `entry`=1836 && `patch` IN (0); -- Scarlet Cavalier
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=1838 && `patch` IN (0); -- Scarlet Interrogator
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1839 && `patch` IN (0); -- Scarlet High Clerist
UPDATE `creature_template` SET `damage_multiplier`=3.375 WHERE `entry`=1843 && `patch` IN (0); -- Foreman Jerris
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1846 && `patch` IN (0); -- High Protector Lorik
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1854 && `patch` IN (0); -- High Priest Thel'danis
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=1885 && `patch` IN (0); -- Scarlet Smith
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1909 && `patch` IN (0); -- Vile Fin Lakestalker
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=1922 && `patch` IN (0); -- Gray Forest Wolf
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=1923 && `patch` IN (0); -- Bloodsnout Worg
UPDATE `creature_template` SET `damage_multiplier`=1.92 WHERE `entry`=1934 && `patch` IN (0); -- Tirisfal Farmer
UPDATE `creature_template` SET `damage_multiplier`=1.92 WHERE `entry`=1935 && `patch` IN (0); -- Tirisfal Farmhand
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1936 && `patch` IN (0); -- Farmer Solliden
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1937 && `patch` IN (0); -- Apothecary Renferrel
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1938 && `patch` IN (0); -- Dalar Dawnweaver
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1950 && `patch` IN (0); -- Rane Yorick
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1951 && `patch` IN (0); -- Quinn Yorick
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1957 && `patch` IN (0); -- Vile Fin Shorecreeper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1958 && `patch` IN (0); -- Vile Fin Tidecaller
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1961 && `patch` IN (0); -- Mangeclaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1972 && `patch` IN (0); -- Grimson the Pale
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1978 && `patch` IN (0); -- Deathstalker Erland
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1984 && `patch` IN (0, 7); -- Young Thistle Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1985 && `patch` IN (0, 7); -- Thistle Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1986 && `patch` IN (0); -- Webwood Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1988 && `patch` IN (0); -- Grell
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1989 && `patch` IN (0); -- Grellkin
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1994 && `patch` IN (0); -- Githyiss the Vile
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1995 && `patch` IN (0); -- Strigid Owl
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1996 && `patch` IN (0); -- Strigid Screecher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1997 && `patch` IN (0); -- Strigid Hunter
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1998 && `patch` IN (0); -- Webwood Lurker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=1999 && `patch` IN (0); -- Webwood Venomfang
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2000 && `patch` IN (0); -- Webwood Silkspinner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2001 && `patch` IN (0); -- Giant Webwood Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2002 && `patch` IN (0); -- Rascal Sprite
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2003 && `patch` IN (0); -- Shadow Sprite
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2004 && `patch` IN (0); -- Dark Sprite
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2005 && `patch` IN (0); -- Vicious Grell
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2015 && `patch` IN (0); -- Bloodfeather Harpy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2018 && `patch` IN (0); -- Bloodfeather Sorceress
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2031 && `patch` IN (0); -- Young Nightsaber
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2032 && `patch` IN (0); -- Mangy Nightsaber
UPDATE `creature_template` SET `damage_multiplier`=1.42857 WHERE `entry`=2038 && `patch` IN (0); -- Lord Melenas
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=2042 && `patch` IN (0); -- Nightsaber
UPDATE `creature_template` SET `damage_multiplier`=0.77 WHERE `entry`=2043 && `patch` IN (0, 1); -- Nightsaber Stalker
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=2069 && `patch` IN (0); -- Moonstalker
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=2070 && `patch` IN (0); -- Moonstalker Runt
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=2071 && `patch` IN (0); -- Moonstalker Matriarch
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=2091 && `patch` IN (0); -- Chieftain Nek'rosh
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2108 && `patch` IN (0); -- Garneg Charskull
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=2121 && `patch` IN (0); -- Shadow Priest Allister
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2140 && `patch` IN (0); -- Edwin Harly
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2164 && `patch` IN (0); -- Rabid Thistle Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2165 && `patch` IN (0, 1); -- Grizzled Thistle Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2172 && `patch` IN (0); -- Strider Clutchmother
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=2175 && `patch` IN (0); -- Shadowclaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2182 && `patch` IN (0); -- Stormscale Sorceress
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2185 && `patch` IN (0); -- Darkshore Thresher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2187 && `patch` IN (0); -- Elder Darkshore Thresher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2191 && `patch` IN (0); -- Licillin
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2214 && `patch` IN (0); -- Deathstalker Lesh
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2216 && `patch` IN (0); -- Apothecary Lydon
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=2226 && `patch` IN (0); -- Karos Razok
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2229 && `patch` IN (0); -- Krusk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2230 && `patch` IN (0); -- Umpi
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2232 && `patch` IN (0); -- Tide Crawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2235 && `patch` IN (0); -- Reef Crawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2238 && `patch` IN (0); -- Tog'thar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2241 && `patch` IN (0); -- Syndicate Thief
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2244 && `patch` IN (0); -- Syndicate Shadow Mage
UPDATE `creature_template` SET `damage_multiplier`=1.875 WHERE `entry`=2253 && `patch` IN (0); -- Crushridge Brute
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2254 && `patch` IN (0); -- Crushridge Mauler
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2255 && `patch` IN (0); -- Crushridge Mage
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2256 && `patch` IN (0); -- Crushridge Enforcer
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=2257 && `patch` IN (0); -- Mug'thol
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2260 && `patch` IN (0); -- Syndicate Rogue
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2287 && `patch` IN (0); -- Crushridge Warmonger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2306 && `patch` IN (0); -- Baron Vardus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2316 && `patch` IN (0); -- Gol'dir
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2318 && `patch` IN (0); -- Argus Shadow Mage
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2321 && `patch` IN (0); -- Foreststrider Fledgling
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2322 && `patch` IN (0); -- Foreststrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2351 && `patch` IN (0); -- Gray Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2354 && `patch` IN (0); -- Vicious Gray Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2371 && `patch` IN (0); -- Daggerspine Siren
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2372 && `patch` IN (0); -- Mudsnout Gnoll
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2373 && `patch` IN (0); -- Mudsnout Shaman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2377 && `patch` IN (0); -- Torn Fin Tidehunter
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=2385 && `patch` IN (0); -- Feral Mountain Lion
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=2389 && `patch` IN (0); -- Zarise
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2390 && `patch` IN (0); -- Aranae Venomblood
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2399 && `patch` IN (0); -- Daryl Stack
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2405 && `patch` IN (0); -- Tarren Mill Deathguard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2408 && `patch` IN (0); -- Snapjaw
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=2410 && `patch` IN (0); -- Magus Wordeen Voidglare
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2416 && `patch` IN (0); -- Crushridge Plunderer
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2417 && `patch` IN (0); -- Grel'borg the Miser
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=2420 && `patch` IN (0); -- Targ
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2421 && `patch` IN (0); -- Muckrake
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2422 && `patch` IN (0); -- Glommus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2423 && `patch` IN (0); -- Lord Aliden Perenolde
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2434 && `patch` IN (0); -- Shadowy Assassin
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=2437 && `patch` IN (0); -- Keeper Bel'varil
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=2440 && `patch` IN (0); -- Drunken Footpad
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2452 && `patch` IN (0); -- Skhowl
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2476 && `patch` IN (0); -- Large Loch Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2477 && `patch` IN (0); -- Gradok
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2478 && `patch` IN (0); -- Haren Swifthoof
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2521 && `patch` IN (0); -- Skymane Gorilla
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2522 && `patch` IN (0); -- Jaguero Stalker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2529 && `patch` IN (0); -- Son of Arugal
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2545 && `patch` IN (0); -- "Pretty Boy" Duncan
UPDATE `creature_template` SET `damage_multiplier`=0.78 WHERE `entry`=2546 && `patch` IN (0); -- Fleet Master Firallon
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2548 && `patch` IN (0); -- Captain Keelhaul
UPDATE `creature_template` SET `damage_multiplier`=2.295 WHERE `entry`=2549 && `patch` IN (0); -- Garr Salthoof
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2550 && `patch` IN (0); -- Captain Stillwater
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2553 && `patch` IN (0); -- Witherbark Shadowcaster
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2558 && `patch` IN (0); -- Witherbark Berserker
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=2560 && `patch` IN (0); -- Highland Thrasher
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=2569 && `patch` IN (0); -- Boulderfist Mauler
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2570 && `patch` IN (0); -- Boulderfist Shaman
UPDATE `creature_template` SET `damage_multiplier`=4.03 WHERE `entry`=2571 && `patch` IN (0); -- Boulderfist Lord
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2573 && `patch` IN (0); -- Drywhisker Surveyor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2575 && `patch` IN (0); -- Dark Iron Supplier
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2578 && `patch` IN (0); -- Young Mesa Buzzard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2583 && `patch` IN (0); -- Stromgarde Troll Hunter
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2584 && `patch` IN (0); -- Stromgarde Defender
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2585 && `patch` IN (0); -- Stromgarde Vindicator
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2588 && `patch` IN (0); -- Syndicate Prowler
UPDATE `creature_template` SET `damage_multiplier`=0.78 WHERE `entry`=2589 && `patch` IN (0); -- Syndicate Mercenary
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2590 && `patch` IN (0); -- Syndicate Conjuror
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2591 && `patch` IN (0); -- Syndicate Magus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2596 && `patch` IN (0); -- Daggerspine Sorceress
UPDATE `creature_template` SET `damage_multiplier`=3.65 WHERE `entry`=2597 && `patch` IN (0); -- Lord Falconcrest
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=2598 && `patch` IN (0); -- Darbel Montrose
UPDATE `creature_template` SET `damage_multiplier`=4.59 WHERE `entry`=2599 && `patch` IN (0); -- Otto
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=2600 && `patch` IN (0); -- Singer
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=2601 && `patch` IN (0); -- Foulbelly
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=2602 && `patch` IN (0); -- Ruul Onestone
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2603 && `patch` IN (0); -- Kovork
UPDATE `creature_template` SET `damage_multiplier`=4.455 WHERE `entry`=2604 && `patch` IN (0); -- Molok the Crusher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2605 && `patch` IN (0); -- Zalas Witherbark
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2606 && `patch` IN (0); -- Nimar the Slayer
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=2607 && `patch` IN (0); -- Prince Galen Trollbane
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=2612 && `patch` IN (0); -- Lieutenant Valorcall
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2618 && `patch` IN (0); -- Hammerfall Peon
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2619 && `patch` IN (0); -- Hammerfall Grunt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2621 && `patch` IN (0); -- Hammerfall Guardian
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=2635 && `patch` IN (0); -- Elder Saltwater Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2636 && `patch` IN (0); -- Blackwater Deckhand
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=2641 && `patch` IN (0); -- Vilebranch Headhunter
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=2642 && `patch` IN (0); -- Vilebranch Shadowcaster
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=2643 && `patch` IN (0); -- Vilebranch Berserker
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=2644 && `patch` IN (0); -- Vilebranch Hideskinner
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=2645 && `patch` IN (0); -- Vilebranch Shadow Hunter
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=2646 && `patch` IN (0); -- Vilebranch Blood Drinker
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=2647 && `patch` IN (0); -- Vilebranch Soul Eater
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=2648 && `patch` IN (0); -- Vilebranch Aman'zasi Guard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2657 && `patch` IN (0); -- Trained Razorbeak
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2658 && `patch` IN (0); -- Razorbeak Gryphon
UPDATE `creature_template` SET `damage_multiplier`=2.635 WHERE `entry`=2681 && `patch` IN (0); -- Vilebranch Raiding Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2686 && `patch` IN (0); -- Witherbark Broodguard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2698 && `patch` IN (0); -- George Candarte
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2703 && `patch` IN (0); -- Zengu
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2706 && `patch` IN (0); -- Tor'gan
UPDATE `creature_template` SET `damage_multiplier`=5 WHERE `entry`=2707 && `patch` IN (0); -- Shadra
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2718 && `patch` IN (0); -- Dustbelcher Shaman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2721 && `patch` IN (0); -- Forsaken Bodyguard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2738 && `patch` IN (0); -- Stromgarde Cavalryman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2764 && `patch` IN (0); -- Sleeby
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2765 && `patch` IN (0); -- Znort
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2768 && `patch` IN (0); -- Professor Phizzlethorpe
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2769 && `patch` IN (0); -- Captain Steelgut
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2770 && `patch` IN (0); -- Tallow
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2772 && `patch` IN (0); -- Korin Fel
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=2773 && `patch` IN (0); -- Or'Kalar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2774 && `patch` IN (0); -- Doctor Draxlegauge
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2775 && `patch` IN (0); -- Daggerspine Marauder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2779 && `patch` IN (0); -- Prince Nazjak
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=2780 && `patch` IN (0); -- Caretaker Nevlin
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=2781 && `patch` IN (0); -- Caretaker Weston
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=2782 && `patch` IN (0); -- Caretaker Alaric
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2783 && `patch` IN (0); -- Marez Cowl
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2787 && `patch` IN (0); -- Zaruk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2792 && `patch` IN (0); -- Gor'mul
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=2805 && `patch` IN (0); -- Deneb Walker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2818 && `patch` IN (0); -- Slagg
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2820 && `patch` IN (0); -- Graud
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2830 && `patch` IN (0); -- Buzzard
UPDATE `creature_template` SET `damage_multiplier`=0.625 WHERE `entry`=2850 && `patch` IN (0); -- Broken Tooth
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=2892 && `patch` IN (0); -- Stonevault Seer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2924 && `patch` IN (0, 5); -- Silvermane Wolf
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=2931 && `patch` IN (0); -- Zaricotl
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=2932 && `patch` IN (0); -- Magregan Deepshadow
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=2937 && `patch` IN (0); -- Dagun the Ravenous
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2950 && `patch` IN (0); -- Palemane Skinner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2954 && `patch` IN (0, 7); -- Bristleback Battleboar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2955 && `patch` IN (0); -- Plainstrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2956 && `patch` IN (0); -- Adult Plainstrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2957 && `patch` IN (0); -- Elder Plainstrider
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=2958 && `patch` IN (0); -- Prairie Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2961 && `patch` IN (0); -- Mountain Cougar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2966 && `patch` IN (0, 7); -- Battleboar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2969 && `patch` IN (0); -- Wiry Swoop
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2970 && `patch` IN (0); -- Swoop
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=2971 && `patch` IN (0); -- Taloned Swoop
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=2972 && `patch` IN (0); -- Kodo Calf
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=2973 && `patch` IN (0); -- Kodo Bull
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=2974 && `patch` IN (0); -- Kodo Matriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3035 && `patch` IN (0); -- Flatland Cougar
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=3056 && `patch` IN (0); -- Ghost Howl
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=3058 && `patch` IN (0); -- Arra'chea
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3068 && `patch` IN (0); -- Mazzranache
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3084 && `patch` IN (0); -- Bluffwatcher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3098 && `patch` IN (0, 7); -- Mottled Boar
UPDATE `creature_template` SET `damage_multiplier`=1.53847 WHERE `entry`=3099 && `patch` IN (0, 7); -- Dire Mottled Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3100 && `patch` IN (0, 7); -- Elder Mottled Boar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3102 && `patch` IN (0); -- Felstalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3106 && `patch` IN (0); -- Pygmy Surf Crawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3107 && `patch` IN (0); -- Surf Crawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3110 && `patch` IN (0); -- Dreadmaw Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=3121 && `patch` IN (0); -- Durotar Tiger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3122 && `patch` IN (0); -- Bloodtalon Taillasher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3123 && `patch` IN (0); -- Bloodtalon Scythemaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3124 && `patch` IN (0); -- Scorpid Worker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3125 && `patch` IN (0); -- Clattering Scorpid
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3126 && `patch` IN (0); -- Armored Scorpid
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3128 && `patch` IN (0); -- Kul Tiras Sailor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3129 && `patch` IN (0); -- Kul Tiras Marine
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3149 && `patch` IN (0); -- Nez'raz
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3198 && `patch` IN (0); -- Burning Blade Apprentice
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3199 && `patch` IN (0); -- Burning Blade Cultist
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3203 && `patch` IN (0); -- Fizzle Darkstorm
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3210 && `patch` IN (0); -- Brave Proudsnout
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3211 && `patch` IN (0); -- Brave Lightninghorn
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3213 && `patch` IN (0); -- Brave Running Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3214 && `patch` IN (0); -- Brave Greathoof
UPDATE `creature_template` SET `damage_multiplier`=1.35 WHERE `entry`=3234 && `patch` IN (0); -- Lost Barrens Kodo
UPDATE `creature_template` SET `damage_multiplier`=1.35 WHERE `entry`=3235 && `patch` IN (0); -- Greater Barrens Kodo
UPDATE `creature_template` SET `damage_multiplier`=1.35 WHERE `entry`=3236 && `patch` IN (0); -- Barrens Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3238 && `patch` IN (0); -- Stormhide
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3240 && `patch` IN (0); -- Stormsnout
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3242 && `patch` IN (0); -- Zhevra Runner
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=3245 && `patch` IN (0); -- Ornery Plainstrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3246 && `patch` IN (0); -- Fleeting Plainstrider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3247 && `patch` IN (0, 6); -- Thunderhawk Hatchling
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3251 && `patch` IN (0); -- Silithid Grub
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3254 && `patch` IN (0); -- Sunscale Lashtail
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3255 && `patch` IN (0); -- Sunscale Screecher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3256 && `patch` IN (0); -- Sunscale Scytheclaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3257 && `patch` IN (0); -- Ishamuhale
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3269 && `patch` IN (0); -- Razormane Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3296 && `patch` IN (0); -- Orgrimmar Grunt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3380 && `patch` IN (0); -- Burning Blade Acolyte
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=3415 && `patch` IN (0); -- Savannah Huntress
UPDATE `creature_template` SET `damage_multiplier`=0.85 WHERE `entry`=3416 && `patch` IN (0); -- Savannah Matriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3424 && `patch` IN (0, 6); -- Thunderhawk Cloudscraper
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=3425 && `patch` IN (0); -- Savannah Prowler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3463 && `patch` IN (0); -- Wandering Barrens Giraffe
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3470 && `patch` IN (0); -- Rathorian
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3475 && `patch` IN (0); -- Echeyakee
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3503 && `patch` IN (0); -- Silithid Protector
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3544 && `patch` IN (0); -- Jason Lemieux
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3551 && `patch` IN (0); -- Patrice Dwyer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3552 && `patch` IN (0); -- Alexandre Lefevre
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3553 && `patch` IN (0); -- Sebastian Meloche
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3554 && `patch` IN (0); -- Andrea Boynton
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3555 && `patch` IN (0); -- Johan Focht
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3556 && `patch` IN (0); -- Andrew Hilbert
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3557 && `patch` IN (0); -- Guillaume Sorouy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3566 && `patch` IN (0); -- Flatland Prowler
UPDATE `creature_template` SET `damage_multiplier`=2.55 WHERE `entry`=3581 && `patch` IN (0); -- Sewer Beast
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3630 && `patch` IN (0, 6); -- Deviate Coiler
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3631 && `patch` IN (0, 6); -- Deviate Stinglash
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3632 && `patch` IN (0); -- Deviate Creeper
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3633 && `patch` IN (0); -- Deviate Slayer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3634 && `patch` IN (0); -- Deviate Stalker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3636 && `patch` IN (0); -- Deviate Ravager
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3637 && `patch` IN (0); -- Deviate Guardian
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3641 && `patch` IN (0); -- Deviate Lurker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3653 && `patch` IN (0); -- Kresh
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3655 && `patch` IN (0); -- Mad Magglish
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3662 && `patch` IN (0); -- Delmanis the Hated
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3664 && `patch` IN (0); -- Ilkrud Magthrull
UPDATE `creature_template` SET `damage_multiplier`=2.85 WHERE `entry`=3670 && `patch` IN (0); -- Lord Pythas
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=3671 && `patch` IN (0); -- Lady Anacondra
UPDATE `creature_template` SET `damage_multiplier`=2.85 WHERE `entry`=3673 && `patch` IN (0); -- Lord Serpentis
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3717 && `patch` IN (0); -- Wrathtail Sorceress
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3773 && `patch` IN (0); -- Akkrilus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3809 && `patch` IN (0); -- Ashenvale Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3812 && `patch` IN (0); -- Clattering Crawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3816 && `patch` IN (0); -- Wild Buck
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3817 && `patch` IN (0); -- Shadowhorn Stag
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3823 && `patch` IN (0); -- Ghostpaw Runner
UPDATE `creature_template` SET `damage_multiplier`=0.78 WHERE `entry`=3825 && `patch` IN (0); -- Ghostpaw Alpha
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3840 && `patch` IN (0); -- Druid of the Fang
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3845 && `patch` IN (0); -- Shindrell Swiftfire
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3850 && `patch` IN (0); -- Sorcerer Ashcrombe
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3851 && `patch` IN (0); -- Shadowfang Whitescalp
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3853 && `patch` IN (0); -- Shadowfang Moonwalker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3857 && `patch` IN (0); -- Shadowfang Glutton
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3859 && `patch` IN (0); -- Shadowfang Ragetooth
UPDATE `creature_template` SET `damage_multiplier`=3.92 WHERE `entry`=3886 && `patch` IN (0); -- Razorclaw the Butcher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3894 && `patch` IN (0); -- Pelturas Whitemoon
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3914 && `patch` IN (0); -- Rethilgore
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=3927 && `patch` IN (0); -- Wolf Master Nandos
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3936 && `patch` IN (0); -- Shandris Feathermoon
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=3937 && `patch` IN (0); -- Kira Songshine
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3939 && `patch` IN (0); -- Razormane Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3953 && `patch` IN (0); -- Tandaan Lightmane
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3954 && `patch` IN (0); -- Dalria
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3958 && `patch` IN (0); -- Lardan
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3959 && `patch` IN (0); -- Nantar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3961 && `patch` IN (0); -- Maliynn
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3962 && `patch` IN (0); -- Haljan Oakheart
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3967 && `patch` IN (0); -- Aayndia Floralwind
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3969 && `patch` IN (0); -- Fahran Silentblade
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3970 && `patch` IN (0); -- Llana
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=3983 && `patch` IN (0); -- Interrogator Vishas
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3984 && `patch` IN (0); -- Nancy Vishas
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=3985 && `patch` IN (0); -- Grandpa Vishas
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3986 && `patch` IN (0); -- Sarilus Foulborne
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=3991 && `patch` IN (0); -- Venture Co. Deforester
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4003 && `patch` IN (0); -- Windshear Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4008 && `patch` IN (0); -- Cliff Stormer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4009 && `patch` IN (0); -- Raging Cliff Stormer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4032 && `patch` IN (0); -- Young Chimaera
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4040 && `patch` IN (0); -- Cave Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4041 && `patch` IN (0); -- Scorched Basilisk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4063 && `patch` IN (0); -- Feeboz
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4064 && `patch` IN (0); -- Blackrock Scout
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4065 && `patch` IN (0); -- Blackrock Sentry
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=4067 && `patch` IN (0); -- Twilight Runner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4079 && `patch` IN (0); -- Sentinel Thenysil
UPDATE `creature_template` SET `damage_multiplier`=1.69 WHERE `entry`=4095 && `patch` IN (0); -- Galak Mauler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4096 && `patch` IN (0); -- Galak Windchaser
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4118 && `patch` IN (0, 6); -- Venomous Cloud Serpent
UPDATE `creature_template` SET `damage_multiplier`=0.72 WHERE `entry`=4124 && `patch` IN (0); -- Needles Cougar
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=4126 && `patch` IN (0); -- Crag Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4128 && `patch` IN (0); -- Hecklefang Stalker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4129 && `patch` IN (0); -- Hecklefang Snarler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4158 && `patch` IN (0, 5); -- Salt Flats Vulture
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4248 && `patch` IN (0); -- Pesterhide Hyena
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4263 && `patch` IN (0); -- Deepmoss Hatchling
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4264 && `patch` IN (0); -- Deepmoss Matriarch
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4277 && `patch` IN (0); -- Eye of Kilrogg
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4279 && `patch` IN (0); -- Odo the Blindwatcher
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4280 && `patch` IN (0); -- Scarlet Preserver
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4281 && `patch` IN (0); -- Scarlet Scout
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4282 && `patch` IN (0); -- Scarlet Magician
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4283 && `patch` IN (0); -- Scarlet Sentry
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4284 && `patch` IN (0); -- Scarlet Augur
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4285 && `patch` IN (0); -- Scarlet Disciple
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4286 && `patch` IN (0); -- Scarlet Soldier
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4287 && `patch` IN (0); -- Scarlet Gallant
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4288 && `patch` IN (0); -- Scarlet Beastmaster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4289 && `patch` IN (0); -- Scarlet Evoker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4291 && `patch` IN (0); -- Scarlet Diviner
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4292 && `patch` IN (0); -- Scarlet Protector
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4293 && `patch` IN (0); -- Scarlet Scryer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4295 && `patch` IN (0); -- Scarlet Myrmidon
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4296 && `patch` IN (0); -- Scarlet Adept
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4297 && `patch` IN (0); -- Scarlet Conjuror
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4299 && `patch` IN (0); -- Scarlet Chaplain
UPDATE `creature_template` SET `damage_multiplier`=1.275 WHERE `entry`=4304 && `patch` IN (0); -- Scarlet Tracking Hound
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4306 && `patch` IN (0); -- Scarlet Torturer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4342 && `patch` IN (0); -- Drywallow Vicejaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4344 && `patch` IN (0); -- Mottled Drywallow Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4351 && `patch` IN (0); -- Bloodfen Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4355 && `patch` IN (0); -- Bloodfen Scytheclaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4356 && `patch` IN (0); -- Bloodfen Razormaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4357 && `patch` IN (0); -- Bloodfen Lashtail
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4360 && `patch` IN (0); -- Mirefin Warrior
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4363 && `patch` IN (0); -- Mirefin Oracle
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4376 && `patch` IN (0); -- Darkmist Spider
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4377 && `patch` IN (0); -- Darkmist Lurker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4378 && `patch` IN (0); -- Darkmist Recluse
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4379 && `patch` IN (0); -- Darkmist Silkspinner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4380 && `patch` IN (0); -- Darkmist Widow
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4388 && `patch` IN (0); -- Young Murk Thresher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4389 && `patch` IN (0); -- Murk Thresher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4390 && `patch` IN (0); -- Elder Murk Thresher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4396 && `patch` IN (0); -- Mudrock Tortoise
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4397 && `patch` IN (0); -- Mudrock Spikeshell
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4398 && `patch` IN (0); -- Mudrock Burrower
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4399 && `patch` IN (0); -- Mudrock Borer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4400 && `patch` IN (0); -- Mudrock Snapjaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4411 && `patch` IN (0); -- Darkfang Lurker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4412 && `patch` IN (0); -- Darkfang Creeper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4413 && `patch` IN (0); -- Darkfang Spider
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=4415 && `patch` IN (0); -- Giant Darkfang Spider
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4427 && `patch` IN (0); -- Ward Guardian
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4428 && `patch` IN (0); -- Death Speaker Jargba
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4435 && `patch` IN (0); -- Razorfen Warrior
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4436 && `patch` IN (0); -- Razorfen Quilguard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4437 && `patch` IN (0); -- Razorfen Warden
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4438 && `patch` IN (0); -- Razorfen Spearhide
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4440 && `patch` IN (0); -- Razorfen Totemic
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4442 && `patch` IN (0); -- Razorfen Defender
UPDATE `creature_template` SET `damage_multiplier`=2.95 WHERE `entry`=4462 && `patch` IN (0); -- Blackrock Hunter
UPDATE `creature_template` SET `damage_multiplier`=2.04 WHERE `entry`=4464 && `patch` IN (0); -- Blackrock Gladiator
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=4465 && `patch` IN (0); -- Vilebranch Warrior
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4494 && `patch` IN (0); -- Scarlet Spellbinder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4505 && `patch` IN (0); -- Bloodsail Deckhand
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4506 && `patch` IN (0); -- Bloodsail Swabby
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4510 && `patch` IN (0); -- Heralath Fallowbrook
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4515 && `patch` IN (0); -- Death's Head Acolyte
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4516 && `patch` IN (0); -- Death's Head Adept
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4517 && `patch` IN (0); -- Death's Head Priest
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4519 && `patch` IN (0); -- Death's Head Seer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4520 && `patch` IN (0); -- Razorfen Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4522 && `patch` IN (0); -- Razorfen Dustweaver
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4523 && `patch` IN (0); -- Razorfen Groundshaker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4530 && `patch` IN (0); -- Razorfen Handler
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4532 && `patch` IN (0); -- Razorfen Beastmaster
UPDATE `creature_template` SET `damage_multiplier`=2.16 WHERE `entry`=4540 && `patch` IN (0); -- Scarlet Monk
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4623 && `patch` IN (0); -- Quilguard Champion
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4624 && `patch` IN (0, 2, 10); -- Booty Bay Bruiser
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4625 && `patch` IN (0); -- Death's Head Ward Keeper
UPDATE `creature_template` SET `damage_multiplier`=1.32 WHERE `entry`=4676 && `patch` IN (0); -- Lesser Infernal
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=4677 && `patch` IN (0); -- Doomwarder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4679 && `patch` IN (0); -- Nether Maiden
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4684 && `patch` IN (0); -- Nether Sorceress
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4685 && `patch` IN (0); -- Ley Hunter
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=4702 && `patch` IN (0); -- Ancient Kodo
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4788 && `patch` IN (0); -- Fallenroot Satyr
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4789 && `patch` IN (0); -- Fallenroot Rogue
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=4798 && `patch` IN (0); -- Fallenroot Shadowstalker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4799 && `patch` IN (0); -- Fallenroot Hellcaller
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4802 && `patch` IN (0); -- Blackfathom Tide Priestess
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4803 && `patch` IN (0); -- Blackfathom Oracle
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4805 && `patch` IN (0); -- Blackfathom Sea Witch
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4807 && `patch` IN (0, 7); -- Blackfathom Myrmidon
UPDATE `creature_template` SET `damage_multiplier`=1.2 WHERE `entry`=4809 && `patch` IN (0); -- Twilight Acolyte
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4810 && `patch` IN (0); -- Twilight Reaver
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4811 && `patch` IN (0); -- Twilight Aquamancer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4812 && `patch` IN (0); -- Twilight Loreseeker
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4813 && `patch` IN (0); -- Twilight Shadowmage
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4814 && `patch` IN (0); -- Twilight Elementalist
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4815 && `patch` IN (0); -- Murkshallow Snapclaw
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4818 && `patch` IN (0); -- Blindlight Murloc
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4819 && `patch` IN (0); -- Blindlight Muckdweller
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4820 && `patch` IN (0); -- Blindlight Oracle
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4831 && `patch` IN (0); -- Lady Sarevess
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4841 && `patch` IN (0); -- Deadmire
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4842 && `patch` IN (0); -- Earthcaller Halmgar
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4844 && `patch` IN (0); -- Shadowforge Surveyor
UPDATE `creature_template` SET `damage_multiplier`=1.955 WHERE `entry`=4845 && `patch` IN (0); -- Shadowforge Ruffian
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4846 && `patch` IN (0); -- Shadowforge Digger
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=4847 && `patch` IN (0); -- Shadowforge Relic Hunter
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=4850 && `patch` IN (0); -- Stonevault Cave Lurker
UPDATE `creature_template` SET `damage_multiplier`=2.31251 WHERE `entry`=4851 && `patch` IN (0); -- Stonevault Rockchewer
UPDATE `creature_template` SET `damage_multiplier`=1.8 WHERE `entry`=4852 && `patch` IN (0); -- Stonevault Oracle
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=4856 && `patch` IN (0); -- Stonevault Cave Hunter
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4954 && `patch` IN (0); -- Uttnar
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5048 && `patch` IN (0); -- Deviate Adder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5053 && `patch` IN (0); -- Deviate Crocolisk
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5056 && `patch` IN (0, 6); -- Deviate Dreadfang
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5195 && `patch` IN (0); -- Brown Riding Wolf
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=5224 && `patch` IN (0); -- Murk Slitherer
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=5225 && `patch` IN (0); -- Murk Spitter
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=5260 && `patch` IN (0); -- Groddoc Ape
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=5262 && `patch` IN (0, 7); -- Groddoc Thunderer
UPDATE `creature_template` SET `damage_multiplier`=2.7 WHERE `entry`=5269 && `patch` IN (0); -- Atal'ai Priest
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5272 && `patch` IN (0); -- Grizzled Ironfur Bear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5286 && `patch` IN (0); -- Longtooth Runner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5287 && `patch` IN (0, 5); -- Longtooth Howler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5300 && `patch` IN (0); -- Frayfeather Hippogryph
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5304 && `patch` IN (0); -- Frayfeather Stagwing
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5307 && `patch` IN (0); -- Vale Screecher
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=5347 && `patch` IN (0); -- Antilus the Soarer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5349 && `patch` IN (0); -- Arash-ethis
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=5352 && `patch` IN (0); -- Old Grizzlegut
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5356 && `patch` IN (0); -- Snarler
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=5401 && `patch` IN (0); -- Kazkaz the Unholy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5403 && `patch` IN (0); -- White Stallion
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5404 && `patch` IN (0); -- Black Stallion
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5405 && `patch` IN (0); -- Pinto
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5406 && `patch` IN (0); -- Palomino
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=5409 && `patch` IN (0); -- Harvester Swarm
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5423 && `patch` IN (0, 5); -- Scorpid Tail Lasher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5426 && `patch` IN (0); -- Blisterpaw Hyena
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5428 && `patch` IN (0); -- Roc
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5429 && `patch` IN (0); -- Fire Roc
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=5434 && `patch` IN (0); -- Coral Shark
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=5435 && `patch` IN (0); -- Sand Shark
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5546 && `patch` IN (0); -- Grunt Zuul
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5547 && `patch` IN (0); -- Grunt Tharlak
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5615 && `patch` IN (0); -- Wastewander Rogue
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5617 && `patch` IN (0); -- Wastewander Shadow Mage
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5623 && `patch` IN (0); -- Wastewander Assassin
UPDATE `creature_template` SET `damage_multiplier`=2.3 WHERE `entry`=5645 && `patch` IN (0); -- Sandfury Hideskinner
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=5646 && `patch` IN (0); -- Sandfury Axe Thrower
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=5647 && `patch` IN (0); -- Sandfury Firecaller
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=5648 && `patch` IN (0); -- Sandfury Shadowcaster
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=5649 && `patch` IN (0); -- Sandfury Blood Drinker
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=5650 && `patch` IN (0); -- Sandfury Witch Doctor
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=5694 && `patch` IN (0); -- High Sorcerer Andromath
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5748 && `patch` IN (0); -- Killian Sanatha
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5755 && `patch` IN (0); -- Deviate Viper
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5756 && `patch` IN (0, 6); -- Deviate Venomwing
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5757 && `patch` IN (0); -- Lilly
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5758 && `patch` IN (0); -- Leo Sarn
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=5760 && `patch` IN (0); -- Lord Azrethoc
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=5766 && `patch` IN (0); -- Savannah Cub
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5769 && `patch` IN (0); -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5774 && `patch` IN (0); -- Riding Wolf
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=5807 && `patch` IN (0); -- The Rake
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5822 && `patch` IN (0); -- Felweaver Scornn
UPDATE `creature_template` SET `damage_multiplier`=0.96 WHERE `entry`=5823 && `patch` IN (0); -- Death Flayer
UPDATE `creature_template` SET `damage_multiplier`=1.105 WHERE `entry`=5828 && `patch` IN (0); -- Humar the Pridelord
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5829 && `patch` IN (0); -- Snort the Heckler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5832 && `patch` IN (0); -- Thunderstomp
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5834 && `patch` IN (0); -- Azzere the Skyblade
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=5842 && `patch` IN (0); -- Takk the Leaper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5843 && `patch` IN (0); -- Slave Worker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5856 && `patch` IN (0); -- Glassweb Spider
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=5860 && `patch` IN (0); -- Twilight Dark Shaman
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=5861 && `patch` IN (0); -- Twilight Fire Guard
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=5862 && `patch` IN (0); -- Twilight Geomancer
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=5865 && `patch` IN (0); -- Dishu
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5886 && `patch` IN (0); -- Gwyn Farrow
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5933 && `patch` IN (0); -- Achellios the Banished
UPDATE `creature_template` SET `damage_multiplier`=2.35 WHERE `entry`=5934 && `patch` IN (0); -- Heartrazor
UPDATE `creature_template` SET `damage_multiplier`=1.75 WHERE `entry`=5935 && `patch` IN (0); -- Ironeye the Invincible
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=5937 && `patch` IN (0); -- Vile Sting
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5952 && `patch` IN (0); -- Den Grunt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5981 && `patch` IN (0); -- Portal Seeker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=5988 && `patch` IN (0, 5); -- Scorpok Stinger
UPDATE `creature_template` SET `damage_multiplier`=1.32 WHERE `entry`=6007 && `patch` IN (0); -- Shadowsworn Enforcer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6010 && `patch` IN (0); -- Felhound
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6013 && `patch` IN (0, 2); -- Wayward Buzzard
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6035 && `patch` IN (0); -- Razorfen Stalker
UPDATE `creature_template` SET `damage_multiplier`=0.3 WHERE `entry`=6071 && `patch` IN (0); -- Legion Hound
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6087 && `patch` IN (0); -- Astranaar Sentinel
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6126 && `patch` IN (0); -- Haldarr Trickster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6127 && `patch` IN (0); -- Haldarr Felsworn
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6132 && `patch` IN (0); -- Razorfen Servitor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6202 && `patch` IN (0); -- Legashi Hellcaller
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6215 && `patch` IN (0); -- Chomper
UPDATE `creature_template` SET `damage_multiplier`=1.44 WHERE `entry`=6243 && `patch` IN (0); -- Gelihast
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6250 && `patch` IN (0); -- Crawler
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=6367 && `patch` IN (0); -- Donni Anthania
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6389 && `patch` IN (0); -- Deathguard Podrig
UPDATE `creature_template` SET `damage_multiplier`=4.08 WHERE `entry`=6498 && `patch` IN (0); -- Devilsaur
UPDATE `creature_template` SET `damage_multiplier`=4.9 WHERE `entry`=6499 && `patch` IN (0); -- Ironhide Devilsaur
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=6501 && `patch` IN (0); -- Stegodon
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=6502 && `patch` IN (0); -- Plated Stegodon
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=6503 && `patch` IN (0); -- Spiked Stegodon
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=6504 && `patch` IN (0); -- Thunderstomp Stegodon
UPDATE `creature_template` SET `damage_multiplier`=0.975 WHERE `entry`=6505 && `patch` IN (0); -- Ravasaur
UPDATE `creature_template` SET `damage_multiplier`=0.975 WHERE `entry`=6506 && `patch` IN (0); -- Ravasaur Runner
UPDATE `creature_template` SET `damage_multiplier`=0.975 WHERE `entry`=6507 && `patch` IN (0); -- Ravasaur Hunter
UPDATE `creature_template` SET `damage_multiplier`=0.975 WHERE `entry`=6508 && `patch` IN (0); -- Venomhide Ravasaur
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=6523 && `patch` IN (0); -- Dark Iron Rifleman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6570 && `patch` IN (0); -- Fenwick Thatros
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6574 && `patch` IN (0); -- Jun'ha
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=6581 && `patch` IN (0); -- Ravasaur Matriarch
UPDATE `creature_template` SET `damage_multiplier`=6.375 WHERE `entry`=6584 && `patch` IN (0); -- King Mosh
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=6585 && `patch` IN (0, 7); -- Uhk'loc
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6707 && `patch` IN (0); -- Fahrad
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=6733 && `patch` IN (0); -- Stonevault Basher
UPDATE `creature_template` SET `damage_multiplier`=0.5 WHERE `entry`=6749 && `patch` IN (0); -- Erma
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6777 && `patch` IN (0); -- Zan Shivsproket
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6779 && `patch` IN (0); -- Smudge Thunderwood
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6788 && `patch` IN (0); -- Den Mother
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6789 && `patch` IN (0); -- Thistle Cub
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=6911 && `patch` IN (0); -- Minion of Sethir
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7007 && `patch` IN (0); -- Tiev Mordune
UPDATE `creature_template` SET `damage_multiplier`=4.25 WHERE `entry`=7051 && `patch` IN (0); -- Malformed Defias Drone
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7052 && `patch` IN (0); -- Defias Tower Patroller
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=7053 && `patch` IN (0); -- Klaven Mortwake
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7111 && `patch` IN (0); -- Jadefire Hellcaller
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=7135 && `patch` IN (0); -- Infernal Bodyguard
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=7136 && `patch` IN (0); -- Infernal Sentry
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7167 && `patch` IN (0); -- Polly
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7168 && `patch` IN (0); --  Polly
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7170 && `patch` IN (0); -- Thragomm
UPDATE `creature_template` SET `damage_multiplier`=0.8 WHERE `entry`=7234 && `patch` IN (0); -- Ferocitas the Dream Eater
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7235 && `patch` IN (0); -- Gnarlpine Mystic
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=7246 && `patch` IN (0); -- Sandfury Shadowhunter
UPDATE `creature_template` SET `damage_multiplier`=1.3 WHERE `entry`=7269 && `patch` IN (0); -- Scarab
UPDATE `creature_template` SET `damage_multiplier`=4.16 WHERE `entry`=7274 && `patch` IN (0); -- Sandfury Executioner
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7319 && `patch` IN (0); -- Lady Sathrah
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7324 && `patch` IN (0); -- Simone Cantrell
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7325 && `patch` IN (0); -- Master Kang
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7335 && `patch` IN (0); -- Death's Head Geomancer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7337 && `patch` IN (0); -- Death's Head Necromancer
UPDATE `creature_template` SET `damage_multiplier`=1.69 WHERE `entry`=7404 && `patch` IN (0); -- Galak Flame Guard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7489 && `patch` IN (0); -- Silverpine Deathguard
UPDATE `creature_template` SET `damage_multiplier`=1.3 WHERE `entry`=7671 && `patch` IN (0); -- Servant of Sevine
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=7728 && `patch` IN (0); -- Kirith the Damned
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=7788 && `patch` IN (0); -- Sandfury Drudge
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=7789 && `patch` IN (0, 10); -- Sandfury Cretin
UPDATE `creature_template` SET `damage_multiplier`=2.6 WHERE `entry`=7795 && `patch` IN (0); -- Hydromancer Velratha
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7803 && `patch` IN (0, 5); -- Scorpid Duneburrower
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7855 && `patch` IN (0); -- Southsea Pirate
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7856 && `patch` IN (0); -- Southsea Freebooter
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=7872 && `patch` IN (0); -- Death's Head Cultist
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=7873 && `patch` IN (0); -- Razorfen Battleguard
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=7874 && `patch` IN (0); -- Razorfen Thornweaver
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7877 && `patch` IN (0); -- Latronicus Moonspear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7939 && `patch` IN (0); -- Feathermoon Sentinel
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7975 && `patch` IN (0); -- Mulgore Protector
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=7977 && `patch` IN (0); -- Gammerita
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=7995 && `patch` IN (0); -- Vile Priestess Hexx
UPDATE `creature_template` SET `damage_multiplier`=3.835 WHERE `entry`=7996 && `patch` IN (0); -- Qiaga the Keeper
UPDATE `creature_template` SET `damage_multiplier`=3.75 WHERE `entry`=8075 && `patch` IN (0); -- Edana Hatetalon
UPDATE `creature_template` SET `damage_multiplier`=2.8 WHERE `entry`=8095 && `patch` IN (10); -- Sul'lithuz Sandcrawler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8147 && `patch` IN (0); -- Camp Mojache Brave
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8155 && `patch` IN (0); -- Kargath Grunt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8208 && `patch` IN (0); -- Murderous Blisterpaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8211 && `patch` IN (0); -- Old Cliff Jumper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8213 && `patch` IN (0); -- Ironback
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=8216 && `patch` IN (0); -- Retherokk the Berserker
UPDATE `creature_template` SET `damage_multiplier`=3.2 WHERE `entry`=8217 && `patch` IN (0); -- Mith'rethis the Enchanter
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8219 && `patch` IN (0); -- Zul'arek Hatefowler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8236 && `patch` IN (0); -- Muck Frenzy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8277 && `patch` IN (0); -- Rekk'tilac
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8280 && `patch` IN (0); -- Shleipnarr
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=8282 && `patch` IN (0); -- Highlord Mastrogonde
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8283 && `patch` IN (0); -- Slave Master Blackheart
UPDATE `creature_template` SET `damage_multiplier`=0.6 WHERE `entry`=8299 && `patch` IN (0); -- Spiteflayer
UPDATE `creature_template` SET `damage_multiplier`=0.65 WHERE `entry`=8300 && `patch` IN (0); -- Ravage
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8301 && `patch` IN (0); -- Clack the Reaver
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=8302 && `patch` IN (0); -- Deatheye
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8303 && `patch` IN (0); -- Grunter
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8385 && `patch` IN (0); -- Mura Runetotem
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8402 && `patch` IN (0); -- Enslaved Archaeologist
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8417 && `patch` IN (0); -- Dying Archaeologist
UPDATE `creature_template` SET `damage_multiplier`=3.1 WHERE `entry`=8419 && `patch` IN (0); -- Twilight Idolater
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=8444 && `patch` IN (0); -- Trade Master Kovic
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8503 && `patch` IN (0); -- Gibblewilt
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=8504 && `patch` IN (0); -- Dark Iron Sentry
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8508 && `patch` IN (0); -- Gretta Ganter
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8550 && `patch` IN (0); -- Shadowmage
UPDATE `creature_template` SET `damage_multiplier`=0.9375 WHERE `entry`=8596 && `patch` IN (0); -- Plaguehound Runt
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8602 && `patch` IN (0); -- Monstrous Plaguebat
UPDATE `creature_template` SET `damage_multiplier`=3.835 WHERE `entry`=8636 && `patch` IN (0); -- Morta'gya the Keeper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8637 && `patch` IN (0); -- Dark Iron Watchman
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8660 && `patch` IN (0); -- The Evalcharr
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8675 && `patch` IN (0); -- Felbeast
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8882 && `patch` IN (0); -- Riding Tiger
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8883 && `patch` IN (0); -- Riding Horse
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8885 && `patch` IN (0); -- Riding Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=8886 && `patch` IN (0); -- Deviate Python
UPDATE `creature_template` SET `damage_multiplier`=2.32 WHERE `entry`=8889 && `patch` IN (0); -- Anvilrage Overseer
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=8890 && `patch` IN (0); -- Anvilrage Warden
UPDATE `creature_template` SET `damage_multiplier`=2.9 WHERE `entry`=8917 && `patch` IN (0); -- Quarry Slave
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=9042 && `patch` IN (0); -- Verek
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=9043 && `patch` IN (0); -- Scarshield Grunt
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=9044 && `patch` IN (0); -- Scarshield Sentry
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9045 && `patch` IN (0); -- Scarshield Acolyte
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9046 && `patch` IN (0); -- Scarshield Quartermaster
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9077 && `patch` IN (0); -- Warlord Goretooth
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9080 && `patch` IN (0); -- Lexlort
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9081 && `patch` IN (0); -- Galamav the Marksman
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9097 && `patch` IN (0); -- Scarshield Legionnaire
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9098 && `patch` IN (0); -- Scarshield Spellbinder
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9297 && `patch` IN (0); -- Enraged Wyvern
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=9460 && `patch` IN (0, 2, 10); -- Gadgetzan Bruiser
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9521 && `patch` IN (0, 2); -- Enraged Felbat
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9526 && `patch` IN (0); -- Enraged Gryphon
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=9527 && `patch` IN (0); -- Enraged Hippogryph
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9553 && `patch` IN (0); -- Nadia Vernon
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=9555 && `patch` IN (0); -- Mu'uta
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=9683 && `patch` IN (0); -- Lar'korwi Mate
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=9684 && `patch` IN (0); -- Lar'korwi
UPDATE `creature_template` SET `damage_multiplier`=1.15 WHERE `entry`=9694 && `patch` IN (0); -- Slavering Ember Worg
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10036 && `patch` IN (0); -- Brackenwall Enforcer
UPDATE `creature_template` SET `damage_multiplier`=0.81 WHERE `entry`=10077 && `patch` IN (0); -- Deathmaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10078 && `patch` IN (0); -- Terrorspark
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=10200 && `patch` IN (0); -- Rak'shiri
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=10356 && `patch` IN (0); -- Bayne
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10357 && `patch` IN (0); -- Ressan the Needler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10359 && `patch` IN (0); -- Sri'skulk
UPDATE `creature_template` SET `damage_multiplier`=0.8125 WHERE `entry`=10644 && `patch` IN (0, 5); -- Mist Howler
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10647 && `patch` IN (0); -- Prince Raze
UPDATE `creature_template` SET `damage_multiplier`=1.9 WHERE `entry`=10696 && `patch` IN (0); -- Refuge Pointe Defender
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10717 && `patch` IN (0); -- Temporal Parasite
UPDATE `creature_template` SET `damage_multiplier`=2.1 WHERE `entry`=10738 && `patch` IN (0); -- High Chief Winterfall
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=10760 && `patch` IN (0); -- Grimtotem Geomancer
UPDATE `creature_template` SET `damage_multiplier`=3.835 WHERE `entry`=10802 && `patch` IN (0); -- Hitah'ya the Keeper
UPDATE `creature_template` SET `damage_multiplier`=4.8 WHERE `entry`=10806 && `patch` IN (0); -- Ursius
UPDATE `creature_template` SET `damage_multiplier`=3.8 WHERE `entry`=10807 && `patch` IN (0); -- Brumeran
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=10882 && `patch` IN (0); -- Arikara
UPDATE `creature_template` SET `damage_multiplier`=0.75 WHERE `entry`=10979 && `patch` IN (0); -- Scarlet Hound
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11034 && `patch` IN (0); -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11036 && `patch` IN (0); -- Leonid Barthalomew the Revered
UPDATE `creature_template` SET `damage_multiplier`=9.45 WHERE `entry`=11079 && `patch` IN (0); -- Wynd Nightchaser
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11137 && `patch` IN (0); -- Xai'ander
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11180 && `patch` IN (0); -- Bloodvenom Post Brave
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=11190 && `patch` IN (0, 2, 10); -- Everlook Bruiser
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11318 && `patch` IN (0); -- Ragefire Trogg
UPDATE `creature_template` SET `damage_multiplier`=1.5 WHERE `entry`=11319 && `patch` IN (0); -- Ragefire Shaman
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11322 && `patch` IN (0); -- Searing Blade Cultist
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11323 && `patch` IN (0); -- Searing Blade Enforcer
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11324 && `patch` IN (0); -- Searing Blade Warlock
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=11346 && `patch` IN (5); -- Hakkari Oracle
UPDATE `creature_template` SET `damage_multiplier`=3.5 WHERE `entry`=11355 && `patch` IN (0); -- Gurubashi Warrior
UPDATE `creature_template` SET `damage_multiplier`=4.5 WHERE `entry`=11383 && `patch` IN (0); -- High Priestess Hai'watna
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=11440 && `patch` IN (0); -- Gordok Enforcer
UPDATE `creature_template` SET `damage_multiplier`=3.4 WHERE `entry`=11442 && `patch` IN (0); -- Gordok Mauler
UPDATE `creature_template` SET `damage_multiplier`=3.3 WHERE `entry`=11443 && `patch` IN (0); -- Gordok Ogre-Mage
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=11517 && `patch` IN (0); -- Oggleflint
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=11518 && `patch` IN (0); -- Jergosh the Invoker
UPDATE `creature_template` SET `damage_multiplier`=2.2 WHERE `entry`=11519 && `patch` IN (0); -- Bazzalan
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=11520 && `patch` IN (0); -- Taragaman the Hungerer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11564 && `patch` IN (0); -- Gizelton Caravan Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11611 && `patch` IN (0); -- Cavalier Durgen
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11656 && `patch` IN (0); -- Horde Peon
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11681 && `patch` IN (0); -- Horde Deforester
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11683 && `patch` IN (0); -- Horde Shaman
UPDATE `creature_template` SET `damage_multiplier`=1.1 WHERE `entry`=11697 && `patch` IN (0); -- Mannoroc Lasher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11739 && `patch` IN (0); -- Rock Stalker
UPDATE `creature_template` SET `damage_multiplier`=2.5 WHERE `entry`=11787 && `patch` IN (0); -- Rock Borer
UPDATE `creature_template` SET `damage_multiplier`=2.4 WHERE `entry`=11788 && `patch` IN (0); -- Rock Worm
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11822 && `patch` IN (7, 10); -- Moonglade Warden
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=11859 && `patch` IN (7); -- Doomguard
UPDATE `creature_template` SET `damage_multiplier`=7.1 WHERE `entry`=11871 && `patch` IN (0); -- Grinning Dog
UPDATE `creature_template` SET `damage_multiplier`=5.5 WHERE `entry`=11885 && `patch` IN (0); -- Blighthound
UPDATE `creature_template` SET `damage_multiplier`=6.5 WHERE `entry`=11896 && `patch` IN (0); -- Borelgore
UPDATE `creature_template` SET `damage_multiplier`=5.5 WHERE `entry`=11897 && `patch` IN (0); -- Duskwing
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11921 && `patch` IN (0); -- Besseleth
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=11937 && `patch` IN (0); -- Demon Portal Guardian
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11956 && `patch` IN (0); -- Great Bear Spirit
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=11957 && `patch` IN (0); -- Great Cat Spirit
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=12123 && `patch` IN (0); -- Reef Shark
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12338 && `patch` IN (0); -- Shadowprey Guardian
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12346 && `patch` IN (0); -- Emerald Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12349 && `patch` IN (0); -- Turquoise Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12350 && `patch` IN (0); -- Violet Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12351 && `patch` IN (0); -- Dire Riding Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12353 && `patch` IN (0); -- Timber Riding Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12354 && `patch` IN (0); -- Brown Riding Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12355 && `patch` IN (0); -- Gray Riding Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12372 && `patch` IN (0); -- Brown Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12373 && `patch` IN (0); -- Gray Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12374 && `patch` IN (0); -- White Riding Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12375 && `patch` IN (0); -- Chestnut Mare
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12376 && `patch` IN (0); -- Brown Horse
UPDATE `creature_template` SET `damage_multiplier`=1.95 WHERE `entry`=12418 && `patch` IN (0); -- Gordok Hyena
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=12425 && `patch` IN (0); -- Flint Shadowmore
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12431 && `patch` IN (0); -- Gorefang
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12432 && `patch` IN (0); -- Old Vicejaw
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12433 && `patch` IN (0); -- Krethis Shadowspinner
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=12579 && `patch` IN (0); -- Bloodfury Ripper
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=12902 && `patch` IN (0); -- Lorgus Jett
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=12920 && `patch` IN (0); -- Doctor Gregory Victor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13085 && `patch` IN (0); -- Myrokos Silentform
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=13158 && `patch` IN (0); -- Lieutenant Sanders
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=13602 && `patch` IN (0); -- The Abominable Greench
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=13896 && `patch` IN (0, 7); -- Scalebeard
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14221 && `patch` IN (0); -- Gravis Slipknot
UPDATE `creature_template` SET `damage_multiplier`=0.7 WHERE `entry`=14222 && `patch` IN (0); -- Araga
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14223 && `patch` IN (0); -- Cranky Benj
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14232 && `patch` IN (0); -- Dart
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14233 && `patch` IN (0); -- Ripscale
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14268 && `patch` IN (1); -- Lord Condar
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14277 && `patch` IN (0); -- Lady Zephris
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14278 && `patch` IN (0); -- Ro'Bark
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14279 && `patch` IN (0); -- Creepthess
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14280 && `patch` IN (0); -- Big Samras
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14281 && `patch` IN (0); -- Jimmy the Bleeder
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14343 && `patch` IN (0); -- Olm the Wise
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14344 && `patch` IN (1); -- Mongress
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=14394 && `patch` IN (1); -- Major Mattingly
UPDATE `creature_template` SET `damage_multiplier`=0.77 WHERE `entry`=14430 && `patch` IN (0); -- Duskstalker
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14442 && `patch` IN (2); -- Hunter Thunderhorn
UPDATE `creature_template` SET `damage_multiplier`=0.675 WHERE `entry`=14490 && `patch` IN (2); -- Rippa
UPDATE `creature_template` SET `damage_multiplier`=1.25 WHERE `entry`=14491 && `patch` IN (0); -- Kurmokk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14539 && `patch` IN (2); -- Swift Timber Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14540 && `patch` IN (2); -- Swift Brown Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14541 && `patch` IN (2); -- Swift Gray Wolf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14542 && `patch` IN (2); -- Great White Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14543 && `patch` IN (2); -- Swift Olive Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14544 && `patch` IN (2); -- Swift Orange Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14545 && `patch` IN (2); -- Swift Blue Raptor
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14546 && `patch` IN (2); -- Swift Brown Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14547 && `patch` IN (2); -- Swift White Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14548 && `patch` IN (2); -- Swift Gray Ram
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14549 && `patch` IN (2); -- Great Brown Kodo
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14559 && `patch` IN (2); -- Swift Palamino
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14560 && `patch` IN (2); -- Swift White Steed
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14561 && `patch` IN (2); -- Swift Brown Steed
UPDATE `creature_template` SET `damage_multiplier`=4 WHERE `entry`=14621 && `patch` IN (3); -- Overseer Maltorius
UPDATE `creature_template` SET `damage_multiplier`=12 WHERE `entry`=14721 && `patch` IN (3); -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14730 && `patch` IN (3); -- Revantusk Watcher
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14757 && `patch` IN (3); -- Elder Torntusk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=14984 && `patch` IN (5); -- Sergeant Maclear
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15021 && `patch` IN (5); -- Deathmaster Dwire
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15022 && `patch` IN (5); -- Deathstalker Mortis
UPDATE `creature_template` SET `damage_multiplier`=2 WHERE `entry`=15138 && `patch` IN (5); -- Silverpine Elite
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15174 && `patch` IN (6); -- Calandrath
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15175 && `patch` IN (6); -- Khur Hornstriker
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15176 && `patch` IN (6); -- Vargus
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15177 && `patch` IN (6); -- Cloud Skydancer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15179 && `patch` IN (6); -- Mishta
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15180 && `patch` IN (6); -- Baristolth of the Shifting Sands
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15183 && `patch` IN (6); -- Geologist Larksbane
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15191 && `patch` IN (6); -- Windcaller Proudhorn
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=15196 && `patch` IN (6); -- Deathclasp
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15270 && `patch` IN (6); -- Huum Wildmane
UPDATE `creature_template` SET `damage_multiplier`=1.7 WHERE `entry`=15282 && `patch` IN (6); -- Aurel Goldleaf
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15306 && `patch` IN (6); -- Bor Wildmane
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15308 && `patch` IN (6); -- Twilight Prophet
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15328 && `patch` IN (8); -- Steam Tonk
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15350 && `patch` IN (6); -- Horde Warbringer
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15419 && `patch` IN (6); -- Kania
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15692 && `patch` IN (6); -- Dark Iron Kidnapper
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15722 && `patch` IN (7); -- Squire Leoren Mal'derath
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=15760 && `patch` IN (6); -- Winter Reveler
UPDATE `creature_template` SET `damage_multiplier`=3 WHERE `entry`=16096 && `patch` IN (8); -- Steamwheedle Bruiser
UPDATE `creature_template` SET `damage_multiplier`=35 WHERE `entry`=16506 && `patch` IN (9); -- Naxxramas Worshipper
UPDATE `creature_template` SET `damage_multiplier`=45.5 WHERE `entry`=16803 && `patch` IN (9); -- Deathknight Understudy
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=17804 && `patch` IN (10); -- Squire Rowe

-- Armor Multipliers
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=30 && `patch` IN (0); -- Forest Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=38 && `patch` IN (0); -- Defias Thug
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=43 && `patch` IN (0); -- Mine Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=68 && `patch` IN (0); -- Stormwind City Guard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=80 && `patch` IN (0); -- Kobold Laborer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=94 && `patch` IN (0); -- Defias Cutpurse
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=103 && `patch` IN (0); -- Garrick Padfoot
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=116 && `patch` IN (0); -- Defias Bandit
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=118 && `patch` IN (0); -- Prowler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=125 && `patch` IN (0); -- Riverpaw Overseer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=257 && `patch` IN (0); -- Kobold Worker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=466 && `patch` IN (0); -- General Marcus Jonathan
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=469 && `patch` IN (0); -- Lieutenant Doren
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=474 && `patch` IN (0); -- Defias Rogue Wizard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=476 && `patch` IN (0); -- Kobold Geomancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=574 && `patch` IN (0); -- Naraxis
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=659 && `patch` IN (0); -- El Pollo Grande
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=686 && `patch` IN (0); -- Lashtail Raptor
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=708 && `patch` IN (0, 7); -- Small Crag Boar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=754 && `patch` IN (0); -- Rebel Watchman
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=756 && `patch` IN (0); -- Skullsplitter Panther
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=814 && `patch` IN (0); -- Sergeant Malthus
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=818 && `patch` IN (0); -- Mai'Zoth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=819 && `patch` IN (0); -- Servant of Ilgalar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=854 && `patch` IN (0); -- Young Jungle Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=861 && `patch` IN (0); -- Stonard Scout
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=866 && `patch` IN (0); -- Stonard Grunt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=875 && `patch` IN (0); -- Saltscale Tide Lord
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=881 && `patch` IN (0); -- Surena Caledon
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=922 && `patch` IN (0); -- Silt Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=946 && `patch` IN (0); -- Frostmane Novice
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1020 && `patch` IN (0); -- Mottled Raptor
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1034 && `patch` IN (0); -- Dragonmaw Raider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1035 && `patch` IN (0); -- Dragonmaw Swamprunner
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1036 && `patch` IN (0); -- Dragonmaw Centurion
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1037 && `patch` IN (0); -- Dragonmaw Battlemaster
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1038 && `patch` IN (0); -- Dragonmaw Shadowwarder
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1057 && `patch` IN (0); -- Dragonmaw Bonewarder
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1064 && `patch` IN (0); -- Grom'gol Grunt
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=1088 && `patch` IN (0); -- Monstrous Crawler
UPDATE `creature_template` SET `armor_multiplier`=0 WHERE `entry`=1108 && `patch` IN (0, 7); -- Mistvale Gorilla
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1115 && `patch` IN (0); -- Rockjaw Skullthumper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1121 && `patch` IN (0); -- Frostmane Snowstrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1124 && `patch` IN (0); -- Frostmane Shadowcaster
UPDATE `creature_template` SET `armor_multiplier`=0.3 WHERE `entry`=1129 && `patch` IN (0); -- Black Bear
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1140 && `patch` IN (0); -- Razormaw Matriarch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1199 && `patch` IN (0); -- Juvenile Snow Leopard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1201 && `patch` IN (0); -- Snow Leopard
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=1423 && `patch` IN (0); -- Stormwind Guard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1504 && `patch` IN (0); -- Young Night Web Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1505 && `patch` IN (0); -- Night Web Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1506 && `patch` IN (0); -- Scarlet Convert
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1507 && `patch` IN (0); -- Scarlet Initiate
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1509 && `patch` IN (0); -- Ragged Scavenger
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1511 && `patch` IN (0); -- Enraged Silverback Gorilla
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1513 && `patch` IN (0); -- Mangy Duskbat
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1514 && `patch` IN (0); -- Mokk the Savage
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1535 && `patch` IN (0); -- Scarlet Warrior
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1536 && `patch` IN (0); -- Scarlet Missionary
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1537 && `patch` IN (0); -- Scarlet Zealot
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1538 && `patch` IN (0); -- Scarlet Friar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1543 && `patch` IN (0); -- Vile Fin Puddlejumper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1545 && `patch` IN (0); -- Vile Fin Muckdweller
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1549 && `patch` IN (0); -- Ravenous Darkhound
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1551 && `patch` IN (0); -- Ironjaw Basilisk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1555 && `patch` IN (0); -- Vicious Night Web Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1559 && `patch` IN (0); -- King Mukla
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1563 && `patch` IN (0); -- Bloodsail Swashbuckler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1564 && `patch` IN (0); -- Bloodsail Warlock
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1565 && `patch` IN (0); -- Bloodsail Sea Dog
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1642 && `patch` IN (0); -- Northshire Guard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1653 && `patch` IN (0); -- Bloodsail Elder Magus
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1666 && `patch` IN (0); -- Kam Deepfury
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1688 && `patch` IN (0); -- Night Web Matriarch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1708 && `patch` IN (0); -- Defias Inmate
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1711 && `patch` IN (0); -- Defias Convict
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1715 && `patch` IN (0); -- Defias Insurgent
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1716 && `patch` IN (0); -- Bazil Thredd
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1717 && `patch` IN (0); -- Hamhock
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1769 && `patch` IN (0); -- Moonrage Whitescalp
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1838 && `patch` IN (0); -- Scarlet Interrogator
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1839 && `patch` IN (0); -- Scarlet High Clerist
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1843 && `patch` IN (0); -- Foreman Jerris
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1846 && `patch` IN (0); -- High Protector Lorik
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1854 && `patch` IN (0); -- High Priest Thel'danis
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1985 && `patch` IN (0, 7); -- Thistle Boar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1986 && `patch` IN (0); -- Webwood Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1988 && `patch` IN (0); -- Grell
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1989 && `patch` IN (0); -- Grellkin
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1994 && `patch` IN (0); -- Githyiss the Vile
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1998 && `patch` IN (0); -- Webwood Lurker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=1999 && `patch` IN (0); -- Webwood Venomfang
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2000 && `patch` IN (0); -- Webwood Silkspinner
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2003 && `patch` IN (0); -- Shadow Sprite
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2018 && `patch` IN (0); -- Bloodfeather Sorceress
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2033 && `patch` IN (0); -- Elder Nightsaber
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2042 && `patch` IN (0); -- Nightsaber
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2043 && `patch` IN (0, 1); -- Nightsaber Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2091 && `patch` IN (0); -- Chieftain Nek'rosh
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2174 && `patch` IN (0); -- Coastal Frenzy
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2185 && `patch` IN (0); -- Darkshore Thresher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2187 && `patch` IN (0); -- Elder Darkshore Thresher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2226 && `patch` IN (0); -- Karos Razok
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2231 && `patch` IN (0); -- Pygmy Tide Crawler
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2232 && `patch` IN (0); -- Tide Crawler
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2233 && `patch` IN (0); -- Encrusted Tide Crawler
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2234 && `patch` IN (0); -- Young Reef Crawler
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2235 && `patch` IN (0); -- Reef Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2238 && `patch` IN (0); -- Tog'thar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2319 && `patch` IN (0); -- Syndicate Wizard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2321 && `patch` IN (0); -- Foreststrider Fledgling
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2322 && `patch` IN (0); -- Foreststrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2323 && `patch` IN (0); -- Giant Foreststrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2387 && `patch` IN (0); -- Hillsbrad Councilman
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2389 && `patch` IN (0); -- Zarise
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2391 && `patch` IN (0); -- Serge Hinott
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2392 && `patch` IN (0); -- Delia Verana
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2393 && `patch` IN (0); -- Christoph Jeffcoat
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2394 && `patch` IN (0); -- Mallen Swain
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2395 && `patch` IN (0); -- Vinna Wayne
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2396 && `patch` IN (0); -- Hans Zandin
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2397 && `patch` IN (0); -- Derak Nightfall
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2398 && `patch` IN (0); -- Tara Coldgaze
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2400 && `patch` IN (0); -- Craig Hewitt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2402 && `patch` IN (0); -- Shara Blazen
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2405 && `patch` IN (0); -- Tarren Mill Deathguard
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2418 && `patch` IN (0); -- Deathguard Samsa
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2419 && `patch` IN (0); -- Deathguard Humbert
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2440 && `patch` IN (0); -- Drunken Footpad
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2478 && `patch` IN (0); -- Haren Swifthoof
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=2518 && `patch` IN (0); -- Mountaineer Swarth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2521 && `patch` IN (0); -- Skymane Gorilla
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2522 && `patch` IN (0); -- Jaguero Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2529 && `patch` IN (0); -- Son of Arugal
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=2544 && `patch` IN (0); -- Southern Sand Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2546 && `patch` IN (0); -- Fleet Master Firallon
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2548 && `patch` IN (0); -- Captain Keelhaul
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2549 && `patch` IN (0); -- Garr Salthoof
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2550 && `patch` IN (0); -- Captain Stillwater
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2561 && `patch` IN (0); -- Highland Fleshstalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2578 && `patch` IN (0); -- Young Mesa Buzzard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2605 && `patch` IN (0); -- Zalas Witherbark
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2636 && `patch` IN (0); -- Blackwater Deckhand
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2647 && `patch` IN (0); -- Vilebranch Soul Eater
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2657 && `patch` IN (0); -- Trained Razorbeak
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2732 && `patch` IN (0); -- Ridge Huntress
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2734 && `patch` IN (0); -- Ridge Stalker Patriarch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2738 && `patch` IN (0); -- Stromgarde Cavalryman
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2787 && `patch` IN (0); -- Zaruk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2821 && `patch` IN (0); -- Keena
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2829 && `patch` IN (0); -- Starving Buzzard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2830 && `patch` IN (0); -- Buzzard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2831 && `patch` IN (0); -- Giant Buzzard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2892 && `patch` IN (0); -- Stonevault Seer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2932 && `patch` IN (0); -- Magregan Deepshadow
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2954 && `patch` IN (0, 7); -- Bristleback Battleboar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2956 && `patch` IN (0); -- Adult Plainstrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2957 && `patch` IN (0); -- Elder Plainstrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2961 && `patch` IN (0); -- Mountain Cougar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2966 && `patch` IN (0, 7); -- Battleboar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2969 && `patch` IN (0); -- Wiry Swoop
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2970 && `patch` IN (0); -- Swoop
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2971 && `patch` IN (0); -- Taloned Swoop
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2972 && `patch` IN (0); -- Kodo Calf
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=2974 && `patch` IN (0); -- Kodo Matriarch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3035 && `patch` IN (0); -- Flatland Cougar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3084 && `patch` IN (0); -- Bluffwatcher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3106 && `patch` IN (0); -- Pygmy Surf Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3107 && `patch` IN (0); -- Surf Crawler
UPDATE `creature_template` SET `armor_multiplier`=1.15 WHERE `entry`=3108 && `patch` IN (0); -- Encrusted Surf Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3110 && `patch` IN (0); -- Dreadmaw Crocolisk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3120 && `patch` IN (0); -- Kolkar Outrunner
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3121 && `patch` IN (0); -- Durotar Tiger
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3122 && `patch` IN (0); -- Bloodtalon Taillasher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3123 && `patch` IN (0); -- Bloodtalon Scythemaw
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3124 && `patch` IN (0); -- Scorpid Worker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3125 && `patch` IN (0); -- Clattering Scorpid
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=3126 && `patch` IN (0); -- Armored Scorpid
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3127 && `patch` IN (0); -- Venomtail Scorpid
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3130 && `patch` IN (0); -- Thunder Lizard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3210 && `patch` IN (0); -- Brave Proudsnout
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3211 && `patch` IN (0); -- Brave Lightninghorn
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3213 && `patch` IN (0); -- Brave Running Wolf
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3214 && `patch` IN (0); -- Brave Greathoof
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3234 && `patch` IN (0); -- Lost Barrens Kodo
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3246 && `patch` IN (0); -- Fleeting Plainstrider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3251 && `patch` IN (0); -- Silithid Grub
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3254 && `patch` IN (0); -- Sunscale Lashtail
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3255 && `patch` IN (0); -- Sunscale Screecher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3269 && `patch` IN (0); -- Razormane Geomancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3281 && `patch` IN (0); -- Sarkoth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3296 && `patch` IN (0); -- Orgrimmar Grunt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3537 && `patch` IN (0); -- Zixil
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3539 && `patch` IN (0); -- Ott
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3581 && `patch` IN (0); -- Sewer Beast
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3634 && `patch` IN (0); -- Deviate Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3655 && `patch` IN (0); -- Mad Magglish
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3857 && `patch` IN (0); -- Shadowfang Glutton
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3859 && `patch` IN (0); -- Shadowfang Ragetooth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3886 && `patch` IN (0); -- Razorclaw the Butcher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3927 && `patch` IN (0); -- Wolf Master Nandos
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3936 && `patch` IN (0); -- Shandris Feathermoon
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3939 && `patch` IN (0); -- Razormane Wolf
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3962 && `patch` IN (0); -- Haljan Oakheart
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3967 && `patch` IN (0); -- Aayndia Floralwind
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=3986 && `patch` IN (0); -- Sarilus Foulborne
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4008 && `patch` IN (0); -- Cliff Stormer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4044 && `patch` IN (0); -- Blackened Basilisk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4124 && `patch` IN (0); -- Needles Cougar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4158 && `patch` IN (0, 5); -- Salt Flats Vulture
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4248 && `patch` IN (0); -- Pesterhide Hyena
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4277 && `patch` IN (0); -- Eye of Kilrogg
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4279 && `patch` IN (0); -- Odo the Blindwatcher
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4286 && `patch` IN (0); -- Scarlet Soldier
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4289 && `patch` IN (0); -- Scarlet Evoker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4290 && `patch` IN (0); -- Scarlet Guardsman
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4292 && `patch` IN (0); -- Scarlet Protector
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4295 && `patch` IN (0); -- Scarlet Myrmidon
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4297 && `patch` IN (0); -- Scarlet Conjuror
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4344 && `patch` IN (0); -- Mottled Drywallow Crocolisk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4351 && `patch` IN (0); -- Bloodfen Raptor
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4356 && `patch` IN (0); -- Bloodfen Razormaw
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4357 && `patch` IN (0); -- Bloodfen Lashtail
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4363 && `patch` IN (0); -- Mirefin Oracle
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4376 && `patch` IN (0); -- Darkmist Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4377 && `patch` IN (0); -- Darkmist Lurker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4379 && `patch` IN (0); -- Darkmist Silkspinner
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4380 && `patch` IN (0); -- Darkmist Widow
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4388 && `patch` IN (0); -- Young Murk Thresher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4389 && `patch` IN (0); -- Murk Thresher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4390 && `patch` IN (0); -- Elder Murk Thresher
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4396 && `patch` IN (0); -- Mudrock Tortoise
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4397 && `patch` IN (0); -- Mudrock Spikeshell
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4398 && `patch` IN (0); -- Mudrock Burrower
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4399 && `patch` IN (0); -- Mudrock Borer
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=4400 && `patch` IN (0); -- Mudrock Snapjaw
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4412 && `patch` IN (0); -- Darkfang Creeper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4414 && `patch` IN (0); -- Darkfang Venomspitter
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4415 && `patch` IN (0); -- Giant Darkfang Spider
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4427 && `patch` IN (0); -- Ward Guardian
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4428 && `patch` IN (0); -- Death Speaker Jargba
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4438 && `patch` IN (0); -- Razorfen Spearhide
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4440 && `patch` IN (0); -- Razorfen Totemic
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4442 && `patch` IN (0); -- Razorfen Defender
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4505 && `patch` IN (0); -- Bloodsail Deckhand
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4506 && `patch` IN (0); -- Bloodsail Swabby
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4510 && `patch` IN (0); -- Heralath Fallowbrook
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4515 && `patch` IN (0); -- Death's Head Acolyte
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4516 && `patch` IN (0); -- Death's Head Adept
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4517 && `patch` IN (0); -- Death's Head Priest
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4519 && `patch` IN (0); -- Death's Head Seer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4522 && `patch` IN (0); -- Razorfen Dustweaver
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4523 && `patch` IN (0); -- Razorfen Groundshaker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4532 && `patch` IN (0); -- Razorfen Beastmaster
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4623 && `patch` IN (0); -- Quilguard Champion
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4624 && `patch` IN (0, 2, 10); -- Booty Bay Bruiser
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4685 && `patch` IN (0); -- Ley Hunter
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4690 && `patch` IN (0); -- Rabid Bonepaw
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4695 && `patch` IN (0); -- Carrion Horror
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4701 && `patch` IN (0); -- Dying Kodo
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4702 && `patch` IN (0); -- Ancient Kodo
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4798 && `patch` IN (0); -- Fallenroot Shadowstalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4799 && `patch` IN (0); -- Fallenroot Hellcaller
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4805 && `patch` IN (0); -- Blackfathom Sea Witch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4809 && `patch` IN (0); -- Twilight Acolyte
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4810 && `patch` IN (0); -- Twilight Reaver
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4811 && `patch` IN (0); -- Twilight Aquamancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4812 && `patch` IN (0); -- Twilight Loreseeker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4813 && `patch` IN (0); -- Twilight Shadowmage
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4814 && `patch` IN (0); -- Twilight Elementalist
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4819 && `patch` IN (0); -- Blindlight Muckdweller
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4820 && `patch` IN (0); -- Blindlight Oracle
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4831 && `patch` IN (0); -- Lady Sarevess
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4841 && `patch` IN (0); -- Deadmire
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4842 && `patch` IN (0); -- Earthcaller Halmgar
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4844 && `patch` IN (0); -- Shadowforge Surveyor
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4845 && `patch` IN (0); -- Shadowforge Ruffian
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4847 && `patch` IN (0); -- Shadowforge Relic Hunter
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4850 && `patch` IN (0); -- Stonevault Cave Lurker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=4852 && `patch` IN (0); -- Stonevault Oracle
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5056 && `patch` IN (0, 6); -- Deviate Dreadfang
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5185 && `patch` IN (0); -- Hammerhead Shark
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5307 && `patch` IN (0); -- Vale Screecher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5308 && `patch` IN (0); -- Rogue Vale Screecher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5426 && `patch` IN (0); -- Blisterpaw Hyena
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5428 && `patch` IN (0); -- Roc
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5429 && `patch` IN (0); -- Fire Roc
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5434 && `patch` IN (0); -- Coral Shark
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5546 && `patch` IN (0); -- Grunt Zuul
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5547 && `patch` IN (0); -- Grunt Tharlak
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5617 && `patch` IN (0); -- Wastewander Shadow Mage
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5646 && `patch` IN (0); -- Sandfury Axe Thrower
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5647 && `patch` IN (0); -- Sandfury Firecaller
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5694 && `patch` IN (0); -- High Sorcerer Andromath
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5755 && `patch` IN (0); -- Deviate Viper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5756 && `patch` IN (0, 6); -- Deviate Venomwing
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5766 && `patch` IN (0); -- Savannah Cub
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5769 && `patch` IN (0); -- Arch Druid Hamuul Runetotem
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=5809 && `patch` IN (0); -- Watch Commander Zalaphil
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5843 && `patch` IN (0); -- Slave Worker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5860 && `patch` IN (0); -- Twilight Dark Shaman
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5861 && `patch` IN (0); -- Twilight Fire Guard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5862 && `patch` IN (0); -- Twilight Geomancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5952 && `patch` IN (0); -- Den Grunt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5981 && `patch` IN (0); -- Portal Seeker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=5988 && `patch` IN (0, 5); -- Scorpok Stinger
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6013 && `patch` IN (0, 2); -- Wayward Buzzard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6035 && `patch` IN (0); -- Razorfen Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6123 && `patch` IN (0); -- Dark Iron Spy
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6126 && `patch` IN (0); -- Haldarr Trickster
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6167 && `patch` IN (0); -- Chimaera Matriarch
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6215 && `patch` IN (0); -- Chomper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6243 && `patch` IN (0); -- Gelihast
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=6352 && `patch` IN (0); -- Coralshell Lurker
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=6389 && `patch` IN (0); -- Deathguard Podrig
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6584 && `patch` IN (0); -- King Mosh
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6707 && `patch` IN (0); -- Fahrad
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6733 && `patch` IN (0); -- Stonevault Basher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6768 && `patch` IN (0); -- Lord Jorach Ravenholdt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6777 && `patch` IN (0); -- Zan Shivsproket
UPDATE `creature_template` SET `armor_multiplier`=0.35 WHERE `entry`=6789 && `patch` IN (0); -- Thistle Cub
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=6911 && `patch` IN (0); -- Minion of Sethir
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7051 && `patch` IN (0); -- Malformed Defias Drone
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7246 && `patch` IN (0); -- Sandfury Shadowhunter
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7269 && `patch` IN (0); -- Scarab
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7323 && `patch` IN (0); -- Winstone Wolfe
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7325 && `patch` IN (0); -- Master Kang
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7335 && `patch` IN (0); -- Death's Head Geomancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7337 && `patch` IN (0); -- Death's Head Necromancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7432 && `patch` IN (0); -- Frostsaber Stalker
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7434 && `patch` IN (0); -- Frostsaber Pride Watcher
UPDATE `creature_template` SET `armor_multiplier`=0.75 WHERE `entry`=7446 && `patch` IN (0); -- Rabid Shardtooth
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=7489 && `patch` IN (0); -- Silverpine Deathguard
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7856 && `patch` IN (0); -- Southsea Freebooter
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7872 && `patch` IN (0); -- Death's Head Cultist
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7874 && `patch` IN (0); -- Razorfen Thornweaver
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7939 && `patch` IN (0); -- Feathermoon Sentinel
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=7975 && `patch` IN (0); -- Mulgore Protector
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8095 && `patch` IN (0, 10); -- Sul'lithuz Sandcrawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8147 && `patch` IN (0); -- Camp Mojache Brave
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8155 && `patch` IN (0); -- Kargath Grunt
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8208 && `patch` IN (0); -- Murderous Blisterpaw
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8419 && `patch` IN (0); -- Twilight Idolater
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8444 && `patch` IN (0); -- Trade Master Kovic
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=8550 && `patch` IN (0); -- Shadowmage
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9077 && `patch` IN (0); -- Warlord Goretooth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9297 && `patch` IN (0); -- Enraged Wyvern
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9318 && `patch` IN (0); -- Incendosaur
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9460 && `patch` IN (0, 2, 10); -- Gadgetzan Bruiser
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9526 && `patch` IN (0); -- Enraged Gryphon
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9683 && `patch` IN (0); -- Lar'korwi Mate
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=9684 && `patch` IN (0); -- Lar'korwi
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10036 && `patch` IN (0); -- Brackenwall Enforcer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10717 && `patch` IN (0); -- Temporal Parasite
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10882 && `patch` IN (0); -- Arikara
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=10979 && `patch` IN (0); -- Scarlet Hound
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11034 && `patch` IN (0); -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11036 && `patch` IN (0); -- Leonid Barthalomew the Revered
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11079 && `patch` IN (0); -- Wynd Nightchaser
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11180 && `patch` IN (0); -- Bloodvenom Post Brave
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11190 && `patch` IN (0, 2, 10); -- Everlook Bruiser
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11318 && `patch` IN (0); -- Ragefire Trogg
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11322 && `patch` IN (0); -- Searing Blade Cultist
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11323 && `patch` IN (0); -- Searing Blade Enforcer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11324 && `patch` IN (0); -- Searing Blade Warlock
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11521 && `patch` IN (0); -- Kodo Apparition
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11564 && `patch` IN (0); -- Gizelton Caravan Kodo
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11683 && `patch` IN (0); -- Horde Shaman
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11804 && `patch` IN (0); -- Twilight Keeper Havunth
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11822 && `patch` IN (0, 7, 10); -- Moonglade Warden
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11876 && `patch` IN (0); -- Demon Spirit
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11881 && `patch` IN (0); -- Twilight Geolord
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11882 && `patch` IN (0); -- Twilight Stonecaller
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11883 && `patch` IN (0); -- Twilight Master
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11885 && `patch` IN (0); -- Blighthound
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11896 && `patch` IN (0); -- Borelgore
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11897 && `patch` IN (0); -- Duskwing
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11937 && `patch` IN (0); -- Demon Portal Guardian
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11956 && `patch` IN (0); -- Great Bear Spirit
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=11957 && `patch` IN (0); -- Great Cat Spirit
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12123 && `patch` IN (0); -- Reef Shark
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12338 && `patch` IN (0); -- Shadowprey Guardian
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=12347 && `patch` IN (0); -- Enraged Reef Crawler
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12425 && `patch` IN (0); -- Flint Shadowmore
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12902 && `patch` IN (0); -- Lorgus Jett
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=12920 && `patch` IN (0); -- Doctor Gregory Victor
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=13076 && `patch` IN (0); -- Dun Morogh Mountaineer
UPDATE `creature_template` SET `armor_multiplier`=1.5 WHERE `entry`=14123 && `patch` IN (0); -- Steeljaw Snapper
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14222 && `patch` IN (0); -- Araga
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14233 && `patch` IN (0); -- Ripscale
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14356 && `patch` IN (1); -- Sawfin Frenzy
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14394 && `patch` IN (1); -- Major Mattingly
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14442 && `patch` IN (2); -- Hunter Thunderhorn
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14721 && `patch` IN (3); -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14730 && `patch` IN (3); -- Revantusk Watcher
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14757 && `patch` IN (3); -- Elder Torntusk
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=14984 && `patch` IN (5); -- Sergeant Maclear
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15021 && `patch` IN (5); -- Deathmaster Dwire
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15022 && `patch` IN (5); -- Deathstalker Mortis
UPDATE `creature_template` SET `armor_multiplier`=1.2 WHERE `entry`=15138 && `patch` IN (5); -- Silverpine Elite
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15177 && `patch` IN (6); -- Cloud Skydancer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15180 && `patch` IN (6); -- Baristolth of the Shifting Sands
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15183 && `patch` IN (6); -- Geologist Larksbane
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15201 && `patch` IN (6); -- Twilight Flamereaver
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15213 && `patch` IN (6); -- Twilight Overlord
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15270 && `patch` IN (6); -- Huum Wildmane
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15282 && `patch` IN (6); -- Aurel Goldleaf
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15308 && `patch` IN (6); -- Twilight Prophet
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15350 && `patch` IN (6); -- Horde Warbringer
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15466 && `patch` IN (7); -- Minion of Omen
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=15722 && `patch` IN (7); -- Squire Leoren Mal'derath
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16117 && `patch` IN (8, 9); -- Plagued Swine
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=16506 && `patch` IN (9); -- Naxxramas Worshipper
UPDATE `creature_template` SET `armor_multiplier`=2 WHERE `entry`=16803 && `patch` IN (9); -- Deathknight Understudy
UPDATE `creature_template` SET `armor_multiplier`=1 WHERE `entry`=17804 && `patch` IN (10); -- Squire Rowe

-- fire resistance
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=521 && `fire_res`=80; -- Lupos
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=594 && `fire_res`=10; -- Defias Henchman
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=619 && `fire_res`=10; -- Defias Conjurer
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=628 && `fire_res`=4; -- Black Ravager
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1225 && `fire_res`=40; -- Ol' Sooty
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1258 && `fire_res`=5; -- Black Ravager Mastiff
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1706 && `fire_res`=10; -- Defias Prisoner
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1707 && `fire_res`=10; -- Defias Captive
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1708 && `fire_res`=10; -- Defias Inmate
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1711 && `fire_res`=10; -- Defias Convict
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1715 && `fire_res`=10; -- Defias Insurgent
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1725 && `fire_res`=10; -- Defias Watchman
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1726 && `fire_res`=10; -- Defias Magician
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1838 && `fire_res`=10; -- Scarlet Interrogator
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1839 && `fire_res`=15; -- Scarlet High Clerist
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1843 && `fire_res`=15; -- Foreman Jerris
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1846 && `fire_res`=5; -- High Protector Lorik
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=1854 && `fire_res`=10; -- High Priest Thel'danis
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=3936 && `fire_res`=10; -- Shandris Feathermoon
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4111 && `fire_res`=81; -- Gravelsnout Kobold
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4112 && `fire_res`=80; -- Gravelsnout Vermin
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4114 && `fire_res`=82; -- Gravelsnout Forager
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4396 && `fire_res`=74; -- Mudrock Tortoise
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4398 && `fire_res`=80; -- Mudrock Burrower
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4399 && `fire_res`=86; -- Mudrock Borer
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4400 && `fire_res`=84; -- Mudrock Snapjaw
UPDATE `creature_template` SET `fire_res`=90 WHERE `entry`=4676 && `fire_res`=0; -- Lesser Infernal
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=4787 && `fire_res`=30; -- Argent Guard Thaelrid
UPDATE `creature_template` SET `fire_res`=75 WHERE `entry`=6010 && `fire_res`=0; -- Felhound
UPDATE `creature_template` SET `fire_res`=45 WHERE `entry`=6073 && `fire_res`=0; -- Searing Infernal
UPDATE `creature_template` SET `fire_res`=54 WHERE `entry`=6498 && `fire_res`=53; -- Devilsaur
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=7325 && `fire_res`=10; -- Master Kang
UPDATE `creature_template` SET `fire_res`=100 WHERE `entry`=8302 && `fire_res`=0; -- Deatheye
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=8889 && `fire_res`=100; -- Anvilrage Overseer
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=8890 && `fire_res`=100; -- Anvilrage Warden
UPDATE `creature_template` SET `fire_res`=50 WHERE `entry`=9862 && `fire_res`=0; -- Jaedenar Legionnaire
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11034 && `fire_res`=30; -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11036 && `fire_res`=30; -- Leonid Barthalomew the Revered
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11079 && `fire_res`=10; -- Wynd Nightchaser
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11440 && `fire_res`=54; -- Gordok Enforcer
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11442 && `fire_res`=54; -- Gordok Mauler
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=11443 && `fire_res`=53; -- Gordok Ogre-Mage
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=12432 && `fire_res`=28; -- Old Vicejaw
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=14232 && `fire_res`=60; -- Dart
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=14721 && `fire_res`=10; -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=14984 && `fire_res`=10; -- Sergeant Maclear
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=15021 && `fire_res`=10; -- Deathmaster Dwire
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=15022 && `fire_res`=10; -- Deathstalker Mortis
UPDATE `creature_template` SET `fire_res`=0 WHERE `entry`=16506 && `fire_res`=5; -- Naxxramas Worshipper

-- nature resistance
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=521 && `nature_res`=80; -- Lupos
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=594 && `nature_res`=10; -- Defias Henchman
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=619 && `nature_res`=10; -- Defias Conjurer
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=628 && `nature_res`=7; -- Black Ravager
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1199 && `nature_res`=10; -- Juvenile Snow Leopard
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1201 && `nature_res`=10; -- Snow Leopard
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1258 && `nature_res`=8; -- Black Ravager Mastiff
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1509 && `nature_res`=1; -- Ragged Scavenger
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1706 && `nature_res`=10; -- Defias Prisoner
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1707 && `nature_res`=10; -- Defias Captive
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1708 && `nature_res`=10; -- Defias Inmate
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1711 && `nature_res`=10; -- Defias Convict
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1715 && `nature_res`=10; -- Defias Insurgent
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1725 && `nature_res`=10; -- Defias Watchman
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1726 && `nature_res`=10; -- Defias Magician
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1838 && `nature_res`=10; -- Scarlet Interrogator
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1839 && `nature_res`=15; -- Scarlet High Clerist
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1843 && `nature_res`=15; -- Foreman Jerris
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1846 && `nature_res`=5; -- High Protector Lorik
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=1854 && `nature_res`=10; -- High Priest Thel'danis
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2241 && `nature_res`=100; -- Syndicate Thief
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2252 && `nature_res`=35; -- Crushridge Ogre
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2253 && `nature_res`=36; -- Crushridge Brute
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2254 && `nature_res`=37; -- Crushridge Mauler
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2255 && `nature_res`=38; -- Crushridge Mage
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2256 && `nature_res`=39; -- Crushridge Enforcer
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2287 && `nature_res`=40; -- Crushridge Warmonger
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2416 && `nature_res`=37; -- Crushridge Plunderer
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2597 && `nature_res`=100; -- Lord Falconcrest
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=2605 && `nature_res`=40; -- Zalas Witherbark
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=3936 && `nature_res`=10; -- Shandris Feathermoon
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=5269 && `nature_res`=30; -- Atal'ai Priest
UPDATE `creature_template` SET `nature_res`=75 WHERE `entry`=6010 && `nature_res`=0; -- Felhound
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=7325 && `nature_res`=10; -- Master Kang
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11034 && `nature_res`=10; -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11079 && `nature_res`=10; -- Wynd Nightchaser
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11440 && `nature_res`=54; -- Gordok Enforcer
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11442 && `nature_res`=54; -- Gordok Mauler
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=11443 && `nature_res`=53; -- Gordok Ogre-Mage
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=14232 && `nature_res`=60; -- Dart
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=14721 && `nature_res`=10; -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=14984 && `nature_res`=10; -- Sergeant Maclear
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=15021 && `nature_res`=10; -- Deathmaster Dwire
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=15022 && `nature_res`=10; -- Deathstalker Mortis
UPDATE `creature_template` SET `nature_res`=0 WHERE `entry`=16506 && `nature_res`=5; -- Naxxramas Worshipper

-- frost resistance
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=521 && `frost_res`=80; -- Lupos
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=594 && `frost_res`=10; -- Defias Henchman
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=619 && `frost_res`=10; -- Defias Conjurer
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1035 && `frost_res`=25; -- Dragonmaw Swamprunner
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1225 && `frost_res`=40; -- Ol' Sooty
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1706 && `frost_res`=10; -- Defias Prisoner
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1707 && `frost_res`=10; -- Defias Captive
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1708 && `frost_res`=10; -- Defias Inmate
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1711 && `frost_res`=10; -- Defias Convict
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1715 && `frost_res`=10; -- Defias Insurgent
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1725 && `frost_res`=10; -- Defias Watchman
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1726 && `frost_res`=10; -- Defias Magician
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1838 && `frost_res`=10; -- Scarlet Interrogator
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1839 && `frost_res`=15; -- Scarlet High Clerist
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1843 && `frost_res`=15; -- Foreman Jerris
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1846 && `frost_res`=5; -- High Protector Lorik
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=1854 && `frost_res`=10; -- High Priest Thel'danis
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=3936 && `frost_res`=10; -- Shandris Feathermoon
UPDATE `creature_template` SET `frost_res`=75 WHERE `entry`=6010 && `frost_res`=0; -- Felhound
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=7325 && `frost_res`=10; -- Master Kang
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11034 && `frost_res`=10; -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11079 && `frost_res`=10; -- Wynd Nightchaser
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11440 && `frost_res`=54; -- Gordok Enforcer
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11442 && `frost_res`=54; -- Gordok Mauler
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=11443 && `frost_res`=53; -- Gordok Ogre-Mage
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=12432 && `frost_res`=28; -- Old Vicejaw
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=14232 && `frost_res`=60; -- Dart
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=14721 && `frost_res`=10; -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=14984 && `frost_res`=10; -- Sergeant Maclear
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=15021 && `frost_res`=10; -- Deathmaster Dwire
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=15022 && `frost_res`=10; -- Deathstalker Mortis
UPDATE `creature_template` SET `frost_res`=0 WHERE `entry`=16506 && `frost_res`=5; -- Naxxramas Worshipper

-- shadow resistance
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=119 && `shadow_res`=20; -- Longsnout
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=157 && `shadow_res`=40; -- Goretusk
UPDATE `creature_template` SET `shadow_res`=50 WHERE `entry`=434 && `shadow_res`=0; -- Rabid Shadowhide Gnoll
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=521 && `shadow_res`=80; -- Lupos
UPDATE `creature_template` SET `shadow_res`=50 WHERE `entry`=568 && `shadow_res`=0; -- Shadowhide Warrior
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=594 && `shadow_res`=10; -- Defias Henchman
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=619 && `shadow_res`=10; -- Defias Conjurer
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1035 && `shadow_res`=25; -- Dragonmaw Swamprunner
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1706 && `shadow_res`=10; -- Defias Prisoner
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1707 && `shadow_res`=10; -- Defias Captive
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1708 && `shadow_res`=10; -- Defias Inmate
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1711 && `shadow_res`=10; -- Defias Convict
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1715 && `shadow_res`=10; -- Defias Insurgent
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1725 && `shadow_res`=10; -- Defias Watchman
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1726 && `shadow_res`=10; -- Defias Magician
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1838 && `shadow_res`=10; -- Scarlet Interrogator
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1839 && `shadow_res`=15; -- Scarlet High Clerist
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1843 && `shadow_res`=15; -- Foreman Jerris
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1846 && `shadow_res`=5; -- High Protector Lorik
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=1854 && `shadow_res`=10; -- High Priest Thel'danis
UPDATE `creature_template` SET `shadow_res`=100 WHERE `entry`=2318 && `shadow_res`=50; -- Argus Shadow Mage
UPDATE `creature_template` SET `shadow_res`=250 WHERE `entry`=2647 && `shadow_res`=0; -- Vilebranch Soul Eater
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=3936 && `shadow_res`=10; -- Shandris Feathermoon
UPDATE `creature_template` SET `shadow_res`=90 WHERE `entry`=4679 && `shadow_res`=0; -- Nether Maiden
UPDATE `creature_template` SET `shadow_res`=105 WHERE `entry`=5617 && `shadow_res`=50; -- Wastewander Shadow Mage
UPDATE `creature_template` SET `shadow_res`=75 WHERE `entry`=6010 && `shadow_res`=0; -- Felhound
UPDATE `creature_template` SET `shadow_res`=45 WHERE `entry`=6073 && `shadow_res`=0; -- Searing Infernal
UPDATE `creature_template` SET `shadow_res`=76 WHERE `entry`=7135 && `shadow_res`=0; -- Infernal Bodyguard
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=7325 && `shadow_res`=10; -- Master Kang
UPDATE `creature_template` SET `shadow_res`=90 WHERE `entry`=8550 && `shadow_res`=0; -- Shadowmage
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=8889 && `shadow_res`=20; -- Anvilrage Overseer
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=8890 && `shadow_res`=20; -- Anvilrage Warden
UPDATE `creature_template` SET `shadow_res`=50 WHERE `entry`=9862 && `shadow_res`=0; -- Jaedenar Legionnaire
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11034 && `shadow_res`=10; -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11079 && `shadow_res`=10; -- Wynd Nightchaser
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11440 && `shadow_res`=54; -- Gordok Enforcer
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11442 && `shadow_res`=54; -- Gordok Mauler
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=11443 && `shadow_res`=53; -- Gordok Ogre-Mage
UPDATE `creature_template` SET `shadow_res`=45 WHERE `entry`=11697 && `shadow_res`=0; -- Mannoroc Lasher
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=14232 && `shadow_res`=60; -- Dart
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=14721 && `shadow_res`=10; -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=14984 && `shadow_res`=10; -- Sergeant Maclear
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=15021 && `shadow_res`=10; -- Deathmaster Dwire
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=15022 && `shadow_res`=10; -- Deathstalker Mortis
UPDATE `creature_template` SET `shadow_res`=0 WHERE `entry`=16506 && `shadow_res`=5; -- Naxxramas Worshipper

-- arcane resistance
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=157 && `arcane_res`=10; -- Goretusk
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=334 && `arcane_res`=100; -- Gath'Ilzogg
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=521 && `arcane_res`=80; -- Lupos
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=594 && `arcane_res`=10; -- Defias Henchman
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=619 && `arcane_res`=10; -- Defias Conjurer
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=628 && `arcane_res`=1; -- Black Ravager
UPDATE `creature_template` SET `arcane_res`=75 WHERE `entry`=819 && `arcane_res`=0; -- Servant of Ilgalar
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1035 && `arcane_res`=25; -- Dragonmaw Swamprunner
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1051 && `arcane_res`=100; -- Dark Iron Dwarf
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1052 && `arcane_res`=100; -- Dark Iron Saboteur
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1053 && `arcane_res`=100; -- Dark Iron Tunneler
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1054 && `arcane_res`=100; -- Dark Iron Demolitionist
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1169 && `arcane_res`=100; -- Dark Iron Insurgent
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1222 && `arcane_res`=100; -- Dark Iron Sapper
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1225 && `arcane_res`=40; -- Ol' Sooty
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1258 && `arcane_res`=2; -- Black Ravager Mastiff
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1706 && `arcane_res`=10; -- Defias Prisoner
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1707 && `arcane_res`=10; -- Defias Captive
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1708 && `arcane_res`=10; -- Defias Inmate
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1711 && `arcane_res`=10; -- Defias Convict
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1715 && `arcane_res`=10; -- Defias Insurgent
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1725 && `arcane_res`=10; -- Defias Watchman
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1726 && `arcane_res`=10; -- Defias Magician
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1838 && `arcane_res`=10; -- Scarlet Interrogator
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1839 && `arcane_res`=15; -- Scarlet High Clerist
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1843 && `arcane_res`=15; -- Foreman Jerris
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1846 && `arcane_res`=5; -- High Protector Lorik
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=1854 && `arcane_res`=10; -- High Priest Thel'danis
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2038 && `arcane_res`=32; -- Lord Melenas
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2405 && `arcane_res`=10; -- Tarren Mill Deathguard
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2418 && `arcane_res`=10; -- Deathguard Samsa
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2419 && `arcane_res`=10; -- Deathguard Humbert
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2575 && `arcane_res`=100; -- Dark Iron Supplier
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=2577 && `arcane_res`=100; -- Dark Iron Shadowcaster
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=3662 && `arcane_res`=68; -- Delmanis the Hated
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=3773 && `arcane_res`=104; -- Akkrilus
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=3936 && `arcane_res`=10; -- Shandris Feathermoon
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4062 && `arcane_res`=100; -- Dark Iron Bombardier
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4064 && `arcane_res`=100; -- Blackrock Scout
UPDATE `creature_template` SET `arcane_res`=45 WHERE `entry`=4515 && `arcane_res`=0; -- Death's Head Acolyte
UPDATE `creature_template` SET `arcane_res`=45 WHERE `entry`=4516 && `arcane_res`=0; -- Death's Head Adept
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4619 && `arcane_res`=128; -- Geltharis
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=4787 && `arcane_res`=70; -- Argent Guard Thaelrid
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5269 && `arcane_res`=70; -- Atal'ai Priest
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5760 && `arcane_res`=160; -- Lord Azrethoc
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5839 && `arcane_res`=100; -- Dark Iron Geologist
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5840 && `arcane_res`=100; -- Dark Iron Steamsmith
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5844 && `arcane_res`=100; -- Dark Iron Slaver
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=5846 && `arcane_res`=100; -- Dark Iron Taskmaster
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6123 && `arcane_res`=100; -- Dark Iron Spy
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6200 && `arcane_res`=204; -- Legashi Satyr
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6201 && `arcane_res`=209; -- Legashi Rogue
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6202 && `arcane_res`=214; -- Legashi Hellcaller
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6389 && `arcane_res`=10; -- Deathguard Podrig
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=6523 && `arcane_res`=100; -- Dark Iron Rifleman
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7106 && `arcane_res`=200; -- Jadefire Rogue
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7107 && `arcane_res`=204; -- Jadefire Trickster
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7108 && `arcane_res`=208; -- Jadefire Betrayer
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7109 && `arcane_res`=200; -- Jadefire Felsworn
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7110 && `arcane_res`=205; -- Jadefire Shadowstalker
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7111 && `arcane_res`=212; -- Jadefire Hellcaller
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7325 && `arcane_res`=10; -- Master Kang
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=7489 && `arcane_res`=10; -- Silverpine Deathguard
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8504 && `arcane_res`=100; -- Dark Iron Sentry
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8566 && `arcane_res`=100; -- Dark Iron Lookout
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=8637 && `arcane_res`=100; -- Dark Iron Watchman
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11034 && `arcane_res`=70; -- Lord Maxwell Tyrosus
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11036 && `arcane_res`=70; -- Leonid Barthalomew the Revered
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11079 && `arcane_res`=10; -- Wynd Nightchaser
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11440 && `arcane_res`=54; -- Gordok Enforcer
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11442 && `arcane_res`=54; -- Gordok Mauler
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11443 && `arcane_res`=53; -- Gordok Ogre-Mage
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=11876 && `arcane_res`=148; -- Demon Spirit
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=12432 && `arcane_res`=28; -- Old Vicejaw
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=14232 && `arcane_res`=60; -- Dart
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=14721 && `arcane_res`=10; -- Field Marshal Afrasiabi
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=14984 && `arcane_res`=10; -- Sergeant Maclear
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=15021 && `arcane_res`=10; -- Deathmaster Dwire
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=15022 && `arcane_res`=10; -- Deathstalker Mortis
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=15692 && `arcane_res`=100; -- Dark Iron Kidnapper
UPDATE `creature_template` SET `arcane_res`=0 WHERE `entry`=16506 && `arcane_res`=5; -- Naxxramas Worshipper


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
