DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180208133833');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180208133833');
-- Add your query below.


DROP TABLE `creature_ai_texts`;

-- Meven Korgal
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES (166701, 1667, 0, 1, 0, 100, 1, 60000, 120000, 60000, 120000, 1, 314, 316, 317, 0, 0, 0, 0, 0, 0, 0, 0, 'Meven Korgal - Random Say on OOC');

-- Scarlet Convert
UPDATE `broadcast_text` SET `Language`=7 WHERE `ID` IN (2625, 2626, 2627, 2628);
UPDATE `creature_ai_scripts` SET `event_flags`=32, `action1_param1`=2625, `action1_param2`=2626, `action1_param3`=2627, `action2_type`=1, `action2_param1`=2626, `action2_param2`=2627, `action2_param3`=2628 WHERE `id`=150601;

-- Scarlet Warrior
UPDATE `creature_ai_scripts` SET `event_flags`=32, `action2_type`=1, `action2_param1`=2626, `action2_param2`=2627, `action2_param3`=2628 WHERE `id`=153501;

-- Adjust position of Angus Stern.
UPDATE `creature` SET `position_x`=-9080.1, `position_y`=823.091 WHERE `guid`=38225;

-- Fix Archmage Arugal's equipment.
UPDATE `creature` SET `equipment_id`=0 WHERE `guid`=16255;

-- Add Eastvale Logging Camp teleport location.
INSERT INTO `game_tele` VALUES (488, -9456.08, -1370.496, 46.66, 1.95, 0, 'EastvaleLoggingCamp');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
