INSERT INTO `migrations` VALUES ('20170516221623');

-- Lieutenant General Andorov and Kaldorei Elite
UPDATE creature_template SET minhealth=17605, maxhealth=17605, minmana=37290, maxmana=37290, minlevel=61, maxlevel=61 WHERE entry=15471;
UPDATE creature_template SET minlevel=60, maxlevel=60 WHERE  entry=15473;
