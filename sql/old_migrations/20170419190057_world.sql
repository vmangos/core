INSERT INTO `migrations` VALUES ('20170419190057');

-- Remove A Warden of the Alliance (171) from Watcher Callahan (2142)
delete from creature_questrelation where id = 2142 and quest = 171; 
