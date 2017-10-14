INSERT INTO `migrations` VALUES ('20170902122904'); 

-- Remove duplicate spawn of creature Bloodshot.
DELETE FROM `creature` WHERE `guid`=52640;
DELETE FROM `creature_addon` WHERE `guid`=52640;
