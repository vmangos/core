DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260711025640');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260711025640');
-- Add your query below.


-- Add missing rates for crit and dodge based on each other where all other rates are equal.
INSERT INTO `player_dodge_per_agility` (`class`, `level`, `rate`) VALUES (5, 14, 11.4943);
INSERT INTO `player_dodge_per_agility` (`class`, `level`, `rate`) VALUES (11, 34, 11.9474);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 45, 16.6667);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 46, 16.6667);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 47, 17.2117);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 48, 17.2117);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 50, 17.762);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 51, 17.762);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 54, 18.3486);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 55, 18.3486);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 56, 18.9036);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (8, 57, 18.9036);
INSERT INTO `player_crit_per_agility` (`class`, `level`, `rate`) VALUES (11, 28, 10.2459);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
