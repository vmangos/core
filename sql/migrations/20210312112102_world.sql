DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20210312112102');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20210312112102');
-- Add your query below.


-- Change condition value fields to int32.
ALTER TABLE `conditions`
	CHANGE COLUMN `value1` `value1` INT NOT NULL DEFAULT '0' COMMENT 'data field one for the condition' AFTER `type`,
	CHANGE COLUMN `value2` `value2` INT NOT NULL DEFAULT '0' COMMENT 'data field two for the condition' AFTER `value1`,
	CHANGE COLUMN `value3` `value3` INT NOT NULL DEFAULT '0' COMMENT 'data field three for the condition' AFTER `value2`,
	CHANGE COLUMN `value4` `value4` INT NOT NULL DEFAULT '0' COMMENT 'data field four for the condition' AFTER `value3`;

-- CONDITIONS:
-- Main Event Not Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (483, 36, 4021, 0, 0, 0, 1);
-- 10 Kills
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (484, 35, 4021, 0, 10, 1, 0);
-- 20 Kills
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (485, 35, 4021, 0, 20, 1, 0);
-- Main Event Active
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (486, 36, 4021, 0, 0, 0, 0);
-- Distance to West Point below 50
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (487, 54, -287, -1872, 93, 50, 0);
-- Distance to North Point below 50
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (488, 54, -219, -1930, 93, 50, 0);
-- GameObject Krom'zar's Banner spawned within 200 yards.
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`, `value3`, `value4`, `flags`) VALUES (489, 21, 164690, 200, 0, 0, 0);

-- Remove permanently spawned Fire and Smoke GameObjects.
DELETE FROM `gameobject` WHERE `guid` IN (14776, 14779, 16770, 16771, 14777, 14780, 15785, 16774, 16776, 16772);

-- Add Fire and Smoke GameObjects
INSERT INTO `gameobject` (`guid`, `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `state`, `spawntimesecsmin`, `spawntimesecsmax`) VALUES 
(56100, 164870, 1, -253.74, -1871.41, 94.046, 3.80482, 0, 0, -0.945518, 0.325568, 1, -60, -60),
(56101, 164870, 1, -249.675, -1868.05, 93.2914, 2.84488, 0, 0, 0.989016, 0.147811, 1, -60, -60),
(56102, 164870, 1, -254.563, -1877.97, 93.2563, 4.69494, 0, 0, -0.71325, 0.70091, 1, -60, -60),
(56103, 164870, 1, -248.594, -1875.83, 93.7147, 5.02655, 0, 0, -0.587785, 0.809017, 1, -60, -60),
(56104, 164870, 1, -246.53, -1883.3, 93.5962, 5.2709, 0, 0, -0.484809, 0.87462, 1, -60, -60),
(56105, 164870, 1, -240.891, -1880.36, 94.0315, 3.73501, 0, 0, -0.956305, 0.292372, 1, -60, -60),
(56106, 164870, 1, -339.232, -1895.53, 107.017, 4.29351, 0, 0, -0.83867, 0.54464, 1, -60, -60),
(56107, 164870, 1, -334.673, -1902.03, 104.873, 6.19592, 0, 0, -0.0436192, 0.999048, 1, -60, -60),
(56108, 164870, 1, -331.414, -1889.41, 105.352, 0.541051, 0, 0, 0.267238, 0.963631, 1, -60, -60),
(56109, 164870, 1, -339.084, -1893.29, 106.482, 4.39823, 0, 0, -0.809016, 0.587786, 1, -60, -60),
(56110, 164870, 1, -326.821, -1890.86, 105.762, 1.71042, 0, 0, 0.754709, 0.656059, 1, -60, -60),
(56111, 164870, 1, -326.327, -1887.59, 103.243, 5.98648, 0, 0, -0.147809, 0.989016, 1, -60, -60),
(56112, 176746, 1, -327.083, -1894.63, 106.751, 2.84488, 0, 0, 0.989016, 0.147811, 1, -60, -60),
(56113, 176746, 1, -340.187, -1895.68, 103.064, 0.139625, 0, 0, 0.0697555, 0.997564, 1, -60, -60),
(56114, 176747, 1, -324.356, -1901.08, 105.747, 0.104719, 0, 0, 0.0523357, 0.99863, 1, -60, -60),
(56115, 176747, 1, -330.604, -1904.86, 106.758, 0.157079, 0, 0, 0.0784588, 0.996917, 1, -60, -60),
(56116, 176747, 1, -336.167, -1891.86, 107.946, 1.55334, 0, 0, 0.700909, 0.713251, 1, -60, -60),
(56117, 176747, 1, -240.066, -1880.02, 94.0675, 2.63544, 0, 0, 0.968147, 0.250381, 1, -60, -60),
(56118, 176747, 1, -251.803, -1872.35, 94.8197, 4.24115, 0, 0, -0.85264, 0.522499, 1, -60, -60),
(56119, 176747, 1, -248.915, -1879.92, 93.4904, 3.50812, 0, 0, -0.983254, 0.182238, 1, -60, -60);

