DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220904122334');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220904122334');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60027;
SET @CHEST2 := 60028;
SET @CHEST3 := 60029;
SET @CHEST4 := 60030;
SET @CHEST5 := 60031;
SET @CHEST6 := 60032;
SET @CHEST7 := 60033;
SET @CHEST8 := 60034;
SET @CHEST9 := 60035;
SET @CHEST10 := 60036;
SET @CHEST11 := 60037;
SET @CHEST12 := 60038;
SET @CHEST13 := 60039;
SET @CHEST14 := 60040;
SET @CHEST15 := 60041;

-- New pool guids
SET @POOL1 := 20013;
SET @POOL2 := 20014;
SET @POOL3 := 20015;
SET @POOL4 := 20016;
SET @POOL5 := 20017;
SET @POOL6 := 20018;
SET @POOL7 := 20019;
SET @POOL8 := 20020;
SET @POOL9 := 20021;
SET @POOL10 := 20022;
SET @POOL11 := 20023;

--  Missing spawns at Elwyn Forest
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,0,-10071.6,631.747,39.3654,0,0,0,0,1,300,900,100,1,0,0,0,10),                          -- Forests Edge
(@CHEST2,106318,0,-9973.6,-155.299,24.4805,1.23918,0,0,0.580703,0.814116,300,900,100,1,0,0,0,10),      -- Jerods Landing
(@CHEST3,106318,0,-9940.88,-116.771,24.9764,2.23402,0,0,0.898793,0.438373,300,900,100,1,0,0,0,10),     -- Jerods Landing
(@CHEST4,106318,0,-9924.49,-1114.88,24.6533,5.75959,0,0,-0.258819,0.965926,300,900,100,1,0,0,0,10),    -- Southcoast (Murlocs)
(@CHEST5,106318,0,-9838.12,207.45,14.054,1.06465,0,0,0.507538,0.861629,300,900,100,1,0,0,0,10),        -- Fargodeep Mine
(@CHEST6,106318,0,-9804.66,-934.958,39.8556,0.994837,0,0,0.477159,0.878817,300,900,100,1,0,0,0,10),    -- Brackwell Pumpking Patch
(@CHEST7,106318,0,-9739.5,-934.509,38.9182,1.51844,0,0,0.688354,0.725374,300,900,100,1,0,0,0,10),      -- Brackwell Pumpking Patch
(@CHEST8,106318,0,-9732.97,136.739,18.6676,3.45576,0,0,-0.987688,0.156436,300,900,100,1,0,0,0,10),     -- Fargodeep Mine
(@CHEST9,106318,0,-9436.06,468.587,53.3748,0,0,0,0,1,300,300,100,1,0,0,0,10),                          -- Mirror Lake Orchard (Defias Camp)
(@CHEST10,106318,0,-9303.33,-282.874,71.1022,4.04917,0,0,-0.898793,0.438373,300,900,100,1,0,0,0,10),   -- Crystal Lake
(@CHEST11,106318,0,-9240.57,-720.326,62.874,1.74533,0,0,0.766044,0.642789,300,900,100,1,0,0,0,10),     -- Jasperlode Mine (Outside)
(@CHEST12,106318,0,-9216.05,-1228.15,72.4841,0.0349062,0,0,0.0174522,0.999848,300,900,100,1,0,0,0,10), -- Stone Carin Lake
(@CHEST13,106318,0,-9203.29,-1218.71,70.0484,5.11382,0,0,-0.551936,0.833886,300,900,100,1,0,0,0,10),   -- Stone Carin Lake
(@CHEST14,106318,0,-9021.75,-606.646,56.4091,2.61799,0,0,0.965925,0.258821,300,900,100,1,0,0,0,10),    -- Jasperlode Mine 
(@CHEST15,106318,0,-8894.47,-717.691,69.721,0.296705,0,0,0.147809,0.989016,300,900,100,1,0,0,0,10);    -- Stone Carin Lake

