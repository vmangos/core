DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181009150052');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181009150052');
-- Add your query below.


-- Set all existing kill events to only trigger for players to avoid breaking anything.
UPDATE `creature_ai_events` SET `event_param3`=1, `event_param4`=0 WHERE `event_type`=5;
-- Twilight Lord Kelris can be seen yelling upon killing a pet.
UPDATE `creature_ai_events` SET `event_param3`=0 WHERE `id`=483205;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
