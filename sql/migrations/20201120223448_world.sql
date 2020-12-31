DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201120223448');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201120223448');
-- Add your query below.


-- Undercity
-- Imbued Vial - Daniel Bartlett
DELETE FROM `npc_vendor` WHERE `entry` = 4561 AND `item` = 18256;

-- Rune Thread - Daniel Bartlett
DELETE FROM `npc_vendor` WHERE `entry` = 4561 AND `item` = 14341;

-- Shiny Bauble - Daniel Bartlett
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4561, 6529);

-- Small Throwing Knife - Eleanor Rusk
DELETE FROM `npc_vendor` WHERE `entry` = 4555 AND `item` = 2947;

-- Crude Throwing Axe - Eleanor Rusk
DELETE FROM `npc_vendor` WHERE `entry` = 4555 AND `item` = 3111;

-- Black Dye - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 2325;

-- Grey Dye - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 4340;

-- Yellow Dye - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 4341;

-- Purple Dye - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 4342;

-- Heaby Silken Thread - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 8343;

-- Rune Thread - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 14341;

-- Crystal Vial - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 8925;

-- Imbued Vial - Felicia Doan
DELETE FROM `npc_vendor` WHERE `entry` = 4775 AND `item` = 18256;

-- Missing Items - Felicia Doan
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4775, 2605),
(4775, 6260),
(4775, 6529),
(4775, 2324);

-- Scroll of Strength - Salazar Bloch
UPDATE `npc_vendor` SET `maxcount` = 4 WHERE `entry` = 4581 AND `item` = 954;

-- Scroll of Stamina 2 - Salazar Bloch
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4581 AND `item` = 1711;

-- Scroll of Intellect 2 - Salazar Bloch
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 4581 AND `item` = 2290;

-- Scroll of Agility - Salazar Bloch
UPDATE `npc_vendor` SET `maxcount` = 5 WHERE `entry` = 4581 AND `item` = 3012;

-- Pattern: Green Whelp Bracers - Joseph Moore
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4589, 7451, 1, 7200);

-- Strong Fishing Pole - Lizbeth Cromwell
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4574 AND `item` = 6365;

-- Missing Items - Elizabeth Van Talen
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(4587, 4389, 1, 10800),
(4587, 4404, 3, 10800),
(4587, 4361, 2, 10800);

-- Teldrassil
-- Missing Items - Aldia
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(3608, 3131),
(3608, 2946);

-- Strong Fishing Pole - Nessa Shadowsong
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 10118 AND `item` = 6365;

-- Darkshore
-- Striped Yellowtail - Heldan Galesong
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4307 AND `item` = 21552;

-- Correct Items - Tiyani
DELETE FROM `npc_vendor` WHERE `entry` = 4195 AND `item` IN (4536, 4537, 4538, 4539, 4602, 8953, 16171);
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4195 AND `item` IN (21030, 21033, 21031);

-- Correct Items - Allyndia
DELETE FROM `npc_vendor` WHERE `entry` = 4191 AND `item` IN (4536, 4537, 4538, 4539, 4602, 8953, 16171);
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4191 AND `item` IN (21030, 21033, 21031);

-- Striped Yellowtail - Laird
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4200 AND `item` = 21552;

-- Rune Thread - Gorbold Steelhand
DELETE FROM `npc_vendor` WHERE `entry` = 6301 AND `item` = 14341;

-- Imbued Vial - Gorbold Steelhand
DELETE FROM `npc_vendor` WHERE `entry` = 6301 AND `item` = 18256;

-- Pattern: Murloc Scale Belt - Mavralyn
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4186 AND `item` = 5786;

-- Pattern: Murloc Scale Breastplate - Mavralyn
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4186 AND `item` = 5787;

-- Keen Throwing Knife - Dalmond
DELETE FROM `npc_vendor` WHERE `entry` = 4182 AND `item` = 3107;

