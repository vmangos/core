DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20230729171655');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20230729171655');
-- Add your query below.


-- Remove Duplicate Food Crates
DELETE FROM `pool_pool` WHERE `pool_id` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185));
DELETE FROM `pool_template` WHERE `entry` IN (SELECT `pool_entry` FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185));
DELETE FROM `gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185);
DELETE FROM `pool_gameobject` WHERE `guid` IN (44156, 44204, 44155, 44206, 44137, 44185, 44150, 44198, 44149, 44197, 44137, 44185);

-- Remove Duplicate Cortellos Riddle
DELETE FROM `gameobject` WHERE `guid` = 129;
DELETE FROM `pool_gameobject` WHERE `guid` IN (129);

-- Remove Duplicate Blood of Heroes
DELETE FROM `gameobject` WHERE `guid` IN (25981, 25918, 25962, 25972, 55363);
DELETE FROM `pool_gameobject` WHERE `guid` IN (25981, 25918, 25962, 25972, 55363);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
