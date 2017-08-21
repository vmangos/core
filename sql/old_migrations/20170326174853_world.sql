INSERT INTO `migrations` VALUES ('20170326174853'); 


-- Mountain Lions in Hillsbrad foothills should not be stealthed
DELETE FROM `creature_ai_scripts`
WHERE `creature_id` = 2384 or `creature_id` = 2385;


-- Fix Skeletons immune to wrong stuff
UPDATE `creature_template`
SET `mechanicimmunemask` = '213521' 
WHERE `mechanicimmunemask` = '646015775';
