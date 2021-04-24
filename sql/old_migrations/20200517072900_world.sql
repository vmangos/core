DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200517072900');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200517072900');
-- Add your query below.


-- Correct position of some creature spawns.
UPDATE `creature` SET `position_x`=-41.3658, `position_y`=-457.912, `position_z`=-18.5609, `orientation`=0 WHERE `guid`=300463; -- Smolderthorn Witch Doctor
UPDATE `creature` SET `position_x`=-24.0486, `position_y`=-407.81, `position_z`=-18.8517, `orientation`=5.02655 WHERE `guid`=44007; -- Firebrand Darkweaver
UPDATE `creature` SET `position_x`=-17.6312, `position_y`=-454.942, `position_z`=-18.5609, `orientation`=4.29351 WHERE `guid`=45841; -- Mor Grayhoof Trigger
UPDATE `creature` SET `position_x`=-16.0525, `position_y`=-407.129, `position_z`=-18.8517, `orientation`=6.24828 WHERE `guid`=43765; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=-100.963, `position_y`=-491.208, `position_z`=-18.3731, `orientation`=1.72788 WHERE `guid`=44328; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=8.80271, `position_y`=-450.548, `position_z`=111.02, `orientation`=5.68977 WHERE `guid`=42664; -- Rage Talon Captain
UPDATE `creature` SET `position_x`=-125.541, `position_y`=-472.941, `position_z`=24.3398, `orientation`=5.044 WHERE `guid`=43550; -- Smolderthorn Shadow Priest
UPDATE `creature` SET `position_x`=866.556, `position_y`=-195.949, `position_z`=-43.6204, `orientation`=3.99988 WHERE `guid`=90885; -- Grim Patron
UPDATE `creature` SET `position_x`=23.5463, `position_y`=-568.205, `position_z`=-18.5181, `orientation`=2.80998 WHERE `guid`=300467; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=847.848, `position_y`=-230.067, `position_z`=-43.614, `orientation`=1.64061 WHERE `guid`=46615; -- Phalanx
UPDATE `creature` SET `position_x`=19.0928, `position_y`=-581.621, `position_z`=-18.5181, `orientation`=0.541052 WHERE `guid`=300469; -- Firebrand Darkweaver
UPDATE `creature` SET `position_x`=2270.7, `position_y`=279.998, `position_z`=36.7213, `orientation`=2.70526 WHERE `guid`=29798; -- Deathguard Burgess
UPDATE `creature` SET `position_x`=2245.02, `position_y`=326.545, `position_z`=36.888, `orientation`=5.55015 WHERE `guid`=31907; -- Blue Skeletal Horse
UPDATE `creature` SET `position_x`=2256.13, `position_y`=329.335, `position_z`=36.888, `orientation`=5.5676 WHERE `guid`=31906; -- Brown Skeletal Horse
UPDATE `creature` SET `position_x`=2250.26, `position_y`=322.024, `position_z`=36.7816, `orientation`=5.63741 WHERE `guid`=31909; -- Red Skeletal Horse
UPDATE `creature` SET `position_x`=2259.99, `position_y`=325.121, `position_z`=36.7954, `orientation`=5.2709 WHERE `guid`=31920; -- Thomas Arlento
UPDATE `creature` SET `position_x`=2266.06, `position_y`=320.66, `position_z`=35.2273, `orientation`=5.48033 WHERE `guid`=28478; -- Morganus
UPDATE `creature` SET `position_x`=-3720.35, `position_y`=-4551.57, `position_z`=25.917, `orientation`=1.27409 WHERE `guid`=150017; -- Theramore Lieutenant
UPDATE `creature` SET `position_x`=-6672.25, `position_y`=-2240.52, `position_z`=278.577, `orientation`=4.66003 WHERE `guid`=6874; -- Neeka Bloodscar
UPDATE `creature` SET `position_x`=-6656, `position_y`=-2236.71, `position_z`=256.213, `orientation`=6.12611 WHERE `guid`=6899; -- Kargath Grunt
UPDATE `creature` SET `position_x`=1632.21, `position_y`=-4262.19, `position_z`=49.027, `orientation`=3.63029 WHERE `guid`=300378; -- Sergeant Ba'sha
UPDATE `creature` SET `position_x`=-10653.3, `position_y`=1166.43, `position_z`=34.9278, `orientation`=5.77704 WHERE `guid`=66978; -- Innkeeper Heather
UPDATE `creature` SET `position_x`=-10641.7, `position_y`=1093.46, `position_z`=34.043, `orientation`=4.74729 WHERE `guid`=89535; -- Protector Leick
UPDATE `creature` SET `position_x`=1920.07, `position_y`=-4125.69, `position_z`=42.9976, `orientation`=4.79965 WHERE `guid`=4770; -- Thrall
UPDATE `creature` SET `position_x`=1744.9, `position_y`=-4317.86, `position_z`=33.3935, `orientation`=4.2237 WHERE `guid`=301556; -- Horthus
UPDATE `creature` SET `position_x`=-5070.18, `position_y`=480.105, `position_z`=401.726, `orientation`=0.854646 WHERE `guid`=2422; -- Leper Gnome
UPDATE `creature` SET `position_x`=-5090.42, `position_y`=439.002, `position_z`=409.374, `orientation`=0.165834 WHERE `guid`=2416; -- Leper Gnome
UPDATE `creature` SET `position_x`=-5078.93, `position_y`=489.413, `position_z`=401.821, `orientation`=4.61935 WHERE `guid`=2424; -- Leper Gnome
UPDATE `creature` SET `position_x`=5717.89, `position_y`=-4794.96, `position_z`=778.147, `orientation`=1.36136 WHERE `guid`=301303; -- Ranshalla
UPDATE `creature` SET `position_x`=-22.6518, `position_y`=-299.75, `position_z`=31.7016, `orientation`=4.66003 WHERE `guid`=43518; -- Highlord Omokk
UPDATE `creature` SET `position_x`=-10857.2, `position_y`=-4096.36, `position_z`=21.9338, `orientation`=1.3439 WHERE `guid`=32098; -- Stonard Shaman
UPDATE `creature` SET `position_x`=-6657.12, `position_y`=-1151.94, `position_z`=185.447, `orientation`=0.872665 WHERE `guid`=5686; -- Slave Worker
UPDATE `creature` SET `position_x`=6718.92, `position_y`=-4612.77, `position_z`=721.258, `orientation`=1.50098 WHERE `guid`=42295; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=430.377, `position_y`=-574.341, `position_z`=171.188, `orientation`=4.09606 WHERE `guid`=16775; -- Crushridge Brute
UPDATE `creature` SET `position_x`=94.6544, `position_y`=-275.047, `position_z`=60.7526, `orientation`=3.14159 WHERE `guid`=300421; -- Scarshield Legionnaire
UPDATE `creature` SET `position_x`=144.438, `position_y`=-258.034, `position_z`=96.4066, `orientation`=4.67748 WHERE `guid`=40453; -- Pyroguard Emberseer
UPDATE `creature` SET `position_x`=156.815, `position_y`=-283.34, `position_z`=71.0354, `orientation`=1.98968 WHERE `guid`=40263; -- Blackhand Summoner
UPDATE `creature` SET `position_x`=-8655.16, `position_y`=-126.92, `position_z`=89.6724, `orientation`=2.81602 WHERE `guid`=80071; -- Kobold Laborer
UPDATE `creature` SET `position_x`=1731.76, `position_y`=521.965, `position_z`=35.983, `orientation`=1.58825 WHERE `guid`=160014; -- Darkcaller Yanka
UPDATE `creature` SET `position_x`=573.771, `position_y`=702.362, `position_z`=19.1922, `orientation`=5.11381 WHERE `guid`=17653; -- Lake Frenzy
UPDATE `creature` SET `position_x`=1251.41, `position_y`=313.892, `position_z`=-63.6062, `orientation`=0.139626 WHERE `guid`=32075; -- Horde Warbringer
UPDATE `creature` SET `position_x`=117.153, `position_y`=390.882, `position_z`=28.6844, `orientation`=3.92699 WHERE `guid`=300112; -- Skeletal Highborne
UPDATE `creature` SET `position_x`=1805.01, `position_y`=-1180.72, `position_z`=59.6525, `orientation`=2.90438 WHERE `guid`=47090; -- Skeletal Sorcerer
UPDATE `creature` SET `position_x`=-4770.94, `position_y`=904.221, `position_z`=142.938, `orientation`=5.97428 WHERE `guid`=50494; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=-4777.08, `position_y`=906.25, `position_z`=143.313, `orientation`=5.94406 WHERE `guid`=50566; -- Woodpaw Alpha
UPDATE `creature` SET `position_x`=-4748.86, `position_y`=859.499, `position_z`=143.56, `orientation`=1.96772 WHERE `guid`=50490; -- Woodpaw Mystic
UPDATE `creature` SET `position_x`=1820.34, `position_y`=1416.71, `position_z`=-7.91731, `orientation`=3.15905 WHERE `guid`=39934; -- Bloodmage Thalnos
UPDATE `creature` SET `position_x`=1635.92, `position_y`=-4785.59, `position_z`=87.3384, `orientation`=0.645772 WHERE `guid`=92335; -- Scarlet Warder
UPDATE `creature` SET `position_x`=-4529.83, `position_y`=326.051, `position_z`=34.6667, `orientation`=2.11185 WHERE `guid`=51408; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=-4462.28, `position_y`=309.811, `position_z`=40.041, `orientation`=2.94961 WHERE `guid`=51405; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=2288.81, `position_y`=-5319.24, `position_z`=89.053, `orientation`=2.19912 WHERE `guid`=53944; -- Argent Guard
UPDATE `creature` SET `position_x`=-4405.64, `position_y`=210.834, `position_z`=25.6852, `orientation`=6.07375 WHERE `guid`=51379; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=-4398.32, `position_y`=158.241, `position_z`=25.2933, `orientation`=6.24828 WHERE `guid`=51380; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=-4374.97, `position_y`=116.699, `position_z`=32.9572, `orientation`=5.53269 WHERE `guid`=51413; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=-10370.8, `position_y`=-3252.49, `position_z`=19.9496, `orientation`=0.680678 WHERE `guid`=31853; -- Stonard Grunt
UPDATE `creature` SET `position_x`=-10453.3, `position_y`=-3216.05, `position_z`=20.6376, `orientation`=1.58825 WHERE `guid`=31946; -- Stonard Grunt
UPDATE `creature` SET `position_x`=-10469.6, `position_y`=-3217.65, `position_z`=21.3671, `orientation`=1.25664 WHERE `guid`=31945; -- Stonard Grunt
UPDATE `creature` SET `position_x`=-10377.6, `position_y`=-3241.58, `position_z`=20.1081, `orientation`=0.558505 WHERE `guid`=31847; -- Stonard Grunt
UPDATE `creature` SET `position_x`=-1055.44, `position_y`=-215.423, `position_z`=159.062, `orientation`=5.41052 WHERE `guid`=24728; -- Rahauro
UPDATE `creature` SET `position_x`=-4364.4, `position_y`=114.47, `position_z`=32.9969, `orientation`=3.40339 WHERE `guid`=51406; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=164.335, `position_y`=522.497, `position_z`=-48.3836, `orientation`=3.07178 WHERE `guid`=56948; -- Lorekeeper Lydros
UPDATE `creature` SET `position_x`=128.643, `position_y`=561.759, `position_z`=-4.31221, `orientation`=3.12414 WHERE `guid`=56961; -- Tsu'zee
UPDATE `creature` SET `position_x`=99.0028, `position_y`=570.998, `position_z`=28.6964, `orientation`=5.2709 WHERE `guid`=300132; -- Eldreth Sorcerer
UPDATE `creature` SET `position_x`=105.119, `position_y`=570.376, `position_z`=28.6945, `orientation`=4.81711 WHERE `guid`=300131; -- Skeletal Highborne
UPDATE `creature` SET `position_x`=-857.096, `position_y`=-570.751, `position_z`=11.2638, `orientation`=1.55334 WHERE `guid`=15326; -- Innkeeper Anderson
UPDATE `creature` SET `position_x`=-852.952, `position_y`=-516.397, `position_z`=12.0977, `orientation`=4.67748 WHERE `guid`=15328; -- Marshal Redpath
UPDATE `creature` SET `position_x`=-859.646, `position_y`=-544.452, `position_z`=10.1391, `orientation`=1.15192 WHERE `guid`=15325; -- Phin Odelic
UPDATE `creature` SET `position_x`=-1381.98, `position_y`=-76.0139, `position_z`=160.602, `orientation`=3.10669 WHERE `guid`=24794; -- Kergul Bloodaxe
UPDATE `creature` SET `position_x`=-3785.34, `position_y`=-4631.58, `position_z`=10.9288, `orientation`=5.2709 WHERE `guid`=30523; -- Theramore Guard
UPDATE `creature` SET `position_x`=-3778.08, `position_y`=-4608.73, `position_z`=10.9345, `orientation`=3.31613 WHERE `guid`=150016; -- Theramore Lieutenant
UPDATE `creature` SET `position_x`=-3895.72, `position_y`=-4495.72, `position_z`=13.1896, `orientation`=2.3911 WHERE `guid`=150015; -- Theramore Lieutenant
UPDATE `creature` SET `position_x`=-3819.66, `position_y`=-4502.27, `position_z`=11.4898, `orientation`=6.26573 WHERE `guid`=302704; -- Theramore Lieutenant
UPDATE `creature` SET `position_x`=2910.7, `position_y`=382.547, `position_z`=31.6674, `orientation`=3.31613 WHERE `guid`=44786; -- Maggot Eye
UPDATE `creature` SET `position_x`=2903.08, `position_y`=379.265, `position_z`=30.5587, `orientation`=2.77507 WHERE `guid`=44794; -- Rot Hide Mongrel
UPDATE `creature` SET `position_x`=-6197.86, `position_y`=-1082.17, `position_z`=-209.42, `orientation`=4.43314 WHERE `guid`=24663; -- Quixxil
UPDATE `creature` SET `position_x`=-4524.3, `position_y`=-788.135, `position_z`=-41.6152, `orientation`=5.54757 WHERE `guid`=51337; -- Falfindel Waywarder
UPDATE `creature` SET `position_x`=-7595.78, `position_y`=-1115.44, `position_z`=252.791, `orientation`=0.471239 WHERE `guid`=5363; -- Franclorn Forgewright
UPDATE `creature` SET `position_x`=2035.12, `position_y`=1885.26, `position_z`=103.22, `orientation`=0.61397 WHERE `guid`=44893; -- Night Web Spider
UPDATE `creature` SET `position_x`=-10547.5, `position_y`=-1212.67, `position_z`=26.9975, `orientation`=3.38594 WHERE `guid`=4184; -- Watchmaster Sorigal
UPDATE `creature` SET `position_x`=-8601.24, `position_y`=-137.716, `position_z`=87.7294, `orientation`=2.95405 WHERE `guid`=80078; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8588.91, `position_y`=-146.787, `position_z`=89.6068, `orientation`=1.47201 WHERE `guid`=80079; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8595.57, `position_y`=-174.25, `position_z`=87.1351, `orientation`=3.5713 WHERE `guid`=80076; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8581.85, `position_y`=-170.643, `position_z`=91.0671, `orientation`=5.31885 WHERE `guid`=80081; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8572.39, `position_y`=-150.957, `position_z`=89.5713, `orientation`=2.73987 WHERE `guid`=80082; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8565.25, `position_y`=-204.42, `position_z`=84.4446, `orientation`=2.29241 WHERE `guid`=80088; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-4907.21, `position_y`=-1368.4, `position_z`=-52.529, `orientation`=5.41052 WHERE `guid`=21584; -- Kanati Greycloud
UPDATE `creature` SET `position_x`=-3147.83, `position_y`=-2951.02, `position_z`=34.1154, `orientation`=4.93928 WHERE `guid`=8471; -- Brackenwall Enforcer
UPDATE `creature` SET `position_x`=-3149.8, `position_y`=-2912.48, `position_z`=35.0493, `orientation`=0.820305 WHERE `guid`=8475; -- Brackenwall Enforcer
UPDATE `creature` SET `position_x`=-8537.62, `position_y`=-182.695, `position_z`=84.0065, `orientation`=1.29357 WHERE `guid`=80085; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8549.15, `position_y`=-205.715, `position_z`=85.2505, `orientation`=0.837106 WHERE `guid`=80086; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-8561.45, `position_y`=-216.73, `position_z`=85.4262, `orientation`=1.64865 WHERE `guid`=80087; -- Kobold Laborer
UPDATE `creature` SET `position_x`=-6816.91, `position_y`=718.773, `position_z`=40.4978, `orientation`=5.2709 WHERE `guid`=42771; -- Cenarion Hold Infantry
UPDATE `creature` SET `position_x`=-6803.39, `position_y`=723.999, `position_z`=42.0662, `orientation`=4.90438 WHERE `guid`=42770; -- Cenarion Hold Infantry
UPDATE `creature` SET `position_x`=-10253.8, `position_y`=-4004.95, `position_z`=-89.5871, `orientation`=4.62512 WHERE `guid`=38705; -- Mummified Atal'ai
UPDATE `creature` SET `position_x`=-12501.7, `position_y`=-162.229, `position_z`=12.4564, `orientation`=4.55045 WHERE `guid`=2179; -- Mosh'Ogg Brute
UPDATE `creature` SET `position_x`=-12489.4, `position_y`=-171.436, `position_z`=12.9415, `orientation`=0.663225 WHERE `guid`=2166; -- Mosh'Ogg Witch Doctor
UPDATE `creature` SET `position_x`=987.48, `position_y`=1419.74, `position_z`=39.0897, `orientation`=0.767945 WHERE `guid`=18475; -- Moonrage Glutton
UPDATE `creature` SET `position_x`=-12332.7, `position_y`=190.718, `position_z`=25.6743, `orientation`=0.0698132 WHERE `guid`=659; -- Grom'gol Grunt
UPDATE `creature` SET `position_x`=-12395.1, `position_y`=131.913, `position_z`=3.74115, `orientation`=4.60767 WHERE `guid`=362; -- Grom'gol Grunt
UPDATE `creature` SET `position_x`=-12389.2, `position_y`=131.967, `position_z`=3.70147, `orientation`=4.64258 WHERE `guid`=603; -- Grom'gol Grunt
UPDATE `creature` SET `position_x`=594.716, `position_y`=1593.54, `position_z`=134.589, `orientation`=5.74213 WHERE `guid`=17641; -- Silverpine Deathguard
UPDATE `creature` SET `position_x`=458.612, `position_y`=1556.36, `position_z`=129.477, `orientation`=4.38078 WHERE `guid`=17869; -- Silverpine Deathguard
UPDATE `creature` SET `position_x`=105.175, `position_y`=-327.111, `position_z`=106.519, `orientation`=2.53073 WHERE `guid`=40469; -- Rage Talon Dragonspawn
UPDATE `creature` SET `position_x`=154.429, `position_y`=-289.456, `position_z`=71.0298, `orientation`=6.17846 WHERE `guid`=40265; -- Blackhand Dreadweaver
UPDATE `creature` SET `position_x`=15.7057, `position_y`=-319.695, `position_z`=48.9296, `orientation`=4.81711 WHERE `guid`=300443; -- Scarshield Worg
UPDATE `creature` SET `position_x`=102.802, `position_y`=-332.121, `position_z`=106.519, `orientation`=2.21657 WHERE `guid`=40459; -- Rage Talon Flamescale
UPDATE `creature` SET `position_x`=-860.528, `position_y`=-3556.43, `position_z`=72.5236, `orientation`=0.20944 WHERE `guid`=11240; -- Hammerfall Guardian
UPDATE `creature` SET `position_x`=-2820.04, `position_y`=-2655.72, `position_z`=33.4073, `orientation`=5.7751 WHERE `guid`=31376; -- Darkmist Silkspinner
UPDATE `creature` SET `position_x`=-87.1873, `position_y`=391.362, `position_z`=28.6844, `orientation`=4.93928 WHERE `guid`=300125; -- Rotting Highborne
UPDATE `creature` SET `position_x`=-2823.14, `position_y`=-2627.11, `position_z`=36.1214, `orientation`=1.81113 WHERE `guid`=31373; -- Darkmist Silkspinner
UPDATE `creature` SET `position_x`=-2813.48, `position_y`=-2651.82, `position_z`=33.5206, `orientation`=5.25035 WHERE `guid`=31370; -- Darkmist Lurker
UPDATE `creature` SET `position_x`=75.6378, `position_y`=760.819, `position_z`=63.7726, `orientation`=4.34587 WHERE `guid`=17749; -- Dalaran Wizard
UPDATE `creature` SET `position_x`=-8869.8, `position_y`=-372.731, `position_z`=71.795, `orientation`=1.36425 WHERE `guid`=80253; -- Defias Thug
UPDATE `creature` SET `position_x`=-15.4464, `position_y`=-3596.94, `position_z`=29.3809, `orientation`=0.314611 WHERE `guid`=13773; -- Peon
UPDATE `creature` SET `position_x`=-5180.45, `position_y`=-2531.37, `position_z`=-50.8602, `orientation`=0.789116 WHERE `guid`=21746; -- Galak Scout
UPDATE `creature` SET `position_x`=2039.39, `position_y`=1849.1, `position_z`=103.807, `orientation`=4.29365 WHERE `guid`=44891; -- Night Web Spider
UPDATE `creature` SET `position_x`=-13350, `position_y`=-29.166, `position_z`=22.3398, `orientation`=3.95073 WHERE `guid`=2225; -- Maury "Club Foot" Wilkins
UPDATE `creature` SET `position_x`=-4052.45, `position_y`=-2982.59, `position_z`=11.941, `orientation`=0.593412 WHERE `guid`=10482; -- Mosshide Gnoll
UPDATE `creature` SET `position_x`=-4138.79, `position_y`=-2946.87, `position_z`=11.8123, `orientation`=1.65806 WHERE `guid`=10304; -- Mosshide Mongrel
UPDATE `creature` SET `position_x`=-13478.2, `position_y`=178.213, `position_z`=43.0187, `orientation`=3.12527 WHERE `guid`=377; -- Bloodsail Elder Magus
UPDATE `creature` SET `position_x`=2342.92, `position_y`=1314.31, `position_z`=34.1193, `orientation`=3.19395 WHERE `guid`=44569; -- Farmer Solliden
UPDATE `creature` SET `position_x`=-14258.7, `position_y`=327.03, `position_z`=26.3636, `orientation`=5.55015 WHERE `guid`=2167; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=121.719, `position_y`=-301.577, `position_z`=71.056, `orientation`=0.750492 WHERE `guid`=40251; -- Blackhand Summoner
UPDATE `creature` SET `position_x`=157.88, `position_y`=-359.291, `position_z`=71.0256, `orientation`=1.53589 WHERE `guid`=45834; -- Blackhand Veteran
UPDATE `creature` SET `position_x`=159.006, `position_y`=-347.022, `position_z`=71.0129, `orientation`=0.802851 WHERE `guid`=40261; -- Blackhand Dreadweaver
UPDATE `creature` SET `position_x`=-14448.9, `position_y`=429.528, `position_z`=15.1049, `orientation`=3.735 WHERE `guid`=717; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=-9387.45, `position_y`=-117.388, `position_z`=58.8652, `orientation`=2.61799 WHERE `guid`=30; -- Matt
UPDATE `creature` SET `position_x`=-24.9202, `position_y`=509.228, `position_z`=-3.48459, `orientation`=2.44346 WHERE `guid`=300046; -- Eldreth Sorcerer
UPDATE `creature` SET `position_x`=9977.6, `position_y`=2313.53, `position_z`=1330.87, `orientation`=0.698132 WHERE `guid`=49936; -- Aethalas
UPDATE `creature` SET `position_x`=71.7459, `position_y`=-419.106, `position_z`=111.144, `orientation`=4.69494 WHERE `guid`=42153; -- Blackhand Thug
UPDATE `creature` SET `position_x`=-6181.69, `position_y`=-1151.78, `position_z`=-210.605, `orientation`=0.314159 WHERE `guid`=24379; -- Larion
UPDATE `creature` SET `position_x`=2488.19, `position_y`=19.0954, `position_z`=26.3224, `orientation`=1.48849 WHERE `guid`=45115; -- Shambling Horror
UPDATE `creature` SET `position_x`=-10518.8, `position_y`=-1210.91, `position_z`=28.1176, `orientation`=5.38461 WHERE `guid`=4083; -- Lohgan Eva
UPDATE `creature` SET `position_x`=-10532.4, `position_y`=-1213.12, `position_z`=28.1176, `orientation`=2.26332 WHERE `guid`=4195; -- Madame Eva
UPDATE `creature` SET `position_x`=-10522, `position_y`=-1278.78, `position_z`=39.1095, `orientation`=2.67363 WHERE `guid`=4181; -- Watcher Keller
UPDATE `creature` SET `position_x`=-10523.4, `position_y`=-1197.27, `position_z`=27.1923, `orientation`=2.89475 WHERE `guid`=4179; -- Watcher Hartin
UPDATE `creature` SET `position_x`=-10514.9, `position_y`=-1299.42, `position_z`=41.2922, `orientation`=3.19668 WHERE `guid`=4196; -- Whit Wantmal
UPDATE `creature` SET `position_x`=-10565, `position_y`=-1244.66, `position_z`=29.547, `orientation`=4.93982 WHERE `guid`=4180; -- Watcher Jan
UPDATE `creature` SET `position_x`=-10514.6, `position_y`=-1311.46, `position_z`=40.3401, `orientation`=0.476843 WHERE `guid`=4064; -- Malissa
UPDATE `creature` SET `position_x`=-10516.2, `position_y`=-1138.54, `position_z`=26.3151, `orientation`=0.395791 WHERE `guid`=4204; -- Avette Fellwood
UPDATE `creature` SET `position_x`=-10594.1, `position_y`=-1200.87, `position_z`=28.4989, `orientation`=3.13694 WHERE `guid`=4175; -- Elaine Carevin
UPDATE `creature` SET `position_x`=-10609.8, `position_y`=-1166.02, `position_z`=27.1074, `orientation`=4.17348 WHERE `guid`=4242; -- Matt Johnson
UPDATE `creature` SET `position_x`=-240.033, `position_y`=-4186.8, `position_z`=121.811, `orientation`=2.49582 WHERE `guid`=93603; -- Vilebranch Warrior
UPDATE `creature` SET `position_x`=-626.071, `position_y`=-4667.71, `position_z`=6.50807, `orientation`=2.75762 WHERE `guid`=301278; -- Katoom the Angler
UPDATE `creature` SET `position_x`=-11324, `position_y`=-213.783, `position_z`=76.6652, `orientation`=2.25148 WHERE `guid`=1396; -- Rebel Watchman
UPDATE `creature` SET `position_x`=-11958.1, `position_y`=-500.306, `position_z`=17.07, `orientation`=5.11863 WHERE `guid`=1423; -- Venture Co. Mechanic
UPDATE `creature` SET `position_x`=-11948.8, `position_y`=-501.675, `position_z`=17.0548, `orientation`=1.61432 WHERE `guid`=1414; -- Venture Co. Geologist
UPDATE `creature` SET `position_x`=2479.13, `position_y`=1369.2, `position_z`=13.2087, `orientation`=4.13327 WHERE `guid`=41668; -- Vile Fin Minor Oracle
UPDATE `creature` SET `position_x`=-14305, `position_y`=433.285, `position_z`=29.365, `orientation`=1.39626 WHERE `guid`=182; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=-14242.2, `position_y`=343.73, `position_z`=25.9658, `orientation`=5.39307 WHERE `guid`=2164; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=194.615, `position_y`=-255.949, `position_z`=77.0194, `orientation`=4.31096 WHERE `guid`=40277; -- Blackhand Veteran
UPDATE `creature` SET `position_x`=215.52, `position_y`=-337.733, `position_z`=76.9524, `orientation`=3.10669 WHERE `guid`=40266; -- Blackhand Dreadweaver
UPDATE `creature` SET `position_x`=-9061.28, `position_y`=-46.7949, `position_z`=88.9064, `orientation`=1.5708 WHERE `guid`=79929; -- Northshire Guard
UPDATE `creature` SET `position_x`=223.704, `position_y`=-297.484, `position_z`=77.0515, `orientation`=5.46288 WHERE `guid`=40270; -- Blackhand Summoner
UPDATE `creature` SET `position_x`=224.405, `position_y`=-307.493, `position_z`=77.0506, `orientation`=0.785398 WHERE `guid`=45832; -- Blackhand Summoner
UPDATE `creature` SET `position_x`=222.666, `position_y`=-334.586, `position_z`=77.013, `orientation`=3.07178 WHERE `guid`=40268; -- Blackhand Veteran
UPDATE `creature` SET `position_x`=232.84, `position_y`=-297.491, `position_z`=77.0546, `orientation`=4.08407 WHERE `guid`=40271; -- Blackhand Dreadweaver
UPDATE `creature` SET `position_x`=234.324, `position_y`=-306.764, `position_z`=77.0605, `orientation`=2.44346 WHERE `guid`=40269; -- Blackhand Dreadweaver
UPDATE `creature` SET `position_x`=1901.28, `position_y`=1572.59, `position_z`=89.0794, `orientation`=1.78157 WHERE `guid`=44942; -- Mindless Zombie
UPDATE `creature` SET `position_x`=-9455.43, `position_y`=73.7274, `position_z`=56.9503, `orientation`=3.14159 WHERE `guid`=80335; -- Stormwind Guard
UPDATE `creature` SET `position_x`=132.626, `position_y`=625.913, `position_z`=-48.3836, `orientation`=4.62512 WHERE `guid`=56951; -- Prince Tortheldrin
UPDATE `creature` SET `position_x`=2155.24, `position_y`=1270.96, `position_z`=52.518, `orientation`=5.49779 WHERE `guid`=28710; -- Deathguard Elite
UPDATE `creature` SET `position_x`=-10361.3, `position_y`=-3965.59, `position_z`=-84.5876, `orientation`=0.225782 WHERE `guid`=38944; -- Kazkaz the Unholy
UPDATE `creature` SET `position_x`=-9181.67, `position_y`=310.567, `position_z`=78.9916, `orientation`=1.58723 WHERE `guid`=79875; -- Stormwind Guard
UPDATE `creature` SET `position_x`=1069.79, `position_y`=-1902.31, `position_z`=48.0663, `orientation`=3.43562 WHERE `guid`=45413; -- Skeletal Flayer
UPDATE `creature` SET `position_x`=1077.09, `position_y`=-1915.14, `position_z`=63.1365, `orientation`=2.5889 WHERE `guid`=45407; -- Skeletal Sorcerer
UPDATE `creature` SET `position_x`=1075.58, `position_y`=-1932.21, `position_z`=38.6803, `orientation`=3.13942 WHERE `guid`=47189; -- Skeletal Sorcerer
UPDATE `creature` SET `position_x`=1043.73, `position_y`=-1939.94, `position_z`=38.6803, `orientation`=0.762625 WHERE `guid`=45410; -- Slavering Ghoul
UPDATE `creature` SET `position_x`=-457.466, `position_y`=-1468.01, `position_z`=90.1223, `orientation`=4.56161 WHERE `guid`=16053; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=1102.76, `position_y`=-176.101, `position_z`=-65.3086, `orientation`=4.88645 WHERE `guid`=46651; -- Doomforge Arcanasmith
UPDATE `creature` SET `position_x`=-3682.86, `position_y`=-4391.41, `position_z`=10.6955, `orientation`=0.645772 WHERE `guid`=150018; -- Theramore Lieutenant
UPDATE `creature` SET `position_x`=2402.67, `position_y`=500.464, `position_z`=39.9673, `orientation`=5.41052 WHERE `guid`=41294; -- Rotting Dead
UPDATE `creature` SET `position_x`=-2915.42, `position_y`=-313.87, `position_z`=57.4223, `orientation`=0.989173 WHERE `guid`=24949; -- Brave Lightninghorn
UPDATE `creature` SET `position_x`=-3056.28, `position_y`=80.2266, `position_z`=81.3127, `orientation`=4.04916 WHERE `guid`=24715; -- Mulgore Protector
UPDATE `creature` SET `position_x`=-3038.23, `position_y`=99.0721, `position_z`=82.407, `orientation`=1.18682 WHERE `guid`=24718; -- Mulgore Protector
UPDATE `creature` SET `position_x`=-3042.35, `position_y`=161.392, `position_z`=73.9713, `orientation`=0.715585 WHERE `guid`=24720; -- Mulgore Protector
UPDATE `creature` SET `position_x`=-3012.75, `position_y`=140.886, `position_z`=76.1471, `orientation`=1.16937 WHERE `guid`=24716; -- Mulgore Protector
UPDATE `creature` SET `position_x`=1669.34, `position_y`=-336.73, `position_z`=18.6778, `orientation`=1.21184 WHERE `guid`=40133; -- Scarlet Soldier
UPDATE `creature` SET `position_x`=2185.71, `position_y`=-657.377, `position_z`=89.6375, `orientation`=1.2712 WHERE `guid`=44517; -- Scarlet Zealot
UPDATE `creature` SET `position_x`=2168.97, `position_y`=-628.528, `position_z`=87.7579, `orientation`=0.391756 WHERE `guid`=38033; -- Scarlet Zealot
UPDATE `creature` SET `position_x`=-58.5133, `position_y`=-455.796, `position_z`=-18.5609, `orientation`=2.26893 WHERE `guid`=43570; -- Smolderthorn Witch Doctor
UPDATE `creature` SET `position_x`=1485.37, `position_y`=-1679.01, `position_z`=68.7104, `orientation`=2.61443 WHERE `guid`=47196; -- Soulless Ghoul
UPDATE `creature` SET `position_x`=1734.88, `position_y`=-1199.82, `position_z`=59.8584, `orientation`=5.95356 WHERE `guid`=45873; -- Slavering Ghoul
UPDATE `creature` SET `position_x`=1289.27, `position_y`=-412.676, `position_z`=-91.9711, `orientation`=1.37881 WHERE `guid`=53499; -- Anvilrage Reservist
UPDATE `creature` SET `position_x`=-467.178, `position_y`=26.3112, `position_z`=-66.9833, `orientation`=1.5708 WHERE `guid`=39845; -- Loro
UPDATE `creature` SET `position_x`=-2791.94, `position_y`=-3020.85, `position_z`=37.7251, `orientation`=3.49912 WHERE `guid`=39303; -- Theramore Infiltrator
UPDATE `creature` SET `position_x`=-382.673, `position_y`=-2812.39, `position_z`=93.304, `orientation`=4.6792 WHERE `guid`=19319; -- Greater Plainstrider
UPDATE `creature` SET `position_x`=-811.913, `position_y`=-4940.15, `position_z`=20.6154, `orientation`=3.45575 WHERE `guid`=6490; -- Ula'elek
UPDATE `creature` SET `position_x`=-848.051, `position_y`=-4909.01, `position_z`=21.3161, `orientation`=5.64625 WHERE `guid`=3368; -- Bom'bay
UPDATE `creature` SET `position_x`=-825.636, `position_y`=-4920.76, `position_z`=19.7409, `orientation`=3.6579 WHERE `guid`=6462; -- Master Gadrin
UPDATE `creature` SET `position_x`=-498.713, `position_y`=-4456.25, `position_z`=51.1286, `orientation`=3.17724 WHERE `guid`=7376; -- Lazy Peon
UPDATE `creature` SET `position_x`=1075.63, `position_y`=-895.878, `position_z`=-156.615, `orientation`=0.466199 WHERE `guid`=56574; -- Flame Imp
UPDATE `creature` SET `position_x`=2414.29, `position_y`=-3563.18, `position_z`=99.2826, `orientation`=0.392933 WHERE `guid`=33060; -- Horde Shaman
UPDATE `creature` SET `position_x`=267.49, `position_y`=-8.1493, `position_z`=85.2283, `orientation`=3.8115 WHERE `guid`=48374; -- Unstable Corpse
UPDATE `creature` SET `position_x`=-426.677, `position_y`=-85.7376, `position_z`=-88.1407, `orientation`=3.21141 WHERE `guid`=39737; -- Jammal'an the Prophet
UPDATE `creature` SET `position_x`=-422.358, `position_y`=-90.3028, `position_z`=-88.1407, `orientation`=2.67035 WHERE `guid`=39827; -- Ogom the Wretched
UPDATE `creature` SET `position_x`=161.303, `position_y`=-1812.76, `position_z`=92.4406, `orientation`=4.92267 WHERE `guid`=20457; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=31.25, `position_y`=-1792.19, `position_z`=91.7936, `orientation`=3.78886 WHERE `guid`=20456; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=21.0097, `position_y`=-1781.87, `position_z`=92.1568, `orientation`=1.43792 WHERE `guid`=20510; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=1837.73, `position_y`=1314.73, `position_z`=19.0147, `orientation`=5.44187 WHERE `guid`=39888; -- Haunting Phantasm
UPDATE `creature` SET `position_x`=-8895.63, `position_y`=575.369, `position_z`=92.8007, `orientation`=5.41052 WHERE `guid`=79674; -- Stormwind City Guard
UPDATE `creature` SET `position_x`=-6226.67, `position_y`=320.055, `position_z`=383.143, `orientation`=1.55366 WHERE `guid`=349; -- Adlin Pridedrift
UPDATE `creature` SET `position_x`=-6225.61, `position_y`=133.18, `position_z`=431.678, `orientation`=2.67035 WHERE `guid`=328; -- Coldridge Mountaineer
UPDATE `creature` SET `position_x`=-6169.4, `position_y`=134.66, `position_z`=423.029, `orientation`=3.12757 WHERE `guid`=323; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6138.61, `position_y`=123.171, `position_z`=420.97, `orientation`=2.81975 WHERE `guid`=321; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6153.21, `position_y`=48.017, `position_z`=416.732, `orientation`=0 WHERE `guid`=1553; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-6123.15, `position_y`=78.1876, `position_z`=417.071, `orientation`=0.316352 WHERE `guid`=319; -- Rockjaw Raider
UPDATE `creature` SET `position_x`=-5909.4, `position_y`=-68.1109, `position_z`=387.972, `orientation`=4.08634 WHERE `guid`=291; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-6007.46, `position_y`=-202.158, `position_z`=407.081, `orientation`=2.4379 WHERE `guid`=267; -- Shorty
UPDATE `creature` SET `position_x`=-9815.88, `position_y`=152.206, `position_z`=26.1834, `orientation`=2.38709 WHERE `guid`=80614; -- Kobold Miner
UPDATE `creature` SET `position_x`=-6016.42, `position_y`=-332.924, `position_z`=427.592, `orientation`=3.88098 WHERE `guid`=259; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-5766.24, `position_y`=-538.648, `position_z`=417.304, `orientation`=2.42137 WHERE `guid`=229; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-5610.72, `position_y`=-490.063, `position_z`=397.684, `orientation`=2.19912 WHERE `guid`=200; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-5588.39, `position_y`=-464.152, `position_z`=401.81, `orientation`=4.0918 WHERE `guid`=212; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-5565.5, `position_y`=-471.144, `position_z`=399.698, `orientation`=4.66003 WHERE `guid`=205; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-5551.04, `position_y`=-462.461, `position_z`=407.486, `orientation`=4.4855 WHERE `guid`=211; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=1312.49, `position_y`=-1590.76, `position_z`=61.8588, `orientation`=2.07803 WHERE `guid`=52512; -- Skeletal Warlord
UPDATE `creature` SET `position_x`=-5373.57, `position_y`=-544.752, `position_z`=400.573, `orientation`=0.471239 WHERE `guid`=152; -- Ironforge Mountaineer
UPDATE `creature` SET `position_x`=-4118.81, `position_y`=-2311.43, `position_z`=128.585, `orientation`=2.75673 WHERE `guid`=13641; -- Bael'dun Soldier
UPDATE `creature` SET `position_x`=-284.792, `position_y`=-3447.45, `position_z`=188.426, `orientation`=1.41721 WHERE `guid`=93428; -- Qiaga the Keeper
UPDATE `creature` SET `position_x`=-814.062, `position_y`=-1970.83, `position_z`=34.1597, `orientation`=1.57646 WHERE `guid`=12017; -- Syndicate Pathstalker
UPDATE `creature` SET `position_x`=-780.425, `position_y`=-2097.49, `position_z`=34.721, `orientation`=0.137905 WHERE `guid`=11922; -- Syndicate Highwayman
UPDATE `creature` SET `position_x`=10197.8, `position_y`=698.881, `position_z`=1361.25, `orientation`=3.38594 WHERE `guid`=46497; -- Shadowglen Sentinel
UPDATE `creature` SET `position_x`=-9472.87, `position_y`=-219.262, `position_z`=56.3736, `orientation`=2.05899 WHERE `guid`=79635; -- Murloc
UPDATE `creature` SET `position_x`=-9483.19, `position_y`=-424.601, `position_z`=59.7019, `orientation`=5.27762 WHERE `guid`=79621; -- Murloc
UPDATE `creature` SET `position_x`=26.1324, `position_y`=-1734.16, `position_z`=108.818, `orientation`=0.345672 WHERE `guid`=20511; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=-9117.18, `position_y`=-587.363, `position_z`=57.4701, `orientation`=5.90916 WHERE `guid`=80980; -- Kobold Miner
UPDATE `creature` SET `position_x`=-9116.14, `position_y`=-569.412, `position_z`=59.1034, `orientation`=4.41275 WHERE `guid`=80985; -- Kobold Miner
UPDATE `creature` SET `position_x`=-9048.4, `position_y`=-616.413, `position_z`=52.9649, `orientation`=1.85734 WHERE `guid`=80987; -- Mine Spider
UPDATE `creature` SET `position_x`=-9038.72, `position_y`=-608.9, `position_z`=53.1526, `orientation`=5.27785 WHERE `guid`=80991; -- Mine Spider
UPDATE `creature` SET `position_x`=-9030, `position_y`=-613.659, `position_z`=56.5649, `orientation`=0.52706 WHERE `guid`=80993; -- Mine Spider
UPDATE `creature` SET `position_x`=-9024.75, `position_y`=-564.323, `position_z`=54.9264, `orientation`=1.58731 WHERE `guid`=80995; -- Mine Spider
UPDATE `creature` SET `position_x`=-9025.26, `position_y`=-601.833, `position_z`=56.1236, `orientation`=2.68703 WHERE `guid`=80994; -- Mine Spider
UPDATE `creature` SET `position_x`=887.81, `position_y`=-180.491, `position_z`=-43.8419, `orientation`=2.02856 WHERE `guid`=91013; -- Grim Patron
UPDATE `creature` SET `position_x`=178.454, `position_y`=-1530.43, `position_z`=91.7917, `orientation`=0.686192 WHERE `guid`=14214; -- Savannah Prowler
UPDATE `creature` SET `position_x`=4441.46, `position_y`=-5544.84, `position_z`=107.951, `orientation`=3.53799 WHERE `guid`=35234; -- Timbermaw Den Watcher
UPDATE `creature` SET `position_x`=4689.98, `position_y`=-5391.28, `position_z`=112.363, `orientation`=5.18097 WHERE `guid`=35294; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=4683.47, `position_y`=-5380.2, `position_z`=111.958, `orientation`=5.11995 WHERE `guid`=35274; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=-9615.54, `position_y`=-1038.75, `position_z`=39.8703, `orientation`=3.14159 WHERE `guid`=80881; -- Stormwind Guard
UPDATE `creature` SET `position_x`=582.294, `position_y`=-1518.56, `position_z`=92.1291, `orientation`=4.65765 WHERE `guid`=20610; -- Witchwing Harpy
UPDATE `creature` SET `position_x`=800.604, `position_y`=-1331.68, `position_z`=91.868, `orientation`=2.92758 WHERE `guid`=20654; -- Witchwing Slayer
UPDATE `creature` SET `position_x`=803.39, `position_y`=-1315.16, `position_z`=91.9755, `orientation`=0.450548 WHERE `guid`=20691; -- Witchwing Windcaller
UPDATE `creature` SET `position_x`=1380.95, `position_y`=-792.844, `position_z`=-92.7213, `orientation`=5.53388 WHERE `guid`=90601; -- Doomforge Dragoon
UPDATE `creature` SET `position_x`=-758.539, `position_y`=-4324.67, `position_z`=45.5966, `orientation`=3.94923 WHERE `guid`=6525; -- Lazy Peon
UPDATE `creature` SET `position_x`=-1365.75, `position_y`=-3668.07, `position_z`=93.2412, `orientation`=4.83784 WHERE `guid`=13855; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1358.07, `position_y`=-3678.09, `position_z`=92.9438, `orientation`=0.152031 WHERE `guid`=13840; -- Southsea Cutthroat
UPDATE `creature` SET `position_x`=-1465.57, `position_y`=-3653.9, `position_z`=92.164, `orientation`=4.39082 WHERE `guid`=13832; -- Southsea Cutthroat
UPDATE `creature` SET `position_x`=-1468.04, `position_y`=-3660.61, `position_z`=92.2071, `orientation`=2.35668 WHERE `guid`=13856; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1498.71, `position_y`=-3680.65, `position_z`=91.8796, `orientation`=2.49786 WHERE `guid`=13857; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1492.75, `position_y`=-3657.86, `position_z`=92.1497, `orientation`=2.37213 WHERE `guid`=13839; -- Southsea Cutthroat
UPDATE `creature` SET `position_x`=-1504.17, `position_y`=-3684.38, `position_z`=91.81, `orientation`=3.27837 WHERE `guid`=13837; -- Southsea Cutthroat
UPDATE `creature` SET `position_x`=-1463.56, `position_y`=-3637.29, `position_z`=92.039, `orientation`=2.32645 WHERE `guid`=13852; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1628.65, `position_y`=-3618.75, `position_z`=91.7791, `orientation`=3.34018 WHERE `guid`=13849; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1694.99, `position_y`=-3604.42, `position_z`=92.0259, `orientation`=2.12042 WHERE `guid`=13851; -- Southsea Privateer
UPDATE `creature` SET `position_x`=-1689.1, `position_y`=-3608.01, `position_z`=92.6077, `orientation`=4.55172 WHERE `guid`=13833; -- Southsea Cutthroat
UPDATE `creature` SET `position_x`=-2252.53, `position_y`=-2373.72, `position_z`=91.75, `orientation`=0.925025 WHERE `guid`=90921; -- Doan Karhan
UPDATE `creature` SET `position_x`=1217.81, `position_y`=370.138, `position_z`=32.2814, `orientation`=3.735 WHERE `guid`=17732; -- Vile Fin Lakestalker
UPDATE `creature` SET `position_x`=-270.925, `position_y`=-950.258, `position_z`=14.2793, `orientation`=5.48033 WHERE `guid`=40205; -- Seereth Stonebreak
UPDATE `creature` SET `position_x`=-162.766, `position_y`=-1516.05, `position_z`=91.7917, `orientation`=6.13355 WHERE `guid`=14252; -- Savannah Prowler
UPDATE `creature` SET `position_x`=1179.06, `position_y`=393.7, `position_z`=34.9096, `orientation`=2.29822 WHERE `guid`=17796; -- Vile Fin Oracle
UPDATE `creature` SET `position_x`=-3629.61, `position_y`=-4362.7, `position_z`=6.55041, `orientation`=2.23402 WHERE `guid`=30631; -- Theramore Guard
UPDATE `creature` SET `position_x`=1017.17, `position_y`=713.628, `position_z`=74.0034, `orientation`=5.28267 WHERE `guid`=18272; -- Raging Rot Hide
UPDATE `creature` SET `position_x`=2633.37, `position_y`=-443.655, `position_z`=107.227, `orientation`=4.04916 WHERE `guid`=33408; -- Astranaar Sentinel
UPDATE `creature` SET `position_x`=2637.42, `position_y`=-451.803, `position_z`=107.003, `orientation`=2.9147 WHERE `guid`=33407; -- Astranaar Sentinel
UPDATE `creature` SET `position_x`=-9804.19, `position_y`=685.987, `position_z`=31.9638, `orientation`=4.18879 WHERE `guid`=80475; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9815.01, `position_y`=690.105, `position_z`=31.8605, `orientation`=4.31096 WHERE `guid`=80489; -- Stormwind Guard
UPDATE `creature` SET `position_x`=2814.51, `position_y`=-272.127, `position_z`=107.156, `orientation`=1.71042 WHERE `guid`=33409; -- Astranaar Sentinel
UPDATE `creature` SET `position_x`=-7027.48, `position_y`=-1714.02, `position_z`=241.764, `orientation`=0.542138 WHERE `guid`=6806; -- Dark Iron Watchman
UPDATE `creature` SET `position_x`=-7025.31, `position_y`=-1721.92, `position_z`=241.75, `orientation`=3.78356 WHERE `guid`=6799; -- Dark Iron Geologist
UPDATE `creature` SET `position_x`=-963.536, `position_y`=-3560.84, `position_z`=58.7891, `orientation`=1.61711 WHERE `guid`=11207; -- Tunkk
UPDATE `creature` SET `position_x`=-918.178, `position_y`=-3495.46, `position_z`=70.4501, `orientation`=3.05141 WHERE `guid`=11206; -- Urda
UPDATE `creature` SET `position_x`=-840.657, `position_y`=-3513.86, `position_z`=73.3906, `orientation`=4.10152 WHERE `guid`=11258; -- Defiler Elite
UPDATE `creature` SET `position_x`=536.336, `position_y`=-3020.82, `position_z`=91.7917, `orientation`=2.14626 WHERE `guid`=14183; -- Savannah Prowler
UPDATE `creature` SET `position_x`=5138.35, `position_y`=-513.015, `position_z`=295.909, `orientation`=3.97592 WHERE `guid`=40638; -- Vile Ooze
UPDATE `creature` SET `position_x`=3512.14, `position_y`=-3071.1, `position_z`=135.08, `orientation`=0.785398 WHERE `guid`=52141; -- Crimson Monk
UPDATE `creature` SET `position_x`=-9760.11, `position_y`=88.2476, `position_z`=12.3849, `orientation`=3.44472 WHERE `guid`=80649; -- Kobold Miner
UPDATE `creature` SET `position_x`=5171.36, `position_y`=-350.738, `position_z`=341.145, `orientation`=6.0912 WHERE `guid`=39084; -- Bloodvenom Post Brave
UPDATE `creature` SET `position_x`=-2589.71, `position_y`=-3999.46, `position_z`=5.38413, `orientation`=2.97821 WHERE `guid`=31713; -- Mirefin Coastrunner
UPDATE `creature` SET `position_x`=1769.79, `position_y`=-2067.71, `position_z`=102.745, `orientation`=2.35573 WHERE `guid`=32581; -- Silverwing Sentinel
UPDATE `creature` SET `position_x`=1514.34, `position_y`=-2143.97, `position_z`=88.6304, `orientation`=1.01509 WHERE `guid`=32569; -- Shadethicket Oracle
UPDATE `creature` SET `position_x`=579.205, `position_y`=-2420.54, `position_z`=92.5695, `orientation`=3.42465 WHERE `guid`=14091; -- Savannah Huntress
UPDATE `creature` SET `position_x`=543.461, `position_y`=-2456.37, `position_z`=91.7917, `orientation`=1.60733 WHERE `guid`=18672; -- Savannah Highmane
UPDATE `creature` SET `position_x`=210.786, `position_y`=-2562.32, `position_z`=91.7917, `orientation`=4.52208 WHERE `guid`=14090; -- Savannah Huntress
UPDATE `creature` SET `position_x`=-10488.2, `position_y`=1212.17, `position_z`=67.1583, `orientation`=4.52324 WHERE `guid`=90344; -- Defias Smuggler
UPDATE `creature` SET `position_x`=-8888.17, `position_y`=566.203, `position_z`=92.6715, `orientation`=2.23402 WHERE `guid`=79669; -- Stormwind City Guard
UPDATE `creature` SET `position_x`=-3005.83, `position_y`=-3242.95, `position_z`=34.8865, `orientation`=1.06293 WHERE `guid`=31262; -- Theramore Sentry
UPDATE `creature` SET `position_x`=-2997.97, `position_y`=-3250.16, `position_z`=34.9326, `orientation`=1.47513 WHERE `guid`=31273; -- Theramore Sentry
UPDATE `creature` SET `position_x`=-8556.37, `position_y`=835.86, `position_z`=106.602, `orientation`=5.32325 WHERE `guid`=44022; -- Brother Sarno
UPDATE `creature` SET `position_x`=-8573.13, `position_y`=861.073, `position_z`=106.602, `orientation`=0.715585 WHERE `guid`=37585; -- Arthur the Faithful
UPDATE `creature` SET `position_x`=-8545.84, `position_y`=845.796, `position_z`=106.601, `orientation`=4.72984 WHERE `guid`=39536; -- Duthorian Rall
UPDATE `creature` SET `position_x`=-8513.31, `position_y`=802.071, `position_z`=106.602, `orientation`=2.26893 WHERE `guid`=15216; -- Shaina Fuller
UPDATE `creature` SET `position_x`=-8564.39, `position_y`=880.634, `position_z`=106.602, `orientation`=3.82227 WHERE `guid`=37586; -- Katherine the Pure
UPDATE `creature` SET `position_x`=-8577.5, `position_y`=881.466, `position_z`=106.602, `orientation`=5.42797 WHERE `guid`=5000; -- Lord Grayson Shadowbreaker
UPDATE `creature` SET `position_x`=-8634.22, `position_y`=886.742, `position_z`=103.266, `orientation`=5.46288 WHERE `guid`=7626; -- Gregory Ardus
UPDATE `creature` SET `position_x`=-8522.61, `position_y`=848.783, `position_z`=106.702, `orientation`=3.71755 WHERE `guid`=7566; -- Archbishop Benedictus
UPDATE `creature` SET `position_x`=-8528.55, `position_y`=855.31, `position_z`=106.702, `orientation`=4.01426 WHERE `guid`=300992; -- Bishop Farthing
UPDATE `creature` SET `position_x`=1319.86, `position_y`=-1298.73, `position_z`=62.1918, `orientation`=0.453237 WHERE `guid`=46894; -- Skeletal Acolyte
UPDATE `creature` SET `position_x`=965.135, `position_y`=-1417.87, `position_z`=66.5527, `orientation`=4.18879 WHERE `guid`=45242; -- Alchemist Arbington
UPDATE `creature` SET `position_x`=615.121, `position_y`=-3031.12, `position_z`=91.7917, `orientation`=1.50723 WHERE `guid`=14151; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-6454.85, `position_y`=-1197.17, `position_z`=180.928, `orientation`=1.0472 WHERE `guid`=5811; -- Enslaved Archaeologist
UPDATE `creature` SET `position_x`=167.109, `position_y`=-267.366, `position_z`=18.6246, `orientation`=2.22933 WHERE `guid`=40078; -- Scarlet Beastmaster
UPDATE `creature` SET `position_x`=591.607, `position_y`=-2923.92, `position_z`=92.3631, `orientation`=2.64532 WHERE `guid`=14168; -- Savannah Prowler
UPDATE `creature` SET `position_x`=509.863, `position_y`=-3011.21, `position_z`=91.7917, `orientation`=5.51085 WHERE `guid`=14211; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-1014.85, `position_y`=-1119.04, `position_z`=44.4928, `orientation`=4.51853 WHERE `guid`=26351; -- Bristleback Interloper
UPDATE `creature` SET `position_x`=-1001.86, `position_y`=-1087.31, `position_z`=44.4757, `orientation`=3.50141 WHERE `guid`=26260; -- Bristleback Interloper
UPDATE `creature` SET `position_x`=-6882.26, `position_y`=-1248.25, `position_z`=178.947, `orientation`=5.32325 WHERE `guid`=5775; -- Slave Worker
UPDATE `creature` SET `position_x`=1606.86, `position_y`=852.071, `position_z`=146.228, `orientation`=2.23274 WHERE `guid`=29973; -- Pridewing Consort
UPDATE `creature` SET `position_x`=-569.179, `position_y`=-1496.84, `position_z`=52.6321, `orientation`=0.142562 WHERE `guid`=16302; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=-575, `position_y`=-1522.92, `position_z`=52.8159, `orientation`=5.83739 WHERE `guid`=16303; -- Syndicate Shadow Mage
UPDATE `creature` SET `position_x`=-601.302, `position_y`=-1520.55, `position_z`=53.9523, `orientation`=0.93078 WHERE `guid`=16305; -- Syndicate Shadow Mage
UPDATE `creature` SET `position_x`=-1047.61, `position_y`=-2817.11, `position_z`=42.2394, `orientation`=1.37859 WHERE `guid`=12058; -- Marcel Dabyrie
UPDATE `creature` SET `position_x`=2652.92, `position_y`=1433.99, `position_z`=226.351, `orientation`=3.94444 WHERE `guid`=29585; -- Keeper Albagorm
UPDATE `creature` SET `position_x`=-10359.1, `position_y`=-3368.92, `position_z`=22.4278, `orientation`=3.64433 WHERE `guid`=34148; -- Stonard Wayfinder
UPDATE `creature` SET `position_x`=-10384, `position_y`=-3374.19, `position_z`=22.9553, `orientation`=3.56376 WHERE `guid`=34153; -- Stonard Wayfinder
UPDATE `creature` SET `position_x`=-496.395, `position_y`=-1859, `position_z`=91.7916, `orientation`=4.08325 WHERE `guid`=14220; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-1777.89, `position_y`=-3131.81, `position_z`=40.7263, `orientation`=1.77671 WHERE `guid`=14724; -- Witherbark Axe Thrower
UPDATE `creature` SET `position_x`=-1865.19, `position_y`=-3065.53, `position_z`=57.9381, `orientation`=5.77222 WHERE `guid`=14728; -- Witherbark Witch Doctor
UPDATE `creature` SET `position_x`=-580.499, `position_y`=-3668.59, `position_z`=92.2299, `orientation`=4.21651 WHERE `guid`=14129; -- Savannah Matriarch
UPDATE `creature` SET `position_x`=-643.099, `position_y`=-3645.83, `position_z`=94.6301, `orientation`=2.84422 WHERE `guid`=14132; -- Savannah Matriarch
UPDATE `creature` SET `position_x`=-856.781, `position_y`=199.696, `position_z`=17.5879, `orientation`=0.76313 WHERE `guid`=15932; -- Hillsbrad Sentry
UPDATE `creature` SET `position_x`=-4236.46, `position_y`=-2383.33, `position_z`=204.475, `orientation`=5.81879 WHERE `guid`=11084; -- Dragonmaw Grunt
UPDATE `creature` SET `position_x`=-4356.15, `position_y`=-2422.42, `position_z`=228.378, `orientation`=3.88917 WHERE `guid`=11079; -- Dragonmaw Grunt
UPDATE `creature` SET `position_x`=-6632.31, `position_y`=-2726.94, `position_z`=243.537, `orientation`=3.87894 WHERE `guid`=7249; -- Servo
UPDATE `creature` SET `position_x`=-6862.3, `position_y`=-1227.78, `position_z`=176.459, `orientation`=6.22263 WHERE `guid`=6841; -- Dark Iron Taskmaster
UPDATE `creature` SET `position_x`=639.228, `position_y`=-1048.57, `position_z`=-199.736, `orientation`=0.349311 WHERE `guid`=56785; -- Firelord
UPDATE `creature` SET `position_x`=-1930.03, `position_y`=-715.275, `position_z`=3.65329, `orientation`=0.988659 WHERE `guid`=26357; -- Venture Co. Taskmaster
UPDATE `creature` SET `position_x`=-6689.95, `position_y`=-2161.96, `position_z`=244.196, `orientation`=3.9968 WHERE `guid`=6886; -- Thunderheart
UPDATE `creature` SET `position_x`=1362.15, `position_y`=-377.956, `position_z`=-92.0441, `orientation`=0.925025 WHERE `guid`=53380; -- Anvilrage Reservist
UPDATE `creature` SET `position_x`=1405.14, `position_y`=-375.315, `position_z`=-92.0252, `orientation`=3.28338 WHERE `guid`=53412; -- Anvilrage Reservist
UPDATE `creature` SET `position_x`=-1878.12, `position_y`=1116.9, `position_z`=92.4664, `orientation`=0.938042 WHERE `guid`=27124; -- Magram Mauler
UPDATE `creature` SET `position_x`=-1817.65, `position_y`=1183.5, `position_z`=88.4781, `orientation`=3.22262 WHERE `guid`=27101; -- Magram Windchaser
UPDATE `creature` SET `position_x`=-1852.94, `position_y`=1959.51, `position_z`=64.8033, `orientation`=2.8717 WHERE `guid`=27902; -- Nether Maiden
UPDATE `creature` SET `position_x`=602.61, `position_y`=-1097.12, `position_z`=-199.871, `orientation`=2.86904 WHERE `guid`=91260; -- Lava Elemental
UPDATE `creature` SET `position_x`=-8469.34, `position_y`=582.931, `position_z`=96.052, `orientation`=5.37561 WHERE `guid`=8733; -- Morgg Stormshot
UPDATE `creature` SET `position_x`=-8419.3, `position_y`=646.603, `position_z`=97.5324, `orientation`=0.698132 WHERE `guid`=37603; -- Thulman Flintcrag
UPDATE `creature` SET `position_x`=-8424.49, `position_y`=616.944, `position_z`=95.5429, `orientation`=2.23402 WHERE `guid`=37604; -- Therum Deepforge
UPDATE `creature` SET `position_x`=-8433.99, `position_y`=693.397, `position_z`=103.447, `orientation`=0.698132 WHERE `guid`=37606; -- Gelman Stonehand
UPDATE `creature` SET `position_x`=-8430.18, `position_y`=695.138, `position_z`=96.4011, `orientation`=5.06145 WHERE `guid`=37607; -- Brooke Stonebraid
UPDATE `creature` SET `position_x`=-8424.68, `position_y`=608.84, `position_z`=95.3021, `orientation`=3.22886 WHERE `guid`=5169; -- Dane Lindgren
UPDATE `creature` SET `position_x`=-8427.13, `position_y`=600.092, `position_z`=94.7483, `orientation`=3.28122 WHERE `guid`=35250; -- Furen Longbeard
UPDATE `creature` SET `position_x`=-8387.14, `position_y`=685.202, `position_z`=95.356, `orientation`=2.28638 WHERE `guid`=8169; -- Grimand Elmore
UPDATE `creature` SET `position_x`=-8387.6, `position_y`=692.506, `position_z`=95.3568, `orientation`=3.92699 WHERE `guid`=37602; -- Kathrum Axehand
UPDATE `creature` SET `position_x`=-8342.25, `position_y`=638.323, `position_z`=95.4204, `orientation`=3.7001 WHERE `guid`=37612; -- Billibub Cogspinner
UPDATE `creature` SET `position_x`=-443.83, `position_y`=1747.83, `position_z`=131.533, `orientation`=1.55902 WHERE `guid`=27627; -- Burning Blade Augur
UPDATE `creature` SET `position_x`=1178.13, `position_y`=933.951, `position_z`=33.4422, `orientation`=5.31644 WHERE `guid`=18212; -- Vile Fin Shredder
UPDATE `creature` SET `position_x`=-88.3192, `position_y`=-463.206, `position_z`=-18.8517, `orientation`=2.28638 WHERE `guid`=44327; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=-5453.31, `position_y`=1220.63, `position_z`=32.9785, `orientation`=0.904606 WHERE `guid`=50317; -- Gordunni Warlord
UPDATE `creature` SET `position_x`=-7086.68, `position_y`=-3760.42, `position_z`=8.98303, `orientation`=0.139626 WHERE `guid`=23585; -- Gadgetzan Bruiser
UPDATE `creature` SET `position_x`=436.981, `position_y`=-4211.97, `position_z`=24.6614, `orientation`=5.907 WHERE `guid`=7351; -- Razormane Battleguard
UPDATE `creature` SET `position_x`=-2059.52, `position_y`=-1975.37, `position_z`=91.7917, `orientation`=3.05639 WHERE `guid`=20124; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-2035.93, `position_y`=-1976.12, `position_z`=91.7917, `orientation`=0.470821 WHERE `guid`=20148; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-683.397, `position_y`=-2338.63, `position_z`=17.167, `orientation`=2.70073 WHERE `guid`=13685; -- Deviate Slayer
UPDATE `creature` SET `position_x`=-14134.8, `position_y`=472.693, `position_z`=2.29207, `orientation`=0.072315 WHERE `guid`=2584; -- Bloodsail Mage
UPDATE `creature` SET `position_x`=1046.85, `position_y`=1342.66, `position_z`=29.1465, `orientation`=2.71598 WHERE `guid`=39992; -- Scarlet Myrmidon
UPDATE `creature` SET `position_x`=-11590.8, `position_y`=-619.667, `position_z`=28.5431, `orientation`=3.47321 WHERE `guid`=1586; -- Kurzen Medicine Man
UPDATE `creature` SET `position_x`=-11500.5, `position_y`=-730.693, `position_z`=31.841, `orientation`=1.68446 WHERE `guid`=1631; -- Kurzen Commando
UPDATE `creature` SET `position_x`=-10950.3, `position_y`=-1151.19, `position_z`=39.6178, `orientation`=5.79573 WHERE `guid`=4892; -- Nightbane Vile Fang
UPDATE `creature` SET `position_x`=-11076.1, `position_y`=-1141.2, `position_z`=42.9304, `orientation`=5.63425 WHERE `guid`=6113; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=-11102.5, `position_y`=-1151.13, `position_z`=41.8456, `orientation`=1.0821 WHERE `guid`=5018; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=-11106.7, `position_y`=-1161.95, `position_z`=42.2581, `orientation`=5.93412 WHERE `guid`=6093; -- Nightbane Tainted One
UPDATE `creature` SET `position_x`=828.82, `position_y`=-639.731, `position_z`=-203.433, `orientation`=5.0823 WHERE `guid`=91281; -- Lava Annihilator
UPDATE `creature` SET `position_x`=-9170.68, `position_y`=-2115.43, `position_z`=88.9493, `orientation`=1.98739 WHERE `guid`=6259; -- Gerald Crawley
UPDATE `creature` SET `position_x`=-9173.33, `position_y`=-2088.29, `position_z`=89.0329, `orientation`=3.80482 WHERE `guid`=6263; -- Henry Chapal
UPDATE `creature` SET `position_x`=-9239.12, `position_y`=-2035.06, `position_z`=78.1647, `orientation`=4.1105 WHERE `guid`=6152; -- Hannah
UPDATE `creature` SET `position_x`=-9704.43, `position_y`=-648.048, `position_z`=47.3044, `orientation`=0.813016 WHERE `guid`=80824; -- Rockhide Boar
UPDATE `creature` SET `position_x`=-9486.48, `position_y`=-206.128, `position_z`=57.8829, `orientation`=4.29641 WHERE `guid`=81083; -- Murloc
UPDATE `creature` SET `position_x`=-9849.96, `position_y`=1036.8, `position_z`=34.0139, `orientation`=4.68137 WHERE `guid`=90224; -- Defias Footpad
UPDATE `creature` SET `position_x`=-11717.3, `position_y`=224.042, `position_z`=40.4604, `orientation`=0 WHERE `guid`=1223; -- Bloodscalp Scavenger
UPDATE `creature` SET `position_x`=-37.4355, `position_y`=-453.615, `position_z`=16.5437, `orientation`=0.593412 WHERE `guid`=43532; -- Smolderthorn Shadow Hunter
UPDATE `creature` SET `position_x`=-10966.1, `position_y`=-946.828, `position_z`=71.1859, `orientation`=4.69256 WHERE `guid`=4301; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10961.1, `position_y`=-948.675, `position_z`=71.1881, `orientation`=0.135909 WHERE `guid`=4296; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-7075.2, `position_y`=-1576.09, `position_z`=248.359, `orientation`=4.05015 WHERE `guid`=5651; -- Searing Lava Spider
UPDATE `creature` SET `position_x`=-6463.36, `position_y`=-1248.84, `position_z`=180.411, `orientation`=2.62006 WHERE `guid`=5806; -- Enslaved Archaeologist
UPDATE `creature` SET `position_x`=-5217.74, `position_y`=-3112.37, `position_z`=301.178, `orientation`=3.09857 WHERE `guid`=8220; -- Warg Deepwater
UPDATE `creature` SET `position_x`=-4804.14, `position_y`=-2971.7, `position_z`=321.415, `orientation`=3.0072 WHERE `guid`=9297; -- Tunnel Rat Kobold
UPDATE `creature` SET `position_x`=-3383.85, `position_y`=-2545.83, `position_z`=20.5465, `orientation`=4.47877 WHERE `guid`=10752; -- Dragonmaw Raider
UPDATE `creature` SET `position_x`=-3086.18, `position_y`=-1995.39, `position_z`=9.03481, `orientation`=0.438708 WHERE `guid`=10703; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3755.34, `position_y`=-849.345, `position_z`=10.0241, `orientation`=5.61441 WHERE `guid`=9464; -- Edwina Monzor
UPDATE `creature` SET `position_x`=-4235.61, `position_y`=-2350.4, `position_z`=204.332, `orientation`=1.59004 WHERE `guid`=11088; -- Dragonmaw Grunt
UPDATE `creature` SET `position_x`=-4249.19, `position_y`=-2373, `position_z`=204.565, `orientation`=1.6844 WHERE `guid`=11087; -- Dragonmaw Scout
UPDATE `creature` SET `position_x`=-4243.95, `position_y`=-2343.69, `position_z`=204.376, `orientation`=5.97079 WHERE `guid`=11118; -- Dragonmaw Grunt
UPDATE `creature` SET `position_x`=-6410.6, `position_y`=-3435.38, `position_z`=248.692, `orientation`=1.27715 WHERE `guid`=7163; -- Shadowforge Tunneler
UPDATE `creature` SET `position_x`=-6397.88, `position_y`=-3415.28, `position_z`=241.727, `orientation`=6.20184 WHERE `guid`=7164; -- Shadowforge Tunneler
UPDATE `creature` SET `position_x`=-6460.54, `position_y`=-3393.8, `position_z`=241.682, `orientation`=3.79946 WHERE `guid`=7190; -- Shadowforge Darkweaver
UPDATE `creature` SET `position_x`=-3850.27, `position_y`=-730.695, `position_z`=8.5083, `orientation`=1.93051 WHERE `guid`=9533; -- Maiden's Virtue Crewman
UPDATE `creature` SET `position_x`=-3869.33, `position_y`=-598.3, `position_z`=6.1641, `orientation`=3.6237 WHERE `guid`=9571; -- Maiden's Virtue Crewman
UPDATE `creature` SET `position_x`=716.405, `position_y`=947.74, `position_z`=34.7559, `orientation`=2.63371 WHERE `guid`=18259; -- Fenwick Thatros
UPDATE `creature` SET `position_x`=-2493.77, `position_y`=-2454.27, `position_z`=79.3046, `orientation`=5.95379 WHERE `guid`=9955; -- Comar Villard
UPDATE `creature` SET `position_x`=-2650.68, `position_y`=-2453.28, `position_z`=80.1836, `orientation`=1.58246 WHERE `guid`=9812; -- Rhag Garmason
UPDATE `creature` SET `position_x`=-8865.55, `position_y`=822.286, `position_z`=98.4002, `orientation`=0.575959 WHERE `guid`=53686; -- Adair Gilroy
UPDATE `creature` SET `position_x`=-8855.71, `position_y`=822.812, `position_z`=98.4, `orientation`=6.21337 WHERE `guid`=26836; -- Mazen Mac'Nadir
UPDATE `creature` SET `position_x`=-8850.79, `position_y`=829.8, `position_z`=104.78, `orientation`=2.49582 WHERE `guid`=90459; -- Acolyte Dellis
UPDATE `creature` SET `position_x`=-8958.82, `position_y`=816.416, `position_z`=109.53, `orientation`=3.78736 WHERE `guid`=90469; -- Sellandus
UPDATE `creature` SET `position_x`=-8963.19, `position_y`=822.125, `position_z`=109.446, `orientation`=3.7001 WHERE `guid`=52922; -- Wynne Larson
UPDATE `creature` SET `position_x`=-9008.98, `position_y`=845.35, `position_z`=105.921, `orientation`=0 WHERE `guid`=90442; -- Archmage Malin
UPDATE `creature` SET `position_x`=-8989.7, `position_y`=861.881, `position_z`=29.704, `orientation`=4.72984 WHERE `guid`=90462; -- Jennea Cannon
UPDATE `creature` SET `position_x`=-9012.53, `position_y`=867.142, `position_z`=29.704, `orientation`=3.735 WHERE `guid`=26835; -- Maginor Dumas
UPDATE `creature` SET `position_x`=-9010.78, `position_y`=876.575, `position_z`=148.702, `orientation`=4.86947 WHERE `guid`=90470; -- High Sorcerer Andromath
UPDATE `creature` SET `position_x`=-9006.11, `position_y`=885.375, `position_z`=29.704, `orientation`=0.802851 WHERE `guid`=90463; -- Elsharin
UPDATE `creature` SET `position_x`=-8951, `position_y`=898.653, `position_z`=108.287, `orientation`=5.28835 WHERE `guid`=52921; -- Owen Vaughn
UPDATE `creature` SET `position_x`=-9085.86, `position_y`=829.043, `position_z`=108.604, `orientation`=0.453786 WHERE `guid`=52924; -- Joachim Brenlow
UPDATE `creature` SET `position_x`=-8886.89, `position_y`=985.503, `position_z`=124.541, `orientation`=4.67748 WHERE `guid`=43441; -- Darian Singh
UPDATE `creature` SET `position_x`=-8833.99, `position_y`=984.074, `position_z`=98.552, `orientation`=4.60767 WHERE `guid`=26834; -- Caretaker Folsom
UPDATE `creature` SET `position_x`=-8741.68, `position_y`=1095.5, `position_z`=93.7959, `orientation`=5.51524 WHERE `guid`=90466; -- Theridran
UPDATE `creature` SET `position_x`=-8776.3, `position_y`=1100.09, `position_z`=92.6261, `orientation`=4.90438 WHERE `guid`=90465; -- Sheldras Moontree
UPDATE `creature` SET `position_x`=-8727.69, `position_y`=1102.96, `position_z`=92.6025, `orientation`=3.87463 WHERE `guid`=90480; -- Nara Meideros
UPDATE `creature` SET `position_x`=512.729, `position_y`=-205.978, `position_z`=-59.1615, `orientation`=3.10972 WHERE `guid`=90699; -- Bloodhound
UPDATE `creature` SET `position_x`=-8750.83, `position_y`=1124.52, `position_z`=92.6338, `orientation`=1.53589 WHERE `guid`=90467; -- Maldryn
UPDATE `creature` SET `position_x`=-8721.29, `position_y`=1137.16, `position_z`=90.761, `orientation`=2.1293 WHERE `guid`=90483; -- Imelda
UPDATE `creature` SET `position_x`=-8787.91, `position_y`=832.669, `position_z`=97.4384, `orientation`=0.261799 WHERE `guid`=90456; -- Stockade Guard
UPDATE `creature` SET `position_x`=-8799.57, `position_y`=828.396, `position_z`=97.6346, `orientation`=0.968697 WHERE `guid`=89325; -- Warden Thelwater
UPDATE `creature` SET `position_x`=-8595.41, `position_y`=740.665, `position_z`=101.987, `orientation`=3.92699 WHERE `guid`=86169; -- Jesper
UPDATE `creature` SET `position_x`=-8533.35, `position_y`=456.655, `position_z`=105.1, `orientation`=2.30383 WHERE `guid`=10506; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8463.8, `position_y`=516.193, `position_z`=100.639, `orientation`=3.26377 WHERE `guid`=35221; -- Brohann Caskbelly
UPDATE `creature` SET `position_x`=-8524.29, `position_y`=444.579, `position_z`=105.21, `orientation`=3.78736 WHERE `guid`=10510; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8468.64, `position_y`=501.28, `position_z`=99.9119, `orientation`=2.68781 WHERE `guid`=2435; -- Wilder Thistlenettle
UPDATE `creature` SET `position_x`=-8432.74, `position_y`=554.682, `position_z`=95.3503, `orientation`=1.27409 WHERE `guid`=48424; -- Jenova Stoneshield
UPDATE `creature` SET `position_x`=-8422.21, `position_y`=553.205, `position_z`=95.5317, `orientation`=5.39307 WHERE `guid`=18402; -- Karrina Mekenda
UPDATE `creature` SET `position_x`=-8415.76, `position_y`=552.698, `position_z`=95.5317, `orientation`=3.82227 WHERE `guid`=37608; -- Einris Brightspear
UPDATE `creature` SET `position_x`=-8410.29, `position_y`=548.566, `position_z`=95.5317, `orientation`=3.64774 WHERE `guid`=37609; -- Ulfir Ironbeard
UPDATE `creature` SET `position_x`=-8412.8, `position_y`=541.397, `position_z`=102.578, `orientation`=0.733038 WHERE `guid`=37610; -- Thorfin Stoneshield
UPDATE `creature` SET `position_x`=-8388.84, `position_y`=453.085, `position_z`=123.76, `orientation`=3.80482 WHERE `guid`=10524; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8394.09, `position_y`=449.423, `position_z`=123.76, `orientation`=0.645772 WHERE `guid`=10523; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-20.3867, `position_y`=2458.55, `position_z`=-4.29719, `orientation`=3.10621 WHERE `guid`=52990; -- Nipsy
UPDATE `creature` SET `position_x`=50.7911, `position_y`=1190.2, `position_z`=-121.307, `orientation`=2.23869 WHERE `guid`=48296; -- Naga Siren
UPDATE `creature` SET `position_x`=-4850.7, `position_y`=-1295.24, `position_z`=501.951, `orientation`=1.39626 WHERE `guid`=302421; -- Fizzlebang Booms
UPDATE `creature` SET `position_x`=-5194.21, `position_y`=-737.037, `position_z`=447.468, `orientation`=1.71042 WHERE `guid`=141; -- Ironforge Guard
UPDATE `creature` SET `position_x`=10099.6, `position_y`=1458.99, `position_z`=1276.42, `orientation`=2.35302 WHERE `guid`=46419; -- Agal
UPDATE `creature` SET `position_x`=387.224, `position_y`=-153.808, `position_z`=-64.949, `orientation`=2.16127 WHERE `guid`=45893; -- Bloodhound
UPDATE `creature` SET `position_x`=410.246, `position_y`=-196.335, `position_z`=-64.877, `orientation`=4.81377 WHERE `guid`=90900; -- Bloodhound
UPDATE `creature` SET `position_x`=379.02, `position_y`=-197.159, `position_z`=-69.8456, `orientation`=5.1853 WHERE `guid`=91030; -- Bloodhound
UPDATE `creature` SET `position_x`=296.717, `position_y`=-179.106, `position_z`=-75.797, `orientation`=2.25729 WHERE `guid`=91055; -- Bloodhound
UPDATE `creature` SET `position_x`=324.4, `position_y`=-213.24, `position_z`=-78.215, `orientation`=4.53814 WHERE `guid`=90849; -- Bloodhound
UPDATE `creature` SET `position_x`=288.172, `position_y`=-92.3701, `position_z`=-75.885, `orientation`=3.97289 WHERE `guid`=90905; -- Bloodhound
UPDATE `creature` SET `position_x`=-8.37479, `position_y`=-902.874, `position_z`=57.5411, `orientation`=6.19215 WHERE `guid`=16051; -- Umpi
UPDATE `creature` SET `position_x`=-0.763534, `position_y`=-938.919, `position_z`=61.9332, `orientation`=0.0486992 WHERE `guid`=15893; -- Captured Farmer
UPDATE `creature` SET `position_x`=512.549, `position_y`=-199.688, `position_z`=-59.6124, `orientation`=0.849916 WHERE `guid`=90701; -- Bloodhound
UPDATE `creature` SET `position_x`=582.85, `position_y`=-152.61, `position_z`=-68.4486, `orientation`=6.11643 WHERE `guid`=47624; -- Ograbisi
UPDATE `creature` SET `position_x`=581.996, `position_y`=-176.436, `position_z`=-84.4941, `orientation`=2.88969 WHERE `guid`=46607; -- Bloodhound
UPDATE `creature` SET `position_x`=582.865, `position_y`=-190.914, `position_z`=-84.4943, `orientation`=0.985207 WHERE `guid`=46302; -- Bloodhound
UPDATE `creature` SET `position_x`=606.685, `position_y`=-193.381, `position_z`=-84.4849, `orientation`=4.87865 WHERE `guid`=46272; -- Bloodhound
UPDATE `creature` SET `position_x`=612.972, `position_y`=-198.379, `position_z`=-84.493, `orientation`=1.27988 WHERE `guid`=46269; -- Bloodhound
UPDATE `creature` SET `position_x`=1350.4, `position_y`=-3653.07, `position_z`=92.763, `orientation`=0.603595 WHERE `guid`=20744; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1358.09, `position_y`=-3640.96, `position_z`=92.7527, `orientation`=2.82316 WHERE `guid`=20741; -- Venture Co. Enforcer
UPDATE `creature` SET `position_x`=1728.7, `position_y`=-1170.43, `position_z`=59.6126, `orientation`=3.5035 WHERE `guid`=45739; -- Skeletal Sorcerer
UPDATE `creature` SET `position_x`=1973.6, `position_y`=-4504.02, `position_z`=82.3923, `orientation`=4.33656 WHERE `guid`=92843; -- Hate Shrieker
UPDATE `creature` SET `position_x`=2016.71, `position_y`=-4555.33, `position_z`=74.9888, `orientation`=6.16923 WHERE `guid`=92536; -- Hate Shrieker
UPDATE `creature` SET `position_x`=5405.6, `position_y`=-551.63, `position_z`=359.588, `orientation`=4.29208 WHERE `guid`=39501; -- Angerclaw Mauler
UPDATE `creature` SET `position_x`=6731.68, `position_y`=-4629.53, `position_z`=721.668, `orientation`=2.78214 WHERE `guid`=42288; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=6727.17, `position_y`=-4654.35, `position_z`=721.031, `orientation`=0.947567 WHERE `guid`=42290; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=6738.09, `position_y`=-4674.12, `position_z`=721.953, `orientation`=1.40012 WHERE `guid`=42278; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=6719.4, `position_y`=-4703, `position_z`=721.583, `orientation`=2.44885 WHERE `guid`=42280; -- Everlook Bruiser

