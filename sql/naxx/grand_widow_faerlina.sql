-- Set her base attackspeed to 2.5sec, based on https://www.youtube.com/watch?v=pVjB7pCX3XM
UPDATE `creature_template` SET `baseattacktime`=2500, `flags_extra`=257 WHERE `entry`=15953;

-- remove worshippers and followers. They are spawned by faerlina
DELETE FROM `creature` WHERE `id`='16505';
DELETE FROM `creature` WHERE `id`='16506';

-- give Worshippers widows embrace
UPDATE `creature_template` SET `spell1`=28732, `MechanicImmuneMask`=1023383290 WHERE `entry`=16506;

-- follower has aoe silence spell and eventAI
UPDATE `creature_template` SET `spell1`=29943, `AIName`='EventAI', `MechanicImmuneMask`=1023383290 WHERE `entry`=16505;

-- follower eventAI entry for periodically casting aoe silence
DELETE FROM `creature_ai_scripts` where id = 1650501;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1650501, 16505, 0, 0, 100, 1, 8000, 12000, 100000, 15000, 11, 29943, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas follower aoe silence');

-- follower eventAI for periodically charging random target
DELETE FROM `creature_ai_scripts` where id = 1650502;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1650502, 16505, 0, 0, 100, 1, 8000, 10000, 10000, 15000, 11, 25821, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'naxxramas follower charge random');