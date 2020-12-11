DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20201211155325');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20201211155325');
-- Add your query below.


-- Kolkar Wrangler should run away from rooted target.
DELETE FROM `creature_ai_events` WHERE `creature_id`=3272;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327201, 3272, 0, 2, 0, 100, 0, 15, 0, 0, 0, 327201, 0, 0, 'Kolkar Wrangler - Flee at 15% HP');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (327202, 3272, 0, 33, 0, 100, 1, 20000, 20000, 0, 0, 327202, 0, 0, 'Kolkar Wrangler - Run Away from Target when Rooted');
DELETE FROM `creature_ai_scripts` WHERE `id`=327202;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (327202, 0, 20, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 2428, 'Kolkar Wrangler - Move Away from Target');

-- Moonkins should not be skinnable.
UPDATE `creature_template` SET `skinning_loot_id`=0 WHERE `entry` IN (2927, 2928, 2929, 8210, 10157, 10158, 10159, 10160);

-- Move wolf stuck in statue in Ashenvale.
UPDATE `creature` SET `position_x`=2719.96, `position_y`=-99.9314, `position_z`=94.7723 WHERE `guid`=34977;

-- Remove Mulgore Spice Bread from Riverpaw Gnoll.
DELETE FROM `creature_loot_template` WHERE `item`=4544 && `entry`=117;

-- Mossy Tumor drop chance should be around 50%.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-50 WHERE `item`=5170;

-- Correct Rep and XP for old version of Crown of the Earth.
UPDATE `quest_template` SET `RewRepValue1`=75, `RewXP`=660, `RewMoneyMaxLevel`=390 WHERE `entry`=934;

-- Correct drop chance of Thresher Eye.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5412 && `entry`=2185;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=5412 && `entry`=2187;

-- Add missing quest complete triggers for The Master's Glaive.
INSERT INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES (224, 944);
INSERT INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES (225, 944);

-- Add second Onu is meditating quest to Onu.
INSERT INTO `creature_questrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (3616, 960, 0, 10);
INSERT INTO `creature_involvedrelation` (`id`, `quest`, `patch_min`, `patch_max`) VALUES (3616, 960, 0, 10);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (949, 8, 949, 0, 0, 0, 1);
UPDATE `quest_template` SET `SpecialFlags`=1, `RequiredCondition`=949, `PrevQuestId`=944, `OfferRewardText`='I am meditating on your task, $N.  Meditating on reasons why the Twilight\'s Hammer and naga are here.$B$BWhen you are ready, use the phial of scrying to create a scrying bowl.  Then, contact me through the bowl.$B$BIf you have lost your phial of scrying, then here is another.' WHERE `entry`=960;

-- Quest Proof of Demise should require At War With The Scarlet Crusade Part 1.
UPDATE `quest_template` SET `PrevQuestId`=427 WHERE `entry`=374;

-- Move wolves spawned too close to tree.
UPDATE `creature` SET `position_x`=-9368.2, `position_y`=-229.018, `position_z`=65.965 WHERE `guid`=81096;
UPDATE `creature` SET `position_x`=-9356.6, `position_y`=-217.255, `position_z`=66.484 WHERE `guid`=81097;
UPDATE `creature` SET `position_x`=-8863.68, `position_y`=-301.456, `position_z`=77.612 WHERE `guid`=80134;

-- Fix Cannon for quest Death From Below.
INSERT INTO `spell_mod` (`Id`, `AttributesEx2`, `Comment`) VALUES (4170, 4, 'Quest Death From Below: Cannon Ball - Ignore LoS');

-- Events list for Rot Hide Mystic
DELETE FROM `creature_ai_events` WHERE `creature_id`=1773;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (177301, 1773, 0, 6, 0, 20, 0, 0, 0, 0, 0, 177301, 0, 0, 'Rot Hide Mystic - Spawn Nightlash on death');
DELETE FROM `creature_ai_scripts` WHERE `id` IN (177301, 177302, 177303);
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (177301, 0, 10, 1983, 150000, 0, 0, 0, 0, 0, 0, 0, 0, -1, 1, 1078.49, 1541.23, 28.9379, 0.113425, 0, 'Rot Hide Mystic - Summon Creature Nightlash');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (17730, 'Silverpine Forest - Rot Hide Mystic', 3237, 100, 1, 0, 0, 0, 2, 12, 30, 45, 0, 332, 100, 15, 0, 0, 0, 14, 22, 14, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=17730 WHERE `entry`=1773;

-- Lady Vespia should drop Ring of Zoram.
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (10559, 5445, -100, 0, 1, 1, 0, 0, 10);

-- Correct drop chance for Pridewing Venom Sac.
DELETE FROM `creature_loot_template` WHERE `item`=5808;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5928, 5808, -5, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4011, 5808, -30, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4012, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4013, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4014, 5808, -35, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (4015, 5808, -15, 0, 1, 1, 0, 0, 10);
UPDATE `creature_template` SET `loot_id`=0 WHERE `entry`=6141;

-- Quest Supplies for the Crossroads should require completing Disrupt the Attacks first.
UPDATE `quest_template` SET `PrevQuestId`=871 WHERE `entry`=5041;

-- Correct drop chances for Magic Dust.
DELETE FROM `creature_loot_template` WHERE `item`=2091;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (99, 2091, 2, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (5809, 2091, 2, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (1936, 2091, 5, 0, 1, 1, 0, 0, 10);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`, `patch_min`, `patch_max`) VALUES (832, 2091, 15, 0, 1, 1, 0, 0, 10);

