DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20250802133158');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20250802133158');
-- Add your query below.


-- Duskwood - Lieutenant Doren
UPDATE `creature_template` SET `spell_list_id`=4690 WHERE `entry`=469;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (4690, 'Duskwood - Lieutenant Doren');
-- Spell: Piercing Howl (23600) (charm)
UPDATE `creature_spells` SET `spellId_1`=23600, `castTarget_1`=1, `delayInitialMin_1`=11, `delayInitialMax_1`=16, `delayRepeatMin_1`=11, `delayRepeatMax_1`=16 WHERE `entry`=4690;

-- Stranglethorn Vale - Sin'Dall
UPDATE `creature_template` SET `spell_list_id`=7290 WHERE `entry`=729;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (7290, 'Stranglethorn Vale - Sin\'Dall');
-- Spell: Knockdown (5164) (cast)
UPDATE `creature_spells` SET `spellId_1`=5164, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=10, `delayRepeatMin_1`=14, `delayRepeatMax_1`=15 WHERE `entry`=7290;

-- Stranglethorn Vale - Bookie Herod
UPDATE `creature_template` SET `spell_list_id`=8150 WHERE `entry`=815;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (8150, 'Stranglethorn Vale - Bookie Herod');
-- Spell: Summon Syndicate Spectre (3722) (cast)
UPDATE `creature_spells` SET `spellId_1`=3722, `castTarget_1`=1, `delayInitialMin_1`=11, `delayInitialMax_1`=11, `delayRepeatMin_1`=11, `delayRepeatMax_1`=11 WHERE `entry`=8150;
-- Spell: Shadow Bolt (20816) (cast)
UPDATE `creature_spells` SET `spellId_2`=20816, `castTarget_2`=1, `delayInitialMin_2`=24, `delayInitialMax_2`=24, `delayRepeatMin_2`=24, `delayRepeatMax_2`=24 WHERE `entry`=8150;

-- Darnassus - Keras Wolfheart
UPDATE `creature_template` SET `spell_list_id`=9070 WHERE `entry`=907;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (9070, 'Darnassus - Keras Wolfheart');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=6, `delayInitialMax_1`=12, `delayRepeatMin_1`=12, `delayRepeatMax_1`=13 WHERE `entry`=9070;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=14, `delayInitialMax_2`=15, `delayRepeatMin_2`=14, `delayRepeatMax_2`=15 WHERE `entry`=9070;

-- Stranglethorn Vale - Ana'thek the Cruel
UPDATE `creature_template` SET `spell_list_id`=10590 WHERE `entry`=1059;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (10590, 'Stranglethorn Vale - Ana\'thek the Cruel');
-- Spell: Execute (7160) (charm)
UPDATE `creature_spells` SET `spellId_1`=7160, `castTarget_1`=1, `delayInitialMin_1`=20, `delayInitialMax_1`=20, `delayRepeatMin_1`=20, `delayRepeatMax_1`=20 WHERE `entry`=10590;
-- Spell: Head Crack (9791) (cast)
UPDATE `creature_spells` SET `spellId_2`=9791, `castTarget_2`=1, `delayInitialMin_2`=7, `delayInitialMax_2`=19, `delayRepeatMin_2`=14, `delayRepeatMax_2`=38 WHERE `entry`=10590;

-- Stranglethorn Vale - Gan'zulah
UPDATE `creature_template` SET `spell_list_id`=10610 WHERE `entry`=1061;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (10610, 'Stranglethorn Vale - Gan\'zulah');
-- Spell: Enrage (8599) (cast)
UPDATE `creature_spells` SET `spellId_1`=8599, `castTarget_1`=0, `delayInitialMin_1`=9, `delayInitialMax_1`=35, `delayRepeatMin_1`=9, `delayRepeatMax_1`=35 WHERE `entry`=10610;

-- Stranglethorn Vale - Gorlash
UPDATE `creature_template` SET `spell_list_id`=14920 WHERE `entry`=1492;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (14920, 'Stranglethorn Vale - Gorlash');
-- Spell: Trample (5568) (cast)
UPDATE `creature_spells` SET `spellId_1`=5568, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=13, `delayRepeatMin_1`=7, `delayRepeatMax_1`=13 WHERE `entry`=14920;

-- Stranglethorn Vale - Silverback Patriarch
UPDATE `creature_template` SET `spell_list_id`=15580 WHERE `entry`=1558;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (15580, 'Stranglethorn Vale - Silverback Patriarch');
-- Spell: Backhand (6253) (cast)
UPDATE `creature_spells` SET `spellId_1`=6253, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=8, `delayRepeatMin_1`=19, `delayRepeatMax_1`=19 WHERE `entry`=15580;

-- Western Plaguelands - Decaying Horror
UPDATE `creature_template` SET `spell_list_id`=18130, `script_name`='' WHERE `entry`=1813;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (18130, 'Western Plaguelands - Decaying Horror');
-- Spell: Decay (17052) (cast)
UPDATE `creature_spells` SET `spellId_1`=17052, `castTarget_1`=0, `delayInitialMin_1`=0, `delayInitialMax_1`=7, `delayRepeatMin_1`=2, `delayRepeatMax_1`=5 WHERE `entry`=18130;

-- Western Plaguelands - Venom Mist Lurker
UPDATE `creature_template` SET `auras`='10022' WHERE `entry`=1822;

-- Western Plaguelands - Plague Lurker
UPDATE `creature_template` SET `auras`='8247', `script_name`='' WHERE `entry`=1824;

-- Eastern Plaguelands - Tirion Fordring
UPDATE `creature_template` SET `spell_list_id`=18550 WHERE `entry`=1855;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (18550, 'Eastern Plaguelands - Tirion Fordring');
-- Spell: Devotion Aura (8258) (cast)
UPDATE `creature_spells` SET `spellId_1`=8258, `castTarget_1`=0, `delayInitialMin_1`=0, `delayInitialMax_1`=5, `delayRepeatMin_1`=240, `delayRepeatMax_1`=240 WHERE `entry`=18550;
-- Spell: Hammer of Justice (13005) (cast)
UPDATE `creature_spells` SET `spellId_2`=13005, `castTarget_2`=1, `delayInitialMin_2`=8, `delayInitialMax_2`=14, `delayRepeatMin_2`=8, `delayRepeatMax_2`=14 WHERE `entry`=18550;
-- Spell: Holy Light (15493) (cast)
UPDATE `creature_spells` SET `spellId_3`=15493, `castTarget_3`=17, `delayInitialMin_3`=13, `delayInitialMax_3`=13, `delayRepeatMin_3`=13, `delayRepeatMax_3`=13 WHERE `entry`=18550;
-- Spell: Exorcism (17149) (cast)
UPDATE `creature_spells` SET `spellId_4`=17149, `castTarget_4`=1, `delayInitialMin_4`=5, `delayInitialMax_4`=6, `delayRepeatMin_4`=14, `delayRepeatMax_4`=15 WHERE `entry`=18550;

-- Silverpine Forest - Moonrage Elder
UPDATE `creature_template` SET `spell_list_id`=18960 WHERE `entry`=1896;
REPLACE INTO `creature_spells` (`entry`, `name`) VALUES (18960, 'Silverpine Forest - Moonrage Elder');
-- Spell: Shadow Word: Pain (594) (cast)
UPDATE `creature_spells` SET `spellId_1`=594, `castTarget_1`=1, `castFlags_1`=32, `delayInitialMin_1`=0, `delayInitialMax_1`=10, `delayRepeatMin_1`=1, `delayRepeatMax_1`=10 WHERE `entry`=18960;
-- Spell: Lesser Heal (2053) (charm)
UPDATE `creature_spells` SET `spellId_2`=2053, `castTarget_2`=17, `delayInitialMin_2`=15, `delayInitialMax_2`=15, `delayRepeatMin_2`=15, `delayRepeatMax_2`=15 WHERE `entry`=18960;

-- Teldrassil - Webwood Venomfang
UPDATE `creature_template` SET `auras`='11959', `script_name`='' WHERE `entry`=1999;

-- Teldrassil - Giant Webwood Spider
UPDATE `creature_template` SET `auras`='11959', `script_name`='' WHERE `entry`=2001;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (20010, 'Teldrassil - Giant Webwood Spider');

-- Enraged Stanley
UPDATE `creature_template` SET `spell_list_id`=22750 WHERE `entry`=2275;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (22750, 'Enraged Stanley');
-- Spell: Savage Rage (3258) (cast)
UPDATE `creature_spells` SET `spellId_1`=3258, `castTarget_1`=0, `delayInitialMin_1`=14, `delayInitialMax_1`=15, `delayRepeatMin_1`=14, `delayRepeatMax_1`=15 WHERE `entry`=22750;

-- Darnassus - Aethalas
UPDATE `creature_template` SET `spell_list_id`=23020 WHERE `entry`=2302;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (23020, 'Darnassus - Aethalas');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=6, `delayInitialMax_1`=15, `delayRepeatMin_1`=11, `delayRepeatMax_1`=11 WHERE `entry`=23020;

-- Arathi Highlands - Burning Exile
UPDATE `creature_template` SET `auras`='11966' WHERE `entry`=2760;

-- Barrens - Sergra Darkthorn
UPDATE `creature_template` SET `spell_list_id`=33380 WHERE `entry`=3338;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (33380, 'Barrens - Sergra Darkthorn');
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_1`=16856, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=9, `delayRepeatMin_1`=9, `delayRepeatMax_1`=9 WHERE `entry`=33380;

-- Barrens - Gesharahan
UPDATE `creature_template` SET `auras`='3417 10022', `script_name`='' WHERE `entry`=3398;

-- Barrens - Devouring Ectoplasm
UPDATE `creature_template` SET `spell_list_id`=36380 WHERE `entry`=3638;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (36380, 'Barrens - Devouring Ectoplasm');
-- Spell: Clone (7952) (cast)
UPDATE `creature_spells` SET `spellId_1`=7952, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=17, `delayRepeatMin_1`=6, `delayRepeatMax_1`=17 WHERE `entry`=36380;


-- Shadowfang Keep - Deathstalker Adamant
UPDATE `creature_template` SET `spell_list_id`=38490 WHERE `entry`=3849;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (38490, 'Shadowfang Keep - Deathstalker Adamant');
-- Spell: Gouge (13579) (cast)
UPDATE `creature_spells` SET `spellId_1`=13579, `castTarget_1`=1, `delayInitialMin_1`=22, `delayInitialMax_1`=23, `delayRepeatMin_1`=22, `delayRepeatMax_1`=23 WHERE `entry`=38490;

-- Orgrimmar - Brakgul Deathbringer
UPDATE `creature_template` SET `spell_list_id`=38900 WHERE `entry`=3890;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (38900, 'Orgrimmar - Brakgul Deathbringer');
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_1`=16856, `castTarget_1`=1, `delayInitialMin_1`=12, `delayInitialMax_1`=13, `delayRepeatMin_1`=12, `delayRepeatMax_1`=13 WHERE `entry`=38900;

-- Barrens - Minor Water Guardian
UPDATE `creature_template` SET `auras`='6488 6498' WHERE `entry`=3950;

-- Dustwallow Marsh - Searing Hatchling
UPDATE `creature_template` SET `auras`='11966' WHERE `entry`=4323;

-- Dustwallow Marsh - Bloodfen Scytheclaw
UPDATE `creature_template` SET `spell_list_id`=43550 WHERE `entry`=4355;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (43550, 'Dustwallow Marsh - Bloodfen Scytheclaw');
-- Spell: Rend Flesh (3147) (cast)
UPDATE `creature_spells` SET `spellId_1`=3147, `castTarget_1`=1, `delayInitialMin_1`=13, `delayInitialMax_1`=15, `delayRepeatMin_1`=20, `delayRepeatMax_1`=20 WHERE `entry`=43550;

-- Dustwallow Marsh - Darkmist Lurker (auras 7939 22766)
UPDATE `creature_template` SET `spell_list_id`=43770 WHERE `entry`=4377;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (43770, 'Dustwallow Marsh - Darkmist Lurker');
-- Spell: Poison (744) (cast)
UPDATE `creature_spells` SET `spellId_1`=744, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=20, `delayRepeatMin_1`=25, `delayRepeatMax_1`=26 WHERE `entry`=43770;

-- Dustwallow Marsh - Withervine Bark Ripper
UPDATE `creature_template` SET `spell_list_id`=43860 WHERE `entry`=4386;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (43860, 'Dustwallow Marsh - Withervine Bark Ripper');
-- Spell: Pierce Armor (6016) (cast)
UPDATE `creature_spells` SET `spellId_1`=6016, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=10, `delayRepeatMin_1`=9, `delayRepeatMax_1`=10 WHERE `entry`=43860;

-- Dustwallow Marsh - Darkfang Lurker (auras 7939 22766)
UPDATE `creature_template` SET `spell_list_id`=44110 WHERE `entry`=4411;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (44110, 'Dustwallow Marsh - Darkfang Lurker');
-- Spell: Poison (744) (cast)
UPDATE `creature_spells` SET `spellId_1`=744, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=16, `delayRepeatMin_1`=21, `delayRepeatMax_1`=21 WHERE `entry`=44110;

