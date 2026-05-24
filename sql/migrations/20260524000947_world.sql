DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260524000947');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260524000947');
-- Add your query below.

INSERT INTO `quest_greeting` (`entry`, `content_default`) VALUES (302, 'The memory of my beauty makes its loss unbearable!');

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
