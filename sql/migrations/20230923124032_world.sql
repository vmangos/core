DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230923124032');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230923124032');
-- Add your query below.


-- Do not check effect index for Mother's Milk aura condition.
UPDATE `conditions` SET `value2`=-1 WHERE `type`=1 && `value1`=16468;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
