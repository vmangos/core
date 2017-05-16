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

