DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230527040203');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230527040203');
-- Add your query below.


-- Delete custom spawned invis walls at alliance fence in WSG
DELETE FROM `gameobject` WHERE `guid` IN (90056,90057,90058);

-- Correct WSG Alliance flag
UPDATE `gameobject` SET `orientation`=3.08918, `rotation2`=0.999657, `rotation3`=0.0262016 WHERE `guid`=90000;
-- Correct WSG Horde flag
UPDATE `gameobject` SET `position_y`=1434.4, `orientation`=0.0174525, `rotation2`=0.00872612, `rotation3`=0.999962 WHERE `guid`=90001;

-- Correct WSG first gate alliance
UPDATE `gameobject` SET `position_x`=1503.34, `orientation`=3.11539, `rotation2`=0.999914, `rotation3`=0.013102 WHERE `guid`=90008;
-- Correct WSG tunnel gate alliance
UPDATE `gameobject` SET `orientation`=3.11539, `rotation2`=0.999914, `rotation3`=0.013102 WHERE `guid`=90009;
-- Correct WSG second gate alliance
UPDATE `gameobject` SET `orientation`=3.11539, `rotation2`=0.999914, `rotation3`=0.013102 WHERE `guid`=90010;
-- Correct WSG upper gate alliance
UPDATE `gameobject` SET `orientation`=3.11539, `rotation2`=0.999914, `rotation3`=0.013102 WHERE `guid`=90011;
-- Correct WSG horde first gate
UPDATE `gameobject` SET `orientation`=5.70751, `rotation0`=-0.0167336, `rotation1`=-0.00495529, `rotation2`=-0.283972, `rotation3`=0.958674 WHERE `guid`=90012;
-- Correct WSG horde tunnel gate
UPDATE `gameobject` SET `orientation`=4.28657, `rotation0`=-0.197182, `rotation1`=0.157509, `rotation2`=-0.823948, `rotation3`=0.507366 WHERE `guid`=90013;

-- Correct WSG Horde zerker buff
UPDATE `gameobject` SET `orientation`=3.83973, `rotation2`=-0.939692, `rotation3`=0.34202 WHERE `guid`=90007;
-- Correct WSG Alliance zerker buff
UPDATE `gameobject` SET `rotation2`=0.559193, `rotation3`=0.829038 WHERE `guid`=90006;
-- Correct WSG Horde leaf buff
UPDATE `gameobject` SET `orientation`=5.60251, `rotation2`=-0.333807, `rotation3`=0.942641 WHERE `guid`=90005;
-- Correct WSG Alliance leaf buff
UPDATE `gameobject` SET `orientation`=6.02139, `rotation2`=-0.130526, `rotation3`=0.991445 WHERE `guid`=90004;
-- Correct WSG Alliance speed buff
UPDATE `gameobject` SET `orientation`=4.64258, `rotation2`=-0.731354, `rotation3`=0.681998 WHERE `guid`=90002;
-- Correct WSG Horde speed buff
UPDATE `gameobject` SET `rotation2`=0.731353, `rotation3`=0.681999 WHERE `guid`=90003;

-- Add missing braizers at WSG Horde Exit Portal
INSERT INTO `gameobject` VALUES (90056, 179874, 489, 1007.36, 1284.42, 344.579, 1.57146, -0.0272908, 0.0181961, 0.707108, 0.706345, 900, 900, 100, 1, 0, 0, 3, 10);
INSERT INTO `gameobject` VALUES (90057, 179875, 489, 976.784, 1263.28, 347.128, 5.16302, -0.0799546, -0.0143242, -0.53229, 0.842656, 900, 900, 100, 1, 0, 0, 3, 10);
INSERT INTO `gameobject` VALUES (90058, 179876, 489, 969.293, 1274.66, 346.466, 0.464554, -0.099864, -0.0128269, 0.230053, 0.967956, 900, 900, 100, 1, 0, 0, 3, 10);
INSERT INTO `gameobject` VALUES (90059, 179877, 489, 959.448, 1277.85, 344.475, 0.479197, 0.0123882, 0.0254965, 0.236834, 0.971137, 900, 900, 100, 1, 0, 0, 3, 10);
INSERT INTO `gameobject` VALUES (90060, 179878, 489, 991.532, 1273.75, 344.877, 1.41713, -0.026, 0.0956182, 0.644636, 0.75804, 900, 900, 100, 1, 0, 0, 3, 10);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
