DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210525183943');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210525183943');
-- Add your query below.


-- Correct position of Copper Vein in Duskwood (position is off by 0.995001 yards).
UPDATE `gameobject` SET `position_x`=-11125.1, `position_y`=-774.882, `position_z`=59.6363, `orientation`=1.48353, `rotation0`=0, `rotation1`=0, `rotation2`=0.67559, `rotation3`=0.737278 WHERE `guid`=4946;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5771, `position_y`=-653.592, `position_z`=403.583, `orientation`=6.02139, `rotation0`=0, `rotation1`=0, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=10675;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.608817 yards).
UPDATE `gameobject` SET `position_x`=-6015.35, `position_y`=-577.502, `position_z`=414.565, `orientation`=1.6057, `rotation0`=0, `rotation1`=0, `rotation2`=0.719339, `rotation3`=0.694659 WHERE `guid`=13214;

-- Correct position of Copper Vein in Duskwood (position is off by 0.000102997 yards).
UPDATE `gameobject` SET `position_x`=-10557.2, `position_y`=-760.492, `position_z`=60.5832, `orientation`=5.23599, `rotation0`=0, `rotation1`=0, `rotation2`=-0.5, `rotation3`=0.866025 WHERE `guid`=33462;

-- Correct position of Copper Vein in Mulgore (position is off by 1.51343 yards).
UPDATE `gameobject` SET `position_x`=-2762.56, `position_y`=-633.859, `position_z`=21.2799, `orientation`=0.541051, `rotation0`=0, `rotation1`=0, `rotation2`=0.267238, `rotation3`=0.963631 WHERE `guid`=5219;

-- Correct position of Copper Vein in Mulgore (position is off by 0.551459 yards).
UPDATE `gameobject` SET `position_x`=-2436.57, `position_y`=-1486.68, `position_z`=38.845, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=4981;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.0540009 yards).
UPDATE `gameobject` SET `position_x`=1572.45, `position_y`=1415.66, `position_z`=194.04, `orientation`=0.401425, `rotation0`=0, `rotation1`=0, `rotation2`=0.199367, `rotation3`=0.979925 WHERE `guid`=4967;

-- Correct position of Copper Vein in Darkshore (position is off by 1.49882 yards).
UPDATE `gameobject` SET `position_x`=6176.48, `position_y`=463.119, `position_z`=24.8209, `orientation`=5.07891, `rotation0`=0, `rotation1`=0, `rotation2`=-0.566406, `rotation3`=0.824126 WHERE `guid`=5335;

-- Correct position of Copper Vein in Wetlands (position is off by 0.067148 yards).
UPDATE `gameobject` SET `position_x`=-3833.94, `position_y`=-2866.97, `position_z`=3.53475, `orientation`=3.24635, `rotation0`=0, `rotation1`=0, `rotation2`=-0.998629, `rotation3`=0.0523532 WHERE `guid`=5207;

-- Correct position of Copper Vein in Hillsbrad Foothills (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-502.591, `position_y`=-828.237, `position_z`=53.3549, `orientation`=3.03684, `rotation0`=0, `rotation1`=0, `rotation2`=0.998629, `rotation3`=0.0523532 WHERE `guid`=30030;

-- Correct position of Copper Vein in Desolace (position is off by 0.935125 yards).
UPDATE `gameobject` SET `position_x`=-114.647, `position_y`=1298.89, `position_z`=93.6003, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=5416;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.835202 yards).
UPDATE `gameobject` SET `position_x`=-5899.41, `position_y`=-2972.41, `position_z`=371.663, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=5113;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5517.81, `position_y`=-2731.01, `position_z`=366.158, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=30104;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5633.04, `position_y`=-1751.15, `position_z`=358.066, `orientation`=5.61996, `rotation0`=0, `rotation1`=0, `rotation2`=-0.325567, `rotation3`=0.945519 WHERE `guid`=10852;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5640.9, `position_y`=-1706.94, `position_z`=362.448, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=10853;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.472992 yards).
UPDATE `gameobject` SET `position_x`=2368.37, `position_y`=-502.473, `position_z`=116.287, `orientation`=5.06146, `rotation0`=0, `rotation1`=0, `rotation2`=-0.573576, `rotation3`=0.819152 WHERE `guid`=5072;

-- Correct position of Copper Vein in Ashenvale (position is off by 4.47922 yards).
UPDATE `gameobject` SET `position_x`=2546.06, `position_y`=-1335.72, `position_z`=161.544, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=4891;

-- Correct position of Copper Vein in Duskwood (position is off by 0.200196 yards).
UPDATE `gameobject` SET `position_x`=-10519.2, `position_y`=677.127, `position_z`=15.6123, `orientation`=2.58308, `rotation0`=0, `rotation1`=0, `rotation2`=0.961261, `rotation3`=0.27564 WHERE `guid`=5412;

-- Correct position of Copper Vein in The Barrens (position is off by 0.516434 yards).
UPDATE `gameobject` SET `position_x`=-1530.36, `position_y`=-3934.37, `position_z`=11.9037, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4682;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-5600.42, `position_y`=-744.175, `position_z`=434.065, `orientation`=1.79769, `rotation0`=0, `rotation1`=0, `rotation2`=0.782608, `rotation3`=0.622515 WHERE `guid`=10695;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5334.67, `position_y`=-659.969, `position_z`=394.836, `orientation`=5.41052, `rotation0`=0, `rotation1`=0, `rotation2`=-0.422618, `rotation3`=0.906308 WHERE `guid`=10682;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.513476 yards).
UPDATE `gameobject` SET `position_x`=-5711.03, `position_y`=-3176.5, `position_z`=321.307, `orientation`=5.77704, `rotation0`=0, `rotation1`=0, `rotation2`=-0.25038, `rotation3`=0.968148 WHERE `guid`=4779;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00981741 yards).
UPDATE `gameobject` SET `position_x`=-5692.69, `position_y`=-3123.95, `position_z`=316.19, `orientation`=4.18879, `rotation0`=0, `rotation1`=0, `rotation2`=-0.866025, `rotation3`=0.500001 WHERE `guid`=29972;

-- Correct position of Copper Vein in Mulgore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-2299.02, `position_y`=385.609, `position_z`=58.3092, `orientation`=2.67035, `rotation0`=0, `rotation1`=0, `rotation2`=0.972369, `rotation3`=0.233448 WHERE `guid`=20716;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.541047 yards).
UPDATE `gameobject` SET `position_x`=924.105, `position_y`=1489.77, `position_z`=14.2401, `orientation`=0.575957, `rotation0`=0, `rotation1`=0, `rotation2`=0.284015, `rotation3`=0.95882 WHERE `guid`=5204;

-- Correct position of Copper Vein in Darkshore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=7358.84, `position_y`=117.991, `position_z`=12.6753, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104535 WHERE `guid`=48666;

-- Correct position of Copper Vein in Darkshore (position is off by 1.12695 yards).
UPDATE `gameobject` SET `position_x`=7470.96, `position_y`=-1033.38, `position_z`=16.8551, `orientation`=3.31614, `rotation0`=0, `rotation1`=0, `rotation2`=-0.996194, `rotation3`=0.087165 WHERE `guid`=4965;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.653885 yards).
UPDATE `gameobject` SET `position_x`=-9052.53, `position_y`=-2680.67, `position_z`=132.473, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=4761;

-- Correct position of Copper Vein in Darkshore (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=4787.54, `position_y`=766.542, `position_z`=8.5393, `orientation`=1.20428, `rotation0`=0, `rotation1`=0, `rotation2`=0.566406, `rotation3`=0.824126 WHERE `guid`=31357;

-- Correct position of Copper Vein in Mulgore (position is off by 1.54785 yards).
UPDATE `gameobject` SET `position_x`=-2766.59, `position_y`=-204.171, `position_z`=22.2618, `orientation`=1.41372, `rotation0`=0, `rotation1`=0, `rotation2`=0.649447, `rotation3`=0.760406 WHERE `guid`=5153;

-- Correct position of Copper Vein in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3307.13, `position_y`=-2266.09, `position_z`=93.2679, `orientation`=1.83259, `rotation0`=0, `rotation1`=0, `rotation2`=0.793353, `rotation3`=0.608762 WHERE `guid`=15178;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=2585.54, `position_y`=-1074.56, `position_z`=131.414, `orientation`=2.35619, `rotation0`=0, `rotation1`=0, `rotation2`=0.92388, `rotation3`=0.382683 WHERE `guid`=33545;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.569604 yards).
UPDATE `gameobject` SET `position_x`=-5091.79, `position_y`=-3324.24, `position_z`=280.257, `orientation`=3.78737, `rotation0`=0, `rotation1`=0, `rotation2`=-0.948323, `rotation3`=0.317306 WHERE `guid`=4953;

-- Correct position of Copper Vein in The Barrens (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=1385.21, `position_y`=-3485.35, `position_z`=95.085, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=15452;

-- Correct position of Copper Vein in The Barrens (position is off by 0.557427 yards).
UPDATE `gameobject` SET `position_x`=814.53, `position_y`=-3039.36, `position_z`=98.4465, `orientation`=4.7473, `rotation0`=0, `rotation1`=0, `rotation2`=-0.694658, `rotation3`=0.71934 WHERE `guid`=5046;

-- Correct position of Copper Vein in The Barrens (position is off by 0.609834 yards).
UPDATE `gameobject` SET `position_x`=-1066.33, `position_y`=-2085.51, `position_z`=57.133, `orientation`=2.44346, `rotation0`=0, `rotation1`=0, `rotation2`=0.939692, `rotation3`=0.342021 WHERE `guid`=5077;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.163744 yards).
UPDATE `gameobject` SET `position_x`=-5682.08, `position_y`=-3400.04, `position_z`=-39.1371, `orientation`=2.02458, `rotation0`=0, `rotation1`=0, `rotation2`=0.848047, `rotation3`=0.529921 WHERE `guid`=4805;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-5720.23, `position_y`=-3154.99, `position_z`=-28.4684, `orientation`=5.68977, `rotation0`=0, `rotation1`=0, `rotation2`=-0.292372, `rotation3`=0.956305 WHERE `guid`=17095;

-- Correct position of Copper Vein in The Barrens (position is off by 2.06483 yards).
UPDATE `gameobject` SET `position_x`=-2595.26, `position_y`=-2242.73, `position_z`=109.43, `orientation`=1.43117, `rotation0`=0, `rotation1`=0, `rotation2`=0.656058, `rotation3`=0.75471 WHERE `guid`=5175;

-- Correct position of Copper Vein in The Barrens (position is off by 0.709093 yards).
UPDATE `gameobject` SET `position_x`=-1345.16, `position_y`=-2232.31, `position_z`=98.6866, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=4918;

-- Correct position of Copper Vein in Durotar (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=518.5, `position_y`=-4760.18, `position_z`=29.9781, `orientation`=0.785397, `rotation0`=0, `rotation1`=0, `rotation2`=0.382683, `rotation3`=0.92388 WHERE `guid`=12487;

-- Correct position of Copper Vein in Durotar (position is off by 0.481844 yards).
UPDATE `gameobject` SET `position_x`=802.221, `position_y`=-4834.63, `position_z`=37.9759, `orientation`=3.49067, `rotation0`=0, `rotation1`=0, `rotation2`=-0.984807, `rotation3`=0.173652 WHERE `guid`=5321;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.406907 yards).
UPDATE `gameobject` SET `position_x`=-4838.35, `position_y`=-3140.2, `position_z`=318.547, `orientation`=4.92183, `rotation0`=0, `rotation1`=0, `rotation2`=-0.62932, `rotation3`=0.777146 WHERE `guid`=4980;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.0100573 yards).
UPDATE `gameobject` SET `position_x`=-5407.56, `position_y`=-3421.5, `position_z`=285.105, `orientation`=1.88495, `rotation0`=0, `rotation1`=0, `rotation2`=0.809016, `rotation3`=0.587786 WHERE `guid`=12890;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.523866 yards).
UPDATE `gameobject` SET `position_x`=-9623.88, `position_y`=-2158.55, `position_z`=69.8939, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104535 WHERE `guid`=5026;

-- Correct position of Copper Vein in Durotar (position is off by 1.44345 yards).
UPDATE `gameobject` SET `position_x`=1127.29, `position_y`=-4691.03, `position_z`=19.824, `orientation`=3.99681, `rotation0`=0, `rotation1`=0, `rotation2`=-0.909961, `rotation3`=0.414694 WHERE `guid`=4693;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1056.58, `position_y`=-4808.49, `position_z`=21.7389, `orientation`=4.24115, `rotation0`=0, `rotation1`=0, `rotation2`=-0.85264, `rotation3`=0.522499 WHERE `guid`=12485;

-- Correct position of Copper Vein in Durotar (position is off by 0.514555 yards).
UPDATE `gameobject` SET `position_x`=418.199, `position_y`=-4938.16, `position_z`=37.4955, `orientation`=5.39307, `rotation0`=0, `rotation1`=0, `rotation2`=-0.43051, `rotation3`=0.902586 WHERE `guid`=5337;

-- Correct position of Copper Vein in Durotar (position is off by 0.817802 yards).
UPDATE `gameobject` SET `position_x`=-317.643, `position_y`=-4847.5, `position_z`=40.5401, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=5167;

-- Correct position of Copper Vein in The Barrens (position is off by 1.42964 yards).
UPDATE `gameobject` SET `position_x`=-1708.53, `position_y`=-3470.65, `position_z`=96.6088, `orientation`=4.90438, `rotation0`=0, `rotation1`=0, `rotation2`=-0.636078, `rotation3`=0.771625 WHERE `guid`=4648;

-- Correct position of Copper Vein in Durotar (position is off by 0.802896 yards).
UPDATE `gameobject` SET `position_x`=713.16, `position_y`=-4010.18, `position_z`=9.61455, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=4925;

-- Correct position of Copper Vein in The Barrens (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-2575.44, `position_y`=-2387.76, `position_z`=104.146, `orientation`=5.8294, `rotation0`=0, `rotation1`=0, `rotation2`=-0.224951, `rotation3`=0.97437 WHERE `guid`=15682;

-- Correct position of Copper Vein in Thousand Needles (position is off by 1.15463 yards).
UPDATE `gameobject` SET `position_x`=-5208.44, `position_y`=-1578.95, `position_z`=-38.6578, `orientation`=5.51524, `rotation0`=0, `rotation1`=0, `rotation2`=-0.374606, `rotation3`=0.927184 WHERE `guid`=4774;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-4728.94, `position_y`=-3142.43, `position_z`=302.941, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=30022;

-- Correct position of Copper Vein in Durotar (position is off by 0.854652 yards).
UPDATE `gameobject` SET `position_x`=1133.49, `position_y`=-4584.18, `position_z`=28.9594, `orientation`=2.79252, `rotation0`=0, `rotation1`=0, `rotation2`=0.984807, `rotation3`=0.173652 WHERE `guid`=5318;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.268355 yards).
UPDATE `gameobject` SET `position_x`=742.61, `position_y`=1032.95, `position_z`=56.357, `orientation`=1.41372, `rotation0`=0, `rotation1`=0, `rotation2`=0.649447, `rotation3`=0.760406 WHERE `guid`=5460;

