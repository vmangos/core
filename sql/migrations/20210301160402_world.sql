DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210301160402');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210301160402');
-- Add your query below.


-- Mouse
UPDATE `creature_template` SET `auras`='' WHERE `entry`=6271;

-- Spirit Healer
UPDATE `creature_template` SET `auras`='10848 9036' WHERE `entry`=6491;

-- Franclorn Forgewright
UPDATE `creature_template` SET `auras`='10848 9617 9036' WHERE `entry`=8888;

-- Gaeriyan
UPDATE `creature` SET `position_x`=-6946.937, `position_y`=-3944.356, `position_z`=32.399, `movement_type`=1, `wander_distance`=8 WHERE `guid`=51781;
DELETE FROM `creature_addon` WHERE `guid`=51781;
UPDATE `creature_template` SET `auras`='10848 9617 9036' WHERE `entry`=9299;
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (3909, 8, 3909, 0, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES (1914, 2567);
UPDATE `gossip_menu` SET `condition_id`=3909 WHERE `entry`=1914 && `text_id`=2568;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
