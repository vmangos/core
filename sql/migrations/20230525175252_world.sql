DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230525175252');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230525175252');
-- Add your query below.


-- Fix creature spawns below the ground.
DELETE FROM `creature` WHERE `id`=15214;
DELETE FROM `creature` WHERE `guid` IN (31499, 73686);
UPDATE `creature` SET `position_z`=27.243 WHERE `guid`=24976;
UPDATE `creature` SET `position_z`=25.684 WHERE `guid`=12372;
UPDATE `creature` SET `position_z`=29.677 WHERE `guid`=6511;
UPDATE `creature` SET `position_z`=-1.484 WHERE `guid`=44210;
UPDATE `creature` SET `position_z`=161.643 WHERE `guid`=91830;
UPDATE `creature` SET `position_z`=-76.181 WHERE `guid`=31844;
UPDATE `creature` SET `position_z`=-1.896 WHERE `guid`=9492;
UPDATE `creature` SET `position_z`=20.043 WHERE `guid`=756;
UPDATE `creature` SET `position_z`=-0.694 WHERE `guid`=35252;
UPDATE `creature` SET `position_z`=-0.256 WHERE `guid`=35230;
UPDATE `creature` SET `position_z`=-0.326 WHERE `guid`=37590;
UPDATE `creature` SET `position_z`=53.151 WHERE `guid`=50771;
UPDATE `creature` SET `position_z`=-2.230 WHERE `guid`=50112;
UPDATE `creature` SET `position_z`=31.245 WHERE `guid`=23411;
UPDATE `creature` SET `position_z`=78.332 WHERE `guid`=33569;
UPDATE `creature` SET `position_z`=-15.197 WHERE `guid`=25623;
UPDATE `creature` SET `position_z`=69.256 WHERE `guid`=25347;
UPDATE `creature` SET `position_z`=725.108 WHERE `guid`=40985;
UPDATE `creature` SET `position_z`=38.763 WHERE `guid`=31705;
UPDATE `creature` SET `position_z`=45.457 WHERE `guid`=31516;
UPDATE `creature` SET `position_z`=18.235 WHERE `guid`=35968;
UPDATE `creature` SET `position_x`=-309.066, `position_y`=-3159.099, `position_z`=216.378 WHERE `guid`=19590;
UPDATE `creature` SET `position_x`=-11072.042, `position_y`=-467.183, `position_z`=31.024 WHERE `guid`=4319;
UPDATE `creature` SET `position_x`=2985.889, `position_y`=-1453.671, `position_z`=146.363 WHERE `guid`=48206;
UPDATE `creature` SET `position_x`=-3656.159, `position_y`=-941.989, `position_z`=-5.205 WHERE `guid`=9681;
UPDATE `creature` SET `position_x`=-3278.138, `position_y`=-1853.003, `position_z`=94.085 WHERE `guid`=19769;
UPDATE `creature` SET `position_x`=-12899.201, `position_y`=-316.159, `position_z`=13.071 WHERE `guid`=2048;
UPDATE `creature` SET `position_x`=2167.887, `position_y`=-5154.883, `position_z`=79.253 WHERE `guid`=92484;
UPDATE `creature` SET `position_x`=-9666.823, `position_y`=-3967.156, `position_z`=-2.797 WHERE `guid`=37591;
UPDATE `creature` SET `position_x`=-9701.891, `position_y`=-4032.827, `position_z`=-2.389 WHERE `guid`=32692;
UPDATE `creature` SET `position_x`=-9734.043, `position_y`=-4065.487, `position_z`=-2.943 WHERE `guid`=34158;
UPDATE `creature` SET `position_x`=-5425.393, `position_y`=35.437, `position_z`=421.744 WHERE `guid`=3144;
UPDATE `creature` SET `position_x`=-5950.288, `position_y`=6.861, `position_z`=372.184 WHERE `guid`=299;
UPDATE `creature` SET `position_x`=-10331.842, `position_y`=193.005, `position_z`=34.174 WHERE `guid`=4979;
UPDATE `creature` SET `position_x`=-5075.499, `position_y`=-1046.237, `position_z`=-3.101 WHERE `guid`=21128;
UPDATE `creature` SET `position_x`=-5688.776, `position_y`=3643.666, `position_z`=-14.521 WHERE `guid`=51494;
UPDATE `creature` SET `position_x`=-3394.369, `position_y`=2363.804, `position_z`=40.064 WHERE `guid`=50770;
UPDATE `creature` SET `position_x`=770.507, `position_y`=193.557, `position_z`=54.894 WHERE `guid`=29860;
UPDATE `creature` SET `position_x`=-4959.193, `position_y`=328.036, `position_z`=20.583 WHERE `guid`=50458;
UPDATE `creature` SET `position_x`=-1744.545, `position_y`=-890.924, `position_z`=68.477 WHERE `guid`=25174;
UPDATE `creature` SET `position_x`=-761.264, `position_y`=-4585.398, `position_z`=50.101 WHERE `guid`=10354;
UPDATE `creature` SET `position_x`=981.594, `position_y`=-4973.444, `position_z`=13.807 WHERE `guid`=12104;
UPDATE `creature` SET `position_x`=2409.833, `position_y`=1827.876, `position_z`=348.049 WHERE `guid`=32205;
UPDATE `creature` SET `position_x`=3490.822, `position_y`=-5213.993, `position_z`=86.585 WHERE `guid`=35481;
UPDATE `creature` SET `position_x`=2563.566, `position_y`=-783.580, `position_z`=150.244 WHERE `guid`=32662;
UPDATE `creature` SET `position_x`=7216.264, `position_y`=-580.530, `position_z`=36.590 WHERE `guid`=37219;
UPDATE `creature` SET `position_x`=587.300, `position_y`=-4109.714, `position_z`=18.117 WHERE `guid`=7636;
UPDATE `creature` SET `position_x`=-448.240, `position_y`=-4480.225, `position_z`=50.550 WHERE `guid`=4698;
UPDATE `creature` SET `position_x`=4388.385, `position_y`=454.669, `position_z`=60.994 WHERE `guid`=36794;
UPDATE `creature` SET `position_x`=7058.011, `position_y`=-285.369, `position_z`=42.324 WHERE `guid`=37233;
UPDATE `creature` SET `position_x`=6594.247, `position_y`=317.664, `position_z`=29.145 WHERE `guid`=36643;
UPDATE `creature` SET `position_x`=5196.987, `position_y`=150.080, `position_z`=58.705 WHERE `guid`=36856;
UPDATE `creature` SET `position_x`=2168.220, `position_y`=-1085.590, `position_z`=102.340 WHERE `guid`=34283;
UPDATE `creature` SET `position_x`=2508.687, `position_y`=-1298.673, `position_z`=144.493 WHERE `guid`=34669;
UPDATE `creature` SET `position_x`=-7221.427, `position_y`=352.717, `position_z`=41.148 WHERE `guid`=43164;
UPDATE `creature` SET `position_x`=7759.802, `position_y`=-2366.841, `position_z`=456.191 WHERE `guid`=42503;
UPDATE `creature` SET `position_x`=-4125.746, `position_y`=-3868.206, `position_z`=64.005 WHERE `guid`=18637;
UPDATE `creature` SET `position_x`=3665.732, `position_y`=141.779, `position_z`=6.094 WHERE `guid`=34960;
UPDATE `creature` SET `position_x`=6779.953, `position_y`=-410.691, `position_z`=43.582 WHERE `guid`=37194;
UPDATE `creature` SET `position_x`=2845.330, `position_y`=-3527.538, `position_z`=108.782 WHERE `guid`=34914;
UPDATE `creature_template` SET `inhabit_type`=2 WHERE `entry`=6145;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