-- Correct position of Copper Vein in Durotar (position is off by 1.7284 yards).
UPDATE `gameobject` SET `position_x`=924.899, `position_y`=-3979.97, `position_z`=26.1475, `orientation`=3.97936, `rotation0`=0, `rotation1`=0, `rotation2`=-0.913545, `rotation3`=0.406738 WHERE `guid`=5191;

-- Correct position of Copper Vein in Durotar (position is off by 0.00982059 yards).
UPDATE `gameobject` SET `position_x`=733.338, `position_y`=-4104.1, `position_z`=-9.99905, `orientation`=1.27409, `rotation0`=0, `rotation1`=0, `rotation2`=0.594822, `rotation3`=0.803857 WHERE `guid`=12377;

-- Correct position of Copper Vein in Durotar (position is off by 0.100098 yards).
UPDATE `gameobject` SET `position_x`=389.877, `position_y`=-4049.1, `position_z`=38.8331, `orientation`=6.0912, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0958452, `rotation3`=0.995396 WHERE `guid`=4745;

-- Correct position of Copper Vein in Durotar (position is off by 1.4227 yards).
UPDATE `gameobject` SET `position_x`=251.159, `position_y`=-3871.59, `position_z`=39.2736, `orientation`=0.331611, `rotation0`=0, `rotation1`=0, `rotation2`=0.165047, `rotation3`=0.986286 WHERE `guid`=5343;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.763881 yards).
UPDATE `gameobject` SET `position_x`=-5464.75, `position_y`=-3190.14, `position_z`=335.181, `orientation`=1.22173, `rotation0`=0, `rotation1`=0, `rotation2`=0.573576, `rotation3`=0.819152 WHERE `guid`=5130;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 0.000991821 yards).
UPDATE `gameobject` SET `position_x`=-9758.44, `position_y`=140.714, `position_z`=21.5286, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=32463;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9736.79, `position_y`=87.749, `position_z`=12.8907, `orientation`=3.64774, `rotation0`=0, `rotation1`=0, `rotation2`=-0.968147, `rotation3`=0.250381 WHERE `guid`=32461;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 2.79444 yards).
UPDATE `gameobject` SET `position_x`=-9856.54, `position_y`=242.269, `position_z`=24.5645, `orientation`=5.58505, `rotation0`=0, `rotation1`=0, `rotation2`=-0.34202, `rotation3`=0.939693 WHERE `guid`=40006;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.552061 yards).
UPDATE `gameobject` SET `position_x`=710.791, `position_y`=1538.67, `position_z`=69.1527, `orientation`=1.46608, `rotation0`=0, `rotation1`=0, `rotation2`=0.66913, `rotation3`=0.743145 WHERE `guid`=5357;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9697.58, `position_y`=-1754.86, `position_z`=62.2564, `orientation`=3.61284, `rotation0`=0, `rotation1`=0, `rotation2`=-0.972369, `rotation3`=0.233448 WHERE `guid`=31115;

-- Correct position of Copper Vein in The Barrens (position is off by 1.06943 yards).
UPDATE `gameobject` SET `position_x`=-1789.58, `position_y`=-1929.02, `position_z`=122.134, `orientation`=4.67748, `rotation0`=0, `rotation1`=0, `rotation2`=-0.719339, `rotation3`=0.694659 WHERE `guid`=5100;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 0.0098877 yards).
UPDATE `gameobject` SET `position_x`=-9685.88, `position_y`=-1195.69, `position_z`=50.4208, `orientation`=1.02974, `rotation0`=0, `rotation1`=0, `rotation2`=0.492423, `rotation3`=0.870356 WHERE `guid`=31109;

-- Correct position of Copper Vein in Westfall (position is off by 0.334728 yards).
UPDATE `gameobject` SET `position_x`=-9756.33, `position_y`=1008.48, `position_z`=35.1334, `orientation`=5.20108, `rotation0`=0, `rotation1`=0, `rotation2`=-0.515037, `rotation3`=0.857168 WHERE `guid`=5209;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5783.95, `position_y`=-3212.13, `position_z`=309.845, `orientation`=0.645772, `rotation0`=0, `rotation1`=0, `rotation2`=0.317305, `rotation3`=0.948324 WHERE `guid`=13199;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 1.15865 yards).
UPDATE `gameobject` SET `position_x`=848.075, `position_y`=368.491, `position_z`=22.9007, `orientation`=3.22886, `rotation0`=0, `rotation1`=0, `rotation2`=-0.999048, `rotation3`=0.0436193 WHERE `guid`=4674;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.475484 yards).
UPDATE `gameobject` SET `position_x`=2613.72, `position_y`=-503.312, `position_z`=91.9222, `orientation`=3.05433, `rotation0`=0, `rotation1`=0, `rotation2`=0.999048, `rotation3`=0.0436193 WHERE `guid`=5359;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.282069 yards).
UPDATE `gameobject` SET `position_x`=2716.62, `position_y`=-540.282, `position_z`=106.932, `orientation`=0.139625, `rotation0`=0, `rotation1`=0, `rotation2`=0.0697555, `rotation3`=0.997564 WHERE `guid`=5154;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0386963 yards).
UPDATE `gameobject` SET `position_x`=511.705, `position_y`=1353.7, `position_z`=88.8817, `orientation`=1.8675, `rotation0`=0, `rotation1`=0, `rotation2`=0.803857, `rotation3`=0.594823 WHERE `guid`=5349;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 1.95001 yards).
UPDATE `gameobject` SET `position_x`=762.282, `position_y`=1271.56, `position_z`=69.5199, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=5339;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.168269 yards).
UPDATE `gameobject` SET `position_x`=723.573, `position_y`=1125.98, `position_z`=64.2494, `orientation`=4.46804, `rotation0`=0, `rotation1`=0, `rotation2`=-0.788011, `rotation3`=0.615662 WHERE `guid`=5456;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.886061 yards).
UPDATE `gameobject` SET `position_x`=1352.98, `position_y`=1243.32, `position_z`=47.671, `orientation`=1.5708, `rotation0`=0, `rotation1`=0, `rotation2`=0.707107, `rotation3`=0.707107 WHERE `guid`=5478;

-- Correct position of Copper Vein in Durotar (position is off by 0.544456 yards).
UPDATE `gameobject` SET `position_x`=751.688, `position_y`=-4683.93, `position_z`=30.1805, `orientation`=1.72787, `rotation0`=0, `rotation1`=0, `rotation2`=0.760405, `rotation3`=0.649449 WHERE `guid`=4970;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 3.57699 yards).
UPDATE `gameobject` SET `position_x`=2781.51, `position_y`=-833.162, `position_z`=154.953, `orientation`=2.23402, `rotation0`=0, `rotation1`=0, `rotation2`=0.898793, `rotation3`=0.438373 WHERE `guid`=4787;

-- Correct position of Copper Vein in Hillsbrad Foothills (position is off by 0.221057 yards).
UPDATE `gameobject` SET `position_x`=-664.995, `position_y`=489.126, `position_z`=88.248, `orientation`=6.14356, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0697555, `rotation3`=0.997564 WHERE `guid`=5380;

-- Correct position of Copper Vein in Wetlands (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-4153.12, `position_y`=-3038.73, `position_z`=2.50557, `orientation`=3.90954, `rotation0`=0, `rotation1`=0, `rotation2`=-0.927183, `rotation3`=0.374608 WHERE `guid`=14875;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 1.27637 yards).
UPDATE `gameobject` SET `position_x`=2208.11, `position_y`=553.019, `position_z`=34.0019, `orientation`=0.523598, `rotation0`=0, `rotation1`=0, `rotation2`=0.258819, `rotation3`=0.965926 WHERE `guid`=5087;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 0.902649 yards).
UPDATE `gameobject` SET `position_x`=2245.48, `position_y`=1332.42, `position_z`=38.1899, `orientation`=3.35105, `rotation0`=0, `rotation1`=0, `rotation2`=-0.994521, `rotation3`=0.104535 WHERE `guid`=4975;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 1.64886 yards).
UPDATE `gameobject` SET `position_x`=2225.5, `position_y`=-332.543, `position_z`=73.1434, `orientation`=6.24828, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0174522, `rotation3`=0.999848 WHERE `guid`=4941;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.53298 yards).
UPDATE `gameobject` SET `position_x`=-4979, `position_y`=-1856.3, `position_z`=-38.4405, `orientation`=2.63544, `rotation0`=0, `rotation1`=0, `rotation2`=0.968147, `rotation3`=0.250381 WHERE `guid`=5347;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=1357.7, `position_y`=1544.48, `position_z`=156.776, `orientation`=4.15388, `rotation0`=0, `rotation1`=0, `rotation2`=-0.874619, `rotation3`=0.48481 WHERE `guid`=47666;

-- Correct position of Copper Vein in Stonetalon Mountains (position is off by 0.383206 yards).
UPDATE `gameobject` SET `position_x`=243.391, `position_y`=359.352, `position_z`=69.831, `orientation`=3.28124, `rotation0`=0, `rotation1`=0, `rotation2`=-0.997563, `rotation3`=0.0697661 WHERE `guid`=5084;

-- Correct position of Copper Vein in The Barrens (position is off by 0.420051 yards).
UPDATE `gameobject` SET `position_x`=-2726.32, `position_y`=-2024.73, `position_z`=113.357, `orientation`=2.87979, `rotation0`=0, `rotation1`=0, `rotation2`=0.991445, `rotation3`=0.130528 WHERE `guid`=5256;

-- Correct position of Copper Vein in The Barrens (position is off by 0.583797 yards).
UPDATE `gameobject` SET `position_x`=-3172.37, `position_y`=-1849.55, `position_z`=99.9321, `orientation`=3.56047, `rotation0`=0, `rotation1`=0, `rotation2`=-0.978148, `rotation3`=0.207912 WHERE `guid`=4818;

-- Correct position of Copper Vein in The Barrens (position is off by 0.495808 yards).
UPDATE `gameobject` SET `position_x`=-2750.86, `position_y`=-1867.28, `position_z`=93.5215, `orientation`=2.47837, `rotation0`=0, `rotation1`=0, `rotation2`=0.945518, `rotation3`=0.325568 WHERE `guid`=4692;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.871364 yards).
UPDATE `gameobject` SET `position_x`=639.734, `position_y`=1222.12, `position_z`=85.3606, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=5232;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=503.216, `position_y`=-3923.44, `position_z`=23.0152, `orientation`=3.47321, `rotation0`=0, `rotation1`=0, `rotation2`=-0.986285, `rotation3`=0.16505 WHERE `guid`=32523;

-- Correct position of Copper Vein in The Barrens (position is off by 0.579414 yards).
UPDATE `gameobject` SET `position_x`=-1088.5, `position_y`=-2223.12, `position_z`=67.59, `orientation`=4.08407, `rotation0`=0, `rotation1`=0, `rotation2`=-0.891007, `rotation3`=0.453991 WHERE `guid`=4681;

-- Correct position of Copper Vein in Duskwood (position is off by 1.43283 yards).
UPDATE `gameobject` SET `position_x`=-11045.7, `position_y`=-299.893, `position_z`=16.2588, `orientation`=3.75246, `rotation0`=0, `rotation1`=0, `rotation2`=-0.953716, `rotation3`=0.300708 WHERE `guid`=4842;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.0709839 yards).
UPDATE `gameobject` SET `position_x`=2411.54, `position_y`=-856.929, `position_z`=147.678, `orientation`=6.21337, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0348988, `rotation3`=0.999391 WHERE `guid`=5180;

-- Correct position of Copper Vein in Mulgore (position is off by 0.310606 yards).
UPDATE `gameobject` SET `position_x`=-2036.96, `position_y`=299.074, `position_z`=126.994, `orientation`=4.31097, `rotation0`=0, `rotation1`=0, `rotation2`=-0.833885, `rotation3`=0.551938 WHERE `guid`=4844;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.124835 yards).
UPDATE `gameobject` SET `position_x`=-9484.96, `position_y`=-1976.89, `position_z`=94.0196, `orientation`=0.890117, `rotation0`=0, `rotation1`=0, `rotation2`=0.43051, `rotation3`=0.902586 WHERE `guid`=5215;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.322601 yards).
UPDATE `gameobject` SET `position_x`=-5547.15, `position_y`=-2933.8, `position_z`=374.021, `orientation`=3.10665, `rotation0`=0, `rotation1`=0, `rotation2`=0.999847, `rotation3`=0.0174693 WHERE `guid`=4695;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.349251 yards).
UPDATE `gameobject` SET `position_x`=-4985.08, `position_y`=-3873.26, `position_z`=317.478, `orientation`=2.65289, `rotation0`=0, `rotation1`=0, `rotation2`=0.970295, `rotation3`=0.241925 WHERE `guid`=5030;

-- Correct position of Copper Vein in Durotar (position is off by 1.06496 yards).
UPDATE `gameobject` SET `position_x`=712.542, `position_y`=-4512.38, `position_z`=19.8831, `orientation`=4.57276, `rotation0`=0, `rotation1`=0, `rotation2`=-0.754709, `rotation3`=0.656059 WHERE `guid`=5202;

-- Correct position of Copper Vein in Durotar (position is off by 0.315075 yards).
UPDATE `gameobject` SET `position_x`=-876.697, `position_y`=-4736.07, `position_z`=29.935, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=4764;

-- Correct position of Copper Vein in Darkshore (position is off by 0.00107602 yards).
UPDATE `gameobject` SET `position_x`=6354.29, `position_y`=119.984, `position_z`=22.1034, `orientation`=1.58825, `rotation0`=0, `rotation1`=0, `rotation2`=0.71325, `rotation3`=0.70091 WHERE `guid`=4824;

-- Correct position of Copper Vein in Darkshore (position is off by 0.000106812 yards).
UPDATE `gameobject` SET `position_x`=7123.89, `position_y`=-787.781, `position_z`=73.2812, `orientation`=4.34587, `rotation0`=0, `rotation1`=0, `rotation2`=-0.824126, `rotation3`=0.566406 WHERE `guid`=48742;

