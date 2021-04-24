DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191208175148');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191208175148');
-- Add your query below.


-- No longer applicable texts.
DELETE FROM `mangos_string` WHERE `entry` IN (50, 368, 369);

-- Add condition id and remove extra requirements.
ALTER TABLE `areatrigger_teleport`
	ADD COLUMN `required_condition` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' AFTER `required_level`,
	DROP COLUMN `required_item`,
	DROP COLUMN `required_item2`,
	DROP COLUMN `required_quest_done`,
	DROP COLUMN `required_event`,
	DROP COLUMN `required_pvp_rank`,
	DROP COLUMN `required_team`;

-- Rank 6 or higher
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (59, 51, 6, 1, 0, 0, 0);
-- Rank 6 and Horde
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2527, -1, 2, 59, 0, 0, 0);
-- Rank 6 and Alliance
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (2532, -1, 3, 59, 0, 0, 0);
-- Completed quest Attunement to the Core (Alliance)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7848, 8, 7848, 0, 0, 0, 0);
-- Has item Drakefire Amulet
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (16309, 2, 16309, 1, 0, 0, 0);
-- Event AQ Gate not active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (126, 12, 83, 0, 0, 0, 1);
-- Completed quest Attunement to the Core (Horde)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (7487, 8, 7487, 0, 0, 0, 0);
-- Completed quest The Dread Citadel
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9121, 8, 9121, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9122, 8, 9122, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9123, 8, 9123, 0, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (9124, -2, 9121, 9122, 9123, 0, 0);

-- Hall of Legends - Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=2527 WHERE `id`=2527;
-- Champions' Hall - Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=2532 WHERE `id`=2532;
-- Transpolyporter - Gnomeregan to Booty Bay
UPDATE `areatrigger_teleport` SET `required_condition`=36 WHERE `id`=1104;
-- Transpolyporter - Booty Bay to Gnomeregan
UPDATE `areatrigger_teleport` SET `required_condition`=36 WHERE `id`=1103;
-- Molten Core - Window Lava Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=7848 WHERE `id`=3529;
-- Onyxia's Lair - Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=16309 WHERE `id`=2848;
-- Temple of Ahn'Qiraj - Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=126 WHERE `id`=4010;
-- Ruins Of Ahn'Qiraj - Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=126 WHERE `id`=4008;
-- Molten Core - Window Entrance
UPDATE `areatrigger_teleport` SET `required_condition`=7487 WHERE `id`=3528;
-- Naxxramas (Exit)
UPDATE `areatrigger_teleport` SET `required_condition`=9124, `name`='Naxxramas - Entrance' WHERE `id`=4055;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
