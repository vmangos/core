INSERT INTO migrations VALUES ('20170901140429');

-- Horde Field Duty event
UPDATE creature_template SET speed_walk=2, speed_run=2, flags_extra=4096 WHERE entry=15620;
UPDATE creature SET spawntimesecs=25 WHERE id=15612;
UPDATE creature_template SET minhealth=355556, maxhealth=355556, minmana=8181, maxmana=8181, armor=3791, mingold=599, maxgold=4836 WHERE entry=15449;
UPDATE creature_template SET mindmg=1000, maxdmg=1200 WHERE entry IN (15620,15449);
