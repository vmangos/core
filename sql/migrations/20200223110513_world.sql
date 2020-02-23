DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200223110513');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200223110513');
-- Add your query below.


-- These mobs shouldn't have a forced display id.
UPDATE `creature` SET `display_id`=0 WHERE `id` NOT IN (11260) && `guid` NOT IN (81391, 80881);

-- Eranikus the Chained should not have static spawn.
DELETE FROM `creature` WHERE `id` = 8506;

-- Add all Midsummer Bonfire spawns to Midsummer Fire Festival event.
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES 
(1882, 1),
(47575, 1),
(47614, 1),
(94864, 1),
(94865, 1),
(94866, 1),
(94867, 1),
(94868, 1),
(94869, 1),
(94870, 1),
(94871, 1),
(94872, 1),
(94873, 1),
(94875, 1),
(94876, 1),
(94877, 1),
(94878, 1),
(94879, 1),
(94880, 1),
(94881, 1),
(94882, 1),
(94883, 1),
(94884, 1),
(94886, 1),
(94887, 1),
(94888, 1),
(94889, 1),
(94890, 1),
(94891, 1),
(94892, 1),
(94893, 1),
(94894, 1),
(94895, 1),
(94896, 1),
(94897, 1),
(94898, 1),
(94899, 1),
(94900, 1),
(94901, 1),
(94902, 1),
(94903, 1),
(94904, 1),
(94905, 1),
(94906, 1),
(94907, 1),
(94908, 1),
(94909, 1),
(94910, 1),
(94911, 1),
(94912, 1),
(94913, 1),
(94914, 1),
(94918, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
