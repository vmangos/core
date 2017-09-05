INSERT INTO `migrations` VALUES ('20170409202223'); 

-- Set MrSmite yelling at deadmines iron clad door event as CHAT_TYPE_ZONE_YELL
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1036001';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1036000';