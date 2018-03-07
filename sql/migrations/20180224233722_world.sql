DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180224233722');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180224233722');
-- Add your query below.


UPDATE `creature_spells_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `creature_movement_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `spell_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `event_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `gossip_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `gameobject_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `quest_end_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);
UPDATE `quest_start_scripts` SET `datalong4` = `datalong4` + 2 WHERE `command`=3 && (`datalong2` = 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
