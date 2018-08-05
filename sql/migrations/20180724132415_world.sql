DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180724132415');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180724132415');
-- Add your query below.

UPDATE `creature_template` SET `minhealth`='1003', `maxhealth`='1003', `faction_A`='7', `faction_H`='7', `speed_walk`=(2.5 / 2.5), `speed_run`=(6.0 /  7.0), `scale`='0', `mindmg`='42.4', `maxdmg`='56.4', `attackpower`='102', `dmg_multiplier`='2.9', `baseattacktime`='2000', `rangeattacktime`='2000' WHERE `entry`='9178';
UPDATE `creature_template` SET `minhealth`='27840', `maxhealth`='27840', `armor`='3380', `speed_walk`='1', `mindmg`='97.9', `maxdmg`='129.8', `attackpower`='238', `dmg_multiplier`='5', `baseattacktime`='2000' WHERE `entry`='9156';
UPDATE `creature` SET `curhealth`='27840' WHERE `id`='9156';

DELETE FROM `creature_addon` WHERE `guid`='47778';
REPLACE INTO `creature_template_addon` (`entry`, `patch`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`) VALUES
('9156', '0', '0', '0', '1', '16', '0', '0', '15573');

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('13489', '1', '9156');

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
