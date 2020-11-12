DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200716042525');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200716042525');
-- Add your query below.


-- Move random emotes to datalong fields.
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614602 && `delay`=1 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614602 && `delay`=3 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614602 && `delay`=20 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614603 && `delay`=3 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614603 && `delay`=10 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614603 && `delay`=20 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614604 && `delay`=2 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614604 && `delay`=16 && `command`=1;
UPDATE `creature_movement_scripts` SET `dataint2`=`datalong` WHERE `id`=1614604 && `delay`=18 && `command`=1;
UPDATE `creature_movement_scripts` SET `datalong`=`dataint`, `datalong2`=`dataint2`, `datalong3`=`dataint3`, `datalong4`=`dataint4` WHERE `command`=1 && `dataint`!=0;
UPDATE `creature_movement_scripts` SET `dataint`=0, `dataint2`=0, `dataint3`=0, `dataint4`=0 WHERE `command`=1 && `dataint`!=0;
UPDATE `creature_ai_scripts` SET `datalong2`=`dataint`, `datalong3`=`dataint2` WHERE `command`=1 && `dataint`!=0;
UPDATE `creature_ai_scripts` SET `dataint`=0, `dataint2`=0, `dataint3`=0, `dataint4`=0 WHERE `command`=1 && `dataint`!=0;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
