INSERT INTO `migrations` VALUES ('20170418141728');

-- Stone of Binding respawn time
UPDATE gameobject SET spawntimesecs = 300 WHERE id IN (141812,141857,141858,141859);

