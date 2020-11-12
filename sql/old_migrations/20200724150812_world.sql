DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200724150812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200724150812');
-- Add your query below.


-- enchanting
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


-- cooking
DELETE FROM `npc_trainer` WHERE `entry` IN (1355, 1699, 5482) AND `spell` = 1290;


-- engineering
-- correct recipes for finbus grindgear
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1676, 3984, 115, 202, 30, 0, 0, 5875),
(1676, 3985, 130, 202, 30, 0, 0, 5875),
(1676, 3986, 150, 202, 50, 0, 0, 5875),
(1676, 3987, 150, 202, 50, 0, 0, 5875),
(1676, 3988, 200, 202, 60, 0, 0, 5875),
(1676, 3991, 225, 202, 65, 0, 0, 5875),
(1676, 3992, 250, 202, 75, 0, 0, 5875),
(1676, 4039, 10, 0, 0, 5, 0, 5875),
(1676, 4040, 450, 202, 50, 10, 0, 5875),
(1676, 7431, 150, 202, 50, 0, 0, 5875);

-- correct recipes for buzzek bracketswing
DELETE FROM `npc_trainer` WHERE `entry` = 8736 AND `spell` IN (23490, 23491, 23088, 19845, 19846);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
