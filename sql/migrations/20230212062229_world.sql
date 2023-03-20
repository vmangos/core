DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230212062229');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230212062229');
-- Add your query below.


-- Correct more player stats.
UPDATE `player_classlevelstats` SET `basehp`=52, `basemana`=129 WHERE `class`=5 && `level`=3; -- Old HP 42 Mana 189
UPDATE `player_classlevelstats` SET `basehp`=67, `basemana`=140 WHERE `class`=5 && `level`=4; -- Old HP 57 Mana 200
UPDATE `player_classlevelstats` SET `basehp`=82, `basemana`=137 WHERE `class`=5 && `level`=5; -- Old HP 72 Mana 197
UPDATE `player_classlevelstats` SET `basehp`=87, `basemana`=150 WHERE `class`=5 && `level`=6; -- Old HP 77 Mana 210
UPDATE `player_classlevelstats` SET `basehp`=102, `basemana`=164 WHERE `class`=5 && `level`=7; -- Old HP 92 Mana 224
UPDATE `player_classlevelstats` SET `basehp`=117, `basemana`=179 WHERE `class`=5 && `level`=8; -- Old HP 107 Mana 239
UPDATE `player_classlevelstats` SET `basehp`=122, `basemana`=195 WHERE `class`=5 && `level`=9; -- Old HP 112 Mana 255
UPDATE `player_classlevelstats` SET `basehp`=142, `basemana`=215 WHERE `class`=5 && `level`=11; -- Old HP 132 Mana 275
UPDATE `player_classlevelstats` SET `basehp`=157, `basemana`=234 WHERE `class`=5 && `level`=12; -- Old HP 147 Mana 294
UPDATE `player_classlevelstats` SET `basehp`=172, `basemana`=254 WHERE `class`=5 && `level`=13; -- Old HP 162 Mana 314
UPDATE `player_classlevelstats` SET `basehp`=177, `basemana`=260 WHERE `class`=5 && `level`=14; -- Old HP 167 Mana 320
UPDATE `player_classlevelstats` SET `basehp`=192, `basemana`=282 WHERE `class`=5 && `level`=15; -- Old HP 182 Mana 342
UPDATE `player_classlevelstats` SET `basehp`=197, `basemana`=305 WHERE `class`=5 && `level`=16; -- Old HP 187 Mana 365
UPDATE `player_classlevelstats` SET `basehp`=212, `basemana`=329 WHERE `class`=5 && `level`=17; -- Old HP 202 Mana 389
UPDATE `player_classlevelstats` SET `basehp`=227, `basemana`=339 WHERE `class`=5 && `level`=18; -- Old HP 217 Mana 399
UPDATE `player_classlevelstats` SET `basehp`=232, `basemana`=365 WHERE `class`=5 && `level`=19; -- Old HP 222 Mana 425
UPDATE `player_classlevelstats` SET `basehp`=247, `basemana`=377 WHERE `class`=5 && `level`=20; -- Old HP 237 Mana 437
UPDATE `player_classlevelstats` SET `basehp`=252, `basemana`=405 WHERE `class`=5 && `level`=21; -- Old HP 242 Mana 465
UPDATE `player_classlevelstats` SET `basehp`=268, `basemana`=434 WHERE `class`=5 && `level`=22; -- Old HP 258 Mana 494
UPDATE `player_classlevelstats` SET `basehp`=275, `basemana`=449 WHERE `class`=5 && `level`=23; -- Old HP 265 Mana 509
UPDATE `player_classlevelstats` SET `basehp`=293, `basemana`=480 WHERE `class`=5 && `level`=24; -- Old HP 283 Mana 540
UPDATE `player_classlevelstats` SET `basehp`=302, `basemana`=497 WHERE `class`=5 && `level`=25; -- Old HP 292 Mana 557
UPDATE `player_classlevelstats` SET `basehp`=322, `basemana`=530 WHERE `class`=5 && `level`=26; -- Old HP 312 Mana 590
UPDATE `player_classlevelstats` SET `basehp`=343, `basemana`=549 WHERE `class`=5 && `level`=27; -- Old HP 333 Mana 609
UPDATE `player_classlevelstats` SET `basehp`=355, `basemana`=584 WHERE `class`=5 && `level`=28; -- Old HP 345 Mana 644
UPDATE `player_levelstats` SET `spi`=21 WHERE `race`=1 && `class`=1 && `level`=3; -- Old Strength 25 Agility 21 Stamina 24 Intellect 20 Spirit 22
UPDATE `player_levelstats` SET `str`=27, `agi`=37, `inte`=66, `spi`=65 WHERE `race`=7 && `class`=9 && `level`=33; -- Old Strength 26 Agility 36 Stamina 40 Intellect 67 Spirit 64
UPDATE `player_levelstats` SET `inte`=66 WHERE `race`=7 && `class`=9 && `level`=34; -- Old Strength 27 Agility 37 Stamina 40 Intellect 69 Spirit 65
UPDATE `player_levelstats` SET `inte`=67 WHERE `race`=7 && `class`=9 && `level`=35; -- Old Strength 27 Agility 37 Stamina 41 Intellect 70 Spirit 67
UPDATE `player_levelstats` SET `inte`=69 WHERE `race`=7 && `class`=9 && `level`=36; -- Old Strength 28 Agility 38 Stamina 42 Intellect 72 Spirit 69
UPDATE `player_levelstats` SET `inte`=71, `spi`=70 WHERE `race`=7 && `class`=9 && `level`=37; -- Old Strength 28 Agility 39 Stamina 43 Intellect 75 Spirit 69
UPDATE `player_levelstats` SET `inte`=72 WHERE `race`=7 && `class`=9 && `level`=38; -- Old Strength 28 Agility 39 Stamina 44 Intellect 76 Spirit 72
UPDATE `player_levelstats` SET `inte`=74 WHERE `race`=7 && `class`=9 && `level`=39; -- Old Strength 29 Agility 40 Stamina 44 Intellect 78 Spirit 74
UPDATE `player_levelstats` SET `inte`=75 WHERE `race`=7 && `class`=9 && `level`=40; -- Old Strength 29 Agility 40 Stamina 45 Intellect 79 Spirit 75
UPDATE `player_levelstats` SET `inte`=77 WHERE `race`=7 && `class`=9 && `level`=41; -- Old Strength 30 Agility 41 Stamina 46 Intellect 81 Spirit 77
UPDATE `player_levelstats` SET `inte`=79 WHERE `race`=7 && `class`=9 && `level`=42; -- Old Strength 30 Agility 41 Stamina 47 Intellect 83 Spirit 79
UPDATE `player_levelstats` SET `inte`=80 WHERE `race`=7 && `class`=9 && `level`=43; -- Old Strength 31 Agility 42 Stamina 48 Intellect 84 Spirit 81
UPDATE `player_levelstats` SET `inte`=82 WHERE `race`=7 && `class`=9 && `level`=44; -- Old Strength 31 Agility 42 Stamina 49 Intellect 86 Spirit 82
UPDATE `player_levelstats` SET `inte`=84 WHERE `race`=7 && `class`=9 && `level`=45; -- Old Strength 32 Agility 43 Stamina 49 Intellect 88 Spirit 84
UPDATE `player_levelstats` SET `inte`=86 WHERE `race`=7 && `class`=9 && `level`=46; -- Old Strength 32 Agility 44 Stamina 50 Intellect 90 Spirit 86
UPDATE `player_levelstats` SET `inte`=87 WHERE `race`=7 && `class`=9 && `level`=47; -- Old Strength 33 Agility 44 Stamina 51 Intellect 91 Spirit 88
UPDATE `player_levelstats` SET `inte`=89 WHERE `race`=7 && `class`=9 && `level`=48; -- Old Strength 33 Agility 45 Stamina 52 Intellect 93 Spirit 90
UPDATE `player_levelstats` SET `inte`=91 WHERE `race`=7 && `class`=9 && `level`=49; -- Old Strength 34 Agility 46 Stamina 53 Intellect 96 Spirit 92
UPDATE `player_levelstats` SET `inte`=93, `spi`=94 WHERE `race`=7 && `class`=9 && `level`=50; -- Old Strength 34 Agility 46 Stamina 54 Intellect 98 Spirit 93
UPDATE `player_levelstats` SET `inte`=95 WHERE `race`=7 && `class`=9 && `level`=51; -- Old Strength 35 Agility 47 Stamina 55 Intellect 100 Spirit 96
UPDATE `player_levelstats` SET `inte`=97 WHERE `race`=7 && `class`=9 && `level`=52; -- Old Strength 35 Agility 47 Stamina 56 Intellect 102 Spirit 98
UPDATE `player_levelstats` SET `inte`=99 WHERE `race`=7 && `class`=9 && `level`=53; -- Old Strength 36 Agility 48 Stamina 57 Intellect 104 Spirit 100
UPDATE `player_levelstats` SET `inte`=101 WHERE `race`=7 && `class`=9 && `level`=54; -- Old Strength 37 Agility 49 Stamina 58 Intellect 106 Spirit 102
UPDATE `player_levelstats` SET `sta`=59, `inte`=103 WHERE `race`=7 && `class`=9 && `level`=55; -- Old Strength 37 Agility 49 Stamina 58 Intellect 108 Spirit 104
UPDATE `player_levelstats` SET `inte`=105 WHERE `race`=7 && `class`=9 && `level`=56; -- Old Strength 38 Agility 50 Stamina 60 Intellect 110 Spirit 106
UPDATE `player_levelstats` SET `inte`=107 WHERE `race`=7 && `class`=9 && `level`=57; -- Old Strength 38 Agility 51 Stamina 61 Intellect 112 Spirit 108
UPDATE `player_levelstats` SET `inte`=109 WHERE `race`=7 && `class`=9 && `level`=58; -- Old Strength 39 Agility 52 Stamina 62 Intellect 114 Spirit 111
UPDATE `player_levelstats` SET `inte`=111, `spi`=113 WHERE `race`=7 && `class`=9 && `level`=59; -- Old Strength 39 Agility 52 Stamina 63 Intellect 117 Spirit 111


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