UPDATE `creature` SET `position_x`=66.2384, `position_y`=-274.532, `position_z`=60.7346, `orientation`=6.23082 WHERE `guid`=300420; -- Scarshield Legionnaire
UPDATE `creature` SET `position_x`=70.5436, `position_y`=-420.443, `position_z`=110.847, `orientation`=0.750492 WHERE `guid`=41790; -- Awbee
UPDATE `creature` SET `position_x`=-1477.94, `position_y`=190.359, `position_z`=-7.70947, `orientation`=5.37561 WHERE `guid`=54390; -- Chronos
UPDATE `creature` SET `position_x`=-1586.9, `position_y`=151.369, `position_z`=-7.49291, `orientation`=0.488692 WHERE `guid`=54338; -- Sayge
UPDATE `creature` SET `position_x`=120.713, `position_y`=206.373, `position_z`=-4.90247, `orientation`=5.5676 WHERE `guid`=84252; -- Petrified Treant
UPDATE `creature` SET `position_x`=1821.44, `position_y`=195.831, `position_z`=70.483, `orientation`=2.75507 WHERE `guid`=202833; -- Undercity Reveler
UPDATE `creature` SET `position_x`=819.488, `position_y`=-161.968, `position_z`=-49.6699, `orientation`=5.60345 WHERE `guid`=91047; -- Guzzling Patron
UPDATE `creature` SET `position_x`=819.488, `position_y`=-161.968, `position_z`=-49.6699, `orientation`=5.60345 WHERE `guid`=91067; -- Guzzling Patron
UPDATE `creature` SET `position_x`=889.815, `position_y`=-205.893, `position_z`=-42.6204, `orientation`=1.99706 WHERE `guid`=91070; -- Grim Patron
UPDATE `creature` SET `position_x`=-10836, `position_y`=-2952.57, `position_z`=13.9408, `orientation`=3.05433 WHERE `guid`=40521; -- Spirit Healer
UPDATE `creature` SET `position_x`=-11182.6, `position_y`=-1857.22, `position_z`=73.8614, `orientation`=4.94902 WHERE `guid`=4009; -- Unliving Resident
UPDATE `creature` SET `position_x`=-11172, `position_y`=-1852.65, `position_z`=73.8614, `orientation`=0.623975 WHERE `guid`=4007; -- Unliving Resident
UPDATE `creature` SET `position_x`=2246.33, `position_y`=308.24, `position_z`=36.771, `orientation`=5.58505 WHERE `guid`=28473; -- Eliza Callen
UPDATE `creature` SET `position_x`=2253.9, `position_y`=318.385, `position_z`=36.771, `orientation`=5.51524 WHERE `guid`=33711; -- Velma Warnam
UPDATE `creature` SET `position_x`=2278.08, `position_y`=295.587, `position_z`=36.8172, `orientation`=1.93731 WHERE `guid`=29797; -- Executor Zygand
UPDATE `creature` SET `position_x`=2272.98, `position_y`=290.231, `position_z`=36.666, `orientation`=3.24631 WHERE `guid`=34112; -- Deathguard Cyrus
UPDATE `creature` SET `position_x`=-338.803, `position_y`=5.1802, `position_z`=55.5131, `orientation`=0.595024 WHERE `guid`=16506; -- Hillsbrad Farmer
UPDATE `creature` SET `position_x`=-337.991, `position_y`=17.6618, `position_z`=55.52, `orientation`=4.4472 WHERE `guid`=16527; -- Hillsbrad Farmer
UPDATE `creature` SET `position_x`=-353.514, `position_y`=21.3989, `position_z`=54.7844, `orientation`=1.9557 WHERE `guid`=16020; -- Stanley
UPDATE `creature` SET `position_x`=6408.2, `position_y`=518.467, `position_z`=8.73286, `orientation`=2.84489 WHERE `guid`=90188; -- Winter Reveler
UPDATE `creature` SET `position_x`=6437.92, `position_y`=472.23, `position_z`=7.85245, `orientation`=1.99652 WHERE `guid`=37103; -- Sentinel Glynda Nal'Shea
UPDATE `creature` SET `position_x`=-9019.92, `position_y`=476.071, `position_z`=96.1215, `orientation`=2.3011 WHERE `guid`=206210; -- Stormwind Reveler
UPDATE `creature` SET `position_x`=-9019.92, `position_y`=476.071, `position_z`=96.1215, `orientation`=2.3011 WHERE `guid`=206209; -- Stormwind Reveler
UPDATE `creature` SET `position_x`=-9072.43, `position_y`=499.01, `position_z`=76.2405, `orientation`=2.08688 WHERE `guid`=206411; -- Stormwind Reveler
UPDATE `creature` SET `position_x`=-9042.23, `position_y`=434.241, `position_z`=93.2955, `orientation`=2.23402 WHERE `guid`=301304; -- Squire Rowe
UPDATE `creature` SET `position_x`=-8992.91, `position_y`=394.684, `position_z`=72.798, `orientation`=0.416506 WHERE `guid`=206458; -- Stormwind Reveler
UPDATE `creature` SET `position_x`=-11116.5, `position_y`=-2081.65, `position_z`=48.2996, `orientation`=3.24004 WHERE `guid`=4014; -- Unliving Resident
UPDATE `creature` SET `position_x`=-76.3525, `position_y`=312.719, `position_z`=85.5938, `orientation`=1.66955 WHERE `guid`=29431; -- Gogger Geomancer
UPDATE `creature` SET `position_x`=-96.9891, `position_y`=318.316, `position_z`=87.6663, `orientation`=3.41717 WHERE `guid`=29422; -- Gogger Geomancer
UPDATE `creature` SET `position_x`=-5029.11, `position_y`=-813.097, `position_z`=495.274, `orientation`=4.91925 WHERE `guid`=208348; -- Ironforge Reveler
UPDATE `creature` SET `position_x`=-1277.99, `position_y`=107.074, `position_z`=129.592, `orientation`=1.97449 WHERE `guid`=208676; -- Thunder Bluff Reveler
UPDATE `creature` SET `position_x`=-1277.99, `position_y`=107.074, `position_z`=129.592, `orientation`=1.97449 WHERE `guid`=208675; -- Thunder Bluff Reveler
UPDATE `creature` SET `position_x`=8596.23, `position_y`=1009.77, `position_z`=5.79785, `orientation`=0.0257078 WHERE `guid`=208898; -- Darnassus Reveler
UPDATE `creature` SET `position_x`=-9102.33, `position_y`=834.774, `position_z`=105.201, `orientation`=5.11381 WHERE `guid`=54399; -- Connor Rivers
UPDATE `creature` SET `position_x`=2215.43, `position_y`=237.536, `position_z`=34.7272, `orientation`=1.69297 WHERE `guid`=78373; -- Elder Graveborn
UPDATE `creature` SET `position_x`=-8512.4, `position_y`=862.364, `position_z`=109.927, `orientation`=3.82227 WHERE `guid`=1079; -- High Priestess Laurena
UPDATE `creature` SET `position_x`=2755.03, `position_y`=-5395.02, `position_z`=116.28, `orientation`=4.92739 WHERE `guid`=36389; -- Draconic Magelord
UPDATE `creature` SET `position_x`=2570.05, `position_y`=-5481.79, `position_z`=122.175, `orientation`=2.33333 WHERE `guid`=36392; -- Draconic Magelord
UPDATE `creature` SET `position_x`=-8584.07, `position_y`=633.421, `position_z`=96.338, `orientation`=5.07306 WHERE `guid`=79816; -- Roman
UPDATE `creature` SET `position_x`=-20.0212, `position_y`=-366.39, `position_z`=-4.04007, `orientation`=1.81514 WHERE `guid`=300889; -- Warpwood Crusher
UPDATE `creature` SET `position_x`=-1199.45, `position_y`=-96.621, `position_z`=162.744, `orientation`=2.39416 WHERE `guid`=212000; -- Thunder Bluff Reveler
UPDATE `creature` SET `position_x`=2405.9, `position_y`=1808.95, `position_z`=360.101, `orientation`=4.08343 WHERE `guid`=32208; -- Cenarion Caretaker
UPDATE `creature` SET `position_x`=2394.61, `position_y`=1812.49, `position_z`=391.867, `orientation`=6.12611 WHERE `guid`=29235; -- Gatekeeper Kordurus
UPDATE `creature` SET `position_x`=2366.03, `position_y`=1795.21, `position_z`=365.137, `orientation`=3.28122 WHERE `guid`=29238; -- Rynthariel the Keymaster
UPDATE `creature` SET `position_x`=1428.68, `position_y`=-4402.17, `position_z`=25.3187, `orientation`=3.19816 WHERE `guid`=212456; -- Orgrimmar Reveler
UPDATE `creature` SET `position_x`=2343.83, `position_y`=1837.69, `position_z`=381.839, `orientation`=1.23669 WHERE `guid`=32209; -- Cenarion Caretaker
UPDATE `creature` SET `position_x`=-10420, `position_y`=-3242.63, `position_z`=20.2615, `orientation`=4.90438 WHERE `guid`=33815; -- Grunt Tharlak
UPDATE `creature` SET `position_x`=-4882.52, `position_y`=-952.796, `position_z`=501.547, `orientation`=3.26954 WHERE `guid`=86181; -- Goli Krumn
UPDATE `creature` SET `position_x`=-8533.59, `position_y`=367.126, `position_z`=108.569, `orientation`=2.28638 WHERE `guid`=10500; -- Caledra Dawnbreeze
UPDATE `creature` SET `position_x`=-8469.94, `position_y`=361.209, `position_z`=116.933, `orientation`=0.715585 WHERE `guid`=10511; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8421.2, `position_y`=405.485, `position_z`=120.969, `orientation`=3.57792 WHERE `guid`=16182; -- Major Samuelson
UPDATE `creature` SET `position_x`=-8462.33, `position_y`=367.363, `position_z`=116.913, `orientation`=3.78736 WHERE `guid`=10512; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8454.62, `position_y`=318.853, `position_z`=120.969, `orientation`=0.698132 WHERE `guid`=54614; -- Elfarran
UPDATE `creature` SET `position_x`=-8437.96, `position_y`=331.033, `position_z`=122.763, `orientation`=2.26893 WHERE `guid`=10497; -- Lady Katrana Prestor
UPDATE `creature` SET `position_x`=-8363.3, `position_y`=407.914, `position_z`=122.458, `orientation`=5.34071 WHERE `guid`=10525; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-8355.78, `position_y`=414.382, `position_z`=122.458, `orientation`=5.42797 WHERE `guid`=10526; -- Stormwind Royal Guard
UPDATE `creature` SET `position_x`=-146.427, `position_y`=-366.639, `position_z`=-4.06831, `orientation`=1.90241 WHERE `guid`=300905; -- Phase Lasher
UPDATE `creature` SET `position_x`=-8332.95, `position_y`=394.82, `position_z`=122.458, `orientation`=2.25148 WHERE `guid`=10502; -- Lord Gregor Lescovar
UPDATE `creature` SET `position_x`=-8345.72, `position_y`=383.766, `position_z`=122.358, `orientation`=2.1293 WHERE `guid`=8704; -- Milton Sheaf
UPDATE `creature` SET `position_x`=-8441.76, `position_y`=311.67, `position_z`=120.969, `orientation`=1.53589 WHERE `guid`=14740; -- Alliance Brigadier General
UPDATE `creature` SET `position_x`=-8394.83, `position_y`=281.69, `position_z`=121.069, `orientation`=3.82227 WHERE `guid`=10498; -- Grand Admiral Jes-Tereth
UPDATE `creature` SET `position_x`=-8401.1, `position_y`=276.694, `position_z`=121.069, `orientation`=0.663225 WHERE `guid`=10499; -- Mithras Ironhill
UPDATE `creature` SET `position_x`=-773.643, `position_y`=-354.978, `position_z`=90.8773, `orientation`=2.54818 WHERE `guid`=150419; -- Frostwolf Bowman
UPDATE `creature` SET `position_x`=6.64531, `position_y`=-460.465, `position_z`=111.016, `orientation`=0.418879 WHERE `guid`=42663; -- Rage Talon Fire Tongue
UPDATE `creature` SET `position_x`=-1354.17, `position_y`=-3909.38, `position_z`=8.65149, `orientation`=4.10568 WHERE `guid`=13760; -- Southsea Brigand
UPDATE `creature` SET `position_x`=-12375, `position_y`=234.228, `position_z`=3.36529, `orientation`=1.8675 WHERE `guid`=611; -- Grom'gol Grunt
UPDATE `creature` SET `position_x`=-12335.5, `position_y`=163.184, `position_z`=3.06546, `orientation`=2.70526 WHERE `guid`=666; -- Angrun
UPDATE `creature` SET `position_x`=-8506.38, `position_y`=328.657, `position_z`=120.885, `orientation`=0.0326069 WHERE `guid`=33821; -- Bishop DeLavey
UPDATE `creature` SET `position_x`=-8681.22, `position_y`=432.526, `position_z`=99.3012, `orientation`=1.65806 WHERE `guid`=79741; -- Dashel Stonefist
UPDATE `creature` SET `position_x`=-10553.6, `position_y`=-1250.2, `position_z`=32.0477, `orientation`=1.93298 WHERE `guid`=4247; -- Watcher Petras
UPDATE `creature` SET `position_x`=-571.081, `position_y`=-263.751, `position_z`=75.092, `orientation`=5.41052 WHERE `guid`=53089; -- Commander Dardosh
UPDATE `creature` SET `position_x`=-491.384, `position_y`=-176.36, `position_z`=57.5352, `orientation`=5.96903 WHERE `guid`=53111; -- Lieutenant Lewis
UPDATE `creature` SET `position_x`=-14293.2, `position_y`=557.623, `position_z`=8.85528, `orientation`=5.21853 WHERE `guid`=655; -- Booty Bay Bruiser
UPDATE `creature` SET `position_x`=-173.069, `position_y`=-452.949, `position_z`=40.9205, `orientation`=3.56047 WHERE `guid`=150408; -- Stormpike Bowman
UPDATE `creature` SET `position_x`=1171.01, `position_y`=-189.006, `position_z`=-65.3757, `orientation`=5.66563 WHERE `guid`=46641; -- Molten War Golem
UPDATE `creature` SET `position_x`=214.099, `position_y`=-373.896, `position_z`=56.4709, `orientation`=2.26893 WHERE `guid`=53226; -- Commander Karl Philips
UPDATE `creature` SET `position_x`=210.875, `position_y`=-357.36, `position_z`=56.4586, `orientation`=5.67232 WHERE `guid`=150103; -- Wing Commander Guse
UPDATE `creature` SET `position_x`=226.311, `position_y`=-369.188, `position_z`=57.0509, `orientation`=5.98648 WHERE `guid`=150404; -- Stormpike Bowman
UPDATE `creature` SET `position_x`=1395.88, `position_y`=1020.38, `position_z`=167.323, `orientation`=1.20017 WHERE `guid`=29964; -- Pridewing Consort
UPDATE `creature` SET `position_x`=7580.48, `position_y`=-2249.03, `position_z`=467.078, `orientation`=4.31096 WHERE `guid`=91667; -- Lunar Festival Sentinel
UPDATE `creature` SET `position_x`=7630.92, `position_y`=-2227.69, `position_z`=465.589, `orientation`=3.00197 WHERE `guid`=91682; -- Lunar Festival Sentinel
UPDATE `creature` SET `position_x`=-8823.37, `position_y`=540.074, `position_z`=96.9894, `orientation`=2.44346 WHERE `guid`=54905; -- Pat's Snowcloud Guy
UPDATE `creature` SET `position_x`=2093.53, `position_y`=-4510.3, `position_z`=78.4227, `orientation`=1.87772 WHERE `guid`=92240; -- Hate Shrieker
UPDATE `creature` SET `position_x`=2021.94, `position_y`=-4563.24, `position_z`=74.9812, `orientation`=3.19908 WHERE `guid`=92537; -- Vile Tutor
UPDATE `creature` SET `position_x`=-194.051, `position_y`=1697.7, `position_z`=105.462, `orientation`=5.28835 WHERE `guid`=27632; -- Burning Blade Reaver
UPDATE `creature` SET `position_x`=1245.4, `position_y`=-9.26176, `position_z`=-5.46087, `orientation`=2.6238 WHERE `guid`=29546; -- Venture Co. Deforester
UPDATE `creature` SET `position_x`=1234.8, `position_y`=43.5027, `position_z`=-5.90117, `orientation`=3.70514 WHERE `guid`=29464; -- Venture Co. Operator
UPDATE `creature` SET `position_x`=-3642.63, `position_y`=-4346.07, `position_z`=8.03261, `orientation`=5.35816 WHERE `guid`=30726; -- Theramore Guard
UPDATE `creature` SET `position_x`=-1141.67, `position_y`=2695.83, `position_z`=111.331, `orientation`=0.463648 WHERE `guid`=27326; -- Maraudine Mauler
UPDATE `creature` SET `position_x`=235.987, `position_y`=-850.581, `position_z`=146.984, `orientation`=2.14003 WHERE `guid`=16958; -- Syndicate Thief
UPDATE `creature` SET `position_x`=-34.983, `position_y`=-448, `position_z`=-37.8785, `orientation`=0.191986 WHERE `guid`=56934; -- Zevrim Thornhoof
UPDATE `creature` SET `position_x`=-455.99, `position_y`=133.747, `position_z`=57.2124, `orientation`=3.92699 WHERE `guid`=15994; -- Hillsbrad Footman
UPDATE `creature` SET `position_x`=-740.656, `position_y`=132.525, `position_z`=20.648, `orientation`=2.54818 WHERE `guid`=15915; -- Hillsbrad Miner
UPDATE `creature` SET `position_x`=-751.105, `position_y`=106.233, `position_z`=14.5482, `orientation`=4.31096 WHERE `guid`=15916; -- Hillsbrad Miner
UPDATE `creature` SET `position_x`=-9424.66, `position_y`=129.056, `position_z`=59.8005, `orientation`=2.33201 WHERE `guid`=80317; -- Mark
UPDATE `creature` SET `position_x`=-1135.43, `position_y`=-846.768, `position_z`=16.921, `orientation`=1.93731 WHERE `guid`=15706; -- Daggerspine Shorehunter
UPDATE `creature` SET `position_x`=-11586.1, `position_y`=678.883, `position_z`=59.6691, `orientation`=5.14475 WHERE `guid`=1936; -- Bloodscalp Witch Doctor
UPDATE `creature` SET `position_x`=6768.6, `position_y`=-4673.69, `position_z`=723.831, `orientation`=0 WHERE `guid`=42282; -- Everlook Bruiser
UPDATE `creature` SET `position_x`=387.409, `position_y`=462.772, `position_z`=-7.14894, `orientation`=2.68781 WHERE `guid`=302364; -- Gordok Reaver
UPDATE `creature` SET `position_x`=484.101, `position_y`=523.808, `position_z`=27.9977, `orientation`=1.44862 WHERE `guid`=302372; -- Gordok Reaver
UPDATE `creature` SET `position_x`=-11838.5, `position_y`=1256.12, `position_z`=2.15493, `orientation`=5.81195 WHERE `guid`=2368; -- Captured Hakkari Zealot
UPDATE `creature` SET `position_x`=704.35, `position_y`=-22.9071, `position_z`=50.2187, `orientation`=0.785398 WHERE `guid`=301909; -- Prospector Stonehewer
UPDATE `creature` SET `position_x`=727.014, `position_y`=2.3412, `position_z`=50.7046, `orientation`=3.87463 WHERE `guid`=150146; -- Dun Baldar South Marshal
UPDATE `creature` SET `position_x`=497.733, `position_y`=523.807, `position_z`=27.9982, `orientation`=1.64061 WHERE `guid`=302371; -- Gordok Reaver
UPDATE `creature` SET `position_x`=522.958, `position_y`=554.504, `position_z`=28.0006, `orientation`=2.19912 WHERE `guid`=302370; -- Gordok Reaver
UPDATE `creature` SET `position_x`=593.228, `position_y`=565.12, `position_z`=-4.67144, `orientation`=3.10669 WHERE `guid`=302369; -- Gordok Reaver
UPDATE `creature` SET `position_x`=-5280.94, `position_y`=1277.44, `position_z`=50.8182, `orientation`=2.90686 WHERE `guid`=50230; -- Gordunni Mauler
UPDATE `creature` SET `position_x`=6866.44, `position_y`=-5100.03, `position_z`=692.812, `orientation`=2.49776 WHERE `guid`=41030; -- Winterfall Shaman
UPDATE `creature` SET `position_x`=1663.39, `position_y`=1151.67, `position_z`=159.351, `orientation`=2.61472 WHERE `guid`=29963; -- Pridewing Consort
UPDATE `creature` SET `position_x`=-11514.4, `position_y`=724.968, `position_z`=61.1043, `orientation`=3.03687 WHERE `guid`=19; -- Gan'zulah
UPDATE `creature` SET `position_x`=9907.93, `position_y`=2206.21, `position_z`=1328.93, `orientation`=1.2103 WHERE `guid`=46502; -- Great Horned Owl
UPDATE `creature` SET `position_x`=-107.998, `position_y`=533.761, `position_z`=28.6972, `orientation`=4.72984 WHERE `guid`=300157; -- Eldreth Sorcerer
UPDATE `creature` SET `position_x`=-104.183, `position_y`=526.692, `position_z`=28.6962, `orientation`=1.0472 WHERE `guid`=300159; -- Rotting Highborne
UPDATE `creature` SET `position_x`=-11553.8, `position_y`=608.401, `position_z`=50.7278, `orientation`=4.18879 WHERE `guid`=1114; -- Bloodscalp Beastmaster
UPDATE `creature` SET `position_x`=-11586.5, `position_y`=562.651, `position_z`=49.9286, `orientation`=4.05296 WHERE `guid`=1081; -- Bloodscalp Hunter
UPDATE `creature` SET `position_x`=-7195.3, `position_y`=-3793.25, `position_z`=9.747, `orientation`=3.32894 WHERE `guid`=60001; -- Gadgetzan Bruiser
UPDATE `creature` SET `position_x`=1667.78, `position_y`=-2363.76, `position_z`=61.6675, `orientation`=5.16163 WHERE `guid`=48590; -- Wailing Death
UPDATE `creature` SET `position_x`=1670.06, `position_y`=-2351.3, `position_z`=60.7904, `orientation`=2.23994 WHERE `guid`=46279; -- Hungering Wraith
UPDATE `creature` SET `position_x`=1665.75, `position_y`=-2372.59, `position_z`=61.666, `orientation`=5.55941 WHERE `guid`=45312; -- Hungering Wraith
UPDATE `creature` SET `position_x`=1537.65, `position_y`=540.831, `position_z`=172.22, `orientation`=6.01743 WHERE `guid`=29968; -- Pridewing Consort
UPDATE `creature` SET `position_x`=1511.72, `position_y`=531.25, `position_z`=158.74, `orientation`=1.46287 WHERE `guid`=29967; -- Pridewing Consort
UPDATE `creature` SET `position_x`=552.073, `position_y`=1593.59, `position_z`=130.111, `orientation`=3.18666 WHERE `guid`=17613; -- Dalar Dawnweaver
UPDATE `creature` SET `position_x`=128.02, `position_y`=-315.29, `position_z`=111.029, `orientation`=2.98451 WHERE `guid`=40462; -- Rage Talon Dragonspawn
UPDATE `creature` SET `position_x`=-11491.9, `position_y`=393.702, `position_z`=62.4361, `orientation`=1.53589 WHERE `guid`=1314; -- Venture Co. Mechanic
UPDATE `creature` SET `position_x`=7949.41, `position_y`=-2616.75, `position_z`=492.439, `orientation`=2.77507 WHERE `guid`=91683; -- Lunar Festival Sentinel
UPDATE `creature` SET `position_x`=1545.77, `position_y`=-1713.62, `position_z`=67.6403, `orientation`=5.25606 WHERE `guid`=45228; -- Skeletal Acolyte
UPDATE `creature` SET `position_x`=7002.13, `position_y`=-2201.5, `position_z`=587.081, `orientation`=1.65806 WHERE `guid`=39729; -- Timbermaw Warder
UPDATE `creature` SET `position_x`=-11844.2, `position_y`=55.5921, `position_z`=14.5074, `orientation`=5.3192 WHERE `guid`=2534; -- Bloodscalp Axe Thrower
UPDATE `creature` SET `position_x`=-166.727, `position_y`=-271.487, `position_z`=-4.06308, `orientation`=5.68977 WHERE `guid`=300935; -- Phase Lasher
UPDATE `creature` SET `position_x`=131.583, `position_y`=-352.838, `position_z`=-4.06887, `orientation`=3.36848 WHERE `guid`=300975; -- Warpwood Crusher
UPDATE `creature` SET `position_x`=216.978, `position_y`=-356.29, `position_z`=-67.4426, `orientation`=5.11381 WHERE `guid`=300897; -- Warpwood Crusher
UPDATE `creature` SET `position_x`=330.651, `position_y`=-375.383, `position_z`=-71.0516, `orientation`=3.9968 WHERE `guid`=300899; -- Warpwood Crusher
UPDATE `creature` SET `position_x`=43.2278, `position_y`=-449.183, `position_z`=111.027, `orientation`=3.85718 WHERE `guid`=300796; -- Rage Talon Dragon Guard
UPDATE `creature` SET `position_x`=6581.42, `position_y`=-5108.81, `position_z`=768.93, `orientation`=5.37275 WHERE `guid`=41604; -- Ice Thistle Yeti
UPDATE `creature` SET `position_x`=-6650.1, `position_y`=-2149.41, `position_z`=245.352, `orientation`=3.9968 WHERE `guid`=6889; -- Innkeeper Shul'kar
UPDATE `creature` SET `position_x`=-11922.2, `position_y`=-905.466, `position_z`=38.162, `orientation`=1.39626 WHERE `guid`=824; -- Gurubashi Warrior
UPDATE `creature` SET `position_x`=-11909.4, `position_y`=-905.137, `position_z`=37.9979, `orientation`=1.85005 WHERE `guid`=825; -- Gurubashi Warrior
UPDATE `creature` SET `position_x`=-11550.2, `position_y`=-228.462, `position_z`=28.2846, `orientation`=6.16101 WHERE `guid`=40520; -- Spirit Healer
UPDATE `creature` SET `position_x`=249.001, `position_y`=-4857.21, `position_z`=13.7579, `orientation`=5.51358 WHERE `guid`=8417; -- Razor Hill Grunt
UPDATE `creature` SET `position_x`=10137.4, `position_y`=2583.92, `position_z`=1325.58, `orientation`=4.38078 WHERE `guid`=70567; -- Elder Bladeswift
UPDATE `creature` SET `position_x`=-285.65, `position_y`=-313.706, `position_z`=-69.1692, `orientation`=3.93039 WHERE `guid`=87131; -- Skum
UPDATE `creature` SET `position_x`=325.609, `position_y`=351.804, `position_z`=2.85293, `orientation`=6.15108 WHERE `guid`=198348; -- Gordok Mastiff
UPDATE `creature` SET `position_x`=-11949.3, `position_y`=-1072.93, `position_z`=92.8714, `orientation`=0.00522972 WHERE `guid`=556; -- Hakkari Oracle
UPDATE `creature` SET `position_x`=-11880.2, `position_y`=-1067.03, `position_z`=97.0762, `orientation`=3.57738 WHERE `guid`=677; -- Hakkari Oracle
UPDATE `creature` SET `position_x`=129.356, `position_y`=443.725, `position_z`=-48.4598, `orientation`=0.389838 WHERE `guid`=56947; -- Lorekeeper Kildrath
UPDATE `creature` SET `position_x`=121.059, `position_y`=488.502, `position_z`=28.6844, `orientation`=4.5204 WHERE `guid`=300106; -- Eldreth Sorcerer
UPDATE `creature` SET `position_x`=-287.854, `position_y`=-3452.69, `position_z`=190.014, `orientation`=2.24965 WHERE `guid`=93453; -- Morta'gya the Keeper
UPDATE `creature` SET `position_x`=24.366, `position_y`=-580.333, `position_z`=-18.5181, `orientation`=2.98451 WHERE `guid`=300468; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=-41.1573, `position_y`=-498.942, `position_z`=29.2434, `orientation`=4.76475 WHERE `guid`=43504; -- Spirestone Enforcer
UPDATE `creature` SET `position_x`=-44.5055, `position_y`=-555.94, `position_z`=29.2742, `orientation`=5.44543 WHERE `guid`=43492; -- Scarshield Worg
UPDATE `creature` SET `position_x`=-44.5055, `position_y`=-555.94, `position_z`=29.2742, `orientation`=5.44543 WHERE `guid`=43491; -- Scarshield Worg
UPDATE `creature` SET `position_x`=-11567.2, `position_y`=-593.903, `position_z`=28.1639, `orientation`=3.24666 WHERE `guid`=1650; -- Kurzen Medicine Man
UPDATE `creature` SET `position_x`=-70.0191, `position_y`=-575.818, `position_z`=29.2742, `orientation`=1.16937 WHERE `guid`=43479; -- Scarshield Legionnaire
UPDATE `creature` SET `position_x`=188.856, `position_y`=-258.877, `position_z`=77.0358, `orientation`=6.07375 WHERE `guid`=40455; -- Blackhand Summoner
UPDATE `creature` SET `position_x`=212.101, `position_y`=-336.132, `position_z`=76.9559, `orientation`=5.09636 WHERE `guid`=45833; -- Blackhand Veteran
UPDATE `creature` SET `position_x`=-1145.3, `position_y`=-3390.21, `position_z`=91.7082, `orientation`=6.0088 WHERE `guid`=14260; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-1046.27, `position_y`=-3668.24, `position_z`=23.9706, `orientation`=1.36136 WHERE `guid`=90289; -- Winter Reveler
UPDATE `creature` SET `position_x`=-2005.18, `position_y`=-2788.21, `position_z`=91.8808, `orientation`=2.03383 WHERE `guid`=20152; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-2003.31, `position_y`=-2812.82, `position_z`=92.6828, `orientation`=4.14352 WHERE `guid`=20220; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-1945.59, `position_y`=-2706.33, `position_z`=93.3188, `orientation`=0.0734734 WHERE `guid`=20144; -- Bristleback Water Seeker
UPDATE `creature` SET `position_x`=-1929.94, `position_y`=-2702.79, `position_z`=93.466, `orientation`=1.38652 WHERE `guid`=20222; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-9416.56, `position_y`=-2289.82, `position_z`=67.9625, `orientation`=2.32129 WHERE `guid`=6157; -- Guard Pearce
UPDATE `creature` SET `position_x`=-10847.3, `position_y`=-2677.95, `position_z`=8.74547, `orientation`=4.93704 WHERE `guid`=2706; -- Dreadmaul Ogre Mage
UPDATE `creature` SET `position_x`=-9495.04, `position_y`=-1929.04, `position_z`=78.9448, `orientation`=5.84685 WHERE `guid`=10152; -- Redridge Thrasher
UPDATE `creature` SET `position_x`=-6232.63, `position_y`=-3844.94, `position_z`=-58.625, `orientation`=2.62578 WHERE `guid`=21557; -- Gnome Pit Crewman
UPDATE `creature` SET `position_x`=667.69, `position_y`=-121.761, `position_z`=64.1092, `orientation`=2.20377 WHERE `guid`=150400; -- Stormpike Bowman
UPDATE `creature` SET `position_x`=733.629, `position_y`=-19.121, `position_z`=50.7046, `orientation`=3.29867 WHERE `guid`=150147; -- Dun Baldar North Marshal
UPDATE `creature` SET `position_x`=-61.1997, `position_y`=-413.017, `position_z`=-18.8517, `orientation`=1.27409 WHERE `guid`=44150; -- Firebrand Invoker
UPDATE `creature` SET `position_x`=-26.7186, `position_y`=-412.36, `position_z`=-18.8517, `orientation`=0.523599 WHERE `guid`=44151; -- Firebrand Invoker
UPDATE `creature` SET `position_x`=-73.6279, `position_y`=-407.391, `position_z`=-18.8517, `orientation`=5.14872 WHERE `guid`=44020; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=-9547.7, `position_y`=-724.959, `position_z`=99.167, `orientation`=2.3766 WHERE `guid`=80931; -- Servant of Azora
UPDATE `creature` SET `position_x`=-9522.79, `position_y`=-701.161, `position_z`=61.6228, `orientation`=4.23045 WHERE `guid`=80936; -- Servant of Azora
UPDATE `creature` SET `position_x`=-14122.2, `position_y`=473.192, `position_z`=1.15794, `orientation`=5.08213 WHERE `guid`=2580; -- "Pretty Boy" Duncan
UPDATE `creature` SET `position_x`=-9060.47, `position_y`=-39.1944, `position_z`=88.3069, `orientation`=4.71239 WHERE `guid`=79930; -- Northshire Guard
UPDATE `creature` SET `position_x`=-9622.5, `position_y`=662.967, `position_z`=52.5756, `orientation`=3.31525 WHERE `guid`=80446; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9627.37, `position_y`=677.088, `position_z`=52.5756, `orientation`=2.94424 WHERE `guid`=80458; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9615.51, `position_y`=644.183, `position_z`=38.6521, `orientation`=5.01636 WHERE `guid`=80443; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9626.8, `position_y`=690.378, `position_z`=52.5756, `orientation`=4.564 WHERE `guid`=80456; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9613.27, `position_y`=667.402, `position_z`=38.6522, `orientation`=6.05839 WHERE `guid`=80460; -- Stormwind Guard
UPDATE `creature` SET `position_x`=-9861, `position_y`=1030.69, `position_z`=34.1304, `orientation`=1.66038 WHERE `guid`=90228; -- Defias Footpad
UPDATE `creature` SET `position_x`=-10646.3, `position_y`=1113.48, `position_z`=35.6455, `orientation`=0.890118 WHERE `guid`=45521; -- Westfall Woodworker
UPDATE `creature` SET `position_x`=-79.4082, `position_y`=437.517, `position_z`=28.6859, `orientation`=5.61996 WHERE `guid`=84227; -- Arcane Aberration
UPDATE `creature` SET `position_x`=-90.7518, `position_y`=404.466, `position_z`=28.6844, `orientation`=0.558505 WHERE `guid`=300120; -- Rotting Highborne
UPDATE `creature` SET `position_x`=-1420.63, `position_y`=2923.83, `position_z`=94.3887, `orientation`=0.241436 WHERE `guid`=29080; -- Ghostly Raider
UPDATE `creature` SET `position_x`=6790.28, `position_y`=-2661.51, `position_z`=544.619, `orientation`=3.77771 WHERE `guid`=41061; -- Winterfall Totemic
UPDATE `creature` SET `position_x`=829.697, `position_y`=481.328, `position_z`=37.4015, `orientation`=3.19395 WHERE `guid`=128489; -- King Gordok
UPDATE `creature` SET `position_x`=851.842, `position_y`=13.2664, `position_z`=-53.6419, `orientation`=2.28638 WHERE `guid`=300813; -- Ragereaver Golem
UPDATE `creature` SET `position_x`=606.419, `position_y`=-167.42, `position_z`=-84.4908, `orientation`=1.91671 WHERE `guid`=46281; -- Bloodhound
UPDATE `creature` SET `position_x`=612.84, `position_y`=-173.86, `position_z`=-84.4902, `orientation`=5.3722 WHERE `guid`=46271; -- Bloodhound
UPDATE `creature` SET `position_x`=660.673, `position_y`=-161.784, `position_z`=-73.7256, `orientation`=1.45874 WHERE `guid`=45906; -- Fireguard
UPDATE `creature` SET `position_x`=-213.642, `position_y`=-1662.75, `position_z`=91.7917, `orientation`=3.98733 WHERE `guid`=20465; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-201.479, `position_y`=-1649.25, `position_z`=91.7917, `orientation`=0.129268 WHERE `guid`=20535; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=6514.87, `position_y`=-3270.08, `position_z`=574.585, `orientation`=1.71974 WHERE `guid`=41036; -- Winterfall Den Watcher
UPDATE `creature` SET `position_x`=-164.761, `position_y`=-457.944, `position_z`=87.4736, `orientation`=2.37365 WHERE `guid`=45745; -- Bloodaxe Raider
UPDATE `creature` SET `position_x`=1891.33, `position_y`=-1572.97, `position_z`=59.4183, `orientation`=0.159993 WHERE `guid`=46308; -- Blighted Zombie
UPDATE `creature` SET `position_x`=1930.37, `position_y`=-1615.42, `position_z`=65.8244, `orientation`=4.02373 WHERE `guid`=46289; -- Skeletal Terror
UPDATE `creature` SET `position_x`=-1438.72, `position_y`=-1525.68, `position_z`=92.4579, `orientation`=2.66381 WHERE `guid`=20224; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-1423.18, `position_y`=-1530.61, `position_z`=100.574, `orientation`=4.19368 WHERE `guid`=20099; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-1452.93, `position_y`=-1491.26, `position_z`=97.5759, `orientation`=2.64837 WHERE `guid`=20103; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-1455.19, `position_y`=-1468.16, `position_z`=102.985, `orientation`=1.88512 WHERE `guid`=20216; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-1414.64, `position_y`=-1520.57, `position_z`=106.355, `orientation`=0.684668 WHERE `guid`=20226; -- Bristleback Geomancer
UPDATE `creature` SET `position_x`=-1451.19, `position_y`=-1510.64, `position_z`=92.1666, `orientation`=3.70418 WHERE `guid`=20115; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=-1663.06, `position_y`=-1762.22, `position_z`=91.7917, `orientation`=2.49339 WHERE `guid`=20085; -- Bristleback Hunter
UPDATE `creature` SET `position_x`=2111.46, `position_y`=-1814.58, `position_z`=58.5751, `orientation`=5.52936 WHERE `guid`=45359; -- Scarlet Invoker
UPDATE `creature` SET `position_x`=-131.936, `position_y`=-2009.62, `position_z`=91.7917, `orientation`=4.27015 WHERE `guid`=20470; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-103.71, `position_y`=-2026.18, `position_z`=91.7917, `orientation`=0.0392828 WHERE `guid`=20475; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-186.107, `position_y`=-1525.66, `position_z`=91.7917, `orientation`=1.26989 WHERE `guid`=14166; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-10617.7, `position_y`=-3376.93, `position_z`=-13.217, `orientation`=5.37561 WHERE `guid`=2875; -- Nethergarde Miner
UPDATE `creature` SET `position_x`=-3702.63, `position_y`=-1581.64, `position_z`=92.164, `orientation`=5.26963 WHERE `guid`=14468; -- Razormane Seer
UPDATE `creature` SET `position_x`=-3896, `position_y`=-1638.56, `position_z`=91.7917, `orientation`=1.81753 WHERE `guid`=14852; -- Razormane Seer
UPDATE `creature` SET `position_x`=-3904.11, `position_y`=-1655.46, `position_z`=91.8307, `orientation`=0.610865 WHERE `guid`=14907; -- Razormane Warfrenzy
UPDATE `creature` SET `position_x`=876.666, `position_y`=-503.852, `position_z`=96.7068, `orientation`=0.0349066 WHERE `guid`=53883; -- Stormpike Battleguard
UPDATE `creature` SET `position_x`=1889.6, `position_y`=-1585.37, `position_z`=59.2933, `orientation`=1.86627 WHERE `guid`=48180; -- Skeletal Terror
UPDATE `creature` SET `position_x`=1864.63, `position_y`=-1581.04, `position_z`=59.3816, `orientation`=0.902867 WHERE `guid`=45316; -- Blighted Zombie
UPDATE `creature` SET `position_x`=1905, `position_y`=-1616.26, `position_z`=60.6406, `orientation`=1.52491 WHERE `guid`=47600; -- Rotting Cadaver
UPDATE `creature` SET `position_x`=823.222, `position_y`=-334.283, `position_z`=65.6306, `orientation`=4.88692 WHERE `guid`=301605; -- Irondeep Miner
UPDATE `creature` SET `position_x`=821.006, `position_y`=-387.635, `position_z`=49.0728, `orientation`=3.15905 WHERE `guid`=301687; -- Irondeep Miner
UPDATE `creature` SET `position_x`=-849.416, `position_y`=-93.4279, `position_z`=68.5984, `orientation`=3.22886 WHERE `guid`=150705; -- Masha Swiftcut
UPDATE `creature` SET `position_x`=-5093.57, `position_y`=-2278.03, `position_z`=-54.8101, `orientation`=2.01969 WHERE `guid`=20981; -- Galak Windchaser
UPDATE `creature` SET `position_x`=971.671, `position_y`=-442.657, `position_z`=57.6951, `orientation`=3.1765 WHERE `guid`=150758; -- Irondeep Miner
UPDATE `creature` SET `position_x`=969.979, `position_y`=-457.148, `position_z`=58.1119, `orientation`=4.5204 WHERE `guid`=150759; -- Irondeep Miner
UPDATE `creature` SET `position_x`=-27.4214, `position_y`=-427.44, `position_z`=-18.8517, `orientation`=2.11185 WHERE `guid`=43764; -- Firebrand Grunt
UPDATE `creature` SET `position_x`=2229.05, `position_y`=316.777, `position_z`=36.7124, `orientation`=5.07458 WHERE `guid`=38290; -- Oliver Dwor
UPDATE `creature` SET `position_x`=2253.21, `position_y`=269.817, `position_z`=34.3704, `orientation`=2.394 WHERE `guid`=38291; -- Mrs. Winters
UPDATE `creature` SET `position_x`=2316.85, `position_y`=288.22, `position_z`=37.3107, `orientation`=4.11745 WHERE `guid`=31921; -- Jamie Nore
UPDATE `creature` SET `position_x`=-4442.12, `position_y`=250.631, `position_z`=39.1908, `orientation`=1.97222 WHERE `guid`=89412; -- Winter Reveler
UPDATE `creature` SET `position_x`=1707.26, `position_y`=896.115, `position_z`=9.00179, `orientation`=4.11149 WHERE `guid`=81449; -- Sandfury Blood Drinker
UPDATE `creature` SET `position_x`=-7161.96, `position_y`=-3844.55, `position_z`=8.79961, `orientation`=6.00393 WHERE `guid`=90180; -- Winter Reveler
UPDATE `creature` SET `position_x`=-7161.96, `position_y`=-3844.55, `position_z`=8.79961, `orientation`=6.00393 WHERE `guid`=90181; -- Winter Reveler
UPDATE `creature` SET `position_x`=-7163.59, `position_y`=-3913.28, `position_z`=9.60794, `orientation`=0.15708 WHERE `guid`=54903; -- Wonderform Operator
UPDATE `creature` SET `position_x`=-6974.51, `position_y`=-1503.42, `position_z`=242.747, `orientation`=3.33401 WHERE `guid`=6766; -- Dark Iron Lookout
UPDATE `creature` SET `position_x`=-1685.71, `position_y`=-4324.92, `position_z`=3.38441, `orientation`=4.1493 WHERE `guid`=14358; -- Affray Spectator
UPDATE `creature` SET `position_x`=832.035, `position_y`=-389.301, `position_z`=47.5567, `orientation`=2.11185 WHERE `guid`=301619; -- Irondeep Skullthumper
UPDATE `creature` SET `position_x`=-193.435, `position_y`=-317.738, `position_z`=64.4244, `orientation`=4.03207 WHERE `guid`=40250; -- Bloodaxe Worg Pup
UPDATE `creature` SET `position_x`=-4164.79, `position_y`=-2184.84, `position_z`=50.8403, `orientation`=3.3319 WHERE `guid`=13632; -- Bael'dun Foreman
UPDATE `creature` SET `position_x`=-1504.44, `position_y`=-3828.96, `position_z`=23.4805, `orientation`=4.41829 WHERE `guid`=13767; -- Southsea Brigand
UPDATE `creature` SET `position_x`=1443.21, `position_y`=-2324.43, `position_z`=92.4784, `orientation`=3.38594 WHERE `guid`=33006; -- Horde Deforester
UPDATE `creature` SET `position_x`=119.263, `position_y`=491.5, `position_z`=44.1129, `orientation`=4.7655 WHERE `guid`=16791; -- Dalaran Worker
UPDATE `creature` SET `position_x`=2429.4, `position_y`=-3552.36, `position_z`=99.46, `orientation`=0.713366 WHERE `guid`=33059; -- Horde Shaman
UPDATE `creature` SET `position_x`=-6388.46, `position_y`=-3157.62, `position_z`=301.108, `orientation`=5.78551 WHERE `guid`=7813; -- Shadowforge Warrior
UPDATE `creature` SET `position_x`=-6150.28, `position_y`=-3072.16, `position_z`=226.715, `orientation`=1.86626 WHERE `guid`=7226; -- Shadowforge Surveyor
UPDATE `creature` SET `position_x`=-6117.47, `position_y`=-3020.24, `position_z`=220.615, `orientation`=5.63741 WHERE `guid`=7738; -- Shadowforge Digger
UPDATE `creature` SET `position_x`=-332.554, `position_y`=118.782, `position_z`=-53.638, `orientation`=3.41195 WHERE `guid`=30080; -- Stonevault Oracle
UPDATE `creature` SET `position_x`=218.521, `position_y`=-4717.09, `position_z`=15.1279, `orientation`=0.333576 WHERE `guid`=6388; -- Razor Hill Grunt
UPDATE `creature` SET `position_x`=417.283, `position_y`=-4617.47, `position_z`=54.0366, `orientation`=1.41628 WHERE `guid`=10274; -- Razor Hill Grunt
UPDATE `creature` SET `position_x`=-1106.15, `position_y`=-2789.08, `position_z`=91.7917, `orientation`=6.16686 WHERE `guid`=20512; -- Kolkar Stormer
UPDATE `creature` SET `position_x`=-1127.39, `position_y`=-2797.79, `position_z`=92.0895, `orientation`=4.61005 WHERE `guid`=13995; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1394.81, `position_y`=-2734.19, `position_z`=91.7917, `orientation`=4.67501 WHERE `guid`=13994; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-1418.23, `position_y`=-2739.58, `position_z`=91.7917, `orientation`=3.59305 WHERE `guid`=13997; -- Kolkar Bloodcharger
UPDATE `creature` SET `position_x`=-243.557, `position_y`=265.784, `position_z`=-50.3796, `orientation`=5.26895 WHERE `guid`=29658; -- Stonevault Oracle
UPDATE `creature` SET `position_x`=-40.8641, `position_y`=-553.058, `position_z`=16.2104, `orientation`=0.471239 WHERE `guid`=43557; -- Smolderthorn Axe Thrower
UPDATE `creature` SET `position_x`=4659.88, `position_y`=-5371.88, `position_z`=108.526, `orientation`=3.08305 WHERE `guid`=35265; -- Timbermaw Shaman
UPDATE `creature` SET `position_x`=7033.68, `position_y`=-2114.09, `position_z`=587.312, `orientation`=3.50811 WHERE `guid`=39117; -- Timbermaw Warder
UPDATE `creature` SET `position_x`=8011.8, `position_y`=-2501.53, `position_z`=493.184, `orientation`=0.0418172 WHERE `guid`=42730; -- Rabbit
UPDATE `creature` SET `position_x`=6513.88, `position_y`=-3138.96, `position_z`=573.008, `orientation`=5.46868 WHERE `guid`=41053; -- Winterfall Totemic
UPDATE `creature` SET `position_x`=-4523.56, `position_y`=337.528, `position_z`=35.3209, `orientation`=2.6529 WHERE `guid`=51467; -- Camp Mojache Brave
UPDATE `creature` SET `position_x`=-4755.54, `position_y`=848.648, `position_z`=143.535, `orientation`=2.43485 WHERE `guid`=50565; -- Woodpaw Alpha
UPDATE `creature` SET `position_x`=2370.36, `position_y`=-1181.8, `position_z`=90.8132, `orientation`=4.77953 WHERE `guid`=33034; -- Foulweald Den Watcher
UPDATE `creature` SET `position_x`=-1850.16, `position_y`=1778.95, `position_z`=68.026, `orientation`=4.53438 WHERE `guid`=27922; -- Nether Sister
UPDATE `creature` SET `position_x`=-637.976, `position_y`=-1757.5, `position_z`=92.8842, `orientation`=2.57684 WHERE `guid`=14225; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-524.51, `position_y`=-1851.75, `position_z`=91.7916, `orientation`=1.83026 WHERE `guid`=14228; -- Savannah Prowler
UPDATE `creature` SET `position_x`=536.011, `position_y`=-2803.2, `position_z`=91.7916, `orientation`=1.94777 WHERE `guid`=14247; -- Savannah Prowler
UPDATE `creature` SET `position_x`=552.054, `position_y`=-2817.32, `position_z`=92.3576, `orientation`=0.704734 WHERE `guid`=14189; -- Savannah Prowler
UPDATE `creature` SET `position_x`=580.297, `position_y`=-2824.99, `position_z`=91.7916, `orientation`=2.10103 WHERE `guid`=14150; -- Savannah Prowler
UPDATE `creature` SET `position_x`=593.562, `position_y`=-2869.37, `position_z`=91.7916, `orientation`=1.38075 WHERE `guid`=14160; -- Savannah Prowler
UPDATE `creature` SET `position_x`=582.606, `position_y`=-2848.97, `position_z`=91.7916, `orientation`=4.09633 WHERE `guid`=14149; -- Savannah Prowler
UPDATE `creature` SET `position_x`=612.303, `position_y`=-2934.28, `position_z`=91.7917, `orientation`=1.38665 WHERE `guid`=14170; -- Savannah Prowler
UPDATE `creature` SET `position_x`=1057.82, `position_y`=-3093.22, `position_z`=105.541, `orientation`=0.259788 WHERE `guid`=20781; -- Venture Co. Drudger
UPDATE `creature` SET `position_x`=1035.57, `position_y`=-3050.69, `position_z`=98.7341, `orientation`=1.40499 WHERE `guid`=20721; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=1062.22, `position_y`=-3083.49, `position_z`=105.125, `orientation`=2.19788 WHERE `guid`=20725; -- Venture Co. Mercenary
UPDATE `creature` SET `position_x`=-336.908, `position_y`=-1693.9, `position_z`=92.2039, `orientation`=0.300988 WHERE `guid`=14209; -- Savannah Prowler
UPDATE `creature` SET `position_x`=-555.068, `position_y`=-2966.62, `position_z`=91.7917, `orientation`=5.21747 WHERE `guid`=14391; -- Tarban Hearthgrain
UPDATE `creature` SET `position_x`=6496.8, `position_y`=-3139.72, `position_z`=571.407, `orientation`=5.47776 WHERE `guid`=41054; -- Winterfall Totemic
UPDATE `creature` SET `position_x`=-911.451, `position_y`=-2942.63, `position_z`=91.7917, `orientation`=3.46554 WHERE `guid`=20452; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-1186.66, `position_y`=-2001.55, `position_z`=91.7917, `orientation`=5.27057 WHERE `guid`=20481; -- Kolkar Wrangler
UPDATE `creature` SET `position_x`=-5395.75, `position_y`=1274.43, `position_z`=23.4646, `orientation`=3.32269 WHERE `guid`=50319; -- Gordunni Warlord
UPDATE `creature` SET `position_x`=-1782.99, `position_y`=944.433, `position_z`=92.7692, `orientation`=3.77525 WHERE `guid`=27122; -- Magram Marauder
UPDATE `creature` SET `position_x`=-1900.14, `position_y`=987.388, `position_z`=90.6667, `orientation`=3.64268 WHERE `guid`=27126; -- Magram Mauler
UPDATE `creature` SET `position_x`=-1896.35, `position_y`=1100, `position_z`=92.7145, `orientation`=5.72359 WHERE `guid`=27125; -- Magram Mauler
UPDATE `creature` SET `position_x`=-1801.12, `position_y`=1061.07, `position_z`=91.551, `orientation`=4.96538 WHERE `guid`=27120; -- Magram Marauder
UPDATE `creature` SET `position_x`=-4754.93, `position_y`=-2109.96, `position_z`=83.3396, `orientation`=1.26237 WHERE `guid`=21587; -- Arnak Grimtotem
UPDATE `creature` SET `position_x`=-5080.97, `position_y`=-2211.98, `position_z`=-54.8923, `orientation`=3.88134 WHERE `guid`=21713; -- Galak Wrangler
UPDATE `creature` SET `position_x`=-5066.2, `position_y`=-2297.94, `position_z`=-53.2635, `orientation`=1.33411 WHERE `guid`=21719; -- Galak Wrangler
UPDATE `creature` SET `position_x`=-5165.93, `position_y`=-2411.71, `position_z`=-49.2905, `orientation`=4.22394 WHERE `guid`=20999; -- Galak Windchaser
UPDATE `creature` SET `position_x`=-5199.06, `position_y`=-2418.99, `position_z`=-37.9507, `orientation`=2.38575 WHERE `guid`=20997; -- Galak Windchaser
UPDATE `creature` SET `position_x`=-34.5716, `position_y`=1204.3, `position_z`=98.7365, `orientation`=4.40914 WHERE `guid`=29122; -- Nijel's Point Guard
UPDATE `creature` SET `position_x`=1707.35, `position_y`=-2195.61, `position_z`=62.663, `orientation`=1.37721 WHERE `guid`=48380; -- Wailing Death
UPDATE `creature` SET `position_x`=1749.96, `position_y`=-2330.26, `position_z`=59.7745, `orientation`=5.75488 WHERE `guid`=46275; -- Haunting Vision
UPDATE `creature` SET `position_x`=1755.15, `position_y`=-2336.45, `position_z`=59.8217, `orientation`=3.89093 WHERE `guid`=45306; -- Wailing Death
UPDATE `creature` SET `position_x`=-7596.23, `position_y`=-4584.71, `position_z`=9.13502, `orientation`=3.76207 WHERE `guid`=23491; -- Wastewander Rogue
UPDATE `creature` SET `position_x`=1561.27, `position_y`=-1449.63, `position_z`=68.3028, `orientation`=3.80046 WHERE `guid`=52257; -- Searing Ghoul
UPDATE `creature` SET `position_x`=-28.0891, `position_y`=-551.84, `position_z`=151.23, `orientation`=1.9258 WHERE `guid`=17387; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-15.3858, `position_y`=-554.598, `position_z`=151.853, `orientation`=5.28572 WHERE `guid`=17549; -- Syndicate Footpad
UPDATE `creature` SET `position_x`=-436.629, `position_y`=-1419.2, `position_z`=101.858, `orientation`=0.239829 WHERE `guid`=16024; -- Syndicate Shadow Mage
UPDATE `creature` SET `position_x`=-502.003, `position_y`=-1350.05, `position_z`=53.6966, `orientation`=2.12663 WHERE `guid`=16107; -- Syndicate Rogue
UPDATE `creature` SET `position_x`=-598.399, `position_y`=-1473.32, `position_z`=53.7535, `orientation`=6.14599 WHERE `guid`=16029; -- Syndicate Watchman
UPDATE `creature` SET `position_x`=-3790.24, `position_y`=-857.93, `position_z`=11.5981, `orientation`=2.83579 WHERE `guid`=9527; -- Murndan Derth
UPDATE `creature` SET `position_x`=-3840.25, `position_y`=-837.344, `position_z`=16.9484, `orientation`=3.25592 WHERE `guid`=9519; -- Fremal Doohickey
UPDATE `creature` SET `position_x`=-3816.05, `position_y`=-831.402, `position_z`=9.4674, `orientation`=4.71071 WHERE `guid`=9535; -- Hargin Mundar
UPDATE `creature` SET `position_x`=-3804.59, `position_y`=-826.894, `position_z`=10.1774, `orientation`=2.30383 WHERE `guid`=90281; -- Winter Reveler
UPDATE `creature` SET `position_x`=-3775.48, `position_y`=-825.607, `position_z`=11.8737, `orientation`=4.15097 WHERE `guid`=9555; -- Menethil Sentry
UPDATE `creature` SET `position_x`=-3791.88, `position_y`=-840.344, `position_z`=9.97075, `orientation`=2.21175 WHERE `guid`=9446; -- First Mate Fitzsimmons
UPDATE `creature` SET `position_x`=-3744.08, `position_y`=-759.344, `position_z`=9.63053, `orientation`=4.0045 WHERE `guid`=9561; -- Menethil Sentry
UPDATE `creature` SET `position_x`=-3762.36, `position_y`=-733.714, `position_z`=8.04999, `orientation`=4.1978 WHERE `guid`=9504; -- Karl Boran
UPDATE `creature` SET `position_x`=-3756.07, `position_y`=-721.423, `position_z`=8.18982, `orientation`=4.02539 WHERE `guid`=9562; -- Stuart Fleming
UPDATE `creature` SET `position_x`=83.5659, `position_y`=461.148, `position_z`=43.5036, `orientation`=1.97544 WHERE `guid`=16859; -- Dalaran Summoner
UPDATE `creature` SET `position_x`=-53.0722, `position_y`=284.927, `position_z`=66.0425, `orientation`=3.51175 WHERE `guid`=17313; -- Kegan Darkmar
UPDATE `creature` SET `position_x`=-2910.48, `position_y`=-2571.71, `position_z`=33.953, `orientation`=0.470365 WHERE `guid`=10563; -- Mosshide Fenrunner
UPDATE `creature` SET `position_x`=-3646.35, `position_y`=-2610.42, `position_z`=52.0236, `orientation`=5.23397 WHERE `guid`=9790; -- Dragonmaw Shadowwarder
UPDATE `creature` SET `position_x`=-3654.72, `position_y`=-2602.44, `position_z`=52.0236, `orientation`=4.44534 WHERE `guid`=10581; -- Chieftain Nek'rosh
UPDATE `creature` SET `position_x`=-4709.5, `position_y`=-3077.39, `position_z`=309.185, `orientation`=0.849965 WHERE `guid`=9314; -- Tunnel Rat Kobold
UPDATE `creature` SET `position_x`=-6572.92, `position_y`=-2558.33, `position_z`=291.573, `orientation`=1.07734 WHERE `guid`=7858; -- Lesser Rock Elemental
UPDATE `creature` SET `position_x`=1772.56, `position_y`=675.448, `position_z`=43.9964, `orientation`=2.95356 WHERE `guid`=44874; -- Scarlet Zealot
UPDATE `creature` SET `position_x`=1481.84, `position_y`=-1417.99, `position_z`=67.7724, `orientation`=4.6511 WHERE `guid`=49619; -- Skeletal Warlord
UPDATE `creature` SET `position_x`=-5350, `position_y`=-2981.25, `position_z`=323.999, `orientation`=3.54212 WHERE `guid`=8736; -- Mountaineer Langarr
UPDATE `creature` SET `position_x`=-5348.27, `position_y`=-2961.9, `position_z`=323.761, `orientation`=3.5221 WHERE `guid`=8745; -- Mountaineer Ozmok
UPDATE `creature` SET `position_x`=1151.55, `position_y`=-763.216, `position_z`=-139.682, `orientation`=1.56238 WHERE `guid`=56720; -- Firelord
UPDATE `creature` SET `position_x`=684.124, `position_y`=-495.074, `position_z`=-213.798, `orientation`=2.28459 WHERE `guid`=56622; -- Firesworn
UPDATE `creature` SET `position_x`=688.943, `position_y`=-508.177, `position_z`=-214.46, `orientation`=4.83456 WHERE `guid`=56627; -- Firesworn
UPDATE `creature` SET `position_x`=643.798, `position_y`=-794.985, `position_z`=-208.605, `orientation`=0.976866 WHERE `guid`=91262; -- Lava Elemental
UPDATE `creature` SET `position_x`=600.711, `position_y`=-1108.11, `position_z`=-200.32, `orientation`=3.08242 WHERE `guid`=91259; -- Flameguard
UPDATE `creature` SET `position_x`=-9175.12, `position_y`=-2452.08, `position_z`=118.18, `orientation`=3.08051 WHERE `guid`=31811; -- Blackrock Grunt
UPDATE `creature` SET `position_x`=-9204.5, `position_y`=-2149.08, `position_z`=64.3446, `orientation`=4.6691 WHERE `guid`=6276; -- Gloria Femmel
UPDATE `creature` SET `position_x`=-10506.2, `position_y`=1066.89, `position_z`=55.2721, `orientation`=2.6529 WHERE `guid`=89537; -- Protector Bialon
UPDATE `creature` SET `position_x`=-10929.7, `position_y`=-925.137, `position_z`=72.1258, `orientation`=1.24738 WHERE `guid`=4331; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10935.5, `position_y`=-933.433, `position_z`=72.1258, `orientation`=3.78396 WHERE `guid`=4300; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-10926.8, `position_y`=-937.832, `position_z`=72.1169, `orientation`=1.33384 WHERE `guid`=4298; -- Nightbane Dark Runner
UPDATE `creature` SET `position_x`=-11102.5, `position_y`=-536.276, `position_z`=33.2065, `orientation`=5.0641 WHERE `guid`=4877; -- Defias Night Blade
UPDATE `creature` SET `position_x`=-11956.1, `position_y`=-490.749, `position_z`=30.4711, `orientation`=5.47399 WHERE `guid`=2204; -- Venture Co. Mechanic
UPDATE `creature` SET `position_x`=-11981.1, `position_y`=-488.592, `position_z`=24.1556, `orientation`=0.0734131 WHERE `guid`=2207; -- Venture Co. Geologist
UPDATE `creature` SET `position_x`=-11964.4, `position_y`=-470.048, `position_z`=17.1005, `orientation`=3.99502 WHERE `guid`=2193; -- Venture Co. Mechanic
UPDATE `creature` SET `position_x`=-11958.1, `position_y`=-483.815, `position_z`=17.0796, `orientation`=0.729954 WHERE `guid`=1846; -- Venture Co. Geologist
UPDATE `creature` SET `position_x`=-14461.9, `position_y`=491.803, `position_z`=15.2063, `orientation`=0.837758 WHERE `guid`=89380; -- Winter Reveler
UPDATE `creature` SET `position_x`=1801.05, `position_y`=720.193, `position_z`=48.9875, `orientation`=3.2828 WHERE `guid`=44582; -- Scarlet Zealot
UPDATE `creature` SET `position_x`=1311.86, `position_y`=-1609.57, `position_z`=62.1422, `orientation`=3.41361 WHERE `guid`=45234; -- Skeletal Acolyte
UPDATE `creature` SET `position_x`=-1239.67, `position_y`=-2512.96, `position_z`=22.2189, `orientation`=3.70311 WHERE `guid`=11263; -- Cedrik Prose
UPDATE `creature` SET `position_x`=258.417, `position_y`=-2009.81, `position_z`=178.211, `orientation`=4.24115 WHERE `guid`=92918; -- Wildhammer Sentry
UPDATE `creature` SET `position_x`=271.739, `position_y`=-2176.42, `position_z`=120.052, `orientation`=1.69297 WHERE `guid`=92917; -- Wildhammer Sentry
UPDATE `creature` SET `position_x`=-227.611, `position_y`=-4181.29, `position_z`=120.924, `orientation`=4.49118 WHERE `guid`=93601; -- Vilebranch Witch Doctor

