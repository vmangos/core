DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230623091047');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230623091047');
-- Add your query below.


/*
 World of Warcraft Client Patch 1.7.0 (2005-09-13)
   A bug that allowed ghost players to pass through the Warsong Gulch
   starting gate has been fixed.
*/

-- Replace existing Ghost Gate spawns with data from classic.
DELETE FROM `gameobject` WHERE `id`=180322;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `patch_min`, `patch_max`) VALUES 
-- The Molten Span
(90061, 180322, 0, -7455.72, -1167.15, 306.354, 0.0548222, 0, 0, 0.0274076, 0.999624, 25, 25, 100, 1, 5, 10),
-- Alterac Valley starting gates
(90062, 180322, 30, -871.201, -558.544, 56.6479, 2.16421, 0, 0, 0.882947, 0.469473, 25, 25, 100, 1, 5, 10),
(90063, 180322, 30, 794.635, -493.643, 98.602, 3.03684, 0, 0, 0.998629, 0.0523532, 25, 25, 100, 1, 5, 10),
-- Warsong Gulch starting gates
(90064, 180322, 489, 1503.47, 1493.37, 351.735, 6.24828, 0, 0, -0.0174522, 0.999848, 25, 25, 100, 1, 5, 10),
(90065, 180322, 489, 1492.35, 1458.34, 342.371, 6.24828, 0, 0, -0.0174522, 0.999848, 25, 25, 100, 1, 5, 10),
(90066, 180322, 489, 949.952, 1422.75, 344.927, 0, 0, 0, 0, 1, 25, 25, 100, 1, 5, 10),
(90067, 180322, 489, 953.443, 1458.8, 341.429, 0.0523589, 0, 0, 0.0261765, 0.999657, 25, 25, 100, 1, 5, 10),
-- Arathi Basin starting gates
(90068, 180322, 529, 1284.64, 1280.68, -16.3592, 0.715585, 0, 0, 0.350207, 0.936672, 25, 25, 100, 1, 5, 10),
(90069, 180322, 529, 1275.31, 1293.16, -17.4161, 0.334872, 0, 0, 0.166655, 0.986015, 25, 25, 100, 1, 5, 10),
(90070, 180322, 529, 708.108, 708.618, -17.9548, 0.767944, 0, 0, 0.374606, 0.927184, 25, 25, 100, 1, 5, 10),
-- Ruins of Ahn'Qiraj near Skeram
(90071, 180322, 531, -8328.54, 2023.89, 118.371, 5.29686, 0, 0, -0.473413, 0.880841, 25, 25, 100, 1, 7, 10);

-- Add AV ghost gates to event.
INSERT INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (30, 253, 0, 'Ghost Gates');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES
(90062, 253, 0),
(90063, 253, 0);

-- Add WSG ghost gates to event.
INSERT INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (489, 253, 0, 'Ghost Gates');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES
(90064, 253, 0),
(90065, 253, 0),
(90066, 253, 0),
(90067, 253, 0);

-- Add AB ghost gates to event.
INSERT INTO `battleground_events` (`map`, `event1`, `event2`, `description`) VALUES (529, 253, 0, 'Ghost Gates');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES
(90068, 253, 0),
(90069, 253, 0),
(90070, 253, 0);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
