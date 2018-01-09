DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180107060206');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180107060206');
-- Add your query below.


-- Add buddy columns to script tables.
ALTER TABLE `quest_end_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;
	
ALTER TABLE `quest_start_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

ALTER TABLE `spell_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

ALTER TABLE `creature_spells_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

ALTER TABLE `creature_movement_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

ALTER TABLE `gameobject_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;
	
ALTER TABLE `event_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

ALTER TABLE `gossip_scripts`
	ADD COLUMN `buddy_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `datalong4`,
	ADD COLUMN `buddy_radius` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_id`,
	ADD COLUMN `buddy_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `buddy_radius`;

-- SCRIPT_COMMAND_TALK
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `quest_end_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `quest_end_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `quest_start_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `quest_start_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `spell_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `spell_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `creature_spells_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `creature_spells_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `creature_movement_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `creature_movement_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `gameobject_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `gameobject_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `event_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `event_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=0 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong4`, `buddy_type`=4, `datalong4`=0 WHERE `command`=0 && `datalong4`>0;
UPDATE `gossip_scripts` SET `data_flags`=1 WHERE `command`=0 && (`data_flags` & 2);
UPDATE `gossip_scripts` SET `data_flags`=2 WHERE `command`=0 && (`data_flags` & 4);

-- SCRIPT_COMMAND_EMOTE
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `spell_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `event_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && !(`data_flags` & 16);
UPDATE `gossip_scripts` SET `buddy_id`=`datalong3`, `buddy_type`=1, `datalong2`=0, `datalong3`=0 WHERE `command`=1 && `datalong2`>0 && (`data_flags` & 16);

-- SCRIPT_COMMAND_MOVE_TO
UPDATE `quest_end_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `quest_start_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `spell_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `creature_spells_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `creature_movement_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `gameobject_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `event_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;
UPDATE `gossip_scripts` SET `datalong3`=1 WHERE `command`=3 && `datalong2`=0;

-- SCRIPT_COMMAND_TELEPORT_TO
UPDATE `quest_end_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `quest_start_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `spell_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `creature_spells_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `creature_movement_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `gameobject_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `event_scripts` SET `data_flags`=1 WHERE `command`=6;
UPDATE `gossip_scripts` SET `data_flags`=1 WHERE `command`=6;

-- SCRIPT_COMMAND_TEMP_SUMMON_CREATURE
UPDATE `quest_end_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `quest_start_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `spell_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `creature_spells_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `creature_movement_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `gameobject_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `event_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;
UPDATE `gossip_scripts` SET `data_flags`=`data_flags`*16 WHERE `command`=10;

-- SCRIPT_COMMAND_REMOVE_AURA
UPDATE `quest_end_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `quest_start_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `spell_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `creature_spells_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `creature_movement_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `gameobject_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `event_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;
UPDATE `gossip_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=14 && `datalong2`=1;

-- SCRIPT_COMMAND_CAST_SPELL
UPDATE `quest_end_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `quest_end_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `quest_end_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `quest_end_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `quest_end_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `quest_end_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `quest_end_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `quest_start_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `quest_start_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `quest_start_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `quest_start_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `quest_start_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `quest_start_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `quest_start_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `spell_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `spell_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `spell_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `spell_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `spell_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `spell_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `spell_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `creature_spells_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `creature_spells_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `creature_spells_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `creature_spells_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `creature_spells_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `creature_spells_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `creature_spells_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `creature_movement_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `creature_movement_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `creature_movement_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `creature_movement_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `creature_movement_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `creature_movement_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `creature_movement_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `gameobject_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `gameobject_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `gameobject_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `gameobject_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `gameobject_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `gameobject_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `gameobject_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `event_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `event_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `event_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `event_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `event_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `event_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `event_scripts` SET `datalong3`=0 WHERE `command`=15;
UPDATE `gossip_scripts` SET `data_flags`=4 WHERE `command`=15 && (`datalong2` & 1) && NOT (`datalong2` & 2);
UPDATE `gossip_scripts` SET `data_flags`=5 WHERE `command`=15 && (`datalong2` & 2) && NOT (`datalong2` & 1);
UPDATE `gossip_scripts` SET `data_flags`=1 WHERE `command`=15 && (`datalong2` = 3);
UPDATE `gossip_scripts` SET `datalong3`=1 WHERE `command`=15 && (`datalong2` & 4);
UPDATE `gossip_scripts` SET `datalong3`=`datalong3`+2 WHERE `command`=15 && `datalong2` & 8;
UPDATE `gossip_scripts` SET `datalong2`=`datalong3` WHERE `command`=15;
UPDATE `gossip_scripts` SET `datalong3`=0 WHERE `command`=15;

-- SCRIPT_COMMAND_DESPAWN_CREATURE
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=18 && `datalong2`>0;

-- SCRIPT_COMMAND_MOVEMENT
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=20 && `datalong2`>0;

-- SCRIPT_COMMAND_SET_ACTIVEOBJECT
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=21 && `datalong2`>0;

-- SCRIPT_COMMAND_SET_FACTION
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=22 && `datalong2`>0;
UPDATE `quest_end_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `quest_start_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `spell_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `creature_spells_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `creature_movement_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `gameobject_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `event_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;
UPDATE `gossip_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=22;

-- SCRIPT_COMMAND_MORPH_TO_ENTRY_OR_MODEL
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=23 && `datalong2`>0;
UPDATE `quest_end_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `quest_start_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `spell_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `creature_spells_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `creature_movement_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `gameobject_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `event_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;
UPDATE `gossip_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=23;

-- SCRIPT_COMMAND_MOUNT_TO_ENTRY_OR_MODEL
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=24 && `datalong2`>0;
UPDATE `quest_end_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `quest_start_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `spell_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `creature_spells_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `creature_movement_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `gameobject_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `event_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;
UPDATE `gossip_scripts` SET `datalong2`=`data_flags`, `data_flags`=0 WHERE `command`=24;

