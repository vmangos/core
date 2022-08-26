DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220823192212');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220823192212');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60018;
SET @CHEST2 := 60019;
SET @CHEST3 := 60020;
SET @CHEST4 := 60021;
SET @CHEST5 := 60022;
SET @CHEST6 := 60023;
SET @CHEST7 := 60024;
SET @CHEST8 := 60025;
SET @CHEST9 := 60026;

-- New pool guids
SET @POOL1 := 20008;
SET @POOL2 := 20009;
SET @POOL3 := 20010;
SET @POOL4 := 20011;
SET @POOL5 := 20012;

--  Missing spawns at Tirisfal
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,0,2036.27,-455.528,35.8657,2.25147,0,0,0.902585,0.430512,300,900,100,1,0,0,0,10),  -- Balnir Farmstead
(@CHEST2 ,106318,0,2155.44,-510.988,81.639,3.99681,0,0,-0.909961,0.414694,300,900,100,1,0,0,0,10),  -- Crusader Outpost
(@CHEST3,106318,0,2342.99,1319.23,34.0111,4.55531,0,0,-0.760406,0.649449,300,900,100,1,0,0,0,10),  -- Solliden Farmstead
(@CHEST4,106318,0,2550.12,783.427,110.544,3.07177,0,0,0.999391,0.0349061,300,900,100,1,0,0,0,10),  -- Agamand Mills
(@CHEST5,106318,0,2603.06,1464.46,-10.673,2.53072,0,0,0.953716,0.300708,300,900,100,1,0,0,0,10),   -- Whispering Shore
(@CHEST6,106318,0,2762.72,788.501,114.367,1.95477,0,0,0.829038,0.559193,300,900,100,1,0,0,0,10),   -- Agamand Mills
(@CHEST7,106318,0,2914.1,377.418,31.4822,3.57793,0,0,-0.976295,0.216442,300,900,100,1,0,0,0,10),   -- Garren's Haunt
(@CHEST8,106318,0,3026.86,373.43,-1.28392,3.26377,0,0,-0.998135,0.0610518,300,900,100,1,0,0,0,10), -- North Coast
(@CHEST9,106318,0,3058.99,2.03689,-1.59202,3.71755,0,0,-0.958819,0.284016,300,900,100,1,0,0,0,10); -- North Coast

-- Correct respawn times of existing chests in Tirisfal (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(45244,45257,45251,45240,45060);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Tirisfal - Agamand Mills',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Tirisfal - Coast',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Tirisfal - Solliden/Balnir Farmstead',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Tirisfal - Crusader Outposts',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(@CHEST4,@POOL1,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #1','0','0','10'),
(@CHEST6,@POOL1,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #2','0','0','10'),
(45257,@POOL1,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #3','0','0','10'),
(@CHEST8,@POOL2,0,'Battered Chests (106318) - Tirisfal - Coast #1','0','0','10'),
(@CHEST9,@POOL2,0,'Battered Chests (106318) - Tirisfal - Coast #2','0','0','10'),
(@CHEST5,@POOL2,0,'Battered Chests (106318) - Tirisfal - Coast #3','0','0','10'),
(45060,@POOL2,0,'Battered Chests (106318) - Tirisfal - Coast #4','0','0','10'),
(45244,@POOL3,0,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt #1','0','0','10'),
(@CHEST7,@POOL3,0,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt #2','0','0','10'),
(@CHEST3,@POOL4,0,'Battered Chests (106318) - Tirisfal - Solliden and Balnir Farmstead #1','0','0','10'),
(@CHEST1,@POOL4,0,'Battered Chests (106318) - Tirisfal - Solliden and Balnir Farmstead #2','0','0','10'),
(45251,@POOL5,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #1','0','0','10'),
(@CHEST2 ,@POOL5,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #2','0','0','10'),
(45240,@POOL5,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #3','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
