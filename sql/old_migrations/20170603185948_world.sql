INSERT INTO `migrations` VALUES ('20170603185948'); 

-- Add script to Cannonball Runner
UPDATE `creature_template` SET `ScriptName`='npc_cannonball_runner' WHERE `entry`=11199;