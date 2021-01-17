DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210117205409');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210117205409');
-- Add your query below.
--Heroes of Darrowshire should not have an XP reward pre 1.3
REPLACE INTO `quest_template` VALUES (5168, 0, 2, 139, 50, 0, 56, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 5210, 5206, -5181, 0, 0, 0, 0, 'Heroes of Darrowshire', 'The heroes of Darrowshire hold a place in my heart, and the book you brought me, the Annals of Darrowshire, tells their tales.$B$BIt tells of the paladin Davil Lightfire and how the Crusade took his libram to the town hall of Hearthglen.$B$BIts passages also speak of my brother, Captain Redpath.  After his betrayal, his shield was cracked and discarded and now lies in the most unlikely of places -- near the barn of Gahrron\'s Withering.$B$BGather these relics, $N.  For fate and tragedy surrounds them.', 'Bring Davil\'s Libram and Redpath\'s Shield to Carlin Redpath.', 'You have the libram and the shield!$b$bTheir history is entwined with the history of Darrowshire, and somehow, I know that fate will bring them together again.', 'Do you have the relics, $N?', '', '', '', '', '', 12954, 12955, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `quest_template` VALUES (5168, 1, 2, 139, 50, 0, 56, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 0, 5210, 5206, -5181, 0, 0, 0, 0, 'Heroes of Darrowshire', 'The heroes of Darrowshire hold a place in my heart, and the book you brought me, the Annals of Darrowshire, tells their tales.$B$BIt tells of the paladin Davil Lightfire and how the Crusade took his libram to the town hall of Hearthglen.$B$BIts passages also speak of my brother, Captain Redpath.  After his betrayal, his shield was cracked and discarded and now lies in the most unlikely of places -- near the barn of Gahrron\'s Withering.$B$BGather these relics, $N.  For fate and tragedy surrounds them.', 'Bring Davil\'s Libram and Redpath\'s Shield to Carlin Redpath.', 'You have the libram and the shield!$b$bTheir history is entwined with the history of Darrowshire, and somehow, I know that fate will bring them together again.', 'Do you have the relics, $N?', '', '', '', '', '', 12954, 12955, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5800, 0, 34800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
