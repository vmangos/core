DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180519012958');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180519012958');
-- Add your query below.

DELETE FROM `creature_ai_scripts` WHERE `id`='1166501';
DELETE FROM `creature_ai_events` WHERE `id`='1166501';

UPDATE `creature_template` SET `AIName`='' WHERE `entry`='11665';
UPDATE `creature_template` SET `mindmg`='84.7', `maxdmg`='114.5', `attackpower`='262', `dmg_multiplier`='18', `baseattacktime`='1600', `rangeattacktime`='1600' WHERE `entry`='11665';

DELETE a FROM  `creature_addon` a INNER JOIN `creature` b ON `a`.`guid`=`b`.`guid` WHERE `b`.`id` IN (11665, 11668);

REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
('11665', '0', '0', '0', '1', '16', '0', '0', '19194 19195'),
('11668', '0', '0', '0', '1', '16', '0', '0', NULL);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
