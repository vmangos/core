DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200118131229');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200118131229');
-- Add your query below.


-- Add targets for several spells.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES 
(24933, 1, 15328),
(25029, 1, 15328),
(25032, 1, 15328),
(25145, 1, 15414),
(25145, 1, 15421),
(25145, 1, 15422),
(25145, 1, 15424),
(25149, 1, 15414),
(25149, 1, 15421),
(25149, 1, 15422),
(25149, 1, 15424),
(25150, 1, 15414),
(25150, 1, 15421),
(25150, 1, 15422),
(25150, 1, 15424);

-- Make the Steam Tonk spells positive so that they can target other players' tonks.
UPDATE `spell_template` SET `customFlags`= `customFlags` | 4 WHERE `entry` IN (24933, 25029, 25032);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
