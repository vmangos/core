DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221022011155');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221022011155');
-- Add your query below.


-- Change AV BG announcer from Stormpike Herald to Herald
UPDATE `creature` SET `id`='14848' WHERE  `guid`=150155;
DELETE FROM `creature_battleground` WHERE  `guid`=150154 AND `event1`=60;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
