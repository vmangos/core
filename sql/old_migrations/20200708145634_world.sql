DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200708145634');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200708145634');
-- Add your query below.


-- Replace use of direct field setting with stand state change command.
UPDATE `creature_ai_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `creature_movement_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `creature_spells_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `event_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `gossip_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `gameobject_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `spell_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `quest_end_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;
UPDATE `quest_start_scripts` SET `command`=28, `datalong`=`datalong2`, `datalong2`=0 WHERE `command`=2 && `datalong`=138;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
