-- Add Anub'rekhan door
DELETE from`gameobject` WHERE id = 181126;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `spawnFlags`) 
VALUES ('533000', '181126', '533', '3202.60', '-3476.32', '287', '3.14159', '0', '0', '0', '0', '6380', '100', '1', '0');

-- script added to anub'rekhans door so we can do anubs welcome msg in onUse for the door
UPDATE `gameobject_template` SET `ScriptName`='go_anub_door' WHERE `entry`='181126';

-- Add Anu'rekhan gate
DELETE FROM `gameobject` where id = 181195;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`,`spawnFlags`) 
VALUES (533001,181195,533,3143.88,-3572.45,287,2.345,0,0,0.921723,0.387849,25,100,1,0);

-- Give Anub'rekhan gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181195';

-- give AreaTrigger outside Faerlina scriptname
DELETE FROM `scripted_areatrigger` where entry = 4115;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4115', 'at_naxxramas');