-- Sharp Throwing Axe - Dalmond
DELETE FROM `npc_vendor` WHERE `entry` = 4182 AND `item` = 3135;

-- Pattern: Red Woolen Bag - Valdaron
UPDATE `npc_vendor` SET `maxcount` = 3 WHERE `entry` = 4189 AND `item` = 5772;

-- Pattern: Red Linen Bag - Valdaron
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4189 AND `item` = 5771;

-- Pattern: Blue Linen Vest - Valdaron
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4189 AND `item` = 6270;

-- Ashenvale
-- Pattern: Herbalist's Gloves - Harloen Darkweave
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 10800 WHERE `entry` = 6731 AND `item` = 7361;

-- Correct Items - Allyndia
DELETE FROM `npc_vendor` WHERE `entry` = 4191 AND `item` = 16171;
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4191 AND `item` IN (21030, 21033, 21031);

-- Correct Items - Innkeeper Kimlya
DELETE FROM `npc_vendor` WHERE `entry` = 6738 AND `item` IN (4540, 4541, 4542, 4544, 4601, 8950);
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 6738 AND `item` IN (787, 4592, 4593, 4594, 8957, 21552);

-- Blacksmith Hammer - Dalria
DELETE FROM `npc_vendor` WHERE `entry` = 3954 AND `item` = 5956;

-- Formula: Enchant Cloak - Minor Agility - Dalria
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3954 AND `item` = 11039;

-- Formula: Enchant Bracer - Lesser Strength - Dalria
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3954 AND `item` = 11101;

-- Rune Thread - Dalria
DELETE FROM `npc_vendor` WHERE `entry` = 3954 AND `item` = 14341;

-- Imbued Vial - Dalria
DELETE FROM `npc_vendor` WHERE `entry` = 3954 AND `item` = 18256;

-- Clam Meat - Haljan Oakheart
DELETE FROM `npc_vendor` WHERE `entry` = 3962 AND `item` = 5503;

-- Balanced Throwing Dagger - Haljan Oakheart
DELETE FROM `npc_vendor` WHERE `entry` = 3962 AND `item` = 2946;

-- Weighted Throwing Axe -  Haljan Oakheart
DELETE FROM `npc_vendor` WHERE `entry` = 3962 AND `item` = 3131;

-- Lesser Healing Potion - Harklan Moongrove
DELETE FROM `npc_vendor` WHERE `entry` = 3956 AND `item` = 858;

-- Dense Shortbow - Bhaldaran Ravenshade
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 3951 AND `item` = 11305;

-- Blacksmith Hammer - Shandrina
DELETE FROM `npc_vendor` WHERE `entry` = 3955 AND `item` = 5956;

-- Rune Thread - Shandrina
DELETE FROM `npc_vendor` WHERE `entry` = 3955 AND `item` = 14341;

-- Imbued Vial - Shandrina
DELETE FROM `npc_vendor` WHERE `entry` = 3955 AND `item` = 18256;

-- Correct Items - Illiyana Moonblaze
DELETE FROM `npc_vendor` WHERE `entry` = 14753 AND `item` IN (159, 1179, 1205, 1645, 1708, 8766, 16166, 16167, 16168, 16169, 16170, 16171);

-- Correct Items - Burkrum
DELETE FROM `npc_vendor` WHERE `entry` = 6028;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(6028, 2417),
(6028, 2418),
(6028, 2419),
(6028, 2420),
(6028, 2421),
(6028, 2422),
(6028, 2448),
(6028, 3891),
(6028, 17189),
(6028, 2148),
(6028, 2149),
(6028, 2150),
(6028, 2151),
(6028, 2152),
(6028, 2153),
(6028, 2446),
(6028, 17192);

-- Darnassus
-- Copper Rod - Chardryn
DELETE FROM `npc_vendor` WHERE `entry` = 4216 AND `item` = 6217;

-- Strong Fishing Pole - Voloren
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4222 AND `item` = 6365;

