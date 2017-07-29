

-- Death Knight fear targets hostile, not self. Also not on pull, but a while later. -- https://youtu.be/VrykhhdPfc4?t=4m37s
UPDATE `creature_ai_scripts` SET `event_param1`=10000, `event_param2`=12000, `action1_param2`=1 WHERE `id`=1614601;


-- death knight captain spam casts whirlwind (different spell than was originally) 15ec after pull, instead (could be hp based too) https://youtu.be/VrykhhdPfc4?t=4m51s
UPDATE `creature_ai_scripts` SET `event_type`=0, `event_param1`=15000, `event_param2`=15000, `event_param3`=15000, `event_param4`=20000, `action1_param1`=28333, `action1_param2`=1 WHERE `id`=1614501;


-- Death knight captain increased dmg, but reduced attackspeed and ai
UPDATE `creature_template` SET `mindmg`=3500, `maxdmg`=4250, `baseattacktime`=2500, `AIName`='EventAI', `ScriptName`='' WHERE `entry`=16145;

-- missing npc death lord (16861): https://youtu.be/VrykhhdPfc4?t=6m9s
-- exists in db, but must be scaled up and faction changed.


-- deathknights offhand is a shield, not a mount like it was
UPDATE `creature_template` SET `equipment_id` = 16146 where `entry` = 16146;
DELETE FROM `creature_equip_template` where entry = 16146;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16146, 2179, 6176, 0);

	
-- scale of death lord and deathknight cavalier update (cavalier was too big, death lord too small)
UPDATE `creature_template` SET `scale` = 1.8 where `entry` IN (16861, 16861);

-- death lords had 0 dmg
UPDATE `creature_template` SET `mindmg`=2500, `maxdmg`=3500 WHERE `entry`=16861;

-- Death lord and death knight cavalier deathcoil hits current tank
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1686103;
UPDATE `creature_ai_scripts` SET `action1_param2`=1 WHERE `id`=1616303;
-- death lord
-- https://youtu.be/VrykhhdPfc4?t=6m9s
-- It also kindof looks like the pack in the video does not patroll, unlike it does in our db.
/*
DELETE FROM `creature` where `guid` = 533000 ;
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`,`spawnFlags`) 
VALUES (533000,16861,533,0,0,2932.73,-3188.07,273.371,3.13692,25,5,0,113175,12430,0,0,0);
*/

-- death lord and death knight cavalier curse of agony event slightly randomized to more easily stack with group when not spread
-- death lord has higher frequency of aura of agony
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=3000, `event_param4`=3000 WHERE `id`=1686101;
UPDATE `creature_ai_scripts` SET `event_param2`=2500, `event_param3`=6000, `event_param4`=6000  WHERE `id`=1616301;


