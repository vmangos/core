DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260320183126');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260320183126');
-- Add your query below.
-- Add Conjure Water Level 7 to the Mage Trainer on GM Island
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES (90002, 10143, 0, 0, 0, 60, 0, 5875);

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
