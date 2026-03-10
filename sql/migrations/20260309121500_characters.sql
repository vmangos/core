DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260309121500');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260309121500');
-- Add your query below.

DELETE FROM `character_spell`
WHERE `spell` IN (32235, 32239, 32240, 32243, 32244, 32245, 66846);

DELETE cs
FROM `character_skills` cs
JOIN `characters` c ON c.`guid` = cs.`guid`
WHERE (cs.`skill` = 44 AND c.`class` IN (2, 4, 7))
   OR (cs.`skill` = 229 AND c.`class` IN (2, 11));

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
