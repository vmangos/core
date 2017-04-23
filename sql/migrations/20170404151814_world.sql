INSERT INTO `migrations` VALUES ('20170404151814');

# Remove internal cooldown for Hand of Justice
UPDATE `spell_proc_event` SET `Cooldown`='0' WHERE `entry`='15600';