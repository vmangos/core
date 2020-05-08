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


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
