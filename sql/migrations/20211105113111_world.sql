DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211105113111');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211105113111');
-- Add your query below.


-- 1.12.1 Riding Trainers
UPDATE `npc_trainer_template` SET `entry`=440 WHERE `entry`=1001;
UPDATE `creature_template` SET `trainer_id`=440 WHERE `trainer_id`=1001;

-- Kodo Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=413 WHERE `entry`=1005;
UPDATE `creature_template` SET `trainer_id`=413 WHERE `trainer_id`=1005;

-- Horse Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=109 WHERE `entry`=1007;
UPDATE `creature_template` SET `trainer_id`=109 WHERE `trainer_id`=1007;

-- Wolf Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=112 WHERE `entry`=1003;
UPDATE `creature_template` SET `trainer_id`=112 WHERE `trainer_id`=1003;

-- Nightsaber Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=111 WHERE `entry`=1002;
UPDATE `creature_template` SET `trainer_id`=111 WHERE `trainer_id`=1002;

-- Ram Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=110 WHERE `entry`=1006;
UPDATE `creature_template` SET `trainer_id`=110 WHERE `trainer_id`=1006;

-- Undead Horse Riding Instructor
UPDATE `npc_trainer_template` SET `entry`=195 WHERE `entry`=1008;
UPDATE `creature_template` SET `trainer_id`=195 WHERE `trainer_id`=1008;

-- Raptor Riding Trainer
UPDATE `npc_trainer_template` SET `entry`=194 WHERE `entry`=1009;
UPDATE `creature_template` SET `trainer_id`=194 WHERE `trainer_id`=1009;

-- Mechanostrider Pilot
UPDATE `npc_trainer_template` SET `entry`=193 WHERE `entry`=1004;
UPDATE `creature_template` SET `trainer_id`=193 WHERE `trainer_id`=1004;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
