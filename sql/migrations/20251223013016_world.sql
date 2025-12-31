DROP PROCEDURE IF EXISTS add_migration;
DELIMITER ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20251223013016');
IF v = 0 THEN
INSERT INTO `migrations` VALUES ('20251223013016');
-- Add your query below.


-- Patch 1.9.0: Auctioneers have been added in Undercity, Thunder Bluff, Stormwind City, Darnassus, Everlook, and Booty Bay.
DELETE FROM `creature` WHERE `id` IN (8672, 8721, 8674, 8722, 8719, 8670, 8669, 8723, 9857, 9858);
INSERT INTO `creature` (`guid`, `id`, `id2`, `id3`, `id4`, `id5`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecsmin`, `spawntimesecsmax`, `wander_distance`, `health_percent`, `mana_percent`, `movement_type`, `spawn_flags`, `visibility_mod`, `patch_min`, `patch_max`) VALUES 
(12692, 8669, 0, 0, 0, 0, 1, 9872.6, 2341.73, 1321.67, 3.52557, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10),
(12693, 8670, 0, 0, 0, 0, 0, -8824.28, 665.711, 97.4674, 0.541052, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10),
(32065, 8672, 0, 0, 0, 0, 0, 1542.4, 225.162, -56.7902, 5.23599, 300, 480, 0, 100, 100, 0, 0, 0, 7, 10),
(26769, 8674, 0, 0, 0, 0, 1, -1210.21, 94.8587, 134.535, 2.98451, 300, 480, 0, 100, 100, 0, 0, 0, 7, 10),
(12696, 8719, 0, 0, 0, 0, 0, -8821.53, 659.886, 97.4645, 0.401426, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10),
(32059, 8721, 0, 0, 0, 0, 0, 1542.45, 255.202, -56.7948, 1.01229, 300, 480, 0, 100, 100, 0, 0, 0, 7, 10),
(24708, 8722, 0, 0, 0, 0, 1, -1199.26, 110.693, 134.949, 3.05433, 300, 480, 0, 100, 100, 0, 0, 0, 7, 10),
(12698, 8723, 0, 0, 0, 0, 1, 9856.97, 2343.12, 1321.67, 5.67232, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10),
(12688, 9857, 0, 0, 0, 0, 1, 1691.07, -4460.57, 20.064, 2.5557, 300, 480, 0, 100, 0, 0, 0, 0, 0, 0),
(12704, 9857, 0, 0, 0, 0, 1, 1691.07, -4460.57, 20.064, 2.5557, 60, 120, 0, 100, 0, 0, 0, 0, 1, 6),
(12701, 9857, 0, 0, 0, 0, 1, 6772.35, -4679.5, 723.853, 0.907571, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10),
(12689, 9858, 0, 0, 0, 0, 1, 1674.96, -4465.59, 20.0642, 1.32645, 300, 480, 0, 100, 0, 0, 0, 0, 0, 0),
(12702, 9858, 0, 0, 0, 0, 1, 1674.96, -4465.59, 20.0642, 1.32645, 60, 120, 0, 100, 0, 0, 0, 0, 1, 6),
(12705, 9858, 0, 0, 0, 0, 0, -14446.5, 448.414, 4.12501, 2.9147, 60, 120, 0, 100, 0, 0, 0, 0, 7, 10);

-- Grizzlin and Kresky were in Orgrimmar before 1.9.
DELETE FROM `creature_template` WHERE `entry` IN (9857, 9858);
INSERT INTO `creature_template` (`entry`, `patch`, `name`, `subname`, `level_min`, `level_max`, `faction`, `npc_flags`, `gossip_menu_id`, `display_id1`, `display_id2`, `display_id3`, `display_id4`, `display_scale1`, `display_scale2`, `display_scale3`, `display_scale4`, `display_probability1`, `display_probability2`, `display_probability3`, `display_probability4`, `display_total_probability`, `mount_display_id`, `speed_walk`, `speed_run`, `detection_range`, `call_for_help_range`, `leash_range`, `type`, `pet_family`, `rank`, `unit_class`, `xp_multiplier`, `health_multiplier`, `mana_multiplier`, `armor_multiplier`, `damage_multiplier`, `damage_variance`, `damage_school`, `base_attack_time`, `ranged_attack_time`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `loot_id`, `pickpocket_loot_id`, `skinning_loot_id`, `gold_min`, `gold_max`, `spell_id1`, `spell_id2`, `spell_id3`, `spell_id4`, `spell_list_id`, `pet_spell_list_id`, `spawn_spell_id`, `auras`, `ai_name`, `movement_type`, `inhabit_type`, `civilian`, `racial_leader`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `school_immune_mask`, `immunity_flags`, `static_flags1`, `static_flags2`, `flags_extra`, `script_name`) VALUES 
(9857, 0, 'Auctioneer Grizzlin', NULL, 50, 50, 29, 4096, 0, 9132, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(9857, 1, 'Auctioneer Grizzlin', NULL, 50, 50, 29, 4096, 0, 9132, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(9857, 7, 'Auctioneer Grizzlin', NULL, 50, 50, 855, 4096, 0, 9132, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(9858, 0, 'Auctioneer Kresky', NULL, 50, 50, 29, 4096, 0, 10754, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 1.25, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(9858, 1, 'Auctioneer Kresky', NULL, 50, 50, 29, 4096, 0, 10754, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, ''),
(9858, 7, 'Auctioneer Kresky', NULL, 50, 50, 120, 4096, 0, 10754, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 100, 0, 1, 1.14286, 18, 5, 0, 7, 0, 0, 1, 1, 3, 1, 1, 1, 0.14, 0, 2000, 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, '', 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 138936326, 0, 2, '');


-- End of migration.
END IF;
END??
DELIMITER ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
