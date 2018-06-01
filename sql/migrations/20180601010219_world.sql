DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20180601010219');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20180601010219');
-- Add your query below.


-- Remove facing target from summon creature command and replaced it with script id.
UPDATE `quest_end_scripts` SET `o`=5.314, `dataint2`=0 WHERE `id`=9028 && `delay`=1 && `command`=10;
UPDATE `quest_end_scripts` SET `dataint2`=20 WHERE `command`=10 && `dataint2`=2;
DELETE FROM `event_scripts` WHERE `id`=20;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (20, 0, 35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Face Target');


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
