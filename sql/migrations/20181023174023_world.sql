DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20181023174023');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20181023174023');
-- Add your query below.

-- Tamed beasts should be removed on hand in.
UPDATE `creature_template` SET `ScriptName` = 'npc_hunterpetquest' WHERE `entry` IN
(
    3171, -- Thotar
    1231, -- Grif Wildheart
    3065, -- Yaw Sharpmane
    3601  -- Dazalar
);

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
