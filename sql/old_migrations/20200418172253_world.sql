DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200418172253');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200418172253');
-- Add your query below.


-- add shackle undead 3 to preist trainers
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(377, 10956, 46000, 0, 0, 60, 0, 5875),
(3600, 10956, 46000, 0, 0, 60, 0, 5875),
(4090, 10956, 46000, 0, 0, 60, 0, 5875),
(4091, 10956, 46000, 0, 0, 60, 0, 5875),
(4092, 10956, 46000, 0, 0, 60, 0, 5875),
(11401, 10956, 46000, 0, 0, 60, 0, 5875),
(5141, 10956, 46000, 0, 0, 60, 0, 5875),
(5142, 10956, 46000, 0, 0, 60, 0, 5875),
(5143, 10956, 46000, 0, 0, 60, 0, 5875),
(11406, 10956, 46000, 0, 0, 60, 0, 5875),
(376, 10956, 46000, 0, 0, 60, 0, 5875),
(5484, 10956, 46000, 0, 0, 60, 0, 5875),
(5489, 10956, 46000, 0, 0, 60, 0, 5875),
(11397, 10956, 46000, 0, 0, 60, 0, 5875),
(1226, 10956, 46000, 0, 0, 60, 0, 5875);

-- remove starshards (all ranks) and elunes grace (all ranks) from Maxan Anvol (1226)
DELETE FROM `npc_trainer` WHERE `entry` = 1226 AND `spell` IN (19351, 19352, 19353, 19354, 19355, 19356, 19358, 19359, 19360, 19361);

-- add prayer of spirit (27845) to Theodrus Frostbeard (5141) and High Priest Rohan (11406)
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(5141, 27845, 2300, 0, 0, 60, 5302, 5875),
(11406, 27845, 2300, 0, 0, 60, 5302, 5875);

-- add starshards (all ranks) and  elunes grace(all ranks) to Nara Meideros (11397)
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(11397, 19351, 450, 0, 0, 18, 0, 5086),
(11397, 19351, 100, 0, 0, 18, 5302, 5875),
(11397, 19352, 1500, 0, 0, 26, 0, 5086),
(11397, 19352, 300, 0, 0, 26, 5302, 5875),
(11397, 19353, 3000, 0, 0, 34, 0, 5086),
(11397, 19353, 600, 0, 0, 34, 5302, 5875),
(11397, 19354, 5500, 0, 0, 42, 0, 5086),
(11397, 19354, 1100, 0, 0, 42, 5302, 5875),
(11397, 19355, 7500, 0, 0, 50, 0, 5086),
(11397, 19355, 1500, 0, 0, 50, 5302, 5875),
(11397, 19356, 47000, 0, 0, 58, 0, 5086),
(11397, 19356, 2200, 0, 0, 58, 5302, 5875),
(11397, 19358, 2500, 0, 0, 30, 0, 5086),
(11397, 19358, 500, 0, 0, 30, 5302, 5875),
(11397, 19359, 4500, 0, 0, 40, 0, 5086),
(11397, 19359, 900, 0, 0, 40, 5302, 5875),
(11397, 19360, 7500, 0, 0, 50, 0, 5086),
(11397, 19360, 1500, 0, 0, 50, 5302, 5875),
(11397, 19361, 11500, 0, 0, 60, 0, 5086),
(11397, 19361, 2070, 0, 0, 60, 5302, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
