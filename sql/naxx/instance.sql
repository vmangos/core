-- Add Anub'rekhan door
DELETE from`gameobject` WHERE id = 181126;
/*
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) 
VALUES ('533000', '181126', '533', '3202.60', '-3476.32', '287', '3.14159', '0', '0', '0', '0', '6380', '100', '1', '0');
*/
-- script added to anub'rekhans door so we can do anubs welcome msg in onUse for the door
UPDATE `gameobject_template` SET `ScriptName`='go_anub_door' WHERE `entry`='181126';

-- Add Anu'rekhan gate
DELETE FROM `gameobject` where id = 181195;
/*
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) 
VALUES (533001,181195,533,3143.88,-3572.45,287,2.345,0,0,0.921723,0.387849,25,100,1,0);
*/
-- Give Anub'rekhan gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181195';

-- give AreaTrigger outside Faerlina scriptname
DELETE FROM `scripted_areatrigger` where entry = 4115;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4115', 'at_naxxramas');


-- Faerlina web
DELETE FROM `gameobject` where id = 181235;
/*
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) 
VALUES (533002,181235,533,3322,-3694,258,3.8981,0,0,0.996865,-0.0791209,0,100,1,0);
*/
-- Give Faerlina web GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181235';


-- adding faerlina door (gate towards maexxna) to gameobject_template. Its just a copy of Anub'rekhans door
DELETE FROM `gameobject_template` where entry = 194022;
/*
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `faction`, `flags`, `size`, `data0`, `data1`) 
VALUES ('194022', '0', '6677', 'Faerlina Gate', '0', '16', '1', '0', '86');
*/
-- Adding faerlina door to gameobject
DELETE FROM `gameobject` where guid = 533003;
/*
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) 
VALUES (533003,194022,533,3121.44,-3791.08,273.904,0,0,0,0,1,25,100,0,0);
*/

-- Added outer maexxna web gate
DELETE FROM `gameobject` where id = 181209;
/*
INSERT INTO `gameobject`(guid,id,map,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,spawnFlags)
VALUES (533004,181209,533,3434,-3844,310,5.69334,0,0,0,1,0,100,1,0);
*/

-- give maexxna outer web gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181209';


-- Added inner maexxna web gate
DELETE FROM `gameobject` where id = 181197;
/*
INSERT INTO `gameobject`(guid,id,map,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state,spawnFlags)
VALUES (533005,181197,533,3453.1, -3864, 308,3.15,0,0,0,0,0,100,1,0);
*/

-- give maexxna inner web gate GO_FLAG_NO_INTERACT flag. It's toggled by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16, `size`=1.1 WHERE `entry`='181197';

