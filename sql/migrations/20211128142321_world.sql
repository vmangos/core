DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211128142321');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211128142321');
-- Add your query below.


-- Add Missing Aura
UPDATE `creature_template` SET `auras` = '16606' WHERE `entry` = 10718;

-- Remove Unused Scripts
DELETE FROM `creature_ai_events` WHERE `creature_id` = 10718;
DELETE FROM `creature_ai_scripts` WHERE `id` IN (1071801, 1071802, 1071803, 1071804, 1071805, 1071806);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
