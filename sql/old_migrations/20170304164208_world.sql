INSERT INTO `migrations` VALUES ('20170304164208'); 

-- Add questgiver flag
UPDATE `creature_template` SET `npcflag` = 3 WHERE `entry` IN (15737, 15736);