-- Striped Yellowtail - Talaelar
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 4221 AND `item` = 21552;

-- Lesser Mana Potion - Ulthir
DELETE FROM `npc_vendor` WHERE `entry` = 4226 AND `item` = 3385;

-- Lesser Healing Potion - Ulthir
DELETE FROM `npc_vendor` WHERE `entry` = 4226 AND `item` = 858;

-- Rune Thread - Mythrin'dir 
DELETE FROM `npc_vendor` WHERE `entry` = 4229 AND `item` = 14341;

-- Imbued Vial - Mythrin'dir 
DELETE FROM `npc_vendor` WHERE `entry` = 4229 AND `item` = 18256;

-- Correct Items - Mythrin'dir 
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4229, 2605),
(4229, 6260),
(4229, 6529),
(4229, 2324);

-- Correct Items - Mydrannul
DELETE FROM `npc_vendor` WHERE `entry` = 4241;
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4241, 1179),
(4241, 2515),
(4241, 2519),
(4241, 4498),
(4241, 2946),
(4241, 3131),
(4241, 159),
(4241, 2512),
(4241, 2516),
(4241, 4470),
(4241, 4471),
(4241, 4496),
(4241, 5042),
(4241, 2947),
(4241, 3111);

-- Correct Items - Ariyell Skyshadow
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4203, 15327),
(4203, 3131),
(4203, 2947),
(4203, 3135),
(4203, 3107),
(4203, 3108),
(4203, 15326),
(4203, 3137),
(4203, 3111),
(4203, 2946);

-- Moonberry Juice - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 1645;

-- Sweet Nectar - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 1708;

-- Accurate Slugs - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 11284;

-- Jagged Arrow - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 11285;

-- Wicked Throwing Dagger - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 15327;

-- Gleaming Throwing Axe - Ellandrieth
DELETE FROM `npc_vendor` WHERE `entry` = 4170 AND `item` = 15326;

-- Correct Items - Ellandrieth
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(4170, 5048),
(4170, 1179);

-- Moonbglade
-- Balanced Throwing Dagger - Daeolyn Summerleaf
DELETE FROM `npc_vendor` WHERE `entry` = 12021 AND `item` = 2946;

-- Weighted Throwing Axe - Daeolyn Summerleaf 
DELETE FROM `npc_vendor` WHERE `entry` = 12021 AND `item` = 3131;

-- Rune Thread - Lorelae Wintersong 
DELETE FROM `npc_vendor` WHERE `entry` = 12022 AND `item` = 14341;

-- Imbued Vial - Lorelae Wintersong 
DELETE FROM `npc_vendor` WHERE `entry` = 12022 AND `item` = 18256;

-- Winterspring
-- Balanced Throwing Dagger - Natheril Raincaller
DELETE FROM `npc_vendor` WHERE `entry` = 2084 AND `item` = 2946;

-- Weighted Throwing Axe - Natheril Raincaller
DELETE FROM `npc_vendor` WHERE `entry` = 2084 AND `item` = 3131;

-- Blacksmith Hammer - Syurana
DELETE FROM `npc_vendor` WHERE `entry` = 3779 AND `item` = 5956;

-- Rune Thread - Syurana
DELETE FROM `npc_vendor` WHERE `entry` = 3779 AND `item` = 14341;

-- Imbued Vial - Syurana
DELETE FROM `npc_vendor` WHERE `entry` = 3779 AND `item` = 18256;

-- Correct Items - Lyranne Feathersong
DELETE FROM `npc_vendor` WHERE `entry` = 2303 AND `item` = 16171;
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 2303 AND `item` IN (21030, 21033, 21031);

-- Blacksmith Hammer - Qia
DELETE FROM `npc_vendor` WHERE `entry` = 11189 AND `item` = 5956;

-- Rune Thread - Qia
DELETE FROM `npc_vendor` WHERE `entry` = 11189 AND `item` = 14341;

