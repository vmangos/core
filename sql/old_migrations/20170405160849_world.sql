INSERT INTO `migrations` VALUES ('20170405160849');

-- Little Timmy now has one White Kitten on a three hour restock
update npc_vendor set maxcount = 1, incrtime = 10800 where entry = 8666 and item = 8489; 
