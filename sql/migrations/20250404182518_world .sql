DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250404182518');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250404182518');
-- Add your query below.

-- Corrected factions according to 1.8 sniffs

UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 324; 	-- Small Thorium Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 1731; 	-- Copper Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 1732; 	-- Tin Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 1733; 	-- Silver Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 1734; 	-- Gold Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 1735; 	-- Iron Deposit
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 2040; 	-- Mithril Deposit
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 2047; 	-- Truesilver Deposit
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 2054; 	-- Tin Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 2055; 	-- Copper Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 2653; 	-- Lesser Bloodstone Deposit
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 2883; 	-- Ripe Pumpkin
UPDATE `gameobject_template` SET `faction` = 83 WHERE `entry` = 3238; 	-- Chen's Empty Keg
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 3702; 	-- Armor Crate
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 13965;	-- Factory Door
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 75297; 	-- Large Iron Bound Chest
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 97700; -- Secret Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 104600; -- High Inquisitor's Door
UPDATE `gameobject_template` SET `faction` = 102 WHERE `entry` = 105569; -- Silver Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 123310; 	-- Ooze Covered Mithril Deposit
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 123848; 	-- Ooze Covered Thorium Vein
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 131978; -- Large Mithril Bound Chest
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 161557; -- Milly's Harvest
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 165658; 	-- Dark Iron Deposit
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 170561; 	-- Supply Room Door
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 175404; 	-- Rich Thorium Vein
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175528; -- Doodad_DarkIronBrazier01
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175529; -- Doodad_DarkIronBrazier02
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175530; -- Doodad_DarkIronBrazier03
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175531; -- Doodad_DarkIronBrazier04
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175532; -- Doodad_DarkIronBrazier05
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 175533; -- Doodad_DarkIronBrazier06
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 176112; -- Malor's Strongbox
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 176146; -- Gate of Ahn'Qiraj
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 176188; 	-- Ritual Candle
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 176392; -- Scourge Cauldron
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 176393; -- Scourge Cauldron
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 176643; 	-- Small Thorium Vein
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 176645; 	-- Mithril Deposit
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 176694; -- Gate
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 176751; -- Kodo Bones
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 176752; -- Kodo Bones
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 176905; -- Smoldering Brazier
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 176906; -- Smoldering Brazier
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 177000; -- Hot Coal
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 177220; -- Crumble Wall
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 177257; -- Doodad_DireMaulCrystalGenerator02
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 177258; -- Doodad_DireMaulCrystalGenerator03
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 177259; -- Doodad_DireMaulCrystalGenerator01
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 177388; 	-- Ooze Covered Rich Thorium Vein
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 178224; -- Dire Pool
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179502; -- Doodad_CorruptedCrystalVine01
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179503; -- Doodad_DireMaulBossForceField01
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179504; -- Doodad_DireMaulCrystalGenerator04
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179505; -- Doodad_DireMaulCrystalGenerator05
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179506; -- Doodad_DiremaulMagicVortex01


-- Corrected factions according to Classic sniffs

UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 153463;
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (179669, 179670, 179671); -- Warlock Mount Quest Symbol 1-3
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179681; -- Dreadsteed Portal
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 179697; -- Arena Treasure Chest
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179899; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 179907; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180144; -- Food Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180145; -- Food Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180146; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180147; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180148; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 0 WHERE `entry` = 180215; 	-- Hakkari Thorium Vein
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180252; -- Troll Hero Lightning
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180253; -- Troll Hero Air Portal
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180254; -- Troll Hero Fire Portal
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180362; -- Food Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180376; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180377; -- Food Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180378; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180379; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180380; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180381; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180382; -- Berserk Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180383; -- Food Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180384; -- Speed Buff
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180385; -- Troll Hero Portal Sound
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (180421, 180422, 180423); -- Alliance/Horde/Neutral Banner Aura, Large
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180424; -- Alterac Valley Gate
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180434; -- Bonfire
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180514; -- Glyphed Crystal Prism
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180604; -- Merithra's Wake
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180606; -- Prismatic Barrier
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180607; -- Ancient Roots
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180608; -- Glyphs of Warding
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (180634, 180635, 180636); -- Door
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 180654; -- Hardpacked Snowdrift
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 180690; -- Large Scarab Coffer
UPDATE `gameobject_template` SET `faction` = 94 WHERE `entry` = 180691; -- Scarab Coffer
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180698; -- Party Table
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180755; -- Dwarf Hero
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180756; -- Gnome Hero
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180757; -- Human Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180758; -- Night Elf Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180759; -- Orc Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180760; -- Forsaken Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180761; -- Tauren Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180762; -- Troll Hero Portrait
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (180769, 180770); -- Lights
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180788; -- AQDOORSOUND
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180795; -- Sandworm Base
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180810; -- Resonating Crystal Formation
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 180811; -- Resonating Crystal Formation Glow
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181071; -- Firecrackers
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181120; -- Gluth - Exit Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181123; -- Patchwork - Exit Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181124; -- Vaccuum - Enter Gate
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181125; -- Vaccuum - Exit Gate
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` IN (181168, 181169); -- Icebellow Furnace
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181170; -- Vaccuum - Combat Gate
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181197; -- Maexxna - Inner Web Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181200; -- Noth - Entry Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181201; -- Noth - Exit Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181202; -- Heigan the Unclean - Entry Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181203; -- Heigan the Unclean - Exit Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181209; -- Maexxna - Outer Web Door
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181210; -- Deathknight Wing Eye Portal Ramp
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181211; -- Plague Wing Eye Portal Ramp
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181212; -- Spider Wing Eye Portal Ramp
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181213; -- Abom Wing Eye Portal Ramp
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181227; -- Circle
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181228; -- KelThuzad Door
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181229; -- Portal
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181230; -- Deathknight Wing Eye Portal Boss
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181231; -- Plague Wing Eye Portal Boss
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181232; -- Abom Wing Eye Portal Boss
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181233; -- Spider Wing Eye Portal Boss
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181235; -- Grand Widow Faerlina - Web
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181240; -- Loatheb Fight Door 01 (not used)
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181241; -- Loatheb - Entrance Door
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181242; -- Loatheb Fight Door 02 (not used)
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181243; -- Loatheb Fight Door 03 (not used)
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181247; -- Ice Block
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181300; -- Standing, Large
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181356; -- Sapphiron Birth
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` IN (181402, 181403, 181404, 181405); -- Doodad_kelthuzad_window_portal01-04
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181444; -- Kel'Thuzad Trigger
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181477; -- Doodad_nox_tesla05
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181478; -- Doodad_nox_tesla06
UPDATE `gameobject_template` SET `faction` = 114 WHERE `entry` = 181496; -- Heigan - Exit Door
UPDATE `gameobject_template` SET `faction` = 1375 WHERE `entry` = 181640; -- Doodad_kelthuzad_throne02


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