-- Correct respawn times of existing chests in Elwyn Forest (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(26234,26716,26814,26865,26886,26895,26916,26974,26978,26995,27000,27006,30704,30714,30782,30934,30950,32466,33421,33492,33616,34032);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Elwyn Forest - Crystal Lake',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Elwyn Forest - Defias Camp',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Elwyn Forest - Forests Edge',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine',0,0,0,10),
(@POOL6,1,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake',0,0,0,10),
(@POOL7,1,'Battered Chests (106318) - Elwyn Forest - Southcoast (Murlocs)',0,0,0,10),
(@POOL8,1,'Battered Chests (106318) - Elwyn Forest - Jerods Landing',0,0,0,10),
(@POOL9,1,'Battered Chests (106318) - Elwyn Forest - Brackwell Pumpking Patch',0,0,0,10),
(@POOL10,1,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine (Outside)',0,0,0,10),
(@POOL11,1,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine (Outside)',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(26234,@POOL1,0,'Battered Chests (106318) - Elwyn Forest - Crystal Lake #1',0,0,10),
(26978,@POOL1,0,'Battered Chests (106318) - Elwyn Forest - Crystal Lake #2',0,0,10),
(33616,@POOL1,0,'Battered Chests (106318) - Elwyn Forest - Crystal Lake #3',0,0,10),
(@CHEST10,@POOL1,0,'Battered Chests (106318) - Elwyn Forest - Crystal Lake #4',0,0,10),
(26716,@POOL2,0,'Battered Chests (106318) - Elwyn Forest - Defias Camp #1',0,0,10),
(26814,@POOL2,0,'Battered Chests (106318) - Elwyn Forest - Defias Camp #2',0,0,10),
(@CHEST9,@POOL2,0,'Battered Chests (106318) - Elwyn Forest - Defias Camp #3',0,0,10),
(26865,@POOL3,0,'Battered Chests (106318) - Elwyn Forest - Forests Edge #1',0,0,10),
(34032,@POOL3,0,'Battered Chests (106318) - Elwyn Forest - Forests Edge #2',0,0,10),
(27000,@POOL3,0,'Battered Chests (106318) - Elwyn Forest - Forests Edge #3',0,0,10),
(@CHEST1,@POOL3,0,'Battered Chests (106318) - Elwyn Forest - Forests Edge #4',0,0,10),
(26886,@POOL4,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine #1',0,0,10),
(30934,@POOL4,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine #2',0,0,10),
(32466,@POOL4,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine #3',0,0,10),
(@CHEST8,@POOL4,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine #4',0,0,10),
(26974,@POOL5,0,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine #1',0,0,10),
(30782,@POOL5,0,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine #2',0,0,10),
(@CHEST14,@POOL5,0,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine #3',0,0,10),
(26995,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #1',0,0,10),
(30714,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #2',0,0,10),
(33421,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #3',0,0,10),
(@CHEST12,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #4',0,0,10),
(@CHEST13,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #5',0,0,10),
(@CHEST15,@POOL6,0,'Battered Chests (106318) - Elwyn Forest - Stone Carin Lake #6',0,0,10),
(27006,@POOL7,0,'Battered Chests (106318) - Elwyn Forest - Southcoast (Murlocs) #1',0,0,10),
(33492,@POOL7,0,'Battered Chests (106318) - Elwyn Forest - Southcoast (Murlocs) #2',0,0,10),
(@CHEST4,@POOL7,0,'Battered Chests (106318) - Elwyn Forest - Southcoast (Murlocs) #3',0,0,10),
(26895,@POOL8,0,'Battered Chests (106318) - Elwyn Forest - Jerods Landing #1',0,0,10),
(@CHEST2,@POOL8,0,'Battered Chests (106318) - Elwyn Forest - Jerods Landing #2',0,0,10),
(@CHEST3,@POOL8,0,'Battered Chests (106318) - Elwyn Forest - Jerods Landing #3',0,0,10),
(26916,@POOL9,0,'Battered Chests (106318) - Elwyn Forest - Brackwell Pumpking Patch #1',0,0,10),
(@CHEST6,@POOL9,0,'Battered Chests (106318) - Elwyn Forest - Brackwell Pumpking Patch #2',0,0,10),
(@CHEST7,@POOL9,0,'Battered Chests (106318) - Elwyn Forest - Brackwell Pumpking Patch #3',0,0,10),
(30704,@POOL10,0,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine (Outside) #1',0,0,10),
(@CHEST11,@POOL10,0,'Battered Chests (106318) - Elwyn Forest - Jasperlode Mine (Outside) #2',0,0,10),
(30950,@POOL11,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine (Outside) #1',0,0,10),
(@CHEST5,@POOL11,0,'Battered Chests (106318) - Elwyn Forest - Fargodeep Mine (Outside) #2',0,0,10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
