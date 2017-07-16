INSERT INTO `migrations` VALUES ('20170601002619');

UPDATE `spell_proc_event` SET `ppmRate`=15, `CustomChance`=0 WHERE `entry`=26480;
