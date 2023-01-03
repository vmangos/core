DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221002141408');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221002141408');
-- Add your query below.


-- Move AV loot to database.
ALTER TABLE `battleground_template`
	CHANGE COLUMN `alliance_start_location` `alliance_start_location` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'WorldSafeLocs.dbc' AFTER `horde_lose_spell`,
	CHANGE COLUMN `horde_start_location` `horde_start_location` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'WorldSafeLocs.dbc' AFTER `alliance_start_location`,
	ADD COLUMN `player_loot_id` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'entry from reference_loot_template' AFTER `horde_start_location`;

UPDATE `battleground_template` SET `player_loot_id`=1 WHERE `id`=1 && `patch` >= 3;

-- 4138: Source Is Race (Human)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4138, 14, 1, 0, 0, 0, 2);
-- 4139: Source Is Race (Dwarf)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4139, 14, 4, 0, 0, 0, 2);
-- 4140: Source Is Race (Night Elf)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4140, 14, 8, 0, 0, 0, 2);
-- 4141: Source Is Race (Gnome)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4141, 14, 64, 0, 0, 0, 2);
-- 4142: Source Is Race (Orc)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4142, 14, 2, 0, 0, 0, 2);
-- 4143: Source Is Race (Undead)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4143, 14, 16, 0, 0, 0, 2);
-- 4144: Source Is Race (Tauren)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4144, 14, 32, 0, 0, 0, 2);
-- 4145: Source Is Race (Troll)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4145, 14, 128, 0, 0, 0, 2);
-- 4146: Source Is Team Horde
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4146, 6, 67, 0, 0, 0, 2);
-- 4147: Source Is Team Alliance
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4147, 6, 469, 0, 0, 0, 2);
-- 4148: Target's PvP Rank Is Equal Or Less Than 5
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4148, 51, 5, 2, 0, 0, 0);
-- 4149: (3: Source Is Team Alliance) And (4148: Source's PvP Rank Is Equal Or Less Than 5)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4149, -1, 3, 4148, 0, 0, 2);
-- 4150: (2: Source Is Team Horde) And (4148: Source's PvP Rank Is Equal Or Less Than 5)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4150, -1, 2, 4148, 0, 0, 2);
-- 4151: Target's PvP Rank Is Equal Or Less Than 9
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4151, 51, 9, 2, 0, 0, 0);
-- 4152: (3: Source Is Team Alliance) And (59: Source's PvP Rank Is Equal Or Greater Than 6) And (4151: Source's PvP Rank Is Equal Or Less Than 9)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4152, -1, 3, 59, 4151, 0, 2);
-- 4153: (2: Source Is Team Horde) And (59: Source's PvP Rank Is Equal Or Greater Than 6) And (4151: Source's PvP Rank Is Equal Or Less Than 9)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4153, -1, 2, 59, 4151, 0, 2);
-- 4154: Target's PvP Rank Is Equal Or Greater Than 10
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4154, 51, 10, 1, 0, 0, 0);
-- 4155: (3: Source Is Team Alliance) And (4154: Source's PvP Rank Is Equal Or Greater Than 10)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4155, -1, 3, 4154, 0, 0, 2);
-- 4156: (2: Source Is Team Horde) And (4154: Source's PvP Rank Is Equal Or Greater Than 10)
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4156, -1, 2, 4154, 0, 0, 2);

-- Add loot template for AV.
INSERT INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES 
(1, 18144, 100, 0, 1, 1, 4138, 3, 10), -- Human Bone Chip
(1, 18206, 100, 0, 1, 1, 4139, 3, 10), -- Dwarf Spine
(1, 18142, 100, 0, 1, 1, 4140, 3, 10), -- Severed Night Elf Head
(1, 18143, 100, 0, 1, 1, 4141, 3, 10), -- Tuft of Gnome Hair
(1, 18207, 100, 0, 1, 1, 4142, 3, 10), -- Orc Tooth
(1, 18147, 100, 0, 1, 1, 4143, 3, 10), -- Forsaken Heart
(1, 18145, 100, 0, 1, 1, 4144, 3, 10), -- Tauren Hoof
(1, 18146, 100, 0, 1, 1, 4145, 3, 10), -- Darkspear Troll Mojo
(1, 17423, 100, 0, 1, 1, 4146, 3, 10), -- Storm Crystal
(1, 17306, 100, 0, 1, 1, 4147, 3, 10), -- Stormpike Soldier's Blood
(1, 17326, 75, 0, 1, 1, 4149, 3, 10), -- Stormpike Soldier's Flesh 
(1, 17502, 75, 0, 1, 1, 4150, 3, 10), -- Frostwolf Soldier's Medal
(1, 17327, 75, 0, 1, 1, 4152, 3, 10), -- Stormpike Lieutenant's Flesh
(1, 17503, 75, 0, 1, 1, 4153, 3, 10), -- Frostwolf Lieutenant's Medal
(1, 17328, 75, 0, 1, 1, 4155, 3, 10), -- Stormpike Commander's Flesh
(1, 17504, 75, 0, 1, 1, 4156, 3, 10); -- Frostwolf Commander's Medal


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