UPDATE `creature` SET `position_x`=-11897.9, `position_y`=-1364.58, `position_z`=70.1878, `orientation`=2.65936 WHERE `guid`=49118; -- Razzashi Serpent
UPDATE `creature` SET `position_x`=-11951.1, `position_y`=-1072.8, `position_z`=92.8555, `orientation`=3.24016 WHERE `guid`=556; -- Hakkari Oracle
UPDATE `creature` SET `position_x`=-11950.2, `position_y`=-1021.91, `position_z`=67.7891, `orientation`=3.34362 WHERE `guid`=729; -- Gurubashi Warrior

UPDATE `creature` SET `position_x`=-11932.9, `position_y`=-1329.52, `position_z`=79.1473, `orientation`=3.6878 WHERE `guid`=49739; -- Razzashi Adder
UPDATE `creature` SET `position_x`=-11925.8, `position_y`=-1336.62, `position_z`=78.6494, `orientation`=1.17943 WHERE `guid`=49740; -- Razzashi Adder
UPDATE `creature` SET `position_x`=-11881.1, `position_y`=-1025.17, `position_z`=70.2129, `orientation`=4.24045 WHERE `guid`=732; -- Hakkari Oracle
UPDATE `creature` SET `position_x`=-11847.9, `position_y`=-988.341, `position_z`=70.005, `orientation`=6.12404 WHERE `guid`=747; -- Gurubashi Warrior
UPDATE `creature` SET `position_x`=-11882.3, `position_y`=-1015.74, `position_z`=69.5822, `orientation`=1.10973 WHERE `guid`=731; -- Gurubashi Warrior
UPDATE `creature` SET `position_x`=-11977.7, `position_y`=-1465.34, `position_z`=80.0486, `orientation`=5.11326 WHERE `guid`=49191; -- Bloodseeker Bat
UPDATE `creature` SET `position_x`=-11766.1, `position_y`=-1580.68, `position_z`=21.17, `orientation`=1.1063 WHERE `guid`=51395; -- Gurubashi Berserker
UPDATE `creature` SET `position_x`=-12051.5, `position_y`=-1427.27, `position_z`=130.142, `orientation`=1.19443 WHERE `guid`=49143; -- Bloodseeker Bat
UPDATE `creature` SET `position_x`=1496.24, `position_y`=-4805.26, `position_z`=10.0924, `orientation`=4.51881 WHERE `guid`=7337; -- Burning Blade Fanatic

