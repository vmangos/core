DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220820203350');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220820203350');
-- Add your query below.

-- New chest guids
SET @CHEST1  := 60003;
SET @CHEST2  := 60004;
SET @CHEST3  := 60005;
SET @CHEST4  := 60006;
SET @CHEST5  := 60007;
SET @CHEST6  := 60008;
SET @CHEST7  := 60009;
SET @CHEST8  := 60010;
SET @CHEST9  := 60011;
SET @CHEST10 := 60012;
SET @CHEST11 := 60013;
SET @CHEST12 := 60014;
SET @CHEST13 := 60015;
SET @CHEST14 := 60016;
SET @CHEST15 := 60017;

-- New pool guids
SET @POOL1 := 20000;
SET @POOL2 := 20001;
SET @POOL3 := 20002;
SET @POOL4 := 20003;
SET @POOL5 := 20004;
SET @POOL6 := 20005;
SET @POOL7 := 20006;
SET @POOL8 := 20007;

-- Correct respawn times of existing chests (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(1397,1454,26749,26756,34797,34798,45106,45110,49528,49529);

-- Insert missing spawn location for Battered Chest (id: 2843)
-- Elwynn Forest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,2843,0,-9060.95,-463.424,72.5782,1.53589,0,0,0.694658,0.71934,300,900,100,1,0,0,0,10),
(@CHEST2,2843,0,-8955.38,-439.217,64.7955,3.42085,0,0,-0.990268,0.139175,300,900,100,1,0,0,0,10),
(@CHEST3,2843,0,-8564.62,-212.033,85.301,2.47837,0,0,0.945518,0.325568,300,900,100,1,0,0,0,10);

-- Teldrassil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST4,2843,1,10485.3,1059.98,1325.47,5.23599,0,0,-0.5,0.866025,300,900,100,1,0,0,0,10),
(@CHEST5,2843,1,10504.8,1064.71,1325.83,6.00393,0,0,-0.139173,0.990268,300,900,100,1,0,0,0,10),
(@CHEST6,2843,1,10816.9,896.036,1336.03,0.349065,0,0,0.173648,0.984808,300,900,100,1,0,0,0,10),
(@CHEST7,2843,1,10908.4,977.762,1338.32,2.82743,0,0,0.987688,0.156436,300,900,100,1,0,0,0,10),
(@CHEST8,2843,1,10952.6,945.797,1340.77,4.2237,0,0,-0.857167,0.515038,300,900,100,1,0,0,0,10);

-- Dun Morogh
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST9,2843,0,-6550.42,351.925,392.339,2.35619,0,0,0.92388,0.382683,300,900,100,1,0,0,0,10),
(@CHEST10,2843,0,-6507.27,688.761,387.274,5.96903,0,0,-0.156434,0.987688,300,900,100,1,0,0,0,10);

--  Tirisfal Glades
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST11,2843,0,1788.8,1345.5,89.2825,5.34071,0,0,-0.45399,0.891007,300,900,100,1,0,0,0,10),
(@CHEST12,2843,0,1963.66,1383.45,64.1756,4.99164,0,0,-0.601814,0.798636,300,900,100,1,0,0,0,10),
(@CHEST13,2843,0,1965.06,1617.98,88.2024,4.92183,0,0,-0.62932,0.777146,300,900,100,1,0,0,0,10),
(@CHEST14,2843,0,2019.49,1853.65,102.669,4.18879,0,0,-0.866025,0.500001,300,900,100,1,0,0,0,10),
(@CHEST15,2843,0,2041.63,1935.11,106.99,4.67748,0,0,-0.719339,0.694659,300,900,100,1,0,0,0,10);

-- Tirisfal Glades pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (2843)- Tirisfal - Deathknell',0,0,0,10),
(@POOL2,1,'Battered Chests (2843)- Tirisfal - Deathknell - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(45106,@POOL1,0,'Battered Chest (2843) - Tirisfal - Deathknell #1','0','0','10'),
(@CHEST11,@POOL1,0,'Battered Chest (2843) - Tirisfal - Deathknell #2','0','0','10'),
(@CHEST12,@POOL1,0,'Battered Chest (2843) - Tirisfal - Deathknell #3','0','0','10'),
(@CHEST13,@POOL1,0,'Battered Chest (2843) - Tirisfal - Deathknell #4','0','0','10'),
(45110,@POOL2,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #1','0','0','10'),
(@CHEST14,@POOL2,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #2','0','0','10'),
(@CHEST15,@POOL2,0,'Battered Chest (2843) - Tirisfal - Deathknell - Cave #3','0','0','10');

-- Dun Morogh pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL3,1,'Battered Chests (2843) - Dun Morogh - Coldridge Valley',0,0,0,10),
(@POOL4,1,'Battered Chests (2843) - Dun Morogh - Coldridge Valley - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(1397,@POOL3,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley #1','0','0','10'),
(@CHEST10,@POOL3,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley #2','0','0','10'),
(1454,@POOL4,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley - Cave #1','0','0','10'),
(@CHEST9,@POOL4,0,'Battered Chest (2843) - Dun Morogh - Coldridge Valley - Cave #2','0','0','10');

-- Elwynn Forest pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL5,1,'Battered Chests (2843) - Elwynn Forest - Northshire',0,0,0,10),
(@POOL6,1,'Battered Chests (2843) - Elwynn Forest - Northshire - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(26756,@POOL5,0,'Battered Chest (2843) - Elwynn Forest - Northshire #1','0','0','10'),
(34798,@POOL5,0,'Battered Chest (2843) - Elwynn Forest - Northshire #2','0','0','10'),
(@CHEST1,@POOL5,0,'Battered Chest (2843) - Elwynn Forest - Northshire #3','0','0','10'),
(@CHEST2,@POOL5,0,'Battered Chest (2843) - Elwynn Forest - Northshire #4','0','0','10'),
(26749,@POOL6,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #1','0','0','10'),
(34797,@POOL6,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #2','0','0','10'),
(@CHEST3,@POOL6,0,'Battered Chest (2843) - Elwynn Forest - Northshire - Cave #3','0','0','10');

-- Teldrassil pooling
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL7,1,'Battered Chests (2843) - Teldrassil - Shadowglen',0,0,0,10),
(@POOL8,1,'Battered Chests (2843) - Teldrassil - Shadowglen - Cave',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(49529,@POOL7,0,'Battered Chest (2843) - Teldrassil - Shadowglen #1','0','0','10'),
(@CHEST4,@POOL7,0,'Battered Chest (2843) - Teldrassil - Shadowglen #2','0','0','10'),
(@CHEST5,@POOL7,0,'Battered Chest (2843) - Teldrassil - Shadowglen #3','0','0','10'),
(49528,@POOL8,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #1','0','0','10'),
(@CHEST6,@POOL8,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #2','0','0','10'),
(@CHEST7,@POOL8,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #3','0','0','10'),
(@CHEST8,@POOL8,0,'Battered Chest (2843) - Teldrassil - Shadowglen - Cave #4','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
