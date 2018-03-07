DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180121232738');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180121232738');
-- Add your query below.


-- Adjust old Flag Set command.
UPDATE `event_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `creature_movement_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `creature_spells_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `gossip_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `gameobject_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `spell_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `quest_start_scripts` SET `datalong3`=1 WHERE `command`=4;
UPDATE `quest_end_scripts` SET `datalong3`=1 WHERE `command`=4;

-- Adjust old Flag Remove command.
UPDATE `event_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `creature_movement_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `creature_spells_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `gossip_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `gameobject_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `spell_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `quest_start_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;
UPDATE `quest_end_scripts` SET `datalong3`=2, `command`=4 WHERE `command`=5;

-- Adjust old Go Lock State command.
UPDATE `event_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `event_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `event_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `event_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `creature_movement_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `creature_movement_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `creature_movement_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `creature_movement_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `creature_spells_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `creature_spells_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `creature_spells_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `creature_spells_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `gossip_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `gossip_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `gossip_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `gossip_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `gameobject_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `gameobject_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `gameobject_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `gameobject_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `spell_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `spell_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `spell_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `spell_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `quest_start_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `quest_start_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `quest_start_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `quest_start_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;
UPDATE `quest_end_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=1;
UPDATE `quest_end_scripts` SET `datalong`=9, `datalong2`=2, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=2;
UPDATE `quest_end_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=1, `command`=4 WHERE `command`=27 && `datalong`=4;
UPDATE `quest_end_scripts` SET `datalong`=9, `datalong2`=16, `datalong3`=2, `command`=4 WHERE `command`=27 && `datalong`=8;

-- Adjust old Modify NPC Flags command.
UPDATE `event_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `creature_movement_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `creature_spells_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `gossip_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `gameobject_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `spell_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `quest_start_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;
UPDATE `quest_end_scripts` SET `datalong3`=`datalong2`, `datalong2`=`datalong`, `datalong`=147, `command`=4 WHERE `command`=29;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
