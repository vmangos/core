-- Set her base attackspeed to 2.5sec, based on https://www.youtube.com/watch?v=pVjB7pCX3XM
UPDATE `creature_template` SET `baseattacktime`=2500 WHERE `entry`=15953;

-- remove worshippers and followers. They are spawned by faerlina
DELETE FROM `creature` WHERE `id`='16505';
DELETE FROM `creature` WHERE `id`='16506';

-- give Worshippers widows embrace
UPDATE `creature_template` SET `spell1`=28732 WHERE `entry`=16506;
