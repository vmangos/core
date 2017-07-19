

-- Death Knight fear targets hostile, not self. Also not on pull, but a while later. -- https://youtu.be/VrykhhdPfc4?t=4m37s
UPDATE `creature_ai_scripts` SET `event_param1`=10000, `event_param2`=12000, `action1_param2`=1 WHERE `id`=1614601;

-- death knight captain spam casts whirlwind (different spell than was originally) 15ec after pull, instead (could be hp based too) https://youtu.be/VrykhhdPfc4?t=4m51s
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=15000, `event_param2`=15000, `event_param3`=8500, `event_param4`=8500, `action1_param1`=28333, `action1_param2`=1 WHERE `id`=1614501;

-- Death knight captain increased dmg, but reduced attackspeed
UPDATE `creature_template` SET `mindmg`=3500, `maxdmg`=4250, `baseattacktime`=2500 WHERE `entry`=16145;

-- missing npc death lord (16861): https://youtu.be/VrykhhdPfc4?t=6m9s
-- exists in db, but must be scaled up and faction changed.


-- deathknights offhand is a shield, not a mount like it was
UPDATE `creature_template` SET `equipment_id` = 16146 where `entry` = 16146;
DELETE FROM `creature_equip_template` where entry = 16146;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16146, 2179, 6176, 0);

	
-- scale of death lord and deathknight cavalier update (cavalier was too big, death lord too small)
UPDATE `creature_template` SET `scale` = 1.8 where `entry` IN (16861, 16861);

-- correct faction of death lord
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=16861;

-- Death lord deathcoil hits random excluding top aggro, rather than random including top aggro
UPDATE `creature_ai_scripts` SET `action1_param2`=5 WHERE `id`=1686103;

-- death lord
-- https://youtu.be/VrykhhdPfc4?t=6m9s
-- It also kindof looks like the pack in the video does not patroll, unlike it does in our db.
DELETE FROM `creature` where `guid` = 533000 ;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES (533000,16861,533,0,0,2932.73,-3188.07,273.371,3.13692,25,5,0,113175,12430,0,0,0);

-- death lord and death knight cavalier curse of agony event slightly randomized to more easily stack with group when not spread
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param4`=8500 WHERE `id`=1686101;
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param4`=8500 WHERE `id`=1616301;


-- Dark Touched Warrior periodically wipe aggro
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16156;
DELETE FROM `creature_ai_scripts` where id = 1615601;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1615601, 16156, 0, 0, 0, 1, 5000, 5000, 5000, 5000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Touched Warrior periodically wipe aggro');

-- Death Knight raise dead	
DELETE FROM `creature_ai_scripts` where id = 1614603;
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1614603, 16146, 0, 0, 100, 1, 5000, 5000, 10000, 20000, 11, 28353, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Knight raise dead');

-- Death knight frequency of intimidating shout reduced
UPDATE `creature_ai_scripts` SET `event_param3`=14000, `event_param4`=18000 WHERE `id`=1614601;

-- Creatures that the spell Raise Dead can target
-- todo: no idea which creatures should be "ressable", other than other death knights should not be.
DELETE FROM `spell_script_target` where entry = 28353;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) 
VALUES
(28353, 2, 16165),
(28353, 2, 16167),
(28353, 2, 16154),
(28353, 2, 16193),
(28353, 2, 16156),
(28353, 2, 16157);	