-- Correct position of Copper Vein in Darkshore (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=7925.2, `position_y`=-1176.94, `position_z`=57.2328, `orientation`=2.84488, `rotation0`=0, `rotation1`=0, `rotation2`=0.989016, `rotation3`=0.147811 WHERE `guid`=48762;

-- Correct position of Copper Vein in Darkshore (position is off by 0.938739 yards).
UPDATE `gameobject` SET `position_x`=6798.9, `position_y`=231.377, `position_z`=25.7076, `orientation`=5.60251, `rotation0`=0, `rotation1`=0, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=4938;

-- Correct position of Copper Vein in Duskwood (position is off by 0.316594 yards).
UPDATE `gameobject` SET `position_x`=-10973.7, `position_y`=73.9823, `position_z`=39.4804, `orientation`=5.67232, `rotation0`=0, `rotation1`=0, `rotation2`=-0.300705, `rotation3`=0.953717 WHERE `guid`=5170;

-- Correct position of Copper Vein in Duskwood (position is off by 2.20034 yards).
UPDATE `gameobject` SET `position_x`=-10124.3, `position_y`=-341.976, `position_z`=53.3324, `orientation`=4.04917, `rotation0`=0, `rotation1`=0, `rotation2`=-0.898793, `rotation3`=0.438373 WHERE `guid`=39981;

-- Correct position of Copper Vein in Duskwood (position is off by 0.772683 yards).
UPDATE `gameobject` SET `position_x`=-10435.3, `position_y`=-1011.91, `position_z`=48.5019, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=4944;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.752419 yards).
UPDATE `gameobject` SET `position_x`=-9137.28, `position_y`=-3187.06, `position_z`=107.541, `orientation`=4.53786, `rotation0`=0, `rotation1`=0, `rotation2`=-0.766044, `rotation3`=0.642789 WHERE `guid`=4822;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 3.21939 yards).
UPDATE `gameobject` SET `position_x`=-9921.27, `position_y`=-285.241, `position_z`=35.7804, `orientation`=1.53589, `rotation0`=0, `rotation1`=0, `rotation2`=0.694658, `rotation3`=0.71934 WHERE `guid`=40007;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 1.38118 yards).
UPDATE `gameobject` SET `position_x`=-9841.58, `position_y`=-340.996, `position_z`=46.2621, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=40009;

-- Correct position of Copper Vein in Westfall (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-9830.03, `position_y`=1401.71, `position_z`=48.2201, `orientation`=3.52557, `rotation0`=0, `rotation1`=0, `rotation2`=-0.981627, `rotation3`=0.190812 WHERE `guid`=30588;

-- Correct position of Copper Vein in Westfall (position is off by 0.361665 yards).
UPDATE `gameobject` SET `position_x`=-9912.36, `position_y`=1115.99, `position_z`=37.6016, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=5248;

-- Correct position of Copper Vein in Westfall (position is off by 0.218429 yards).
UPDATE `gameobject` SET `position_x`=-9917.85, `position_y`=884.944, `position_z`=33.5319, `orientation`=3.73501, `rotation0`=0, `rotation1`=0, `rotation2`=-0.956305, `rotation3`=0.292372 WHERE `guid`=5436;

-- Correct position of Copper Vein in Westfall (position is off by 0.310179 yards).
UPDATE `gameobject` SET `position_x`=-9939.12, `position_y`=1472.84, `position_z`=41.5435, `orientation`=3.87463, `rotation0`=0, `rotation1`=0, `rotation2`=-0.93358, `rotation3`=0.358368 WHERE `guid`=42708;

-- Correct position of Copper Vein in The Deadmines (position is off by 3.22581 yards).
UPDATE `gameobject` SET `position_x`=-11080.3, `position_y`=1519.16, `position_z`=31.9193, `orientation`=5.95157, `rotation0`=0, `rotation1`=0, `rotation2`=-0.165047, `rotation3`=0.986286 WHERE `guid`=34829;

-- Correct position of Copper Vein in Redridge Mountains (position is off by 0.735398 yards).
UPDATE `gameobject` SET `position_x`=-9591.81, `position_y`=-2403.29, `position_z`=64.4106, `orientation`=3.59538, `rotation0`=0, `rotation1`=0, `rotation2`=-0.97437, `rotation3`=0.224951 WHERE `guid`=5451;

-- Correct position of Copper Vein in Darkshore (position is off by 0.902038 yards).
UPDATE `gameobject` SET `position_x`=5129.34, `position_y`=146.26, `position_z`=48.5483, `orientation`=5.89921, `rotation0`=0, `rotation1`=0, `rotation2`=-0.190808, `rotation3`=0.981627 WHERE `guid`=4747;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=790.85, `position_y`=-3870.65, `position_z`=21.5309, `orientation`=3.94445, `rotation0`=0, `rotation1`=0, `rotation2`=-0.920505, `rotation3`=0.390732 WHERE `guid`=12544;

-- Correct position of Copper Vein in Mulgore (position is off by 1.57241 yards).
UPDATE `gameobject` SET `position_x`=-1595.03, `position_y`=-873.919, `position_z`=36.7227, `orientation`=2.72271, `rotation0`=0, `rotation1`=0, `rotation2`=0.978148, `rotation3`=0.207912 WHERE `guid`=5450;

-- Correct position of Copper Vein in Mulgore (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-1301.52, `position_y`=-1039.44, `position_z`=61.9712, `orientation`=3.4383, `rotation0`=0, `rotation1`=0, `rotation2`=-0.989016, `rotation3`=0.147811 WHERE `guid`=20719;

-- Correct position of Copper Vein in Mulgore (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=-441.273, `position_y`=-634.282, `position_z`=68.3678, `orientation`=1.55334, `rotation0`=0, `rotation1`=0, `rotation2`=0.700909, `rotation3`=0.713251 WHERE `guid`=20674;

-- Correct position of Copper Vein in The Barrens (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-338.932, `position_y`=-2986.05, `position_z`=100.969, `orientation`=2.25147, `rotation0`=0, `rotation1`=0, `rotation2`=0.902585, `rotation3`=0.430512 WHERE `guid`=33550;

-- Correct position of Copper Vein in The Barrens (position is off by 1.79099 yards).
UPDATE `gameobject` SET `position_x`=-1387.82, `position_y`=-2392.19, `position_z`=130.658, `orientation`=2.3911, `rotation0`=0, `rotation1`=0, `rotation2`=0.930417, `rotation3`=0.366502 WHERE `guid`=5330;

-- Correct position of Copper Vein in The Barrens (position is off by 1.60808 yards).
UPDATE `gameobject` SET `position_x`=-737.676, `position_y`=-3627.47, `position_z`=95.0698, `orientation`=4.76475, `rotation0`=0, `rotation1`=0, `rotation2`=-0.688354, `rotation3`=0.725375 WHERE `guid`=5257;

-- Correct position of Copper Vein in The Barrens (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-418.612, `position_y`=-2186.97, `position_z`=143.571, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=15162;

-- Correct position of Copper Vein in Mulgore (position is off by 0.849317 yards).
UPDATE `gameobject` SET `position_x`=-1118.57, `position_y`=-484.427, `position_z`=-39.7389, `orientation`=5.86431, `rotation0`=0, `rotation1`=0, `rotation2`=-0.207912, `rotation3`=0.978148 WHERE `guid`=4836;

-- Correct position of Copper Vein in Desolace (position is off by 1.01639 yards).
UPDATE `gameobject` SET `position_x`=26.8517, `position_y`=1824.61, `position_z`=127.604, `orientation`=5.07891, `rotation0`=0, `rotation1`=0, `rotation2`=-0.566406, `rotation3`=0.824126 WHERE `guid`=5047;

-- Correct position of Copper Vein in Darkshore (position is off by 1.27698 yards).
UPDATE `gameobject` SET `position_x`=5214.69, `position_y`=316.013, `position_z`=43.3236, `orientation`=0.750491, `rotation0`=0, `rotation1`=0, `rotation2`=0.366501, `rotation3`=0.930418 WHERE `guid`=4746;

-- Correct position of Copper Vein in The Barrens (position is off by 1.89644 yards).
UPDATE `gameobject` SET `position_x`=46.2267, `position_y`=-1724.99, `position_z`=113.622, `orientation`=5.0091, `rotation0`=0, `rotation1`=0, `rotation2`=-0.594823, `rotation3`=0.803857 WHERE `guid`=5464;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.646618 yards).
UPDATE `gameobject` SET `position_x`=-4980.47, `position_y`=-1215.82, `position_z`=-45.5943, `orientation`=6.16101, `rotation0`=0, `rotation1`=0, `rotation2`=-0.0610485, `rotation3`=0.998135 WHERE `guid`=4933;

-- Correct position of Copper Vein in Wetlands (position is off by 9.91821e-05 yards).
UPDATE `gameobject` SET `position_x`=-3438.17, `position_y`=-1643.46, `position_z`=21.7194, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=34133;

-- Correct position of Copper Vein in Mulgore (position is off by 0.426893 yards).
UPDATE `gameobject` SET `position_x`=-2169.64, `position_y`=-1179.78, `position_z`=39.1276, `orientation`=3.50812, `rotation0`=0, `rotation1`=0, `rotation2`=-0.983254, `rotation3`=0.182238 WHERE `guid`=4783;

-- Correct position of Copper Vein in Darkshore (position is off by 0.000360786 yards).
UPDATE `gameobject` SET `position_x`=6314.4, `position_y`=83.0318, `position_z`=44.3543, `orientation`=1.74533, `rotation0`=0, `rotation1`=0, `rotation2`=0.766044, `rotation3`=0.642789 WHERE `guid`=4799;

-- Correct position of Copper Vein in Darkshore (position is off by 0.717807 yards).
UPDATE `gameobject` SET `position_x`=7149.56, `position_y`=-284.307, `position_z`=36.5178, `orientation`=5.21854, `rotation0`=0, `rotation1`=0, `rotation2`=-0.507538, `rotation3`=0.861629 WHERE `guid`=4949;

-- Correct position of Copper Vein in Thousand Needles (position is off by 0.191408 yards).
UPDATE `gameobject` SET `position_x`=-4845.82, `position_y`=-1691.96, `position_z`=-33.0507, `orientation`=5.02655, `rotation0`=0, `rotation1`=0, `rotation2`=-0.587785, `rotation3`=0.809017 WHERE `guid`=4785;

-- Correct position of Copper Vein in Durotar (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=620.868, `position_y`=-3887.82, `position_z`=29.8135, `orientation`=1.23918, `rotation0`=0, `rotation1`=0, `rotation2`=0.580703, `rotation3`=0.814116 WHERE `guid`=12601;

-- Correct position of Copper Vein in The Barrens (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-1273.68, `position_y`=-3803, `position_z`=31.5641, `orientation`=5.70723, `rotation0`=0, `rotation1`=0, `rotation2`=-0.284015, `rotation3`=0.95882 WHERE `guid`=15136;

-- Correct position of Copper Vein in Mulgore (position is off by 0.573466 yards).
UPDATE `gameobject` SET `position_x`=-713.564, `position_y`=-762.928, `position_z`=44.0935, `orientation`=4.7822, `rotation0`=0, `rotation1`=0, `rotation2`=-0.681998, `rotation3`=0.731354 WHERE `guid`=5233;

-- Correct position of Copper Vein in The Barrens (position is off by 0.000976563 yards).
UPDATE `gameobject` SET `position_x`=887.469, `position_y`=-3138.51, `position_z`=118.462, `orientation`=5.49779, `rotation0`=0, `rotation1`=0, `rotation2`=-0.382683, `rotation3`=0.92388 WHERE `guid`=15486;

-- Correct position of Copper Vein in Loch Modan (position is off by 0.00976563 yards).
UPDATE `gameobject` SET `position_x`=-5179.52, `position_y`=-3290.78, `position_z`=276.421, `orientation`=3.38594, `rotation0`=0, `rotation1`=0, `rotation2`=-0.992546, `rotation3`=0.12187 WHERE `guid`=12813;

-- Correct position of Copper Vein in Wetlands (position is off by 0.810121 yards).
UPDATE `gameobject` SET `position_x`=-4080.01, `position_y`=-2911.19, `position_z`=4.63452, `orientation`=0.977383, `rotation0`=0, `rotation1`=0, `rotation2`=0.469471, `rotation3`=0.882948 WHERE `guid`=5250;

-- Correct position of Copper Vein in Durotar (position is off by 0.767796 yards).
UPDATE `gameobject` SET `position_x`=413.661, `position_y`=-4258.74, `position_z`=32.9778, `orientation`=4.88692, `rotation0`=0, `rotation1`=0, `rotation2`=-0.642787, `rotation3`=0.766045 WHERE `guid`=5019;

-- Correct position of Copper Vein in Ashenvale (position is off by 0.4753 yards).
UPDATE `gameobject` SET `position_x`=2761.35, `position_y`=-3058.57, `position_z`=164.029, `orientation`=5.79449, `rotation0`=0, `rotation1`=0, `rotation2`=-0.241921, `rotation3`=0.970296 WHERE `guid`=5103;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 1.81434 yards).
UPDATE `gameobject` SET `position_x`=2485.92, `position_y`=581.391, `position_z`=34.6939, `orientation`=4.20625, `rotation0`=0, `rotation1`=0, `rotation2`=-0.861628, `rotation3`=0.507539 WHERE `guid`=5369;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 1.03744 yards).
UPDATE `gameobject` SET `position_x`=1730.53, `position_y`=993.143, `position_z`=56.7983, `orientation`=1.46608, `rotation0`=0, `rotation1`=0, `rotation2`=0.66913, `rotation3`=0.743145 WHERE `guid`=4717;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.3349 yards).
UPDATE `gameobject` SET `position_x`=1011.34, `position_y`=1184.54, `position_z`=56.9709, `orientation`=5.16618, `rotation0`=0, `rotation1`=0, `rotation2`=-0.529919, `rotation3`=0.848048 WHERE `guid`=5341;

-- Correct position of Copper Vein in Elwynn Forest (position is off by 2.61156 yards).
UPDATE `gameobject` SET `position_x`=-9901.18, `position_y`=-204.867, `position_z`=38.77, `orientation`=0.994837, `rotation0`=0, `rotation1`=0, `rotation2`=0.477158, `rotation3`=0.878817 WHERE `guid`=40010;

-- Correct position of Copper Vein in Duskwood (position is off by 0.223496 yards).
UPDATE `gameobject` SET `position_x`=-10174.9, `position_y`=-700.101, `position_z`=44.6107, `orientation`=2.96704, `rotation0`=0, `rotation1`=0, `rotation2`=0.996194, `rotation3`=0.087165 WHERE `guid`=4857;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.271404 yards).
UPDATE `gameobject` SET `position_x`=-142.785, `position_y`=1280.16, `position_z`=54.9085, `orientation`=3.7001, `rotation0`=0, `rotation1`=0, `rotation2`=-0.961261, `rotation3`=0.27564 WHERE `guid`=4750;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.00100708 yards).
UPDATE `gameobject` SET `position_x`=-5570.23, `position_y`=-1705.6, `position_z`=371.53, `orientation`=2.46091, `rotation0`=0, `rotation1`=0, `rotation2`=0.942641, `rotation3`=0.333808 WHERE `guid`=29619;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.0010376 yards).
UPDATE `gameobject` SET `position_x`=908.045, `position_y`=1309.13, `position_z`=48.4337, `orientation`=5.2709, `rotation0`=0, `rotation1`=0, `rotation2`=-0.484809, `rotation3`=0.87462 WHERE `guid`=35497;

