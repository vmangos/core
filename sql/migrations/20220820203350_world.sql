DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220820203350');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220820203350');
-- Add your query below.

-- Insert missing spawn location for Battered Chest (id: 2843)

-- Elwynn Forest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(18186,2843,0,-9060.95,-463.424,72.5782,1.53589,0,0,0.694658,0.71934,3600,3600,100,1,0,0,0,10),
(18188,2843,0,-8955.38,-439.217,64.7955,3.42085,0,0,-0.990268,0.139175,3600,3600,100,1,0,0,0,10),
(18190,2843,0,-8564.62,-212.033,85.301,2.47837,0,0,0.945518,0.325568,3600,3600,100,1,0,0,0,10);

-- Teldrassil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(18192,2843,1,10485.3,1059.98,1325.47,5.23599,0,0,-0.5,0.866025,3600,3600,100,1,0,0,0,10),
(18194,2843,1,10504.8,1064.71,1325.83,6.00393,0,0,-0.139173,0.990268,3600,3600,100,1,0,0,0,10),
(18218,2843,1,10816.9,896.036,1336.03,0.349065,0,0,0.173648,0.984808,3600,3600,100,1,0,0,0,10),
(18199,2843,1,10908.4,977.762,1338.32,2.82743,0,0,0.987688,0.156436,3600,3600,100,1,0,0,0,10),
(18201,2843,1,10952.6,945.797,1340.77,4.2237,0,0,-0.857167,0.515038,3600,3600,100,1,0,0,0,10);

-- Dun Morogh
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(18203,2843,0,-6550.42,351.925,392.339,2.35619,0,0,0.92388,0.382683,3600,3600,100,1,0,0,0,10),
(18205,2843,0,-6507.27,688.761,387.274,5.96903,0,0,-0.156434,0.987688,3600,3600,100,1,0,0,0,10);

--  Tirisfal Glades
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(18207,2843,0,1788.8,1345.5,89.2825,5.34071,0,0,-0.45399,0.891007,3600,3600,100,1,0,0,0,10),
(18210,2843,0,1963.66,1383.45,64.1756,4.99164,0,0,-0.601814,0.798636,3600,3600,100,1,0,0,0,10),
(18212,2843,0,1965.06,1617.98,88.2024,4.92183,0,0,-0.62932,0.777146,3600,3600,100,1,0,0,0,10),
(18214,2843,0,2019.49,1853.65,102.669,4.18879,0,0,-0.866025,0.500001,3600,3600,100,1,0,0,0,10),
(18215,2843,0,2041.63,1935.11,106.99,4.67748,0,0,-0.719339,0.694659,3600,3600,100,1,0,0,0,10);

-- Battered Chest should contain some coins (PTR test)
UPDATE `gameobject_template` SET `mingold`=10, `maxgold`=50 WHERE `entry`=2843;

-- Tirisfal Glades pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(20000,1,'Battered Chests (2843)- Tirisfal - Deathknell',0,0,0,10),
(20001,1,'Battered Chests (2843)- Tirisfal - Deathknell - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45106,20000,0,'Battered Chest (2843) - Tirisfal - Deathknell #1','0','0','10'),
(18207,20000,0,'Battered Chest (2843) - Tirisfal - Deathknell #2','0','0','10'),
(18210,20000,0,'Battered Chest (2843) - Tirisfal - Deathknell #3','0','0','10'),
(18212,20000,0,'Battered Chest (2843) - Tirisfal - Deathknell #4','0','0','10'),
(45110,20001,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #1','0','0','10'),
(18214,20001,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #2','0','0','10'),
(18215,20001,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #3','0','0','10');

-- Dun Morogh pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(20002,1,'Battered Chests (2843) - Dun Morogh - Coldridge Valley',0,0,0,10),
(20003,1,'Battered Chests (2843) - Dun Morogh - Coldridge Valley - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1397,20002,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley #1','0','0','10'),
(18205,20002,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley #2','0','0','10'),
(1454,20003,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley - Cave #1','0','0','10'),
(18203,20003,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley - Cave #2','0','0','10');

-- Elwynn Forest pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(20004,1,'Battered Chests (2843) - Elwynn Forest - Northshire',0,0,0,10),
(20005,1,'Battered Chests (2843) - Elwynn Forest - Northshire - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(26756,20004,0,'Battered Chest (2843) - Elwynn Forest - Northshire #1','0','0','10'),
(34798,20004,0,'Battered Chest (2843) - Elwynn Forest - Northshire #2','0','0','10'),
(18186,20004,0,'Battered Chest (2843) - Elwynn Forest - Northshire #3','0','0','10'),
(18188,20004,0,'Battered Chest (2843) - Elwynn Forest - Northshire #4','0','0','10'),
(26749,20005,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #1','0','0','10'),
(34797,20005,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #2','0','0','10'),
(18190,20005,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #3','0','0','10');

-- Teldrassil pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(20006,1,'Battered Chests (2843) - Teldrassil - Shadowglen',0,0,0,10),
(20007,1,'Battered Chests (2843) - Teldrassil - Shadowglen - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(49529,20006,0,'Battered Chest (2843) - Teldrassil - Shadowglen #1','0','0','10'),
(18192,20006,0,'Battered Chest (2843) - Teldrassil - Shadowglen #2','0','0','10'),
(18194,20006,0,'Battered Chest (2843) - Teldrassil - Shadowglen #3','0','0','10'),
(49528,20007,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #1','0','0','10'),
(18218,20007,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #2','0','0','10'),
(18199,20007,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #3','0','0','10'),
(18201,20007,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #4','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
