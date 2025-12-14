DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251010162006');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251010162006');
-- Add your query below.


-- Set unsigned value to zero to avoid error in mariadb.
UPDATE `gameobject_template` SET `data5`=0 WHERE `entry`=176084;

-- All gameobject data fields should be signed.
ALTER TABLE `gameobject_template`
	CHANGE COLUMN `data0` `data0` INT(10) NOT NULL DEFAULT '0' AFTER `size`,
	CHANGE COLUMN `data2` `data2` INT(10) NOT NULL DEFAULT '0' AFTER `data1`,
	CHANGE COLUMN `data3` `data3` INT(10) NOT NULL DEFAULT '0' AFTER `data2`,
	CHANGE COLUMN `data4` `data4` INT(10) NOT NULL DEFAULT '0' AFTER `data3`,
	CHANGE COLUMN `data5` `data5` INT(10) NOT NULL DEFAULT '0' AFTER `data4`,
	CHANGE COLUMN `data7` `data7` INT(10) NOT NULL DEFAULT '0' AFTER `data6`,
	CHANGE COLUMN `data8` `data8` INT(10) NOT NULL DEFAULT '0' AFTER `data7`,
	CHANGE COLUMN `data9` `data9` INT(10) NOT NULL DEFAULT '0' AFTER `data8`,
	CHANGE COLUMN `data10` `data10` INT(10) NOT NULL DEFAULT '0' AFTER `data9`,
	CHANGE COLUMN `data11` `data11` INT(10) NOT NULL DEFAULT '0' AFTER `data10`,
	CHANGE COLUMN `data12` `data12` INT(10) NOT NULL DEFAULT '0' AFTER `data11`,
	CHANGE COLUMN `data13` `data13` INT(10) NOT NULL DEFAULT '0' AFTER `data12`,
	CHANGE COLUMN `data14` `data14` INT(10) NOT NULL DEFAULT '0' AFTER `data13`,
	CHANGE COLUMN `data15` `data15` INT(10) NOT NULL DEFAULT '0' AFTER `data14`,
	CHANGE COLUMN `data16` `data16` INT(10) NOT NULL DEFAULT '0' AFTER `data15`,
	CHANGE COLUMN `data17` `data17` INT(10) NOT NULL DEFAULT '0' AFTER `data16`,
	CHANGE COLUMN `data18` `data18` INT(10) NOT NULL DEFAULT '0' AFTER `data17`,
	CHANGE COLUMN `data19` `data19` INT(10) NOT NULL DEFAULT '0' AFTER `data18`,
	CHANGE COLUMN `data20` `data20` INT(10) NOT NULL DEFAULT '0' AFTER `data19`,
	CHANGE COLUMN `data21` `data21` INT(10) NOT NULL DEFAULT '0' AFTER `data20`,
	CHANGE COLUMN `data22` `data22` INT(10) NOT NULL DEFAULT '0' AFTER `data21`,
	CHANGE COLUMN `data23` `data23` INT(10) NOT NULL DEFAULT '0' AFTER `data22`;

-- Convert unsigned value to signed for Subway.
UPDATE `gameobject_template` SET `data5`=-1 WHERE `entry`=176084;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
