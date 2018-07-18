DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180706232834');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180706232834');
-- Add your query below.

-- Naxxramas Heigan Gauntlet
UPDATE `creature_template` SET `mindmg`='105.8', `maxdmg`='140.3', `dmg_multiplier`='22', `baseattacktime`='2000', `rangeattacktime`='2000' WHERE `entry`='16034' and`patch`='0';
UPDATE `creature_template` SET `mindmg`='77.90', `maxdmg`='103.1', `dmg_multiplier`='6', `baseattacktime`='1500', `rangeattacktime`='1500' WHERE `entry`='16036' and`patch`='0';
UPDATE `creature_template` SET `mindmg`='103.9', `maxdmg`='137.9', `dmg_multiplier`='6', `baseattacktime`='2000', `rangeattacktime`='2000' WHERE `entry`='16037' and`patch`='0';
UPDATE `creature_template` SET `mindmg`='105.8', `maxdmg`='140.3', `dmg_multiplier`='8', `baseattacktime`='2000', `rangeattacktime`='2000' WHERE `entry`='16297' and`patch`='0';

-- Lupos on a 4-6h respawn timer
UPDATE `creature` SET `spawntimesecsmin`='14400', `spawntimesecsmax`='21600' WHERE `guid`='285011';
UPDATE `creature` SET `spawntimesecsmin`='14400', `spawntimesecsmax`='21600' WHERE `guid`='285012';
UPDATE `creature` SET `spawntimesecsmin`='14400', `spawntimesecsmax`='21600' WHERE `guid`='285013';

-- Devilsaur attack / movement speed
UPDATE `creature_template` SET `speed_walk`=(6.0 / 2.5), `speed_run`=(12.0 / 7.0), `baseattacktime`='2400', `rangeattacktime`='2400' WHERE `entry`='6498';
UPDATE `creature_template` SET `speed_walk`=(6.0 / 2.5), `speed_run`=(12.0 / 7.0), `baseattacktime`='2800', `rangeattacktime`='2800' WHERE `entry`='6499';
UPDATE `creature_template` SET `speed_walk`=(6.0 / 2.5), `speed_run`=(12.0 / 7.0), `baseattacktime`='2800', `rangeattacktime`='2800' WHERE `entry`='6500';

-- Prince Nazjak on a 32-48h respawn timer
UPDATE `creature` SET `spawntimesecsmin`='115200', `spawntimesecsmax`='172800' WHERE `id`='2779';

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