UPDATE `creature` SET `position_x`=-7027.99, `position_y`=-1713.85, `position_z`=241.75, `orientation`=6.26573 WHERE `guid`=6806; -- Dark Iron Watchman
UPDATE `creature` SET `position_x`=-7026.23, `position_y`=-1723.19, `position_z`=241.764, `orientation`=3.69127 WHERE `guid`=6799; -- Dark Iron Geologist
UPDATE `creature` SET `position_x`=-7573.89, `position_y`=-1035.25, `position_z`=449.248, `orientation`=3.76991 WHERE `guid`=84387; -- Broodlord Lashlayer
UPDATE `creature` SET `position_x`=-7504.52, `position_y`=-1043.61, `position_z`=449.325, `orientation`=5.84685 WHERE `guid`=84555; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7547.72, `position_y`=-1014.95, `position_z`=449.325, `orientation`=2.11185 WHERE `guid`=84535; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7547.72, `position_y`=-1014.95, `position_z`=449.325, `orientation`=2.11185 WHERE `guid`=84539; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7471.38, `position_y`=-988.328, `position_z`=449.845, `orientation`=5.53269 WHERE `guid`=84590; -- Death Talon Overseer
UPDATE `creature` SET `position_x`=-7461.63, `position_y`=-985.513, `position_z`=449.782, `orientation`=4.13643 WHERE `guid`=84591; -- Death Talon Overseer
UPDATE `creature` SET `position_x`=-7453.04, `position_y`=-954.129, `position_z`=465.067, `orientation`=3.61283 WHERE `guid`=300983; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7435.87, `position_y`=-1052.21, `position_z`=477.018, `orientation`=0.750492 WHERE `guid`=84639; -- Death Talon Wyrmguard
UPDATE `creature` SET `position_x`=-7405.67, `position_y`=-964.438, `position_z`=465.031, `orientation`=2.00713 WHERE `guid`=84635; -- Death Talon Wyrmguard
UPDATE `creature` SET `position_x`=-7398.46, `position_y`=-967.079, `position_z`=465.055, `orientation`=3.89208 WHERE `guid`=84627; -- Master Elemental Shaper Krixix
UPDATE `creature` SET `position_x`=-7396.24, `position_y`=-961.435, `position_z`=465.044, `orientation`=2.25148 WHERE `guid`=84634; -- Death Talon Wyrmguard
UPDATE `creature` SET `position_x`=-7388.2, `position_y`=-955.983, `position_z`=465.047, `orientation`=2.33874 WHERE `guid`=84628; -- Death Talon Wyrmguard
UPDATE `creature` SET `position_x`=-7408.65, `position_y`=-917.047, `position_z`=465.067, `orientation`=0.418879 WHERE `guid`=85612; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7523.28, `position_y`=-1060.82, `position_z`=449.325, `orientation`=4.72984 WHERE `guid`=84547; -- Blackwing Technician

