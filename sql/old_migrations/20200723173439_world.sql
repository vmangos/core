DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200723173439');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200723173439');
-- Add your query below.

-- blacksmithing
-- correct recipes to dane lindgren
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(957, 3341, 90, 164, 25, 0, 0, 5875);

-- correct recipes to theerum deepforge
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(5511, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to rotgath stonebeard
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(10276, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to james van brunt
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4596, 2020, 9, 0, 0, 5, 0, 5875),
(4596, 2743, 50, 164, 1, 0, 0, 5875),
(4596, 2744, 90, 164, 35, 0, 0, 5875),
(4596, 2746, 90, 164, 65, 0, 0, 5875),
(4596, 2747, 180, 164, 70, 0, 0, 5875),
(4596, 2754, 45, 164, 15, 0, 0, 5875),
(4596, 2755, 45, 164, 20, 0, 0, 5875),
(4596, 2756, 45, 164, 25, 0, 0, 5875),
(4596, 3118, 90, 164, 65, 0, 0, 5875),
(4596, 3299, 225, 164, 35, 0, 0, 5875),
(4596, 3300, 450, 164, 70, 0, 0, 5875),
(4596, 3340, 45, 164, 20, 0, 0, 5875),
(4596, 3341, 90, 164, 25, 0, 0, 5875),
(4596, 3342, 90, 164, 40, 0, 0, 5875),
(4596, 3343, 180, 164, 45, 0, 0, 5875),
(4596, 3344, 225, 164, 75, 0, 0, 5875),
(4596, 7409, 270, 164, 65, 0, 0, 5875),
(4596, 8881, 90, 164, 30, 0, 0, 5875),
(4596, 9984, 90, 164, 30, 0, 0, 5875);

-- correct recipes to traugh
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3478, 2020, 9, 0, 0, 5, 0, 5875),
(3478, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to clarise gnarltree
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3136, 2020, 9, 0, 0, 5, 0, 5875),
(3136, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to karn stonehoof
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(2998, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to snarl
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1383, 2743, 50, 164, 1, 0, 0, 5875);

-- correct recipes to bengus deepforge
DELETE FROM `npc_trainer` WHERE `spell` IN (10002, 9960) AND `entry` = 4258;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4258, 2743, 50, 164, 1, 0, 0, 5875),
(4258, 3516, 600, 164, 100, 0, 0, 5875),
(4258, 3345, 1000, 164, 110, 0, 0, 5875),
(4258, 19670, 600, 164, 100, 0, 0, 5875);

-- correct recipes to saru steelfury
DELETE FROM `npc_trainer` WHERE `spell` IN (10002, 9960) AND `entry` = 3355;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3355, 2743, 50, 164, 1, 0, 0, 5875),
(3355, 3345, 1000, 164, 110, 0, 0, 5875),
(3355, 3516, 600, 164, 100, 0, 0, 5875),
(3355, 19670, 600, 164, 100, 0, 0, 5875);

-- correct recipes to brikk keenkraft
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(2836, 2743, 50, 164, 1, 0, 0, 5875),
(2836, 3345, 1000, 164, 110, 0, 0, 5875),
(2836, 3516, 600, 164, 100, 0, 0, 5875),
(2836, 19670, 600, 164, 100, 0, 0, 5875);


-- tailoring
-- correct recipes to mahani
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3704, 3911, 10, 0, 0, 5, 0, 5875);

-- correct recipes to me lynn
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4159, 3911, 10, 0, 0, 5, 0, 5875);

-- correct recipes to meilosh
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(11557, 12117, 2400, 197, 230, 0, 0, 5875);

-- correct recipes to shadoweave tailors
DELETE FROM `npc_trainer` WHERE `entry` = 9584 AND `spell` IN (3917, 12117, 12118);
DELETE FROM `npc_trainer` WHERE `entry` = 4578 AND `spell` IN (3917, 12117, 12118);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