-- SCRIPT_COMMAND_SET_RUN
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=25 && `datalong2`>0;

-- SCRIPT_COMMAND_ATTACK_START
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=26 && `datalong2`>0;

-- SCRIPT_COMMAND_GO_LOCK_STATE
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `buddy_type`=3, `datalong2`=0, `datalong3`=0 WHERE `command`=27 && `datalong2`>0;

-- SCRIPT_COMMAND_STAND_STATE
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong2`, `buddy_radius`=`datalong3`, `datalong2`=0, `datalong3`=0 WHERE `command`=28 && `datalong2`>0;

-- SCRIPT_COMMAND_MODIFY_NPC_FLAGS
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=29 && `datalong3`>0;

-- SCRIPT_COMMAND_TERMINATE_SCRIPT
UPDATE `quest_end_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `quest_start_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `spell_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `creature_spells_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `creature_movement_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `gameobject_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `event_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;
UPDATE `gossip_scripts` SET `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=31 && `data_flags`>0;

-- SCRIPT_COMMAND_ENTER_EVADE_MODE
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong`, `buddy_radius`=`datalong2`, `datalong`=0, `datalong2`=0 WHERE `command`=33 && `datalong`>0;

-- SCRIPT_COMMAND_TERMINATE_CONDITION
UPDATE `quest_end_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `quest_start_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `spell_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `creature_spells_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `creature_movement_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `gameobject_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `event_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;
UPDATE `gossip_scripts` SET `command`=32, `datalong3`=`data_flags`, `data_flags`=0 WHERE `command`=34;

-- SCRIPT_COMMAND_TURN_TO
UPDATE `quest_end_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `quest_start_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `spell_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `creature_spells_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `creature_movement_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `gameobject_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `event_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `gossip_scripts` SET `buddy_id`=`datalong3`, `buddy_radius`=`datalong4`, `datalong3`=0, `datalong4`=0 WHERE `command`=35 && `datalong3`>0;
UPDATE `quest_end_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `quest_end_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `quest_start_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `quest_start_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `spell_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `spell_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `creature_spells_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `creature_spells_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `creature_movement_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `creature_movement_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `gameobject_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `gameobject_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `event_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `event_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `gossip_scripts` SET `datalong`=0, `data_flags`=3 WHERE `command`=35 && `datalong`=2 && `datalong2`=0;
UPDATE `gossip_scripts` SET `datalong`=0, `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong`=2 && `datalong2`=1;
UPDATE `quest_end_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `quest_start_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `spell_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `creature_spells_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `creature_movement_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `gameobject_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `event_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;
UPDATE `gossip_scripts` SET `data_flags`=1, `datalong2`=0 WHERE `command`=35 && `datalong2`=1;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
