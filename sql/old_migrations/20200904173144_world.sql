DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200904173144');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200904173144');
-- Add your query below.


-- Araj vanilla position 
 UPDATE `creature` SET `position_x`=1381.25, `position_y`=-1543.54, `position_z`=58.6043, `orientation`=4.72984 WHERE `id`=1852;  
 
-- Arajs minions 
-- Skeletal Warlord 
UPDATE `creature` SET `position_x`=1388.72, `position_y`=-1541.99, `position_z`=59.2163, `orientation`=0.541052 WHERE `guid`=45248;  
UPDATE `creature` SET `position_x`=1373.54, `position_y`=-1539.18, `position_z`=58.1594, `orientation`=2.46091 WHERE `guid`=45249;  
-- Spectral Attendant 
UPDATE `creature` SET `position_x`=1381.89, `position_y`=-1539.46, `position_z`=58.6867, `orientation`=1.50098 WHERE `guid`=45252;  
UPDATE `creature` SET `position_x`=1376.74, `position_y`=-1542.95, `position_z`=58.2789, `orientation`=5.55015 WHERE `guid`=45250;  
UPDATE `creature` SET `position_x`=1385.66, `position_y`=-1544.23, `position_z`=59.1008, `orientation`=4.79965 WHERE `guid`=45247; 


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
