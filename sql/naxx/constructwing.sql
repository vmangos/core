-- sewage slimes around patchwerk. Probably old replacement for froggers, Incorrect mob, and also needs to be handled from script.
delete from creature where id = 16375;
-- Living Poison (froggers) speed fix
UPDATE `creature_template` SET `speed_walk`='0.375', `speed_run`='0.375' WHERE `entry`=16027;