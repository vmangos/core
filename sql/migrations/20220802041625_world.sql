DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220802041625');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220802041625');
-- Add your query below.


-- Prevent Anvilrage Overseer and Scourge Footsoldier from leashing.
-- https://www.youtube.com/watch?v=iubDQuqvmJM
-- https://old.reddit.com/r/classicwow/comments/kvsmnc/blackrock_mercenaries_hunt_their_prey_on_this_day/
UPDATE `creature_template` SET `flags_extra`= (`flags_extra` | 268435456) WHERE `entry` IN (8889, 14486);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
