
-- remove the crypt guards from creature table. They are spawned by anub instead.
DELETE FROM `creature` WHERE `guid`='88347';
DELETE FROM `creature` WHERE `guid`='88348';

-- Remove all the corpse scarabs that were next to the crypt guards
DELETE FROM `creature` where id = 16698;

-- Increasing anubs attackspeed from 2.4 to 2.2
UPDATE `creature_template` SET `baseattacktime`=2000 WHERE `entry`=15956;