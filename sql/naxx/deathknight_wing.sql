

-- Death Knight fear targets hostile, not self. Also not on pull, but a while later. -- https://youtu.be/VrykhhdPfc4?t=4m37s
UPDATE `creature_ai_scripts` SET `event_param1`=10000, `event_param2`=12000, `action1_param2`=1 WHERE `id`=1614601;

-- death knight captain spam casts whirlwind (different spell than was originally) 15ec after pull, instead (could be hp based too) https://youtu.be/VrykhhdPfc4?t=4m51s
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=15000, `event_param2`=15000, `event_param3`=8500, `event_param4`=8500, `action1_param1`=28333, `action1_param2`=1 WHERE `id`=1614501;

-- Death knight captain increased dmg, but reduced attackspeed
UPDATE `creature_template` SET `mindmg`=3500, `maxdmg`=4250, `baseattacktime`=2500 WHERE `entry`=16145;

-- missing npc death lord (16861): https://youtu.be/VrykhhdPfc4?t=6m9s
-- exists in db, but must be scaled up and faction changed.


-- deathknight understudy offhand is skullflame shield (monster version)
UPDATE `creature_equip_template_raw` SET `equipmodel2`='23356' WHERE `entry`='982';

-- deathknights offhand is a shield, not a mount like it was!
UPDATE `creature_equip_template_raw` SET `equipmodel2`='176' WHERE `entry`='142';

	
-- scale of death lord and deathknight cavalier update (cavalier was too big, death lord too small)
UPDATE `creature_template` SET `scale` = 1.8 where `entry` IN (16861, 16861);

-- correct faction of death lord
UPDATE `creature_template` SET `faction_A`=21, `faction_H`=21 WHERE `entry`=16861;


-- death lord
-- https://youtu.be/VrykhhdPfc4?t=6m9s
-- It also kindof looks like the pack in the video does not patroll, unlike it does in our db.
DELETE FROM `creature` where `guid` = 533000 ;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES (533000,16861,533,0,0,2932.73,-3188.07,273.371,3.13692,25,5,0,113175,12430,0,0,0);

