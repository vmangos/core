DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180723122149');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180723122149');
-- Add your query below.

UPDATE `creature_template` SET `minhealth`='22272', `maxhealth`='22272', `armor`='3380', `speed_walk`='1', `mindmg`='88.1', `maxdmg`='116.9', `attackpower`='238', `dmg_multiplier`='6.5', `baseattacktime`='1800', `rangeattacktime`='1800' WHERE `entry`='9033';
UPDATE `creature` SET `curhealth`='22272' WHERE `id`='9033';

DELETE FROM `creature_addon` WHERE `guid`='45954' and`patch`='0';
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
('9033', '0', '0', '0', '1', '16', '0', '0', '15088 15097');

REPLACE INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
('45955', '45954', '1031'),
('45956', '45954', '1031'),
('45958', '45954', '1031'),
('45959', '45954', '1031');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
