-- Spores correct faction, hp, movement speed
UPDATE creature_template SET minhealth=563, maxhealth=563, speed_walk = 0.5, speed_run=0.5, AIName="EventAI" where entry = 16286;

-- spore cast Fungal Blooms on death
DELETE FROM `creature_ai_scripts` where id = 1628601;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1628601, 16286, 6, 0, 100, 0, 0, 0, 0, 0, 11, 29232, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'Spore cast Fungal Blooms on death');

-- remove all the initial spores from creature db. None should be there
-- DELETE FROM creature where id = 16286;

-- Loatheb slightly larger hitbox
UPDATE `creature_model_info` SET `combat_reach`='5' WHERE `modelid` = 16110;