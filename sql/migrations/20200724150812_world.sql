DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200724150812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200724150812');
-- Add your query below.


-- correct recipes to teg dawnstrider
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3011, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct price for enchant bracer - lesser intellect
UPDATE `npc_trainer` SET `spellcost` = 2250 WHERE `spell` = 13623 AND `entry` IN (1317, 5038);

-- correct recipes to godan
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3345, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct recipes to taladan
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4213, 7414, 10, 0, 0, 5, 0, 5875),
(4213, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct recipes to lavinia crowe
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4616, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct recipes to gimble thistlefuzz
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(5157, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct recipes to xylinnia starshine
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(7949, 13623, 2250, 333, 150, 0, 0, 5875);

-- correct recipes to annora
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(11073, 13623, 2250, 333, 150, 0, 0, 5875);

-- add enchant bracer - minor deflection to trainers
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1317, 7429, 100, 333, 20, 0, 0, 5875),
(11072, 7429, 100, 333, 20, 0, 0, 5875),
(11074, 7429, 100, 333, 20, 0, 0, 5875),
(11073, 7429, 100, 333, 20, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
