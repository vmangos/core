DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220909073503');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220909073503');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60057;
SET @CHEST2 := 60058;
SET @CHEST3 := 60059;
SET @CHEST4 := 60060;
SET @CHEST5 := 60061;
SET @CHEST6 := 60062;
SET @CHEST7 := 60063;
SET @CHEST8 := 60064;
SET @CHEST9 := 60065;
SET @CHEST10 := 60066;
SET @CHEST11 := 60067;
SET @CHEST12 := 60068;
SET @CHEST13 := 60069;
SET @CHEST14 := 60070;
SET @CHEST15 := 60071;
SET @CHEST16 := 60072;
SET @CHEST17 := 60073;
SET @CHEST18 := 60074;
SET @CHEST19 := 60075;
SET @CHEST20 := 60076;
SET @CHEST21 := 60078;
SET @CHEST22 := 60079;
SET @CHEST23 := 60080;
SET @CHEST24 := 60081;
SET @CHEST25 := 60082;
SET @CHEST26 := 60083;
SET @CHEST27 := 60084;
SET @CHEST28 := 60085;
SET @CHEST29 := 60086;
SET @CHEST30 := 60087;
SET @CHEST31 := 60088;
SET @CHEST32 := 60089;
SET @CHEST33 := 60090;
SET @CHEST34 := 60091;

-- New pool guids
SET @POOL1 := 20029;
SET @POOL2 := 20030;
SET @POOL3 := 20031;
SET @POOL4 := 20032;
SET @POOL5 := 20033;
SET @POOL6 := 20034;
SET @POOL7 := 20035;
SET @POOL8 := 20036;
SET @POOL9 := 20037;
SET @POOL10 := 20038;

