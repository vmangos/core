DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230314075852');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230314075852');
-- Add your query below.


-- Correct stats of a few humanoids.
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4668; -- Burning Blade Summoner (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.16 WHERE `entry`=4705; -- Burning Blade Invoker (was 0.14)
UPDATE `creature_template` SET `damage_variance`=0.17 WHERE `entry`=4814; -- Twilight Elementalist (was 0.16)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=4668 && `patch` IN (0); -- Burning Blade Summoner (was 0.95)
UPDATE `creature_template` SET `damage_multiplier`=1 WHERE `entry`=7727 && `patch` IN (0); -- Grimtotem Shaman (was 0.95)


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
