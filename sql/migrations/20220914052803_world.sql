DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220914052803');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220914052803');
-- Add your query below.

-- Training in a new weapon can be done at level 1 (execpt polearms) 
UPDATE `npc_trainer` SET `reqlevel`= 0 WHERE `spell` IN (
1847,  -- One-Handed Swords
15983,  -- Two-Handed Swords
15988,  -- Daggers
15995,  -- Crossbows
15992,  -- Fist Weapons
15994,  -- Bows
15984,  -- One-Handed Axes
15989,  -- Staves
15997,  -- Thrown
15985,  -- Two-Handed Axes
15996,  -- Guns
15986,  -- One-Handed Maces
15987); -- Two-Handed Maces

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
