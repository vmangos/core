DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200623171632');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200623171632');
-- Add your query below.


DELETE FROM `event_scripts` WHERE `id`=573402;
INSERT INTO `event_scripts` VALUES (573402, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2061, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 0, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 3, 15, 7794, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Cast Spell \'Teleport\'');
INSERT INTO `event_scripts` VALUES (573402, 6, 10, 5736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 5, 1400.85, 363.242, -84.868, 1.11701, 0, 'Apothecary Keever - Spawn Creature \'Caged Human Male\'');
INSERT INTO `event_scripts` VALUES (573402, 6, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 9, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2062, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 21, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2075, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 23, 27, 5742, 1, 0, 0, 5736, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5736)');
INSERT INTO `event_scripts` VALUES (573402, 32, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2064, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2063, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 46, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 54, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2065, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 54, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 56, 27, 5739, 1, 0, 0, 5742, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5742)');
INSERT INTO `event_scripts` VALUES (573402, 60, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2066, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2067, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 74, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 82, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 82, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2068, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 86, 27, 5741, 1, 0, 0, 5739, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5739)');
INSERT INTO `event_scripts` VALUES (573402, 95, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2069, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2070, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 109, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 117, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 117, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2071, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 121, 27, 5743, 1, 0, 0, 5741, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Update Entry (Creature Entry: 5741)');
INSERT INTO `event_scripts` VALUES (573402, 130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2072, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 131, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');
INSERT INTO `event_scripts` VALUES (573402, 143, 28, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Kneel');
INSERT INTO `event_scripts` VALUES (573402, 143, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2073, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 147, 15, 7670, 6, 0, 0, 5743, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Cast Spell \'Explode\' (Creature Entry: 5743)');
INSERT INTO `event_scripts` VALUES (573402, 148, 18, 0, 0, 0, 0, 5743, 2, 8, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Despawn (Creature Entry: 5743)');
INSERT INTO `event_scripts` VALUES (573402, 151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2074, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Say Text');
INSERT INTO `event_scripts` VALUES (573402, 152, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Apothecary Keever - Stand');



-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
