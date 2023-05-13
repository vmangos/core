DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230317123807');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230317123807');
-- Add your query below.


-- Fix ore and herbs in wrong pools.
UPDATE `pool_gameobject` SET `pool_entry`=1352 WHERE `guid`=34750;
UPDATE `pool_template` SET `max_limit`=6 WHERE `entry`=43524;
UPDATE `pool_template` SET `max_limit`=5 WHERE `entry`=43521;
UPDATE `pool_template` SET `max_limit`=3 WHERE `entry`=1053;
UPDATE `pool_template` SET `max_limit`=4 WHERE `entry`=1054;
UPDATE `pool_template` SET `max_limit`=2 WHERE `entry`=1000;
UPDATE `pool_template` SET `max_limit`=3 WHERE `entry`=386;
UPDATE `pool_template` SET `max_limit`=3 WHERE `entry`=407;
UPDATE `pool_gameobject` SET `pool_entry`=3614 WHERE `guid` IN (21937, 21924);
UPDATE `pool_gameobject` SET `pool_entry`=3602 WHERE `guid`=21925;
UPDATE `pool_gameobject` SET `pool_entry`=3603 WHERE `guid`=21926;
UPDATE `pool_gameobject` SET `pool_entry`=3604 WHERE `guid`=21927;
UPDATE `pool_gameobject` SET `pool_entry`=3605 WHERE `guid`=21928;
UPDATE `pool_gameobject` SET `pool_entry`=3606 WHERE `guid`=21929;
UPDATE `pool_gameobject` SET `pool_entry`=3607 WHERE `guid`=21930;
UPDATE `pool_gameobject` SET `pool_entry`=3608 WHERE `guid`=21931;
UPDATE `pool_gameobject` SET `pool_entry`=3609 WHERE `guid`=21932;
UPDATE `pool_gameobject` SET `pool_entry`=3610 WHERE `guid`=21933;
UPDATE `pool_gameobject` SET `pool_entry`=3611 WHERE `guid`=21934;
UPDATE `pool_gameobject` SET `pool_entry`=3612 WHERE `guid`=21935;
UPDATE `pool_gameobject` SET `pool_entry`=3613 WHERE `guid`=21936;
UPDATE `pool_gameobject` SET `pool_entry`=1902 WHERE `guid`=41999;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`, `flags`) VALUES (22940, 1299, 0, 'Burning Steppes - Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit', 0);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`, `flags`, `instance`, `patch_min`, `patch_max`) VALUES (22940, 1, 'Small Thorium Vein / Truesilver Deposit / Dark Iron Deposit - Burning Steppes', 0, 0, 0, 10);
UPDATE `pool_gameobject` SET `pool_entry`=22940 WHERE `guid` IN (220445, 220447, 220449);
UPDATE `pool_gameobject` SET `pool_entry`=1090 WHERE `guid` IN (2516728, 2516734);
DELETE FROM `pool_template` WHERE `entry`=7066;
DELETE FROM `pool_pool` WHERE `pool_id`=7066;
UPDATE `pool_gameobject` SET `pool_entry`=17197 WHERE `guid`=427562;
UPDATE `pool_gameobject` SET `pool_entry`=14445 WHERE `guid`=84123;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