--  Missing spawns at Durotar
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,1,-1128.24,-5508.42,6.31908,1.5708,0,0,0.707107,0.707107,300,900,100,1,0,0,0,10),     -- Echo Isles
(@CHEST2,106318,1,-1039.7,-4589.81,25.8219,0.209439,0,0,0.104528,0.994522,300,900,100,1,0,0,0,10),    -- Kolkar Crag
(@CHEST3,106318,1,-327.539,-5266.53,-8.39004,0.750491,0,0,0.366501,0.930418,300,900,100,1,0,0,0,10),  -- Scuttle Coast
(@CHEST4,106318,1,-264.111,-5131.67,24.3416,2.32129,0,0,0.91706,0.39875,300,900,100,1,0,0,0,10),      -- Tiragarde Keep
(@CHEST5,106318,1,-238.197,-5110,41.3468,2.9496,0,0,0.995396,0.0958512,300,900,100,1,0,0,0,10),       -- Tiragarde Keep
(@CHEST6,106318,1,-173.708,-5116.12,22.1168,0.837757,0,0,0.406736,0.913546,300,900,100,1,0,0,0,10),   -- Tiragarde Keep
(@CHEST7,106318,1,-159.58,-5246.65,-4.271,4.04917,0,0,-0.898793,0.438373,300,900,100,1,0,0,0,10),     -- Scuttle Coast
(@CHEST8,106318,1,-63.7777,-5372.09,-17.8134,3.89209,0,0,-0.930417,0.366502,300,900,100,1,0,0,0,10),  -- Scuttle Coast
(@CHEST9,106318,1,6.73275,-5228.02,-13.3655,1.309,0,0,0.608761,0.793354,300,900,100,1,0,0,0,10),      -- Scuttle Coast
(@CHEST10,106318,1,19.8772,-4274.1,72.5779,1.58825,0,0,0.71325,0.70091,300,900,100,1,0,0,0,10),       -- Razormane Grounds
(@CHEST11,106318,1,51.3314,-4452.3,48.4894,0.331611,0,0,0.165047,0.986286,300,900,100,1,0,0,0,10),    -- Razormane Grounds
(@CHEST12,106318,1,116.43,-4557.85,59.7943,3.42085,0,0,-0.990268,0.139175,300,900,100,1,0,0,0,10),    -- Razormane Grounds
(@CHEST13,106318,1,426.053,-4280.53,29.4294,5.20108,0,0,-0.515038,0.857168,300,900,100,1,0,0,0,10),   -- Razormane Grounds
(@CHEST14,106318,1,440.375,-4213.46,25.2133,4.53786,0,0,-0.766044,0.642789,300,900,100,1,0,0,0,10),   -- Razormane Grounds
(@CHEST15,106318,1,555.007,-4266.48,16.5141,4.24115,0,0,-0.85264,0.522499,300,900,100,1,0,0,0,10),    -- Razormane Grounds
(@CHEST16,106318,1,811.543,-4806.71,11.0355,0.733038,0,0,0.358368,0.93358,300,900,100,1,0,0,0,10),    -- Dygulch Ravine
(@CHEST17,106318,1,852.074,-4187.02,-10.9082,6.12611,0,0,-0.0784588,0.996917,300,900,100,1,0,0,0,10), -- Thunder Ridge
(@CHEST18,106318,1,856.534,-4209.93,-11.351,5.3058,0,0,-0.469471,0.882948,300,900,100,1,0,0,0,10),    -- Thunder Ridge
(@CHEST19,106318,1,877.265,-4738.9,30.0118,4.10153,0,0,-0.887011,0.461749,300,900,100,1,0,0,0,10),    -- Dustwind Cave
(@CHEST20,106318,1,896.122,-4646.7,18.3639,2.19911,0,0,0.891006,0.453991,300,900,100,1,0,0,0,10),     -- Razorwind Canyon
(@CHEST21,106318,1,908.547,-4754.28,18.7004,2.32129,0,0,0.91706,0.39875,300,900,100,1,0,0,0,10),      -- Dustwind Cave
(@CHEST22,106318,1,952.369,-4586.2,19.6132,4.86947,0,0,-0.649447,0.760406,300,900,100,1,0,0,0,10),    -- Razorwind Canyon
(@CHEST23,106318,1,960.046,-4777.73,22.268,2.02458,0,0,0.848047,0.529921,300,900,100,1,0,0,0,10),     -- Dygulch Ravine
(@CHEST24,106318,1,962.886,-4295.42,-6.3294,1.43117,0,0,0.656058,0.75471,300,900,100,1,0,0,0,10),     -- Thunder Ridge
(@CHEST25,106318,1,975.26,-4667.09,27.3499,0.90757,0,0,0.438371,0.898794,300,900,100,1,0,0,0,10),     -- Dygulch Ravine
(@CHEST26,106318,1,1027.07,-4821.19,15.2047,2.47837,0,0,0.945518,0.325568,300,900,100,1,0,0,0,10),    -- Dygulch Ravine
(@CHEST27,106318,1,1068.7,-4671.96,13.7875,5.89921,0,0,-0.190808,0.981627,300,900,100,1,0,0,0,10),    -- Dygulch Ravine
(@CHEST28,106318,1,1106.89,-4706.9,17.5527,6.03884,0,0,-0.121869,0.992546,300,900,100,1,0,0,0,10),    -- Dygulch Ravine
(@CHEST29,106318,1,1428.39,-4682.05,-0.566509,0.418879,0,0,0.207911,0.978148,300,900,100,1,0,0,0,10), -- Skull Rock
(@CHEST30,106318,1,1442.9,-4722.87,-16.5671,5.42797,0,0,-0.414693,0.909961,300,900,100,1,0,0,0,10),   -- Skull Rock
(@CHEST31,106318,1,1458.29,-4683.8,6.25522,6.02139,0,0,-0.130526,0.991445,300,900,100,1,0,0,0,10),    -- Skull Rock
(@CHEST32,106318,1,1485.68,-4739.93,-4.47406,0.104719,0,0,0.0523357,0.99863,300,900,100,1,0,0,0,10),  -- Skull Rock
(@CHEST33,106318,1,1488.48,-4752.36,21.0269,1.3439,0,0,0.622514,0.782609,300,900,100,1,0,0,0,10),     -- Skull Rock
(@CHEST34,106318,1,1546.7,-4750.5,14.4975,2.35619,0,0,0.92388,0.382683,300,900,100,1,0,0,0,10);       -- Skull Rock

