DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230321210230');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230321210230');
-- Add your query below.


-- This spawn should be of Door (179549) not Conservatory Door (176907).
UPDATE `gameobject` SET `id`=179549, `position_x`=351.568, `position_y`=88.6734, `position_z`=-36.393, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=397136;

-- This spawn should be of Conservatory Door (176907) not Door (179549).
UPDATE `gameobject` SET `id`=176907, `position_x`=131.286, `position_y`=-278.89, `position_z`=-56.5211, `orientation`=3.14159, `rotation0`=0, `rotation1`=0, `rotation2`=-1, `rotation3`=0 WHERE `guid`=363231;

-- Correct template data for doors.
UPDATE `gameobject_template` SET `faction`=114, `flags`=32 WHERE  `entry`=176907 AND `patch`=1;
UPDATE `gameobject_template` SET `flags`=34 WHERE  `entry`=179549 AND `patch`=1;

-- Target the correct door in Old Ironbark script.
DELETE FROM `gossip_scripts` WHERE `id`=560100;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(560100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9099, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Say Text'),
(560100, 0, 0, 3, 0, 10000, 65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 123.706, -278.828, -55.868, -10, 0, 'Old Ironbark - Move'),
(560100, 0, 0, 37, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Set Data'),
(560100, 10, 0, 80, 2, 0, 0, 0, 363231, 0, 12, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Set Door State'),
(560100, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9100, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Say Text'),
(560100, 10, 0, 1, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Emote'),
(560100, 12, 0, 48, 100, 1, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Old Ironbark - Die');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
