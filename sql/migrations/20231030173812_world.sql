DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20231030173812');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20231030173812');
-- Add your query below.


-- Horde battleground exit triggers.
UPDATE `areatrigger_teleport` SET `required_condition`=2 WHERE `id` IN (2606, 3949, 3669);
-- Alliance battleground exit triggers.
UPDATE `areatrigger_teleport` SET `required_condition`=3 WHERE `id` IN (2608, 3948, 3671);

-- Remove texts that exist elsewhere.
DELETE FROM `mangos_string` WHERE `entry` IN (752, 753);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
