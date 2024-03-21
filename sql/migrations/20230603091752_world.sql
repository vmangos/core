DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230603091752');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230603091752');
-- Add your query below.

-- remove script_text
DELETE FROM `script_texts` WHERE `entry`= -1000187;
-- assign new script
UPDATE `creature_template` SET `script_name`='npc_tome_of_divinity' WHERE `entry` IN (6172, 6177);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