-- Dustwallow Marsh - Darkfang Spider
UPDATE `creature_template` SET `spell_list_id`=44130, `script_name`='' WHERE `entry`=4413;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (44130, 'Dustwallow Marsh - Darkfang Spider');
-- Spell: Poison (744) (cast)
UPDATE `creature_spells` SET `spellId_1`=744, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=17, `delayRepeatMin_1`=6, `delayRepeatMax_1`=17 WHERE `entry`=44130;

-- Desolace - Mana Eater
UPDATE `creature_template` SET `spell_list_id`=46780, `script_name`='' WHERE `entry`=4678;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (46780, 'Desolace - Mana Eater');
-- Spell: Mana Burn (8131) (charm)
UPDATE `creature_spells` SET `spellId_1`=8131, `castTarget_1`=1, `delayInitialMin_1`=10, `delayInitialMax_1`=10, `delayRepeatMin_1`=10, `delayRepeatMax_1`=10 WHERE `entry`=46780;

-- Darnassus - Brogun Stoneshield
UPDATE `creature_template` SET `spell_list_id`=51180 WHERE `entry`=5118;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (51180, 'Darnassus - Brogun Stoneshield');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=8, `delayInitialMax_1`=9, `delayRepeatMin_1`=19, `delayRepeatMax_1`=19 WHERE `entry`=51180;

-- The Temple of Atal'Hakkar - Murk Slitherer
UPDATE `creature_template` SET `auras`='3616', `script_name`='' WHERE `entry`=5224;

-- The Temple of Atal'Hakkar - Fungal Ooze
UPDATE `creature_template` SET `auras`='12002' WHERE `entry`=5235;

-- Undercity - Undercity Guardian (auras 12187)
UPDATE `creature_template` SET `spell_list_id`=56240 WHERE `entry`=5624;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (56240, 'Undercity - Undercity Guardian');
-- Spell: Execute (7160) (cast)
UPDATE `creature_spells` SET `spellId_1`=7160, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=12, `delayRepeatMin_1`=30, `delayRepeatMax_1`=40 WHERE `entry`=56240;

-- Barrens - Swinegart Spearhide (auras 7165)
UPDATE `creature_template` SET `spell_list_id`=58640, `script_name`='' WHERE `entry`=5864;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (58640, 'Barrens - Swinegart Spearhide');
-- Spell: Pierce Armor (6016) (cast)
UPDATE `creature_spells` SET `spellId_1`=6016, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=8, `delayRepeatMin_1`=8, `delayRepeatMax_1`=8 WHERE `entry`=58640;

-- Blasted Lands - Portal Seeker
UPDATE `creature_template` SET `spell_list_id`=59810 WHERE `entry`=5981;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (59810, 'Blasted Lands - Portal Seeker');
-- Spell: Arcane Explosion (11975) (charm)
UPDATE `creature_spells` SET `spellId_1`=11975, `castTarget_1`=1, `delayInitialMin_1`=11, `delayInitialMax_1`=24, `delayRepeatMin_1`=11, `delayRepeatMax_1`=24 WHERE `entry`=59810;
-- Spell: Frostbolt (20822) (cast)
UPDATE `creature_spells` SET `spellId_2`=20822, `castTarget_2`=1, `delayInitialMin_2`=2, `delayInitialMax_2`=4, `delayRepeatMin_2`=3, `delayRepeatMax_2`=4 WHERE `entry`=59810;

-- Blackfathom Deeps - Aqua Guardian
UPDATE `creature_template` SET `spell_list_id`=60470 WHERE `entry`=6047;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (60470, 'Blackfathom Deeps - Aqua Guardian');
-- Spell: Frost Nova (865) (cast)
UPDATE `creature_spells` SET `spellId_1`=865, `castTarget_1`=1, `delayInitialMin_1`=10, `delayInitialMax_1`=28, `delayRepeatMin_1`=10, `delayRepeatMax_1`=28 WHERE `entry`=60470;

-- Azshara - Blue Scalebane
UPDATE `creature_template` SET `auras`='12556' WHERE `entry`=6130;

-- Azshara - Arkkoran Muckdweller
UPDATE `creature_template` SET `auras`='11964' WHERE `entry`=6136;

-- Azshara - Cliff Breaker
UPDATE `creature_template` SET `auras`='12552' WHERE `entry`=6146;

-- Un'Goro Crater - Living Blaze
UPDATE `creature_template` SET `auras`='11966' WHERE `entry`=6521;

-- Redridge Mountains - Arantir
UPDATE `creature_template` SET `spell_list_id`=70090 WHERE `entry`=7009;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (70090, 'Redridge Mountains - Arantir');
-- Spell: Arantir's Anger (9733) (charm)
UPDATE `creature_spells` SET `spellId_1`=9733, `castTarget_1`=0, `delayInitialMin_1`=6, `delayInitialMax_1`=6, `delayRepeatMin_1`=6, `delayRepeatMax_1`=6 WHERE `entry`=70090;

-- Felwood - Infernal Sentry (auras 8279)
UPDATE `creature_template` SET `auras`='11966 8278 8279', `script_name`='' WHERE `entry`=7136;

-- Thunder Bluff - Taim Ragetotem
UPDATE `creature_template` SET `spell_list_id`=74270 WHERE `entry`=7427;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (74270, 'Thunder Bluff - Taim Ragetotem');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=7, `delayInitialMax_1`=7, `delayRepeatMin_1`=7, `delayRepeatMax_1`=7 WHERE `entry`=74270;
-- Spell: Cleave (15284) (cast)
UPDATE `creature_spells` SET `spellId_2`=15284, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=7, `delayRepeatMin_2`=6, `delayRepeatMax_2`=7 WHERE `entry`=74270;

-- Winterspring - Frostsaber Stalker (auras 6408)
UPDATE `creature_template` SET `auras`='7939 22766' WHERE `entry`=7432;

-- Winterspring - Hederine Manastalker
UPDATE `creature_template` SET `spell_list_id`=74620 WHERE `entry`=7462;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (74620, 'Winterspring - Hederine Manastalker');
-- Spell: Rend (13738) (cast)
UPDATE `creature_spells` SET `spellId_1`=13738, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=6, `delayRepeatMin_1`=4, `delayRepeatMax_1`=18 WHERE `entry`=74620;
-- Spell: Mana Burn (15980) (cast)
UPDATE `creature_spells` SET `spellId_2`=15980, `castTarget_2`=1, `delayInitialMin_2`=8, `delayInitialMax_2`=14, `delayRepeatMin_2`=8, `delayRepeatMax_2`=9 WHERE `entry`=74620;

-- Loch Modan - Thelsamar Mountaineer
UPDATE `creature_template` SET `spell_list_id`=80550 WHERE `entry`=8055;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (80550, 'Loch Modan - Thelsamar Mountaineer');
-- Spell: Shoot (6660) (cast)
UPDATE `creature_spells` SET `spellId_1`=6660, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=9, `delayRepeatMin_1`=1, `delayRepeatMax_1`=7 WHERE `entry`=80550;

-- Searing Gorge - Rekk'tilac
UPDATE `creature_template` SET `auras`='11966 10022' WHERE `entry`=8277;

-- Searing Gorge - Faulty War Golem
UPDATE `creature_template` SET `auras`='13320' WHERE `entry`=8279;

-- Blasted Lands - Infernal Servant
UPDATE `creature_template` SET `auras`='12743' WHERE `entry`=8616;

-- Blackrock Depths - Warbringer Construct
UPDATE `creature_template` SET `spell_list_id`=89050 WHERE `entry`=8905;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (89050, 'Blackrock Depths - Warbringer Construct');
-- Spell: Skull Crack (15621) (cast)
UPDATE `creature_spells` SET `spellId_1`=15621, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=27, `delayRepeatMin_1`=22, `delayRepeatMax_1`=32 WHERE `entry`=89050;

-- Searing Gorge - The Behemoth
UPDATE `creature_template` SET `auras`='742' WHERE `entry`=8924;

-- Blackrock Mountain - Scarshield Sentry
UPDATE `creature_template` SET `spell_list_id`=90440, `script_name`='' WHERE `entry`=9044;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (90440, 'Blackrock Mountain - Scarshield Sentry');
-- Spell: Shoot (6660) (cast)
UPDATE `creature_spells` SET `spellId_1`=6660, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=10, `delayRepeatMin_1`=1, `delayRepeatMax_1`=9 WHERE `entry`=90440;
-- Spell: Multi-Shot (14443) (charm)
UPDATE `creature_spells` SET `spellId_2`=14443, `castTarget_2`=1, `delayInitialMin_2`=11, `delayInitialMax_2`=18, `delayRepeatMin_2`=11, `delayRepeatMax_2`=18 WHERE `entry`=90440;
-- Spell: Slowing Poison (14897) (charm)
UPDATE `creature_spells` SET `spellId_3`=14897, `castTarget_3`=1, `delayInitialMin_3`=27, `delayInitialMax_3`=43, `delayRepeatMin_3`=27, `delayRepeatMax_3`=43 WHERE `entry`=90440;

-- Blackrock Depths - Twilight's Hammer Executioner
UPDATE `creature_template` SET `spell_list_id`=93980 WHERE `entry`=9398;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (93980, 'Blackrock Depths - Twilight\'s Hammer Executioner');
-- Spell: Battle Fury (3631) (cast)
UPDATE `creature_spells` SET `spellId_1`=3631, `castTarget_1`=0, `delayInitialMin_1`=6, `delayInitialMax_1`=11, `delayRepeatMin_1`=6, `delayRepeatMax_1`=11 WHERE `entry`=93980;
-- Spell: Decimate (13459) (cast)
UPDATE `creature_spells` SET `spellId_2`=13459, `castTarget_2`=1, `delayInitialMin_2`=9, `delayInitialMax_2`=16, `delayRepeatMin_2`=9, `delayRepeatMax_2`=16 WHERE `entry`=93980;

-- Blackrock Depths - Spawn of Bael'Gar
UPDATE `creature_template` SET `auras`='15650' WHERE `entry`=9436;

-- Un'Goro Crater - Gargantuan Ooze
UPDATE `creature_template` SET `spell_list_id`=96210 WHERE `entry`=9621;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (96210, 'Un\'Goro Crater - Gargantuan Ooze');
-- Spell: Clone (14146) (cast)
UPDATE `creature_spells` SET `spellId_1`=14146, `castTarget_1`=1, `delayInitialMin_1`=26, `delayInitialMax_1`=27, `delayRepeatMin_1`=26, `delayRepeatMax_1`=27 WHERE `entry`=96210;
-- Spell: Slowing Ooze (16050) (cast)
UPDATE `creature_spells` SET `spellId_2`=16050, `castTarget_2`=1, `delayInitialMin_2`=23, `delayInitialMax_2`=23, `delayRepeatMin_2`=23, `delayRepeatMax_2`=23 WHERE `entry`=96210;

-- Blackrock Depths - Ograbisi
UPDATE `creature_template` SET `spell_list_id`=96770 WHERE `entry`=9677;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (96770, 'Blackrock Depths - Ograbisi');
-- Spell: Crowd Pummel (10887) (cast)
UPDATE `creature_spells` SET `spellId_1`=10887, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=19, `delayRepeatMin_1`=9, `delayRepeatMax_1`=10 WHERE `entry`=96770;

-- Blackrock Depths - Shill Dinger
UPDATE `creature_template` SET `spell_list_id`=96780, `script_name`='' WHERE `entry`=9678;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (96780, 'Blackrock Depths - Shill Dinger');
-- Spell: Banish (8994) (cast)
UPDATE `creature_spells` SET `spellId_1`=8994, `castTarget_1`=1, `delayInitialMin_1`=14, `delayInitialMax_1`=14, `delayRepeatMin_1`=14, `delayRepeatMax_1`=14 WHERE `entry`=96780;
-- Spell: Shadow Shield (12040) (cast)
UPDATE `creature_spells` SET `spellId_2`=12040, `castTarget_2`=0, `delayInitialMin_2`=9, `delayInitialMax_2`=10, `delayRepeatMin_2`=9, `delayRepeatMax_2`=10 WHERE `entry`=96780;
-- Spell: Shadow Bolt (15472) (cast)
UPDATE `creature_spells` SET `spellId_3`=15472, `castTarget_3`=1, `delayInitialMin_3`=5, `delayInitialMax_3`=5, `delayRepeatMin_3`=3, `delayRepeatMax_3`=4 WHERE `entry`=96780;

-- Blackrock Depths - Jaz
UPDATE `creature_template` SET `spell_list_id`=96810 WHERE `entry`=9681;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (96810, 'Blackrock Depths - Jaz');
-- Spell: Bloodlust (6742) (cast)
UPDATE `creature_spells` SET `spellId_1`=6742, `castTarget_1`=19, `delayInitialMin_1`=10, `delayInitialMax_1`=11, `delayRepeatMin_1`=10, `delayRepeatMax_1`=11 WHERE `entry`=96810;
-- Spell: Snap Kick (15618) (cast)
UPDATE `creature_spells` SET `spellId_2`=15618, `castTarget_2`=1, `delayInitialMin_2`=19, `delayInitialMax_2`=20, `delayRepeatMin_2`=19, `delayRepeatMax_2`=20 WHERE `entry`=96810;

