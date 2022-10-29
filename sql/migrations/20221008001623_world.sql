DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20221008001623');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20221008001623');
-- Add your query below.


-- Add periodic timer to list auras command.
UPDATE `mangos_string` SET `content_default`='id: %d eff: %d type: %d duration: %d maxduration: %d periodictimer: %d stacks: %d name: %s%s%s caster: %s' WHERE `entry`=468;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
