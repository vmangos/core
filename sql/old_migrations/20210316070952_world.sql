DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210316070952');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210316070952');
-- Add your query below.


-- Blasted Lands buffs from turning in quests shouldn't stack, just like the versions on the items.
INSERT INTO `spell_group` (`group_id`, `group_spell_id`, `spell_id`, `build_min`, `build_max`) VALUES
(1004, 3, 10671, 4695, 5875),
(1004, 4, 10691, 4695, 5875),
(1008, 5, 10670, 0, 5875),
(1008, 6, 10671, 0, 5875),
(1008, 7, 10672, 0, 5875),
(1008, 8, 10690, 0, 5875),
(1008, 9, 10691, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
