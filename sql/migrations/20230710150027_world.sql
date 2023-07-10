DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230710150027');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230710150027');
-- Add your query below.


-- Add and Update Book Objects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `animprogress`, `state`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES
(3225, 175738, 0, -8339.45, 398.575, 122.274, 5.77704, 0, 0, -0.25038, 0.968148, 180, 180, 100, 1, 0, 0, 0, 10),
(3226, 179707, 450, 242.978, 87.1378, 25.8042, 4.90438, 0, 0, -0.636078, 0.771625, 180, 180, 100, 1, 0, 0, 0, 10);

DELETE FROM `gameobject` WHERE `guid` = 3998633;

-- Correct position of Aftermath of the Second War in Stormwind City (position is off by 0.349609 yards).
UPDATE `gameobject` SET `position_x`=-8365.65, `position_y`=400.979, `position_z`=123.406, `orientation`=0.209439, `rotation0`=0, `rotation1`=0, `rotation2`=0.104528, `rotation3`=0.994522 WHERE `guid`=13676;

-- Correct position of The Alliance of Lordaeron in Stormwind City (position is off by 0.200195 yards).
UPDATE `gameobject` SET `position_x`=-8366.8, `position_y`=400.532, `position_z`=123.392, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=18582;

-- Correct position of The Kaldorei and the Well of Eternity in Stormwind City (position is off by 0.469727 yards).
UPDATE `gameobject` SET `position_x`=-8341.53, `position_y`=415.198, `position_z`=124.479, `orientation`=4.50295, `rotation0`=0, `rotation1`=0, `rotation2`=-0.777145, `rotation3`=0.629321 WHERE `guid`=13680;

-- Correct position of Beyond the Dark Portal in Stormwind City (position is off by 0.0800781 yards).
UPDATE `gameobject` SET `position_x`=-8332.08, `position_y`=397.552, `position_z`=123.441, `orientation`=5.35816, `rotation0`=0, `rotation1`=0, `rotation2`=-0.446198, `rotation3`=0.894935 WHERE `guid`=13678;

-- Correct position of The War of the Ancients in Stormwind City (position is off by 0.0898438 yards).
UPDATE `gameobject` SET `position_x`=-8832.09, `position_y`=1088.1, `position_z`=97.0041, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=42901;

