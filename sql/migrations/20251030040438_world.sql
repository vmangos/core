DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251030040438');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251030040438');
-- Add your query below.


-- Remove unused possibly custom gameobject.
DELETE FROM `gameobject_template` WHERE `entry`=182509;

-- Disable trap from triggering by proximity and cast spell manually on use.
UPDATE `gameobject_template` SET `script_name`='go_arathi_cannon_fire' WHERE `entry`=113529;
DELETE FROM `gameobject_scripts` WHERE `id`=16636;
INSERT INTO `gameobject_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(16636, 0, 0, 15, 4170, 0, 0, 0, 113529, 10, 13, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Arathi Cannon Fire - Cast Spell Cannon Ball');

-- Add script to prevent spell from killing players.
UPDATE `spell_template` SET `script_name`='spell_death_from_below_cannon_fire' WHERE `entry`=4170;


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
