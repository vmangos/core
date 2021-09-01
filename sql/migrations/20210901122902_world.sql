DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210901122902');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210901122902');
-- Add your query below.
-- Added new events for Gazban(2624) event to cast his spell, change phase, and transform.
-- Events list for Gazban
DELETE FROM `creature_ai_events` WHERE `creature_id`=2624;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (262402, 2624, 0, 0, 0, 100, 1, 6100, 12800, 7200, 15700, 262402, 0, 0, 'Gazban - Cast Crash of Waves');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (262403, 2624, 0, 2, 0, 100, 0, 90, 10, 0, 0, 262403, 262401, 0, 'Gazban - Cast Gazban Transform Set Phase 1');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (262404, 2624, 0, 0, 1, 100, 0, 1000, 1000, 0, 0, 262404, 0, 0, 'Gazban - Cast Gazban Water Form (Phase 1)');

-- Scripts added that are triggered by the above events
DELETE FROM `creature_ai_scripts` WHERE `id`=262402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262402, 0, 15, 5403, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Cast Crash of Waves');
DELETE FROM `creature_ai_scripts` WHERE `id`=262403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262403, 0, 15, 5402, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Cast Gazban Transform Set Phase 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=262401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1113, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=262404;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (262404, 0, 15, 5404, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Gazban - Cast Gazban Water Form (Phase 1)');

-- Position of Gazban on spawn
DELETE FROM `event_scripts` WHERE `id`=364;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (364, 5, 10, 2624, 900000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, -12167.9, 630.3, -63.78, 3.65, 0, 'Summon Gazban From Altar of the Tides');

-- Change spell cooldown on Catelyns Blade, so you cant spam spawn Gazban
UPDATE item_template SET class=12, subclass=0, name='Catelyn''s Blade', description='', display_id=7069, quality=1, flags=2112, buy_count=1, buy_price=0, sell_price=0, inventory_type=0, allowable_class=-1, allowable_race=-1, item_level=1, required_level=0, required_skill=0, required_skill_rank=0, required_spell=0, required_honor_rank=0, required_city_rank=0, required_reputation_faction=0, required_reputation_rank=0, max_count=1, stackable=1, container_slots=0, stat_type1=0, stat_value1=0, stat_type2=0, stat_value2=0, stat_type3=0, stat_value3=0, stat_type4=0, stat_value4=0, stat_type5=0, stat_value5=0, stat_type6=0, stat_value6=0, stat_type7=0, stat_value7=0, stat_type8=0, stat_value8=0, stat_type9=0, stat_value9=0, stat_type10=0, stat_value10=0, delay=0, range_mod=0.0, ammo_type=0, dmg_min1=0.0, dmg_max1=0.0, dmg_type1=0, dmg_min2=0.0, dmg_max2=0.0, dmg_type2=0, dmg_min3=0.0, dmg_max3=0.0, dmg_type3=0, dmg_min4=0.0, dmg_max4=0.0, dmg_type4=0, dmg_min5=0.0, dmg_max5=0.0, dmg_type5=0, block=0, armor=0, holy_res=0, fire_res=0, nature_res=0, frost_res=0, shadow_res=0, arcane_res=0, spellid_1=3678, spelltrigger_1=0, spellcharges_1=0, spellppmrate_1=0.0, spellcooldown_1=30000, spellcategory_1=0, spellcategorycooldown_1=-1, spellid_2=0, spelltrigger_2=0, spellcharges_2=0, spellppmrate_2=0.0, spellcooldown_2=-1, spellcategory_2=0, spellcategorycooldown_2=-1, spellid_3=0, spelltrigger_3=0, spellcharges_3=0, spellppmrate_3=0.0, spellcooldown_3=-1, spellcategory_3=0, spellcategorycooldown_3=-1, spellid_4=0, spelltrigger_4=0, spellcharges_4=0, spellppmrate_4=0.0, spellcooldown_4=-1, spellcategory_4=0, spellcategorycooldown_4=-1, spellid_5=0, spelltrigger_5=0, spellcharges_5=0, spellppmrate_5=0.0, spellcooldown_5=0, spellcategory_5=0, spellcategorycooldown_5=0, bonding=4, page_text=0, page_language=0, page_material=0, start_quest=0, lock_id=0, material=0, sheath=0, random_property=0, set_id=0, max_durability=0, area_bound=0, map_bound=0, duration=0, bag_family=0, disenchant_id=0, food_type=0, min_money_loot=0, max_money_loot=0, extra_flags=0, other_team_entry=1 WHERE entry=4027 AND patch=0;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
