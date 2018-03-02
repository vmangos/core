DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171208030510');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171208030510');
-- Add your query below.


-- After Broodlord pack
-- Delete the Wyrmguard as he does not belong here.
delete from creature where guid = "1177488";
-- 2 Extra Technicians removed.
delete from creature where guid = "84533";
delete from creature where guid = "84538";
-- Move Warlocks to correct pos
update creature set position_x = '-7544.968262', position_y = '-1016.955322', position_z = '449.242645', orientation = '0.936476', MovementType = 1,spawndist = 1 where guid = 84541;
update creature set position_x = '-7549.037109', position_y = '-1040.003662', position_z = '449.242432', orientation = '5.264749', MovementType = 1, spawndist = 1 where guid = 84542;
-- Technician Wrong side of tables
update creature set position_x = '-7551.408203', position_y = '-1038.997314', position_z = '449.242798', orientation = '2.069952', MovementType = 0, spawndist = 0 where guid = 1177495;
update creature set position_x = '-7550.064941', position_y = '-1037.947754', position_z = '449.242188', orientation = '2.124426', MovementType = 0, spawndist = 0 where guid = 84540;
update creature set position_x = '-7547.568848', position_y = '-1014.134521', position_z = '449.242126', orientation = '2.607141', MovementType = 0, spawndist = 0 where guid = 84535;
update creature set position_x = '-7550.685059', position_y = '-1014.255066', position_z = '449.242065', orientation = '1.061607', MovementType = 0, spawndist = 0 where guid = 1177494;

-- Left Wall Gap After Broodlord
-- Move Overseer Back
update creature set position_x = '-7527.931641', position_y = '-979.701904', position_z = '449.242371', MovementType = 1,spawndist = 3 where guid = 84558;
-- Blackwing Spellbinder patrol
update creature set MovementType = 2 where guid = 1177483;
delete from creature_movement where id = 1177483;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177483, 1, -7516.52, -961.477, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.50706, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177483, 2, -7540.07, -978.668, 449.242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.78079, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177483, 3, -7533.11, -987.51, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.83184, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177483, 4, -7540.32, -980.184, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.19193, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177483, 5, -7530.96, -971.668, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.14873, 0, 0);

-- Right wall After Broodlord
-- Update Warlocks
update creature set position_x = '-7519.007812', position_y = '-1054.881958', position_z = '449.242340', orientation = '2.114852', MovementType = 1, spawndist = 2 where guid = 84546;
update creature set position_x = '-7493.057617', position_y = '-1038.677979', position_z = '449.242340', orientation = '1.928732', MovementType = 1, spawndist = 2 where guid = 84553;
-- Blackiwng Spellbinder
update creature set position_x = '-7523.274414', position_y = '-1057.328735', position_z = '449.242340', orientation = '5.142570', MovementType = 2, spawndist = 0 where guid = 84548;
DELETE FROM `creature_movement` WHERE `id`=84548;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84548, 1, -7524.65, -1058.37, 449.243, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.31704, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84548, 2, -7510.44, -1047.04, 449.243, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.31704, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84548, 3, -7500.87, -1042.46, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.66261, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84548, 4, -7510.65, -1046.95, 449.242, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.31782, 0, 0);
-- move overseer 84557 to pat closer to wall
update creature set position_x = '-7496.663574', position_y = '-1038.101929', position_z = '449.242340', MovementType = 2, spawndist = 0 where guid = 84557;
delete from creature_movement where id = 84557;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84557, 1, -7496.663574,-1038.101929,449.242340 , 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.80725, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (84557, 2,-7525.392578,-1059.235718,449.242126, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.77583, 0, 0);
-- Moving Technician's
update creature set position_x = '-7523.464844', position_y = '-1060.269775', position_z = '449.242126', orientation = '4.701571', MovementType = 0, spawndist = 0 where guid = 84547;
update creature set position_x = '-7521.088379', position_y = '-1059.261353', position_z = '449.242126', orientation = '5.691863', MovementType = 0, spawndist = 0 where guid = 1177499;

-- Far Wall after Broodlord ; These creatures need to be shuffled randomly (Not yet possible)
update creature set position_x = '-7467.350098', position_y = '-994.522522', position_z = '449.747589', orientation = '0.29367', MovementType = 0, spawndist = 0 where guid = 84592;
update creature set position_x = '-7470.464844', position_y = '-988.648193', position_z = '449.756226', orientation = '5.624133', MovementType = 0, spawndist = 0 where guid = 84590;
update creature set position_x = '-7459.420410', position_y = '-995.416260', position_z = '449.703247', orientation = '2.383615', MovementType = 0, spawndist = 0 where guid = 84589;
update creature set position_x = '-7461.518066', position_y = '-985.506958', position_z = '449.698578', orientation = '4.145594', MovementType = 0, spawndist = 0 where guid = 84591;

-- First Ramp up after Broodlord
-- Move Overseer closer to wall
update creature set position_x = '-7515.617188', position_y = '-910.706787', position_z = '457.576080', orientation = '5.113662', MovementType = 1,spawndist = 1 where guid = 84625;
-- Blackwing Spellbinder patrol, 1177484
update creature set MovementType = 2 where guid = 1177484;
delete from creature_movement where id = 1177484;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177484, 1, -7515.9, -934.709, 457.576, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.66671, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177484, 2, -7524.8, -920.194, 457.576, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.17052, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177484, 3, -7505.36, -906.336, 457.576, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.10848, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177484, 4, -7524.99, -919.359, 457.576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.65571, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177484, 5, -7517.15, -931.392, 457.576, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.26421, 0, 0);