-- Imbued Vial - Qia
DELETE FROM `npc_vendor` WHERE `entry` = 11189 AND `item` = 18256;

-- Missing Items - Xizzer Fizzbolt
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(11185, 4389, 1, 10800),
(11185, 4371, 2, 10800),
(11185, 4361, 2, 10800);

-- Felwood
-- Correct Items - Malygen
DELETE FROM `npc_vendor` WHERE `entry` = 2803 AND `item` IN (4607, 8948, 4604, 8766, 4608, 4605, 4606, 2946, 3131);

-- Correct Items - Mylini Frostmoon 
UPDATE `npc_vendor` SET `maxcount` = 0, `incrtime` = 0 WHERE `entry` = 15315;

-- Balanced Throwing Dagger - Bale 
DELETE FROM `npc_vendor` WHERE `entry` = 2806 AND `item` = 2946;

-- Weighted Throwing Axe - Bale 
DELETE FROM `npc_vendor` WHERE `entry` = 2806 AND `item` = 3131;

-- Correct Items - Gorn One Eye
INSERT INTO `npc_vendor` (`entry`, `item`) VALUES
(11555, 3135),
(11555, 3107),
(11555, 3137),
(11555, 3108),
(11555, 15327),
(11555, 15326);

-- Azshara
-- Correct Items - Brinna Valanaar 
DELETE FROM `npc_vendor` WHERE `entry` = 14301 AND `item` IN (2504, 2505, 2506, 2507);
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 14301 AND `item` = 11305;

-- Missing Items - Jubie Gadgetspring
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(8678, 4389, 1, 10800),
(8678, 4382, 1, 10800),
(8678, 4371, 2, 10800),
(8678, 4404, 3, 10800),
(8678, 4363, 2, 10800),
(8678, 4361, 2, 10800);

-- Blacksmith Hammer - Blimo Gadgetspring 
DELETE FROM `npc_vendor` WHERE `entry` = 12957 AND `item` = 5956;

-- Rune Thread - Blimo Gadgetspring
DELETE FROM `npc_vendor` WHERE `entry` = 12957 AND `item` = 14341;

-- Imbued Vial - Blimo Gadgetspring
DELETE FROM `npc_vendor` WHERE `entry` = 12957 AND `item` = 18256;

-- Dustwallow Marsh
-- Dense Shortbow - Jensen Farran
UPDATE `npc_vendor` SET `maxcount` = 1, `incrtime` = 7200 WHERE `entry` = 4892 AND `item` = 11305;

-- Balanced Throwing Dagger - Charity Mipsy
DELETE FROM `npc_vendor` WHERE `entry` = 4896 AND `item` = 2946;

-- Weighted Throwing Axe - Charity Mipsy
DELETE FROM `npc_vendor` WHERE `entry` = 4896 AND `item` = 3131;

-- Bleach - Helenia Olden
DELETE FROM `npc_vendor` WHERE `entry` = 4897 AND `item` = 2324;

-- Blacksmith Hammer - Helenia Olden
DELETE FROM `npc_vendor` WHERE `entry` = 4897 AND `item` = 5956;

-- Rune Thread - Helenia Olden
DELETE FROM `npc_vendor` WHERE `entry` = 4897 AND `item` = 14341;

-- Imbued Vial - Helenia Olden
DELETE FROM `npc_vendor` WHERE `entry` = 4897 AND `item` = 18256;

-- Scroll of Intellect 2 - Balai Lok'Wein
UPDATE `npc_vendor` SET `maxcount` = 2 WHERE `entry` = 13476 AND `item` = 2290;

-- Missing Items - Balai Lok'Wein
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(13476, 1711, 2, 7200),
(13476, 1478, 2, 7200),
(13476, 1712, 2, 7200),
(13476, 3385, 3, 7200),
(13476, 954, 2, 7200);

-- Missing Items - Zanara
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`) VALUES
(9552, 11305, 1, 7200);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
