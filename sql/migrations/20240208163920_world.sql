DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20240208163920');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20240208163920');
-- Add your query below.


-- Lesser Wind Stone
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data2`=0, `data3`=6540, `data4`=0, `data5`=0, `script_name`='go_wind_stone' WHERE `entry` IN (180456, 180518, 180529, 180544, 180549, 180564);

-- Wind Stone
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data2`=0, `data3`=6542, `data4`=0, `data5`=0, `script_name`='go_wind_stone' WHERE `entry` IN (180461, 180534, 180554);
UPDATE `gameobject_template` SET `script_name`='' WHERE `entry`=180502;

-- Greater Wind Stone
UPDATE `gameobject_template` SET `type`=2, `data0`=0, `data1`=0, `data2`=0, `data3`=6543, `data4`=0, `data5`=0, `script_name`='go_wind_stone' WHERE `entry` IN (180466, 180539, 180559);

-- Gossip menu for Wind Stone.
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6542, 7749, 6540, 887);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (889, 1, 24748, 0, 0, 0, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (890, -1, 888, 889, 0, 0, 0);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6542, 7772, 0, 890);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (6542, 7773, 0, 892);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6542, 0, 0, 'You will listen to this, vile duke! I am not your Twilight\'s Hammer lapdog! I am here to challenge you! Come! Come, and meet your death...', 0, 1, 1, -1, 0, 654201, 0, 0, '', 0, 892);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (354, 2, 20432, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (907, -1, 892, 354, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6542, 1, 0, 'Duke of Cynders! I hold your signet! Heed my call', 0, 1, 1, -1, 0, 654202, 0, 0, '', 0, 907);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (904, 2, 20435, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (908, -1, 892, 904, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6542, 2, 0, 'The Duke of Shards! I hold your signet! Heed my call!', 0, 1, 1, -1, 0, 654203, 0, 0, '', 0, 908);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (905, 2, 20433, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (909, -1, 892, 905, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6542, 3, 0, 'The Duke of Zephyrs! I hold your signet! Heed my call!', 0, 1, 1, -1, 0, 654204, 0, 0, '', 0, 909);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (906, 2, 20436, 1, 0, 0, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (910, -1, 892, 906, 0, 0, 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_broadcast_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `box_broadcast_text`, `condition_id`) VALUES (6542, 4, 0, 'The Duke of Fathoms! I hold your signet! Heed my call!', 0, 1, 1, -1, 0, 654205, 0, 0, '', 0, 910);

-- Gossip scripts for Greater Wind Stone.
DELETE FROM `gossip_scripts` WHERE `id`=654301;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654301, 0, 0, 15, 24785, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greater Wind Stone - Cast Spell Summon Royal, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654302;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654302, 0, 0, 15, 24787, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greater Wind Stone - Cast Spell Summon Royal Fire, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654303;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654303, 0, 0, 15, 24792, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greater Wind Stone - Cast Spell Summon Royal Earth, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654304;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654304, 0, 0, 15, 24791, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greater Wind Stone - Cast Spell Summon Royal Air, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654305;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654305, 0, 0, 15, 24793, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Greater Wind Stone - Cast Spell Summon Royal Water, Trigger');

-- Gossip scripts for Wind Stone.
DELETE FROM `gossip_scripts` WHERE `id`=654201;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654201, 0, 0, 15, 24762, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wind Stone - Cast Spell Summon Duke Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654202;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654202, 0, 0, 15, 24766, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wind Stone - Cast Spell Summon Duke Fire Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654203;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654203, 0, 0, 15, 24771, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wind Stone - Cast Spell Summon Duke Earth Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654204;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654204, 0, 0, 15, 24769, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wind Stone - Cast Spell Summon Duke Air Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654205;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654205, 0, 0, 15, 24773, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Wind Stone - Cast Spell Summon Duke Water Trigger');

-- Gossip scripts for Lesser Wind Stone.
DELETE FROM `gossip_scripts` WHERE `id`=654001;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654001, 0, 0, 15, 24745, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lesser Wind Stone - Cast Spell Summon Templar, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654002;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654002, 0, 0, 15, 24747, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lesser Wind Stone - Cast Spell Summon Templar Fire, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654003;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654003, 0, 0, 15, 24759, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lesser Wind Stone - Cast Spell Summon Templar Earth, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654004;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654004, 0, 0, 15, 24757, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lesser Wind Stone - Cast Spell Summon Templar Air, Trigger');
DELETE FROM `gossip_scripts` WHERE `id`=654005;
INSERT INTO `gossip_scripts` (`id`, `delay`, `priority`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES
(654005, 0, 0, 15, 24761, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lesser Wind Stone - Cast Spell Summon Templar Water, Trigger');

-- Correct positions.
UPDATE `gameobject` SET `position_x`=-6944.2, `position_y`=1180.51, `position_z`=11.3674 WHERE `guid`=49308;

-- Define spell targets.
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180456, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180518, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180529, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180544, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180549, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24734, 0, 180564, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180456, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180518, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180529, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180544, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180549, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24744, 0, 180564, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180456, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180518, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180529, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180544, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180549, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24756, 0, 180564, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180456, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180518, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180529, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180544, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180549, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24758, 0, 180564, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180456, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180518, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180529, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180544, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180549, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24760, 0, 180564, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24763, 0, 180461, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24763, 0, 180534, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24763, 0, 180554, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24765, 0, 180461, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24765, 0, 180534, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24765, 0, 180554, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24768, 0, 180461, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24768, 0, 180534, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24768, 0, 180554, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24770, 0, 180461, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24770, 0, 180534, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24770, 0, 180554, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24772, 0, 180461, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24772, 0, 180534, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24772, 0, 180554, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24784, 0, 180466, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24784, 0, 180539, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24784, 0, 180559, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24786, 0, 180466, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24786, 0, 180539, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24786, 0, 180559, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24788, 0, 180466, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24788, 0, 180539, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24788, 0, 180559, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24789, 0, 180466, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24789, 0, 180539, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24789, 0, 180559, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24790, 0, 180466, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24790, 0, 180539, 4878);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `build_min`) VALUES (24790, 0, 180559, 4878);

-- Assign spawn spells.
UPDATE `creature_template` SET `spawn_spell_id`=25035 WHERE `entry` IN (15203, 15204, 15205, 15206, 15207, 15208, 15209, 15211, 15212, 15220, 15305, 15307);

-- Add immune to player flags to Abyssal Council npcs.
UPDATE `creature_template` SET `unit_flags`=320 WHERE `entry` IN (15209, 15307, 15212, 15211, 15206, 15208, 15220, 15207, 15203, 15205, 15204, 15305);


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
