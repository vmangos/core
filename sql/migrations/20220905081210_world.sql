DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220905081210');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220905081210');
-- Add your query below.

-- New chest guids
SET @CHEST1 := 60042;
SET @CHEST2 := 60043;
SET @CHEST3 := 60044;
SET @CHEST4 := 60045;
SET @CHEST5 := 60046;
SET @CHEST6 := 60047;
SET @CHEST7 := 60048;
SET @CHEST8 := 60049;
SET @CHEST9 := 60050;
SET @CHEST10 := 60051;
SET @CHEST11 := 60052;
SET @CHEST12 := 60054;
SET @CHEST13 := 60055;
SET @CHEST14 := 60056;

-- New pool guids
SET @POOL1 := 20024;
SET @POOL2 := 20025;
SET @POOL3 := 20026;
SET @POOL4 := 20027;
SET @POOL5 := 20028;
SET @POOL6 := 20029;
SET @POOL7 := 20030;
SET @POOL8 := 20031;
SET @POOL9 := 20032;
SET @POOL10 := 20033;
SET @POOL11 := 20034;

--  Missing spawns at Teldrassil
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(@CHEST1,106318,1,9831.43,1533.49,1257.5,1.36136,0,0,0.62932,0.777146,300,300,100,1,0,0,0,10),     -- Banethil Barrow Den
(@CHEST2,106318,1,10511.2,2002.39,1327.38,0.279252,0,0,0.139173,0.990268,300,300,100,1,0,0,0,10),  -- The Oracle Glade
(@CHEST3,106318,1,10134.8,1183.48,1323.54,5.37562,0,0,-0.438371,0.898794,300,300,100,1,0,0,0,10),  -- Fel Rock
(@CHEST4,106318,1,9631.6,463.32,1312.8,2.67035,0,0,0.972369,0.233448,300,300,100,1,0,0,0,10),      -- Camp East
(@CHEST5,106318,1,10751.3,2214.46,1331.51,4.69494,0,0,-0.71325,0.70091,300,300,100,1,0,0,0,10),    -- The Oracle Glade
(@CHEST6,106318,1,9800.56,1581.16,1291.2,5.65487,0,0,-0.309016,0.951057,300,300,100,1,0,0,0,10),   -- Banethil Barrow Den
(@CHEST7,106318,1,9730.49,1576.73,1269.44,3.07177,0,0,0.999391,0.0349061,300,300,100,1,0,0,0,10),  -- Banethil Barrow Den
(@CHEST8,106318,1,9776.05,1547.38,1299.49,0.715585,0,0,0.350207,0.936672,300,300,100,1,0,0,0,10),  -- Banethil Barrow Den
(@CHEST9,106318,1,10620.3,2089.35,1336.54,4.7822,0,0,-0.681998,0.731354,300,300,100,1,0,0,0,10),   -- The Oracle Glade
(@CHEST10,106318,1,10890.4,1968.21,1321.79,4.95674,0,0,-0.615661,0.788011,300,300,100,1,0,0,0,10), -- The Oracle Glade
(@CHEST11,106318,1,10419.7,1908.99,1321.27,2.61799,0,0,0.965925,0.258821,300,300,100,1,0,0,0,10),  -- The Oracle Glade
(@CHEST12,106318,1,9673.75,454.109,1309.88,1.64061,0,0,0.731353,0.681999,300,300,100,1,0,0,0,10),  -- Camp East
(@CHEST13,106318,1,9183.7,1372.79,1315.07,3.59538,0,0,-0.97437,0.224951,300,300,100,1,0,0,0,10),   -- Camp South
(@CHEST14,106318,1,10863.5,2125.58,1327.06,2.63544,0,0,0.968147,0.250381,300,300,100,1,0,0,0,10);  -- The Oracle Glade

-- Correct respawn times of existing chests in Teldrassil (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(49621,49622,49623,49624,49625,49626,49627,49628);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(@POOL1,1,'Battered Chests (106318) - Teldrassil - Fel Rock',0,0,0,10),
(@POOL2,1,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den',0,0,0,10),
(@POOL3,1,'Battered Chests (106318) - Teldrassil - Camp South',0,0,0,10),
(@POOL4,1,'Battered Chests (106318) - Teldrassil - Camp East',0,0,0,10),
(@POOL5,1,'Battered Chests (106318) - Teldrassil - The Oracle Glade',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(49628,@POOL1,0,'Battered Chests (106318) - Teldrassil - Fel Rock #1',0,0,10),
(@CHEST3,@POOL1,0,'Battered Chests (106318) - Teldrassil - Fel Rock #2',0,0,10),
(49627,@POOL2,0,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den #1',0,0,10),
(@CHEST1,@POOL2,0,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den #2',0,0,10),
(@CHEST6,@POOL2,0,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den #3',0,0,10),
(@CHEST7,@POOL2,0,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den #4',0,0,10),
(@CHEST8,@POOL2,0,'Battered Chests (106318) - Teldrassil - Banethil Barrow Den #5',0,0,10),
(49626,@POOL3,0,'Battered Chests (106318) - Teldrassil - Camp South #1',0,0,10),
(49624,@POOL3,0,'Battered Chests (106318) - Teldrassil - Camp South #2',0,0,10),
(@CHEST13,@POOL3,0,'Battered Chests (106318) - Teldrassil - Camp South #3',0,0,10),
(49622,@POOL4,0,'Battered Chests (106318) - Teldrassil - Camp East #1',0,0,10),
(@CHEST4,@POOL4,0,'Battered Chests (106318) - Teldrassil - Camp East #2',0,0,10),
(@CHEST12,@POOL4,0,'Battered Chests (106318) - Teldrassil - Camp East #3',0,0,10),
(49621,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #1',0,0,10),
(49623,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #2',0,0,10),
(49625,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #3',0,0,10),
(@CHEST2,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #4',0,0,10),
(@CHEST9,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #5',0,0,10),
(@CHEST10,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #6',0,0,10),
(@CHEST11,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #7',0,0,10),
(@CHEST14,@POOL5,0,'Battered Chests (106318) - Teldrassil - The Oracle Glade #8',0,0,10);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
