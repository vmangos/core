DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200508153112');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200508153112');
-- Add your query below.


-- remove incorrect recipes from Tel'Athir
DELETE FROM `npc_trainer` WHERE `entry` = 5500 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Milla Fairancora
DELETE FROM `npc_trainer` WHERE `entry` = 11041 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Alchemist Mallory
DELETE FROM `npc_trainer` WHERE `entry` = 1215 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Cyndra Kindwhisper
DELETE FROM `npc_trainer` WHERE `entry` = 3603 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Ghak Healtouch
DELETE FROM `npc_trainer` WHERE `entry` = 1470 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Whuut
DELETE FROM `npc_trainer` WHERE `entry` = 11046 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Kray
DELETE FROM `npc_trainer` WHERE `entry` = 11047 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Carolai Anise
DELETE FROM `npc_trainer` WHERE `entry` = 2132 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Miao'zan
DELETE FROM `npc_trainer` WHERE `entry` = 3184 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Doctor Martin Felben
DELETE FROM `npc_trainer` WHERE `entry` = 11044 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove incorrect recipes from Ghak Healtouch
DELETE FROM `npc_trainer` WHERE `entry` = 1470 AND `spell` NOT IN (2275,3184, 2339, 2340, 11536, 2341);

-- remove mighty troll's blood potion from sylvanna forestmoon
DELETE FROM `npc_trainer` WHERE `entry` = 11042 AND `spell` = 13030;

-- remove mighty troll's blood potion from yelmak
DELETE FROM `npc_trainer` WHERE `entry` = 3347 AND `spell` = 13030;

-- add correct recipes to ainethil
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4160, 2341, 1000, 171, 55, 0, 0, 5875),
(4160, 3178, 5400, 171, 175, 0, 0, 5875),
(4160, 11488, 8100, 171, 205, 0, 0, 5875),
(4160, 11486, 7200, 171, 205, 0, 0, 5875),
(4160, 22809, 9000, 171, 215, 0, 0, 5875),
(4160, 11491, 9000, 171, 215, 0, 0, 5875);

-- add correct recipes to doctor herbert halsey
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(4611, 2341, 1000, 171, 55, 0, 0, 5875),
(4611, 3178, 5400, 171, 175, 0, 0, 5875),
(4611, 11488, 8100, 171, 205, 0, 0, 5875),
(4611, 11486, 7200, 171, 205, 0, 0, 5875),
(4611, 22809, 9000, 171, 215, 0, 0, 5875),
(4611, 11491, 9000, 171, 215, 0, 0, 5875);

-- add correct recipes to rogvar
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(1386, 2341, 1000, 171, 55, 0, 0, 5875),
(1386, 3178, 5400, 171, 175, 0, 0, 5875);

-- add correct recipes to kylanna windwhisper
INSERT INTO `npc_trainer` (`entry`, `spell`, `spellcost`, `reqskill`, `reqskillvalue`, `reqlevel`, `build_min`, `build_max`) VALUES
(7948, 2341, 1000, 171, 55, 0, 0, 5875),
(7948, 3178, 5400, 171, 175, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