-- Events list for Regthar Deathgate
DELETE FROM `creature_ai_events` WHERE `creature_id`=3389;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (338901, 3389, 486, 1, 0, 100, 1, 0, 0, 60000, 65000, 338901, 0, 0, 'Regthar Deathgate - Summon Fire GameObjects while Counterattack Event Active');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(338901, 0, 9, 56100, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56100)'),
(338901, 0, 9, 56101, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56101)'),
(338901, 0, 9, 56102, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56102)'),
(338901, 0, 9, 56103, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56103)'),
(338901, 0, 9, 56104, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56104)'),
(338901, 0, 9, 56105, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56105)'),
(338901, 0, 9, 56106, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56106)'),
(338901, 0, 9, 56107, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56107)'),
(338901, 0, 9, 56108, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56108)'),
(338901, 0, 9, 56109, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56109)'),
(338901, 0, 9, 56110, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56110)'),
(338901, 0, 9, 56111, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Smoke Emitter 02 (GUID: 56111)'),
(338901, 0, 9, 56112, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Big Barracks Flame (GUID: 56112)'),
(338901, 0, 9, 56113, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Big Barracks Flame (GUID: 56113)'),
(338901, 0, 9, 56114, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56114)'),
(338901, 0, 9, 56115, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56115)'),
(338901, 0, 9, 56116, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56116)'),
(338901, 0, 9, 56117, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56117)'),
(338901, 0, 9, 56118, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56118)'),
(338901, 0, 9, 56119, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Respawn Small Barracks Flame (GUID: 56119)');
UPDATE `creature_template` SET `ai_name`='EventAI', `script_name`='' WHERE `entry`=3389;

-- Events list for Lanti'gah
DELETE FROM `creature_ai_events` WHERE `creature_id`=9990;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (999001, 9990, 0, 29, 0, 100, 1, 8, 1, 5000, 5000, 999001, 0, 0, 'Lanti\'gah - Set Emote State on Move Point 1');
DELETE FROM `creature_ai_scripts` WHERE `id`=999001;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (999001, 0, 1, 233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lanti\'gah - Set Emote State to Work No Sheathe Mining');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9990;

-- Lanti'gah should use random movement by default.
UPDATE `creature` SET `wander_distance`=5, `movement_type`=1, `position_x`=-294.827, `position_y`=-1913.27, `position_z`=91.7916, `orientation`=0.281399 WHERE `id`=9990;

-- Events list for Kolkar Stormseer
DELETE FROM `creature_ai_events` WHERE `creature_id`=9523;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (952301, 9523, 0, 6, 0, 100, 0, 0, 0, 0, 0, 952301, 0, 0, 'Kolkar Stormseer - Set Counterattack Map Event Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (952302, 9523, 486, 1, 0, 100, 1, 0, 40000, 40000, 50000, 952302, 0, 0, 'Kolkar Stormseer - Cast Fling Torch OOC while Counterattack Event Active');
DELETE FROM `creature_ai_scripts` WHERE `id`=952301;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952301, 0, 65, 4021, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 'Kolkar Stormseer - Set Map Event Data');
DELETE FROM `creature_ai_scripts` WHERE `id`=952302;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952302, 0, 15, 14292, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kolkar Stormseer - Cast Spell Fling Torch');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (95230, 'Barrens - Kolkar Stormseer', 6535, 100, 4, 0, 0, 0, 0, 20, 10, 30, 0, 9532, 100, 1, 0, 0, 8, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `faction`=130, `movement_type`=1, `spell_list_id`=95230, `ai_name`='EventAI', `script_name`='' WHERE `entry`=9523;

-- Events list for Kolkar Invader
DELETE FROM `creature_ai_events` WHERE `creature_id`=9524;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (952401, 9524, 0, 9, 0, 100, 0, 10, 50, 0, 0, 952401, 0, 0, 'Kolkar Invader - Cast Rushing Charge On Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (952402, 9524, 0, 6, 0, 100, 0, 0, 0, 0, 0, 952402, 0, 0, 'Kolkar Invader - Set Counterattack Map Event Data on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (952403, 9524, 486, 1, 0, 100, 1, 0, 40000, 40000, 50000, 952403, 0, 0, 'Kolkar Invader - Cast Fling Torch OOC while Counterattack Event Active');
DELETE FROM `creature_ai_scripts` WHERE `id`=952401;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952401, 0, 15, 6268, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kolkar Invader - Cast Spell Rushing Charge');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1254, 0, 0, 0, 0, 0, 0, 0, 0, 'Kolkar Invader - Say Emoted Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=952402;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952402, 0, 65, 4021, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486, 'Kolkar Invader - Set Map Event Data');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (95240, 'Barrens - Kolkar Invader', 11976, 100, 1, 0, 0, 0, 5, 8, 6, 10, 0, 8014, 100, 1, 0, 0, 32, 8, 15, 8, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature_ai_scripts` WHERE `id`=952403;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (952403, 0, 15, 14292, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kolkar Invader - Cast Spell Tetanus');
UPDATE `creature_template` SET `faction`=130, `movement_type`=1, `ai_name`='EventAI', `script_name`='' WHERE `entry`=9524;

-- Define target for spell Fling Torch
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`, `conditionId`, `inverseEffectMask`, `build_min`, `build_max`) VALUES (14292, 0, 164870, 0, 0, 0, 5875);

-- These texts should be yelled.
UPDATE `broadcast_text` SET `chat_type`=1 WHERE `entry` IN (4914, 4915, 4917);

-- Events list for Warlord Krom'zar
DELETE FROM `creature_ai_events` WHERE `creature_id`=9456;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945601, 9456, 0, 6, 0, 100, 0, 0, 0, 0, 0, 945601, 0, 0, 'Warlord Krom\'zar - Cast Create Krom\'zar\'s Banner on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945602, 9456, 0, 11, 0, 100, 0, 0, 0, 0, 0, 945602, 0, 0, 'Warlord Krom\'zar - Say Text on Spawn');
DELETE FROM `creature_ai_scripts` WHERE `id`=945601;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945601, 0, 15, 13965, 7, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Krom\'zar - Cast Spell Create Krom zar s Banner');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945601, 0, 62, 4021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Warlord Krom\'zar - End Counterattack Map Event');
DELETE FROM `creature_ai_scripts` WHERE `id`=945602;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4914, 4915, 4917, 4919, 0, 0, 0, 0, 0, 'Warlord Krom\'zar - Say Text');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (94560, 'Barrens - Warlord Krom\'zar', 11976, 50, 1, 0, 0, 0, 5, 8, 5, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `spell_list_id`=94560, `ai_name`='EventAI', `script_name`='', `faction`=16, `movement_type`=1, `base_attack_time`=2400, `flags_extra`=`flags_extra` | 33554432 WHERE `entry`=9456;

-- Events list for Horde Defender
DELETE FROM `creature_ai_events` WHERE `creature_id`=9457;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945701, 9457, 0, 4, 0, 100, 0, 0, 0, 0, 0, 945701, 0, 0, 'Horde Defender - Play Sound on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945702, 9457, 0, 6, 0, 100, 0, 0, 0, 0, 0, 945702, 0, 0, 'Horde Defender - Make Regthar Deathgate Say Text on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945703, 9457, 0, 4, 0, 10, 0, 0, 0, 0, 0, 945703, 0, 0, 'Horde Defender - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945704, 9457, 0, 1, 0, 100, 1, 0, 30000, 20000, 30000, 945704, 0, 0, 'Horde Defender - Move to Position OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=945701;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945701, 0, 16, 7120, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Defender - Play Sound');
DELETE FROM `creature_ai_scripts` WHERE `id`=945702;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945702, 0, 0, 0, 0, 0, 0, 13979, 0, 9, 2, 4757, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Defender - Make Regthar Deathgate Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=945703;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945703, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4921, 4922, 4923, 4924, 0, 0, 0, 0, 0, 'Horde Defender - Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=945704;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945704, 0, 3, 3, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, -288.089, -1874.417, 92.743, 5, 487, 'Horde Defender - Move to West Point');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945704, 0, 3, 3, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, -219.482, -1930.816, 93.553, 5, 488, 'Horde Defender - Move to North Point');
UPDATE `creature_template` SET `ai_name`='EventAI' WHERE `entry`=9457;

-- Events list for Horde Axe Thrower
DELETE FROM `creature_ai_events` WHERE `creature_id`=9458;
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945801, 9458, 0, 4, 0, 100, 0, 0, 0, 0, 0, 945801, 0, 0, 'Horde Axe Thrower - Play Sound on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945802, 9458, 0, 6, 0, 100, 0, 0, 0, 0, 0, 945802, 0, 0, 'Horde Axe Thrower - Make Regthar Deathgate Say Text on Death');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945803, 9458, 0, 4, 0, 10, 0, 0, 0, 0, 0, 945803, 0, 0, 'Horde Axe Thrower - Say Text on Aggro');
INSERT INTO `creature_ai_events` (`id`, `creature_id`, `condition_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_script`, `action2_script`, `action3_script`, `comment`) VALUES (945804, 9458, 0, 1, 0, 100, 1, 0, 30000, 20000, 30000, 945804, 0, 0, 'Horde Axe Thrower - Move to Position OOC');
DELETE FROM `creature_ai_scripts` WHERE `id`=945801;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945801, 0, 16, 7119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Axe Thrower - Play Sound');
DELETE FROM `creature_ai_scripts` WHERE `id`=945802;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945802, 0, 0, 0, 0, 0, 0, 13979, 0, 9, 2, 4757, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Axe Thrower - Make Regthar Deathgate Say Text');
DELETE FROM `creature_ai_scripts` WHERE `id`=945803;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4921, 4922, 4923, 4924, 0, 0, 0, 0, 0, 'Horde Axe Thrower - Say Tex');
DELETE FROM `creature_ai_scripts` WHERE `id`=945804;
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945804, 0, 3, 3, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, -288.089, -1874.417, 92.743, 5, 487, 'Horde Axe Thrower - Move to West Point');
INSERT INTO `creature_ai_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (945804, 0, 3, 3, 0, 5, 0, 0, 0, 0, 4, 0, 0, 0, 0, -219.482, -1930.816, 93.553, 5, 488, 'Horde Axe Thrower - Move to North Point');
REPLACE INTO `creature_spells` (`entry`, `name`, `spellId_1`, `probability_1`, `castTarget_1`, `targetParam1_1`, `targetParam2_1`, `castFlags_1`, `delayInitialMin_1`, `delayInitialMax_1`, `delayRepeatMin_1`, `delayRepeatMax_1`, `scriptId_1`, `spellId_2`, `probability_2`, `castTarget_2`, `targetParam1_2`, `targetParam2_2`, `castFlags_2`, `delayInitialMin_2`, `delayInitialMax_2`, `delayRepeatMin_2`, `delayRepeatMax_2`, `scriptId_2`, `spellId_3`, `probability_3`, `castTarget_3`, `targetParam1_3`, `targetParam2_3`, `castFlags_3`, `delayInitialMin_3`, `delayInitialMax_3`, `delayRepeatMin_3`, `delayRepeatMax_3`, `scriptId_3`, `spellId_4`, `probability_4`, `castTarget_4`, `targetParam1_4`, `targetParam2_4`, `castFlags_4`, `delayInitialMin_4`, `delayInitialMax_4`, `delayRepeatMin_4`, `delayRepeatMax_4`, `scriptId_4`, `spellId_5`, `probability_5`, `castTarget_5`, `targetParam1_5`, `targetParam2_5`, `castFlags_5`, `delayInitialMin_5`, `delayInitialMax_5`, `delayRepeatMin_5`, `delayRepeatMax_5`, `scriptId_5`, `spellId_6`, `probability_6`, `castTarget_6`, `targetParam1_6`, `targetParam2_6`, `castFlags_6`, `delayInitialMin_6`, `delayInitialMax_6`, `delayRepeatMin_6`, `delayRepeatMax_6`, `scriptId_6`, `spellId_7`, `probability_7`, `castTarget_7`, `targetParam1_7`, `targetParam2_7`, `castFlags_7`, `delayInitialMin_7`, `delayInitialMax_7`, `delayRepeatMin_7`, `delayRepeatMax_7`, `scriptId_7`, `spellId_8`, `probability_8`, `castTarget_8`, `targetParam1_8`, `targetParam2_8`, `castFlags_8`, `delayInitialMin_8`, `delayInitialMax_8`, `delayRepeatMin_8`, `delayRepeatMax_8`, `scriptId_8`) VALUES (94580, 'Barrens - Horde Axe Thrower', 10277, 100, 1, 0, 0, 8, 0, 1, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `ai_name`='EventAI', `spell_list_id`=94580, `script_name`='' WHERE `entry`=9458;

-- Horde Defender and Horde Axe Thrower should use random movement.
UPDATE `creature_template` SET `movement_type`=1 WHERE `entry` IN (9457, 9458);

-- Increase detection and call for help radius for Horde Defender and Horde Axe Thrower.
UPDATE `creature_template` SET `call_for_help_range`=10, `detection_range`=25 WHERE `entry` IN (9457, 9458);

-- Script when Horde Defenders are summoned.
DELETE FROM `generic_scripts` WHERE `id`=402100;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402100, 0, 63, 4021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 402105, 0, 0, 0, 0, 0, 'Counterattack: Horde Defender - Add to Scripted Map Event');

-- Script when Kolkar Invaders are summoned.
DELETE FROM `generic_scripts` WHERE `id`=402107;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402107, 0, 63, 4021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 402105, 0, 0, 0, 0, 0, 'Counterattack: Kolkar Invader - Add to Scripted Map Event');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402107, 0, 22, 655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Kolkar Invader - Set Faction');

-- Script to despawn remaining Krom'zar's Banner.
DELETE FROM `generic_scripts` WHERE `id`=402109;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402109, 0, 41, 0, 0, 0, 0, 164690, 200, 11, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Krom\'zar\'s Banner - Despawn');

-- Script when 10 enemies are killed.
DELETE FROM `generic_scripts` WHERE `id`=402101;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402101, 0, 0, 0, 0, 0, 0, 13100, 0, 9, 6, 8439, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack 10 Kills: Lanti\'gah - Yell ');

-- Script when 20 enemies are killed.
DELETE FROM `generic_scripts` WHERE `id`=402102;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402102, 0, 10, 9456, 600000, 0, 0, 0, 0, 0, 0, 1, 402108, -1, 1, -297.624, -1839.22, 93.8783, 4.81711, 0, 'Counterattack 20 Kills: Summon Warlord Krom\'zar');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402102, 1, 10, 9524, 600000, 0, 0, 0, 0, 0, 0, 0, 402103, -1, 1, -293.931, -1837.24, 93.4963, 4.43314, 0, 'Counterattack 20 Kills: Summon Kolkar Invader');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402102, 1, 10, 9523, 600000, 0, 0, 0, 0, 0, 0, 0, 402104, -1, 1, -297.878, -1834.64, 94.2335, 4.79965, 0, 'Counterattack 20 Kills: Summon Kolkar Stormseer');
DELETE FROM `generic_scripts` WHERE `id`=402103;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402103, 0, 78, 7, 0, 0, 0, 9456, 30, 8, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 'Counterattack: Kolkar Invader - Join Warlord Krom\'zar\'s Group');
DELETE FROM `generic_scripts` WHERE `id`=402104;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402104, 0, 78, 7, 0, 0, 0, 9456, 30, 8, 0, 0, 0, 0, 0, 4, 0, 0, 2, 0, 'Counterattack: Kolkar Stormseer - Join Warlord Krom\'zar\'s Group');
DELETE FROM `generic_scripts` WHERE `id`=402108;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402108, 0, 22, 655, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Warlord Krom\'zar - Set Faction');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402108, 0, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -288.716, -1857.02, 92.463, 5, 0, 'Counterattack: Warlord Krom\'zar - Set Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402108, 1, 20, 1, 0, 0, 1, 0, 0, 0, 4, 0, 0, 0, 0, 15, 0, 0, 0, 117, 'Counterattack: Warlord Krom\'zar - Move Random');

-- Event Over Script
DELETE FROM `generic_scripts` WHERE `id`=402105;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402105, 0, 18, 3000, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Creature - Despawn');
DELETE FROM `generic_scripts` WHERE `id`=402106;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 0, 0, 0, 0, 0, 0, 13979, 0, 9, 2, 8897, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Ragthar Deathgate - Say Text');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 1, 16, 6199, 2, 0, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Lanti\'gah - Play Sound');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 1, 1, 30, 0, 0, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Lanti\'gah - Set Emote State to None');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 1, 4, 147, 1, 1, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Lanti\'gah - Add Gossip Flag');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 2, 20, 6, 0, 0, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack Over: Lanti\'gah - Return to Home Position');
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (402106, 5, 20, 1, 0, 0, 1, 13100, 0, 9, 2, 0, 0, 0, 0, 5, 0, 0, 0, 0, 'Counterattack Over: Lanti\'gah - Move Random');

-- Start script for quest Counterattack.
DELETE FROM `generic_scripts` WHERE `id`=402110;
INSERT INTO `generic_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES 
(402110, 0, 61, 4021, 1200, 0, 0, 0, 0, 0, 8, 0, 0, 0, 402106, 0, 0, 0, 0, 0, 'Counterattack: Start Main Map Event'),
(402110, 1, 61, 4022, 1200, 0, 0, 0, 0, 0, 8, 484, 402101, 483, 0, 0, 0, 0, 0, 0, 'Counterattack: Start 10 Kills Map Event'),
(402110, 1, 61, 4023, 1200, 0, 0, 0, 0, 0, 8, 485, 402102, 483, 0, 0, 0, 0, 0, 0, 'Counterattack: Start 20 Kills Map Event'),
(402110, 2, 39, 402109, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 489, 'Counterattack: Krom\'zar\'s Banner - Despawn'),
(402110, 2, 20, 0, 0, 0, 1, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Lanti\'gah - Move Idle'),
(402110, 2, 16, 6198, 2, 0, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Lanti\'gah - Play Sound'),
(402110, 2, 4, 147, 1, 2, 0, 13100, 0, 9, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Lanti\'gah - Remove Gossip Flag'),
(402110, 3, 3, 0, 0, 4, 2, 13100, 0, 9, 2, 1, 0, 0, 0, -318.461, -1897.02, 91.8194, 3.38594, 0, 'Counterattack: Lanti\'gah - Move'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -305.773, -1917.49, 91.75, 1.74533, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9458, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -246.604, -1951.93, 94.6404, 4.76475, 0, 'Counterattack: Summon Horde Axe Thrower'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -245.64, -1949.9, 94.4436, 0, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -297.332, -1913.34, 91.75, 2.53073, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9458, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -275.43, -1904.02, 91.75, 5.3058, 0, 'Counterattack: Summon Horde Axe Thrower'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -273.741, -1902.65, 91.75, 0, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9458, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -287.059, -1908.5, 91.75, 1.06465, 0, 'Counterattack: Summon Horde Axe Thrower'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -285.394, -1906.73, 91.75, 0, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -246.674, -1927.77, 92.447, 5.14872, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -245.753, -1945.85, 93.3535, 5.32325, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -245.677, -1935.89, 92.728, 5.41052, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9457, 60000, 0, 0, 0, 0, 0, 0, 0, 402100, -1, 8, -245.365, -1925.84, 92.4529, 0, 0, 'Counterattack: Summon Horde Defender'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -197.135, -1895.67, 92.697, 2.53073, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -270.959, -1829.62, 92.6426, 3.68265, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -208.532, -1915.16, 93.0361, 3.12414, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -203.927, -1934.67, 94.2856, 0.767945, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -274.736, -1850.43, 93.2679, 0.872665, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -203.835, -1956.34, 94.2504, 3.26377, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -189.203, -1937.01, 94.1333, 2.04204, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -229.671, -1922.15, 92.8292, 1.18682, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -288.108, -1836.18, 92.8948, 2.96706, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -326.682, -1867.33, 93.9783, 2.49582, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -219.713, -1932.09, 93.7473, 2.35619, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -183.963, -1870.13, 92.5011, 4.29351, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -285.988, -1867.18, 92.7527, 4.08407, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -182.836, -1918, 94.1594, 0.890118, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -170.449, -1901.03, 94.3928, 5.35816, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -340.44, -1853.17, 93.8764, 3.19395, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -305.295, -1870.51, 92.7883, 6.19592, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9523, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -306.303, -1840.31, 95.1089, 0.383972, 0, 'Counterattack: Summon Kolkar Stormseer'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -290.724, -1853.01, 92.6655, 5.49779, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -312.151, -1858.05, 94.254, 3.50811, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -288.412, -1886.38, 92.6818, 5.20108, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -329.012, -1847.05, 95.2063, 5.18363, 0, 'Counterattack: Summon Kolkar Invader'),
(402110, 3, 10, 9524, 60000, 0, 0, 0, 0, 0, 0, 0, 402107, -1, 8, -341.506, -1870.58, 93.4688, 4.71239, 0, 'Counterattack: Summon Kolkar Invader');

-- Only show Regthar Deathgate's gossip option if event is not active.
UPDATE `conditions` SET `value3`=483 WHERE `condition_entry`=1097;

-- Script for Regthar Deathgate's gossip option to restart event.
DELETE FROM `gossip_scripts` WHERE `id`=1882;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1882, 0, 39, 402110, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 483, 'Regthar Deathgate - Start Script for quest Counterattack');
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (1882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4926, 0, 0, 0, 0, 0, 0, 0, 0, 'Regthar Deathgate - Say Text');

-- Script on accepting quest Counterattack.
DELETE FROM `quest_start_scripts` WHERE `id`=4021;
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4021, 0, 39, 402110, 0, 0, 0, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 0, 0, 483, 'Counterattack: Start Script');
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `target_param1`, `target_param2`, `target_type`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `condition_id`, `comments`) VALUES (4021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4926, 0, 0, 0, 0, 0, 0, 0, 0, 'Counterattack: Regthar Deathgate - Say Text');
UPDATE `quest_template` SET `StartScript`=4021 WHERE `entry`=4021;


-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
