
-- Corrected start position of gluth
UPDATE `creature` SET `position_x`='3283.09', `position_y`='-3156.96', `position_z`='297.788', `orientation`='3.82227' WHERE `guid`='88304';

-- Zombie chow health from 52k to 122k (wowwiki states they still have 6104 hp at 5% after decimate)
UPDATE `creature_template` SET `minhealth`='122080', `maxhealth`='122080' WHERE `entry`='16360';
