
-- Spawn of Fankriss enrage happens, seemingly, at a random point between 10 and 20 seconds after spawn.
-- Some sources say 10 sec, some 15 and some 20. From videos I can see it happening at any point aproximately
-- between 10 and 20 seconds. I therefore conclude it is either rand(10,20) sec, OR it should be based on something
-- else which is not yet understood.
UPDATE creature_ai_scripts SET event_param1=10000, event_param2=20000 WHERE id=1563001;



UPDATE `mangos`.`creature_template` SET `AIName`='', `ScriptName`='creature_spawn_fankriss' WHERE `entry`='15630';

UPDATE `mangos`.`creature_template` SET `ScriptName`='creature_vekniss_hatchling' WHERE `entry`='15962';
