DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200515114641');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200515114641');
-- Add your query below.


-- add correct recipes to bena winterhoof
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(3009, 2339, 100, 171, 25, 0, 0, 5875),
(3009, 2340, 135, 171, 40, 0, 0, 5875),
(3009, 3179, 450, 171, 90, 0, 0, 5875),
(3009, 3181, 1350, 171, 120, 0, 0, 5875),
(3009, 3184, 50, 171, 15, 0, 0, 5875),
(3009, 3185, 1350, 171, 125, 0, 0, 5875),
(3009, 3186, 1800, 171, 130, 0, 0, 5875),
(3009, 3458, 3600, 171, 110, 0, 0, 5875),
(3009, 7180, 405, 171, 90, 0, 0, 5875),
(3009, 7838, 225, 171, 80, 0, 0, 5875),
(3009, 7839, 900, 171, 130, 0, 0, 5875),
(3009, 7842, 900, 171, 100, 0, 0, 5875),
(3009, 7846, 2700, 171, 140, 0, 0, 5875),
(3009, 11536, 225, 171, 50, 0, 0, 5875);

-- add correct recipes to jaxin chong
DELETE FROM `npc_trainer` WHERE `entry` = 2837;
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(2837, 2275, 10, 0, 0, 5, 0, 5875),
(2837, 2280, 450, 171, 50, 10, 0, 5875),
(2837, 2339, 100, 171, 25, 0, 0, 5875),
(2837, 2340, 135, 171, 40, 0, 0, 5875),
(2837, 2341, 250, 171, 55, 0, 0, 5875),
(2837, 3179, 450, 171, 90, 0, 0, 5875),
(2837, 3181, 1350, 171, 120, 0, 0, 5875),
(2837, 3184, 50, 171, 15, 0, 0, 5875),
(2837, 3185, 1350, 171, 125, 0, 0, 5875),
(2837, 3186, 1800, 171, 130, 0, 0, 5875),
(2837, 3458, 3600, 171, 110, 0, 0, 5875),
(2837, 7180, 405, 171, 90, 0, 0, 5875),
(2837, 7838, 225, 171, 80, 0, 0, 5875),
(2837, 7839, 900, 171, 130, 0, 0, 5875),
(2837, 7842, 900, 171, 100, 0, 0, 5875),
(2837, 7846, 2700, 171, 140, 0, 0, 5875),
(2837, 11536, 225, 171, 50, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
