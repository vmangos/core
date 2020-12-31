DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20191206232444');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20191206232444');
-- Add your query below.


-- Add missing areatrigger teleport entries.
INSERT INTO `areatrigger_teleport` (`id`, `patch`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `required_item`) VALUES
(942, 0, 'Thousand Needles - Test of Faith', 1, -5191.27, -2802.59, -7.21111, 5.67232, 0),
(944, 0,  'Thousand Needles - Test of Faith', 1, -5191.27, -2802.59, -7.21111, 5.67232, 0),
(1103, 0,  'Transpolyporter - Booty Bay to Gnomeregan', 0, -5095.58, 756.763, 260.55, 6.28319, 9173),
(1104, 0,  'Transpolyporter - Gnomeregan to Booty Bay', 0, -14460, 463.278, 15.1651, 4.71239, 9173),
(2068, 0,  'Blackrock Spire - Jump Exit', 0, -7558.39, -1309.43, 248.454, 1.5708, 0),
(1626, 0,  'Old Hillsbrad Foothills - Exit', 1, -8341.56, -4063.62, -207.981, 3.14159, 0),
(2407, 0,  'Shadowfang Keep - Left Jump Exit', 0, -276.241, 1652.68, 77.5589, 3.14159, 0),
(2408, 0,  'Shadowfang Keep - Front Jump Exit', 0, -225.34, 1556.53, 93.0454, 4.71239, 0),
(2409, 0,  'Shadowfang Keep - Front Jump Exit', 0, -225.34, 1556.53, 93.0454, 4.71239, 0),
(2410, 0,  'Shadowfang Keep - Right Jump Exit', 0, -181.26, 1580.65, 97.4466, 6.28319, 0),
(2411, 0,  'Shadowfang Keep - Right Jump Exit', 0, -181.26, 1580.65, 97.4466, 6.28319, 0),
(2548, 0,  'Scholomance - Balcony Exit', 0, 1399.42, -2574.59, 107.786, 6.28319, 0),
(2549, 0,  'Scholomance - Balcony Exit', 0, 1399.42, -2574.59, 107.786, 6.28319, 0),
(3669, 3,  'Warsong Gulch - Horde Exit', 1, 1035.27, -2104.28, 122.945, 4.71239, 0),
(3671, 3,  'Warsong Gulch - Alliance Exit', 1, 1459.17, -1858.67, 124.762, 6.02139, 0);

-- Correct coordinates for Rise of the Defiler teleport spells.
UPDATE `spell_target_position` SET `target_position_x`=-11235, `target_position_y`=-2834.75, `target_position_z`=157.924, `target_orientation`=4.71239 WHERE `id`=12885;
UPDATE `spell_target_position` SET `target_position_x`=-11235, `target_position_y`=-2834.75, `target_position_z`=157.924, `target_orientation`=4.71239 WHERE `id`=13044;
UPDATE `spell_target_position` SET `target_position_x`=-11235, `target_position_y`=-2834.75, `target_position_z`=157.924, `target_orientation`=4.71239 WHERE `id`=13142;
UPDATE `spell_target_position` SET `target_position_x`=-11235, `target_position_y`=-2834.75, `target_position_z`=157.924, `target_orientation`=4.71239 WHERE `id`=13461;

