DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
DECLARE i INT DEFAULT 1;
DECLARE cnt INT DEFAULT 0;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20260823171522');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20260823171522');
-- Add your query below.

-- Convert every remaining MyISAM table to InnoDB.
--
-- The core wraps player saves in transactions that touch both engines at once
-- (Player::_SaveInventory writes `character_inventory` and `item_instance` in
-- the same transaction). MySQL rejects that outright once
-- enforce_gtid_consistency is on, which is the default from MySQL 8.4 onwards:
--
--   Statement violates GTID consistency: Updates to non-transactional tables
--   can only be done in either autocommitted statements or single-statement
--   transactions, and never in the same statement as updates to transactional
--   tables.
--
-- The failed statements were dropped silently, so inventory rows were never
-- written. Even without GTID enforcement the mix is unsafe, because a rollback
-- leaves the MyISAM half of the transaction applied.

DROP TEMPORARY TABLE IF EXISTS `tmp_myisam_tables`;
CREATE TEMPORARY TABLE `tmp_myisam_tables` (`n` INT AUTO_INCREMENT PRIMARY KEY, `t` VARCHAR(64) NOT NULL) ENGINE=MEMORY;
INSERT INTO `tmp_myisam_tables` (`t`) SELECT `TABLE_NAME` FROM `information_schema`.`TABLES` WHERE `TABLE_SCHEMA` = DATABASE() AND `TABLE_TYPE` = 'BASE TABLE' AND `ENGINE` = 'MyISAM';
SET i = 1;
SET cnt = (SELECT COUNT(*) FROM `tmp_myisam_tables`);
WHILE i <= cnt DO
SET @tbl = (SELECT `t` FROM `tmp_myisam_tables` WHERE `n` = i);
SET @sql = CONCAT('ALTER TABLE `', @tbl, '` ENGINE=InnoDB ROW_FORMAT=DYNAMIC');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET i = i + 1;
END WHILE;
DROP TEMPORARY TABLE `tmp_myisam_tables`;

-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
