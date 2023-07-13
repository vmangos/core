DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230713204556');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230713204556');
-- Add your query below.


-- Naela Trance is a vendor and can repair.
UPDATE `creature_template` SET `npc_flags`=16388 WHERE `entry`=1459;
DELETE FROM `npc_trainer` WHERE `entry`=1459;

-- Hillsbrad Tailor is only a vendor.
UPDATE `creature_template` SET `npc_flags`=4 WHERE `entry`=2264;
DELETE FROM `npc_trainer` WHERE `entry`=2264;

-- Shylenai is only a vendor.
UPDATE `creature_template` SET `npc_flags`=4 WHERE `entry`=8665;
DELETE FROM `npc_trainer` WHERE `entry`=8665;

-- Henry Stern has only gossip.
UPDATE `creature_template` SET `npc_flags`=1 WHERE `entry`=8696;
DELETE FROM `npc_trainer` WHERE `entry`=8696;

-- Doctor Gregory Victor has gossip and is a quest giver.
UPDATE `creature_template` SET `npc_flags`=3 WHERE `entry`=12920;
DELETE FROM `npc_trainer` WHERE `entry`=12920;

-- Doctor Gustaf VanHowzen has gossip and is a quest giver.
UPDATE `creature_template` SET `npc_flags`=3 WHERE `entry`=12939;
DELETE FROM `npc_trainer` WHERE `entry`=12939;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