-- Correct position of Copper Vein in Darkshore (position is off by 0.287946 yards).
UPDATE `gameobject` SET `position_x`=6657.28, `position_y`=89.4858, `position_z`=34.8699, `orientation`=0.122173, `rotation0`=0, `rotation1`=0, `rotation2`=0.0610485, `rotation3`=0.998135 WHERE `guid`=5156;

-- Correct position of Copper Vein in Darkshore (position is off by 0.408351 yards).
UPDATE `gameobject` SET `position_x`=6770.85, `position_y`=0.051432, `position_z`=26.9423, `orientation`=5.74214, `rotation0`=0, `rotation1`=0, `rotation2`=-0.267238, `rotation3`=0.963631 WHERE `guid`=5409;

-- Correct position of Copper Vein in Darkshore (position is off by 0.944603 yards).
UPDATE `gameobject` SET `position_x`=5664.99, `position_y`=351.459, `position_z`=17.8281, `orientation`=0.698131, `rotation0`=0, `rotation1`=0, `rotation2`=0.34202, `rotation3`=0.939693 WHERE `guid`=4711;

-- Correct position of Copper Vein in Darkshore (position is off by 1.0461 yards).
UPDATE `gameobject` SET `position_x`=6608.19, `position_y`=234.431, `position_z`=44.8424, `orientation`=4.99164, `rotation0`=0, `rotation1`=0, `rotation2`=-0.601814, `rotation3`=0.798636 WHERE `guid`=4809;

-- Correct position of Copper Vein in Dun Morogh (position is off by 0.0102539 yards).
UPDATE `gameobject` SET `position_x`=-5564.46, `position_y`=-307.319, `position_z`=365.538, `orientation`=5.28835, `rotation0`=0, `rotation1`=0, `rotation2`=-0.477158, `rotation3`=0.878817 WHERE `guid`=29338;

-- Correct position of Copper Vein in Tirisfal Glades (position is off by 1.22883 yards).
UPDATE `gameobject` SET `position_x`=2133.66, `position_y`=-315.844, `position_z`=57.8635, `orientation`=2.21656, `rotation0`=0, `rotation1`=0, `rotation2`=0.894934, `rotation3`=0.446199 WHERE `guid`=4929;

-- Correct position of Copper Vein in Silverpine Forest (position is off by 0.000101089 yards).
UPDATE `gameobject` SET `position_x`=-342.521, `position_y`=1673.51, `position_z`=25.3213, `orientation`=5.81195, `rotation0`=0, `rotation1`=0, `rotation2`=-0.233445, `rotation3`=0.97237 WHERE `guid`=42064;

