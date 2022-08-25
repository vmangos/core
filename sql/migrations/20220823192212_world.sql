DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20220823192212');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20220823192212');
-- Add your query below.

--  Missing spawns at Tirisfal
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(18218,106318,0,2036.27,-455.528,35.8657,2.25147,0,0,0.902585,0.430512,300,900,100,1,0,0,0,10),  -- Balnir Farmstead
(18220,106318,0,2155.44,-510.988,81.639,3.99681,0,0,-0.909961,0.414694,300,900,100,1,0,0,0,10),  -- Crusader Outpost
(18221,106318,0,2342.99,1319.23,34.0111,4.55531,0,0,-0.760406,0.649449,300,900,100,1,0,0,0,10),  -- Sollmiden Farmstead
(18222,106318,0,2550.12,783.427,110.544,3.07177,0,0,0.999391,0.0349061,300,900,100,1,0,0,0,10),  -- Agamand Mills
(18224,106318,0,2603.06,1464.46,-10.673,2.53072,0,0,0.953716,0.300708,300,900,100,1,0,0,0,10),   -- Whispering Shore
(18229,106318,0,2762.72,788.501,114.367,1.95477,0,0,0.829038,0.559193,300,900,100,1,0,0,0,10),   -- Agamand Mills
(18231,106318,0,2914.1,377.418,31.4822,3.57793,0,0,-0.976295,0.216442,300,900,100,1,0,0,0,10),   -- Garren's Haunt
(18233,106318,0,3026.86,373.43,-1.28392,3.26377,0,0,-0.998135,0.0610518,300,900,100,1,0,0,0,10), -- North Coast
(18234,106318,0,3058.99,2.03689,-1.59202,3.71755,0,0,-0.958819,0.284016,300,900,100,1,0,0,0,10); -- North Coast

-- Correct respawn times of existing chests in Tirisfal (source: CMangos)
UPDATE `gameobject` SET `spawntimesecsmin`=300, `spawntimesecsmax`=900 WHERE `guid` IN
(45244,45257,45251,45240,45060);

INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES
(20008,1,'Battered Chests (106318) - Tirisfal - Agamand Mills',0,0,0,10),
(20009,1,'Battered Chests (106318) - Tirisfal - Coast',0,0,0,10),
(20010,1,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt',0,0,0,10),
(20011,1,'Battered Chests (106318) - Tirisfal - Solliden/Balnir Farmstead',0,0,0,10),
(20012,1,'Battered Chests (106318) - Tirisfal - Crusader Outposts',0,0,0,10);

INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `flags`, `patch_min`, `patch_max`) VALUES
(18222,20008,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #1','0','0','10'),
(18229,20008,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #2','0','0','10'),
(45257,20008,0,'Battered Chests (106318) - Tirisfal - Agamand Mills #3','0','0','10'),
(18233,20009,0,'Battered Chests (106318) - Tirisfal - Coast #1','0','0','10'),
(18234,20009,0,'Battered Chests (106318) - Tirisfal - Coast #2','0','0','10'),
(18224,20009,0,'Battered Chests (106318) - Tirisfal - Coast #3','0','0','10'),
(45060,20009,0,'Battered Chests (106318) - Tirisfal - Coast #4','0','0','10'),
(45244,20010,0,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt #1','0','0','10'),
(18231,20010,0,'Battered Chests (106318) - Tirisfal - Garren\'s Haunt #2','0','0','10'),
(18221,20011,0,'Battered Chests (106318) - Tirisfal - Solliden and Balnir Farmstead #1','0','0','10'),
(18218,20011,0,'Battered Chests (106318) - Tirisfal - Solliden and Balnir Farmstead #2','0','0','10'),
(45251,20012,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #1','0','0','10'),
(18220,20012,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #2','0','0','10'),
(45240,20012,0,'Battered Chests (106318) - Tirisfal - Tirisfal - Crusader Outposts #3','0','0','10');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
