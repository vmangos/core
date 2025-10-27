DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20241226193319');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20241226193319');
-- Add your query below.


-- Remove empty pools.
DELETE FROM `pool_template` WHERE `entry` IN (417, 1858, 1864, 1873, 2528, 2530, 2549, 2868, 2869, 2870, 4292, 4293, 14228, 14249, 17005, 21400, 21422, 21424, 21450, 21486, 21526, 21550, 21600, 21650, 25620);
DELETE FROM `pool_pool` WHERE `pool_id` IN (417, 1858, 1864, 1873, 2528, 2530, 2549, 2868, 2869, 2870, 4292, 4293, 14228, 14249, 17005, 21400, 21422, 21424, 21450, 21486, 21526, 21550, 21600, 21650, 25620);

-- `pool_creature` has guid 40461 for invalid pool 5004, skipped.
DELETE FROM `creature` WHERE `guid`=40461;
DELETE FROM `pool_creature` WHERE `guid`=40461;
DELETE FROM `creature_movement` WHERE `id`=40461;

-- Pool ids are uint16 in core so make db reflect that.
ALTER TABLE `pool_creature`
	CHANGE COLUMN `pool_entry` `pool_entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `guid`;
ALTER TABLE `pool_creature_template`
	CHANGE COLUMN `pool_entry` `pool_entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `id`;
ALTER TABLE `pool_gameobject`
	CHANGE COLUMN `pool_entry` `pool_entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `guid`;
ALTER TABLE `pool_gameobject_template`
	CHANGE COLUMN `pool_entry` `pool_entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `id`;
ALTER TABLE `pool_pool`
	CHANGE COLUMN `pool_id` `pool_id` SMALLINT UNSIGNED NOT NULL DEFAULT '0' FIRST,
	CHANGE COLUMN `mother_pool` `mother_pool` SMALLINT UNSIGNED NOT NULL DEFAULT '0' AFTER `pool_id`;
ALTER TABLE `pool_template`
	CHANGE COLUMN `entry` `entry` SMALLINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Pool entry' FIRST;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
