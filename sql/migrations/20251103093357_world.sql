DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251103093357');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251103093357');
-- Add your query below.


-- Alliance

-- Fix quest Complete Quest Chicken Clucking for a Mint.
DELETE FROM `creature_ai_scripts` WHERE `id`=511101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(511101, 0, 0, 8, 5111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Firebrew - Complete Quest Chicken Clucking for a Mint'),
(511101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10786, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Firebrew - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8353;

-- Fix quest Complete Dancing for Marzipan.
DELETE FROM `creature_ai_scripts` WHERE `id`=673501;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(673501, 0, 0, 8, 6735, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Saelienne - Complete Quest Dancing for Marzipan'),
(673501, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10787, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Saelienne - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8357;

-- Fix quest Complete Flexing for Nougat.
DELETE FROM `creature_ai_scripts` WHERE `id`=674001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(674001, 0, 0, 8, 6740, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Allison - Complete Quest Flexing for Nougat'),
(674001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10789, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Allison - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8356;

-- Fix quest Complete Dancing for Marzipan.
DELETE FROM `creature_ai_scripts` WHERE `id`=682601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(682601, 0, 0, 8, 6826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Talvash del Kissel - Complete Quest Incoming Gumdrop'),
(682601, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10799, 0, 0, 0, 0, 0, 0, 0, 0, 'Talvash del Kissel - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8355;

-- Horde

-- Fix quest Complete Quest Chicken Clucking for a Mint.
DELETE FROM `creature_ai_scripts` WHERE `id`=674101;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(674101, 0, 0, 8, 6741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Norman - Complete Quest Chicken Clucking for a Mint'),
(674101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10798, 0, 0, 0, 0, 0, 0, 0, 0, 'Innkeeper Norman - Say Text');
UPDATE `quest_template` SET `SpecialFlags`=1 WHERE `entry`=8354;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
