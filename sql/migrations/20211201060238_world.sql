DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211201060238');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211201060238');
-- Add your query below.


-- Start script for quest The Divination.
DELETE FROM `quest_start_scripts` WHERE `id`=2992;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(2992, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Remove Npc Flags'),
(2992, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4126, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Say Text'),
(2992, 2, 15, 5017, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Cast Spell Divining Trance'),
(2992, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4128, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Say Text'),
(2992, 9, 9, 10080, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Grimshade\'s Vision - Respawn GameObject'),
(2992, 9, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Thadius Grimshade - Add Npc Flags'),
(2992, 10, 7, 2992, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Divination: Player - Complete Quest');

-- Correct spawn position of Grimshade's Vision.
UPDATE `gameobject` SET `position_x`=-10999.1, `position_y`=-3484.59, `position_z`=104.045, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=10080;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
