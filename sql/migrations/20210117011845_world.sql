DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210117011845');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210117011845');
-- Add your query below.


-- Restore data hack to Bubbly Fissure. It should be type 8 (Spell Focus), yet has no linked trap assigned, so no way to trigger aura.
-- Hack was removed here https://github.com/vmangos/core/blob/7e461e0d6e03d57618d8c59a389f22dcac274615/sql/old_migrations/20200212185807_world.sql#L908
UPDATE `gameobject_template` SET `type` = 6, `faction`=14, `data1` = 0, `data2` = 10, `data3` = 17775, `data5`=1 WHERE  `entry` = 177524;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
