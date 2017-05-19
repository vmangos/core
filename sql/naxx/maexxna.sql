
-- source: http://www.kurai.com/wow/naxx/maexxna.jpg
UPDATE `creature_template` SET `minhealth`=1498950, `maxhealth`=1498950, `armor`=3731, `mindmg`=5491, `maxdmg`=7281 WHERE `entry`=15952;

-- Should be no web-wraps spawned at encounter-start.
DELETE FROM creature where id = 16486;