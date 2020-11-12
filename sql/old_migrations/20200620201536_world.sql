DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200620201536');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200620201536');
-- Add your query below.


-- Kaita Deepforge
UPDATE `creature` SET `position_x`=-8433, `position_y`=623.712, `position_z`=95.4159, `orientation`=5.79449 WHERE `guid`=37605; 

-- Hank the Hammer
UPDATE `creature` SET `position_x`=-8422.17, `position_y`=630.877, `position_z`=95.8402, `orientation`=5.044 WHERE `guid`=43705; 

-- Borgus Steelhand
UPDATE `creature` SET `position_x`=-8392.69, `position_y`=690.845, `position_z`=95.3568, `orientation`=5.35816 WHERE `guid`=42580; 

-- Gazin Tenorm
UPDATE `creature` SET `position_x`=-8516.89, `position_y`=862.322, `position_z`=109.922, `orientation`=4.13643 WHERE `guid`=39538; 

-- Brother Joshua
UPDATE `creature` SET `position_x`=-8519.56, `position_y`=862.828, `position_z`=109.911, `orientation`=5.41052 WHERE `guid`=37571; 

-- Brother Cassius
UPDATE `creature` SET `position_x`=-8520.6, `position_y`=796.247, `position_z`=106.602, `orientation`=0.715585 WHERE `guid`=7629; 

-- Jalane Ayrole
UPDATE `creature` SET `position_x`=-8975.62, `position_y`=1021.77, `position_z`=101.487, `orientation`=1.29154 WHERE `guid`=90478; 

-- Zardeth of the Black Claw
UPDATE `creature` SET `position_x`=-8983.62, `position_y`=1025.49, `position_z`=101.587, `orientation`=0.279253 WHERE `guid`=89299; 

-- Sandahl
UPDATE `creature` SET `position_x`=-8988.79, `position_y`=1033.89, `position_z`=101.487, `orientation`=6.05629 WHERE `guid`=90461; 

-- Gakin the Darkbinder
UPDATE `creature` SET `position_x`=-8983.33, `position_y`=1041.52, `position_z`=101.487, `orientation`=4.66003 WHERE `guid`=90471; 

-- Spackle Thornberry
UPDATE `creature` SET `position_x`=-8974.85, `position_y`=1035.97, `position_z`=101.487, `orientation`=3.87463 WHERE `guid`=90468; 

-- Thurman Schneider
UPDATE `creature` SET `position_x`=-8961.84, `position_y`=809.207, `position_z`=109.63, `orientation`=2.07694 WHERE `guid`=89298; 

-- Evan Larson
UPDATE `creature` SET `position_x`=-8965.18, `position_y`=807.98, `position_z`=109.63, `orientation`=1.64061 WHERE `guid`=52923; 


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
