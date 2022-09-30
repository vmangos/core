DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220925022431');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220925022431');
-- Add your query below.

-- Set Mulgore, Red Cloud Mesa GY for Brambleblade Ravine, Kodo Rock, Campe Narache
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (34, 358, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (34, 637, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (34, 221, 67, 0);

-- Set Durotar, Valley of Trials GY for Spirit Rock, The Den, Hidden Path, Burning Blade Coven
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (709, 637, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (709, 364, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (709, 638, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (709, 365, 67, 0);

-- Set Tirisfal Glades, Deathknell GY for Shadow Grave, Night Web's Hollow
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (94, 2117, 67, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (94, 155, 67, 0);

-- Set Aldrassil, Teldrassil GY for Aldrassil, Shadowthread Cave
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (93, 256, 469, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (93, 257, 469, 0);

-- Set Anvilmar, Dun Morogh GY for Anvilmar
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (100, 77, 469, 0);

-- Set Northshire, Elwynn Forest GY for Northshire Abbey, Echo Ridge Mine, Northshire Vineyards
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (105, 24, 469, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (105, 34, 469, 0);
INSERT INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`, `build_min`) VALUES (105, 59, 469, 0);

-- Condition to return false if quest 769 is complete
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (769, 8, 769, 0, 0, 0, 1);

-- Quest 769 (Kodo Hide Bag) requires a Leatherworking skill of 10 instead of 1, should not be available if it has already been completed.
UPDATE `quest_template` SET `RequiredSkillValue` = 10, `RequiredCondition` = 769 WHERE `entry` = 769;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
