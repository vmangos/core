DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180802084845');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180802084845');
-- Add your query below.


-- Remove custom texts ids for gizelton's caravan.
DELETE FROM `script_texts` WHERE `entry` IN (-1001000, -1001001, -1001002, -1001003, -1001004, -1001005, -1001006, -1001007, -1001008, -1001009, -1001010, -1001011);

-- These texts should be zone yells.
UPDATE `broadcast_text` SET `Type`=6 WHERE `ID` IN (7474, 7475);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