-- Correct coordinates for areatrigger teleport destinations.
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Graveyard - Entrance', `target_position_x`=1687.27, `target_position_y`=1050.09, `target_position_z`=18.6773, `target_orientation`=1.5708 WHERE `id`=45;
UPDATE `areatrigger_teleport` SET `name`='Deadmines - Entrance', `target_position_x`=-14.5732, `target_position_y`=-385.475, `target_position_z`=62.4561, `target_orientation`=1.5708 WHERE `id`=78;
UPDATE `areatrigger_teleport` SET `name`='Deadmines - Back Exit', `target_position_x`=-11339.9, `target_position_y`=1572.45, `target_position_z`=94.3916, `target_orientation`=1.5708 WHERE `id`=121;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Stockades - Entrance', `target_position_x`=48.9849, `target_position_y`=0.483882, `target_position_z`=-16.3942, `target_orientation`=6.28319 WHERE `id`=101;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Vault - Entrance' WHERE `id`=107;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Vault - Exit', `target_position_x`=-8661.57, `target_position_y`=616.574, `target_position_z`=86.1877, `target_orientation`=5.49779 WHERE `id`=109;
UPDATE `areatrigger_teleport` SET `name`='Deadmines - Exit', `target_position_x`=-11208.7, `target_position_y`=1675.9, `target_position_z`=24.5733, `target_orientation`=4.71239 WHERE `id`=119;
UPDATE `areatrigger_teleport` SET `name`='Shadowfang Keep - Entrance', `target_position_x`=-228.191, `target_position_y`=2111.41, `target_position_z`=76.8904, `target_orientation`=1.22173 WHERE `id`=145;
UPDATE `areatrigger_teleport` SET `name`='Shadowfang Keep - Exit', `target_position_x`=-233.011, `target_position_y`=1567.5, `target_position_z`=76.8921, `target_orientation`=4.27606 WHERE `id`=194;
UPDATE `areatrigger_teleport` SET `name`='Wailing Caverns - Exit', `target_position_x`=-738.462, `target_position_y`=-2217.8, `target_position_z`=16.919, `target_orientation`=6.02139 WHERE `id`=226;
UPDATE `areatrigger_teleport` SET `name`='Wailing Caverns - Entrance', `target_position_x`=-158.441, `target_position_y`=131.601, `target_position_z`=-74.2552, `target_orientation`=5.84685 WHERE `id`=228;
UPDATE `areatrigger_teleport` SET `name`='Razorfen Kraul - Exit', `target_position_x`=-4463.32, `target_position_y`=-1664.29, `target_position_z`=84.0489, `target_orientation`=3.92699 WHERE `id`=242;
UPDATE `areatrigger_teleport` SET `name`='Razorfen Kraul - Entrance', `target_position_x`=1942.27, `target_position_y`=1544.23, `target_position_z`=83.3055, `target_orientation`=1.309 WHERE `id`=244;
UPDATE `areatrigger_teleport` SET `name`='Blackfathom Deeps - Entrance', `target_position_x`=-150.234, `target_position_y`=106.594, `target_position_z`=-39.779, `target_orientation`=4.45059 WHERE `id`=257;
UPDATE `areatrigger_teleport` SET `name`='Blackfathom Deeps - Exit', `target_position_x`=4246.68, `target_position_y`=743.402, `target_position_z`=-24.8573, `target_orientation`=4.71239 WHERE `id`=259;
UPDATE `areatrigger_teleport` SET `name`='Uldaman - Entrance', `target_position_x`=-228.859, `target_position_y`=46.1018, `target_position_z`=-46.0186, `target_orientation`=1.5708 WHERE `id`=286;
UPDATE `areatrigger_teleport` SET `name`='Uldaman - Exit', `target_position_x`=-6066.25, `target_position_y`=-2954.56, `target_position_z`=209.772, `target_orientation`=3.14159 WHERE `id`=288;
UPDATE `areatrigger_teleport` SET `name`='Gnomeregan - Exit', `target_position_x`=-5162.57, `target_position_y`=927.841, `target_position_z`=257.177, `target_orientation`=4.71239 WHERE `id`=322;
UPDATE `areatrigger_teleport` SET `name`='Gnomeregan - Entrance', `target_position_x`=-329.098, `target_position_y`=-3.20722, `target_position_z`=-152.851, `target_orientation`=2.96706 WHERE `id`=324;
UPDATE `areatrigger_teleport` SET `name`='Razorfen Downs - Entrance', `target_position_x`=2593.68, `target_position_y`=1111.23, `target_position_z`=50.9518, `target_orientation`=4.71239 WHERE `id`=442;
UPDATE `areatrigger_teleport` SET `name`='Razorfen Downs - Exit', `target_position_x`=-4659.64, `target_position_y`=-2524.24, `target_position_z`=81.374, `target_orientation`=0.785398 WHERE `id`=444;
UPDATE `areatrigger_teleport` SET `name`='Sunken Temple - Entrance', `target_position_x`=-315.903, `target_position_y`=100.197, `target_position_z`=-131.849, `target_orientation`=3.14159 WHERE `id`=446;
UPDATE `areatrigger_teleport` SET `name`='Sunken Temple - Exit', `target_position_x`=-10176.6, `target_position_y`=-3995.35, `target_position_z`=-112.185, `target_orientation`=3.00197 WHERE `id`=448;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Stockades - Exit', `target_position_x`=-8766.11, `target_position_y`=845.499, `target_position_z`=87.9952, `target_orientation`=3.83972 WHERE `id`=503;
UPDATE `areatrigger_teleport` SET `name`='Gnomeregan - Back Entrance', `target_position_x`=-733.636, `target_position_y`=1.86838, `target_position_z`=-249.09, `target_orientation`=3.14159 WHERE `id`=523;
UPDATE `areatrigger_teleport` SET `name`='Gnomeregan - Back Exit', `target_position_x`=-4858.97, `target_position_y`=770.207, `target_position_z`=241.805, `target_orientation`=4.71239 WHERE `id`=525;
UPDATE `areatrigger_teleport` SET `name`='Darnassus - Exit', `target_position_x`=8785.79, `target_position_y`=966.983, `target_position_z`=30.1999, `target_orientation`=3.40339 WHERE `id`=527;
UPDATE `areatrigger_teleport` SET `name`='Darnassus - Entrance', `target_position_x`=9946.25, `target_position_y`=2612.97, `target_position_z`=1316.49, `target_orientation`=4.71239 WHERE `id`=542;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Graveyard - Exit', `target_position_x`=2915.34, `target_position_y`=-801.58, `target_position_z`=160.333, `target_orientation`=3.49066 WHERE `id`=602;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Cathedral - Exit', `target_position_x`=2915.13, `target_position_y`=-823.637, `target_position_z`=160.327, `target_orientation`=3.49066 WHERE `id`=604;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Armory - Exit', `target_position_x`=2885.96, `target_position_y`=-835.802, `target_position_z`=160.327, `target_orientation`=0.349066 WHERE `id`=606;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Library - Exit', `target_position_x`=2869.32, `target_position_y`=-820.818, `target_position_z`=160.333, `target_orientation`=0.349066 WHERE `id`=608;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Cathedral - Entrance', `target_position_x`=853.179, `target_position_y`=1319.18, `target_position_z`=18.6714, `target_orientation`=1.5708 WHERE `id`=610;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Armory - Entrance', `target_position_x`=1608.1, `target_position_y`=-318.919, `target_position_z`=18.6714, `target_orientation`=4.71239 WHERE `id`=612;
UPDATE `areatrigger_teleport` SET `name`='Scarlet Monastery Library - Entrance', `target_position_x`=253.672, `target_position_y`=-206.624, `target_position_z`=18.6773, `target_orientation`=4.71239 WHERE `id`=614;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Wizard\'s Sanctum - Exit', `target_position_x`=-9014.94, `target_position_y`=873.326, `target_position_z`=148.616, `target_orientation`=5.49779 WHERE `id`=702;
UPDATE `areatrigger_teleport` SET `name`='Stormwind Wizard\'s Sanctum - Entrance', `target_position_x`=-9017.46, `target_position_y`=885.901, `target_position_z`=29.6207, `target_orientation`=5.49779 WHERE `id`=704;
UPDATE `areatrigger_teleport` SET `name`='Uldaman - Back Exit', `target_position_x`=-6619.97, `target_position_y`=-3765.74, `target_position_z`=266.309, `target_orientation`=3.40339 WHERE `id`=882;
UPDATE `areatrigger_teleport` SET `name`='Uldaman - Back Entrance', `target_position_x`=-212.95, `target_position_y`=382.427, `target_position_z`=-38.7486, `target_orientation`=1.39626 WHERE `id`=902;
UPDATE `areatrigger_teleport` SET `name`='Zul\'Farrak - Exit', `target_position_x`=-6795.56, `target_position_y`=-2890.72, `target_position_z`=8.88742, `target_orientation`=3.14159 WHERE `id`=922;
UPDATE `areatrigger_teleport` SET `name`='Zul\'Farrak - Entrance', `target_position_x`=1212.67, `target_position_y`=842.04, `target_position_z`=8.93346, `target_orientation`=6.28319 WHERE `id`=924;
UPDATE `areatrigger_teleport` SET `name`='Thousand Needles - Test of Faith', `target_position_x`=-5191.27, `target_position_y`=-2802.59, `target_position_z`=-7.21111, `target_orientation`=5.67232 WHERE `id`=943;
UPDATE `areatrigger_teleport` SET `name`='Onyxia\'s Lair - Exit', `target_position_x`=-4750.38, `target_position_y`=-3754.44, `target_position_z`=49.0485, `target_orientation`=0.785398 WHERE `id`=1064;
UPDATE `areatrigger_teleport` SET `name`='Blackrock Depths - Entrance', `target_position_x`=456.929, `target_position_y`=34.0923, `target_position_z`=-68.0896, `target_orientation`=4.71239 WHERE `id`=1466;
UPDATE `areatrigger_teleport` SET `name`='Blackrock Spire - Entrance', `target_position_x`=78.3534, `target_position_y`=-226.841, `target_position_z`=49.7662, `target_orientation`=4.71239 WHERE `id`=1468;
UPDATE `areatrigger_teleport` SET `name`='Blackrock Spire - Exit', `target_position_x`=-7524.7, `target_position_y`=-1228.41, `target_position_z`=287.204, `target_orientation`=1.74533 WHERE `id`=1470;
UPDATE `areatrigger_teleport` SET `name`='Blackrock Depths - Exit', `target_position_x`=-7178.41, `target_position_y`=-922.152, `target_position_z`=166.092, `target_orientation`=2.00713 WHERE `id`=1472;
UPDATE `areatrigger_teleport` SET `name`='Deeprun Tram Ironforge - Exit', `target_position_x`=-4839.51, `target_position_y`=-1317.74, `target_position_z`=501.868, `target_orientation`=1.48353 WHERE `id`=2166;
UPDATE `areatrigger_teleport` SET `name`='Deeprun Tram Stormwind - Exit', `target_position_x`=-8354.23, `target_position_y`=524.068, `target_position_z`=91.7971, `target_orientation`=2.35619 WHERE `id`=2171;
UPDATE `areatrigger_teleport` SET `name`='Deeprun Tram Stormwind - Entrance', `target_position_x`=67.7607, `target_position_y`=2490.98, `target_position_z`=-4.29649, `target_orientation`=3.14159 WHERE `id`=2173;
UPDATE `areatrigger_teleport` SET `name`='Deeprun Tram Ironforge - Exit', `target_position_x`=69.2277, `target_position_y`=10.3932, `target_position_z`=-4.29665, `target_orientation`=3.14159 WHERE `id`=2175;
UPDATE `areatrigger_teleport` SET `name`='Stratholme - Back Entrance', `target_position_x`=3590.87, `target_position_y`=-3643.22, `target_position_z`=138.491, `target_orientation`=5.49779 WHERE `id`=2214;
UPDATE `areatrigger_teleport` SET `name`='Stratholme - Right Entrance', `target_position_x`=3392.92, `target_position_y`=-3395.03, `target_position_z`=143.135, `target_orientation`=1.5708 WHERE `id`=2216;
UPDATE `areatrigger_teleport` SET `name`='Stratholme - Left Entrance', `target_position_x`=3392.84, `target_position_y`=-3364.44, `target_position_z`=142.965, `target_orientation`=4.71239 WHERE `id`=2217;
UPDATE `areatrigger_teleport` SET `name`='Stratholme - Back Exit', `target_position_x`=3233.06, `target_position_y`=-4048.3, `target_position_z`=108.442, `target_orientation`=2.00713 WHERE `id`=2221;
UPDATE `areatrigger_teleport` SET `name`='Ragefire Chasm - Exit', `target_position_x`=1814.99, `target_position_y`=-4419.23, `target_position_z`=-18.8151, `target_orientation`=1.91986 WHERE `id`=2226;
UPDATE `areatrigger_teleport` SET `name`='Ragefire Chasm - Entrance', `target_position_x`=0.797643, `target_position_y`=-8.23429, `target_position_z`=-15.5288, `target_orientation`=4.71239 WHERE `id`=2230;
UPDATE `areatrigger_teleport` SET `name`='Shadowfang Keep - Left Jump Exit', `target_position_x`=-276.241, `target_position_y`=1652.68, `target_position_z`=77.5589, `target_orientation`=3.14159 WHERE `id`=2406;
UPDATE `areatrigger_teleport` SET `name`='Hall of Legends - Entrance', `target_position_x`=222.22, `target_position_y`=74.457, `target_position_z`=25.7209, `target_orientation`=0.610865 WHERE `id`=2527;
UPDATE `areatrigger_teleport` SET `name`='Hall of Legends - Exit', `target_position_x`=1637.91, `target_position_y`=-4240.25, `target_position_z`=56.1744, `target_orientation`=3.92699 WHERE `id`=2530;
UPDATE `areatrigger_teleport` SET `name`='Champions\' Hall - Entrance', `target_position_x`=-0.401287, `target_position_y`=2.40001, `target_position_z`=-0.255885, `target_orientation`=1.5708 WHERE `id`=2532;
UPDATE `areatrigger_teleport` SET `name`='Champions\' Hall Exit', `target_position_x`=-8762.82, `target_position_y`=402.434, `target_position_z`=103.901, `target_orientation`=5.49779 WHERE `id`=2534;
UPDATE `areatrigger_teleport` SET `name`='Scholomance - Balcony Exit', `target_position_x`=1399.42, `target_position_y`=-2574.59, `target_position_z`=107.786, `target_orientation`=6.28319 WHERE `id`=2547;
UPDATE `areatrigger_teleport` SET `name`='Scholomance - Entrance', `target_position_x`=190.819, `target_position_y`=126.329, `target_position_z`=137.227, `target_orientation`=6.28319 WHERE `id`=2567;
UPDATE `areatrigger_teleport` SET `name`='Scholomance - Exit', `target_position_x`=1273.91, `target_position_y`=-2553.09, `target_position_z`=91.8393, `target_orientation`=3.57792 WHERE `id`=2568;
UPDATE `areatrigger_teleport` SET `name`='Alterac Valley - Horde Exit', `target_position_x`=536.495, `target_position_y`=-1085.72, `target_position_z`=106.27, `target_orientation`=3.66519 WHERE `id`=2606;
UPDATE `areatrigger_teleport` SET `name`='Alterac Valley - Alliance Exit', `target_position_x`=101.144, `target_position_y`=-184.934, `target_position_z`=127.344, `target_orientation`=4.88692 WHERE `id`=2608;
UPDATE `areatrigger_teleport` SET `name`='Onyxia\'s Lair - Entrance', `target_position_x`=30.8916, `target_position_y`=-54.079, `target_position_z`=-5.02784, `target_orientation`=4.71239 WHERE `id`=2848;
UPDATE `areatrigger_teleport` SET `name`='Molten Core - Entrance', `target_position_x`=1091.89, `target_position_y`=-466.985, `target_position_z`=-105.084, `target_orientation`=3.14159 WHERE `id`=2886;
UPDATE `areatrigger_teleport` SET `name`='Molten Core - Exit', `target_position_x`=-7508.32, `target_position_y`=-1039.74, `target_position_z`=180.912, `target_orientation`=3.83972 WHERE `id`=2890;
UPDATE `areatrigger_teleport` SET `name`='Maraudon - Purple Exit', `target_position_x`=-1182.8, `target_position_y`=2877.43, `target_position_z`=85.908, `target_orientation`=1.65806 WHERE `id`=3126;
UPDATE `areatrigger_teleport` SET `name`='Maraudon - Orange Exit', `target_position_x`=-1468.2, `target_position_y`=2614.21, `target_position_z`=76.3804, `target_orientation`=6.28319 WHERE `id`=3131;
UPDATE `areatrigger_teleport` SET `name`='Maraudon - Orange Entrance', `target_position_x`=1016.83, `target_position_y`=-458.52, `target_position_z`=-43.4737, `target_orientation`=6.28319 WHERE `id`=3133;
UPDATE `areatrigger_teleport` SET `name`='Maraudon - Purple Entrance', `target_position_x`=755.078, `target_position_y`=-617.696, `target_position_z`=-32.9222, `target_orientation`=1.5708 WHERE `id`=3134;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 1', `target_position_x`=47.4501, `target_position_y`=-153.665, `target_position_z`=-2.71439, `target_orientation`=5.49779 WHERE `id`=3183;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 2', `target_position_x`=-203.166, `target_position_y`=-322.997, `target_position_z`=-2.72467, `target_orientation`=4.71239 WHERE `id`=3184;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 3', `target_position_x`=10.5786, `target_position_y`=-836.991, `target_position_z`=-32.3988, `target_orientation`=6.28319 WHERE `id`=3185;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 4', `target_position_x`=-65.6559, `target_position_y`=159.561, `target_position_z`=-3.4647, `target_orientation`=2.35619 WHERE `id`=3186;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 5', `target_position_x`=33.1083, `target_position_y`=158.977, `target_position_z`=-3.47126, `target_orientation`=0.785398 WHERE `id`=3187;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Entrance 6', `target_position_x`=254.92, `target_position_y`=-19.463, `target_position_z`=-2.5596, `target_orientation`=5.49779 WHERE `id`=3189;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 4', `target_position_x`=-3829.68, `target_position_y`=1250.52, `target_position_z`=160.226, `target_orientation`=6.28319 WHERE `id`=3190;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 5', `target_position_x`=-3749.41, `target_position_y`=1249.25, `target_position_z`=160.221, `target_orientation`=3.14159 WHERE `id`=3191;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 6', `target_position_x`=-3520.24, `target_position_y`=1078.4, `target_position_z`=161.103, `target_orientation`=1.5708 WHERE `id`=3193;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 1', `target_position_x`=-3738.62, `target_position_y`=934.522, `target_position_z`=160.975, `target_orientation`=3.14159 WHERE `id`=3194;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 2', `target_position_x`=-3981.04, `target_position_y`=777.815, `target_position_z`=160.965, `target_orientation`=1.5708 WHERE `id`=3195;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Exit 3', `target_position_x`=-4031.25, `target_position_y`=129.345, `target_position_z`=26.4744, `target_orientation`=2.70526 WHERE `id`=3196;
UPDATE `areatrigger_teleport` SET `name`='Dire Maul - Tunnel Exit', `target_position_x`=-3585.84, `target_position_y`=847.367, `target_position_z`=138.641, `target_orientation`=2.35619 WHERE `id`=3197;
UPDATE `areatrigger_teleport` SET `name`='Molten Core - Window Entrance', `target_position_x`=1091.89, `target_position_y`=-466.985, `target_position_z`=-105.084, `target_orientation`=3.14159 WHERE `id`=3528;
UPDATE `areatrigger_teleport` SET `name`='Molten Core - Window Lava Entrance', `target_position_x`=1091.89, `target_position_y`=-466.985, `target_position_z`=-105.084, `target_orientation`=3.14159 WHERE `id`=3529;
UPDATE `areatrigger_teleport` SET `name`='Blackwing Lair - Entrance', `target_position_x`=-7672.32, `target_position_y`=-1107.05, `target_position_z`=396.651, `target_orientation`=0.785398 WHERE `id`=3726;
UPDATE `areatrigger_teleport` SET `name`='Blackwing Lair - Exit', `target_position_x`=-7524.7, `target_position_y`=-1228.41, `target_position_z`=287.204, `target_orientation`=1.74533 WHERE `id`=3728;
UPDATE `areatrigger_teleport` SET `name`='Zul\'Gurub - Entrance', `target_position_x`=-11916.6, `target_position_y`=-1243.52, `target_position_z`=92.5338, `target_orientation`=4.71239 WHERE `id`=3928;
UPDATE `areatrigger_teleport` SET `name`='Zul\'Gurub - Exit', `target_position_x`=-11916.2, `target_position_y`=-1206.9, `target_position_z`=92.2612, `target_orientation`=1.5708 WHERE `id`=3930;
UPDATE `areatrigger_teleport` SET `name`='Arathi Basin - Alliance Exit', `target_position_x`=-1215.59, `target_position_y`=-2531.75, `target_position_z`=21.6734, `target_orientation`=3.1765 WHERE `id`=3948;
UPDATE `areatrigger_teleport` SET `name`='Arathi Basin - Horde Exit', `target_position_x`=-831.881, `target_position_y`=-3518.52, `target_position_z`=72.4831, `target_orientation`=3.36849 WHERE `id`=3949;
UPDATE `areatrigger_teleport` SET `name`='Ruins Of Ahn\'Qiraj - Exit', `target_position_x`=-8415.7, `target_position_y`=1502.44, `target_position_z`=30.6862, `target_orientation`=5.49779 WHERE `id`=4006;
UPDATE `areatrigger_teleport` SET `name`='Ruins Of Ahn\'Qiraj - Entrance', `target_position_x`=-8436.53, `target_position_y`=1519.17, `target_position_z`=31.907, `target_orientation`=2.61799 WHERE `id`=4008;
UPDATE `areatrigger_teleport` SET `name`='Temple of Ahn\'Qiraj - Entrance', `target_position_x`=-8221.35, `target_position_y`=2014.34, `target_position_z`=129.071, `target_orientation`=0.872665 WHERE `id`=4010;
UPDATE `areatrigger_teleport` SET `name`='Temple of Ahn\'Qiraj - Exit', `target_position_x`=-8239.01, `target_position_y`=1993.25, `target_position_z`=129.071, `target_orientation`=4.01426 WHERE `id`=4012;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
