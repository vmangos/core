INSERT INTO `migrations` VALUES ('20170412165630'); 

-- Wailing caverns escort typo
UPDATE `script_texts` SET `content_default`='This Mutanus the Devourer is a minion from Naralex\'s nightmare no doubt!' WHERE `entry`='-1614986';
UPDATE `script_texts` SET `content_default`='We must go and gather with the other Disciples. There is much work to be done before I can make another attempt to restore the Barrens. Farewell, brave souls!' WHERE `entry`='-1614982';
-- Wailing caverns escort, the event can fail if Mutanus sleep + charm the disciple just before dying, also fear is not wanted
UPDATE `creature_template` SET `MechanicImmuneMask`='529' WHERE `entry`='3678';
-- Force Lord Serpentis creation so he can zone yell at all time
UPDATE `creature` SET `spawnFlags`='1' WHERE `guid`='38148';
-- Wailing caverns escort waypoint a tad off course
UPDATE `script_waypoint` SET `location_x`='52.2', `location_y`='208.7', `location_z`='-89.5' WHERE `entry`='3678' and`pointid`='26';
-- Remove an error output, "no waypoint found" cause the disciple has script_waypoint only
UPDATE `creature` SET `MovementType`='0' WHERE `guid`='18675';