-- Correct position of Fossilized Egg in Ironforge (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-4698.28, `position_y`=-1312.97, `position_z`=503.944, `orientation`=1.03907, `rotation0`=0.607692, `rotation1`=-0.361538, `rotation2`=0.607692, `rotation3`=0.361541 WHERE `guid`=5405;

-- Correct position of Horde Catapult in Ironforge (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-4602.47, `position_y`=-1234.72, `position_z`=504.472, `orientation`=0, `rotation0`=0.309975, `rotation1`=-0.635543, `rotation2`=0.309975, `rotation3`=0.635544 WHERE `guid`=5205;

-- Correct position of Uldaman Reliefs in Ironforge (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-4585.97, `position_y`=-1223.39, `position_z`=504.293, `orientation`=1.19205, `rotation0`=0.681389, `rotation1`=-0.188966, `rotation2`=0.681389, `rotation3`=0.18897 WHERE `guid`=5141;

-- Correct position of Mount Hyjal and Illidan's Gift in Stormwind City (position is off by 0.0898442 yards).
UPDATE `gameobject` SET `position_x`=-8860.91, `position_y`=821.677, `position_z`=99.4557, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=42902;

-- Correct position of The World Tree and the Emerald Dream in Stormwind City (position is off by 0.360352 yards).
UPDATE `gameobject` SET `position_x`=-8729.36, `position_y`=1107.63, `position_z`=94.3296, `orientation`=5.53269, `rotation0`=0, `rotation1`=0, `rotation2`=-0.366501, `rotation3`=0.930418 WHERE `guid`=42903;

-- Correct position of War of the Three Hammers in Stormwind City (position is off by 0.410156 yards).
UPDATE `gameobject` SET `position_x`=-8471.59, `position_y`=513.586, `position_z`=101.574, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=18564;

-- Correct position of The Dark Portal and the Fall of Stormwind in Stormwind City (position is off by 0.129883 yards).
UPDATE `gameobject` SET `position_x`=-8416.13, `position_y`=280.448, `position_z`=122.017, `orientation`=3.83973, `rotation0`=0, `rotation1`=0, `rotation2`=-0.939692, `rotation3`=0.34202 WHERE `guid`=18578;

-- Correct position of The Alliance of Lordaeron in Stormwind City (position is off by 0.200195 yards).
UPDATE `gameobject` SET `position_x`=-8366.8, `position_y`=400.532, `position_z`=123.392, `orientation`=5.46288, `rotation0`=0, `rotation1`=0, `rotation2`=-0.398748, `rotation3`=0.91706 WHERE `guid`=18582;

-- Correct position of The Guardians of Tirisfal in Stormwind City (position is off by 0.299805 yards).
UPDATE `gameobject` SET `position_x`=-8366.7, `position_y`=401.885, `position_z`=123.427, `orientation`=2.28638, `rotation0`=0, `rotation1`=0, `rotation2`=0.909961, `rotation3`=0.414694 WHERE `guid`=18556;

-- Correct position of The Birth of the Lich King in Hillsbrad Foothills (position is off by 0.345441 yards).
UPDATE `gameobject` SET `position_x`=-846.982, `position_y`=-599.655, `position_z`=19.4974, `orientation`=1.25664, `rotation0`=0, `rotation1`=0, `rotation2`=0.587785, `rotation3`=0.809017 WHERE `guid`=18586;

-- Correct position of Archimonde's Return and the Flight to Kalimdor in Stormwind City (position is off by 0.0195335 yards).
UPDATE `gameobject` SET `position_x`=-8859.98, `position_y`=820.548, `position_z`=99.4627, `orientation`=0.0698117, `rotation0`=0, `rotation1`=0, `rotation2`=0.0348988, `rotation3`=0.999391 WHERE `guid`=42904;

-- Correct position of The Battle of Grim Batol in Stormwind City (position is off by 0.240234 yards).
UPDATE `gameobject` SET `position_x`=-8400.76, `position_y`=260.89, `position_z`=122.024, `orientation`=3.6652, `rotation0`=0, `rotation1`=0, `rotation2`=-0.965925, `rotation3`=0.258821 WHERE `guid`=18590;

-- Correct position of War of the Spider in Stormwind City (position is off by 0.0595703 yards).
UPDATE `gameobject` SET `position_x`=-8380.06, `position_y`=277.137, `position_z`=122.031, `orientation`=0.453785, `rotation0`=0, `rotation1`=0, `rotation2`=0.224951, `rotation3`=0.97437 WHERE `guid`=18597;

-- Correct position of Civil War in the Plaguelands in Stormwind City (position is off by 0.469727 yards).
UPDATE `gameobject` SET `position_x`=-8370.53, `position_y`=395.315, `position_z`=122.274, `orientation`=1.18682, `rotation0`=0, `rotation1`=0, `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=18610;

-- Correct position of The New Horde in Stormwind City (position is off by 0.0302734 yards).
UPDATE `gameobject` SET `position_x`=-8366.03, `position_y`=407.815, `position_z`=124.479, `orientation`=4.72984, `rotation0`=0, `rotation1`=0, `rotation2`=-0.700909, `rotation3`=0.713251 WHERE `guid`=18594;

-- Correct position of Lady Mara Fordragon in Stormwind City (position is off by 0.701602 yards).
UPDATE `gameobject` SET `position_x`=-8347.64, `position_y`=520.968, `position_z`=122.939, `orientation`=0, `rotation0`=-0.307199, `rotation1`=-0.636889, `rotation2`=-0.307199, `rotation3`=0.636891 WHERE `guid`=20459;

-- Correct position of Grand Admiral Daelin Proudmoore in Stormwind City (position is off by 0.710573 yards).
UPDATE `gameobject` SET `position_x`=-8338.47, `position_y`=509.132, `position_z`=122.931, `orientation`=0, `rotation0`=-0.307199, `rotation1`=-0.636889, `rotation2`=-0.307199, `rotation3`=0.636891 WHERE `guid`=31619;

-- Correct position of King Llane I of the House of Wrynn in Stormwind City (position is off by 0.280281 yards).
UPDATE `gameobject` SET `position_x`=-8337.72, `position_y`=519.841, `position_z`=122.939, `orientation`=5.15595, `rotation0`=-0.667572, `rotation1`=-0.233126, `rotation2`=-0.667571, `rotation3`=0.23313 WHERE `guid`=20458;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