-- Touched Warriors periodically wipe aggro 
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16156;
UPDATE `creature_template` SET `minhealth`=24990, `maxhealth`=24999, `AIName`='EventAI', scale=1.6 WHERE `entry`=16157;
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=16158;
DELETE FROM `creature_ai_scripts` where id in (1615601, 1615701, 1615801);
INSERT INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1615601, 16156, 0, 0, 100, 1, 5000, 5000, 5000, 5000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Touched Warrior periodically wipe aggro'),
(1615701, 16157, 0, 0, 100, 1, 2000, 3000, 3000, 4000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Doom Touched Warrior periodically aggro wipe'),
(1615801, 16158, 0, 0, 100, 1, 2000, 3000, 3000, 4000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Death Touched Warrior periodically aggro wipe');





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


-- unholy weapons
DELETE FROM creature_equip_template where entry in (16194, 16215, 16216);
INSERT into creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES
(16194, 11342, 0, 0),
(16215, 12959, 0, 0),
(16216, 13222, 13222, 0);

-- unholy weapns equipment id
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16194, MovementType=1, `AIName`='EventAI',`baseattacktime`=2000, `mindmg`=3230, `maxdmg`=4284 WHERE entry=16194;
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16215, MovementType=1, `AIName`='EventAI',`baseattacktime`=2000, `mindmg`=2500, `maxdmg`=3200 WHERE entry=16215;
UPDATE `creature_template` SET `unit_flags`=32768, `equipment_id`=16216, MovementType=1, `AIName`='EventAI',`baseattacktime`=1600, `mindmg`=2900, `maxdmg`=3700 WHERE entry=16216;

/*
DELETE FROM `creature` where id in (16194, 16215, 16216);
INSERT INTO `creature` (`guid`,`id`,`map`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`, `spawnFlags`) VALUES 
(127794,16194,533,0,0,2707.62,-3244.26,267.682,1.37881, 3600,20,0,113184,0,0,0,0),
(127795,16194,533,0,0,2681.25,-3215.83,267.611,5.46288, 3600,20,0,113184,0,0,0,0),
(127796,16194,533,0,0,2712.35,-3127.26,267.554,2.65744, 3600,20,0,113184,0,0,1,0),
(127797,16194,533,0,0,2718.03,-3135.9, 267.522,4.42918, 3600,20,0,113184,0,0,1,0),
(127798,16194,533,0,0,2712.7, -3180.11,267.605,1.69297, 3600,20,0,113184,0,0,0,0),
(127799,16194,533,0,0,2724.37,-3219.95,267.605,0.261799,3600,20,0,113184,0,0,0,0),
(127815,16215,533,0,0,2703.69,-3240.64,267.669,1.78024, 3600,20,0,88032, 0,0,0,0),
(127816,16215,533,0,0,2731.01,-3154.15,267.589,2.08039, 3600,20,0,88032, 0,0,1,0),
(127817,16215,533,0,0,2742.73,-3164.88,267.652,5.22196, 3600,20,0,88032, 0,0,1,0),
(127818,16215,533,0,0,2691.04,-3216.55,267.605,0.942478,3600,20,0,88032, 0,0,0,0),
(127819,16215,533,0,0,2667.47,-3173,   267.604,4.13059, 3600,20,0,88032, 0,0,1,0),
(127820,16215,533,0,0,2671.65,-3175.75,267.577,4.13054, 3600,20,0,88032, 0,0,1,0),
(127821,16215,533,0,0,2734.57,-3221.58,267.623,2.00713, 3600,20,0,88032, 0,0,0,0),
(127822,16216,533,0,0,2739.77,-3219.47,267.539,4.46863, 3600,20,0,94320, 0,0,1,0),
(127823,16216,533,0,0,2731.77,-3230.92,267.679,4.46872, 3600,20,0,94320, 0,0,1,0),
(127824,16216,533,0,0,2708.13,-3174.65,267.605,0.418879,3600,20,0,94320, 0,0,0,0);
*/

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1621501, 16215, 0, 0, 100, 1, 4000, 4000, 15000, 15000, 11, 28450, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unholy staff Arcane Explosion'),
(1621502, 16215, 0, 0, 100, 1, 8000, 8000, 15000, 15000, 11, 29848, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Unholy staff polymorph'),
(1621503, 16215, 0, 0, 100, 1, 12000, 12000, 15000, 15000, 11, 29849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy staff frost nova'),
(1619401, 16194, 0, 0, 100, 1, 4000, 4000, 15000, 15000, 11, 29852, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy axe whirlwind'),
(1619402, 16194, 0, 0, 100, 1, 6000, 6000, 7000, 8000, 11, 16856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy axe Mortal Strike'),
(1621601, 16216, 0, 0, 100, 1, 4000, 4000, 8000, 8000, 11, 3391, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy swords trash'),
(1621602, 16216, 0, 0, 100, 1, 2000, 2000, 8000, 8000, 11, 15284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'unholy swords cleave');

/*
REPLACE INTO `creature_groups` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`flags`) VALUES 
(127816, 127816, 0, 0   ,3),
(127816, 127817, 3, 270 ,3),
(127819, 127819, 0, 0   ,3),
(127819, 127820, 3, 270 ,3),
(127796, 127796, 0, 0   ,3),
(127796, 127797, 3, 270 ,3),
(127822, 127822, 0, 0   ,3),
(127822, 127823, 4, 90  ,3);
*/

-- giving shade of naxxramas same script as spirit of naxxramas
UPDATE `creature_template` SET `AIName`='', `ScriptName`='spirit_of_naxxramas_ai' WHERE `entry`=16164;


UPDATE `creature_template` SET `equipment_id` = 16861 where `entry` = 16861;
DELETE FROM `creature_equip_template` where entry = 16861;
INSERT INTO `creature_equip_template` (entry, equipentry1, equipentry2, equipentry3) VALUES (16861, 22738, 0, 0);



-- RP stuff for deathknight packs
DELETE FROM creature_movement_scripts where id in(1614601, 1614602, 1614603, 1614604);
insert into creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
                                  (1614601,	1,	   1,	     36,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain attacks"),
                                  (1614601,	2,	   1,	     43,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight parries"),
                                  (1614601,	5,	   1,	     1,	        16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain talks"),
                                  (1614601,	7,	   1,	     36,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain attacks"),
                                  (1614601,	8,	   1,	     43,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight parries"),
                                  (1614601,	14,	   1,	     60,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain kicks"),
                                  (1614601,	15,	   1,	     43,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight parries"),
                                                                                                                                          
                                  (1614601,	17,	   1,	     36,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain attacks"),
                                  (1614601,	18,	   1,	     43,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight parries"),
                                  (1614601,	20,	   1,	     5,	        16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain shouts"),
                                  (1614601,	22,	   1,	     36,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain attacks"),
                                  (1614601,	23,	   1,	     43,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight parries"),
                                  (1614601,	26,	   1,	     60,	    16145,	    10,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight captain kicks"),
                                  (1614601,	27,	   1,	     36,	    0,	         0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks"),
                                                                                                                                          
                                  (1614602,	0,	   1,	     333,	    16146,	    88435,     0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attack stance"),
                                  (1614602,	0,	   1,	     333,	    0,	         0,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attack stance"),
                                  (1614602,	1,	   1,	     22,	    16145,	    12,	       0,	      0,	      53,	25,	          25,	25,	0,	0,	0,	0,	"Deathknight Captain shout"),
                                  (1614602,	3,	   1,	     36,	    16146,	    88435,     0,	      16,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614602,	5,	   1,	     36,	        0,	     0,	       0,	      0,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614602,	12,	   1,	     36,	    16146,	    88435,	   0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614602,	13,	   1,	     36,	        0,	     0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614602,	20,	   1,	     36,	        0,	     0,	       0,	      0,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614602,	21,	   1,	     36,	    16146,	    88435,     0,	      16,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  
                                  (1614603,	0,	   1,	     333,	    16146,	    88437,     0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attack stance"),
                                  (1614603,	0,	   1,	     333,	    0,	         0,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attack stance"),
                                  (1614603,	3,	   1,	     36,	    16146,	    88437,     0,	      16,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614603,	5,	   1,	     36,	        0,	     0,	       0,	      0,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614603,	10,	   1,	     22,	    16145,	    12,	       0,	      0,	      53,	25,	          25,	25,	0,	0,	0,	0,	"Deathknight Captain shout"),
                                  (1614603,	12,	   1,	     36,	    16146,	    88437,	   0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614603,	13,	   1,	     36,	        0,	     0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614603,	20,	   1,	     36,	        0,	     0,	       0,	      0,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614603,	21,	   1,	     36,	    16146,	    88437,     0,	      16,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  
                                  (1614604,	0,	   1,	     333,	    16146,	    88438,     0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attack stance"),
                                  (1614604,	0,	   1,	     333,	    0,	         0,	       0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attack stance"),
                                  (1614604,	2,	   1,	     36,	    16146,	    88438,     0,	      16,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614604,	4,	   1,	     36,	        0,	     0,	       0,	      0,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614604,	11,	   1,	     36,	    16146,	    88438,	   0,	      16,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy"),
                                  (1614604,	12,	   1,	     36,	        0,	     0,        0,	      0,	      0,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614604,	16,	   1,	     22,	    16145,	    12,	       0,	      0,	      53,	25,	          25,	25,	0,	0,	0,	0,	"Deathknight Captain shout"),
                                  (1614604,	18,	   1,	     36,	        0,	     0,	       0,	      0,	      54,	0,	          0,	0,	0,	0,	0,	0,	"Deathknight attacks combat dummy"),
                                  (1614604,	20,	   1,	     36,	    16146,	    88438,     0,	      16,	      35,	36,	          38,	54,	0,	0,	0,	0,	"Deathknight buddy attacks combat dummy");

-- dummy waypoints for dk packs, needed by above movement_scripts
DELETE FROM `creature_movement` where id in (88430, 88444, 88439, 88434, 88436);
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`script_id`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`orientation`,`model1`,`model2`) VALUES 
(88430,1, 2872.69, -3202.18, 298.146, 0,    0,      0,0,0,0,0,0,0,5.8079,0,0),
(88430,2, 2872.69, -3202.18, 298.146, 15000,1614601,0,0,0,0,0,0,0,5.8079,0,0),

(88444,1, 2799.66, -3166, 298.147, 0,    0,      0,0,0,0,0,0,0,3.11147,0,0),
(88444,2, 2799.66, -3166, 298.147, 15000,1614601,0,0,0,0,0,0,0,3.11147,0,0),


(88434,1, 2829.04, -3208.18, 298.252, 0,    0,      0,0,0,0,0,0,0,4.10672,0,0),
(88434,2, 2829.04, -3208.18, 298.252, 15000,1614602,0,0,0,0,0,0,0,4.10672,0,0),

(88436,1, 2857.09, -3180.16, 298.153, 0,    0,      0,0,0,0,0,0,0,0.024496,0,0),
(88436,2, 2857.09, -3180.16, 298.147, 15000,1614603,0,0,0,0,0,0,0,0.024496,0,0),


(88439,1, 2825.19, -3157.38, 298.146, 0,    0,      0,0,0,0,0,0,0,1.3861,0,0),
(88439,2, 2825.19, -3157.38, 298.146, 15000,1614604,0,0,0,0,0,0,0,1.3861,0,0);

-- remove script-id for razuvious, the Rp is done in c++ script.
update creature_movement_template set script_id = 0 where entry = 16061;



-- Below are updates for Necro Knights.
-- Setting randomly fire, arcane or frost phase on pull.
-- adjusted timers for each ability to reflect that it now only uses 2/6 abilities at a time.

REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1616507, 16165, 4, 0, 100, 0, 0, 0, 0, 0, 30, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 'Necro Knight set phase on pull');

UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1616506;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1616505;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-9 WHERE `id`=1616504;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1616501;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-3 WHERE `id`=1616502;
UPDATE `creature_ai_scripts` SET `event_inverse_phase_mask`=-5 WHERE `id`=1616503;

UPDATE `creature_ai_scripts` SET `event_param1`=5500, `event_param2`=5500, `event_param3`=7000, `event_param4`=7000, `action1_param1`=29207 WHERE `id`=1616505;
UPDATE `creature_ai_scripts` SET `event_param1`=6000, `event_param2`=6000, `event_param3`=7000, `event_param4`=7000 WHERE `id`=1616504;
UPDATE `creature_ai_scripts` SET `event_param1`=4000, `event_param2`=4000, `event_param3`=8000, `event_param4`=10000 WHERE `id`=1616501;
UPDATE `creature_ai_scripts` SET `event_param1`=7000, `event_param2`=7000, `event_param3`=8000, `event_param4`=10000 WHERE `id`=1616502;
UPDATE `creature_ai_scripts` SET `event_param1`=3000, `event_param2`=3000, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1616503;
UPDATE `creature_ai_scripts` SET `event_param1`=3500, `event_param2`=3500, `event_param3`=10000, `event_param4`=10000 WHERE `id`=1616506;


REPLACE INTO `creature_ai_scripts`
(`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`)
VALUES
(1639001, 16390, 0, 0, 0, 0, 0, 0, 4000, 6000, 14, -100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Deathchill servant periodic threat reset');

-- risen squire is called risen deathknight
UPDATE `creature_template` SET `name`='Risen Deathknight' WHERE `entry`=16154;

-- dark touched warriors are equipped with a bucket
delete from creature_equip_template_raw where entry = 1447;
UPDATE `creature_template` SET `equipment_id`=16156 WHERE `entry`=16156;
DELETE FROM creature_equip_template where entry = 16156;
INSERT into creature_equip_template (entry, equipentry1, equipentry2, equipentry3) VALUES
(16156, 12801, 0, 0);

-- dark touched warriors got a script to do custom running towards horses
UPDATE `creature_template` SET `AIName`='', `equipment_id`=16156, `ScriptName`='dark_touched_warriorAI' WHERE `entry`=16156;