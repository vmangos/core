DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230102120931');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230102120931');
-- Add your query below.


-- Mini Pets.
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=16085;
UPDATE `creature_template` SET `unit_flags`=33536, `ranged_attack_time`=0 WHERE `entry`=16547;
UPDATE `creature_template` SET `unit_flags`=33536, `ranged_attack_time`=0 WHERE `entry`=16548;
UPDATE `creature_template` SET `unit_flags`=33536, `ranged_attack_time`=0 WHERE `entry`=16549;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=15429;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=15699;
UPDATE `creature_template` SET `auras`=19230, `unit_flags`=33536, `speed_run`=1.25714, `ranged_attack_time`=0 WHERE `entry`=11325;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=16085;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=14444;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=15710;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=15706;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=15698;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=15705;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=14878;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=14421;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=14444;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=2671;
UPDATE `creature_template` SET `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7385;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7384;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7383;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7383;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7382;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7380;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7381;
UPDATE `creature_template` SET `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7386;
UPDATE `creature_template` SET `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7390;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7391;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7387;
UPDATE `creature_template` SET `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7389;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7394;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7392;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7395;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7543;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7544;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7545;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7550;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7549;
UPDATE `creature_template` SET `speed_run`=1.25714, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=7555;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7553;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=2620;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7560;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7565;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7562;
UPDATE `creature_template` SET `ranged_attack_time`=0 WHERE `entry`=7567;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=8376;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=7392;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=9656;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=9657;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=9662;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=10259;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0 WHERE `entry`=10598;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=11236;
UPDATE `creature_template` SET `auras`=19230, `unit_flags`=33536, `speed_run`=1.25714, `ranged_attack_time`=0 WHERE `entry`=11325;
UPDATE `creature_template` SET `auras`=18873, `unit_flags`=33536, `base_attack_time`=2000, `ranged_attack_time`=0 WHERE `entry`=11326;
UPDATE `creature_template` SET `auras`=19226, `unit_flags`=33536, `ranged_attack_time`=0 WHERE `entry`=11327;
UPDATE `creature_template` SET `unit_flags`=768, `ranged_attack_time`=0, `faction`=35 WHERE `entry`=12419;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
