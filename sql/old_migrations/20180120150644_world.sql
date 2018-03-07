DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180120150644');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180120150644');
-- Add your query below.


-- Squibby Overspeck
-- Source: https://youtu.be/t9-p76s-G5k?t=3h8m4s
DELETE FROM `npc_gossip` WHERE `npc_guid`=369;
UPDATE `creature_template` SET `gossip_menu_id`=3842 WHERE `entry`=12137;

-- Snurk Bucksquick
-- Source: cMaNGOS, Trinity
DELETE FROM `npc_gossip` WHERE `npc_guid`=3463;
UPDATE `creature_template` SET `gossip_menu_id`=3841 WHERE `entry`=12136;

-- Frezza
-- Source: https://youtu.be/D9O903Wnmb4?t=1h27m45s
DELETE FROM `npc_gossip` WHERE `npc_guid`=3464;
UPDATE `creature_template` SET `gossip_menu_id`=1969 WHERE `entry`=9564;

-- Nez'raz
-- Source: https://youtu.be/6DTmw7FvKCk?t=3h44m20s
DELETE FROM `npc_gossip` WHERE `npc_guid`=368;
UPDATE `creature_template` SET `gossip_menu_id`=2441 WHERE `entry`=3149;

-- Hin Denburg
-- Source: cMaNGOS, Trinity
DELETE FROM `npc_gossip` WHERE `npc_guid`=32037;
UPDATE `creature_template` SET `gossip_menu_id`=2101 WHERE `entry`=3150;

-- Zapetta
-- Source: cMaNGOS, Trinity
DELETE FROM `npc_gossip` WHERE `npc_guid`=32036;
UPDATE `creature_template` SET `gossip_menu_id`=1971 WHERE `entry`=9566;

-- Gossip option "Where is the zeppelin now?" was added in TBC.
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (3842, 3841, 1969, 2441, 2101, 1971);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
