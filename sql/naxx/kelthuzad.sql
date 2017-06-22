-- KT updates
UPDATE `creature_template` SET `minhealth`=3150000, `maxhealth`=3150000 WHERE `entry`=15990;


-- unstoppable abomination. Stun/shackle immune?
UPDATE `creature_template` SET `mindmg`=8000, `maxdmg`=10000, `speed_walk`='0.7', `speed_run`='0.8', `ScriptName`='unstoppable_abomination_ai', `unit_flags`=0 /*256passive*/ WHERE `entry`=16428;

-- soldier of the frozen wastes. Should not be shackle immune
UPDATE `creature_template` SET `minhealth`=2012, `maxhealth`=2012, `speed_walk`='0.3', `speed_run`='0.4',`ScriptName`='soldier_frozen_wastes_ai', `unit_flags`=0/*256passive*/ WHERE `entry`=16427;

-- soul weaver. 
UPDATE `creature_template` SET `ScriptName`='soul_weaver_ai', `speed_walk`='0.1', `speed_run`='0.114286', `unit_flags`=0 /*256passive*/  WHERE `entry`=16429;

-- guardian of icecrown. Should not be shackle immune
UPDATE `creature_template` SET `minhealth`='3150000', `maxhealth`='3150000', `speed_run`='1.42858', rank=1, `ScriptName`='mob_guardian_icecrownAI' WHERE `entry`=16441;
UPDATE `creature_model_info` SET bounding_radius = 1.2, combat_reach = 3 where modelid = 16586;

