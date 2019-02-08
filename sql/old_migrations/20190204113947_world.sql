DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20190204113947');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20190204113947');
-- Add your query below.


UPDATE `broadcast_text` SET `Sound`=8599, `Type`=6 WHERE `ID`=11720;
DELETE FROM `script_texts` WHERE `entry` IN (-1509021, -1509022, -1509023, -1509024);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