-- Un'Goro Crater - Gorishi Hive Queen
UPDATE `creature_template` SET `auras`='8601' WHERE `entry`=10041;

-- Winterspring - Grizzle Snowpaw
UPDATE `creature_template` SET `spell_list_id`=101990 WHERE `entry`=10199;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (101990, 'Winterspring - Grizzle Snowpaw');
-- Spell: Blizzard (8364) (charm)
UPDATE `creature_spells` SET `spellId_1`=8364, `castTarget_1`=1, `delayInitialMin_1`=5, `delayInitialMax_1`=9, `delayRepeatMin_1`=5, `delayRepeatMax_1`=9 WHERE `entry`=101990;
-- Spell: Frost Shock (12548) (charm)
UPDATE `creature_spells` SET `spellId_2`=12548, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=15, `delayRepeatMin_2`=6, `delayRepeatMax_2`=15 WHERE `entry`=101990;
-- Spell: Maul (15793) (charm)
UPDATE `creature_spells` SET `spellId_3`=15793, `castTarget_3`=1, `delayInitialMin_3`=3, `delayInitialMax_3`=8, `delayRepeatMin_3`=3, `delayRepeatMax_3`=8 WHERE `entry`=101990;

-- Thunder Bluff - Kergul Bloodaxe
UPDATE `creature_template` SET `spell_list_id`=103600 WHERE `entry`=10360;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (103600, 'Thunder Bluff - Kergul Bloodaxe');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=11, `delayInitialMax_1`=12, `delayRepeatMin_1`=11, `delayRepeatMax_1`=12 WHERE `entry`=103600;
-- Spell: Cleave (15284) (cast)
UPDATE `creature_spells` SET `spellId_2`=15284, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=7, `delayRepeatMin_2`=6, `delayRepeatMax_2`=7 WHERE `entry`=103600;

-- Scholomance - Splintered Skeleton
UPDATE `creature_template` SET `auras`='11838' WHERE `entry`=10478;

-- Western Plaguelands - Fetid Zombie
UPDATE `creature_template` SET `auras`='8713' WHERE `entry`=10580;

-- Mulgore - Hulfnar Stonetotem
UPDATE `creature_template` SET `spell_list_id`=105990 WHERE `entry`=10599;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (105990, 'Mulgore - Hulfnar Stonetotem');
-- Spell: War Stomp (16740) (cast)
UPDATE `creature_spells` SET `spellId_1`=16740, `castTarget_1`=1, `delayInitialMin_1`=24, `delayInitialMax_1`=24, `delayRepeatMin_1`=13, `delayRepeatMax_1`=13 WHERE `entry`=105990;

-- Mulgore - Thontek Rumblehoof
UPDATE `creature_template` SET `spell_list_id`=106000 WHERE `entry`=10600;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (106000, 'Mulgore - Thontek Rumblehoof');
-- Spell: War Stomp (16740) (cast)
UPDATE `creature_spells` SET `spellId_1`=16740, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=8, `delayRepeatMin_1`=8, `delayRepeatMax_1`=8 WHERE `entry`=106000;

-- Balnazzar
UPDATE `creature_template` SET `spell_list_id`=108130, `script_name`='' WHERE `entry`=10813;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (108130, 'Balnazzar');
-- Spell: Sleep (12098) (cast)
UPDATE `creature_spells` SET `spellId_1`=12098, `castTarget_1`=1, `delayInitialMin_1`=31, `delayInitialMax_1`=47, `delayRepeatMin_1`=10, `delayRepeatMax_1`=19 WHERE `entry`=108130;
-- Spell: Psychic Scream (13704) (cast)
UPDATE `creature_spells` SET `spellId_2`=13704, `castTarget_2`=1, `delayInitialMin_2`=49, `delayInitialMax_2`=61, `delayRepeatMin_2`=28, `delayRepeatMax_2`=28 WHERE `entry`=108130;
-- Spell: Mind Blast (17287) (cast)
UPDATE `creature_spells` SET `spellId_3`=17287, `castTarget_3`=1, `delayInitialMin_3`=31, `delayInitialMax_3`=32, `delayRepeatMin_3`=6, `delayRepeatMax_3`=26 WHERE `entry`=108130;
-- Spell: Shadow Shock (17399) (cast)
UPDATE `creature_spells` SET `spellId_4`=17399, `castTarget_4`=1, `delayInitialMin_4`=28, `delayInitialMax_4`=39, `delayRepeatMin_4`=7, `delayRepeatMax_4`=22 WHERE `entry`=108130;
-- Spell: Domination (17405) (cast)
UPDATE `creature_spells` SET `spellId_5`=17405, `castTarget_5`=1, `delayInitialMin_5`=38, `delayInitialMax_5`=57, `delayRepeatMin_5`=27, `delayRepeatMax_5`=28 WHERE `entry`=108130;

-- Thousand Needles - Arnak Grimtotem
UPDATE `creature_template` SET `spell_list_id`=108960 WHERE `entry`=10896;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (108960, 'Thousand Needles - Arnak Grimtotem');
-- Spell: Uppercut (10966) (charm)
UPDATE `creature_spells` SET `spellId_1`=10966, `castTarget_1`=1, `delayInitialMin_1`=11, `delayInitialMax_1`=11, `delayRepeatMin_1`=11, `delayRepeatMax_1`=11 WHERE `entry`=108960;
-- Spell: Rend (11977) (charm)
UPDATE `creature_spells` SET `spellId_2`=11977, `castTarget_2`=1, `delayInitialMin_2`=7, `delayInitialMax_2`=7, `delayRepeatMin_2`=7, `delayRepeatMax_2`=7 WHERE `entry`=108960;

-- Zul'Gurub - Hakkari Blood Priest
UPDATE `creature_template` SET `spell_list_id`=113400, `script_name`='' WHERE `entry`=11340;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (113400, 'Zul\'Gurub - Hakkari Blood Priest');
-- Spell: Dispel Magic (17201) (cast)
UPDATE `creature_spells` SET `spellId_1`=17201, `castTarget_1`=16, `delayInitialMin_1`=3, `delayInitialMax_1`=12, `delayRepeatMin_1`=6, `delayRepeatMax_1`=18 WHERE `entry`=113400;
-- Spell: Blood Funnel (24617) (cast)
UPDATE `creature_spells` SET `spellId_2`=24617, `castTarget_2`=19, `delayInitialMin_2`=4, `delayInitialMax_2`=19, `delayRepeatMin_2`=12, `delayRepeatMax_2`=23 WHERE `entry`=113400;
-- Spell: Drain Life (24618) (cast)
UPDATE `creature_spells` SET `spellId_3`=24618, `castTarget_3`=1, `delayInitialMin_3`=6, `delayInitialMax_3`=27, `delayRepeatMin_3`=19, `delayRepeatMax_3`=19 WHERE `entry`=113400;

-- Dire Maul - Wildspawn Shadowstalker (auras 8601 18950 22766)
UPDATE `creature_template` SET `spell_list_id`=114560, `auras`='8601 18950 7939 22766' WHERE `entry`=11456;

-- Silithus - Hive'Zora Reaver
UPDATE `creature_template` SET `spell_list_id`=117280 WHERE `entry`=11728;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (117280, 'Silithus - Hive\'Zora Reaver');
-- Spell: Knockdown (16790) (cast)
UPDATE `creature_spells` SET `spellId_1`=16790, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=15, `delayRepeatMin_1`=6, `delayRepeatMax_1`=11 WHERE `entry`=117280;
-- Spell: Cleave (17685) (cast)
UPDATE `creature_spells` SET `spellId_2`=17685, `castTarget_2`=1, `delayInitialMin_2`=3, `delayInitialMax_2`=22, `delayRepeatMin_2`=8, `delayRepeatMax_2`=9 WHERE `entry`=117280;

-- Silithus - Desert Rumbler
UPDATE `creature_template` SET `spell_list_id`=117460 WHERE `entry`=11746;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (117460, 'Silithus - Desert Rumbler');
-- Spell: Trample (5568) (cast)
UPDATE `creature_spells` SET `spellId_1`=5568, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=14, `delayRepeatMin_1`=6, `delayRepeatMax_1`=14 WHERE `entry`=117460;

-- Undercity - Ganoosh
UPDATE `creature_template` SET `spell_list_id`=117500 WHERE `entry`=11750;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (117500, 'Undercity - Ganoosh');
-- Spell: Decayed Strength (6951) (charm)
UPDATE `creature_spells` SET `spellId_1`=6951, `castTarget_1`=1, `delayInitialMin_1`=25, `delayInitialMax_1`=28, `delayRepeatMin_1`=25, `delayRepeatMax_1`=28 WHERE `entry`=117500;

-- Western Plaguelands - Spectral Attendant
UPDATE `creature_template` SET `spell_list_id`=118730, `script_name`='' WHERE `entry`=11873;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (118730, 'Western Plaguelands - Spectral Attendant');
-- Spell: Cripple (11443) (cast)
-- WARNING: Triggered by Cripple (12552)
UPDATE `creature_spells` SET `spellId_1`=11443, `castTarget_1`=1, `delayInitialMin_1`=10, `delayInitialMax_1`=35, `delayRepeatMin_1`=10, `delayRepeatMax_1`=35 WHERE `entry`=118730;
-- Spell: Mana Burn (11981) (cast)
UPDATE `creature_spells` SET `spellId_2`=11981, `castTarget_2`=1, `delayInitialMin_2`=9, `delayInitialMax_2`=26, `delayRepeatMin_2`=12, `delayRepeatMax_2`=22 WHERE `entry`=118730;
-- Spell: Mind Blast (13860) (cast)
UPDATE `creature_spells` SET `spellId_3`=13860, `castTarget_3`=1, `delayInitialMin_3`=7, `delayInitialMax_3`=31, `delayRepeatMin_3`=9, `delayRepeatMax_3`=26 WHERE `entry`=118730;

-- Alterac Valley - Alliance Sentinel
UPDATE `creature_template` SET `spell_list_id`=120480 WHERE `entry`=12048;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (120480, 'Alterac Valley - Alliance Sentinel');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=5, `delayInitialMax_1`=34, `delayRepeatMin_1`=9, `delayRepeatMax_1`=25 WHERE `entry`=120480;
-- Spell: Kick (11978) (cast)
UPDATE `creature_spells` SET `spellId_2`=11978, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=28, `delayRepeatMin_2`=6, `delayRepeatMax_2`=28 WHERE `entry`=120480;
-- Spell: Cleave (15663) (cast)
UPDATE `creature_spells` SET `spellId_3`=15663, `castTarget_3`=1, `delayInitialMin_3`=2, `delayInitialMax_3`=22, `delayRepeatMin_3`=9, `delayRepeatMax_3`=30 WHERE `entry`=120480;

