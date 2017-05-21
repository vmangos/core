-- script added to anub'rekhans door so we can do anubs welcome msg in onUse for the door
UPDATE `gameobject_template` SET `ScriptName`='go_anub_door' WHERE `entry`='181126';

-- Give Anub'rekhan gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181195';

-- give AreaTrigger outside Faerlina scriptname
DELETE FROM `scripted_areatrigger` where entry = 4115;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4115', 'at_naxxramas');

-- Give Faerlina web GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181235';

-- give maexxna outer web gate GO_FLAG_NO_INTERACT flag. It's opened by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16 WHERE `entry`='181209';

-- give maexxna inner web gate GO_FLAG_NO_INTERACT flag. It's toggled by instance script
UPDATE `gameobject_template` SET `flags` = `flags`| 16, `size`=1.1 WHERE `entry`='181197';

-- Give teleport spell used by portals from end of a wing to center of naxx its target possition (portal to sapphiron)
DELETE FROM `spell_target_position` where id = 28444;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('28444', '533', '3005.8', '-3434.3', '294', '0');

-- Remove the areatrigger to teleport from center of naxx to sapphiron from areatrigger_teleport, 
-- and add it to scripted_areatrigger instead so we can have a script that checks the required
-- bosses area dead for the trigger to work.
DELETE FROM `areatrigger_teleport` where id = 4156;
DELETE FROM `scripted_areatrigger` where entry = 4156;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES ('4156', 'at_naxxramas');


-- add Mr. Bigglesworth
-- set movement type to random 
UPDATE `creature_template` SET `MovementType`=1 WHERE `entry`=16998;
DELETE FROM `creature` where id = 16998;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES (533001,16998,533,0,0,3005.8,-3434.81,304.196,5.38862,604800,50,0,37000,0,0,1,0);

-- todo: set spawntimesecs of all bosses to 604800

