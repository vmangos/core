DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220909102846');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220909102846');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60092;
SET @CHEST2 := 60093;
SET @CHEST3 := 60094;
SET @CHEST4 := 60095;
SET @CHEST5 := 60096;
SET @CHEST6 := 60097;
SET @CHEST7 := 60098;
SET @CHEST8 := 60099;
SET @CHEST9 := 60100;
SET @CHEST10 := 60101;
SET @CHEST11 := 60102;
SET @CHEST12 := 60103;
SET @CHEST13 := 60104;
SET @CHEST14 := 60105;
SET @CHEST15 := 60106;
SET @CHEST16 := 60107;
SET @CHEST17 := 60108;
SET @CHEST18 := 60109;
SET @CHEST19 := 60110;
SET @CHEST20 := 60111;

-- New pool guids
SET @POOL1 := 20039;
SET @POOL2 := 20040;
SET @POOL3 := 20041;
SET @POOL4 := 20042;
SET @POOL5 := 20043;
SET @POOL6 := 20044;
SET @POOL7 := 20045;
SET @POOL8 := 20046;
SET @POOL9 := 20047;
SET @POOL10 := 20048;
SET @POOL11 := 20049;

--  Missing spawns at Mulgore
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,1,-2782.12,-707.654,6.42457,2.68781,0,0,0.97437,0.224951,300,900,100,1,0,0,0,10),     -- Camp South
(@CHEST2,106318,1,-2750.03,-430.934,-2.93079,2.9496,0,0,0.995396,0.0958512,300,900,100,1,0,0,0,10),   -- Camp South
(@CHEST3,106318,1,-2716.83,-1188.43,16.7843,5.07891,0,0,-0.566406,0.824126,300,900,100,1,0,0,0,10),   -- The Rolling Plains
(@CHEST4,106318,1,-2643.49,-1320.99,12.1203,0.90757,0,0,0.438371,0.898794,300,900,100,1,0,0,0,10),    -- The Rolling Plains
(@CHEST5,106318,1,-2625.28,-1390.26,24.5035,5.72468,0,0,-0.275637,0.961262,300,900,100,1,0,0,0,10),   -- The Rolling Plains
(@CHEST6,106318,1,-2445.71,438.709,61.7603,0.541051,0,0,0.267238,0.963631,300,900,100,1,0,0,0,10),    -- Palemane Rock (Inside Cave)
(@CHEST7,106318,1,-2402.06,233.673,49.2433,2.80998,0,0,0.986285,0.16505,300,900,100,1,0,0,0,10),      -- Palemane Rock (Ouside Cave)
(@CHEST8,106318,1,-1931.86,-715.756,3.48776,6.07375,0,0,-0.104528,0.994522,300,900,100,0,0,0,0,10),   -- Ravaged Caravan
(@CHEST9,106318,1,-1921.73,-1027.15,43.9631,1.20428,0,0,0.566406,0.824126,300,900,100,1,0,0,0,10),    -- The Venture Co. Mine (Ouside Cave)
(@CHEST10,106318,1,-1912.49,-712.583,3.57394,0.174532,0,0,0.0871553,0.996195,300,900,100,1,0,0,0,10), -- Ravaged Caravan
(@CHEST11,106318,1,-1893.65,353.875,107.361,5.67232,0,0,-0.300705,0.953717,300,900,100,1,0,0,0,10),   -- Bael\'dun Digsite
(@CHEST12,106318,1,-1889.33,-1096.98,90.3293,2.80998,0,0,0.986285,0.16505,300,900,100,1,0,0,0,10),    -- The Venture Co. Mine (Ouside Cave)
(@CHEST13,106318,1,-1734.92,420.683,97.2078,0.279252,0,0,0.139173,0.990268,300,900,100,1,0,0,0,10),   -- West Mountains
(@CHEST14,106318,1,-1681.09,-1218.6,127.419,0.453785,0,0,0.224951,0.97437,300,900,100,1,0,0,0,10),    -- The Venture Co. Mine (Inside Cave)
(@CHEST15,106318,1,-998.083,589.474,81.9395,2.53072,0,0,0.953716,0.300708,300,900,100,1,0,0,0,10),    -- West Mountains
(@CHEST16,106318,1,-826.253,-36.7276,-13.1952,3.927,0,0,-0.923879,0.382686,300,900,100,1,0,0,0,10),   -- Camp North
(@CHEST17,106318,1,-824.101,-780.587,-2.7132,4.27606,0,0,-0.843391,0.5373,300,900,100,1,0,0,0,10),    -- The Golden Plains (North)
(@CHEST18,106318,1,-657.78,193.815,46.8042,0.506145,0,0,0.25038,0.968148,300,900,100,1,0,0,0,10),     -- North Mountains
(@CHEST19,106318,1,-591.331,-681.56,27.4432,5.42797,0,0,-0.414693,0.909961,300,900,100,1,0,0,0,10),   -- North Mountains (Windfury Ridge)
(@CHEST20,106318,1,-546.707,72.7293,52.2842,0.802851,0,0,0.390731,0.920505,300,900,100,1,0,0,0,10);   -- North Mountains (Windfury Ridge)

