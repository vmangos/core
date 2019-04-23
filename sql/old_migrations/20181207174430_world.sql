DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181207174430');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181207174430');
-- Add your query below.


-- Add gossip menu for Darkmoon Faire Carnie
INSERT INTO `conditions` VALUES (944, 12, 4, 0, 0 ,0, 0); -- Event Darkmoon Faire Elwynn Active
INSERT INTO `conditions` VALUES (945, 12, 5, 0, 0 ,0, 0); -- Event Darkmoon Faire Mulgore Active
INSERT INTO `conditions` VALUES (946, -2, 944, 945, 0 ,0, 0); -- Event Darkmoon Faire Elwynn or Mulgore Active
INSERT INTO `gossip_menu` VALUES (6201, 7354, 0); -- Text while the faire is being built.
INSERT INTO `gossip_menu` VALUES (6201, 7382, 946); -- Text when its ready.
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (SELECT `guid` FROM `creature` WHERE `id`=14849);
UPDATE `creature_template` SET `gossip_menu_id`=6201, `npcflag` = 1 WHERE `entry` = 14849;

-- Gossip menu for Bankers
-- https://youtu.be/XccyLbaij2c?t=2352
-- https://youtu.be/XccyLbaij2c?t=2572
-- https://youtu.be/NmuWN_3Qkec?t=9257
UPDATE `creature_template` SET `npcflag` = 257 WHERE `entry` IN (2455, 2456, 2457, 3318, 3320);
UPDATE `creature_template` SET `npcflag` = 259 WHERE `entry` IN (4155, 3309);
UPDATE `creature_template` SET `gossip_menu_id`=1623 WHERE `entry` IN (3318, 3320, 3309);
DELETE FROM `npc_gossip` WHERE `npc_guid` IN (4653, 4655, 6598);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
