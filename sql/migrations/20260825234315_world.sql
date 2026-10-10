DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260825234315');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20260825234315');
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
UPDATE `npc_trainer_greeting` SET `content_default` = 'Hello!  Can I teach you something?' WHERE `entry` = 4773;

-- Add 'type' to npc_trainer_greeting instead of calculating in core:
-- This is a formatter for training UI that is opened after sending SMSG_TRAINER_LIST to the client (completely unrelated to trainer_type from creature_template)
-- Stored in DB together with trainer greetings, valid values are 0 and 2
ALTER TABLE `npc_trainer_greeting`
	ADD COLUMN `trainer_type` TINYINT(2) UNSIGNED NOT NULL DEFAULT '2' AFTER `entry`;

-- Assign trainer_type based on `trainer` sniffs
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 198;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 328;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 331;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 375;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 376;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 377;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 459;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 460;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 461;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 543;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 837;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 895;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 906;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 911;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 912;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 913;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 914;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 915;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 916;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 917;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 918;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 925;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 926;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 927;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 928;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 944;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 985;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 986;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 987;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 988;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1226;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1228;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1229;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1231;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1232;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1234;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1404;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1411;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 1901;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2119;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2122;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2123;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2124;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2126;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2127;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2128;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2129;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2130;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2131;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2485;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2489;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2492;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2704;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2818;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2878;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 2879;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3030;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3031;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3032;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3033;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3034;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3036;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3038;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3039;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3040;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3041;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3042;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3043;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3044;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3045;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 046;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3047;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3048;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3049;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3059;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3060;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3061;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3062;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3063;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3064;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3065;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3066;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3153;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3154;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3155;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3156;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3157;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3169;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3170;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3171;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3172;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3173;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3306;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3324;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3325;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3326;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3327;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3328;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3344;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3352;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3353;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3354;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3401;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3403;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3406;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3407;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3408;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3545;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3593;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3594;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3595;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3596;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3597;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3598;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3599;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3600;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3601;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3602;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3620;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3622;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3624;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3688;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3690;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3698;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3706;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3707;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 3963;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4087;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4089;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4090;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4091;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4092;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4138;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4146;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4163;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4165;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4205;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4214;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4215;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4217;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4218;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4219;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4320;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4563;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4564;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4565;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4566;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4567;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4568;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4582;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4583;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4584;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4593;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4594;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4595;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4606;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4607;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4608;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4732;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4752;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4753;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4772;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 4773;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5113;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5114;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5115;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5116;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5117;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5141;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5142;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5143;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5144;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5145;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5146;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5147;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5148;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5149;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5165;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5166;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5167;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5171;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5172;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5173;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5479;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5480;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5484;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5489;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5491;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5492;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5495;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5496;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5497;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5498;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5501;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5504;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5505;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5506;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5515;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5516;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5517;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5612;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5880;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5882;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5883;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5884;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5885;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5957;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5958;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 5994;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 6014;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 6018;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 6707;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 7311;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 7312;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 7315;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 7953;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 7954;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 8140;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 8141;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 8142;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 8308;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 9465;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 10086;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 10088;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 10089;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 10090;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 10930;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11397;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11401;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11406;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11865;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11866;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11867;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11868;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11869;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 11870;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 12042;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 13084;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 13283;
UPDATE `npc_trainer_greeting` SET `trainer_type` = 0 WHERE `entry` = 13417;

-- LANG_NPC_TAINER_HELLO is no longer used
DELETE FROM `mangos_string` WHERE `entry` = 51;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;