-- Fix target for script to despawn ooze for quest A Little Slime Goes a Long Way Part 2.
DELETE FROM `spell_scripts` WHERE `id`=15702;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15702, 0, 17, 11954, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Empty Pure Sample Jar - Create Item Filled Pure Sample Jar');
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (15702, 0, 18, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Empty Pure Sample Jar - Despawn Creature');

-- Correct unit flags for White Kitten.
UPDATE `creature_template` SET `unit_flags`=768 WHERE `entry`=7386;

-- Remove custom version of following gameobjects:
-- Quilboar Watering Hole, Spring Well, Ruins of Stardust Fountain
DELETE FROM `gameobject_template` WHERE `entry` IN (300146, 300147, 300148);
DELETE FROM `gameobject` WHERE `id` IN (300146, 300147, 300148);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107045, 8, 299, 'Spring Well', 1, 226, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107046, 8, 299, 'Quilboar Watering Hole', 1, 224, 25, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `script_name`) VALUES (107047, 8, 299, 'Ruins of Stardust Fountain', 1, 223, 5, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99863, 107045, 0, -43.4367, -923.198, 55.8714, 5.75401, 0, 0, 0.261511, -0.9652, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99864, 107046, 1, -3573.24, -1864.45, 82.4975, 4.13904, 0, 0, 0.878194, -0.478305, 1);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`) VALUES (99862, 107047, 1, 2079.39, -234.624, 98.9194, 6.04, 0, 0, 0.121293, -0.992617, 1);

-- Correct drop chance for Highborne Relic.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5360;

-- Correct drop chance for Fine Crab Chunks.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=12237;

-- Correct drop chance for Worn Parchment.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-45 WHERE `item`=5348;

-- Correct drop chance for Top of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-20 WHERE `item`=7498;

-- Correct drop chance for Middle of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-10 WHERE `item`=7499 && `entry` IN (2208, 2207);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-1 WHERE `item`=7499 && `entry` NOT IN (2208, 2207);

-- Correct drop chance for Bottom of Gelkak's Key.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-20 WHERE `item`=7500 && `entry`=2236;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-5 WHERE `item`=7500 && `entry`=2233;

-- Correct drop chance for Fine Moonstalker Pelt.
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-40 WHERE `item`=5386;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
