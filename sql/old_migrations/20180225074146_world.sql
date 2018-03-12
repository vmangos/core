DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180225074146');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180225074146');
-- Add your query below.


ALTER TABLE `conditions`
	ADD COLUMN `flags` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'general condition flags' AFTER `value2`,
	DROP INDEX `unique_conditions`,
	ADD UNIQUE INDEX `unique_conditions` (`type`, `value1`, `value2`, `flags`);

-- Replace NO_AURA with AURA.
UPDATE `conditions` SET `type`=1, `flags`=1 WHERE `type`=11;

-- REPLACE NO_ITEM with ITEM.
UPDATE `conditions` SET `type`=2, `flags`=1 WHERE `type`=16;

-- REPLACE NOITEM_WITH_BANK with ITEM_WITH_BANK.
UPDATE `conditions` SET `type`=23, `flags`=1 WHERE `type`=24;

-- REPLACE NOT_ACTIVE_GAME_EVENT with ACTIVE_GAME_EVENT.
UPDATE `conditions` SET `type`=12, `flags`=1 WHERE `type`=25;

-- REPLACE NOT_ACTIVE_HOLIDAY with ACTIVE_HOLIDAY:.
UPDATE `conditions` SET `type`=26, `flags`=1 WHERE `type`=27;

-- REPLACE SOURCE_AURA with AURA:.
UPDATE `conditions` SET `type`=1, `flags`=2 WHERE `type`=32;

-- REPLACE SOURCE_GENDER with TARGET_GENDER:.
UPDATE `conditions` SET `type`=35, `flags`=2 WHERE `type`=34;

-- Move WAR_EFFORT_STAGE to free id 11.
UPDATE `conditions` SET `type`=11 WHERE `type`=39;

-- Move SOURCE_ENTRY to free id 16.
UPDATE `conditions` SET `type`=16 WHERE `type`=38;

-- Move WOW_PATCH to free id 24.
UPDATE `conditions` SET `type`=24 WHERE `type`=37;

-- Move DEAD_OR_AWAY to free id 25.
UPDATE `conditions` SET `type`=25 WHERE `type`=36;

-- Move TARGET_GENDER to free id 27.
UPDATE `conditions` SET `type`=27 WHERE `type`=35;

-- Move LAST_WAYPOINT to free id 32.
UPDATE `conditions` SET `type`=32 WHERE `type`=33;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
