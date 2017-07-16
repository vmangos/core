INSERT INTO `migrations` VALUES ('20170527222317'); 

# Fix Prairie Dog Whistle
UPDATE `creature_template` SET `MovementType`='0', `ScriptName`='' WHERE `entry`='14421';