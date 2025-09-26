DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250925202020');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20250925202020');
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
4783,	  -- (Entry for all Pet trainers)
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
4695);	  -- Ayanna Everstride
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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;