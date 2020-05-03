DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200503151755');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200503151755');
-- Add your query below.


-- Head of Onyxia Spawned
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (397, 50, 40135, 122, 0, 0, 0);
-- Head of Nefarian Spawned
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (398, 50, 40151, 122, 0, 0, 0);

-- Assign gossip menu to Field Marshal Afrasiabi.
DELETE FROM `npc_gossip` WHERE `npc_guid`=79656;
INSERT INTO `gossip_menu` VALUES (6028, 7178, 398);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (7178, 9874, 1);
UPDATE `creature_template` SET `gossip_menu_id`=6028 WHERE `entry`=14721;

-- Assign gossip menu to Major Mattingly.
DELETE FROM `npc_gossip` WHERE `npc_guid`=79854;
INSERT INTO `gossip_menu` VALUES (5753, 6937, 397);
UPDATE `creature_template` SET `gossip_menu_id`=5753 WHERE `entry`=14394;

-- Add missing gossips for Squire Rowe.
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (9063, 14385, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (9064, 14386, 0);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (9065, 14387, 1);
INSERT INTO `npc_text` (`ID`, `BroadcastTextID0`, `Probability0`) VALUES (9066, 14390, 1);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
