
-- source: http://www.kurai.com/wow/naxx/maexxna.jpg
UPDATE `creature_template` SET `minhealth`=1498950, `maxhealth`=1498950, `armor`=3731, `mindmg`=5491, `maxdmg`=7281 WHERE `entry`=15952;

-- Should be no web-wraps or spiderlings spawned at encounter-start.
DELETE FROM `creature` where id = 16486;
DELETE FROM `creature` where id = 17055;

-- give spiderlings correct faction
UPDATE `creature_template` SET faction_A = 16, faction_H = 16 WHERE entry = 17055;

-- give web-wrap correct faction
UPDATE `creature_template` SET faction_A = 16, faction_H = 16 WHERE entry = 16486;