INSERT INTO `migrations` VALUES ('20170518024209'); 

-- Stone Stewards patrols
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('33512', '1', '64.324', '239.0', '-52.198', '5.144');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('33512', '2', '82.23', '202.964', '-54.978', '0.44');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('33512', '3', '122.97', '222.668', '-42.49', '3.577');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('33512', '4', '82.23', '202.964', '-54.978', '1.944');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('28365', '1', '154.882', '284.294', '-26.582', '1.963');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('28365', '2', '172.876', '246.045', '-29.362', '3.581');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('28365', '3', '130.871', '226.07', '-42.49', '3.558');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('28365', '4', '172.876', '246.045', '-29.362', '2018');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27473', '1', '-42.417', '234.082', '-48.326', '4.685');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27473', '2', '-41.454', '274.43', '-49.019', '0.031');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27472', '1', '-88.79', '237.667', '-49.728', '4.755');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27472', '2', '-88.9', '304.39', '-50.625', '1.574');

INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '1', '-84.733', '218.515', '-47.183', '2.713');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '2', '-96.837', '223.637', '-44.371', '4.59');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '3', '-102.288', '202.96', '-39.413', '3.13');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '4', '-96.837', '223.637', '-44.371', '6.063');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '5', '-84.733', '218.515', '-47.183', '0.581');
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES ('27471', '6', '-73.839', '231.006', '-49.759', '1.571');

UPDATE `creature` SET `MovementType`='2' WHERE `guid`='33512';
UPDATE `creature` SET `MovementType`='2' WHERE `guid`='28365';
UPDATE `creature` SET `MovementType`='2' WHERE `guid`='27473';
UPDATE `creature` SET `MovementType`='2' WHERE `guid`='27472';
UPDATE `creature` SET `MovementType`='2' WHERE `guid`='27471';

-- Quest "Replacement Phial" is only needed while doing "Find the gems"
UPDATE `quest_template` SET `PrevQuestId`='-2201' WHERE `entry`='3375';