UPDATE `creature` SET `position_x`=-7551.43, `position_y`=-1040.67, `position_z`=449.325, `orientation`=3.08923 WHERE `guid`=300986; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7513.05, `position_y`=-1051.5, `position_z`=449.325, `orientation`=5.53269 WHERE `guid`=84550; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7527.01, `position_y`=-967.031, `position_z`=449.325, `orientation`=1.90241 WHERE `guid`=84563; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7459.26, `position_y`=-995.384, `position_z`=449.784, `orientation`=2.3911 WHERE `guid`=84589; -- Death Talon Overseer
UPDATE `creature` SET `position_x`=-7524.24, `position_y`=-916.833, `position_z`=457.659, `orientation`=1.85005 WHERE `guid`=84606; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7571.69, `position_y`=-1088.25, `position_z`=413.465, `orientation`=2.16421 WHERE `guid`=84388; -- Razorgore the Untamed
UPDATE `creature` SET `position_x`=-7419.28, `position_y`=-895.444, `position_z`=465.067, `orientation`=0.907571 WHERE `guid`=85625; -- Blackwing Technician
UPDATE `creature` SET `position_x`=-7453.61, `position_y`=-860.511, `position_z`=465.067, `orientation`=1.22173 WHERE `guid`=84762; -- Blackwing Technician


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
