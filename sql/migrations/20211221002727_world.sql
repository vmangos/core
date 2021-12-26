DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211221002727');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211221002727');
-- Add your query below.


-- Superior Mana Draught and Superior Healing Draught do not have a reputation requirement on the Arathi Basin vendors.
DELETE FROM `conditions` WHERE `condition_entry` IN (174, 179);
UPDATE `npc_vendor` SET `condition_id`=0 WHERE `item` IN (17349, 17352) && `entry` IN (15127, 15126);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
