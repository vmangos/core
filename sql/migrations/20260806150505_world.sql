DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260806150505');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20260806150505');
-- Add your query below.

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES 
(10660, 17, 10660, 0, 0, 0, 0),      -- Condition to check if the player has learnt Tribal Leatherworking
(10658, 17, 10658, 0, 0, 0, 0),      -- Condition to check if the player has learnt Elemental Leatherworking
(10656, 17, 10656, 0, 0, 0, 0),      -- Condition to check if the player has learnt Dragonscale Leatherworking
-- Note: Condition 1367 corresponds to a condition checking if the player has learnt Goblin Engineering
-- Note: Condition 1371 corresponds to a condition checking if the player has a Goblin Engineer Membership Card in their inventory
(20222, -1, 1367, 1371, 0, 0, 0),     -- Condition for goblin engineering trainer gossip
-- Note: Condition 1368 corresponds to a condition checking if the player has learnt Gnomish Engineering
-- Note: Condition 1374 corresponds to a condition checking if the player has a Gnome Engineer Membership Card in their inventory
(20219, -1, 1368, 1374, 0, 0, 0),     -- Condition for gnomish engineering trainer gossip
(20220, -1, 20219, 2, 0, 0, 0);       -- Condition for gnomish engineering trainer gossip for horde (Oglethorpe is a neutral NPC)

-- Add missing trainer gossip menu options
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES 
(3068, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 10656),     -- Trainer gossip menu option for Thorkaf Dragoneye (Dragonscale Leatherworking - Horde)
(3069, 0, 3, 'I would like to train.', 2548, 5, 16, 0, 0, 0, 0, 0, NULL, 0, 10658);     -- Trainer gossip menu option for Brumn Winterhoof (Elemental Leatherworking - Horde)


-- Update condition for existing trainer gossip menu options
UPDATE `gossip_menu_option` SET `condition_id` = 1354 WHERE `option_id` = 5 AND `menu_id` IN (
597,       -- Grumnus Steelshaper (Armorsmithing - Alliance)
1043,      -- Shayis Steelfury (Armorsmithing - Horde)
3203);     -- Okothos Ironrage (Armorsmithing - Horde)

