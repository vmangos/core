DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210107081002');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210107081002');
-- Add your query below.


-- Kolkar Invader does too much dmg #166
UPDATE `creature_template` SET `attack_power` = 40 WHERE `entry` = 9524;

-- Correct drop rate of Helcular's Rod #163
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -4 WHERE `item` = 3708 && `entry` IN (2248, 2249);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -2 WHERE `item` = 3708 && `entry` IN (2250, 2251);

-- Correct drop rate of Murloc Head #162
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -20 WHERE `item` = 3716 && `entry` IN (2377, 2375, 2374, 2376);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -10 WHERE `item` = 3716 && `entry` IN (14276);

-- Correct drop rate of Young Crocolisk Skin #161
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -30 WHERE `item` = 3397;

-- Correct drop rate of Satyr Horns #159
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -45 WHERE `item` = 5481 && `entry` IN (3771, 3770, 3767, 3762, 3765, 3759, 3758, 3763);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -35 WHERE `item` = 5481 && `entry` IN (3755, 3752, 3754, 3757);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -15 WHERE `item` = 5481 && `entry` IN (10647);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -5 WHERE `item` = 5481 && `entry` IN (3898, 4619, 3899, 3900);

-- Correct drop rate of Corroded Shrapnel #155
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -15 WHERE `item` = 5664 && `entry` IN (4029, 4028);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -2 WHERE `item` = 5664 && `entry` IN (4030);

-- Correct drop rate of Crystalized Scales #154
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -20 WHERE `item` = 5675 && `entry` IN (4044, 4041, 4042);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -2 WHERE `item` = 5675 && `entry` IN (4147);

-- Correct drop rate of Smoldering Embers #153
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -7 WHERE `item` = 5659;

-- Correct drop rate of Intact Elemental Bracer #147
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -15 WHERE `item` = 12220 && `entry`=3917;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -7 WHERE `item` = 12220 && `entry`=12759;

-- Correct drop rate of Battleworn Axe #138
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -45 WHERE `item` = 3014 && `entry` IN (440, 485);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -40 WHERE `item` = 3014 && `entry` IN (437);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -20 WHERE `item` = 3014 && `entry` IN (4463);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -15 WHERE `item` = 3014 && `entry` IN (615, 435);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -5 WHERE `item` = 3014 && `entry` IN (4064, 4065, 4462, 436, 4464);

-- Correct drop rate of Snapjaw Crocolisk Skin #174
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = -30 WHERE `item` = 4104;

-- Correct drop rate of Gaffer Jack #85
UPDATE `fishing_loot_template` SET `ChanceOrQuestChance` = -4 WHERE `item` = 6717 AND `entry` IN
(
    442,
    452,
    453,
    148
);

-- Remve wrong spawn of Ooze Covered Mithril Deposit #157 (this object is not even supposed to be in the zone)
DELETE FROM `gameobject` WHERE `guid` = 15430;
DELETE FROM `pool_gameobject` WHERE `guid` = 15430;

-- Remove wrong spawn of Mithril Node #151
DELETE FROM `gameobject` WHERE `guid` = 7208;
DELETE FROM `pool_gameobject` WHERE `guid` = 7208;

-- Remove wrong spawn of Bruiseweed inside of house on stairs #113
DELETE FROM `gameobject` WHERE `guid`=3564;
DELETE FROM `pool_gameobject` WHERE `guid` = 3564;

-- Unstuck Highland Razormaw #150
UPDATE `creature` SET `position_x`=-3114.49, `position_y`=-3255.39, `position_z`=65.3258  WHERE `guid` = 9981;

-- Correct race requirements for quests #131
UPDATE `quest_template` SET `RequiredRaces` = 8 WHERE `entry` IN (6344, 6341, 6342, 6343);
UPDATE `quest_template` SET `RequiredRaces` = 68 WHERE `entry` IN (6387, 6391, 6388, 6392);
UPDATE `quest_template` SET `RequiredRaces` = 16 WHERE `entry` IN (6321, 6323, 6322, 6324);
UPDATE `quest_template` SET `RequiredRaces` = 1 WHERE `entry` IN (6181, 6281, 6261, 6285);

-- Unstuck Thistle Bear #128
UPDATE `creature` SET `position_x`=7065.88, `position_y`=54.4393, `position_z`=15.3227 WHERE `guid` = 37115;

-- Add 1.4 version of Choker of the Fire Lord #160
DELETE FROM `item_template` WHERE `entry` = 18814;
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `extra_flags`, `other_team_entry`) VALUES (18814, 2, 4, 0, 'Choker of the Fire Lord', '', 1399, 4, 0, 1, 0, 0, 2, -1, -1, 74, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 6, 7, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17684, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 1);
INSERT INTO `item_template` (`entry`, `patch`, `class`, `subclass`, `name`, `description`, `display_id`, `quality`, `flags`, `buy_count`, `buy_price`, `sell_price`, `inventory_type`, `allowable_class`, `allowable_race`, `item_level`, `required_level`, `required_skill`, `required_skill_rank`, `required_spell`, `required_honor_rank`, `required_city_rank`, `required_reputation_faction`, `required_reputation_rank`, `max_count`, `stackable`, `container_slots`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `delay`, `range_mod`, `ammo_type`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `dmg_min3`, `dmg_max3`, `dmg_type3`, `dmg_min4`, `dmg_max4`, `dmg_type4`, `dmg_min5`, `dmg_max5`, `dmg_type5`, `block`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmrate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmrate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmrate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmrate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmrate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `page_text`, `page_language`, `page_material`, `start_quest`, `lock_id`, `material`, `sheath`, `random_property`, `set_id`, `max_durability`, `area_bound`, `map_bound`, `duration`, `bag_family`, `disenchant_id`, `food_type`, `min_money_loot`, `max_money_loot`, `extra_flags`, `other_team_entry`) VALUES (18814, 3, 4, 0, 'Choker of the Fire Lord', '', 1399, 4, 0, 1, 356542, 89135, 2, -1, -1, 78, 60, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 5, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18052, 1, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 1);

-- Remove custom creature spawn.
DELETE FROM `creature` WHERE `id`=1000001;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