-- Alterac Valley - Frostwolf Warrior
UPDATE `creature_template` SET `spell_list_id`=120520 WHERE `entry`=12052;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (120520, 'Alterac Valley - Frostwolf Warrior');
-- Spell: Enrage (8599) (cast)
UPDATE `creature_spells` SET `spellId_1`=8599, `castTarget_1`=0, `delayInitialMin_1`=4, `delayInitialMax_1`=49, `delayRepeatMin_1`=4, `delayRepeatMax_1`=49 WHERE `entry`=120520;
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_2`=11976, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=30, `delayRepeatMin_2`=7, `delayRepeatMax_2`=29 WHERE `entry`=120520;

-- Thunder Bluff - Martin Lindsey
UPDATE `creature_template` SET `spell_list_id`=121980 WHERE `entry`=12198;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (121980, 'Thunder Bluff - Martin Lindsey');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=9, `delayInitialMax_1`=10, `delayRepeatMin_1`=9, `delayRepeatMax_1`=10 WHERE `entry`=121980;

-- Ashenvale - Splintertree Raider
UPDATE `creature_template` SET `spell_list_id`=128590 WHERE `entry`=12859;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (128590, 'Ashenvale - Splintertree Raider');
-- Spell: Enrage (8599) (cast)
UPDATE `creature_spells` SET `spellId_1`=8599, `castTarget_1`=0, `delayInitialMin_1`=2, `delayInitialMax_1`=29, `delayRepeatMin_1`=2, `delayRepeatMax_1`=29 WHERE `entry`=128590;
-- Spell: Shield Bash (11972) (cast)
UPDATE `creature_spells` SET `spellId_2`=11972, `castTarget_2`=1, `delayInitialMin_2`=12, `delayInitialMax_2`=14, `delayRepeatMin_2`=12, `delayRepeatMax_2`=14 WHERE `entry`=128590;

-- Alterac Valley - Lieutenant Grummus
UPDATE `creature_template` SET `spell_list_id`=131450 WHERE `entry`=13145;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (131450, 'Alterac Valley - Lieutenant Grummus');
-- Spell: Mortal Strike (15708) (cast)
UPDATE `creature_spells` SET `spellId_1`=15708, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=38, `delayRepeatMin_1`=9, `delayRepeatMax_1`=25 WHERE `entry`=131450;

-- Alterac Valley - Lieutenant Murp
UPDATE `creature_template` SET `spell_list_id`=131460 WHERE `entry`=13146;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (131460, 'Alterac Valley - Lieutenant Murp');
-- Spell: Mortal Strike (15708) (cast)
UPDATE `creature_spells` SET `spellId_1`=15708, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=23, `delayRepeatMin_1`=9, `delayRepeatMax_1`=14 WHERE `entry`=131460;

-- Eastern Plaguelands - Discordant Surge
UPDATE `creature_template` SET `spell_list_id`=132790, `auras`='16563' WHERE `entry`=13279;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (132790, 'Eastern Plaguelands - Discordant Surge');
-- Spell: Mighty Blow (14099) (cast)
UPDATE `creature_spells` SET `spellId_1`=14099, `castTarget_1`=1, `delayInitialMin_1`=5, `delayInitialMax_1`=15, `delayRepeatMin_1`=6, `delayRepeatMax_1`=19 WHERE `entry`=132790;

-- Alterac Valley - Seasoned Guardsman
UPDATE `creature_template` SET `spell_list_id`=133240 WHERE `entry`=13324;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133240, 'Alterac Valley - Seasoned Guardsman');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=26, `delayRepeatMin_1`=8, `delayRepeatMax_1`=16 WHERE `entry`=133240;
-- Spell: Charge (22120) (cast)
UPDATE `creature_spells` SET `spellId_2`=22120, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=15, `delayRepeatMin_2`=21, `delayRepeatMax_2`=32 WHERE `entry`=133240;

-- Alterac Valley - Seasoned Mountaineer
UPDATE `creature_template` SET `spell_list_id`=133250 WHERE `entry`=13325;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133250, 'Alterac Valley - Seasoned Mountaineer');
-- Spell: Explosive Shot (15495) (cast)
UPDATE `creature_spells` SET `spellId_1`=15495, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=26, `delayRepeatMin_1`=14, `delayRepeatMax_1`=24 WHERE `entry`=133250;
-- Spell: Shoot (15547) (cast)
UPDATE `creature_spells` SET `spellId_2`=15547, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=4, `delayRepeatMin_2`=2, `delayRepeatMax_2`=10 WHERE `entry`=133250;

-- Alterac Valley - Seasoned Sentinel
UPDATE `creature_template` SET `spell_list_id`=133270 WHERE `entry`=13327;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133270, 'Alterac Valley - Seasoned Sentinel');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=30, `delayRepeatMin_1`=10, `delayRepeatMax_1`=26 WHERE `entry`=133270;
-- Spell: Kick (11978) (cast)
UPDATE `creature_spells` SET `spellId_2`=11978, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=28, `delayRepeatMin_2`=9, `delayRepeatMax_2`=26 WHERE `entry`=133270;
-- Spell: Cleave (15663) (cast)
UPDATE `creature_spells` SET `spellId_3`=15663, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=15, `delayRepeatMin_3`=14, `delayRepeatMax_3`=29 WHERE `entry`=133270;

-- Alterac Valley - Seasoned Legionnaire
UPDATE `creature_template` SET `spell_list_id`=133290 WHERE `entry`=13329;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133290, 'Alterac Valley - Seasoned Legionnaire');
-- Spell: Rend (11977) (cast)
UPDATE `creature_spells` SET `spellId_1`=11977, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=24, `delayRepeatMin_1`=6, `delayRepeatMax_1`=22 WHERE `entry`=133290;

-- Alterac Valley - Veteran Guardsman
UPDATE `creature_template` SET `spell_list_id`=133330 WHERE `entry`=13333;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133330, 'Alterac Valley - Veteran Guardsman');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=28, `delayRepeatMin_1`=5, `delayRepeatMax_1`=18 WHERE `entry`=133330;
-- Spell: Charge (22120) (cast)
UPDATE `creature_spells` SET `spellId_2`=22120, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=12, `delayRepeatMin_2`=20, `delayRepeatMax_2`=31 WHERE `entry`=133330;

-- Alterac Valley - Veteran Legionnaire
UPDATE `creature_template` SET `spell_list_id`=133340 WHERE `entry`=13334;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133340, 'Alterac Valley - Veteran Legionnaire');
-- Spell: Rend (11977) (cast)
UPDATE `creature_spells` SET `spellId_1`=11977, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=26, `delayRepeatMin_1`=16, `delayRepeatMax_1`=24 WHERE `entry`=133340;

-- Alterac Valley - Veteran Mountaineer
UPDATE `creature_template` SET `spell_list_id`=133350 WHERE `entry`=13335;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133350, 'Alterac Valley - Veteran Mountaineer');
-- Spell: Explosive Shot (15495) (cast)
UPDATE `creature_spells` SET `spellId_1`=15495, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=33, `delayRepeatMin_1`=17, `delayRepeatMax_1`=28 WHERE `entry`=133350;
-- Spell: Shoot (15547) (cast)
UPDATE `creature_spells` SET `spellId_2`=15547, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=4, `delayRepeatMin_2`=2, `delayRepeatMax_2`=12 WHERE `entry`=133350;

-- Alterac Valley - Veteran Sentinel
UPDATE `creature_template` SET `spell_list_id`=133360 WHERE `entry`=13336;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133360, 'Alterac Valley - Veteran Sentinel');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=10, `delayInitialMax_1`=24, `delayRepeatMin_1`=10, `delayRepeatMax_1`=24 WHERE `entry`=133360;
-- Spell: Kick (11978) (cast)
UPDATE `creature_spells` SET `spellId_2`=11978, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=32, `delayRepeatMin_2`=6, `delayRepeatMax_2`=6 WHERE `entry`=133360;
-- Spell: Cleave (15663) (cast)
UPDATE `creature_spells` SET `spellId_3`=15663, `castTarget_3`=1, `delayInitialMin_3`=3, `delayInitialMax_3`=16, `delayRepeatMin_3`=23, `delayRepeatMax_3`=24 WHERE `entry`=133360;

-- Alterac Valley - Veteran Warrior
UPDATE `creature_template` SET `spell_list_id`=133370 WHERE `entry`=13337;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (133370, 'Alterac Valley - Veteran Warrior');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=9, `delayRepeatMin_1`=8, `delayRepeatMax_1`=9 WHERE `entry`=133370;

-- Alterac Valley - Champion Guardsman
UPDATE `creature_template` SET `spell_list_id`=134240 WHERE `entry`=13424;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (134240, 'Alterac Valley - Champion Guardsman');
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_1`=11976, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=22, `delayRepeatMin_1`=8, `delayRepeatMax_1`=8 WHERE `entry`=134240;
-- Spell: Charge (22120) (cast)
UPDATE `creature_spells` SET `spellId_2`=22120, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=15, `delayRepeatMin_2`=20, `delayRepeatMax_2`=39 WHERE `entry`=134240;

-- Alterac Valley - Champion Legionnaire
UPDATE `creature_template` SET `spell_list_id`=134250 WHERE `entry`=13425;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (134250, 'Alterac Valley - Champion Legionnaire');
-- Spell: Rend (11977) (cast)
UPDATE `creature_spells` SET `spellId_1`=11977, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=15, `delayRepeatMin_1`=17, `delayRepeatMax_1`=18 WHERE `entry`=134250;

-- Alterac Valley - Champion Mountaineer
UPDATE `creature_template` SET `spell_list_id`=134260 WHERE `entry`=13426;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (134260, 'Alterac Valley - Champion Mountaineer');
-- Spell: Explosive Shot (15495) (cast)
UPDATE `creature_spells` SET `spellId_1`=15495, `castTarget_1`=1, `delayInitialMin_1`=20, `delayInitialMax_1`=21, `delayRepeatMin_1`=20, `delayRepeatMax_1`=21 WHERE `entry`=134260;
-- Spell: Shoot (15547) (cast)
UPDATE `creature_spells` SET `spellId_2`=15547, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=9, `delayRepeatMin_2`=3, `delayRepeatMax_2`=6 WHERE `entry`=134260;

-- Alterac Valley - Champion Warrior
UPDATE `creature_template` SET `spell_list_id`=134280 WHERE `entry`=13428;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (134280, 'Alterac Valley - Champion Warrior');
-- Spell: Enrage (8599) (cast)
UPDATE `creature_spells` SET `spellId_1`=8599, `castTarget_1`=0, `delayInitialMin_1`=10, `delayInitialMax_1`=19, `delayRepeatMin_1`=10, `delayRepeatMax_1`=19 WHERE `entry`=134280;
-- Spell: Strike (11976) (cast)
UPDATE `creature_spells` SET `spellId_2`=11976, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=19, `delayRepeatMin_2`=6, `delayRepeatMax_2`=19 WHERE `entry`=134280;

-- Maraudon - The Nameless Prophet
UPDATE `creature_template` SET `spell_list_id`=137180 WHERE `entry`=13718;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137180, 'Maraudon - The Nameless Prophet');
-- Spell: Earth Shock (15501) (charm)
UPDATE `creature_spells` SET `spellId_1`=15501, `castTarget_1`=1, `delayInitialMin_1`=5, `delayInitialMax_1`=10, `delayRepeatMin_1`=5, `delayRepeatMax_1`=10 WHERE `entry`=137180;
-- Spell: Festering Rash (15848) (charm)
UPDATE `creature_spells` SET `spellId_2`=15848, `castTarget_2`=1, `delayInitialMin_2`=16, `delayInitialMax_2`=29, `delayRepeatMin_2`=16, `delayRepeatMax_2`=29 WHERE `entry`=137180;
-- Spell: Curse of Blood (16098) (charm)
UPDATE `creature_spells` SET `spellId_3`=16098, `castTarget_3`=1, `delayInitialMin_3`=15, `delayInitialMax_3`=29, `delayRepeatMin_3`=15, `delayRepeatMax_3`=29 WHERE `entry`=137180;

-- Magra
UPDATE `creature_template` SET `spell_list_id`=137400 WHERE `entry`=13740;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137400, 'Magra');
-- Spell: Battle Shout (9128) (cast)
UPDATE `creature_spells` SET `spellId_1`=9128, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=11, `delayRepeatMin_1`=12, `delayRepeatMax_1`=18 WHERE `entry`=137400;
-- Spell: Sunder Armor (15572) (cast)
UPDATE `creature_spells` SET `spellId_2`=15572, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=8, `delayRepeatMin_2`=5, `delayRepeatMax_2`=12 WHERE `entry`=137400;

-- Maraudon - Gelk
UPDATE `creature_template` SET `spell_list_id`=137410 WHERE `entry`=13741;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137410, 'Maraudon - Gelk');
-- Spell: Hamstring (9080) (cast)
UPDATE `creature_spells` SET `spellId_1`=9080, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=12, `delayRepeatMin_1`=8, `delayRepeatMax_1`=8 WHERE `entry`=137410;
-- Spell: Cleave (15284) (cast)
UPDATE `creature_spells` SET `spellId_2`=15284, `castTarget_2`=1, `delayInitialMin_2`=13, `delayInitialMax_2`=14, `delayRepeatMin_2`=8, `delayRepeatMax_2`=8 WHERE `entry`=137410;
-- Spell: Cleave (15663) (cast)
UPDATE `creature_spells` SET `spellId_3`=15663, `castTarget_3`=1, `delayInitialMin_3`=5, `delayInitialMax_3`=7, `delayRepeatMin_3`=5, `delayRepeatMax_3`=7 WHERE `entry`=137410;

-- Maraudon - Kolk
UPDATE `creature_template` SET `spell_list_id`=137420 WHERE `entry`=13742;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137420, 'Maraudon - Kolk');
-- Spell: Strike (14516) (cast)
UPDATE `creature_spells` SET `spellId_1`=14516, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=12, `delayRepeatMin_1`=5, `delayRepeatMax_1`=12 WHERE `entry`=137420;
-- Spell: Demoralizing Shout (16244) (cast)
UPDATE `creature_spells` SET `spellId_2`=16244, `castTarget_2`=1, `delayInitialMin_2`=3, `delayInitialMax_2`=15, `delayRepeatMin_2`=43, `delayRepeatMax_2`=43 WHERE `entry`=137420;

-- Alterac Mountains - Corporal Teeka Bloodsnarl
UPDATE `creature_template` SET `spell_list_id`=137760 WHERE `entry`=13776;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137760, 'Alterac Mountains - Corporal Teeka Bloodsnarl');
-- Spell: Rend (11977) (cast)
UPDATE `creature_spells` SET `spellId_1`=11977, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=4, `delayRepeatMin_1`=3, `delayRepeatMax_1`=4 WHERE `entry`=137760;

-- Alterac Mountains - Sergeant Durgen Stormpike (auras 5301)
UPDATE `creature_template` SET `spell_list_id`=137770 WHERE `entry`=13777;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (137770, 'Alterac Mountains - Sergeant Durgen Stormpike');
-- Spell: Shield Block (12169) (cast)
UPDATE `creature_spells` SET `spellId_1`=12169, `castTarget_1`=0, `delayInitialMin_1`=8, `delayInitialMax_1`=8, `delayRepeatMin_1`=8, `delayRepeatMax_1`=8 WHERE `entry`=137770;

-- Dun Morogh - Thief Catcher Shadowdelve
UPDATE `creature_template` SET `spell_list_id`=143630, `script_name`='' WHERE `entry`=14363;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (143630, 'Dun Morogh - Thief Catcher Shadowdelve');
-- Spell: Hooked Net (14030) (cast)
UPDATE `creature_spells` SET `spellId_1`=14030, `castTarget_1`=1, `delayInitialMin_1`=5, `delayInitialMax_1`=5, `delayRepeatMin_1`=5, `delayRepeatMax_1`=5 WHERE `entry`=143630;

