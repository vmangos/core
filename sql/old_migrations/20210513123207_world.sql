DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210513123207');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210513123207');
-- Add your query below.


-- Mark commands as critical as they can be used to change money.
INSERT INTO `command` (`name`, `security`, `help`, `flags`) VALUES ('debug setvaluebyindex', 5, 'Syntax: .debug setvaluebyindex [index] [type] [value]', 2);
INSERT INTO `command` (`name`, `security`, `help`, `flags`) VALUES ('debug setvaluebyname', 5, 'Syntax: .debug setvaluebyname [name] [value]', 2);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
