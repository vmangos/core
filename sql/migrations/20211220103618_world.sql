DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211220103618');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211220103618');
-- Add your query below.


-- Remove EventAI from Mottled Boar.
DELETE FROM `creature_ai_scripts` WHERE `id` IN (309801);
DELETE FROM `creature_ai_events` WHERE `creature_id`=3098;
UPDATE `creature_template` SET `ai_name`='' WHERE `entry`=3098;

-- Kodos Calf does not call for help.
UPDATE `creature_template` SET `call_for_help_range`=0 WHERE `entry`=2972;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
