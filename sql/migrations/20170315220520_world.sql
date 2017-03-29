INSERT INTO `migrations` VALUES ('20170315220520');

-- Bug: Lvl 18 and 19 warriors had the same base HP
-- Change: 19 All Warriors
UPDATE `player_classlevelstats` SET `basehp`=183 WHERE `class`=1 AND `level`=19;

-- Bug: Lvl 18 and 19 HUMAN warriors have the same stats
-- Change: 19 Human Warrior
-- The following are estimated stats right between lvl 18 and lvl 20 stats. No source for correct stats could be found.
UPDATE `player_levelstats` SET `str`=46, `agi`=34, `sta`=42, `inte`=22, `spi`=26 WHERE `race`=1 AND `class`=1 AND `level`=19;

-- Bug: Lvl 18, 19 and 20 orc rogues have the same stats
-- 19, 20 Orc Rogue.
-- https://github.com/cmangos/mangos-classic/blob/f7d9cb40b04ecedbf029ff805869812bcf7c4898/sql/archive/0.7/3562_player_levelstats.sql
DELETE FROM player_levelstats WHERE race=2 and class=4 and level=19;
DELETE FROM player_levelstats WHERE race=2 and class=4 and level=20;
INSERT INTO player_levelstats VALUES
('2', '4', '19', '38', '44', '35', '20', '30'),
('2', '4', '20', '38', '46', '36', '20', '30');