-- Dun Morogh - Thief Catcher Farmountain
UPDATE `creature_template` SET `spell_list_id`=143650, `script_name`='' WHERE `entry`=14365;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (143650, 'Dun Morogh - Thief Catcher Farmountain');
-- Spell: Hooked Net (14030) (cast)
UPDATE `creature_spells` SET `spellId_1`=14030, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=1, `delayRepeatMin_1`=1, `delayRepeatMax_1`=1 WHERE `entry`=143650;

-- Thunder Bluff - Hunter Sagewind (auras 18950)
UPDATE `creature_template` SET `spell_list_id`=144400, `script_name`='' WHERE `entry`=14440;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (144400, 'Thunder Bluff - Hunter Sagewind');
-- Spell: Hooked Net (14030) (charm)
UPDATE `creature_spells` SET `spellId_1`=14030, `castTarget_1`=1, `delayInitialMin_1`=15, `delayInitialMax_1`=20, `delayRepeatMin_1`=15, `delayRepeatMax_1`=20 WHERE `entry`=144400;
-- Spell: Sunder Armor (15572) (charm)
UPDATE `creature_spells` SET `spellId_2`=15572, `castTarget_2`=1, `delayInitialMin_2`=18, `delayInitialMax_2`=26, `delayRepeatMin_2`=18, `delayRepeatMax_2`=26 WHERE `entry`=144400;

-- Eastern Plaguelands - Scourge Archer
UPDATE `creature_template` SET `spell_list_id`=144890 WHERE `entry`=14489;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (144890, 'Eastern Plaguelands - Scourge Archer');
-- Spell: Shoot (23073) (cast)
UPDATE `creature_spells` SET `spellId_1`=23073, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=3, `delayRepeatMin_1`=1, `delayRepeatMax_1`=4 WHERE `entry`=144890;

-- Feralas - Zapped Land Walker
UPDATE `creature_template` SET `spell_list_id`=146040 WHERE `entry`=14604;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (146040, 'Feralas - Zapped Land Walker');
-- Spell: Boulder (23391) (cast)
UPDATE `creature_spells` SET `spellId_1`=23391, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=3, `delayRepeatMin_1`=2, `delayRepeatMax_1`=5 WHERE `entry`=146040;

-- Feralas - Zapped Cliff Giant
UPDATE `creature_template` SET `spell_list_id`=146400 WHERE `entry`=14640;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (146400, 'Feralas - Zapped Cliff Giant');
-- Spell: War Stomp (45) (cast)
UPDATE `creature_spells` SET `spellId_1`=45, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=15, `delayRepeatMin_1`=8, `delayRepeatMax_1`=15 WHERE `entry`=146400;

-- Barrens - Horde Elite
UPDATE `creature_template` SET `spell_list_id`=147170 WHERE `entry`=14717;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (147170, 'Barrens - Horde Elite');
-- Spell: Shield Bash (11972) (cast)
UPDATE `creature_spells` SET `spellId_1`=11972, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=12, `delayRepeatMin_1`=4, `delayRepeatMax_1`=12 WHERE `entry`=147170;
-- Spell: Cleave (22540) (cast)
UPDATE `creature_spells` SET `spellId_2`=22540, `castTarget_2`=1, `delayInitialMin_2`=10, `delayInitialMax_2`=12, `delayRepeatMin_2`=10, `delayRepeatMax_2`=12 WHERE `entry`=147170;

-- Barrens - Kelm Hargunth
UPDATE `creature_template` SET `spell_list_id`=147540 WHERE `entry`=14754;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (147540, 'Barrens - Kelm Hargunth');
-- Spell: Backhand (6253) (cast)
UPDATE `creature_spells` SET `spellId_1`=6253, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=4, `delayRepeatMin_1`=3, `delayRepeatMax_1`=4 WHERE `entry`=147540;

-- Zul'Gurub - Razzashi Skitterer
UPDATE `creature_template` SET `auras`='11838' WHERE `entry`=14880;

-- Zul'Gurub - Parasitic Serpent
UPDATE `creature_template` SET `auras`='23867' WHERE `entry`=14884;

