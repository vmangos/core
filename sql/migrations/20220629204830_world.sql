DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220629204830');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220629204830');
-- Add your query below.


-- These mobs don't have an attack speed set so use default.
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `base_attack_time`=0;

-- Correct attack speeds for all creatures.
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=460 && `base_attack_time`=1960; -- Alamar Grimm
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=659 && `base_attack_time`=1510; -- El Pollo Grande
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=706 && `base_attack_time`=1970; -- Frostmane Troll Whelp
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=714 && `base_attack_time`=1960; -- Talin Keeneye
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=763 && `base_attack_time`=1325; -- Lost One Chieftain
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=786 && `base_attack_time`=1960; -- Grelin Whitebeard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=808 && `base_attack_time`=1960; -- Grik'nir the Cold
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=818 && `base_attack_time`=1258; -- Mai'Zoth
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=836 && `base_attack_time`=1960; -- Durnan Furcutter
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=837 && `base_attack_time`=1960; -- Branstock Khalder
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=944 && `base_attack_time`=1960; -- Marryk Nurribit
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=1037 && `base_attack_time`=1400; -- Dragonmaw Battlemaster
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1047 && `base_attack_time`=1175; -- Red Scalebane
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1048 && `base_attack_time`=1166; -- Scalebane Lieutenant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1049 && `base_attack_time`=1141; -- Wyrmkin Firebrand
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1050 && `base_attack_time`=1158; -- Scalebane Royal Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1054 && `base_attack_time`=1341; -- Dark Iron Demolitionist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1063 && `base_attack_time`=1258; -- Jade
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1133 && `base_attack_time`=1900; -- Starving Winter Wolf
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1210 && `base_attack_time`=1466; -- Chok'sul
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=1260 && `base_attack_time`=1516; -- Great Father Arctikus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1266 && `base_attack_time`=1810; -- Tundra MacGrann
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=1354 && `base_attack_time`=1980; -- Apprentice Soren
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1364 && `base_attack_time`=1341; -- Balgaras the Foul
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1398 && `base_attack_time`=1441; -- Boss Galgosh
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1399 && `base_attack_time`=1466; -- Magosh
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1514 && `base_attack_time`=1570; -- Mokk the Savage
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1552 && `base_attack_time`=1275; -- Scale Belly
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1700 && `base_attack_time`=1910; -- Paxton Ganter
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=1836 && `base_attack_time`=1166; -- Scarlet Cavalier
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1837 && `base_attack_time`=1150; -- Scarlet Judge
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1838 && `base_attack_time`=1141; -- Scarlet Interrogator
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1839 && `base_attack_time`=1133; -- Scarlet High Clerist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1840 && `base_attack_time`=1133; -- Grand Inquisitor Isillien
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1841 && `base_attack_time`=1150; -- Scarlet Executioner
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1847 && `base_attack_time`=1183; -- Foulmane
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1850 && `base_attack_time`=1166; -- Putridius
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1885 && `base_attack_time`=1158; -- Scarlet Smith
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1920 && `base_attack_time`=1466; -- Dalaran Spellscribe
UPDATE `creature_template` SET `base_attack_time`=3200 WHERE `entry`=1944 && `base_attack_time`=1466; -- Rot Hide Bruiser
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=1960 && `base_attack_time`=1840; -- Pilot Hammerfoot
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2044 && `base_attack_time`=1760; -- Forlorn Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2108 && `base_attack_time`=1408; -- Garneg Charskull
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2149 && `base_attack_time`=1810; -- Dark Iron Raider
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2158 && `base_attack_time`=1790; -- Gravelflint Scout
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2159 && `base_attack_time`=1800; -- Gravelflint Bonesnapper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2160 && `base_attack_time`=1760; -- Gravelflint Geomancer
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=2166 && `base_attack_time`=1575; -- Oakenscowl
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=2173 && `base_attack_time`=800; -- Reef Frenzy
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2192 && `base_attack_time`=1450; -- Firecaller Radison
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2257 && `base_attack_time`=1258; -- Mug'thol
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2258 && `base_attack_time`=1341; -- Stone Fury
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2283 && `base_attack_time`=1441; -- Ravenclaw Regent
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2287 && `base_attack_time`=1341; -- Crushridge Warmonger
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2304 && `base_attack_time`=1350; -- Captain Ironhill
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2416 && `base_attack_time`=1341; -- Crushridge Plunderer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2417 && `base_attack_time`=1341; -- Grel'borg the Miser
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2420 && `base_attack_time`=1258; -- Targ
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2452 && `base_attack_time`=1358; -- Skhowl
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2453 && `base_attack_time`=1333; -- Lo'Grosh
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2476 && `base_attack_time`=1475; -- Large Loch Crocolisk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2477 && `base_attack_time`=1466; -- Gradok
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2478 && `base_attack_time`=1466; -- Haren Swifthoof
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=2540 && `base_attack_time`=1860; -- Dalaran Serpent
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2584 && `base_attack_time`=1341; -- Stromgarde Defender
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2588 && `base_attack_time`=1341; -- Syndicate Prowler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2601 && `base_attack_time`=1266; -- Foulbelly
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=2604 && `base_attack_time`=1350; -- Molok the Crusher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2605 && `base_attack_time`=1325; -- Zalas Witherbark
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2606 && `base_attack_time`=1341; -- Nimar the Slayer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2607 && `base_attack_time`=1266; -- Prince Galen Trollbane
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=2638 && `base_attack_time`=1660; -- Syndicate Spectre
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2641 && `base_attack_time`=1258; -- Vilebranch Headhunter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2642 && `base_attack_time`=1250; -- Vilebranch Shadowcaster
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2643 && `base_attack_time`=1258; -- Vilebranch Berserker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2648 && `base_attack_time`=1183; -- Vilebranch Aman'zasi Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2683 && `base_attack_time`=1770; -- Namdo Bizzfizzle
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2707 && `base_attack_time`=1191; -- Shadra
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2726 && `base_attack_time`=1300; -- Scorched Guardian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2744 && `base_attack_time`=1316; -- Shadowforge Commander
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=2748 && `base_attack_time`=1500; -- Archaedas
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2749 && `base_attack_time`=1316; -- Siege Golem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2751 && `base_attack_time`=1350; -- War Golem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2752 && `base_attack_time`=1275; -- Rumbler
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=2754 && `base_attack_time`=1266; -- Anathemus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2755 && `base_attack_time`=1216; -- Myzrael
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2757 && `base_attack_time`=1216; -- Blacklash
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2759 && `base_attack_time`=1241; -- Hematus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2763 && `base_attack_time`=1258; -- Thenan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2776 && `base_attack_time`=1610; -- Vengeful Surge
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2780 && `base_attack_time`=1258; -- Caretaker Nevlin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2781 && `base_attack_time`=1258; -- Caretaker Weston
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2782 && `base_attack_time`=1258; -- Caretaker Alaric
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2783 && `base_attack_time`=1341; -- Marez Cowl
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2794 && `base_attack_time`=1341; -- Summoned Guardian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2887 && `base_attack_time`=1610; -- Prismatic Exile
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2892 && `base_attack_time`=1341; -- Stonevault Seer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2915 && `base_attack_time`=1610; -- Hammertoe's Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2932 && `base_attack_time`=1358; -- Magregan Deepshadow
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=2946 && `base_attack_time`=1590; -- Puppet of Helcular
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3094 && `base_attack_time`=1420; -- Unseen
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3253 && `base_attack_time`=1450; -- Silithid Harvester
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3289 && `base_attack_time`=1900; -- Spirit of Minshina
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3535 && `base_attack_time`=1550; -- Blackmoss the Fetid
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3569 && `base_attack_time`=1960; -- Bogling
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3582 && `base_attack_time`=1510; -- Aman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3694 && `base_attack_time`=1810; -- Sentinel Selarin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3722 && `base_attack_time`=1760; -- Mystlash Flayer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3735 && `base_attack_time`=1450; -- Apothecary Falthis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3773 && `base_attack_time`=1425; -- Akkrilus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3836 && `base_attack_time`=1570; -- Mountaineer Pebblebitty
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3843 && `base_attack_time`=1870; -- Anaya
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3872 && `base_attack_time`=1450; -- Deathsworn Captain
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3879 && `base_attack_time`=1760; -- Dark Strand Assassin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3893 && `base_attack_time`=1750; -- Forsaken Scout
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3898 && `base_attack_time`=1740; -- Aligar the Tormentor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3899 && `base_attack_time`=1740; -- Balizar the Umbrage
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3900 && `base_attack_time`=1710; -- Caedakar the Vicious
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3904 && `base_attack_time`=1550; -- Searing Totem IV
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3913 && `base_attack_time`=1630; -- Stoneclaw Totem IV
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=3968 && `base_attack_time`=1590; -- Sentry Totem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4015 && `base_attack_time`=1450; -- Pridewing Patriarch
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4056 && `base_attack_time`=1425; -- Mirkfallon Keeper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4132 && `base_attack_time`=1350; -- Silithid Ravager
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4339 && `base_attack_time`=1275; -- Brimgore
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4364 && `base_attack_time`=1150; -- Strashaz Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4366 && `base_attack_time`=1150; -- Strashaz Serpent Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4368 && `base_attack_time`=1141; -- Strashaz Myrmidon
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4370 && `base_attack_time`=1141; -- Strashaz Sorceress
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4371 && `base_attack_time`=1158; -- Strashaz Siren
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4374 && `base_attack_time`=1141; -- Strashaz Hydra
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4468 && `base_attack_time`=1258; -- Jade Sludge
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4660 && `base_attack_time`=1620; -- Maraudine Bonepaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4785 && `base_attack_time`=1720; -- Illusionary Nightmare
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4842 && `base_attack_time`=1341; -- Earthcaller Halmgar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4847 && `base_attack_time`=1341; -- Shadowforge Relic Hunter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4848 && `base_attack_time`=1258; -- Shadowforge Darkcaster
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4849 && `base_attack_time`=1258; -- Shadowforge Archaeologist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4853 && `base_attack_time`=1258; -- Stonevault Geomancer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4854 && `base_attack_time`=1275; -- Grimlok
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4855 && `base_attack_time`=1258; -- Stonevault Brawler
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=4857 && `base_attack_time`=1258; -- Stone Keeper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4860 && `base_attack_time`=1258; -- Stone Steward
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4958 && `base_attack_time`=1800; -- Haunting Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4971 && `base_attack_time`=1670; -- Slim's Friend
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=4977 && `base_attack_time`=1760; -- Murkshallow Softshell
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5044 && `base_attack_time`=1630; -- Theramore Skirmisher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5045 && `base_attack_time`=1650; -- Private Hallan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5046 && `base_attack_time`=1620; -- Lieutenant Caldwell
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5345 && `base_attack_time`=1275; -- Diamond Head
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5346 && `base_attack_time`=1250; -- Bloodroar the Stalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5347 && `base_attack_time`=1250; -- Antilus the Soarer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5350 && `base_attack_time`=1258; -- Qirot
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5354 && `base_attack_time`=1283; -- Gnarl Leafbrother
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=5357 && `base_attack_time`=1258; -- Land Walker
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=5358 && `base_attack_time`=1266; -- Cliff Giant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5399 && `base_attack_time`=1250; -- Veyzhak the Cannibal
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=5402 && `base_attack_time`=1258; -- Khan Hratha
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=5409 && `base_attack_time`=1770; -- Harvester Swarm
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=5466 && `base_attack_time`=1258; -- Coast Strider
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5781 && `base_attack_time`=1800; -- Silithid Creeper Egg
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5785 && `base_attack_time`=1550; -- Sister Hatelash
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5808 && `base_attack_time`=1575; -- Warlord Kolkanis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5809 && `base_attack_time`=2500; -- Watch Commander Zalaphil
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5833 && `base_attack_time`=1266; -- Margol the Rager
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5851 && `base_attack_time`=1425; -- Captain Gerogg Hammertoe
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5864 && `base_attack_time`=1450; -- Swinegart Spearhide
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5893 && `base_attack_time`=1890; -- Minor Manifestation of Fire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5912 && `base_attack_time`=1483; -- Deviate Faerie Dragon
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=5950 && `base_attack_time`=1730; -- Flametongue Totem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6012 && `base_attack_time`=1550; -- Flametongue Totem II
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6047 && `base_attack_time`=1760; -- Aqua Guardian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6069 && `base_attack_time`=1610; -- Maraudine Khan Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6070 && `base_attack_time`=1620; -- Maraudine Khan Advisor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6113 && `base_attack_time`=1860; -- Vejrek
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6134 && `base_attack_time`=1175; -- Lord Arkkoroc
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6140 && `base_attack_time`=1216; -- Hetaera
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=6144 && `base_attack_time`=1183; -- Son of Arkkoroc
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6180 && `base_attack_time`=1810; -- Defias Raider
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6209 && `base_attack_time`=1383; -- Caverndeep Looter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6215 && `base_attack_time`=1400; -- Chomper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6221 && `base_attack_time`=1760; -- Addled Leper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6228 && `base_attack_time`=1358; -- Dark Iron Ambassador
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6231 && `base_attack_time`=1425; -- Techbot
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=6376 && `base_attack_time`=1960; -- Wren Darkspring
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6386 && `base_attack_time`=1550; -- Ward of Zanzil
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6388 && `base_attack_time`=1560; -- Zanzil Skeleton
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6489 && `base_attack_time`=1350; -- Ironspine
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6549 && `base_attack_time`=1341; -- Demon of the Orb
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6577 && `base_attack_time`=1850; -- Bingles Blastenheimer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6581 && `base_attack_time`=1233; -- Ravasaur Matriarch
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6583 && `base_attack_time`=1175; -- Gruff
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6646 && `base_attack_time`=1191; -- Monnos the Elder
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6647 && `base_attack_time`=1183; -- Magister Hawkhelm
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6648 && `base_attack_time`=1233; -- Antilos
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6652 && `base_attack_time`=1183; -- Master Feardred
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6729 && `base_attack_time`=1740; -- Morridune
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6733 && `base_attack_time`=1341; -- Stonevault Basher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6886 && `base_attack_time`=1890; -- Onin MacHammar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6911 && `base_attack_time`=1890; -- Minion of Sethir
UPDATE `creature_template` SET `base_attack_time`=1300 WHERE `entry`=6913 && `base_attack_time`=1760; -- Lost One Rift Traveler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=6932 && `base_attack_time`=1610; -- Swamp Spirit
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=7011 && `base_attack_time`=1510; -- Earthen Rocksmasher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7012 && `base_attack_time`=1510; -- Earthen Sculptor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7023 && `base_attack_time`=1258; -- Obsidian Sentinel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7030 && `base_attack_time`=1266; -- Shadowforge Geologist
UPDATE `creature_template` SET `base_attack_time`=2300 WHERE `entry`=7076 && `base_attack_time`=1520; -- Earthen Guardian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7077 && `base_attack_time`=1510; -- Earthen Hallshaper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7091 && `base_attack_time`=1258; -- Shadowforge Ambusher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7167 && `base_attack_time`=1830; -- Polly
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7168 && `base_attack_time`=1830; --  Polly
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7170 && `base_attack_time`=1466; -- Thragomm
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7172 && `base_attack_time`=1410; -- Lore Keeper of Norgannon
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=7206 && `base_attack_time`=1258; -- Ancient Stone Keeper
UPDATE `creature_template` SET `base_attack_time`=1300 WHERE `entry`=7209 && `base_attack_time`=1660; -- Obsidian Shard
UPDATE `creature_template` SET `base_attack_time`=4000 WHERE `entry`=7226 && `base_attack_time`=1570; -- Sand Storm
UPDATE `creature_template` SET `base_attack_time`=2900 WHERE `entry`=7228 && `base_attack_time`=1550; -- Ironaya
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7266 && `base_attack_time`=1690; -- Ember
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7267 && `base_attack_time`=1258; -- Chief Ukorz Sandscalp
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7273 && `base_attack_time`=1275; -- Gahz'rilla
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7275 && `base_attack_time`=1266; -- Shadowpriest Sezz'ziz
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7276 && `base_attack_time`=1258; -- Zul'Farrak Dead Hero
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7286 && `base_attack_time`=1258; -- Zul'Farrak Zombie
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7290 && `base_attack_time`=1258; -- Shadowforge Sharpshooter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7291 && `base_attack_time`=1000; -- Galgann Firehammer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7309 && `base_attack_time`=1510; -- Earthen Custodian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7320 && `base_attack_time`=1258; -- Stonevault Mauler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7321 && `base_attack_time`=1258; -- Stonevault Flameweaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7340 && `base_attack_time`=1590; -- Skeletal Shadowcaster
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7349 && `base_attack_time`=1650; -- Tomb Fiend
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7351 && `base_attack_time`=1358; -- Tomb Reaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7354 && `base_attack_time`=1200; -- Ragglesnout
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7355 && `base_attack_time`=1325; -- Tuten'kash
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7356 && `base_attack_time`=1316; -- Plaguemaw the Rotting
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7361 && `base_attack_time`=1341; -- Grubbis
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=7396 && `base_attack_time`=1510; -- Earthen Stonebreaker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7397 && `base_attack_time`=1510; -- Earthen Stonecarver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7411 && `base_attack_time`=1890; -- Spirit of Sathrah
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7424 && `base_attack_time`=1450; -- Fire Resistance Totem II
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7468 && `base_attack_time`=1440; -- Nature Resistance Totem II
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7664 && `base_attack_time`=1150; -- Razelikh the Defiler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7734 && `base_attack_time`=1158; -- Ilifar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7735 && `base_attack_time`=1166; -- Felcular
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7738 && `base_attack_time`=1710; -- Burning Servant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7750 && `base_attack_time`=1460; -- Corporal Thund Splithoof
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=7768 && `base_attack_time`=1760; -- Witherbark Bloodling
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7779 && `base_attack_time`=1760; -- Priestess Tyriona
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7785 && `base_attack_time`=1550; -- Ward of Zum'rah
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7786 && `base_attack_time`=1660; -- Skeleton of Zum'rah
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7787 && `base_attack_time`=1580; -- Sandfury Slave
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7788 && `base_attack_time`=1560; -- Sandfury Drudge
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7789 && `base_attack_time`=1258; -- Sandfury Cretin
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=7796 && `base_attack_time`=1258; -- Nekrum Gutchewer
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=7797 && `base_attack_time`=1258; -- Ruuzlu
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7805 && `base_attack_time`=1510; -- Wastewander Scofflaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7808 && `base_attack_time`=1510; -- Marauding Owlbeast
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=7895 && `base_attack_time`=1350; -- Ambassador Bloodrage
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7899 && `base_attack_time`=1520; -- Treasure Hunting Pirate
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7901 && `base_attack_time`=1520; -- Treasure Hunting Swashbuckler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7902 && `base_attack_time`=1510; -- Treasure Hunting Buccaneer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7915 && `base_attack_time`=1710; -- Walking Bomb
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=7995 && `base_attack_time`=1183; -- Vile Priestess Hexx
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8035 && `base_attack_time`=1690; -- Dark Iron Land Mine
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8075 && `base_attack_time`=1241; -- Edana Hatetalon
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8156 && `base_attack_time`=1283; -- Servant of Antu'sul
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8179 && `base_attack_time`=1560; -- Greater Healing Ward
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=8201 && `base_attack_time`=1233; -- Omgorn the Lost
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8202 && `base_attack_time`=1250; -- Cyclok the Mad
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8203 && `base_attack_time`=1258; -- Kregg Keelhaul
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8205 && `base_attack_time`=1233; -- Haarka the Ravenous
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8207 && `base_attack_time`=1266; -- Greater Firebird
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8208 && `base_attack_time`=1291; -- Murderous Blisterpaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8212 && `base_attack_time`=1241; -- The Reak
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8214 && `base_attack_time`=1216; -- Jalinde Summerdrake
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8217 && `base_attack_time`=1183; -- Mith'rethis the Enchanter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8218 && `base_attack_time`=1275; -- Witherheart the Stalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8280 && `base_attack_time`=1258; -- Shleipnarr
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8283 && `base_attack_time`=1233; -- Slave Master Blackheart
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8296 && `base_attack_time`=1250; -- Mojo the Twisted
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8298 && `base_attack_time`=1191; -- Akubar the Seer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8302 && `base_attack_time`=1241; -- Deatheye
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8303 && `base_attack_time`=1233; -- Grunter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8320 && `base_attack_time`=1730; -- Sprok
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8324 && `base_attack_time`=1550; -- Atal'ai Skeleton
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8421 && `base_attack_time`=1510; -- Dorius
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8480 && `base_attack_time`=1216; -- Kalaran the Deceiver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8503 && `base_attack_time`=1550; -- Gibblewilt
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8510 && `base_attack_time`=1510; -- Atal'ai Totem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8578 && `base_attack_time`=1420; -- Magus Rimtori
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8581 && `base_attack_time`=1500; -- Blood Elf Defender
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8585 && `base_attack_time`=1600; -- Frost Spectre
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8608 && `base_attack_time`=1490; -- Angered Infernal
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8616 && `base_attack_time`=1460; -- Infernal Servant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8656 && `base_attack_time`=1490; -- Hukku's Voidwalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8657 && `base_attack_time`=1490; -- Hukku's Succubus
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8658 && `base_attack_time`=1490; -- Hukku's Imp
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8660 && `base_attack_time`=1250; -- The Evalcharr
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8756 && `base_attack_time`=1258; -- Raytaf
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8757 && `base_attack_time`=1258; -- Shahiar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8758 && `base_attack_time`=1258; -- Zaman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8876 && `base_attack_time`=1570; -- Sandfury Acolyte
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=8877 && `base_attack_time`=1560; -- Sandfury Zealot
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=8889 && `base_attack_time`=1333; -- Anvilrage Overseer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8923 && `base_attack_time`=1183; -- Panzor the Invincible
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=8976 && `base_attack_time`=1150; -- Hematos
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=8981 && `base_attack_time`=1183; -- Malfunctioning Reaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9136 && `base_attack_time`=1450; -- Sha'ni Proudtusk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9237 && `base_attack_time`=1333; -- War Master Voone
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9436 && `base_attack_time`=1520; -- Spawn of Bael'Gar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9441 && `base_attack_time`=1183; -- Dark Keeper Zimrel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9443 && `base_attack_time`=1175; -- Dark Keeper Pelver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9448 && `base_attack_time`=1183; -- Scarlet Praetorian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9450 && `base_attack_time`=1183; -- Scarlet Curate
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9451 && `base_attack_time`=1183; -- Scarlet Archmage
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9461 && `base_attack_time`=1216; -- Frenzied Black Drake
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9462 && `base_attack_time`=2500; -- Chieftain Bloodmaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9520 && `base_attack_time`=1200; -- Grark Lorkrub
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9521 && `base_attack_time`=1216; -- Enraged Felbat
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9527 && `base_attack_time`=1460; -- Enraged Hippogryph
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9538 && `base_attack_time`=1410; -- High Executioner Nuzrak
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9539 && `base_attack_time`=1430; -- Shadow of Lexlort
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9598 && `base_attack_time`=1460; -- Arei
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9601 && `base_attack_time`=1420; -- Treant Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9602 && `base_attack_time`=1183; -- Hahk'Zor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9604 && `base_attack_time`=1200; -- Gorgon'och
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9621 && `base_attack_time`=1450; -- Gargantuan Ooze
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9688 && `base_attack_time`=1560; -- Windwall Totem II
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9718 && `base_attack_time`=1166; -- Ghok Bashguud
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=9876 && `base_attack_time`=1530; -- Locheed
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10040 && `base_attack_time`=1460; -- Gorishi Hive Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10041 && `base_attack_time`=1450; -- Gorishi Hive Queen
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10078 && `base_attack_time`=1183; -- Terrorspark
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=10120 && `base_attack_time`=1258; -- Vault Warder
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10196 && `base_attack_time`=1175; -- General Colbatann
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10197 && `base_attack_time`=1183; -- Mezzir the Howler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10198 && `base_attack_time`=1150; -- Kashoch the Reaver
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=10199 && `base_attack_time`=1158; -- Grizzle Snowpaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10202 && `base_attack_time`=1158; -- Azurous
UPDATE `creature_template` SET `base_attack_time`=1400 WHERE `entry`=10261 && `base_attack_time`=1470; -- Burning Felhound
UPDATE `creature_template` SET `base_attack_time`=2300 WHERE `entry`=10263 && `base_attack_time`=1175; -- Burning Felguard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10264 && `base_attack_time`=2600; -- Solakar Flamewreath
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10290 && `base_attack_time`=1710; -- Captured Felwood Ooze
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10373 && `base_attack_time`=1810; -- Xabraxxis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10559 && `base_attack_time`=1450; -- Lady Vespia
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10641 && `base_attack_time`=1441; -- Branch Snapper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10642 && `base_attack_time`=1425; -- Eck'alom
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10647 && `base_attack_time`=1350; -- Prince Raze
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10680 && `base_attack_time`=2600; -- Summoned Blackhand Dreadweaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10776 && `base_attack_time`=1175; -- Finkle Einhorn
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10800 && `base_attack_time`=1410; -- Warosh the Redeemed
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=10802 && `base_attack_time`=1183; -- Hitah'ya the Keeper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10809 && `base_attack_time`=1166; -- Stonespine
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10821 && `base_attack_time`=1175; -- Hed'mush the Rotting
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10822 && `base_attack_time`=1166; -- Warlord Thresh'jin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10823 && `base_attack_time`=1158; -- Zul'Brin Warpbranch
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10825 && `base_attack_time`=1183; -- Gish the Unmoving
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10826 && `base_attack_time`=1175; -- Lord Darkscythe
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10827 && `base_attack_time`=1183; -- Deathspeaker Selendre
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10828 && `base_attack_time`=1158; -- High General Abbendis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10947 && `base_attack_time`=1440; -- Darrowshire Betrayer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10948 && `base_attack_time`=1440; -- Darrowshire Defender
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10951 && `base_attack_time`=1450; -- Marauding Corpse
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10952 && `base_attack_time`=1450; -- Marauding Skeleton
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10954 && `base_attack_time`=1200; -- Bloodletter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=10955 && `base_attack_time`=1460; -- Summoned Water Elemental
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11018 && `base_attack_time`=1530; -- Arko'narin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11027 && `base_attack_time`=1500; -- Illusory Wraith
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11054 && `base_attack_time`=1410; -- Crimson Rifleman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11058 && `base_attack_time`=1141; -- Fras Siabi
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11073 && `base_attack_time`=1470; -- Annora
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11082 && `base_attack_time`=1183; -- Stratholme Courier
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11100 && `base_attack_time`=1460; -- Mana Tide Totem II
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11142 && `base_attack_time`=1191; -- Undead Postman
UPDATE `creature_template` SET `base_attack_time`=2200 WHERE `entry`=11143 && `base_attack_time`=1166; -- Postmaster Malown
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11439 && `base_attack_time`=1166; -- Illusion of Jandice Barov
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11497 && `base_attack_time`=1150; -- The Razza
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11498 && `base_attack_time`=1150; -- Skarr the Unbreakable
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11560 && `base_attack_time`=1620; -- Magrami Spectre
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=11605 && `base_attack_time`=2000; -- Whitewhisker Overseer
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=11627 && `base_attack_time`=1660; -- Tamed Kodo
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11688 && `base_attack_time`=1266; -- Cursed Centaur
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11815 && `base_attack_time`=1450; -- Voriya
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11836 && `base_attack_time`=1870; -- Captured Rabid Thistle Bear
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11859 && `base_attack_time`=1410; -- Doomguard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=11898 && `base_attack_time`=1175; -- Crusader Lord Valdelmar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12037 && `base_attack_time`=1391; -- Ursol'lok
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12048 && `base_attack_time`=1410; -- Alliance Sentinel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12052 && `base_attack_time`=1410; -- Frostwolf Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12124 && `base_attack_time`=1225; -- Great Shark
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12126 && `base_attack_time`=1150; -- Lord Tirion Fordring
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12138 && `base_attack_time`=1860; -- Lunaclaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12144 && `base_attack_time`=1880; -- Lunaclaw Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12208 && `base_attack_time`=1430; -- Conquered Soul of the Blightcaller
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12261 && `base_attack_time`=1420; -- Infected Mossflayer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12319 && `base_attack_time`=1840; -- Burning Blade Toxicologist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12320 && `base_attack_time`=1860; -- Burning Blade Crusher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12321 && `base_attack_time`=1850; -- Stormscale Toxicologist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12397 && `base_attack_time`=1800; -- Lord Kazzak
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12496 && `base_attack_time`=1141; -- Dreamtracker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12497 && `base_attack_time`=1158; -- Dreamroarer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12738 && `base_attack_time`=1960; -- Nori Pridedrift
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12739 && `base_attack_time`=1183; -- Onyxia's Elite Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12756 && `base_attack_time`=850; -- Lady Onyxia
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12788 && `base_attack_time`=1390; -- Legionnaire Teena
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12789 && `base_attack_time`=1390; -- Blood Guard Hini'wana
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12790 && `base_attack_time`=1390; -- Advisor Willington
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12791 && `base_attack_time`=1390; -- Chieftain Earthbind
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12794 && `base_attack_time`=1460; -- Stone Guard Zarg
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12795 && `base_attack_time`=1410; -- First Sergeant Hola'mahi
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12796 && `base_attack_time`=1460; -- Raider Bork
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12797 && `base_attack_time`=1390; -- Grunt Korf
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12798 && `base_attack_time`=1390; -- Grunt Bek'rah
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=12865 && `base_attack_time`=1341; -- Ambassador Malcin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12876 && `base_attack_time`=1416; -- Baron Aquanis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=12918 && `base_attack_time`=1710; -- Chief Murgut
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13086 && `base_attack_time`=1191; -- Aggi Rumblestomp
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13087 && `base_attack_time`=1183; -- Coldmine Invader
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13278 && `base_attack_time`=1175; -- Duke Hydraxis
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=13279 && `base_attack_time`=1410; -- Discordant Surge
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13301 && `base_attack_time`=1450; -- Hive'Ashi Ambusher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13317 && `base_attack_time`=1175; -- Coldmine Miner
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13322 && `base_attack_time`=1200; -- Hydraxian Honor Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13324 && `base_attack_time`=1410; -- Seasoned Guardsman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13325 && `base_attack_time`=1410; -- Seasoned Mountaineer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13327 && `base_attack_time`=1410; -- Seasoned Sentinel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13329 && `base_attack_time`=1400; -- Seasoned Legionnaire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13330 && `base_attack_time`=1410; -- Seasoned Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13333 && `base_attack_time`=1410; -- Veteran Guardsman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13334 && `base_attack_time`=1410; -- Veteran Legionnaire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13335 && `base_attack_time`=1410; -- Veteran Mountaineer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13336 && `base_attack_time`=1410; -- Veteran Sentinel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13337 && `base_attack_time`=1410; -- Veteran Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13419 && `base_attack_time`=1141; -- Ivus the Forest Lord
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13422 && `base_attack_time`=1500; -- Champion Defender
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13424 && `base_attack_time`=1410; -- Champion Guardsman
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13425 && `base_attack_time`=1410; -- Champion Legionnaire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13426 && `base_attack_time`=1410; -- Champion Mountaineer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13427 && `base_attack_time`=1410; -- Champion Sentinel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13428 && `base_attack_time`=1410; -- Champion Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13440 && `base_attack_time`=1175; -- Frostwolf Wolf Rider
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13456 && `base_attack_time`=1500; -- Noxxion's Spawn
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=13534 && `base_attack_time`=1183; -- Seasoned Coldmine Guard
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=13536 && `base_attack_time`=1183; -- Champion Coldmine Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13537 && `base_attack_time`=1216; -- Seasoned Coldmine Surveyor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13539 && `base_attack_time`=1183; -- Champion Coldmine Surveyor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13547 && `base_attack_time`=1208; -- Veteran Coldmine Explorer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13548 && `base_attack_time`=1183; -- Champion Coldmine Explorer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13549 && `base_attack_time`=1183; -- Seasoned Coldmine Invader
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13550 && `base_attack_time`=1200; -- Veteran Coldmine Invader
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13551 && `base_attack_time`=1175; -- Champion Coldmine Invader
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13554 && `base_attack_time`=1191; -- Champion Irondeep Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13557 && `base_attack_time`=1225; -- Champion Irondeep Surveyor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13602 && `base_attack_time`=1375; -- The Abominable Greench
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13696 && `base_attack_time`=1275; -- Noxxious Scion
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13741 && `base_attack_time`=1258; -- Gelk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13742 && `base_attack_time`=1258; -- Kolk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=13896 && `base_attack_time`=1216; -- Scalebeard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14221 && `base_attack_time`=1350; -- Gravis Slipknot
UPDATE `creature_template` SET `base_attack_time`=1400 WHERE `entry`=14222 && `base_attack_time`=1358; -- Araga
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14224 && `base_attack_time`=1300; -- 7:XT
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14226 && `base_attack_time`=1316; -- Kaskk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14235 && `base_attack_time`=1291; -- The Rot
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14236 && `base_attack_time`=1258; -- Lord Angler
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14261 && `base_attack_time`=1183; -- Blue Drakonid
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14263 && `base_attack_time`=1183; -- Bronze Drakonid
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14265 && `base_attack_time`=1183; -- Black Drakonid
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14267 && `base_attack_time`=1450; -- Emogg the Crusher
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14275 && `base_attack_time`=1416; -- Tamra Stormpike
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14276 && `base_attack_time`=1400; -- Scargil
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14305 && `base_attack_time`=1970; -- Human Orphan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14340 && `base_attack_time`=1183; -- Alshirr Banebreath
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14342 && `base_attack_time`=1216; -- Ragepaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14364 && `base_attack_time`=1200; -- Shen'dralar Spirit
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=14370 && `base_attack_time`=1400; -- Cadaverous Worm
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14385 && `base_attack_time`=1420; -- Doomguard Minion
UPDATE `creature_template` SET `base_attack_time`=10000 WHERE `entry`=14396 && `base_attack_time`=1410; -- Eye of Immol'thar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14397 && `base_attack_time`=1420; -- Mana Burst
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14424 && `base_attack_time`=1441; -- Mirelow
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14429 && `base_attack_time`=1550; -- Grimmaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14435 && `base_attack_time`=1750; -- Prince Thunderaan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14444 && `base_attack_time`=1970; -- Orcish Orphan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14446 && `base_attack_time`=1275; -- Fingat
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14447 && `base_attack_time`=1291; -- Gilmorian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14454 && `base_attack_time`=1158; -- The Windreaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14457 && `base_attack_time`=1158; -- Princess Tempestria
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14461 && `base_attack_time`=1166; -- Baron Charr
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14462 && `base_attack_time`=1450; -- Thundering Invader
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14464 && `base_attack_time`=1166; -- Avalanchion
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=14467 && `base_attack_time`=1216; -- Kroshius
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14471 && `base_attack_time`=1141; -- Setis
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14472 && `base_attack_time`=1175; -- Gretheer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14477 && `base_attack_time`=1166; -- Grubthor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14479 && `base_attack_time`=1150; -- Twilight Lord Everun
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14481 && `base_attack_time`=1910; -- Emmithue Smails
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=14482 && `base_attack_time`=1430; -- Xorothian Imp
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14483 && `base_attack_time`=1183; -- Dread Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14486 && `base_attack_time`=1430; -- Scourge Footsoldier
UPDATE `creature_template` SET `base_attack_time`=2800 WHERE `entry`=14488 && `base_attack_time`=1333; -- Roloch
UPDATE `creature_template` SET `base_attack_time`=900 WHERE `entry`=14490 && `base_attack_time`=1283; -- Rippa
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14491 && `base_attack_time`=1325; -- Kurmokk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14492 && `base_attack_time`=1300; -- Verifonix
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14502 && `base_attack_time`=1166; -- Xorothian Dreadsteed
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14504 && `base_attack_time`=1410; -- Dreadsteed Spirit
UPDATE `creature_template` SET `base_attack_time`=2400 WHERE `entry`=14506 && `base_attack_time`=1133; -- Lord Hel'nurath
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14511 && `base_attack_time`=1175; -- Shadowed Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14512 && `base_attack_time`=1183; -- Corrupted Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14513 && `base_attack_time`=1183; -- Malicious Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14514 && `base_attack_time`=1410; -- Banal Spirit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14516 && `base_attack_time`=1150; -- Death Knight Darkreaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14518 && `base_attack_time`=1150; -- Aspect of Banality
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14519 && `base_attack_time`=1150; -- Aspect of Corruption
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14520 && `base_attack_time`=1150; -- Aspect of Malice
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14521 && `base_attack_time`=1150; -- Aspect of Shadow
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14524 && `base_attack_time`=1150; -- Vartrus the Ancient
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14525 && `base_attack_time`=1150; -- Stoma the Ancient
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14526 && `base_attack_time`=1150; -- Hastat the Ancient
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14531 && `base_attack_time`=1175; -- Artorius the Amiable
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14533 && `base_attack_time`=1183; -- Simone the Seductress
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14568 && `base_attack_time`=1410; -- Darkreaver's Fallen Charger
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=14603 && `base_attack_time`=1530; -- Zapped Shore Strider
UPDATE `creature_template` SET `base_attack_time`=2600 WHERE `entry`=14604 && `base_attack_time`=1510; -- Zapped Land Walker
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=14638 && `base_attack_time`=1520; -- Zapped Wave Strider
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=14639 && `base_attack_time`=1520; -- Zapped Deep Strider
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=14640 && `base_attack_time`=1510; -- Zapped Cliff Giant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14662 && `base_attack_time`=1490; -- Corrupted Fire Nova Totem V
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14663 && `base_attack_time`=1470; -- Corrupted Stoneskin Totem VI
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14664 && `base_attack_time`=1410; -- Corrupted Healing Stream Totem V
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14666 && `base_attack_time`=1410; -- Corrupted Windfury Totem III
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=14748 && `base_attack_time`=1520; -- Vilebranch Kidnapper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15011 && `base_attack_time`=1460; -- Wagner Hammerstrike
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15012 && `base_attack_time`=1460; -- Javnir Nashak
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15082 && `base_attack_time`=1600; -- Gri'lek
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15085 && `base_attack_time`=2000; -- Wushoolay
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15113 && `base_attack_time`=1410; -- Honored Hero
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15115 && `base_attack_time`=1410; -- Honored Ancestor
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15136 && `base_attack_time`=1440; -- Hammerfall Elite
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15138 && `base_attack_time`=1460; -- Silverpine Elite
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15215 && `base_attack_time`=1158; -- Mistress Natalia Mar'alith
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15261 && `base_attack_time`=1410; -- Spirit Shade
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15302 && `base_attack_time`=1666; -- Shade of Taerar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15308 && `base_attack_time`=1183; -- Twilight Prophet
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15309 && `base_attack_time`=1739; -- Spoops
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15363 && `base_attack_time`=1660; -- Spirit Totem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15443 && `base_attack_time`=1200; -- Janela Stouthammer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15444 && `base_attack_time`=1250; -- Arcanist Nozzlespring
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15549 && `base_attack_time`=1390; -- Elder Morndeep
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15554 && `base_attack_time`=1200; -- Number Two
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15556 && `base_attack_time`=1390; -- Elder Splitrock
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15557 && `base_attack_time`=1390; -- Elder Rumblerock
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15558 && `base_attack_time`=1390; -- Elder Silvervein
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15560 && `base_attack_time`=1390; -- Elder Stonefort
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15563 && `base_attack_time`=1390; -- Elder Bellowrage
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15567 && `base_attack_time`=1390; -- Elder Ironband
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15569 && `base_attack_time`=1390; -- Elder Goldwell
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15570 && `base_attack_time`=1390; -- Elder Primestone
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15572 && `base_attack_time`=1390; -- Elder Runetotem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15573 && `base_attack_time`=1390; -- Elder Ragetotem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15574 && `base_attack_time`=1390; -- Elder Stonespire
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15575 && `base_attack_time`=1390; -- Elder Bloodhoof
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15577 && `base_attack_time`=1390; -- Elder Skychaser
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15578 && `base_attack_time`=1390; -- Elder Wildmane
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15581 && `base_attack_time`=1390; -- Elder Grimtotem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15583 && `base_attack_time`=1390; -- Elder Thunderhorn
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15584 && `base_attack_time`=1390; -- Elder Skyseer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15585 && `base_attack_time`=1390; -- Elder Dawnstrider
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15586 && `base_attack_time`=1390; -- Elder Dreamseer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15587 && `base_attack_time`=1390; -- Elder Mistwalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15588 && `base_attack_time`=1390; -- Elder High Mountain
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15593 && `base_attack_time`=1390; -- Elder Starsong
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15595 && `base_attack_time`=1390; -- Elder Bladeleaf
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15596 && `base_attack_time`=1390; -- Elder Starglade
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15599 && `base_attack_time`=1390; -- Elder Bladesing
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15600 && `base_attack_time`=1390; -- Elder Skygleam
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15601 && `base_attack_time`=1390; -- Elder Starweave
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15603 && `base_attack_time`=1390; -- Elder Nightwind
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15604 && `base_attack_time`=1390; -- Elder Morningdew
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15605 && `base_attack_time`=1390; -- Elder Riversong
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15606 && `base_attack_time`=1390; -- Elder Brightspear
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15607 && `base_attack_time`=1390; -- Elder Farwhisper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15612 && `base_attack_time`=1500; -- Krug Skullsplit
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15613 && `base_attack_time`=1500; -- Merok Longstride
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15615 && `base_attack_time`=1500; -- Shadow Priestess Shai
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15617 && `base_attack_time`=1500; -- Orgrimmar Legion Axe Thrower
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=15721 && `base_attack_time`=2000; -- Mechanical Greench
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15903 && `base_attack_time`=1300; -- Sergeant Carnes
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15928 && `base_attack_time`=1480; -- Thaddius
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15929 && `base_attack_time`=2000; -- Stalagg
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15930 && `base_attack_time`=2000; -- Feugen
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15931 && `base_attack_time`=1480; -- Grobbulus
UPDATE `creature_template` SET `base_attack_time`=1600 WHERE `entry`=15932 && `base_attack_time`=1480; -- Gluth
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15936 && `base_attack_time`=1480; -- Heigan the Unclean
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15952 && `base_attack_time`=2000; -- Maexxna
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15953 && `base_attack_time`=1750; -- Grand Widow Faerlina
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15954 && `base_attack_time`=1480; -- Noth the Plaguebringer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15974 && `base_attack_time`=1480; -- Dread Creeper
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15975 && `base_attack_time`=1480; -- Carrion Spinner
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15976 && `base_attack_time`=1480; -- Venom Stalker
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=15977 && `base_attack_time`=1480; -- Infectious Skitterer
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=15978 && `base_attack_time`=1480; -- Crypt Reaver
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15979 && `base_attack_time`=1480; -- Tomb Horror
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15980 && `base_attack_time`=1480; -- Naxxramas Cultist
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=15981 && `base_attack_time`=1480; -- Naxxramas Acolyte
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=15989 && `base_attack_time`=1480; -- Sapphiron
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=15990 && `base_attack_time`=1800; -- Kel'Thuzad
UPDATE `creature_template` SET `base_attack_time`=1250 WHERE `entry`=16011 && `base_attack_time`=1480; -- Loatheb
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16016 && `base_attack_time`=1390; -- Anthion Harmon
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16017 && `base_attack_time`=1480; -- Patchwork Golem
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16018 && `base_attack_time`=1480; -- Bile Retcher
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16020 && `base_attack_time`=1150; -- Mad Scientist
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16021 && `base_attack_time`=1480; -- Living Monstrosity
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16022 && `base_attack_time`=1150; -- Surgical Assistant
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16024 && `base_attack_time`=1150; -- Embalming Slime
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16025 && `base_attack_time`=1480; -- Stitched Spewer
UPDATE `creature_template` SET `base_attack_time`=750 WHERE `entry`=16028 && `base_attack_time`=1500; -- Patchwerk
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16029 && `base_attack_time`=1480; -- Sludge Belcher
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16056 && `base_attack_time`=2000; -- Diseased Maggot
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16057 && `base_attack_time`=3000; -- Rotting Maggot
UPDATE `creature_template` SET `base_attack_time`=3800 WHERE `entry`=16059 && `base_attack_time`=1183; -- Theldren
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16060 && `base_attack_time`=1480; -- Gothik the Harvester
UPDATE `creature_template` SET `base_attack_time`=3500 WHERE `entry`=16061 && `base_attack_time`=1425; -- Instructor Razuvious
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16062 && `base_attack_time`=1480; -- Highlord Mograine
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16065 && `base_attack_time`=1500; -- Lady Blaumeux
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16067 && `base_attack_time`=1150; -- Skeletal Steed
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16095 && `base_attack_time`=2000; -- Gnashjaw
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16112 && `base_attack_time`=1810; -- Korfax, Champion of the Light
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16113 && `base_attack_time`=1810; -- Father Inigo Montoy
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16114 && `base_attack_time`=1250; -- Scarlet Commander Marjhan
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16115 && `base_attack_time`=1810; -- Commander Eligor Dawnbringer
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16116 && `base_attack_time`=1810; -- Archmage Angela Dosantos
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=16124 && `base_attack_time`=2000; -- Unrelenting Trainee
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16127 && `base_attack_time`=1150; -- Spectral Trainee
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16131 && `base_attack_time`=1810; -- Rohan the Assassin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16132 && `base_attack_time`=1810; -- Huntsman Leopold
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16133 && `base_attack_time`=1810; -- Mataus the Wrathcaster
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16134 && `base_attack_time`=1810; -- Rimblat Earthshatter
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16135 && `base_attack_time`=1810; -- Rayne
UPDATE `creature_template` SET `base_attack_time`=3500 WHERE `entry`=16145 && `base_attack_time`=2500; -- Deathknight Captain
UPDATE `creature_template` SET `base_attack_time`=1700 WHERE `entry`=16146 && `base_attack_time`=1150; -- Deathknight
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16149 && `base_attack_time`=1150; -- Spectral Horse
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16154 && `base_attack_time`=1150; -- Risen Deathknight
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16156 && `base_attack_time`=1150; -- Dark Touched Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16157 && `base_attack_time`=1150; -- Doom Touched Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16158 && `base_attack_time`=1150; -- Death Touched Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16163 && `base_attack_time`=1150; -- Deathknight Cavalier
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16164 && `base_attack_time`=1150; -- Shade of Naxxramas
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=16165 && `base_attack_time`=1150; -- Necro Knight
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16167 && `base_attack_time`=1860; -- Bony Construct
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=16168 && `base_attack_time`=1150; -- Stoneskin Gargoyle
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16193 && `base_attack_time`=1150; -- Skeletal Smith
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=16194 && `base_attack_time`=2000; -- Unholy Axe
UPDATE `creature_template` SET `base_attack_time`=1200 WHERE `entry`=16216 && `base_attack_time`=1600; -- Unholy Swords
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16226 && `base_attack_time`=1289; -- Guard Didier
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16232 && `base_attack_time`=1400; -- Caravan Mule
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=16236 && `base_attack_time`=1150; -- Eye Stalk
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16241 && `base_attack_time`=1400; -- Argent Recruiter
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=16243 && `base_attack_time`=1150; -- Plague Slime
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16244 && `base_attack_time`=1150; -- Infectious Ghoul
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16254 && `base_attack_time`=1400; -- Field Marshal Chambers
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=16290 && `base_attack_time`=1150; -- Fallout Slime
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=16360 && `base_attack_time`=2000; -- Zombie Chow
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16365 && `base_attack_time`=1150; -- Master Craftsman Omarion
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16368 && `base_attack_time`=1150; -- Necropolis Acolyte
UPDATE `creature_template` SET `base_attack_time`=1800 WHERE `entry`=16375 && `base_attack_time`=1150; -- Sewage Slime
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16381 && `base_attack_time`=1150; -- Archmage Tarsis Kir-Moldir
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16385 && `base_attack_time`=1318; -- Lightning Totem
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16387 && `base_attack_time`=1450; -- Atiesh
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16390 && `base_attack_time`=1150; -- Deathchill Servant
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16441 && `base_attack_time`=1250; -- Guardian of Icecrown
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=16446 && `base_attack_time`=1150; -- Plagued Gargoyle
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16447 && `base_attack_time`=1150; -- Plagued Ghoul
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16448 && `base_attack_time`=1150; -- Plagued Deathhound
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16449 && `base_attack_time`=1150; -- Spirit of Naxxramas
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16451 && `base_attack_time`=1000; -- Deathknight Vindicator
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16452 && `base_attack_time`=1200; -- Necro Knight Guardian
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16453 && `base_attack_time`=1150; -- Necro Stalker
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16474 && `base_attack_time`=1400; -- Blizzard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16478 && `base_attack_time`=1350; -- Lieutenant Orrin
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16484 && `base_attack_time`=1400; -- Lieutenant Nevell
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16490 && `base_attack_time`=1400; -- Lieutenant Lisande
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16493 && `base_attack_time`=1400; -- Lieutenant Dagel
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16494 && `base_attack_time`=1350; -- Lieutenant Rukag
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16495 && `base_attack_time`=1400; -- Lieutenant Beitha
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16505 && `base_attack_time`=1150; -- Naxxramas Follower
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16506 && `base_attack_time`=1150; -- Naxxramas Worshipper
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=16573 && `base_attack_time`=1150; -- Crypt Guard
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16697 && `base_attack_time`=1400; -- Void Zone
UPDATE `creature_template` SET `base_attack_time`=1000 WHERE `entry`=16698 && `base_attack_time`=1150; -- Corpse Scarab
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=16775 && `base_attack_time`=1333; -- Spirit of Mograine
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16776 && `base_attack_time`=2000; -- Spirit of Blaumeux
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16777 && `base_attack_time`=2000; -- Spirit of Zeliek
UPDATE `creature_template` SET `base_attack_time`=2500 WHERE `entry`=16778 && `base_attack_time`=2000; -- Spirit of Korth'azz
UPDATE `creature_template` SET `base_attack_time`=3500 WHERE `entry`=16803 && `base_attack_time`=1150; -- Deathknight Understudy
UPDATE `creature_template` SET `base_attack_time`=3000 WHERE `entry`=16981 && `base_attack_time`=2000; -- Plagued Guardian
UPDATE `creature_template` SET `base_attack_time`=2700 WHERE `entry`=16984 && `base_attack_time`=2000; -- Plagued Warrior
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=16998 && `base_attack_time`=1150; -- Mr. Bigglesworth
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=17003 && `base_attack_time`=1400; -- Cinder Elemental
UPDATE `creature_template` SET `base_attack_time`=1500 WHERE `entry`=17078 && `base_attack_time`=2000; -- Jimmy McWeaksauce
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17209 && `base_attack_time`=1289; -- William Kielar
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17231 && `base_attack_time`=1400; -- Garden Gas
UPDATE `creature_template` SET `base_attack_time`=2000 WHERE `entry`=17766 && `base_attack_time`=1200; -- Horde Silithyst Sentinel


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