-- Correct respawn times of existing chests in Durotar (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(12611,12603,12600,12552,12548,12547,12546,12504,12503,12500,12499,12396);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Durotar - Tiragarde Keep',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Durotar - Dustwind Cave',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Durotar - Dygulch Ravine',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Durotar - Razormane Grounds',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Durotar - Skull Rock',0,0,0,10),
(@POOL6,1,'Battered Chests (106318) - Durotar - Scuttle Coast',0,0,0,10),
(@POOL7,1,'Battered Chests (106318) - Durotar - Thunder Ridge',0,0,0,10),
(@POOL8,1,'Battered Chests (106318) - Durotar - Kolkar Crag',0,0,0,10),
(@POOL9,1,'Battered Chests (106318) - Durotar - Razorwind Canyon',0,0,0,10),
(@POOL10,1,'Battered Chests (106318) - Durotar - Echo Isles',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(12611,@POOL1,0,'Battered Chests (106318) - Durotar - Tiragarde Keep #1',0,0,10),
(@CHEST4,@POOL1,0,'Battered Chests (106318) - Durotar - Tiragarde Keep #2',0,0,10),
(@CHEST5,@POOL1,0,'Battered Chests (106318) - Durotar - Tiragarde Keep #3',0,0,10),
(@CHEST6,@POOL1,0,'Battered Chests (106318) - Durotar - Tiragarde Keep #4',0,0,10),
(12600,@POOL2,0,'Battered Chests (106318) - Durotar - Dustwind Cave #1',0,0,10),
(@CHEST19,@POOL2,0,'Battered Chests (106318) - Durotar - Dustwind Cave #2',0,0,10),
(@CHEST21,@POOL2,0,'Battered Chests (106318) - Durotar - Dustwind Cave #3',0,0,10),
(12603,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #1',0,0,10),
(12547,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #2',0,0,10),
(@CHEST16,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #3',0,0,10),
(@CHEST23,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #4',0,0,10),
(@CHEST25,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #5',0,0,10),
(@CHEST26,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #6',0,0,10),
(@CHEST27,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #7',0,0,10),
(@CHEST28,@POOL3,0,'Battered Chests (106318) - Durotar - Dygulch Ravine #8',0,0,10),
(12552,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #1',0,0,10),
(12504,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #2',0,0,10),
(12499,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #3',0,0,10),
(@CHEST10,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #4',0,0,10),
(@CHEST11,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #5',0,0,10),
(@CHEST12,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #7',0,0,10),
(@CHEST13,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #8',0,0,10),
(@CHEST14,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #9',0,0,10),
(@CHEST15,@POOL4,0,'Battered Chests (106318) - Durotar - Razormane Grounds #10',0,0,10),
(12548,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #1',0,0,10),
(@CHEST29,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #2',0,0,10),
(@CHEST30,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #3',0,0,10),
(@CHEST31,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #4',0,0,10),
(@CHEST32,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #5',0,0,10),
(@CHEST33,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #6',0,0,10),
(@CHEST34,@POOL5,0,'Battered Chests (106318) - Durotar - Skull Rock #7',0,0,10),
(12546,@POOL6,0,'Battered Chests (106318) - Durotar - Scuttle Coast #1',0,0,10),
(@CHEST3,@POOL6,0,'Battered Chests (106318) - Durotar - Scuttle Coast #2',0,0,10),
(@CHEST7,@POOL6,0,'Battered Chests (106318) - Durotar - Scuttle Coast #3',0,0,10),
(@CHEST8,@POOL6,0,'Battered Chests (106318) - Durotar - Scuttle Coast #4',0,0,10),
(@CHEST9,@POOL6,0,'Battered Chests (106318) - Durotar - Scuttle Coast #5',0,0,10),
(12503,@POOL7,0,'Battered Chests (106318) - Durotar - Thunder Ridge #1',0,0,10),
(@CHEST17,@POOL7,0,'Battered Chests (106318) - Durotar - Thunder Ridge #2',0,0,10),
(@CHEST18,@POOL7,0,'Battered Chests (106318) - Durotar - Thunder Ridge #3',0,0,10),
(@CHEST24,@POOL7,0,'Battered Chests (106318) - Durotar - Thunder Ridge #4',0,0,10),
(12500,@POOL8,0,'Battered Chests (106318) - Durotar - Kolkar Crag #1',0,0,10),
(@CHEST2,@POOL8,0,'Battered Chests (106318) - Durotar - Kolkar Crag #2',0,0,10),
(12396,@POOL9,0,'Battered Chests (106318) - Durotar - Razorwind Canyon #1',0,0,10),
(@CHEST20,@POOL9,0,'Battered Chests (106318) - Durotar - Razorwind Canyon #2',0,0,10),
(@CHEST22,@POOL9,0,'Battered Chests (106318) - Durotar - Razorwind Canyon #3',0,0,10),
(@CHEST1,@POOL10,0,'Battered Chests (106318) - Durotar - Echo Isles #1',0,0,10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
