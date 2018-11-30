DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181130092710');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181130092710');
-- Add your query below.


-- Correct container slots for bags with more than 28 slots.
-- I had reduced them to 28 because the core didn't support more.
UPDATE `item_template` SET `container_slots`=30 WHERE `entry`=21193;
UPDATE `item_template` SET `container_slots`=32 WHERE `entry`=21194;
UPDATE `item_template` SET `container_slots`=36 WHERE `entry`=21195;
UPDATE `item_template` SET `container_slots`=30 WHERE `entry`=23162;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
