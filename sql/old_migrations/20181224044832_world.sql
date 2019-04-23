DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181224044832');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181224044832');
-- Add your query below.


-- Gossip menu for Androl Oakhand.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (185, 7, 356, 150, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (186, 7, 356, 225, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry`=5665;
INSERT INTO `gossip_menu` VALUES (5665, 6961, 0);
INSERT INTO `gossip_menu` VALUES (5665, 6960, 185);
INSERT INTO `gossip_menu` VALUES (5665, 6793, 186);
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=3607;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