-- Orgrimmar - Kartra Bloodsnarl
UPDATE `creature_template` SET `spell_list_id`=149420 WHERE `entry`=14942;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (149420, 'Orgrimmar - Kartra Bloodsnarl');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=13, `delayInitialMax_1`=13, `delayRepeatMin_1`=13, `delayRepeatMax_1`=13 WHERE `entry`=149420;
-- Spell: Cleave (15284) (cast)
UPDATE `creature_spells` SET `spellId_2`=15284, `castTarget_2`=1, `delayInitialMin_2`=7, `delayInitialMax_2`=10, `delayRepeatMin_2`=7, `delayRepeatMax_2`=10 WHERE `entry`=149420;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_3`=16856, `castTarget_3`=1, `delayInitialMin_3`=10, `delayInitialMax_3`=10, `delayRepeatMin_3`=10, `delayRepeatMax_3`=10 WHERE `entry`=149420;

-- Stormwind City - Elfarran
UPDATE `creature_template` SET `spell_list_id`=149810 WHERE `entry`=14981;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (149810, 'Stormwind City - Elfarran');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=5, `delayInitialMax_1`=5, `delayRepeatMin_1`=5, `delayRepeatMax_1`=5 WHERE `entry`=149810;
-- Spell: Cleave (15284) (cast)
UPDATE `creature_spells` SET `spellId_2`=15284, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=7, `delayRepeatMin_2`=6, `delayRepeatMax_2`=7 WHERE `entry`=149810;

-- Ironforge - Lylandris
UPDATE `creature_template` SET `spell_list_id`=149820 WHERE `entry`=14982;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (149820, 'Ironforge - Lylandris');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=9, `delayInitialMax_1`=10, `delayRepeatMin_1`=9, `delayRepeatMax_1`=10 WHERE `entry`=149820;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=17, `delayInitialMax_2`=18, `delayRepeatMin_2`=17, `delayRepeatMax_2`=18 WHERE `entry`=149820;

-- Stormwind City - Lady Hoteshem
UPDATE `creature_template` SET `spell_list_id`=150080 WHERE `entry`=15008;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (150080, 'Stormwind City - Lady Hoteshem');
-- Spell: Whirlwind (13736) (cast)
UPDATE `creature_spells` SET `spellId_1`=13736, `castTarget_1`=0, `delayInitialMin_1`=5, `delayInitialMax_1`=5, `delayRepeatMin_1`=5, `delayRepeatMax_1`=5 WHERE `entry`=150080;

-- Stranglethorn Vale - Booty Bay Elite
UPDATE `creature_template` SET `spell_list_id`=150880 WHERE `entry`=15088;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (150880, 'Stranglethorn Vale - Booty Bay Elite');
-- Spell: Shoot (23337) (cast)
UPDATE `creature_spells` SET `spellId_1`=23337, `castTarget_1`=1, `castFlags_1`=16, `delayInitialMin_1`=0, `delayInitialMax_1`=4, `delayRepeatMin_1`=2, `delayRepeatMax_1`=2 WHERE `entry`=150880;

-- Silithus - Aendel Windspear
UPDATE `creature_template` SET `spell_list_id`=152930 WHERE `entry`=15293;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (152930, 'Silithus - Aendel Windspear');
-- Spell: Moonfire (23380) (cast)
UPDATE `creature_spells` SET `spellId_1`=23380, `castTarget_1`=1, `delayInitialMin_1`=20, `delayInitialMax_1`=21, `delayRepeatMin_1`=20, `delayRepeatMax_1`=21 WHERE `entry`=152930;

-- Ruins of Ahn'Qiraj - Major Yeggeth
UPDATE `creature_template` SET `spell_list_id`=153860, `script_name`='' WHERE `entry`=15386;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (153860, 'Ruins of Ahn\'Qiraj - Major Yeggeth');
-- Spell: Cleave (15584) (cast)
UPDATE `creature_spells` SET `spellId_1`=15584, `castTarget_1`=1, `delayInitialMin_1`=14, `delayInitialMax_1`=28, `delayRepeatMin_1`=14, `delayRepeatMax_1`=36 WHERE `entry`=153860;
-- Spell: Sunder Armor (24317) (cast)
UPDATE `creature_spells` SET `spellId_2`=24317, `castTarget_2`=1, `delayInitialMin_2`=12, `delayInitialMax_2`=24, `delayRepeatMin_2`=6, `delayRepeatMax_2`=24 WHERE `entry`=153860;
-- Spell: Shield of Rajaxx (25282) (cast)
UPDATE `creature_spells` SET `spellId_3`=25282, `castTarget_3`=19, `delayInitialMin_3`=11, `delayInitialMax_3`=22, `delayRepeatMin_3`=11, `delayRepeatMax_3`=20 WHERE `entry`=153860;

-- Silithus - Captain Blackanvil
UPDATE `creature_template` SET `spell_list_id`=154400 WHERE `entry`=15440;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (154400, 'Silithus - Captain Blackanvil');
-- Spell: Thunderclap (15548) (cast)
UPDATE `creature_spells` SET `spellId_1`=15548, `castTarget_1`=1, `delayInitialMin_1`=32, `delayInitialMax_1`=33, `delayRepeatMin_1`=32, `delayRepeatMax_1`=33 WHERE `entry`=154400;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=10, `delayRepeatMin_2`=8, `delayRepeatMax_2`=16 WHERE `entry`=154400;

-- Silithus - Janela Stouthammer
UPDATE `creature_template` SET `spell_list_id`=154430 WHERE `entry`=15443;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (154430, 'Silithus - Janela Stouthammer');
-- Spell: Divine Shield (13874) (charm)
UPDATE `creature_spells` SET `spellId_1`=13874, `castTarget_1`=0, `delayInitialMin_1`=32, `delayInitialMax_1`=38, `delayRepeatMin_1`=32, `delayRepeatMax_1`=38 WHERE `entry`=154430;
-- Spell: Crusader Strike (14518) (charm)
UPDATE `creature_spells` SET `spellId_2`=14518, `castTarget_2`=1, `delayInitialMin_2`=4, `delayInitialMax_2`=9, `delayRepeatMin_2`=4, `delayRepeatMax_2`=9 WHERE `entry`=154430;
-- Spell: Holy Light (25263) (charm)
UPDATE `creature_spells` SET `spellId_3`=25263, `castTarget_3`=17, `delayInitialMin_3`=31, `delayInitialMax_3`=40, `delayRepeatMin_3`=31, `delayRepeatMax_3`=40 WHERE `entry`=154430;

-- Silithus - Arcanist Nozzlespring
UPDATE `creature_template` SET `spell_list_id`=154440, `script_name`='' WHERE `entry`=15444;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (154440, 'Silithus - Arcanist Nozzlespring');
-- Spell: Fireball (13375) (charm)
UPDATE `creature_spells` SET `spellId_1`=13375, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=12, `delayRepeatMin_1`=7, `delayRepeatMax_1`=12 WHERE `entry`=154440;
-- Spell: Arcane Missiles (15790) (charm)
UPDATE `creature_spells` SET `spellId_2`=15790, `castTarget_2`=0, `delayInitialMin_2`=10, `delayInitialMax_2`=12, `delayRepeatMin_2`=10, `delayRepeatMax_2`=12 WHERE `entry`=154440;

-- Silithus - Hive'Zora Abomination
UPDATE `creature_template` SET `spell_list_id`=154490, `script_name`='' WHERE `entry`=15449;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (154490, 'Silithus - Hive\'Zora Abomination');
-- Spell: Poison Cloud (25198) (cast)
UPDATE `creature_spells` SET `spellId_1`=25198, `castTarget_1`=1, `delayInitialMin_1`=24, `delayInitialMax_1`=24, `delayRepeatMin_1`=17, `delayRepeatMax_1`=18 WHERE `entry`=154490;
-- Spell: Wings of Despair (25260) (cast)
UPDATE `creature_spells` SET `spellId_2`=25260, `castTarget_2`=1, `delayInitialMin_2`=12, `delayInitialMax_2`=19, `delayRepeatMin_2`=12, `delayRepeatMax_2`=19 WHERE `entry`=154490;

-- Moonglade - Nighthaven Defender
UPDATE `creature_template` SET `spell_list_id`=154950 WHERE `entry`=15495;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (154950, 'Moonglade - Nighthaven Defender');
-- Spell: Shoot (22121) (cast)
UPDATE `creature_spells` SET `spellId_1`=22121, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=7, `delayRepeatMin_1`=3, `delayRepeatMax_1`=4 WHERE `entry`=154950;

-- Ruins of Ahn'Qiraj - Hive'Zara Hatchling
UPDATE `creature_template` SET `auras`='9205' WHERE `entry`=15521;

-- Silithus - Cenarion Outrider
UPDATE `creature_template` SET `spell_list_id`=155450 WHERE `entry`=15545;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (155450, 'Silithus - Cenarion Outrider');
-- Spell: Demoralizing Shout (13730) (charm)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=8, `delayInitialMax_1`=13, `delayRepeatMin_1`=8, `delayRepeatMax_1`=13 WHERE `entry`=155450;

-- Silithus - Merok Longstride
UPDATE `creature_template` SET `spell_list_id`=156130, `script_name`='' WHERE `entry`=15613;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (156130, 'Silithus - Merok Longstride');
-- Spell: Lightning Shield (15507) (charm)
UPDATE `creature_spells` SET `spellId_1`=15507, `castTarget_1`=0, `delayInitialMin_1`=24, `delayInitialMax_1`=24, `delayRepeatMin_1`=30, `delayRepeatMax_1`=32 WHERE `entry`=156130;
-- Spell: Flame Shock (15616) (charm)
UPDATE `creature_spells` SET `spellId_2`=15616, `castTarget_2`=1, `delayInitialMin_2`=7, `delayInitialMax_2`=8, `delayRepeatMin_2`=7, `delayRepeatMax_2`=8 WHERE `entry`=156130;
-- Spell: Healing Wave (15982) (charm)
UPDATE `creature_spells` SET `spellId_3`=15982, `castTarget_3`=17, `delayInitialMin_3`=41, `delayInitialMax_3`=49, `delayRepeatMin_3`=41, `delayRepeatMax_3`=49 WHERE `entry`=156130;

-- Ahn'Qiraj - Yauj Brood
UPDATE `creature_template` SET `spell_list_id`=156210 WHERE `entry`=15621;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (156210, 'Ahn\'Qiraj - Yauj Brood');
-- Spell: Random Aggro (23878) (cast)
UPDATE `creature_spells` SET `spellId_1`=23878, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=0, `delayRepeatMin_1`=0, `delayRepeatMax_1`=0 WHERE `entry`=156210;
-- Spell: Head Butt (25788) (cast)
UPDATE `creature_spells` SET `spellId_2`=25788, `castTarget_2`=1, `delayInitialMin_2`=4, `delayInitialMax_2`=12, `delayRepeatMin_2`=5, `delayRepeatMax_2`=13 WHERE `entry`=156210;

-- Ahn'Qiraj - Vekniss Borer
UPDATE `creature_template` SET `spell_list_id`=156220 WHERE `entry`=15622;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (156220, 'Ahn\'Qiraj - Vekniss Borer');
-- Spell: Random Aggro (22913) (cast)
UPDATE `creature_spells` SET `spellId_1`=22913, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=0, `delayRepeatMin_1`=0, `delayRepeatMax_1`=0 WHERE `entry`=156220;

-- Searing Gorge - Dark Iron Kidnapper
UPDATE `creature_template` SET `spell_list_id`=156920 WHERE `entry`=15692;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (156920, 'Searing Gorge - Dark Iron Kidnapper');
-- Spell: Net (6533) (charm)
UPDATE `creature_spells` SET `spellId_1`=6533, `castTarget_1`=1, `delayInitialMin_1`=20, `delayInitialMax_1`=34, `delayRepeatMin_1`=20, `delayRepeatMax_1`=34 WHERE `entry`=156920;
-- Spell: Rend (11977) (charm)
UPDATE `creature_spells` SET `spellId_2`=11977, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=20, `delayRepeatMin_2`=6, `delayRepeatMax_2`=20 WHERE `entry`=156920;

-- Silithus - Colossal Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=157430, `script_name`='' WHERE `entry`=15743;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157430, 'Silithus - Colossal Anubisath Warbringer');
-- Spell: War Stomp (16727) (cast)
UPDATE `creature_spells` SET `spellId_1`=16727, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=27, `delayRepeatMin_1`=30, `delayRepeatMax_1`=46 WHERE `entry`=157430;
-- Spell: Smash (18944) (cast)
UPDATE `creature_spells` SET `spellId_2`=18944, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=17, `delayRepeatMin_2`=30, `delayRepeatMax_2`=42 WHERE `entry`=157430;
-- Spell: Cleave (19632) (cast)
UPDATE `creature_spells` SET `spellId_3`=19632, `castTarget_3`=1, `delayInitialMin_3`=0, `delayInitialMax_3`=27, `delayRepeatMin_3`=20, `delayRepeatMax_3`=34 WHERE `entry`=157430;

-- Thousand Needles - Qiraji Captain
UPDATE `creature_template` SET `spell_list_id`=157470 WHERE `entry`=15747;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157470, 'Thousand Needles - Qiraji Captain');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=16, `delayRepeatMin_1`=6, `delayRepeatMax_1`=19 WHERE `entry`=157470;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=4, `delayInitialMax_2`=12, `delayRepeatMin_2`=8, `delayRepeatMax_2`=18 WHERE `entry`=157470;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=2, `delayInitialMax_3`=10, `delayRepeatMin_3`=4, `delayRepeatMax_3`=15 WHERE `entry`=157470;

-- Thousand Needles - Lesser Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=157480, `script_name`='' WHERE `entry`=15748;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157480, 'Thousand Needles - Lesser Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=34, `delayRepeatMin_1`=10, `delayRepeatMax_1`=21 WHERE `entry`=157480;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=29, `delayRepeatMin_2`=12, `delayRepeatMax_2`=26 WHERE `entry`=157480;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=23, `delayRepeatMin_3`=6, `delayRepeatMax_3`=16 WHERE `entry`=157480;

-- Thousand Needles - Lesser Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=157490, `script_name`='' WHERE `entry`=15749;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157490, 'Thousand Needles - Lesser Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=17, `delayRepeatMin_1`=12, `delayRepeatMax_1`=25 WHERE `entry`=157490;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=17, `delayRepeatMin_2`=6, `delayRepeatMax_2`=20 WHERE `entry`=157490;

-- Thousand Needles - Qiraji Major
UPDATE `creature_template` SET `spell_list_id`=157500 WHERE `entry`=15750;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157500, 'Thousand Needles - Qiraji Major');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=8, `delayRepeatMin_1`=8, `delayRepeatMax_1`=12 WHERE `entry`=157500;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=9, `delayInitialMax_2`=10, `delayRepeatMin_2`=9, `delayRepeatMax_2`=11 WHERE `entry`=157500;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=16, `delayInitialMax_3`=16, `delayRepeatMin_3`=16, `delayRepeatMax_3`=16 WHERE `entry`=157500;

-- Thousand Needles - Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=157510, `script_name`='' WHERE `entry`=15751;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157510, 'Thousand Needles - Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=9, `delayInitialMax_1`=30, `delayRepeatMin_1`=10, `delayRepeatMax_1`=18 WHERE `entry`=157510;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=4, `delayInitialMax_2`=17, `delayRepeatMin_2`=14, `delayRepeatMax_2`=24 WHERE `entry`=157510;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=30, `delayRepeatMin_3`=6, `delayRepeatMax_3`=18 WHERE `entry`=157510;

-- Thousand Needles - Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=157520, `script_name`='' WHERE `entry`=15752;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157520, 'Thousand Needles - Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=17, `delayRepeatMin_1`=13, `delayRepeatMax_1`=18 WHERE `entry`=157520;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=19, `delayRepeatMin_2`=8, `delayRepeatMax_2`=11 WHERE `entry`=157520;

-- Tanaris - Qiraji Brigadier General
UPDATE `creature_template` SET `spell_list_id`=157530 WHERE `entry`=15753;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157530, 'Tanaris - Qiraji Brigadier General');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=14, `delayRepeatMin_1`=6, `delayRepeatMax_1`=33 WHERE `entry`=157530;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=4, `delayInitialMax_2`=15, `delayRepeatMin_2`=8, `delayRepeatMax_2`=31 WHERE `entry`=157530;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=4, `delayInitialMax_3`=45, `delayRepeatMin_3`=4, `delayRepeatMax_3`=29 WHERE `entry`=157530;

-- Tanaris - Greater Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=157540, `script_name`='' WHERE `entry`=15754;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157540, 'Tanaris - Greater Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=28, `delayRepeatMin_1`=8, `delayRepeatMax_1`=29 WHERE `entry`=157540;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=25, `delayRepeatMin_2`=12, `delayRepeatMax_2`=41 WHERE `entry`=157540;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=23, `delayRepeatMin_3`=6, `delayRepeatMax_3`=24 WHERE `entry`=157540;

-- Feralas - Greater Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=157560, `script_name`='' WHERE `entry`=15756;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157560, 'Feralas - Greater Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=20, `delayRepeatMin_1`=12, `delayRepeatMax_1`=27 WHERE `entry`=157560;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=17, `delayRepeatMin_2`=6, `delayRepeatMax_2`=26 WHERE `entry`=157560;

-- Silithus - Qiraji Lieutenant General
UPDATE `creature_template` SET `spell_list_id`=157570 WHERE `entry`=15757;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157570, 'Silithus - Qiraji Lieutenant General');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=4, `delayRepeatMin_1`=6, `delayRepeatMax_1`=16 WHERE `entry`=157570;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=1, `delayRepeatMin_2`=8, `delayRepeatMax_2`=17 WHERE `entry`=157570;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=4, `delayInitialMax_3`=9, `delayRepeatMin_3`=4, `delayRepeatMax_3`=9 WHERE `entry`=157570;

-- Silithus - Supreme Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=157580, `script_name`='' WHERE `entry`=15758;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157580, 'Silithus - Supreme Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=3, `delayRepeatMin_1`=1, `delayRepeatMax_1`=3 WHERE `entry`=157580;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=6, `delayInitialMax_2`=6, `delayRepeatMin_2`=16, `delayRepeatMax_2`=16 WHERE `entry`=157580;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=3, `delayRepeatMin_3`=6, `delayRepeatMax_3`=7 WHERE `entry`=157580;

-- Silithus - Supreme Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=157590, `script_name`='' WHERE `entry`=15759;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157590, 'Silithus - Supreme Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=14, `delayRepeatMin_1`=12, `delayRepeatMax_1`=18 WHERE `entry`=157590;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=3, `delayInitialMax_2`=15, `delayRepeatMin_2`=7, `delayRepeatMax_2`=15 WHERE `entry`=157590;

-- Thousand Needles - Greater Resonating Crystal
UPDATE `creature_template` SET `spell_list_id`=157700 WHERE `entry`=15770;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157700, 'Thousand Needles - Greater Resonating Crystal');
-- Spell: Whisperings of C'Thun (26197) (cast)
UPDATE `creature_spells` SET `spellId_1`=26197, `castTarget_1`=1, `delayInitialMin_1`=57, `delayInitialMax_1`=58, `delayRepeatMin_1`=57, `delayRepeatMax_1`=58 WHERE `entry`=157700;

-- Silithus - Major Resonating Crystal
UPDATE `creature_template` SET `spell_list_id`=157710 WHERE `entry`=15771;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (157710, 'Silithus - Major Resonating Crystal');
-- Spell: Whisperings of C'Thun (26198) (cast)
UPDATE `creature_spells` SET `spellId_1`=26198, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=34, `delayRepeatMin_1`=30, `delayRepeatMax_1`=61 WHERE `entry`=157710;

-- Barrens - Qiraji Lieutenant
UPDATE `creature_template` SET `spell_list_id`=158060 WHERE `entry`=15806;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158060, 'Barrens - Qiraji Lieutenant');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=18, `delayRepeatMin_1`=6, `delayRepeatMax_1`=15 WHERE `entry`=158060;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=18, `delayRepeatMin_2`=8, `delayRepeatMax_2`=19 WHERE `entry`=158060;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=3, `delayInitialMax_3`=14, `delayRepeatMin_3`=4, `delayRepeatMax_3`=5 WHERE `entry`=158060;

-- Barrens - Minor Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=158070, `script_name`='' WHERE `entry`=15807;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158070, 'Barrens - Minor Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=13, `delayRepeatMin_1`=10, `delayRepeatMax_1`=16 WHERE `entry`=158070;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=15, `delayRepeatMin_2`=12, `delayRepeatMax_2`=33 WHERE `entry`=158070;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=11, `delayRepeatMin_3`=6, `delayRepeatMax_3`=12 WHERE `entry`=158070;

-- Barrens - Minor Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=158080, `script_name`='' WHERE `entry`=15808;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158080, 'Barrens - Minor Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=10, `delayRepeatMin_1`=13, `delayRepeatMax_1`=22 WHERE `entry`=158080;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=11, `delayRepeatMin_2`=6, `delayRepeatMax_2`=23 WHERE `entry`=158080;

-- Barrens - Eroded Anubisath Warbringer
UPDATE `creature_template` SET `spell_list_id`=158100, `script_name`='' WHERE `entry`=15810;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158100, 'Barrens - Eroded Anubisath Warbringer');
-- Spell: Cleave (11427) (cast)
UPDATE `creature_spells` SET `spellId_1`=11427, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=7, `delayRepeatMin_1`=10, `delayRepeatMax_1`=32 WHERE `entry`=158100;
-- Spell: War Stomp (11876) (cast)
UPDATE `creature_spells` SET `spellId_2`=11876, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=8, `delayRepeatMin_2`=14, `delayRepeatMax_2`=28 WHERE `entry`=158100;
-- Spell: Sundering Cleave (17963) (cast)
UPDATE `creature_spells` SET `spellId_3`=17963, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=6, `delayRepeatMin_3`=6, `delayRepeatMax_3`=18 WHERE `entry`=158100;

-- Barrens - Faltering Silithid Flayer
UPDATE `creature_template` SET `spell_list_id`=158110, `script_name`='' WHERE `entry`=15811;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158110, 'Barrens - Faltering Silithid Flayer');
-- Spell: Terrifying Screech (6605) (cast)
UPDATE `creature_spells` SET `spellId_1`=6605, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=10, `delayRepeatMin_1`=12, `delayRepeatMax_1`=29 WHERE `entry`=158110;
-- Spell: Rend (13445) (cast)
UPDATE `creature_spells` SET `spellId_2`=13445, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=14, `delayRepeatMin_2`=6, `delayRepeatMax_2`=24 WHERE `entry`=158110;

-- Barrens - Qiraji Officer
UPDATE `creature_template` SET `spell_list_id`=158120 WHERE `entry`=15812;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158120, 'Barrens - Qiraji Officer');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=15, `delayRepeatMin_1`=6, `delayRepeatMax_1`=20 WHERE `entry`=158120;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=21, `delayRepeatMin_2`=8, `delayRepeatMax_2`=17 WHERE `entry`=158120;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=1, `delayRepeatMin_3`=1, `delayRepeatMax_3`=1 WHERE `entry`=158120;

-- Barrens - Qiraji Officer Zod
UPDATE `creature_template` SET `spell_list_id`=158130 WHERE `entry`=15813;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158130, 'Barrens - Qiraji Officer Zod');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=3, `delayInitialMax_1`=22, `delayRepeatMin_1`=6, `delayRepeatMax_1`=21 WHERE `entry`=158130;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=2, `delayInitialMax_2`=42, `delayRepeatMin_2`=8, `delayRepeatMax_2`=23 WHERE `entry`=158130;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=16, `delayRepeatMin_3`=5, `delayRepeatMax_3`=5 WHERE `entry`=158130;

-- Barrens - Qiraji Lieutenant Jo-rel
UPDATE `creature_template` SET `spell_list_id`=158140 WHERE `entry`=15814;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158140, 'Barrens - Qiraji Lieutenant Jo-rel');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=6, `delayRepeatMin_1`=32, `delayRepeatMax_1`=32 WHERE `entry`=158140;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=8, `delayInitialMax_2`=8, `delayRepeatMin_2`=11, `delayRepeatMax_2`=16 WHERE `entry`=158140;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=2, `delayRepeatMin_3`=1, `delayRepeatMax_3`=2 WHERE `entry`=158140;

-- Thousand Needles - Qiraji Captain Ka'ark
UPDATE `creature_template` SET `spell_list_id`=158150 WHERE `entry`=15815;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158150, 'Thousand Needles - Qiraji Captain Ka\'ark');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=32, `delayRepeatMin_1`=6, `delayRepeatMax_1`=16 WHERE `entry`=158150;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=11, `delayInitialMax_2`=30, `delayRepeatMin_2`=8, `delayRepeatMax_2`=18 WHERE `entry`=158150;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=1, `delayRepeatMin_3`=1, `delayRepeatMax_3`=1 WHERE `entry`=158150;

-- Tanaris - Qiraji Brigadier General Pax-lish
UPDATE `creature_template` SET `spell_list_id`=158170 WHERE `entry`=15817;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158170, 'Tanaris - Qiraji Brigadier General Pax-lish');
-- Spell: Demoralizing Shout (13730) (cast)
UPDATE `creature_spells` SET `spellId_1`=13730, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=14, `delayRepeatMin_1`=6, `delayRepeatMax_1`=32 WHERE `entry`=158170;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_2`=19643, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=14, `delayRepeatMin_2`=8, `delayRepeatMax_2`=21 WHERE `entry`=158170;
-- Spell: Charge (24023) (cast)
UPDATE `creature_spells` SET `spellId_3`=24023, `castTarget_3`=1, `delayInitialMin_3`=3, `delayInitialMax_3`=32, `delayRepeatMin_3`=9, `delayRepeatMax_3`=62 WHERE `entry`=158170;

