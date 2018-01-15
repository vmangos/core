DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171207103729');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171207103729');
-- Add your query below.


-- Updating texts for script npc_vandar to broadcast ids.
DELETE FROM `script_texts` WHERE `entry` IN (-1050020, -1050021, -1050022, -1050023, -1050024, -1050025, -1050026, -1050027, -1050028, -1050029, -1050030);
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (10243, 10373, 12351, 12352, 10374, 8839, 8842, 8841, 8843, 8838, 8840);

-- Updating texts for script npc_drekthar to broadcast ids.
DELETE FROM `script_texts` WHERE `entry` IN (-1050006, -1050007, -1050008, -1050009, -1050010, -1050011, -1050012, -1050013);
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (10245, 10377, 10376, 8844, 8845, 8846, 8847, 8848, 8849);

-- Updating texts for script npc_balinda to broadcast ids.
DELETE FROM `script_texts` WHERE `entry` IN (-1050003, -1050004, -1050005);
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (10054, 10375, 10056);

-- Updating texts for script npc_galvangar to broadcast ids.
DELETE FROM `script_texts` WHERE `entry` IN (-1050001, -1050002, -1050000);
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (10055, 10057, 10378);

-- Text when Korrak spawns.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=9038;

-- Text when Lok'Holar spawns.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID`=8626;

-- Various npc texts.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID` IN (8887, 8905, 8907, 8913, 10339, 10342, 10347, 10357, 10358);

-- Ivus and Lokholar texts.
UPDATE `broadcast_text` SET `Type`=1 WHERE `ID` IN (8616, 8617, 8618, 8736, 8737, 8739, 8740);

-- Add gossip text to Arch Druid Renferal.
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (150112, 6174);

-- Add gossip text to Primalist Thurloga.
INSERT INTO `npc_gossip` (`npc_guid`, `textid`) VALUES (150106, 6093);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
