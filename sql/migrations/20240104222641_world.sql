DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240104222641');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20240104222641');
-- Add your query below.


-- Fix not being able to use Brazier of Invocation in The Beast's room to summon Lord Valthalak.
-- The spell focus gameobjects need to be spawned at the same positon as the trigger creature (16048).
UPDATE `gameobject` SET `position_x`=50.1154, `position_y`=-534.537, `position_z`=111.02, `orientation`=6.16101 WHERE `guid` IN (99905, 396330);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