-- Silithus - Lieutenant General Nokhor
UPDATE `creature_template` SET `spell_list_id`=158180 WHERE `entry`=15818;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158180, 'Silithus - Lieutenant General Nokhor');
-- Spell: Demoralizing Shout (23511) (cast)
UPDATE `creature_spells` SET `spellId_1`=23511, `castTarget_1`=1, `delayInitialMin_1`=16, `delayInitialMax_1`=16, `delayRepeatMin_1`=16, `delayRepeatMax_1`=16 WHERE `entry`=158180;
-- Spell: Mortal Strike (24573) (cast)
UPDATE `creature_spells` SET `spellId_2`=24573, `castTarget_2`=1, `delayInitialMin_2`=10, `delayInitialMax_2`=11, `delayRepeatMin_2`=10, `delayRepeatMax_2`=10 WHERE `entry`=158180;

-- Thousand Needles - Might of Kalimdor Mage
UPDATE `creature_template` SET `spell_list_id`=158420 WHERE `entry`=15842;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158420, 'Thousand Needles - Might of Kalimdor Mage');
-- Spell: Arcane Explosion (13745) (cast)
UPDATE `creature_spells` SET `spellId_1`=13745, `castTarget_1`=1, `delayInitialMin_1`=11, `delayInitialMax_1`=11, `delayRepeatMin_1`=11, `delayRepeatMax_1`=11 WHERE `entry`=158420;

-- Tanaris - Might of Kalimdor Priest
UPDATE `creature_template` SET `spell_list_id`=158430 WHERE `entry`=15843;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158430, 'Tanaris - Might of Kalimdor Priest');
-- Spell: Lesser Heal (2052) (cast)
UPDATE `creature_spells` SET `spellId_1`=2052, `castTarget_1`=17, `delayInitialMin_1`=6, `delayInitialMax_1`=29, `delayRepeatMin_1`=6, `delayRepeatMax_1`=29 WHERE `entry`=158430;
-- Spell: Greater Heal (10965) (cast)
UPDATE `creature_spells` SET `spellId_2`=10965, `castTarget_2`=17, `delayInitialMin_2`=11, `delayInitialMax_2`=12, `delayRepeatMin_2`=11, `delayRepeatMax_2`=11 WHERE `entry`=158430;

-- Silithus - Orgrimmar Elite Shieldguard
UPDATE `creature_template` SET `spell_list_id`=158520 WHERE `entry`=15852;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158520, 'Silithus - Orgrimmar Elite Shieldguard');
-- Spell: Shield Block (12169) (cast)
UPDATE `creature_spells` SET `spellId_1`=12169, `castTarget_1`=0, `delayInitialMin_1`=0, `delayInitialMax_1`=9, `delayRepeatMin_1`=6, `delayRepeatMax_1`=16 WHERE `entry`=158520;
-- Spell: Shield Wall (15062) (cast)
UPDATE `creature_spells` SET `spellId_2`=15062, `castTarget_2`=0, `delayInitialMin_2`=4, `delayInitialMax_2`=60, `delayRepeatMin_2`=16, `delayRepeatMax_2`=25 WHERE `entry`=158520;
-- Spell: Shield Charge (15749) (cast)
UPDATE `creature_spells` SET `spellId_3`=15749, `castTarget_3`=1, `delayInitialMin_3`=0, `delayInitialMax_3`=18, `delayRepeatMin_3`=12, `delayRepeatMax_3`=47 WHERE `entry`=158520;
-- Spell: Heroic Strike (25710) (cast)
UPDATE `creature_spells` SET `spellId_4`=25710, `castTarget_4`=1, `delayInitialMin_4`=2, `delayInitialMax_4`=24, `delayRepeatMin_4`=5, `delayRepeatMax_4`=25 WHERE `entry`=158520;
-- Spell: Taunt (26281) (cast)
UPDATE `creature_spells` SET `spellId_5`=26281, `castTarget_5`=1, `delayInitialMin_5`=0, `delayInitialMax_5`=20, `delayRepeatMin_5`=6, `delayRepeatMax_5`=22 WHERE `entry`=158520;

-- Silithus - Orgrimmar Elite Cavalryman
UPDATE `creature_template` SET `spell_list_id`=158540 WHERE `entry`=15854;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158540, 'Silithus - Orgrimmar Elite Cavalryman');
-- Spell: Cleave (15754) (cast)
UPDATE `creature_spells` SET `spellId_1`=15754, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=18, `delayRepeatMin_1`=6, `delayRepeatMax_1`=22 WHERE `entry`=158540;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=17, `delayRepeatMin_2`=6, `delayRepeatMax_2`=19 WHERE `entry`=158540;

-- Silithus - Tauren Primalist
UPDATE `creature_template` SET `spell_list_id`=158560 WHERE `entry`=15856;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158560, 'Silithus - Tauren Primalist');
-- Spell: Windfury Totem (10614) (cast)
UPDATE `creature_spells` SET `spellId_1`=10614, `castTarget_1`=1, `delayInitialMin_1`=12, `delayInitialMax_1`=27, `delayRepeatMin_1`=15, `delayRepeatMax_1`=33 WHERE `entry`=158560;
-- Spell: Chain Lightning (15305) (cast)
UPDATE `creature_spells` SET `spellId_2`=15305, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=14, `delayRepeatMin_2`=12, `delayRepeatMax_2`=27 WHERE `entry`=158560;
-- Spell: Healing Wave (15982) (cast)
UPDATE `creature_spells` SET `spellId_3`=15982, `castTarget_3`=17, `delayInitialMin_3`=4, `delayInitialMax_3`=75, `delayRepeatMin_3`=8, `delayRepeatMax_3`=38 WHERE `entry`=158560;
-- Spell: Chain Heal (16367) (cast)
UPDATE `creature_spells` SET `spellId_4`=16367, `castTarget_4`=17, `delayInitialMin_4`=3, `delayInitialMax_4`=57, `delayRepeatMin_4`=6, `delayRepeatMax_4`=38 WHERE `entry`=158560;
-- Spell: Strength of Earth Totem (25361) (cast)
UPDATE `creature_spells` SET `spellId_5`=25361, `castTarget_5`=1, `delayInitialMin_5`=4, `delayInitialMax_5`=16, `delayRepeatMin_5`=6, `delayRepeatMax_5`=21 WHERE `entry`=158560;

-- Silithus - Stormwind Cavalryman
UPDATE `creature_template` SET `spell_list_id`=158570 WHERE `entry`=15857;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158570, 'Silithus - Stormwind Cavalryman');
-- Spell: Cleave (15754) (cast)
UPDATE `creature_spells` SET `spellId_1`=15754, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=17, `delayRepeatMin_1`=6, `delayRepeatMax_1`=22 WHERE `entry`=158570;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=17, `delayRepeatMin_2`=6, `delayRepeatMax_2`=19 WHERE `entry`=158570;

-- Silithus - Stormwind Infantryman
UPDATE `creature_template` SET `spell_list_id`=158580, `script_name`='' WHERE `entry`=15858;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158580, 'Silithus - Stormwind Infantryman');
-- Spell: Battle Shout (9128) (cast)
UPDATE `creature_spells` SET `spellId_1`=9128, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=11, `delayRepeatMin_1`=35, `delayRepeatMax_1`=45 WHERE `entry`=158580;
-- Spell: Heroic Strike (25710) (cast)
UPDATE `creature_spells` SET `spellId_2`=25710, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=17, `delayRepeatMin_2`=6, `delayRepeatMax_2`=17 WHERE `entry`=158580;

-- Silithus - Stormwind Archmage
UPDATE `creature_template` SET `spell_list_id`=158590 WHERE `entry`=15859;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158590, 'Silithus - Stormwind Archmage');
-- Spell: Blink (14514) (cast)
UPDATE `creature_spells` SET `spellId_1`=14514, `castTarget_1`=0, `delayInitialMin_1`=6, `delayInitialMax_1`=62, `delayRepeatMin_1`=3, `delayRepeatMax_1`=25 WHERE `entry`=158590;
-- Spell: Fireball (17290) (cast)
UPDATE `creature_spells` SET `spellId_2`=17290, `castTarget_2`=1, `delayInitialMin_2`=2, `delayInitialMax_2`=24, `delayRepeatMin_2`=9, `delayRepeatMax_2`=26 WHERE `entry`=158590;
-- Spell: Flamestrike (22275) (cast)
UPDATE `creature_spells` SET `spellId_3`=22275, `castTarget_3`=1, `delayInitialMin_3`=1, `delayInitialMax_3`=23, `delayRepeatMin_3`=10, `delayRepeatMax_3`=33 WHERE `entry`=158590;
-- Spell: Icebolt (22357) (cast)
UPDATE `creature_spells` SET `spellId_4`=22357, `castTarget_4`=1, `delayInitialMin_4`=1, `delayInitialMax_4`=19, `delayRepeatMin_4`=6, `delayRepeatMax_4`=27 WHERE `entry`=158590;

-- Silithus - Kaldorei Marksman
UPDATE `creature_template` SET `spell_list_id`=158600 WHERE `entry`=15860;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158600, 'Silithus - Kaldorei Marksman');
-- Spell: Shoot Tauren Rifleman (26282) (cast)
UPDATE `creature_spells` SET `spellId_1`=26282, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=2, `delayRepeatMin_1`=3, `delayRepeatMax_1`=6 WHERE `entry`=158600;

