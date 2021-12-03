DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211203033829');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211203033829');
-- Add your query below.


-- Improve start script for quest The Torch of Retribution.
DELETE FROM `quest_start_scripts` WHERE `id`=3453;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3453, 0, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Set Emote State to STATE_USESTANDING'),
(3453, 0, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Remove Npc Flags'),
(3453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3442, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Say Text'),
(3453, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Set Emote State to ONESHOT_NONE'),
(3453, 12, 15, 12511, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Cast Spell Torch Combine'),
(3453, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4448, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Say Text'),
(3453, 19, 9, 16762, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Torch of Retribution - Respawn GameObject'),
(3453, 21, 9, 24166, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Light of Retribution - Respawn GameObject'),
(3453, 22, 1, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Emote OneShotKneel'),
(3453, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4449, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Say Text'),
(3453, 27, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Add Npc Flags'),
(3453, 27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4450, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Kalaran Windblade - Say Text'),
(3453, 27, 7, 3453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Torch of Retribution: Player - Complete Quest');

-- Correct spawn position of Torch of Retribution.
UPDATE `gameobject` SET `position_x`=-6681.14, `position_y`=-1194.52, `position_z`=241.825, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659, `spawntimesecsmin`=-21, `spawntimesecsmax`=-21 WHERE `guid`=16762;
-- Correct spawn position of Light of Retribution.
UPDATE `gameobject` SET `position_x`=-6681.09, `position_y`=-1194.03, `position_z`=239.471, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934, `spawntimesecsmin`=-19, `spawntimesecsmax`=-19 WHERE `guid`=24166;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