-- Correct respawn times of existing chests in Mulgore (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(18455,18454,18453,18452,18451,18450,18449,18448,18447,18446,18445,18444,18443,18442);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Mulgore - The Rolling Plains',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Mulgore - Camp South',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Mulgore - Bael\'dun Digsite',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Mulgore - Palemane Rock (Inside Cave)',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Mulgore - Palemane Rock (Ouside Cave)',0,0,0,10),
(@POOL6,1,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Inside Cave)',0,0,0,10),
(@POOL7,1,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Outside Cave)',0,0,0,10),
(@POOL8,1,'Battered Chests (106318) - Mulgore - Ravaged Caravan',0,0,0,10),
(@POOL9,1,'Battered Chests (106318) - Mulgore - West Mountains',0,0,0,10),
(@POOL10,1,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains',0,0,0,10),
(@POOL11,1,'Battered Chests (106318) - Mulgore - Camp North',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(18455,@POOL1,0,'Battered Chests (106318) - Mulgore - The Rolling Plains #1',0,0,10),
(@CHEST3,@POOL1,0,'Battered Chests (106318) - Mulgore - The Rolling Plains #2',0,0,10),
(@CHEST4,@POOL1,0,'Battered Chests (106318) - Mulgore - The Rolling Plains #3',0,0,10),
(@CHEST5,@POOL1,0,'Battered Chests (106318) - Mulgore - The Rolling Plains #4',0,0,10),
(18449,@POOL2,0,'Battered Chests (106318) - Mulgore - Camp South #1',0,0,10),
(18444,@POOL2,0,'Battered Chests (106318) - Mulgore - Camp South #2',0,0,10),
(@CHEST1,@POOL2,0,'Battered Chests (106318) - Mulgore - Camp South #3',0,0,10),
(@CHEST2,@POOL2,0,'Battered Chests (106318) - Mulgore - Camp South #4',0,0,10),
(18446,@POOL3,0,'Battered Chests (106318) - Mulgore - Bael\'dun Digsite #1',0,0,10),
(@CHEST11,@POOL3,0,'Battered Chests (106318) - Mulgore - Bael\'dun Digsite #2',0,0,10),
(18447,@POOL4,0,'Battered Chests (106318) - Mulgore - Palemane Rock (Inside Cave) #1',0,0,10),
(@CHEST6,@POOL4,0,'Battered Chests (106318) - Mulgore - Palemane Rock (Inside Cave) #2',0,0,10),
(18448,@POOL5,0,'Battered Chests (106318) - Mulgore - Palemane Rock (Ouside Cave) #1',0,0,10),
(@CHEST7,@POOL5,0,'Battered Chests (106318) - Mulgore - Palemane Rock (Ouside Cave) #2',0,0,10),
(18445,@POOL6,0,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Inside Cave) #1',0,0,10),
(@CHEST14,@POOL6,0,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Inside Cave) #2',0,0,10),
(18453,@POOL7,0,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Outside Cave) #1',0,0,10),
(@CHEST9,@POOL7,0,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Outside Cave) #2',0,0,10),
(@CHEST12,@POOL7,0,'Battered Chests (106318) - Mulgore - The Venture Co. Mine (Outside Cave) #3',0,0,10),
(18452,@POOL8,0,'Battered Chests (106318) - Mulgore - Ravaged Caravan #1',0,0,10),
(@CHEST8,@POOL8,0,'Battered Chests (106318) - Mulgore - Ravaged Caravan #2',0,0,10),
(@CHEST10,@POOL8,0,'Battered Chests (106318) - Mulgore - Ravaged Caravan #3',0,0,10),
(18454,@POOL9,0,'Battered Chests (106318)- Mulgore - West Mountains #1',0,0,10),
(18451,@POOL9,0,'Battered Chests (106318)- Mulgore - West Mountains #2',0,0,10),
(@CHEST13,@POOL9,0,'Battered Chests (106318) - Mulgore - West Mountains #3',0,0,10),
(@CHEST15,@POOL9,0,'Battered Chests (106318) - Mulgore - West Mountains #4',0,0,10),
(18443,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #1',0,0,10),
(18442,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #2',0,0,10),
(@CHEST17,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #3',0,0,10),
(@CHEST18,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #4',0,0,10),
(@CHEST19,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #5',0,0,10),
(@CHEST20,@POOL10,0,'Battered Chests (106318) - Mulgore - North Mountains/The Golden Plains #6',0,0,10),
(18450,@POOL11,0,'Battered Chests (106318) - Mulgore - Camp North #1',0,0,10),
(@CHEST16,@POOL11,0,'Battered Chests (106318) - Mulgore - Camp North #2',0,0,10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