-- Left Pack After Ramp
-- Move Warlock Back
update creature set position_x = '-7455.803027', position_y = '-864.464783', position_z = '464.983643', orientation = '4.151286', MovementType = 1, spawndist = 2 where guid = 84652;
update creature set position_x = '-7483.78227', position_y = '-879.046082', position_z = '464.983643', orientation = '5.260271', MovementType = 1, spawndist = 2 where guid = 84653;
-- Fix Overseer Location
update creature set position_x = '-7476.914062', position_y = '-878.194519', position_z = '464.983704', orientation = '4.096323', MovementType = 1,spawndist = 1 where guid = 84840;
-- Blackwing Spellbinder patrol, 1177485
update creature set MovementType = 2 where guid = 1177485;
delete from creature_movement where id = 1177485;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 1, -7473.06, -868.515, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.565371, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 2, -7489.38, -879.702, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.78689, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 3, -7476.32, -880.023, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.605044, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 4, -7461.83, -873.157, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2475, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 5, -7456.02, -855.796, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.022279, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 6, -7462.43, -875.399, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.72779, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (1177485, 7, -7473.02, -875.737, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.03839, 0, 0);

-- Far Side After Ramp
-- Warlock over a few inches..OCD sorry
update creature set position_x = '-7419.304688', position_y = '-900.756531', position_z = '464.984009', orientation = '3.728750', MovementType = 1, spawndist = 2 where guid = 85581;
update creature set position_x = '-7399.515137', position_y = '-934.326904', position_z = '464.984009', orientation = '3.716965', MovementType = 1, spawndist = 2 where guid = 85601;
-- Death Talon Closer to wall
update creature set position_x = '-7419.654785', position_y = '-913.131104', position_z = '464.983704', orientation = '3.772723', MovementType = 1,spawndist = 1 where guid = 1177486;
-- Blackwing Spellbinder patrol , 85621; 
update creature set MovementType = 2 where guid = 85621;
delete from creature_movement where id = 85621;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 1, -7411.55, -898.361, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.59561, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 2, -7420.33, -906.572, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.40539, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 3, -7410.8, -919.473, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.463663, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 4, -7405.94, -918.253, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.83123, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 5, -7408.71, -920.628, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.84481, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 6, -7402.89, -929.583, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.295595, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 7, -7397.71, -928.513, 464.983, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.295595, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 8, -7402.97, -930.063, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.20804, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85621, 9, -7416.6, -911.646, 464.983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.20804, 0, 0);

-- Near Side After Ramp (Right)
-- Warlock over a few inches
update creature set position_x = '-7459.566895', position_y = '-927.623169', position_z = '464.983734', orientation = '0.651779', MovementType = 1,spawndist = 1 where guid = 85757;
update creature set position_x = '-7438.122559', position_y = '-959.160522', position_z = '464.983521', orientation = '0.537103', MovementType = 1,spawndist = 1 where guid = 85775;
-- Overseer Disable Patrol, move a few inches to correct spot.
update creature set position_x = '-7448.298340', position_y = '-934.664856', position_z = '464.983704', orientation = '3.458098', MovementType = 1,spawndist = 1 where guid = 1177487;
-- Blackwing Spellbinder patrol , 85758; 
update creature set MovementType = 2 where guid = 85758;
delete from creature_movement where id = 85758;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 1, -7437.18, -952.238, 464.984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.2658, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 2, -7442.18, -962.234, 464.985, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.54618, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 3, -7438.19, -956.54, 464.985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.20803, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 4, -7443.23, -948.72, 464.984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.33587, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 5, -7454.02, -952.797, 464.984, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.22022, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 6, -7450.04, -938.915, 464.984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.21667, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 7, -7463.84, -933.936, 464.984, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.34765, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 8, -7456.58, -928.884, 464.984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.632525, 0, 0);
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES (85758, 9, -7444.84, -942.314, 464.984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.74898, 0, 0);
-- Move Other Spellbinder
update creature set position_x = '-7447.491699', position_y = '-943.708008', position_z = '464.983887', orientation = '0.542595', MovementType = 1, spawndist = 1 where guid = 85768;

-- Death Talons move over a little before Enonroc ramp
update creature set position_x = '-7405.420898', position_y = '-963.818115', position_z = '464.949005', orientation = '2.334169', MovementType = 0, spawndist = 0 where guid = 84635;
update creature set position_x = '-7395.647461', position_y = '-960.285645', position_z = '464.962311', orientation = '1.881304', MovementType = 0, spawndist = 0 where guid = 84634;
update creature set position_x = '-7388.353516', position_y = '-956.313293', position_z = '464.964539', orientation = '2.229512', MovementType = 0, spawndist = 0 where guid = 84628;

UPDATE `creature_groups` SET `leaderGUID`=1177494 WHERE `leaderGUID`=1177488;
UPDATE `creature` SET `spawndist`=0, `MovementType`=2 WHERE `guid` IN (84558, 84625, 84840, 1177486, 1177487);
DELETE FROM `creature_groups` WHERE `memberGUID` IN (84538, 84533);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
