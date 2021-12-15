DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20211201044057');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20211201044057');
-- Add your query below.


-- Completion script for quest A Gnome's Assistance.
DELETE FROM `quest_end_scripts` WHERE `id`=3941;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(3941, 0, 35, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.84411, 0, 'A Gnome\'s Assistance: J.D. Collie - Set Orientation'),
(3941, 1, 3, 0, 4462, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -6025.34, -1020.62, -216.039, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Move'),
(3941, 1, 4, 147, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Remove Npc Flags'),
(3941, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4839, 4840, 4841, 4842, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Say Text'),
(3941, 10, 1, 69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Set Emote State to STATE_USESTANDING'),
(3941, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4846, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Say Text'),
(3941, 16, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Set Emote State to ONESHOT_NONE'),
(3941, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4847, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Say Text'),
(3941, 20, 1, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Emote OneShotWoundCritical'),
(3941, 20, 15, 14208, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Cast Spell JD Explosion'),
(3941, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4852, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Say Text'),
(3941, 23, 1, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Emote OneShotCry'),
(3941, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4853, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Say Text'),
(3941, 26, 3, 0, 1369, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, -6033.25, -1017.56, -217.052, 0.872665, 0, 'A Gnome\'s Assistance: J.D. Collie - Move'),
(3941, 29, 4, 147, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'A Gnome\'s Assistance: J.D. Collie - Add Npc Flags');

-- Define coordinates for spell JD Explosion.
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `build_min`, `build_max`) VALUES (14208, 1, -6025.75, -1021.17, -216, 0, 0, 5875);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
