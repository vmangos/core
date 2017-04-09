INSERT INTO `migrations` VALUES ('20170331201306');

-- Gromsblood spawn in Blasted Lands was spawning below the terrain
UPDATE gameobject SET position_z = 14.5 WHERE guid = 32304;
