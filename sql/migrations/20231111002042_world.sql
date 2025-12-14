DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231111002042');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231111002042');
-- Add your query below.


-- Correct human rogue stats.
UPDATE `player_levelstats` SET `spi`=21 WHERE `race`=1 && `class`=4 && `level`=5; -- Old Strength 24 Agility 28 Stamina 24 Intellect 21 Spirit 22
UPDATE `player_levelstats` SET `spi`=22 WHERE `race`=1 && `class`=4 && `level`=6; -- Old Strength 24 Agility 29 Stamina 24 Intellect 21 Spirit 23
UPDATE `player_levelstats` SET `spi`=22 WHERE `race`=1 && `class`=4 && `level`=7; -- Old Strength 25 Agility 31 Stamina 25 Intellect 21 Spirit 23
UPDATE `player_levelstats` SET `spi`=22 WHERE `race`=1 && `class`=4 && `level`=8; -- Old Strength 26 Agility 32 Stamina 25 Intellect 21 Spirit 23
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=4 && `level`=9; -- Old Strength 27 Agility 33 Stamina 26 Intellect 21 Spirit 24
UPDATE `player_levelstats` SET `spi`=23 WHERE `race`=1 && `class`=4 && `level`=10; -- Old Strength 27 Agility 35 Stamina 27 Intellect 22 Spirit 24
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=4 && `level`=11; -- Old Strength 28 Agility 36 Stamina 28 Intellect 22 Spirit 25
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=4 && `level`=12; -- Old Strength 29 Agility 37 Stamina 28 Intellect 22 Spirit 25
UPDATE `player_levelstats` SET `spi`=24 WHERE `race`=1 && `class`=4 && `level`=13; -- Old Strength 30 Agility 39 Stamina 29 Intellect 22 Spirit 25
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=4 && `level`=14; -- Old Strength 30 Agility 40 Stamina 30 Intellect 22 Spirit 26
UPDATE `player_levelstats` SET `spi`=25 WHERE `race`=1 && `class`=4 && `level`=15; -- Old Strength 31 Agility 42 Stamina 30 Intellect 23 Spirit 26
UPDATE `player_levelstats` SET `spi`=26 WHERE `race`=1 && `class`=4 && `level`=16; -- Old Strength 32 Agility 43 Stamina 31 Intellect 23 Spirit 27
UPDATE `player_levelstats` SET `spi`=26 WHERE `race`=1 && `class`=4 && `level`=17; -- Old Strength 33 Agility 44 Stamina 32 Intellect 23 Spirit 27
UPDATE `player_levelstats` SET `spi`=26 WHERE `race`=1 && `class`=4 && `level`=18; -- Old Strength 34 Agility 46 Stamina 33 Intellect 23 Spirit 27
UPDATE `player_levelstats` SET `spi`=27 WHERE `race`=1 && `class`=4 && `level`=19; -- Old Strength 35 Agility 48 Stamina 33 Intellect 23 Spirit 28
UPDATE `player_levelstats` SET `spi`=27 WHERE `race`=1 && `class`=4 && `level`=20; -- Old Strength 35 Agility 49 Stamina 34 Intellect 24 Spirit 28
UPDATE `player_levelstats` SET `spi`=28 WHERE `race`=1 && `class`=4 && `level`=21; -- Old Strength 36 Agility 51 Stamina 35 Intellect 24 Spirit 29
UPDATE `player_levelstats` SET `spi`=28 WHERE `race`=1 && `class`=4 && `level`=22; -- Old Strength 37 Agility 52 Stamina 36 Intellect 24 Spirit 29
UPDATE `player_levelstats` SET `spi`=29 WHERE `race`=1 && `class`=4 && `level`=23; -- Old Strength 38 Agility 54 Stamina 37 Intellect 24 Spirit 30
UPDATE `player_levelstats` SET `spi`=29 WHERE `race`=1 && `class`=4 && `level`=24; -- Old Strength 39 Agility 55 Stamina 37 Intellect 25 Spirit 30
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=4 && `level`=25; -- Old Strength 40 Agility 57 Stamina 38 Intellect 25 Spirit 31
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=4 && `level`=26; -- Old Strength 41 Agility 59 Stamina 39 Intellect 25 Spirit 31
UPDATE `player_levelstats` SET `spi`=30 WHERE `race`=1 && `class`=4 && `level`=27; -- Old Strength 42 Agility 60 Stamina 40 Intellect 25 Spirit 31
UPDATE `player_levelstats` SET `spi`=31 WHERE `race`=1 && `class`=4 && `level`=28; -- Old Strength 43 Agility 62 Stamina 41 Intellect 25 Spirit 32
UPDATE `player_levelstats` SET `spi`=31 WHERE `race`=1 && `class`=4 && `level`=29; -- Old Strength 43 Agility 64 Stamina 42 Intellect 26 Spirit 32
UPDATE `player_levelstats` SET `spi`=32 WHERE `race`=1 && `class`=4 && `level`=30; -- Old Strength 44 Agility 66 Stamina 42 Intellect 26 Spirit 33
UPDATE `player_levelstats` SET `spi`=32 WHERE `race`=1 && `class`=4 && `level`=31; -- Old Strength 45 Agility 67 Stamina 43 Intellect 26 Spirit 33
UPDATE `player_levelstats` SET `spi`=33 WHERE `race`=1 && `class`=4 && `level`=32; -- Old Strength 46 Agility 69 Stamina 44 Intellect 26 Spirit 34
UPDATE `player_levelstats` SET `spi`=33 WHERE `race`=1 && `class`=4 && `level`=33; -- Old Strength 47 Agility 71 Stamina 45 Intellect 27 Spirit 34
UPDATE `player_levelstats` SET `spi`=34 WHERE `race`=1 && `class`=4 && `level`=34; -- Old Strength 48 Agility 73 Stamina 46 Intellect 27 Spirit 35
UPDATE `player_levelstats` SET `spi`=34 WHERE `race`=1 && `class`=4 && `level`=35; -- Old Strength 49 Agility 75 Stamina 47 Intellect 27 Spirit 35
UPDATE `player_levelstats` SET `spi`=35 WHERE `race`=1 && `class`=4 && `level`=36; -- Old Strength 51 Agility 77 Stamina 48 Intellect 28 Spirit 36
UPDATE `player_levelstats` SET `spi`=36 WHERE `race`=1 && `class`=4 && `level`=37; -- Old Strength 52 Agility 78 Stamina 49 Intellect 28 Spirit 37
UPDATE `player_levelstats` SET `spi`=36 WHERE `race`=1 && `class`=4 && `level`=38; -- Old Strength 53 Agility 80 Stamina 50 Intellect 28 Spirit 37
UPDATE `player_levelstats` SET `spi`=37 WHERE `race`=1 && `class`=4 && `level`=39; -- Old Strength 54 Agility 82 Stamina 51 Intellect 28 Spirit 38
UPDATE `player_levelstats` SET `spi`=37 WHERE `race`=1 && `class`=4 && `level`=40; -- Old Strength 55 Agility 84 Stamina 52 Intellect 29 Spirit 38
UPDATE `player_levelstats` SET `spi`=38 WHERE `race`=1 && `class`=4 && `level`=41; -- Old Strength 56 Agility 86 Stamina 53 Intellect 29 Spirit 39
UPDATE `player_levelstats` SET `spi`=38 WHERE `race`=1 && `class`=4 && `level`=42; -- Old Strength 57 Agility 88 Stamina 54 Intellect 29 Spirit 39
UPDATE `player_levelstats` SET `spi`=39 WHERE `race`=1 && `class`=4 && `level`=43; -- Old Strength 58 Agility 90 Stamina 55 Intellect 29 Spirit 40
UPDATE `player_levelstats` SET `spi`=39 WHERE `race`=1 && `class`=4 && `level`=44; -- Old Strength 59 Agility 93 Stamina 56 Intellect 30 Spirit 40
UPDATE `player_levelstats` SET `spi`=40 WHERE `race`=1 && `class`=4 && `level`=45; -- Old Strength 61 Agility 95 Stamina 57 Intellect 30 Spirit 42
UPDATE `player_levelstats` SET `spi`=41 WHERE `race`=1 && `class`=4 && `level`=46; -- Old Strength 62 Agility 97 Stamina 58 Intellect 30 Spirit 43
UPDATE `player_levelstats` SET `spi`=41 WHERE `race`=1 && `class`=4 && `level`=47; -- Old Strength 63 Agility 99 Stamina 59 Intellect 31 Spirit 43
UPDATE `player_levelstats` SET `spi`=42 WHERE `race`=1 && `class`=4 && `level`=48; -- Old Strength 64 Agility 101 Stamina 60 Intellect 31 Spirit 44
UPDATE `player_levelstats` SET `spi`=43 WHERE `race`=1 && `class`=4 && `level`=49; -- Old Strength 65 Agility 103 Stamina 62 Intellect 31 Spirit 45
UPDATE `player_levelstats` SET `spi`=43 WHERE `race`=1 && `class`=4 && `level`=50; -- Old Strength 67 Agility 106 Stamina 63 Intellect 32 Spirit 45
UPDATE `player_levelstats` SET `spi`=44 WHERE `race`=1 && `class`=4 && `level`=51; -- Old Strength 68 Agility 108 Stamina 64 Intellect 32 Spirit 46
UPDATE `player_levelstats` SET `spi`=44 WHERE `race`=1 && `class`=4 && `level`=52; -- Old Strength 69 Agility 110 Stamina 65 Intellect 32 Spirit 46
UPDATE `player_levelstats` SET `spi`=45 WHERE `race`=1 && `class`=4 && `level`=53; -- Old Strength 70 Agility 113 Stamina 66 Intellect 33 Spirit 47
UPDATE `player_levelstats` SET `spi`=46 WHERE `race`=1 && `class`=4 && `level`=54; -- Old Strength 72 Agility 115 Stamina 67 Intellect 33 Spirit 48
UPDATE `player_levelstats` SET `spi`=46 WHERE `race`=1 && `class`=4 && `level`=55; -- Old Strength 73 Agility 117 Stamina 69 Intellect 33 Spirit 48
UPDATE `player_levelstats` SET `spi`=47 WHERE `race`=1 && `class`=4 && `level`=56; -- Old Strength 74 Agility 120 Stamina 70 Intellect 34 Spirit 49
UPDATE `player_levelstats` SET `spi`=48 WHERE `race`=1 && `class`=4 && `level`=57; -- Old Strength 76 Agility 122 Stamina 71 Intellect 34 Spirit 50
UPDATE `player_levelstats` SET `spi`=49 WHERE `race`=1 && `class`=4 && `level`=58; -- Old Strength 77 Agility 125 Stamina 72 Intellect 34 Spirit 51
UPDATE `player_levelstats` SET `spi`=49 WHERE `race`=1 && `class`=4 && `level`=59; -- Old Strength 79 Agility 127 Stamina 74 Intellect 35 Spirit 51


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
