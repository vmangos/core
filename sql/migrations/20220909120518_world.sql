DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220909120518');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220909120518');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60112;
SET @CHEST2 := 60113;
SET @CHEST3 := 60114;
SET @CHEST4 := 60115;
SET @CHEST5 := 60116;
SET @CHEST6 := 60117;
SET @CHEST7 := 60118;
SET @CHEST8 := 60119;
SET @CHEST9 := 60120;
SET @CHEST10 := 60121;
SET @CHEST11 := 60122;
SET @CHEST12 := 60123;
SET @CHEST13 := 60124;
SET @CHEST14 := 60125;
SET @CHEST15 := 60126;

-- New pool guids
SET @POOL1 := 20050;
SET @POOL2 := 20051;
SET @POOL3 := 20052;
SET @POOL4 := 20053;
SET @POOL5 := 20054;
SET @POOL6 := 20055;
SET @POOL7 := 20056;
SET @POOL8 := 20057;
SET @POOL9 := 20058;
SET @POOL10 := 20059;
SET @POOL11 := 20060;

--  Missing spawns at Dun Morgoth
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,0,-5906.34,-1873.73,404.95,5.91667,0,0,-0.182235,0.983255,300,900,100,1,0,0,0,10),   -- Helm\'s Bed Lake
(@CHEST2,106318,0,-5867.88,-1521.54,379.035,4.32842,0,0,-0.829037,0.559194,300,900,100,1,0,0,0,10),  -- Gol\'Bolar Quarry (Outside Cave)
(@CHEST3,106318,0,-5825.66,-1594.93,361.824,3.17653,0,0,-0.999847,0.0174693,300,900,100,1,0,0,0,10), -- Gol\'Bolar Quarry (Outside Cave)
(@CHEST4,106318,0,-5786.93,-1941.07,402.297,4.7473,0,0,-0.694658,0.71934,300,900,100,1,0,0,0,10),    -- Helm\'s Bed Lake
(@CHEST5,106318,0,-5671.38,-2125.01,400.913,2.40855,0,0,0.93358,0.358368,300,900,100,1,0,0,0,10),    -- Helm\'s Bed Lake
(@CHEST6,106318,0,-5658.51,657.265,383.448,2.63544,0,0,0.968147,0.250381,300,900,100,1,0,0,0,10),    -- Frostmane Hold
(@CHEST7,106318,0,-5632.21,-1793.37,358.769,1.309,0,0,0.608761,0.793354,300,900,100,1,0,0,0,10),     -- Gol\'Bolar Quarry Mine(Inside Cave)
(@CHEST8,106318,0,-5576.89,-1727.13,353.111,1.37881,0,0,0.636078,0.771625,300,900,100,1,0,0,0,10),   -- Gol\'Bolar Quarry Mine(Inside Cave)
(@CHEST9,106318,0,-5533.53,-1703.44,342.487,4.24115,0,0,-0.85264,0.522499,300,900,100,1,0,0,0,10),   -- Gol\'Bolar Quarry Mine(Inside Cave)
(@CHEST10,106318,0,-5480.54,-214.69,354.253,3.85718,0,0,-0.936671,0.35021,300,900,100,1,0,0,0,10),   -- The Grizzled Den
(@CHEST11,106318,0,-5454.07,-170.441,349.799,2.35619,0,0,0.92388,0.382683,300,900,100,1,0,0,0,10),   -- The Grizzled Den
(@CHEST12,106318,0,-5423.45,-307.859,358.594,1.65806,0,0,0.737277,0.675591,300,900,100,1,0,0,0,10),  -- The Grizzled Den
(@CHEST13,106318,0,-5335.97,-238.183,440.331,1.64061,0,0,0.731353,0.681999,300,900,100,1,0,0,0,10),  -- Shimmer Ridge
(@CHEST14,106318,0,-5299.75,-105.227,403.395,1.62316,0,0,0.725374,0.688355,300,900,100,1,0,0,0,10),  -- Iceflow Lake
(@CHEST15,106318,0,-5055.85,-264.972,442.079,4.04917,0,0,-0.898793,0.438373,300,900,100,1,0,0,0,10); -- Shimmer Ridge

-- Correct respawn times of existing chests in Dun Morgoth (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(9477,9932,9940,10048,10850,10856,10870,10891,29334,29343,29633,29638,32370);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Dun Morgoth - Gnomeregan',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Dun Morgoth - Frostmane Hold',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave)',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry (Outside Cave)',0,0,0,10),
(@POOL6,1,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake',0,0,0,10),
(@POOL7,1,'Battered Chests (106318) - Dun Morgoth - Iceflow Lake',0,0,0,10),
(@POOL8,1,'Battered Chests (106318) - Dun Morgoth - Shimmer Ridge',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(9477,@POOL1,0,'Battered Chests (106318) - Dun Morgoth - Gnomeregan #1',0,0,10),
(32370,@POOL1,0,'Battered Chests (106318) - Dun Morgoth - Gnomeregan #2',0,0,10),
(9932,@POOL2,0,'Battered Chests (106318) - Dun Morgoth - Frostmane Hold #1',0,0,10),
(9940,@POOL2,0,'Battered Chests (106318) - Dun Morgoth - Frostmane Hold #2',0,0,10),
(@CHEST6,@POOL2,0,'Battered Chests (106318) - Dun Morgoth - Frostmane Hold #3',0,0,10),
(10048,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #1',0,0,10),
(29334,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #2',0,0,10),
(29633,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #3',0,0,10),
(@CHEST10,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #4',0,0,10),
(@CHEST11,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #5',0,0,10),
(@CHEST12,@POOL3,0,'Battered Chests (106318) - Dun Morgoth - The Grizzled Den #6',0,0,10),
(10856,@POOL4,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave) #1',0,0,10),
(29343,@POOL4,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave) #2',0,0,10),
(@CHEST7,@POOL4,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave) #3',0,0,10),
(@CHEST8,@POOL4,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave) #4',0,0,10),
(@CHEST9,@POOL4,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry Mine (Inside Cave) #5',0,0,10),
(10850,@POOL5,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry (Outside Cave) #1',0,0,10),
(@CHEST2,@POOL5,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry (Outside Cave) #2',0,0,10),
(@CHEST3,@POOL5,0,'Battered Chests (106318) - Dun Morgoth - Gol\'Bolar Quarry (Outside Cave) #3',0,0,10),
(10870,@POOL6,0,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake #1',0,0,10),
(10891,@POOL6,0,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake #2',0,0,10),
(@CHEST1,@POOL6,0,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake #3',0,0,10),
(@CHEST4,@POOL6,0,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake #4',0,0,10),
(@CHEST5,@POOL6,0,'Battered Chests (106318) - Dun Morgoth - Helm\'s Bed Lake #5',0,0,10),
(29638,@POOL7,0,'Battered Chests (106318) - Dun Morgoth - Iceflow Lake #1',0,0,10),
(@CHEST14,@POOL7,0,'Battered Chests (106318) - Dun Morgoth - Iceflow Lake #2',0,0,10),
(@CHEST13,@POOL8,0,'Battered Chests (106318) - Dun Morgoth - Shimmer Ridge #1',0,0,10),
(@CHEST15,@POOL8,0,'Battered Chests (106318) - Dun Morgoth - Shimmer Ridge #2',0,0,10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
