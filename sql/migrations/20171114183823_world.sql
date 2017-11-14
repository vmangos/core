DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171114183823');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171114183823');
-- Add your query below.


-- Correct gossip menu ids used by Matrix Punchograph 3005-A.
UPDATE `gossip_menu` SET `entry`=1045 WHERE `entry`=20001;
UPDATE `gossip_menu` SET `entry`=1044 WHERE `entry`=20002;
UPDATE `gossip_menu_option` SET `menu_id`=1045, `action_menu_id`=1044 WHERE `menu_id`=20001;
UPDATE `gameobject_template` SET `data3`=1045 WHERE `entry`=142345;

-- Wrong ids.
UPDATE `npc_text` SET `ID`=6782 WHERE `ID`=20010;
UPDATE `npc_text` SET `ID`=8436 WHERE `ID`=20100;
UPDATE `npc_text` SET `ID`=8525 WHERE `ID`=20101;
UPDATE `npc_text` SET `ID`=8526 WHERE `ID`=20104;
UPDATE `npc_text` SET `ID`=8482 WHERE `ID`=20110;
UPDATE `npc_text` SET `ID`=8483 WHERE `ID`=20111;
UPDATE `npc_text` SET `ID`=8593 WHERE `ID`=20113;
UPDATE `npc_text` SET `ID`=8594 WHERE `ID`=20114;
UPDATE `npc_text` SET `ID`=8554 WHERE `ID`=20116;
UPDATE `npc_text` SET `ID`=8555 WHERE `ID`=20117;

-- Those are duplicates. Replaced use of them in core with correct ids.
DELETE FROM `npc_text` WHERE `ID` BETWEEN 20000 AND 20118;

-- Nostalrius strings can no longer be said by creatures. We need to replace them with broadcast.
DELETE FROM `nostalrius_string` WHERE `entry` IN (122, 123, 124, 125, 126, 135, 136);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