-- Correct position of Copper Vein in Duskwood (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10638.4, `position_y`=-1390.39, `position_z`=60.8947, `orientation`=2.05949, `rotation0`=0, `rotation1`=0, `rotation2`=0.857167, `rotation3`=0.515038 WHERE `guid`=30343;

-- Correct position of Copper Vein in Durotar (position is off by 1.1612 yards).
UPDATE `gameobject` SET `position_x`=-548.849, `position_y`=-4909.94, `position_z`=45.4167, `orientation`=0, `rotation0`=0, `rotation1`=0, `rotation2`=0, `rotation3`=1 WHERE `guid`=5176;

-- Correct position of Copper Vein in Wetlands (position is off by 0.400403 yards).
UPDATE `gameobject` SET `position_x`=-3715.4, `position_y`=-2879.98, `position_z`=5.16273, `orientation`=1.93731, `rotation0`=0, `rotation1`=0, `rotation2`=0.824125, `rotation3`=0.566408 WHERE `guid`=5048;

-- Correct position of Copper Vein in Wetlands (position is off by 0.408434 yards).
UPDATE `gameobject` SET `position_x`=-3066.62, `position_y`=-1932.85, `position_z`=4.93504, `orientation`=2.33874, `rotation0`=0, `rotation1`=0, `rotation2`=0.920505, `rotation3`=0.390732 WHERE `guid`=4716;

-- Correct position of Copper Vein in Westfall (position is off by 0.299805 yards).
UPDATE `gameobject` SET `position_x`=-10782.3, `position_y`=1400.45, `position_z`=23.0415, `orientation`=1.71042, `rotation0`=0, `rotation1`=0, `rotation2`=0.754709, `rotation3`=0.656059 WHERE `guid`=4668;

-- Correct position of Copper Vein in Westfall (position is off by 0.0100098 yards).
UPDATE `gameobject` SET `position_x`=-10795.9, `position_y`=1266.72, `position_z`=34.3962, `orientation`=1.32645, `rotation0`=0, `rotation1`=0, `rotation2`=0.615661, `rotation3`=0.788011 WHERE `guid`=5346;

-- Correct position of Copper Vein in The Deadmines (position is off by 1.70112 yards).
UPDATE `gameobject` SET `position_x`=-11150.4, `position_y`=1547.24, `position_z`=22.634, `orientation`=0.942477, `rotation0`=0, `rotation1`=0, `rotation2`=0.45399, `rotation3`=0.891007 WHERE `guid`=34832;

-- Missing Copper Vein spawns in Dun Morogh.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(29621, 1731, 0, -5567.07, -1799.28, 360.232, 5.39307, 0, 0, -0.43051, 0.902586, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29620 at 75.224617 yards.
(10824, 1731, 0, -5520.07, -828.794, 413.923, 1.85005, 0, 0, 0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10695 at 118.422401 yards.
(7120, 1731, 0, -5051.87, -585.696, 426.164, 0, 0, 0, 0, 1, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 7022 at 279.824829 yards.
(10214, 1731, 0, -5543.01, -345.275, 359.952, 5.91667, 0, 0, -0.182235, 0.983255, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10202 at 30.484262 yards.
(10223, 1731, 0, -5504.02, -275.01, 354.252, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10213 at 52.369980 yards.
(10982, 1731, 0, -5756.99, -1462.85, 407.367, 6.03884, 0, 0, -0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10777 at 59.309772 yards.
(10997, 1731, 0, -5481.05, -1555.31, 444.87, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10840 at 79.648376 yards.
(29631, 1731, 0, -5633.08, -1957.88, 372.963, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29625 at 78.396019 yards.
(29354, 1731, 0, -5552.77, -285.159, 364.495, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29338 at 25.080832 yards.
(29555, 1731, 0, -5387.72, -282.724, 358.948, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29335 at 51.073654 yards.
(29557, 1731, 0, -5546.48, -1776.41, 345.431, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29345 at 53.295467 yards.
(29564, 1731, 0, -5357.22, -421.696, 397.762, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29335 at 140.706070 yards.
(11008, 1731, 0, -5644.32, -2362.95, 424.935, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10892 at 169.363022 yards.
(11089, 1731, 0, -5828.81, -1682.51, 364.491, 1.43117, 0, 0, 0.656058, 0.75471, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10861 at 100.067833 yards.
(11140, 1731, 0, -5879.19, -1522.75, 380.578, 4.7473, 0, 0, -0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10848 at 48.441360 yards.
(11154, 1731, 0, -5892.93, -1004.22, 411.382, 3.10665, 0, 0, 0.999847, 0.0174693, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10707 at 172.271606 yards.
(29615, 1731, 0, -6011.58, -114.691, 412.603, 2.56563, 0, 0, 0.958819, 0.284016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29605 at 156.515152 yards.
(29569, 1731, 0, -5482.73, -94.8129, 346.902, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29330 at 77.805656 yards.
(29616, 1731, 0, -6099.44, -341.376, 439.957, 0.261798, 0, 0, 0.130526, 0.991445, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29602 at 141.456955 yards.
(11175, 1731, 0, -5763.37, -1213.98, 386.301, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10744 at 126.082008 yards.
(11176, 1731, 0, -5684.73, -1663.59, 360.849, 2.47837, 0, 0, 0.945518, 0.325568, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10853 at 61.667301 yards.
(7239, 1731, 0, -4855.66, -104.338, 407.57, 0.785397, 0, 0, 0.382683, 0.92388, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 7230 at 126.798622 yards.
(29570, 1731, 0, -5351.83, -309.17, 417.621, 6.02139, 0, 0, -0.130526, 0.991445, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29335 at 99.288826 yards.
(11177, 1731, 0, -5586.85, -1674.53, 345.407, 1.55334, 0, 0, 0.700909, 0.713251, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10855 at 42.495831 yards.
(11178, 1731, 0, -5614.62, -1665.83, 351.188, 4.86947, 0, 0, -0.649447, 0.760406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10853 at 50.074631 yards.
(9993, 1731, 0, -5382.82, 605.27, 400.618, 3.05433, 0, 0, 0.999048, 0.0436193, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 9938 at 180.267227 yards.
(29574, 1731, 0, -5716.87, -162.426, 374.256, 3.08918, 0, 0, 0.999657, 0.0262017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29329 at 136.652466 yards.
(29623, 1731, 0, -5888.64, -318.246, 373.329, 5.32326, 0, 0, -0.461748, 0.887011, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29602 at 111.447243 yards.
(29576, 1731, 0, -5605.4, -252.373, 367.83, 3.57793, 0, 0, -0.976295, 0.216442, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29338 at 68.553299 yards.
(29577, 1731, 0, -5247.1, -186.158, 442.975, 2.63544, 0, 0, 0.968147, 0.250381, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29333 at 113.523460 yards.
(10167, 1731, 0, -5016.47, 5.45768, 395.013, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10154 at 157.463242 yards.
(10000, 1731, 0, -5587.96, 642.125, 385.477, 3.33359, 0, 0, -0.995396, 0.0958512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 9938 at 33.887104 yards.
(10037, 1731, 0, -5644.12, 655.195, 385.571, 4.81711, 0, 0, -0.66913, 0.743145, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 9938 at 87.699989 yards.
(10072, 1731, 0, -5341.9, 483.555, 390.603, 5.07891, 0, 0, -0.566406, 0.824126, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 9938 at 272.171509 yards.
(7245, 1731, 0, -4885.96, 150.787, 404.716, 6.10865, 0, 0, -0.0871553, 0.996195, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 7230 at 329.582245 yards.
(11179, 1731, 0, -5628.65, -1651.85, 365.856, 2.07694, 0, 0, 0.861628, 0.507539, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 10853 at 56.538254 yards.
(29579, 1731, 0, -5432.38, -2023.23, 427.529, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29350 at 200.218246 yards.
(11180, 1731, 0, -5706.74, -2259.01, 445.328, 6.05629, 0, 0, -0.113203, 0.993572, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 10892 at 152.376450 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(29621, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10824, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(7120, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10214, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10223, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10982, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10997, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29631, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29354, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29555, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29557, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29564, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11008, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11089, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11140, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11154, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29615, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29569, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29616, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11175, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11176, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(7239, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29570, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11177, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11178, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(9993, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29574, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29623, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29576, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29577, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10167, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10000, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10037, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(10072, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(7245, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11179, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(29579, 1019, 0, 'Copper Vein', 0, 10), -- Copper Veins in Dun Morogh 76 objects total
(11180, 1019, 0, 'Copper Vein', 0, 10); -- Copper Veins in Dun Morogh 76 objects total

-- Missing Copper Vein spawns in Duskwood.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(33169, 1731, 0, -11118.3, -578.917, 46.1832, 5.48033, 0, 0, -0.390731, 0.920505, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 33156 at 177.315765 yards.
(32135, 1731, 0, -11016.6, -1180.58, 46.4404, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32100 at 100.985313 yards.
(5211, 1731, 0, -11062.5, -729.195, 59.6659, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4946 at 78.297447 yards.
(17149, 1731, 0, -10966.5, -183.178, 17.1387, 2.56563, 0, 0, 0.958819, 0.284016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 17142 at 134.588806 yards.
(42664, 1731, 0, -10856.7, -1283.99, 62.4551, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 42480 at 208.335449 yards.
(39991, 1731, 0, -10088, -450.424, 65.3588, 2.28638, 0, 0, 0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 39981 at 114.152733 yards.
(18573, 1731, 0, -10699.3, -187.865, 39.9624, 3.4383, 0, 0, -0.989016, 0.147811, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 18550 at 217.352432 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(33169, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(32135, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(5211, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(17149, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(42664, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(39991, 1119, 0, 'Copper Vein', 0, 10), -- Copper Veins in Duskwood 30 objects total
(18573, 1119, 0, 'Copper Vein', 0, 10); -- Copper Veins in Duskwood 30 objects total

-- Missing Copper Vein spawns in Wetlands.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4700, 1731, 0, -2923.04, -1608.39, 0.933756, 0.925024, 0, 0, 0.446198, 0.894934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4689 at 114.570900 yards.
(14920, 1731, 0, -4271.32, -3020.73, 10.5367, 4.18879, 0, 0, -0.866025, 0.500001, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 14875 at 119.841949 yards.
(5474, 1731, 0, -3037.39, -1525.7, 0.639823, 0.90757, 0, 0, 0.438371, 0.898794, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5470 at 24.312395 yards.
(14602, 1731, 0, -4218.17, -2474.73, 282.472, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 14564 at 121.962784 yards.
(4705, 1731, 0, -4341.22, -2511.06, 256.408, 0.471238, 0, 0, 0.233445, 0.97237, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4703 at 207.918427 yards.
(5283, 1731, 0, -3132.9, -1450.79, -0.29859, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5043 at 27.356642 yards.
(15031, 1731, 0, -3220.77, -1333.22, 1.52318, 3.12412, 0, 0, 0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15030 at 135.127899 yards.
(5286, 1731, 0, -2951.17, -1806.75, 3.60814, 4.76475, 0, 0, -0.688354, 0.725375, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4689 at 119.659134 yards.
(5288, 1731, 0, -3174.07, -1533.11, 2.15818, 4.03171, 0, 0, -0.902585, 0.430512, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5092 at 22.256887 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4700, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(14920, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(5474, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(14602, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(4705, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(5283, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(15031, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(5286, 1156, 0, 'Copper Vein', 0, 10), -- Copper Veins in Wetlands 35 objects total
(5288, 1156, 0, 'Copper Vein', 0, 10); -- Copper Veins in Wetlands 35 objects total

-- Missing Copper Vein spawns in Elwynn Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(26768, 1731, 0, -9101.61, 76.0012, 93.6697, 1.39626, 0, 0, 0.642787, 0.766045, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26722 at 56.931129 yards.
(34070, 1731, 0, -9471.69, 560.812, 58.0184, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34059 at 87.230721 yards.
(30771, 1731, 0, -9737.26, 813.852, 33.3772, 6.16101, 0, 0, -0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30762 at 195.487762 yards.
(27068, 1731, 0, -9897.81, -1149.99, 24.353, 4.34587, 0, 0, -0.824126, 0.566406, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 27051 at 73.848122 yards.
(30787, 1731, 0, -9153.03, -599.311, 60.2455, 3.21142, 0, 0, -0.999391, 0.0349061, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30780 at 16.530308 yards.
(30945, 1731, 0, -9058.96, -621.586, 54.7672, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30942 at 28.602135 yards.
(30947, 1731, 0, -9248.18, -734.17, 69.6834, 2.67035, 0, 0, 0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30940 at 136.084702 yards.
(26923, 1731, 0, -9403.04, -1049.86, 61.608, 1.51844, 0, 0, 0.688354, 0.725375, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26918 at 79.804985 yards.
(31120, 1731, 0, -9792.23, -1253.16, 36.0011, 4.03171, 0, 0, -0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31109 at 121.746964 yards.
(27005, 1731, 0, -9324.58, -1100.02, 66.707, 2.84488, 0, 0, 0.989016, 0.147811, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 27003 at 117.762550 yards.
(26264, 1731, 0, -9294.92, -270.276, 81.7051, 0.122173, 0, 0, 0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26226 at 111.563171 yards.
(30695, 1731, 0, -9532.9, -861.734, 50.7958, 2.37364, 0, 0, 0.927183, 0.374608, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30694 at 82.752007 yards.
(27039, 1731, 0, -8801.88, -883.678, 82.6097, 3.35105, 0, 0, -0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26999 at 197.108810 yards.
(30956, 1731, 0, -8843.56, -713.05, 82.6709, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30942 at 211.652008 yards.
(30958, 1731, 0, -9151.22, -623.095, 78.4092, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30940 at 37.461624 yards.
(26984, 1731, 0, -9025.47, -595.008, 56.6837, 0.767944, 0, 0, 0.374606, 0.927184, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26975 at 19.924768 yards.
(30676, 1731, 0, -9106.09, -560.421, 61.66, 0.331611, 0, 0, 0.165047, 0.986286, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30674 at 18.449003 yards.
(40015, 1731, 0, -9958.34, -218.238, 28.9477, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 40010 at 59.200359 yards.
(27072, 1731, 0, -9806.22, -1365.82, 54.8668, 0.418879, 0, 0, 0.207912, 0.978148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 27054 at 64.500214 yards.
(26846, 1731, 0, -9541.09, 652.099, 49.707, 0.226893, 0, 0, 0.113203, 0.993572, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26827 at 61.937889 yards.
(30922, 1731, 0, -9816.79, 178.992, 23.198, 4.88692, 0, 0, -0.642787, 0.766045, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30919 at 16.579626 yards.
(32467, 1731, 0, -9835.27, 205.609, 14.5273, 2.58308, 0, 0, 0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32465 at 17.743204 yards.
(26905, 1731, 0, -9775.81, -420.04, 49.1723, 3.47321, 0, 0, -0.986285, 0.16505, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 26902 at 48.056095 yards.
(30959, 1731, 0, -9030.82, -723.776, 111.017, 1.27409, 0, 0, 0.594822, 0.803857, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30942 at 119.164696 yards.
(30726, 1731, 0, -9222.35, -918.638, 60.2758, 2.53072, 0, 0, 0.953716, 0.300708, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30724 at 94.930298 yards.
(30772, 1731, 0, -9672.27, 817.424, 32.0737, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 30762 at 252.048889 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(26768, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(34070, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30771, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(27068, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30787, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30945, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30947, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(26923, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(31120, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(27005, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(26264, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30695, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(27039, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30956, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30958, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(26984, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30676, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(40015, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(27072, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(26846, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30922, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(32467, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(26905, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30959, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30726, 1015, 0, 'Copper Vein', 0, 10), -- Copper Veins in Elwynn Forest 86 objects total
(30772, 1015, 0, 'Copper Vein', 0, 10); -- Copper Veins in Elwynn Forest 86 objects total

-- Missing Copper Vein spawns in Durotar.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5041, 1731, 1, 1242.78, -4948.08, 16.0424, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5038 at 8.221202 yards.
(4726, 1731, 1, 1200.46, -4646.21, 23.5411, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4725 at 5.599557 yards.
(12621, 1731, 1, 1430.12, -4664.15, 46.1002, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 200.530533 yards.
(4976, 1731, 1, 955.784, -4045.23, -11.4768, 3.927, 0, 0, -0.923879, 0.382686, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4948 at 39.292912 yards.
(5366, 1731, 1, 894.402, -4080.42, 26.5511, 0.366518, 0, 0, 0.182235, 0.983255, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5361 at 62.788662 yards.
(4752, 1731, 1, 1213.05, -4591.98, 23.571, 2.05949, 0, 0, 0.857167, 0.515038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4725 at 51.884361 yards.
(5197, 1731, 1, 1071.53, -3948.96, 24.9357, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5191 at 150.583969 yards.
(12545, 1731, 1, 535.034, -4936.4, 37.0527, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12536 at 63.392559 yards.
(5042, 1731, 1, 901.996, -4036.53, -11.3043, 0.645772, 0, 0, 0.317305, 0.948324, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4948 at 18.140875 yards.
(5225, 1731, 1, 87.6491, -4941.56, 19.3904, 5.8294, 0, 0, -0.224951, 0.97437, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5223 at 179.362869 yards.
(12443, 1731, 1, -341.065, -5100.17, 28.9194, 1.88495, 0, 0, 0.809016, 0.587786, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12376 at 50.874817 yards.
(4791, 1731, 1, -834.234, -4838.99, 21.76, 3.73501, 0, 0, -0.956305, 0.292372, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4764 at 111.811974 yards.
(4815, 1731, 1, -996.959, -4816.75, 13.0821, 0.366518, 0, 0, 0.182235, 0.983255, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4764 at 145.578247 yards.
(5139, 1731, 1, 72.8817, -4528.48, 61.0341, 3.28124, 0, 0, -0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4942 at 9.754037 yards.
(4852, 1731, 1, 134.77, -4134.01, 54.8472, 2.23402, 0, 0, 0.898793, 0.438373, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4733 at 172.664963 yards.
(5147, 1731, 1, 35.3273, -4101.95, 63.2919, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4963 at 114.311241 yards.
(12635, 1731, 1, 1460.43, -4691.54, -3.10957, 2.25147, 0, 0, 0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 200.003128 yards.
(12647, 1731, 1, 1518.04, -4753.08, 14.9666, 2.82743, 0, 0, 0.987688, 0.156436, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 214.845856 yards.
(12755, 1731, 1, 1465.41, -4865.19, 13.0559, 1.76278, 0, 0, 0.771625, 0.636078, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 153.365005 yards.
(12757, 1731, 1, 1489.51, -4668.87, 3.7799, 2.9845, 0, 0, 0.996917, 0.0784664, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 235.744598 yards.
(12860, 1731, 1, 1467.48, -4778.02, 8.51495, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 159.420456 yards.
(12882, 1731, 1, 1509.96, -4862.17, 8.72121, 1.85005, 0, 0, 0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 196.548416 yards.
(5375, 1731, 1, -717.853, -4696.23, 37.8685, 2.42601, 0, 0, 0.936672, 0.350207, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5356 at 11.963171 yards.
(12486, 1731, 1, 593.889, -4185.87, 19.861, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12380 at 63.991489 yards.
(12892, 1731, 1, 1417.42, -4711.25, -0.304713, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 156.097702 yards.
(12898, 1731, 1, 1519.99, -4687.98, 9.02939, 0.925024, 0, 0, 0.446198, 0.894934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 247.208557 yards.
(12903, 1731, 1, 1488.58, -4816.56, 9.27292, 1.0821, 0, 0, 0.515037, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 172.637802 yards.
(12904, 1731, 1, 1517.21, -4965.98, 11.4182, 5.44543, 0, 0, -0.406736, 0.913545, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 243.372269 yards.
(12921, 1731, 1, 1459.55, -4745.43, -0.996877, 4.27606, 0, 0, -0.843391, 0.5373, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 166.766327 yards.
(12923, 1731, 1, 1513.36, -4712.86, 12.2831, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 228.072769 yards.
(5208, 1731, 1, 1041.65, -4731.42, 17.7684, 5.2709, 0, 0, -0.484809, 0.87462, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5045 at 65.936722 yards.
(12932, 1731, 1, 1464.22, -4891.54, 14.0545, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 160.593109 yards.
(12964, 1731, 1, 1458.08, -4807.5, 11.8591, 4.24115, 0, 0, -0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 143.142517 yards.
(12965, 1731, 1, 1562.55, -4769.49, 15.478, 6.00393, 0, 0, -0.139173, 0.990268, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 252.651917 yards.
(12490, 1731, 1, 1114.85, -4224.99, 28.0452, 0.541051, 0, 0, 0.267238, 0.963631, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12381 at 96.871674 yards.
(12496, 1731, 1, -398.531, -4747.13, 38.928, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12495 at 115.876434 yards.
(12966, 1731, 1, 1509.23, -4802.94, 8.99069, 5.75959, 0, 0, -0.258819, 0.965926, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12610 at 194.498184 yards.
(12968, 1731, 1, 1416.13, -4773.18, 4.92753, 4.10152, 0, 0, -0.887011, 0.461749, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 12610 at 115.012718 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5041, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4726, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12621, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4976, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5366, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4752, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5197, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12545, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5042, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5225, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12443, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4791, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4815, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5139, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(4852, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5147, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12635, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12647, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12755, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12757, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12860, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12882, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5375, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12486, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12892, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12898, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12903, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12904, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12921, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12923, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(5208, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12932, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12964, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12965, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12490, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12496, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12966, 1024, 0, 'Copper Vein', 0, 10), -- Copper Veins in Durotar 127 objects total
(12968, 1024, 0, 'Copper Vein', 0, 10); -- Copper Veins in Durotar 127 objects total

-- Missing Copper Vein spawns in The Barrens.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4667, 1731, 1, -3576.84, -2404.6, 99.1772, 4.93928, 0, 0, -0.622514, 0.782609, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4665 at 191.176743 yards.
(15157, 1731, 1, -1874.66, -3107.28, 106.662, 0.523598, 0, 0, 0.258819, 0.965926, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15137 at 215.239441 yards.
(5099, 1731, 1, -4146.65, -2297.33, 105.493, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5096 at 189.552582 yards.
(4677, 1731, 1, -3439.51, -2399.7, 97.3195, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4665 at 100.278099 yards.
(15503, 1731, 1, 1303.93, -3200.05, 96.2165, 4.43314, 0, 0, -0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15489 at 135.893280 yards.
(15703, 1731, 1, 630.384, -3078.95, 101.372, 1.53589, 0, 0, 0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15677 at 99.634911 yards.
(15752, 1731, 1, 682.998, -3525.74, 100.477, 5.32326, 0, 0, -0.461748, 0.887011, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15504 at 222.828827 yards.
(15765, 1731, 1, 865.913, -3474.46, 96.8132, 1.50098, 0, 0, 0.681998, 0.731354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15504 at 205.177032 yards.
(4915, 1731, 1, 272.095, -2466.54, 102.545, 1.11701, 0, 0, 0.529919, 0.848048, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4906 at 29.348421 yards.
(4931, 1731, 1, 155.229, -2527.16, 108.985, 2.72271, 0, 0, 0.978148, 0.207912, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4905 at 14.896626 yards.
(15170, 1731, 1, 388.236, -2245.49, 196.68, 0.087266, 0, 0, 0.0436192, 0.999048, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15163 at 139.500793 yards.
(4932, 1731, 1, 182.288, -1926.24, 100.09, 3.80482, 0, 0, -0.945518, 0.325568, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4901 at 27.270662 yards.
(15171, 1731, 1, 428.281, -1788.9, 115.552, 4.08407, 0, 0, -0.891007, 0.453991, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15165 at 112.653305 yards.
(15772, 1731, 1, -344.821, -1543.51, 101.365, 3.42085, 0, 0, -0.990268, 0.139175, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15484 at 102.560036 yards.
(4934, 1731, 1, -25.0396, -2447.36, 126.414, 1.69297, 0, 0, 0.748956, 0.66262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4904 at 70.107422 yards.
(15773, 1731, 1, 639.388, -3394.1, 168.933, 6.14356, 0, 0, -0.0697555, 0.997564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15502 at 123.692184 yards.
(15774, 1731, 1, 868.723, -3359.76, 175.461, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15679 at 109.705917 yards.
(4936, 1731, 1, 183.748, -1734.99, 97.5922, 5.95157, 0, 0, -0.165047, 0.986286, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4898 at 126.155830 yards.
(15781, 1731, 1, 973.186, -3225.1, 101.245, 0.401425, 0, 0, 0.199367, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15486 at 123.050804 yards.
(15782, 1731, 1, -501.907, -1354.49, 92.7284, 2.00713, 0, 0, 0.843391, 0.5373, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15484 at 258.771423 yards.
(15172, 1731, 1, -1470.98, -3785.21, 35.7294, 2.53072, 0, 0, 0.953716, 0.300708, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15135 at 118.672035 yards.
(15785, 1731, 1, -1175.11, -2532.84, 123.906, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15491 at 106.732040 yards.
(5079, 1731, 1, -724.941, -2151.03, 138.44, 2.63544, 0, 0, 0.968147, 0.250381, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5075 at 49.605778 yards.
(16055, 1731, 1, -2494.99, -2542.07, 96.1752, 3.99681, 0, 0, -0.909961, 0.414694, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15682 at 174.200211 yards.
(4978, 1731, 1, -511.093, -3651.16, 101.68, 5.81195, 0, 0, -0.233445, 0.97237, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4913 at 100.836494 yards.
(4983, 1731, 1, -370.268, -3674.13, 46.1044, 4.2237, 0, 0, -0.857167, 0.515038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4913 at 103.436005 yards.
(16059, 1731, 1, -520.767, -3323.54, 94.2695, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15676 at 94.059853 yards.
(15414, 1731, 1, -1548.2, -3675.97, 101.596, 6.23083, 0, 0, -0.0261765, 0.999657, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15400 at 176.499176 yards.
(16075, 1731, 1, -100.367, -1315.26, 97.9216, 5.88176, 0, 0, -0.199367, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15483 at 101.667915 yards.
(16077, 1731, 1, -1566.68, -2692.2, 90.0199, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15491 at 321.527618 yards.
(16086, 1731, 1, -1593.09, -1622.81, 116.249, 4.67748, 0, 0, -0.719339, 0.694659, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15453 at 131.208740 yards.
(5331, 1731, 1, -1447.37, -2373.73, 112.527, 3.42085, 0, 0, -0.990268, 0.139175, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5330 at 65.658264 yards.
(4653, 1731, 1, -1706.42, -3703.33, 33.6647, 2.35619, 0, 0, 0.92388, 0.382683, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4648 at 239.758499 yards.
(16092, 1731, 1, 420.65, -3565.02, 56.9573, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15509 at 288.195343 yards.
(4702, 1731, 1, -2912.52, -1925.08, 92.8999, 0.0349062, 0, 0, 0.0174522, 0.999848, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4692 at 171.647919 yards.
(16093, 1731, 1, -2635.87, -2400.89, 95.7149, 0.558504, 0, 0, 0.275637, 0.961262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15682 at 62.421898 yards.
(16096, 1731, 1, -720.831, -2347.2, 137.162, 2.65289, 0, 0, 0.970295, 0.241925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15458 at 94.659500 yards.
(16104, 1731, 1, 814.091, -3138.75, 174.867, 3.29869, 0, 0, -0.996917, 0.0784664, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15486 at 92.552986 yards.
(16105, 1731, 1, -1180.05, -2749.38, 102.568, 5.34071, 0, 0, -0.45399, 0.891007, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15492 at 167.256729 yards.
(15173, 1731, 1, 255.976, -2246.03, 220.337, 0.663223, 0, 0, 0.325567, 0.945519, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15163 at 196.445541 yards.
(16120, 1731, 1, -1086.62, -1575, 166.013, 3.56047, 0, 0, -0.978148, 0.207912, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15487 at 151.688263 yards.
(16123, 1731, 1, -566.826, -1441.67, 97.7237, 3.90954, 0, 0, -0.927183, 0.374608, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15454 at 234.563171 yards.
(15174, 1731, 1, 935.746, -2715.83, 103.601, 5.21854, 0, 0, -0.507538, 0.861629, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15150 at 222.048416 yards.
(16132, 1731, 1, 618.11, -3663.26, 43.0938, 3.97936, 0, 0, -0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15504 at 222.923889 yards.
(16174, 1731, 1, -648.439, -1595.35, 114.387, 4.31097, 0, 0, -0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15454 at 136.345490 yards.
(5277, 1731, 1, -1987.63, -2931.69, 94.5732, 5.98648, 0, 0, -0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5134 at 125.878380 yards.
(16190, 1731, 1, 503.881, -3469.48, 104.275, 4.5204, 0, 0, -0.771625, 0.636078, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 15509 at 195.533768 yards.
(15177, 1731, 1, -1459.06, -3604.05, 93.9616, 2.96704, 0, 0, 0.996194, 0.087165, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 15155 at 89.144554 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4667, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15157, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(5099, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4677, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15503, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15703, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15752, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15765, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4915, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4931, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15170, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4932, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15171, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15772, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4934, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15773, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15774, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4936, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15781, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15782, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15172, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15785, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(5079, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16055, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4978, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4983, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16059, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15414, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16075, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16077, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16086, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(5331, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4653, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16092, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(4702, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16093, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16096, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16104, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16105, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15173, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16120, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16123, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15174, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16132, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16174, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(5277, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(16190, 1033, 0, 'Copper Vein', 0, 10), -- Copper Veins in Barrens 147 objects total
(15177, 1033, 0, 'Copper Vein', 0, 10); -- Copper Veins in Barrens 147 objects total

-- Missing Copper Vein spawns in Loch Modan.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(13481, 1731, 0, -5423.67, -2709.96, 368.752, 2.51327, 0, 0, 0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13480 at 66.754196 yards.
(29975, 1731, 0, -5815.49, -3477.51, 313.627, 0.244346, 0, 0, 0.121869, 0.992546, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 29974 at 90.606567 yards.
(13180, 1731, 0, -5582.72, -3545.79, 290.129, 5.044, 0, 0, -0.580703, 0.814116, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13142 at 159.651794 yards.
(13085, 1731, 0, -4863.07, -3003.43, 317.635, 6.16101, 0, 0, -0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13077 at 29.508289 yards.
(30038, 1731, 0, -4789.87, -3009.63, 307.927, 0.994837, 0, 0, 0.477158, 0.878817, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30029 at 52.839615 yards.
(30048, 1731, 0, -4835.49, -2962.1, 321.342, 1.93731, 0, 0, 0.824125, 0.566408, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30029 at 24.406563 yards.
(13482, 1731, 0, -4661.44, -2844.7, 326.785, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13423 at 156.450027 yards.
(30060, 1731, 0, -4907.81, -2994.97, 318.189, 2.67035, 0, 0, 0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30039 at 28.538784 yards.
(13483, 1731, 0, -5268.53, -2691.13, 351.273, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13425 at 38.412075 yards.
(13010, 1731, 0, -5162.66, -2647.23, 354.12, 5.41052, 0, 0, -0.422618, 0.906308, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 13005 at 124.240875 yards.
(5062, 1731, 0, -5116.83, -3976.2, 319.844, 4.17134, 0, 0, -0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5030 at 167.433594 yards.
(12914, 1731, 0, -5919.37, -4147.32, 403.105, 4.15388, 0, 0, -0.874619, 0.48481, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12906 at 90.713943 yards.
(5083, 1731, 0, -5930.48, -3610.93, 355.29, 0.383971, 0, 0, 0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5076 at 82.315285 yards.
(30083, 1731, 0, -6054.89, -2957.95, 401.839, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30080 at 112.787727 yards.
(30086, 1731, 0, -6161.33, -3029.14, 392.284, 5.96903, 0, 0, -0.156434, 0.987688, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30080 at 233.635605 yards.
(30088, 1731, 0, -6111.96, -2923.7, 401.062, 1.69297, 0, 0, 0.748956, 0.66262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30080 at 128.403000 yards.
(30090, 1731, 0, -6141, -2972.89, 400.16, 2.80997, 0, 0, 0.986285, 0.16505, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30080 at 180.377579 yards.
(5276, 1731, 0, -6093.14, -3050.13, 400.793, 5.70723, 0, 0, -0.284015, 0.95882, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5113 at 209.996368 yards.
(5287, 1731, 0, -5474.6, -3864.09, 331.252, 1.29154, 0, 0, 0.601814, 0.798636, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4806 at 119.862503 yards.
(30027, 1731, 0, -4733.4, -3428.12, 287.19, 0.90757, 0, 0, 0.438371, 0.898794, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30019 at 162.421051 yards.
(12967, 1731, 0, -5302.34, -3377.92, 286.355, 5.20108, 0, 0, -0.515037, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 12806 at 80.588058 yards.
(5290, 1731, 0, -5815.2, -3610.52, 356.486, 3.24635, 0, 0, -0.998629, 0.0523532, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5076 at 35.802914 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(13481, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(29975, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(13180, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(13085, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30038, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30048, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(13482, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30060, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(13483, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(13010, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(5062, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(12914, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(5083, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30083, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30086, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30088, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30090, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(5276, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(5287, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(30027, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(12967, 1166, 0, 'Copper Vein', 0, 10), -- Copper Veins in Loch Modan 82 objects total
(5290, 1166, 0, 'Copper Vein', 0, 10); -- Copper Veins in Loch Modan 82 objects total

-- Missing Copper Vein spawns in Westfall.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(42690, 1731, 0, -11400, 1979.35, 5.21146, 2.32129, 0, 0, 0.91706, 0.39875, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 42672 at 327.283142 yards.
(30589, 1731, 0, -9815.68, 1416.98, 38.3897, 1.3439, 0, 0, 0.622514, 0.782609, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30588 at 23.146305 yards.
(5237, 1731, 0, -10446.2, 1932.18, 13.1237, 3.05433, 0, 0, 0.999048, 0.0436193, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5184 at 25.339354 yards.
(31046, 1731, 0, -10492.3, 1913.15, 41.5969, 4.60767, 0, 0, -0.743144, 0.669132, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31031 at 51.295448 yards.
(31052, 1731, 0, -11298, 1636.16, 61.5966, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31051 at 120.152588 yards.
(5259, 1731, 0, -11257.2, 1054.57, 109.002, 6.16101, 0, 0, -0.0610485, 0.998135, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5212 at 265.812225 yards.
(5260, 1731, 0, -11151.8, 1017.99, 39.6759, 2.26892, 0, 0, 0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5212 at 144.808411 yards.
(30631, 1731, 0, -10238, 1316.13, 43.1496, 4.81711, 0, 0, -0.66913, 0.743145, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 30630 at 85.299858 yards.
(5261, 1731, 0, -11008.9, 835.871, 36.7729, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5212 at 124.818558 yards.
(31078, 1731, 0, -11320, 1603.41, 37.1515, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31051 at 155.571976 yards.
(31124, 1731, 0, -11324, 1599.41, 37.1515, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31051 at 161.152344 yards.
(31129, 1731, 0, -11446.9, 1718.49, 13.7341, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31051 at 255.832291 yards.
(31142, 1731, 0, -11557.6, 1578.82, -14.9868, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 31051 at 386.171143 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(42690, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(30589, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(5237, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31046, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31052, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(5259, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(5260, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(30631, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(5261, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31078, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31124, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31129, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31142, 1111, 0, 'Copper Vein', 0, 10); -- Copper Veins in Westfall 57 objects total

-- Missing Copper Vein spawns in Redridge Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5454, 1731, 0, -9412.47, -2484.25, 30.4685, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5451 at 199.561432 yards.
(5220, 1731, 0, -9519.65, -2103.17, 94.1483, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5026 at 120.854492 yards.
(4876, 1731, 0, -9590.31, -2733.05, 57.7435, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4863 at 92.383362 yards.
(20820, 1731, 0, -9638.75, -3028.55, 60.2563, 2.30383, 0, 0, 0.913545, 0.406738, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20787 at 143.259888 yards.
(31123, 1731, 0, -9821.69, -3219.74, 64.2859, 2.32129, 0, 0, 0.91706, 0.39875, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31116 at 149.990494 yards.
(5227, 1731, 0, -9086.08, -3267.75, 102.72, 1.22173, 0, 0, 0.573576, 0.819152, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5199 at 33.250244 yards.
(5229, 1731, 0, -9093.26, -3355.02, 102.589, 4.71239, 0, 0, -0.707107, 0.707107, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5199 at 57.098015 yards.
(18683, 1731, 0, -8718.69, -2251.12, 157.443, 5.09636, 0, 0, -0.559193, 0.829038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 18679 at 32.537891 yards.
(20461, 1731, 0, -8702.09, -2153.17, 156.936, 1.62316, 0, 0, 0.725374, 0.688355, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 20460 at 21.847931 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5454, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(5220, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(4876, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(20820, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(31123, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(5227, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(5229, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(18683, 1128, 0, 'Copper Vein', 0, 10), -- Copper Veins in Redridge 52 objects total
(20461, 1128, 0, 'Copper Vein', 0, 10); -- Copper Veins in Redridge 52 objects total

-- Missing Copper Vein spawns in Tirisfal Glades.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4927, 1731, 0, 2440.95, 266.685, 29.7319, 3.73501, 0, 0, -0.956305, 0.292372, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4926 at 214.143005 yards.
(45077, 1731, 0, 2620.32, 1454.64, -8.52259, 4.71239, 0, 0, -0.707107, 0.707107, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45073 at 124.689903 yards.
(45079, 1731, 0, 1572.09, -687.518, 57.2998, 1.37881, 0, 0, 0.636078, 0.771625, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 450.777008 yards.
(45081, 1731, 0, 1727.84, 808.579, 68.0469, 4.72984, 0, 0, -0.700909, 0.713251, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45076 at 89.095276 yards.
(45082, 1731, 0, 1619.52, -560.97, 55.0243, 0.453785, 0, 0, 0.224951, 0.97437, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 405.084290 yards.
(45085, 1731, 0, 1633.95, -687.568, 47.3942, 3.26377, 0, 0, -0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 389.923096 yards.
(4943, 1731, 0, 1779.62, -287.058, 42.0114, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4929 at 354.680389 yards.
(45090, 1731, 0, 1781.53, -748.291, 63.1567, 2.00713, 0, 0, 0.843391, 0.5373, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 266.031891 yards.
(45246, 1731, 0, 3019.68, 162.956, -7.08108, 4.43314, 0, 0, -0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45245 at 261.332031 yards.
(45092, 1731, 0, 1702.92, 768.162, 69.0627, 2.3911, 0, 0, 0.930417, 0.366502, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45076 at 132.717575 yards.
(5486, 1731, 0, 2756.54, 1079.45, 110.497, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5482 at 156.706741 yards.
(4945, 1731, 0, 2101.47, -319.793, 52.2458, 0.0523589, 0, 0, 0.0261765, 0.999657, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4929 at 32.180180 yards.
(35480, 1731, 0, 2196.57, -500.417, 86.2787, 5.79449, 0, 0, -0.241921, 0.970296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35477 at 76.131325 yards.
(45098, 1731, 0, 1889.28, -681.401, 50.7889, 5.68977, 0, 0, -0.292372, 0.956305, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 140.968643 yards.
(5372, 1731, 0, 2510.7, -376.824, 85.8907, 5.70723, 0, 0, -0.284015, 0.95882, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5359 at 163.016388 yards.
(5185, 1731, 0, 2764.11, -473.161, 100.833, 5.63741, 0, 0, -0.317305, 0.948324, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5154 at 82.219421 yards.
(5487, 1731, 0, 1845.71, 778.281, 31.2142, 2.32129, 0, 0, 0.91706, 0.39875, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5483 at 119.641029 yards.
(32291, 1731, 0, 2673.29, -772.678, 85.4531, 5.86431, 0, 0, -0.207912, 0.978148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32219 at 71.419235 yards.
(45117, 1731, 0, 2892.56, -712.691, 143.279, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45114 at 95.276855 yards.
(35474, 1731, 0, 2473.59, -476.253, 79.8804, 2.56563, 0, 0, 0.958819, 0.284016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35469 at 119.277153 yards.
(5051, 1731, 0, 1814.78, -141.659, 49.7266, 3.05433, 0, 0, 0.999048, 0.0436193, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4929 at 362.328491 yards.
(4781, 1731, 0, 2221.54, 616.308, 27.6591, 4.53786, 0, 0, -0.766044, 0.642789, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4732 at 8.689577 yards.
(45124, 1731, 0, 2489.71, 1485.08, 8.52363, 5.49779, 0, 0, -0.382683, 0.92388, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45080 at 250.517975 yards.
(45132, 1731, 0, 1904.54, -803.336, 71.4108, 1.02974, 0, 0, 0.492423, 0.870356, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 209.277542 yards.
(5278, 1731, 0, 2084.35, -290.538, 48.3615, 2.05949, 0, 0, 0.857167, 0.515038, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4929 at 55.086319 yards.
(45136, 1731, 0, 2454.74, -1084.52, 103.86, 4.69494, 0, 0, -0.71325, 0.70091, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45084 at 308.469788 yards.
(45142, 1731, 0, 2489.14, -1011.01, 80.4089, 3.29869, 0, 0, -0.996917, 0.0784664, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45084 at 245.655853 yards.
(45040, 1731, 0, 2983.78, -474.167, 83.9406, 0.523598, 0, 0, 0.258819, 0.965926, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45036 at 126.239632 yards.
(5387, 1731, 0, 2448.6, 672.04, 36.6997, 1.22173, 0, 0, 0.573576, 0.819152, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5369 at 99.215019 yards.
(45260, 1731, 0, 2698.05, 576.933, 18.7021, 0.733038, 0, 0, 0.358368, 0.933581, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45239 at 81.951500 yards.
(45272, 1731, 0, 2783.56, 504.424, 27.0137, 2.63544, 0, 0, 0.968147, 0.250381, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45242 at 154.590942 yards.
(45069, 1731, 0, 2585.97, -307.915, 72.41, 1.46608, 0, 0, 0.66913, 0.743145, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45037 at 177.989960 yards.
(45144, 1731, 0, 2896.65, -399.971, 84.3644, 5.5676, 0, 0, -0.350207, 0.936672, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45039 at 77.563347 yards.
(45276, 1731, 0, 3059.6, 460.269, 10.4857, 5.51524, 0, 0, -0.374606, 0.927184, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45245 at 117.056557 yards.
(45163, 1731, 0, 2416.76, 1470.06, 39.4758, 0.890117, 0, 0, 0.43051, 0.902586, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45080 at 178.611893 yards.
(45171, 1731, 0, 2421.14, 1762.29, 36.7975, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45080 at 300.222412 yards.
(45176, 1731, 0, 2646.08, 1350.02, 9.43725, 4.60767, 0, 0, -0.743144, 0.669132, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45074 at 72.936249 yards.
(5279, 1731, 0, 3023.28, 790.686, 87.5232, 0.436332, 0, 0, 0.216439, 0.976296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5063 at 229.351837 yards.
(45278, 1731, 0, 2896.04, 541.865, 93.0305, 4.01426, 0, 0, -0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45242 at 113.508842 yards.
(45177, 1731, 0, 2505.24, 745.556, 120.932, 3.14159, 0, 0, -1, 0, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45041 at 109.357246 yards.
(5280, 1731, 0, 2270.86, 649.895, 25.2218, 1.97222, 0, 0, 0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4732 at 66.236565 yards.
(5388, 1731, 0, 2475.6, 482.201, 44.1396, 5.68977, 0, 0, -0.292372, 0.956305, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5369 at 99.314758 yards.
(35457, 1731, 0, 1744.57, 1164.62, 75.0946, 4.4855, 0, 0, -0.782608, 0.622515, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35456 at 109.604996 yards.
(35461, 1731, 0, 1908.19, 1077.63, 31.1444, 0.209439, 0, 0, 0.104528, 0.994522, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35456 at 87.433960 yards.
(45180, 1731, 0, 2371.46, -634.19, 68.5649, 5.65487, 0, 0, -0.309016, 0.951057, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45086 at 119.285645 yards.
(45213, 1731, 0, 2889.69, 1104.54, 115.668, 4.17134, 0, 0, -0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45034 at 240.519531 yards.
(45221, 1731, 0, 2410.51, 846.121, 62.4501, 1.0821, 0, 0, 0.515037, 0.857168, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45041 at 50.092072 yards.
(45222, 1731, 0, 1897.42, -749.906, 64.4441, 1.39626, 0, 0, 0.642787, 0.766045, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 45075 at 171.999329 yards.
(32292, 1731, 0, 2109.25, -590.871, 65.8331, 3.01941, 0, 0, 0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32216 at 73.612442 yards.
(5291, 1731, 0, 2202.98, -65.3898, 30.8705, 3.52557, 0, 0, -0.981627, 0.190812, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 4929 at 260.632629 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4927, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45077, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45079, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45081, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45082, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45085, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(4943, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45090, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45246, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45092, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5486, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(4945, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(35480, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45098, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5372, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5185, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5487, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(32291, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45117, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(35474, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5051, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(4781, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45124, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45132, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5278, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45136, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45142, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45040, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5387, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45260, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45272, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45069, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45144, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45276, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45163, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45171, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45176, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5279, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45278, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45177, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5280, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5388, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(35457, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(35461, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45180, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45213, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45221, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(45222, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(32292, 1008, 0, 'Copper Vein', 0, 10), -- Copper Veins in Tirisfal 45 objects total
(5291, 1008, 0, 'Copper Vein', 0, 10); -- Copper Veins in Tirisfal 45 objects total

-- Missing Copper Vein spawns in Silverpine Forest.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5114, 1731, 0, 1196.38, 1447.38, 44.417, 3.194, 0, 0, -0.999657, 0.0262017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5104 at 100.729660 yards.
(5368, 1731, 0, 815.299, 1506.07, 47.6115, 5.35816, 0, 0, -0.446198, 0.894934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5357 at 111.657104 yards.
(5102, 1731, 0, 1035.11, 1633.56, 28.2433, 0.261798, 0, 0, 0.130526, 0.991445, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5093 at 66.396202 yards.
(35523, 1731, 0, 1086.69, 1964.56, 8.29545, 4.66003, 0, 0, -0.725374, 0.688355, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35513 at 65.583778 yards.
(35540, 1731, 0, 1324.64, 1969.28, 14.6851, 0.331611, 0, 0, 0.165047, 0.986286, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35534 at 15.321317 yards.
(35549, 1731, 0, 1361.38, 1971.22, 13.9368, 2.82743, 0, 0, 0.987688, 0.156436, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 35535 at 22.792309 yards.
(4771, 1731, 0, 1292.67, 1379.22, 53.7565, 2.51327, 0, 0, 0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4758 at 19.329975 yards.
(5414, 1731, 0, 1051.6, 742.094, 59.4798, 1.64061, 0, 0, 0.731353, 0.681999, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5402 at 138.104782 yards.
(4701, 1731, 0, 1193.68, 1263.56, 49.0877, 1.74533, 0, 0, 0.766044, 0.642789, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4694 at 78.271744 yards.
(42071, 1731, 0, 396.622, 1014.3, 110.456, 1.78023, 0, 0, 0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 42063 at 25.345425 yards.
(5281, 1731, 0, 310.01, 1083.07, 105.552, 0.296705, 0, 0, 0.147809, 0.989016, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5217 at 45.650600 yards.
(5285, 1731, 0, -476.366, 1585.88, 17.7124, 6.12611, 0, 0, -0.0784588, 0.996917, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4987 at 69.269257 yards.
(5289, 1731, 0, -522.009, 1252.89, 68.4464, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4846 at 167.672363 yards.
(42072, 1731, 0, 416.263, 1036.77, 106.968, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 42063 at 27.601015 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5114, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5368, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5102, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35523, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35540, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(35549, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(4771, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5414, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(4701, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(42071, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5281, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5285, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(5289, 1044, 0, 'Copper Vein', 0, 10), -- Copper Veins in Silverpine Forest 92 objects total
(42072, 1044, 0, 'Copper Vein', 0, 10); -- Copper Veins in Silverpine Forest 92 objects total

-- Missing Copper Vein spawns in Darkshore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(48752, 1731, 1, 7342.31, -1098.23, 47.9114, 0.558504, 0, 0, 0.275637, 0.961262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48748 at 140.397736 yards.
(48777, 1731, 1, 7513.76, -580.116, 0.446005, 0.401425, 0, 0, 0.199367, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48773 at 84.475136 yards.
(5345, 1731, 1, 5906.93, 616.413, 1.08114, 4.69494, 0, 0, -0.71325, 0.70091, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5335 at 311.647919 yards.
(32673, 1731, 1, 4662.22, 766.788, 30.5175, 3.29869, 0, 0, -0.996917, 0.0784664, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 32672 at 100.146645 yards.
(5446, 1731, 1, 5153.76, 458.863, 26.0669, 1.43117, 0, 0, 0.656058, 0.75471, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5444 at 109.739151 yards.
(48659, 1731, 1, 6335.66, -169.052, 47.5812, 6.0912, 0, 0, -0.0958452, 0.995396, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48570 at 79.701920 yards.
(5216, 1731, 1, 6866.71, -659.674, 83.6733, 5.3058, 0, 0, -0.469471, 0.882948, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5066 at 41.472496 yards.
(4861, 1731, 1, 6872.02, -628.109, 84.8797, 3.194, 0, 0, -0.999657, 0.0262017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4729 at 24.917820 yards.
(48859, 1731, 1, 7517.69, -725.736, 3.49451, 2.00713, 0, 0, 0.843391, 0.5373, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48771 at 57.094822 yards.
(48686, 1731, 1, 7346.2, -35.5666, 11.517, 2.68781, 0, 0, 0.97437, 0.224951, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48666 at 154.081268 yards.
(48759, 1731, 1, 7245.04, 151.198, 5.61268, 3.50812, 0, 0, -0.983254, 0.182238, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 48666 at 118.755966 yards.
(4875, 1731, 1, 4612.88, 634.874, 6.40536, 0.750491, 0, 0, 0.366501, 0.930418, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4797 at 38.631809 yards.
(5266, 1731, 1, 5200.01, 116.131, 61.4818, 0.59341, 0, 0, 0.292371, 0.956305, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4747 at 77.528061 yards.
(5282, 1731, 1, 6585.01, 291.717, 39.6147, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4809 at 62.949802 yards.
(4658, 1731, 1, 6033.26, 155.371, 22.8641, 0.314158, 0, 0, 0.156434, 0.987688, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4652 at 74.379387 yards.
(5324, 1731, 1, 6704.14, -426.594, 74.9637, 2.11185, 0, 0, 0.870356, 0.492424, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5317 at 72.293015 yards.
(5488, 1731, 1, 6884.74, -458.588, 41.7223, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5351 at 124.847725 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(48752, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48777, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5345, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(32673, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5446, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48659, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5216, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(4861, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48859, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48686, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(48759, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(4875, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5266, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5282, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(4658, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5324, 1098, 0, 'Copper Vein', 0, 10), -- Copper Veins in Darkshore 84 objects total
(5488, 1098, 0, 'Copper Vein', 0, 10); -- Copper Veins in Darkshore 84 objects total

-- Missing Copper Vein spawns in Mulgore.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(20732, 1731, 1, -2321.38, 376.604, 68.9614, 4.7822, 0, 0, -0.681998, 0.731354, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20716 at 26.353764 yards.
(4973, 1731, 1, -2266.06, 324.555, 114.628, 2.44346, 0, 0, 0.939692, 0.342021, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4956 at 73.301300 yards.
(4811, 1731, 1, -2745.81, -1099.56, 34.6196, 3.59538, 0, 0, -0.97437, 0.224951, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4794 at 254.238770 yards.
(5164, 1731, 1, -948.007, -1154.67, 93.4486, 4.03171, 0, 0, -0.902585, 0.430512, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5157 at 322.289948 yards.
(20709, 1731, 1, -2351.13, 366.964, 64.8289, 6.26573, 0, 0, -0.00872612, 0.999962, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20667 at 36.967533 yards.
(20735, 1731, 1, -2316.38, 421.633, 49.3617, 3.15906, 0, 0, -0.999962, 0.00873464, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20716 at 40.977459 yards.
(5187, 1731, 1, -917.607, -1080.39, 77.0898, 1.16937, 0, 0, 0.551936, 0.833886, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5157 at 240.488052 yards.
(20736, 1731, 1, -973.593, -1207.51, 104.673, 2.18166, 0, 0, 0.887011, 0.461749, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20720 at 330.105164 yards.
(20741, 1731, 1, -2305.67, 463.42, 47.8758, 4.7473, 0, 0, -0.694658, 0.71934, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20716 at 78.788521 yards.
(5262, 1731, 1, -2832.31, -719.423, 36.6097, 3.28124, 0, 0, -0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5247 at 78.750275 yards.
(4892, 1731, 1, -2706.93, -1273.01, 38.5069, 4.53786, 0, 0, -0.766044, 0.642789, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4794 at 80.432587 yards.
(5263, 1731, 1, -2764.18, -1390.74, 63.256, 5.79449, 0, 0, -0.241921, 0.970296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4794 at 62.811054 yards.
(5457, 1731, 1, -1656.59, -857.758, 42.3553, 2.02458, 0, 0, 0.848047, 0.529921, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5450 at 64.815781 yards.
(20742, 1731, 1, -1902.6, 411.649, 134.422, 1.83259, 0, 0, 0.793353, 0.608762, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20712 at 86.676834 yards.
(20710, 1731, 1, -1723.8, -1171.47, 114.257, 5.84685, 0, 0, -0.216439, 0.976296, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20669 at 81.843971 yards.
(20744, 1731, 1, -1734.81, -1271.49, 115.614, 0.994837, 0, 0, 0.477158, 0.878817, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20669 at 26.286062 yards.
(20652, 1731, 1, -1495.55, -951.971, 144.255, 2.74016, 0, 0, 0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20642 at 61.320614 yards.
(20653, 1731, 1, -1439.97, -977.927, 145.568, 3.82227, 0, 0, -0.942641, 0.333808, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20641 at 52.882347 yards.
(20745, 1731, 1, -1158.87, -1189.76, 67.4503, 3.61284, 0, 0, -0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20720 at 162.088440 yards.
(5265, 1731, 1, -2102.07, -1112.8, 33.3685, 3.94445, 0, 0, -0.920505, 0.390732, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4855 at 14.059629 yards.
(20749, 1731, 1, -1037.59, -1101.76, 45.8684, 4.24115, 0, 0, -0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20720 at 236.079865 yards.
(5271, 1731, 1, -887.394, -970.533, 31.9752, 3.26377, 0, 0, -0.998135, 0.0610518, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5157 at 124.883499 yards.
(5272, 1731, 1, -738.586, -825.43, 52.3338, 6.19592, 0, 0, -0.0436192, 0.999048, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5233 at 67.961960 yards.
(20751, 1731, 1, -686.463, -243.221, -4.68434, 4.55531, 0, 0, -0.760405, 0.649449, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20662 at 267.197388 yards.
(20752, 1731, 1, -1466.25, 320.241, 56.9725, 2.26892, 0, 0, 0.906307, 0.422619, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 20668 at 65.016197 yards.
(5275, 1731, 1, -864.57, -1157.19, 118.865, 4.90438, 0, 0, -0.636078, 0.771625, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5157 at 306.948273 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(20732, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(4973, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(4811, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5164, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20709, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20735, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5187, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20736, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20741, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5262, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(4892, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5263, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5457, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20742, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20710, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20744, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20652, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20653, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20745, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5265, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20749, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5271, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5272, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20751, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(20752, 1028, 0, 'Copper Vein', 0, 10), -- Copper Veins in Mulgore 64 objects total
(5275, 1028, 0, 'Copper Vein', 0, 10); -- Copper Veins in Mulgore 64 objects total

-- Missing Copper Vein spawns in Hillsbrad Foothills.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(27641, 1731, 0, -1458.58, -1085.96, 7.96406, 5.14872, 0, 0, -0.537299, 0.843392, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 27640 at 439.809662 yards.
(25046, 1731, 0, -1048.94, -13.9949, 17.3759, 0.331611, 0, 0, 0.165047, 0.986286, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 25045 at 243.163498 yards.
(34278, 1731, 0, -1151.24, 112.54, 8.40114, 5.88176, 0, 0, -0.199367, 0.979925, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34265 at 325.817139 yards.
(21259, 1731, 0, -435.648, 303.569, 99.0216, 1.0472, 0, 0, 0.5, 0.866025, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 21256 at 65.334122 yards.
(21273, 1731, 0, -472.812, 368.856, 106.055, 2.67035, 0, 0, 0.972369, 0.233448, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 21256 at 138.939484 yards.
(21274, 1731, 0, -291.258, 293.587, 118.587, 0.767944, 0, 0, 0.374606, 0.927184, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 21257 at 68.116074 yards.
(21251, 1731, 0, -383.365, -182.706, 61.7857, 5.23599, 0, 0, -0.5, 0.866025, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 21237 at 366.416260 yards.
(34238, 1731, 0, -357.374, -456.945, 57.1996, 1.6057, 0, 0, 0.719339, 0.694659, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34233 at 388.180023 yards.
(21276, 1731, 0, -1004.35, -339.056, 13.7319, 0.226893, 0, 0, 0.113203, 0.993572, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 21237 at 278.253326 yards.
(25047, 1731, 0, -745.488, -98.0213, 57.8578, 1.81514, 0, 0, 0.788011, 0.615662, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 25045 at 137.020996 yards.
(5391, 1731, 0, -526.157, 480.685, 86.8847, 4.20625, 0, 0, -0.861628, 0.507539, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5380 at 139.104050 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(27641, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(25046, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(34278, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(21259, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(21273, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(21274, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(21251, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(34238, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(21276, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(25047, 1066, 0, 'Copper Vein', 0, 10), -- Copper Veins in Hillsbrad 20 objects total
(5391, 1066, 0, 'Copper Vein', 0, 10); -- Copper Veins in Hillsbrad 20 objects total

-- Missing Copper Vein spawns in Ashenvale.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4869, 1731, 1, 2985.02, 467.96, 21.9406, 1.13446, 0, 0, 0.537299, 0.843392, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4867 at 8.009382 yards.
(4896, 1731, 1, 2264.69, -2416.11, 120.281, 3.59538, 0, 0, -0.97437, 0.224951, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4894 at 365.959076 yards.
(5067, 1731, 1, 2970.24, -2967.93, 213.904, 4.20625, 0, 0, -0.861628, 0.507539, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4897 at 139.529037 yards.
(4884, 1731, 1, 3199.7, -121.156, 110.164, 4.62512, 0, 0, -0.737277, 0.675591, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4882 at 5.596460 yards.
(5269, 1731, 1, 2372.44, -259.678, 103.681, 3.75246, 0, 0, -0.953716, 0.300708, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4878 at 27.056517 yards.
(5270, 1731, 1, 3457.16, -345.805, 136.905, 5.13127, 0, 0, -0.544639, 0.838671, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4871 at 311.017548 yards.
(5284, 1731, 1, 3209.08, 104.121, 25.2081, 2.19912, 0, 0, 0.891007, 0.453991, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 4873 at 58.807552 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4869, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(4896, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(5067, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(4884, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(5269, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(5270, 1075, 0, 'Copper Vein', 0, 10), -- Copper Veins in Ashenvale 69 objects total
(5284, 1075, 0, 'Copper Vein', 0, 10); -- Copper Veins in Ashenvale 69 objects total

-- Missing Copper Vein spawns in Thousand Needles.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5408, 1731, 1, -4571.58, -1204.01, -45.4149, 2.86233, 0, 0, 0.990268, 0.139175, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5406 at 27.243410 yards.
(5365, 1731, 1, -4651.72, -1381.44, -42.4803, 3.17653, 0, 0, -0.999847, 0.0174693, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5360 at 16.329826 yards.
(4763, 1731, 1, -4454.48, -849.572, -51.5708, 2.86233, 0, 0, 0.990268, 0.139175, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4760 at 86.603409 yards.
(5196, 1731, 1, -5183.99, -2413.04, -41.9981, 3.7001, 0, 0, -0.961261, 0.27564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5188 at 18.782339 yards.
(4769, 1731, 1, -5038.51, -2016.74, -46.3377, 3.47321, 0, 0, -0.986285, 0.16505, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4762 at 23.013298 yards.
(17146, 1731, 1, -4761.79, -1062.75, -54.6378, 2.93214, 0, 0, 0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 17096 at 119.429527 yards.
(4724, 1731, 1, -4678.42, -1576.62, -28.2, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4715 at 141.308990 yards.
(4853, 1731, 1, -4620.59, -1715.86, -22.4819, 5.75959, 0, 0, -0.258819, 0.965926, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4734 at 9.581993 yards.
(4706, 1731, 1, -4870.76, -1858.29, -49.852, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4690 at 108.807823 yards.
(5267, 1731, 1, -5553.85, -2075.2, -58.7253, 1.16937, 0, 0, 0.551936, 0.833886, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4914 at 77.044006 yards.
(5273, 1731, 1, -5140.26, -1305.46, -45.5541, 1.85005, 0, 0, 0.798635, 0.601815, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4735 at 77.157600 yards.
(17150, 1731, 1, -4868.77, -1196.56, -46.683, 5.46288, 0, 0, -0.398748, 0.91706, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 17096 at 92.585220 yards.
(5274, 1731, 1, -4913.51, -1285.78, -32.4988, 0.628317, 0, 0, 0.309016, 0.951057, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 5088 at 5.523532 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5408, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(5365, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(4763, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(5196, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(4769, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(17146, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(4724, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(4853, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(4706, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(5267, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(5273, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(17150, 1130, 0, 'Copper Vein', 0, 10), -- Copper Veins in Thousand Needles 48 objects total
(5274, 1130, 0, 'Copper Vein', 0, 10); -- Copper Veins in Thousand Needles 48 objects total

-- Missing Copper Vein spawns in Desolace.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(34182, 1731, 1, -322.086, 1097.67, 94.8923, 0.558504, 0, 0, 0.275637, 0.961262, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34159 at 137.555084 yards.
(34185, 1731, 1, -546.85, 934.192, 96.0841, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34159 at 270.273682 yards.
(5443, 1731, 1, -151.837, 1466.23, 102.198, 5.55015, 0, 0, -0.358368, 0.933581, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5416 at 171.189301 yards.
(20659, 1731, 1, 56.7158, 1562.73, 123.846, 0.0174525, 0, 0, 0.00872612, 0.999962, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 20645 at 165.701279 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(34182, 1139, 0, 'Copper Vein', 0, 10), -- Copper Veins in Desolace 7 objects total
(34185, 1139, 0, 'Copper Vein', 0, 10), -- Copper Veins in Desolace 7 objects total
(5443, 1139, 0, 'Copper Vein', 0, 10), -- Copper Veins in Desolace 7 objects total
(20659, 1139, 0, 'Copper Vein', 0, 10); -- Copper Veins in Desolace 7 objects total

-- Missing Copper Vein spawns in Stonetalon Mountains.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(5025, 1731, 1, 1864.1, 849.441, 166.562, 2.72271, 0, 0, 0.978148, 0.207912, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4989 at 172.143051 yards.
(47695, 1731, 1, 979.869, -500.204, 18.4638, 3.54302, 0, 0, -0.979924, 0.19937, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 47669 at 220.235672 yards.
(4813, 1731, 1, 808.304, 157.392, 53.6267, 3.76991, 0, 0, -0.951056, 0.309017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4800 at 157.737137 yards.
(5036, 1731, 1, -197.107, -537.874, 20.8429, 0.733038, 0, 0, 0.358368, 0.933581, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5031 at 36.021278 yards.
(4722, 1731, 1, 577.224, 427.996, 64.4729, 4.50295, 0, 0, -0.777145, 0.629321, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4714 at 165.453278 yards.
(5135, 1731, 1, 2445.04, 1097.22, 338.232, 0.698131, 0, 0, 0.34202, 0.939693, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5108 at 140.334595 yards.
(5028, 1731, 1, 1794.04, 1073.96, 175.753, 2.63544, 0, 0, 0.968147, 0.250381, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4989 at 77.580521 yards.
(4850, 1731, 1, 985.175, 430.589, 82.1604, 1.29154, 0, 0, 0.601814, 0.798636, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4832 at 234.303055 yards.
(4772, 1731, 1, 1493.05, -277.715, 26.7762, 0.453785, 0, 0, 0.224951, 0.97437, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4749 at 85.595810 yards.
(5376, 1731, 1, -8.1365, 15.9418, 53.3904, 3.35105, 0, 0, -0.994521, 0.104535, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5370 at 52.096775 yards.
(5264, 1731, 1, -102.327, -575.467, -22.7587, 0.575957, 0, 0, 0.284015, 0.95882, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5031 at 141.483917 yards.
(47696, 1731, 1, 29.4685, -512.114, -15.0884, 1.25664, 0, 0, 0.587785, 0.809017, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 47664 at 163.043747 yards.
(5333, 1731, 1, 1872.95, 740.133, 162.041, 2.04204, 0, 0, 0.85264, 0.522499, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5329 at 130.682785 yards.
(5268, 1731, 1, 951.668, 335.818, 33.3591, 5.89921, 0, 0, -0.190808, 0.981627, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 4832 at 186.016495 yards.
(5479, 1731, 1, 2067.76, 1119.08, 268.521, 4.31097, 0, 0, -0.833885, 0.551938, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5415 at 9.929358 yards.
(5379, 1731, 1, 764.682, 1364.49, -2.69456, 5.77704, 0, 0, -0.25038, 0.968148, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 5358 at 109.447556 yards.
(47697, 1731, 1, 67.2039, -513.643, 39.1255, 5.49779, 0, 0, -0.382683, 0.92388, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 47664 at 121.331383 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(5025, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(47695, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(4813, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5036, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(4722, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5135, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5028, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(4850, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(4772, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5376, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5264, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(47696, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5333, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5268, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5479, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(5379, 1089, 0, 'Copper Vein', 0, 10), -- Copper Veins in Stonetalon 79 objects total
(47697, 1089, 0, 'Copper Vein', 0, 10); -- Copper Veins in Stonetalon 79 objects total

-- Missing Copper Vein spawns in The Deadmines.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(31948, 1731, 0, -11320.5, 1560.14, 28.3017, 0.139625, 0, 0, 0.0697555, 0.997564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31947 at 133.215271 yards.
(31950, 1731, 0, -11216.8, 1537.08, 36.0322, 6.14356, 0, 0, -0.0697555, 0.997564, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31947 at 35.250851 yards.
(31951, 1731, 0, -11201.5, 1520.96, 21.3151, 5.14872, 0, 0, -0.537299, 0.843392, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31947 at 32.067616 yards.
(31952, 1731, 0, -11113.2, 1484.9, 25.8984, 3.28124, 0, 0, -0.997563, 0.0697661, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31946 at 30.433355 yards.
(34835, 1731, 0, -11158.7, 1562.7, 23.7935, 4.45059, 0, 0, -0.793353, 0.608762, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 34832 at 17.687546 yards.
(31077, 1731, 0, -11231.4, 1625.16, 28.2586, 1.20428, 0, 0, 0.566406, 0.824126, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31053 at 56.532616 yards.
(31088, 1731, 0, -11175.3, 1637.78, 27.8243, 4.83456, 0, 0, -0.66262, 0.748956, 900, 900, 1, 100, 0, 10), -- Closest existing guid is 31053 at 17.661465 yards.
(31953, 1731, 0, -11306.8, 1566.3, 37.7273, 1.67551, 0, 0, 0.743144, 0.669132, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 31947 at 121.240852 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(31948, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31950, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31951, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31952, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(34835, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31077, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31088, 1111, 0, 'Copper Vein', 0, 10), -- Copper Veins in Westfall 57 objects total
(31953, 1111, 0, 'Copper Vein', 0, 10); -- Copper Veins in Westfall 57 objects total

-- Missing Copper Vein spawns in Thunder Bluff.
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecsmin`, `spawntimesecsmax`, `state`, `animprogress`, `patch_min`, `patch_max`) VALUES
(4851, 1731, 1, -959.687, -189.309, 25.0984, 0.453785, 0, 0, 0.224951, 0.97437, 900, 900, 1, 100, 0, 10); -- Closest existing guid is 4829 at 7.077521 yards.
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`, `patch_min`, `patch_max`) VALUES
(4851, 1028, 0, 'Copper Vein', 0, 10); -- Copper Veins in Mulgore 64 objects total


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
