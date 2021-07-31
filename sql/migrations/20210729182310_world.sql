DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210729182310');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210729182310');
-- Add your query below.


-- Quest The Green Hills of Stranglethorn not completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4516, 8, 338, 0, 0, 0, 1);
-- Quest Chapter I completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4517, 8, 339, 0, 0, 0, 0);
-- Does not have item Green Hills of Stranglethorn - Chapter I.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4518, 23, 2756, 1, 0, 0, 1);
-- Patch >= 1.3, Not Completed Quest 338, Completed Quest 339, Not Have Item 2756.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4519, -1, 4011, 4516, 4517, 4518, 0);
-- Quest Chapter II completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4520, 8, 340, 0, 0, 0, 0);
-- Does not have item Green Hills of Stranglethorn - Chapter II.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4521, 23, 2757, 1, 0, 0, 1);
-- Patch >= 1.3, Not Completed Quest 338, Completed Quest 340, Not Have Item 2757.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4522, -1, 4011, 4516, 4520, 4521, 0);
-- Quest Chapter III completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4523, 8, 341, 0, 0, 0, 0);
-- Does not have item Green Hills of Stranglethorn - Chapter III.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4524, 23, 2758, 1, 0, 0, 1);
-- Patch >= 1.3, Not Completed Quest 338, Completed Quest 341, Not Have Item 2758.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4525, -1, 4011, 4516, 4523, 4524, 0);
-- Quest Chapter IV completed.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4526, 8, 342, 0, 0, 0, 0);
-- Does not have item Green Hills of Stranglethorn - Chapter IV.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4527, 23, 2759, 1, 0, 0, 1);
-- Patch >= 1.3, Not Completed Quest 338, Completed Quest 342, Not Have Item 2759.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (4528, -1, 4011, 4516, 4526, 4527, 0);

-- Add missing Barnil Stonepot gossip options to restore deleted chapters of Green Hills of Stranglethorn.
DELETE FROM `gossip_scripts` WHERE `id`=54830;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54830, 0, 15, 22208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Cast Spell Create Chapter 1 DND');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54830, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9022, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Say Text');
DELETE FROM `gossip_scripts` WHERE `id`=54831;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54831, 0, 15, 22209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Cast Spell Create Chapter 2 DND');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54831, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9022, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Say Text');
DELETE FROM `gossip_scripts` WHERE `id`=54832;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54832, 0, 15, 22210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Cast Spell Create Chapter 3 DND');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54832, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9022, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Say Text');
DELETE FROM `gossip_scripts` WHERE `id`=54833;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54833, 0, 15, 22211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Cast Spell Create Chapter 4 DND');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (54833, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9022, 0, 0, 0, 0, 0, 0, 0, 0, 'Barnil Stonepot - Say Text');
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5483, 0, 0, 'Barnil, I seem to have misplaced Chapter I.', 9018, 1, 1, -1, 0, 54830, 0, 0, NULL, 0, 4519);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5483, 1, 0, 'Barnil, I seem to have misplaced Chapter II.', 9019, 1, 1, -1, 0, 54831, 0, 0, NULL, 0, 4522);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5483, 2, 0, 'Barnil, I seem to have misplaced Chapter III.', 9020, 1, 1, -1, 0, 54832, 0, 0, NULL, 0, 4525);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (5483, 3, 0, 'Barnil, I seem to have misplaced Chapter IV.', 9021, 1, 1, -1, 0, 54833, 0, 0, NULL, 0, 4528);


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