-- Silithus - Ironforge Cavalryman
UPDATE `creature_template` SET `spell_list_id`=158620 WHERE `entry`=15862;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158620, 'Silithus - Ironforge Cavalryman');
-- Spell: Cleave (15754) (cast)
UPDATE `creature_spells` SET `spellId_1`=15754, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=16, `delayRepeatMin_1`=6, `delayRepeatMax_1`=20 WHERE `entry`=158620;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=16, `delayRepeatMin_2`=6, `delayRepeatMax_2`=18 WHERE `entry`=158620;

-- Silithus - Darkspear Shaman
UPDATE `creature_template` SET `spell_list_id`=158630 WHERE `entry`=15863;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158630, 'Silithus - Darkspear Shaman');
-- Spell: Windfury Totem (10614) (cast)
UPDATE `creature_spells` SET `spellId_1`=10614, `castTarget_1`=1, `delayInitialMin_1`=12, `delayInitialMax_1`=25, `delayRepeatMin_1`=15, `delayRepeatMax_1`=34 WHERE `entry`=158630;
-- Spell: Chain Lightning (15305) (cast)
UPDATE `creature_spells` SET `spellId_2`=15305, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=11, `delayRepeatMin_2`=12, `delayRepeatMax_2`=29 WHERE `entry`=158630;
-- Spell: Healing Wave (15982) (cast)
UPDATE `creature_spells` SET `spellId_3`=15982, `castTarget_3`=17, `delayInitialMin_3`=3, `delayInitialMax_3`=119, `delayRepeatMin_3`=8, `delayRepeatMax_3`=43 WHERE `entry`=158630;
-- Spell: Chain Heal (16367) (cast)
UPDATE `creature_spells` SET `spellId_4`=16367, `castTarget_4`=17, `delayInitialMin_4`=5, `delayInitialMax_4`=113, `delayRepeatMin_4`=6, `delayRepeatMax_4`=26 WHERE `entry`=158630;
-- Spell: Strength of Earth Totem (25361) (cast)
UPDATE `creature_spells` SET `spellId_5`=25361, `castTarget_5`=1, `delayInitialMin_5`=5, `delayInitialMax_5`=17, `delayRepeatMin_5`=6, `delayRepeatMax_5`=21 WHERE `entry`=158630;

-- Silithus - High Commander Lynore Windstryke
UPDATE `creature_template` SET `spell_list_id`=158660, `script_name`='' WHERE `entry`=15866;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158660, 'Silithus - High Commander Lynore Windstryke');
-- Spell: Slice and Dice (6434) (cast)
UPDATE `creature_spells` SET `spellId_1`=6434, `castTarget_1`=0, `delayInitialMin_1`=0, `delayInitialMax_1`=14, `delayRepeatMin_1`=0, `delayRepeatMax_1`=14 WHERE `entry`=158660;
-- Spell: Eviscerate (15692) (cast)
UPDATE `creature_spells` SET `spellId_2`=15692, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=7, `delayRepeatMin_2`=4, `delayRepeatMax_2`=14 WHERE `entry`=158660;
-- Spell: Vanish (24699) (cast)
UPDATE `creature_spells` SET `spellId_3`=24699, `castTarget_3`=1, `delayInitialMin_3`=0, `delayInitialMax_3`=12, `delayRepeatMin_3`=0, `delayRepeatMax_3`=12 WHERE `entry`=158660;

-- Silithus - Highlord Leoric Von Zeldig
UPDATE `creature_template` SET `spell_list_id`=158680 WHERE `entry`=15868;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158680, 'Silithus - Highlord Leoric Von Zeldig');
-- Spell: Shield Wall (15062) (cast)
UPDATE `creature_spells` SET `spellId_1`=15062, `castTarget_1`=0, `delayInitialMin_1`=17, `delayInitialMax_1`=39, `delayRepeatMin_1`=26, `delayRepeatMax_1`=47 WHERE `entry`=158680;
-- Spell: Highlord's Justice (20683) (cast)
UPDATE `creature_spells` SET `spellId_2`=20683, `castTarget_2`=1, `delayInitialMin_2`=12, `delayInitialMax_2`=46, `delayRepeatMin_2`=16, `delayRepeatMax_2`=40 WHERE `entry`=158680;
-- Spell: Cleave (20684) (cast)
UPDATE `creature_spells` SET `spellId_3`=20684, `castTarget_3`=1, `delayInitialMin_3`=6, `delayInitialMax_3`=16, `delayRepeatMin_3`=5, `delayRepeatMax_3`=17 WHERE `entry`=158680;

-- Silithus - Malagav the Tactician
UPDATE `creature_template` SET `spell_list_id`=158690 WHERE `entry`=15869;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158690, 'Silithus - Malagav the Tactician');
-- Spell: Shoot Tauren Rifleman (26282) (cast)
UPDATE `creature_spells` SET `spellId_1`=26282, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=2, `delayRepeatMin_1`=3, `delayRepeatMax_1`=6 WHERE `entry`=158690;

-- Silithus - Duke August Foehammer
UPDATE `creature_template` SET `spell_list_id`=158700 WHERE `entry`=15870;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (158700, 'Silithus - Duke August Foehammer');
-- Spell: Cleave (15754) (cast)
UPDATE `creature_spells` SET `spellId_1`=15754, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=14, `delayRepeatMin_1`=6, `delayRepeatMax_1`=23 WHERE `entry`=158700;
-- Spell: Mortal Strike (16856) (cast)
UPDATE `creature_spells` SET `spellId_2`=16856, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=10, `delayRepeatMin_2`=6, `delayRepeatMax_2`=20 WHERE `entry`=158700;

-- Ruins of Ahn'Qiraj - Hive'Zara Hornet
UPDATE `creature_template` SET `spell_list_id`=159340 WHERE `entry`=15934;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (159340, 'Ruins of Ahn\'Qiraj - Hive\'Zara Hornet');
-- Spell: Stinger Charge Primer (24150) (cast)
UPDATE `creature_spells` SET `spellId_1`=24150, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=4, `delayRepeatMin_1`=4, `delayRepeatMax_1`=6 WHERE `entry`=159340;

-- Naxxramas - Infectious Skitterer
UPDATE `creature_template` SET `auras`='28429' WHERE `entry`=15977;

-- Blackrock Depths - Rezznik
UPDATE `creature_template` SET `spell_list_id`=160540, `script_name`='' WHERE `entry`=16054;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (160540, 'Blackrock Depths - Rezznik');
-- Spell: Explosive Sheep (8209) (cast)
UPDATE `creature_spells` SET `spellId_1`=8209, `castTarget_1`=1, `delayInitialMin_1`=2, `delayInitialMax_1`=2, `delayRepeatMin_1`=2, `delayRepeatMax_1`=2 WHERE `entry`=160540;
-- Spell: Dark Iron Bomb (19784) (cast)
UPDATE `creature_spells` SET `spellId_2`=19784, `castTarget_2`=1, `delayInitialMin_2`=5, `delayInitialMax_2`=6, `delayRepeatMin_2`=5, `delayRepeatMax_2`=6 WHERE `entry`=160540;
-- Spell: Goblin Dragon Gun (27603) (cast)
UPDATE `creature_spells` SET `spellId_3`=27603, `castTarget_3`=0, `delayInitialMin_3`=6, `delayInitialMax_3`=6, `delayRepeatMin_3`=6, `delayRepeatMax_3`=6 WHERE `entry`=160540;
-- Spell: Recombobulate (27677) (cast)
UPDATE `creature_spells` SET `spellId_4`=27677, `castTarget_4`=17, `delayInitialMin_4`=1, `delayInitialMax_4`=3, `delayRepeatMin_4`=1, `delayRepeatMax_4`=3 WHERE `entry`=160540;
-- Spell: Reevaluate Targets (27678) (cast)
UPDATE `creature_spells` SET `spellId_6`=27678, `castTarget_5`=1, `delayInitialMin_5`=14, `delayInitialMax_5`=15, `delayRepeatMin_5`=14, `delayRepeatMax_5`=15 WHERE `entry`=160540;

-- Silithus - Dirk Thunderwood (auras 8279)
UPDATE `creature_template` SET `spell_list_id`=160910 WHERE `entry`=16091;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (160910, 'Silithus - Dirk Thunderwood');
-- Spell: Dirk's Rememberin' Poison (27582) (cast)
UPDATE `creature_spells` SET `spellId_1`=27582, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=2, `delayRepeatMin_1`=1, `delayRepeatMax_1`=2 WHERE `entry`=160910;

-- Silithus - Cenarion Hold Reservist
UPDATE `creature_template` SET `spell_list_id`=161390 WHERE `entry`=16139;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (161390, 'Silithus - Cenarion Hold Reservist');
-- Spell: Snap Kick (15618) (cast)
UPDATE `creature_spells` SET `spellId_1`=15618, `castTarget_1`=1, `delayInitialMin_1`=7, `delayInitialMax_1`=10, `delayRepeatMin_1`=9, `delayRepeatMax_1`=14 WHERE `entry`=161390;
-- Spell: Incapacitating Shout (18328) (cast)
UPDATE `creature_spells` SET `spellId_2`=18328, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=25, `delayRepeatMin_2`=1, `delayRepeatMax_2`=25 WHERE `entry`=161390;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_3`=19643, `castTarget_3`=1, `delayInitialMin_3`=3, `delayInitialMax_3`=9, `delayRepeatMin_3`=6, `delayRepeatMax_3`=13 WHERE `entry`=161390;
-- Spell: Summon Player (26229) (cast)
UPDATE `creature_spells` SET `spellId_4`=26229, `castTarget_4`=1, `castFlags_1`=16, `delayInitialMin_4`=0, `delayInitialMax_4`=2, `delayRepeatMin_4`=1, `delayRepeatMax_4`=5 WHERE `entry`=161390;

-- Naxxramas - Risen Deathknight
UPDATE `creature_template` SET `spell_list_id`=161540 WHERE `entry`=16154;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (161540, 'Naxxramas - Risen Deathknight');
-- Spell: Random Aggro (28388) (cast)
UPDATE `creature_spells` SET `spellId_1`=28388, `castTarget_1`=1, `delayInitialMin_1`=4, `delayInitialMax_1`=11, `delayRepeatMin_1`=5, `delayRepeatMax_1`=10 WHERE `entry`=161540;

-- Naxxramas - Fallout Slime (auras 28156)
UPDATE `creature_template` SET `spell_list_id`=162900 WHERE `entry`=16290;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (162900, 'Naxxramas - Fallout Slime');
-- Spell: Random Aggro (25680) (cast)
UPDATE `creature_spells` SET `spellId_1`=25680, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=3, `delayRepeatMin_1`=0, `delayRepeatMax_1`=3 WHERE `entry`=162900;

-- Naxxramas - Corpse Scarab
UPDATE `creature_template` SET `spell_list_id`=166980 WHERE `entry`=16698;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (166980, 'Naxxramas - Corpse Scarab');
-- Spell: Random Aggro (22913) (cast)
UPDATE `creature_spells` SET `spellId_1`=22913, `castTarget_1`=1, `delayInitialMin_1`=0, `delayInitialMax_1`=2, `delayRepeatMin_1`=0, `delayRepeatMax_1`=2 WHERE `entry`=166980;

-- Naxxramas - Maexxna Spiderling
UPDATE `creature_template` SET `spell_list_id`=170550 WHERE `entry`=17055;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (170550, 'Naxxramas - Maexxna Spiderling');
-- Spell: Necrotic Poison (28776) (cast)
UPDATE `creature_spells` SET `spellId_1`=28776, `castTarget_1`=1, `delayInitialMin_1`=6, `delayInitialMax_1`=23, `delayRepeatMin_1`=21, `delayRepeatMax_1`=34 WHERE `entry`=170550;
-- Spell: Random Aggro (30215) (cast)
UPDATE `creature_spells` SET `spellId_2`=30215, `castTarget_2`=1, `delayInitialMin_2`=0, `delayInitialMax_2`=2, `delayRepeatMin_2`=0, `delayRepeatMax_2`=2 WHERE `entry`=170550;

-- Silithus - Alliance Silithyst Sentinel (auras 18950)
UPDATE `creature_template` SET `spell_list_id`=177650 WHERE `entry`=17765;
INSERT INTO `creature_spells` (`entry`, `name`) VALUES (177650, 'Silithus - Alliance Silithyst Sentinel');
-- Spell: Shield Bash (11972) (cast)
UPDATE `creature_spells` SET `spellId_1`=11972, `castTarget_1`=1, `delayInitialMin_1`=1, `delayInitialMax_1`=6, `delayRepeatMin_1`=1, `delayRepeatMax_1`=2 WHERE `entry`=177650;
-- Spell: Incapacitating Shout (18328) (cast)
UPDATE `creature_spells` SET `spellId_2`=18328, `castTarget_2`=1, `delayInitialMin_2`=1, `delayInitialMax_2`=2, `delayRepeatMin_2`=1, `delayRepeatMax_2`=2 WHERE `entry`=177650;
-- Spell: Mortal Strike (19643) (cast)
UPDATE `creature_spells` SET `spellId_3`=19643, `castTarget_3`=1, `delayInitialMin_3`=4, `delayInitialMax_3`=5, `delayRepeatMin_3`=9, `delayRepeatMax_3`=10 WHERE `entry`=177650;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
