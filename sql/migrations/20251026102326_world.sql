DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251026102326');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251026102326');
-- Add your query below.


-- Remove custom creature AQ War Cenarion Hold Wave Trigger.
UPDATE `creature_template` SET `patch`=7, `static_flags1`=870, `script_name`='npc_aqwar_ch_attack' WHERE `entry`=15878;
DELETE FROM `creature_template` WHERE `entry`=21010;
UPDATE `creature` SET `id`=15878, `position_x`=-6743.64, `position_y`=773.793, `position_z`=128.521, `orientation`=3.9619 WHERE `id`=21010;

-- These texts are yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` IN (11527, 11528, 11541, 11540);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