UPDATE `gossip_menu_option` SET `condition_id` = 1352 WHERE `option_id` = 5 AND `menu_id` IN (
1041,      -- Borgus Steelhand (Weaponsmithing - Alliance)
1042,      -- Kelgruk Blooadaxe (Weaponsmithing - Horde)
3201,      -- Ironus Coldsteel (Weaponsmithing - Alliance)
3202);     -- Borgosh Corebender (Weaponsmithing - Horde)
UPDATE `gossip_menu_option` SET `condition_id` = 10656 WHERE `menu_id` = 3067 AND `option_id` = 5;     -- Peter Galen (Dragonscale Leatherworking - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 10658 WHERE `menu_id` = 3070 AND `option_id` = 5;     -- Sarah Tanner (Elemental Leatherworking - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 10660 WHERE `option_id` = 5 AND `menu_id` IN (
3072,       -- Caryssia Moonhunter (Tribal Leatherworking - Alliance)
3073);     -- Se'Jib (Tribal Leatherworking - Horde)
UPDATE `gossip_menu_option` SET `condition_id` = 20222, `option_broadcast_text` = 4551 WHERE `menu_id` = 1465 AND `option_id` = 5;     -- Vazario Linkgrease (Goblin Engineering) + Correction to broadcast_text entry (currently uses the Gnomish entry 4553 instead of the Goblin one, 4551)
UPDATE `gossip_menu_option` SET `condition_id` = 20219 WHERE `menu_id` = 1468 AND `option_id` = 5;     -- Tinkmaster Overspark (Gnomish Engineering - Alliance)
UPDATE `gossip_menu_option` SET `condition_id` = 20220 WHERE `menu_id` = 1467 AND `option_id` = 5;     -- Oglethorpe Obnoticus (Gnomish Engineering - Horde)
UPDATE `gossip_menu_option` SET `condition_id` = 20222 WHERE `menu_id` = 1469 AND `option_id` = 5;     -- Nixx Sprocketspring (Goblin Engineering)

-- Add class conditions for all class trainer gossip options --
-- Druid
UPDATE `gossip_menu_option` SET `condition_id` = 89 WHERE `option_id` = 5 AND menu_id IN (
1403,      -- Mathrengyl Bearwalker
3921,      -- Turak Runetotem
3923,      -- Kal
3924,      -- Denatharion
3926,      -- Gennia Runetotem
4507,      -- Maldryn
4508,      -- Sheldras Moontree
4571,      -- Fylerian Nightwing
4606,      -- Sheal Runetotem, Jannos Lighthoof
4607,      -- Kym Wildmane
4644,      -- Gart Mistrunner
4687,      -- Loganaar
4688,      -- Mardant Strongoak, Theridran
4689);     -- Golhine the Hooded
-- Warlock
UPDATE `gossip_menu_option` SET `condition_id` = 67 WHERE `option_id` = 5 AND menu_id IN (
1503,      -- Drusilla La Salle
2381,      -- Briarthorn
2383,      -- Kaal Soulreaper
2384,      -- Zevrost
4503,      -- Demisette Cloyce
4504,      -- Sandahl
4505,      -- Ursula Deline
4566,      -- Alexander Calder
4567,      -- Thistleheart
4603,      -- Grol'dar
4604,      -- Mirket
4609,      -- Luther Pickman
4610,      -- Richard Kerwin
4641,      -- Dhugru Gorelust
4642,      -- Kartosh
4643,      -- Nartok
4655,      -- Maximillion
4656,      -- Rupert Boch
4667,      -- Maximillian Crowe
4681,      -- Alamar Grimm
4682);     -- Gimrizz Shadowcog
-- Demon trainers already use condition 67
-- Mage (including Portal trainers)
UPDATE `gossip_menu_option` SET `condition_id` = 90 WHERE `option_id` = 5 AND menu_id IN (
63,       -- Cain Firesong
64,       -- Un'Thuwa, Mai'ah
4484,     -- Elsharin
4485,     -- Jennea Cannon
4486,     -- Maginor Dumas
4517,     -- Uthel'nay
4518,     -- Enyo
4519,     -- Deino
4520,     -- Pephredo
4534,     -- Archmage Shymm
4535,     -- Thurston Xane
4536,     -- Ursyn Ghull
4537,     -- Anastasia Hartwell
4538,     -- Pierce Shackleton
4539,     -- Kaelystia Hatebringer
4552,     -- Bink, Nittlebur Sparkfizzle
4553,     -- Dink
4554,     -- Juli Stormkettle
4654,     -- Isabella
4660,     -- Khelden Bremen
4661,     -- Zaldimar Wefhellt
4685,     -- Magis Sparkmantle
4686,     -- Marryk Nurribit
4821,     -- Elissa Dumas
4822,     -- Larimaine Purdue
4823,     -- Milstaff Stormeye
4825,     -- Birgitte Cranston
4826,     -- Thuul
4827);    -- Lexington Mortaim
-- Shaman
UPDATE `gossip_menu_option` SET `condition_id` = 92 WHERE `option_id` = 5 AND menu_id IN (
4103,     -- Meela Dawnstrider, Narm Skychaser
4104,     -- Swart
4515,     -- Sian'tsu
4516,     -- Kardris Dreamseeker
4528,     -- Siln Skychaser
4529,     -- Beram Skychaser
4530,     -- Tigor Skychaser
4652,     -- Haromm, Shikrik
5123);    -- Sagorne Creststrider
-- Priest
UPDATE `gossip_menu_option` SET `condition_id` = 94 WHERE `option_id` = 5 AND menu_id IN (
3642,     -- High Priest Rohan
3643,     -- Nara Meideros
3644,     -- Tai'jin, Ken'jai
3645,     -- Dark Cleric Duesten, Dark Cleric Beryl
4466,     -- High Priestess Laurena
4467,     -- Brother Joshua
4468,     -- Brother Benjamin
4521,     -- Ur'kyo
4522,     -- Zayus
4523,     -- X'yera
4531,     -- Malakai Cross
4532,     -- Father Cobb
4533,     -- Miles Welsh
4543,     -- Father Lazarus
4544,     -- Aelthalyste
4545,     -- Father Lankester
4558,     -- Braenna Flintcrag
4560,     -- Toldren Deepiron
4572,     -- Lariia
4573,     -- Jandria
4665,     -- Priestess Anetta
4666,     -- Priestess Josetta
4679,     -- Branstock Khalder
4680,     -- Maxan Anvol, Theodrus Frostbeard
4691);    -- Shanda, Laurna Morninglight, Astarii Starseeker, Priestess Alathea
-- Rogue
UPDATE `gossip_menu_option` SET `condition_id` = 100 WHERE `option_id` = 5 AND menu_id IN (
85,       -- David Trias, Marion Call
141,      -- Rwag, Kaplak
381,      -- Keryn Sylvius
410,      -- Hogral Bakkan
411,      -- Hulfdan Blackbeard
436,      -- Jannok Breezesong
521,      -- Shenthul
3984,     -- Fahrad
4502,     -- Osborne the Night Man
4512,     -- Ormok
4513,     -- Gest
4540,     -- Miles Dexter
4541,     -- Gregory Charles
4542,     -- Carolyn Ward
4561,     -- Fenthwick
4562,     -- Ormyr Flinteye
4575,     -- Anishar
4576,     -- Syurna
4577,     -- Erion Shadewhisper
4658,     -- Ian Strom
4659,     -- Jorik Kerridan
4676,     -- Solm Hargrin
4690,     -- Frahun Shadewhisper
5061);    -- Lord Tony Romano
-- Hunter (including Pet trainers)
UPDATE `gossip_menu_option` SET `condition_id` = 96 WHERE `option_id` = 5 AND menu_id IN (
4007, 	  -- Grif Wildheart
4008, 	  -- Jocaste
4009, 	  -- Dazalar
4010, 	  -- Ormak Grimshot
4011, 	  -- Kary Thunderhorn
4012, 	  -- Yaw Sharpmane
4013, 	  -- Sian'dur
4017, 	  -- Thotar
4023, 	  -- Holt Thunderhorn
4092, 	  -- Danlaar Nightstride, Alenndaar Lapidaar
4101, 	  -- Ogromm
4472, 	  -- Thorfin Stoneshield
4473, 	  -- Ulfir Ironbeard
4474, 	  -- Einris Brightspear
4506, 	  -- Xor'juul
4524, 	  -- Urek Thunderhorn
4549, 	  -- Daera Brightspear
4550, 	  -- Olmin Burningbeard
4551, 	  -- Regnus Thundergranite
4621, 	  -- Jeen'ra Nightrunner
4647, 	  -- Lanka Farshot
4648, 	  -- Jen'shan
4657, 	  -- Kragg
4674, 	  -- Dargh Trueaim
4675, 	  -- Thorgas Grimson
4693, 	  -- Dorion
4694, 	  -- Kaerbrus
4695,	  -- Ayanna Everstride
4783);	  -- (Entry for all Pet trainers)
-- Paladin
UPDATE `gossip_menu_option` SET `condition_id` = 106 WHERE `option_id` = 5 AND menu_id IN (
2304, 	  -- Brandur Ironhammer
4469, 	  -- Arthur the Faithful
4470, 	  -- Katherine the Pure
4471, 	  -- Lord Grayson Shadowbreaker
4556, 	  -- Beldruk Doombrow
4557, 	  -- Valgar Highforge
4662, 	  -- Brother Karman
4663, 	  -- Brother Sammuel
4664, 	  -- Brother Wilhelm
4677, 	  -- Azar Stronghammer
4678);	  -- Bromos Grummner
-- Warrior
UPDATE `gossip_menu_option` SET `condition_id` = 98 WHERE `option_id` = 5 AND menu_id IN (
523, 	  -- Malosh, Frang, Tarshaw Jaggedscar
655, 	  -- Krang Stonehoof
656, 	  -- Austil de Mon
4091, 	  -- Captain Evencane
4475, 	  -- Ander Germaine
4481, 	  -- Ilsa Corbin
4482, 	  -- Wu Shen
4509, 	  -- Grezz Ragefist
4510, 	  -- Zel'mak
4511, 	  -- Sorek
4525, 	  -- Sark Ragetotem
4526, 	  -- Torm Ragetotem
4527, 	  -- Ker Ragetotem
4546, 	  -- Angela Curthas
4547, 	  -- Baltus Fowler
4548, 	  -- Christoph Walker
4568, 	  -- Bilban Tosslespanner
4569, 	  -- Kelstrum Stonebreaker
4570, 	  -- Kelv Sternhammer
4578, 	  -- Sildanair
4579, 	  -- Darnath Bladesinger
4581, 	  -- Arias'ta Bladesinger
4645, 	  -- Harutt Thunderhorn
4649, 	  -- Lyria Du Lac
4650, 	  -- Llane Beshere
4653, 	  -- Dannal Stern
4683, 	  -- Granis Swiftaxe
4684, 	  -- Thran Khorman
4696, 	  -- Alyissia
4697); 	  -- Kyra Windblade

-- Remove the now deprecated columns
ALTER TABLE `creature_template`
	DROP COLUMN `trainer_spell`,
	DROP COLUMN `trainer_race`,
	DROP COLUMN `trainer_class`,
	DROP COLUMN `trainer_type`;

-- Delete made up trainer entries for World Trainers (if you want custom ones just use the custom GM Island code)
-- from `npc_trainer_greeting`
DELETE FROM `npc_trainer_greeting` WHERE `entry` IN (
5032,
5037,
5038,
5040,
5041);

-- from `npc_trainer`
DELETE FROM `npc_trainer` WHERE `entry` IN (
5032,
5037,
5038,
5040,
5041);


-- CORRECTIONS FOR `npc_trainer_greeting`
-- Delete entry for non-trainer NPC
DELETE FROM `npc_trainer_greeting` WHERE `entry` = 6251;

-- NPCs that have an empty trainer greeting
UPDATE `npc_trainer_greeting` SET `content_default` = '', `content_loc1` = '', `content_loc2` = '', `content_loc3` = '', `content_loc4` = '', `content_loc5` = '', `content_loc6` = '', `content_loc7` = '', `content_loc8` = '' WHERE `entry` IN (
4578,
5164,
7230,
7231,
7232,
7866,
7867,
7868,
7869,
7870,
7871,
8126,
8738,
9584,
11146,
11177,
11178);

-- Velma Warnam has a non-empty trainer greeting (already correct in other localisations)
UPDATE `npc_trainer_greeting` SET `content_default` = 'Hello!  Can I teach you something?' WHERE `entry = 4773;

-- Add 'type' to npc_trainer_greeting instead of calculating in core:
-- This is the determiner for the version of the training greeting UI that is sent to the client, unrelated to trainer_type from creature_template
-- Stored in DB together with trainer greetings, valid values are 0 and 2
ALTER TABLE `npc_trainer_greeting`
    ADD COLUMN `type` TINYINT(2) UNSIGNED NOT NULL DEFAULT '2' AFTER `entry`;

-- Assign trainerType based on `trainer` sniffs
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 198;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 328;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 331;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 375;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 376;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 377;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 459;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 460;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 461;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 543;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 837;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 895;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 906;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 911;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 912;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 913;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 914;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 915;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 916;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 917;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 918;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 925;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 926;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 927;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 928;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 944;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 985;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 986;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 987;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 988;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1226;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1228;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1229;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1231;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1232;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1234;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1404;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1411;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 1901;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2119;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2122;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2123;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2124;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2126;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2127;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2128;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2129;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2130;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2131;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2485;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2489;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2492;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2704;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2818;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2878;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 2879;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3030;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3031;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3032;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3033;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3034;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3036;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3038;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3039;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3040;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3041;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3042;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3043;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3044;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3045;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 046;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3047;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3048;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3049;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3059;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3060;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3061;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3062;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3063;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3064;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3065;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3066;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3153;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3154;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3155;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3156;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3157;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3169;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3170;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3171;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3172;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3173;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3306;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3324;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3325;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3326;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3327;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3328;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3344;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3352;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3353;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3354;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3401;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3403;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3406;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3407;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3408;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3545;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3593;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3594;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3595;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3596;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3597;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3598;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3599;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3600;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3601;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3602;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3620;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3622;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3624;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3688;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3690;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3698;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3706;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3707;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 3963;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4087;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4089;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4090;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4091;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4092;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4138;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4146;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4163;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4165;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4205;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4214;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4215;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4217;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4218;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4219;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4320;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4563;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4564;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4565;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4566;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4567;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4568;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4582;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4583;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4584;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4593;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4594;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4595;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4606;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4607;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4608;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4732;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4752;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4753;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4772;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 4773;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5113;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5114;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5115;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5116;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5117;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5141;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5142;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5143;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5144;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5145;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5146;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5147;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5148;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5149;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5165;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5166;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5167;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5171;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5172;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5173;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5479;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5480;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5484;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5489;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5491;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5492;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5495;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5496;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5497;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5498;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5501;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5504;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5505;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5506;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5515;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5516;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5517;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5612;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5880;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5882;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5883;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5884;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5885;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5957;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5958;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 5994;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 6014;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 6018;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 6707;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 7311;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 7312;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 7315;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 7953;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 7954;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 8140;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 8141;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 8142;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 8308;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 9465;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 10086;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 10088;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 10089;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 10090;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 10930;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11397;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11401;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11406;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11865;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11866;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11867;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11868;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11869;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 11870;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 12042;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 13084;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 13283;
UPDATE `npc_trainer_greeting` SET `trainerType` = 0 WHERE `entry` IN = 13417;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;