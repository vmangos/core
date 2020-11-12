DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201109223224');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201109223224');
-- Add your query below.


-- correct gossip for rwag
UPDATE `creature_template` SET `npc_flags` = 19, `gossip_menu_id` = 141 WHERE `entry` = 3155;
UPDATE `gossip_menu_option` SET `option_text` = 'I would like training.', `option_broadcast_text`=2603 WHERE `menu_id` = 141 AND `id` = 0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
