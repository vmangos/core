-- sewage slimes around patchwerk. Probably old replacement for froggers, Incorrect mob, and also needs to be handled from script.
delete from creature where id = 16375;
-- Living Poison (froggers) speed fix
UPDATE `creature_template` SET `speed_walk`='0.375', `speed_run`='0.375' WHERE `entry`=16027;

-- Embalming slime moves at 50% movementspeed
UPDATE `creature_template` SET `speed_walk`='0.5', `speed_run`='0.5' WHERE `entry`=16024;

-- Lightning Totem (summoned by Living Monstrosity) no movement
-- UPDATE `creature_template` SET `speed_walk`=0, `speed_run`=0, `unit_flags`=4, `MovementType`=0 WHERE `entry`=16385;
UPDATE `creature_template` SET `faction_A`=20, `faction_H`=20, `speed_walk`='0.00001', `speed_run`='0.00001', `mindmg`=0, `maxdmg`=0, `unit_flags`=0, `type`=10 WHERE `entry`=16385;

-- Patchwork Golem correct War stomp spell
UPDATE `creature_ai_scripts` SET `action1_param1`=28125 WHERE `id`=1601701;
-- Patchwork Golem slightly reduced frequency on 360 cleave
UPDATE `creature_ai_scripts` SET `event_param3`=7000, `event_param4`=8000 WHERE `id`=1601702;

-- Patchwork Golem casts disease cloud on himself
DELETE FROM `creature_ai_scripts` where id = 1601703;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1601703, 16017, 27, 0, 100, 1, 27793, 1, 1000, 1000, 11, 27793, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Patchwork Golem disease cloud');


-- Sludge Belcher periodically summons Bile Sludge 
DELETE FROM `creature_ai_scripts` where id = 1602902;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1602902, 16029, 0, 0, 100, 1, 2000, 2000, 5000, 5000, 11, 27889, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Sludge Belcher summon Bile Sludge');