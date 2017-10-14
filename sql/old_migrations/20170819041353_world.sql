INSERT INTO `migrations` VALUES ('20170819041353');

-- Spirit of Kirith respawn
-- https://github.com/elysium-project/server/issues/1837
REPLACE INTO spell_mod (Id, DurationIndex, Comment) VALUES (10853, 5, 'Spirit of Kirith spawn timer');

-- Tarantulas health
-- https://github.com/elysium-project/server/issues/1117
UPDATE creature_template SET minhealth=328, maxhealth=356 WHERE entry=442;

-- Judgement of Righteousness scaling
-- https://github.com/elysium-project/server/issues/1136
REPLACE INTO spell_bonus_data (entry, direct_bonus, comments) VALUES (20187, 0.5, 'Paladin - Judgement of Righteousness');
REPLACE INTO spell_chain  (spell_id, prev_spell, first_spell, rank) VALUES 
(20187, 0, 20187, 1),
(20280, 20187, 20187, 2),
(20281, 20280, 20187, 3),
(20282, 20281, 20187, 4),
(20283, 20282, 20187, 5),
(20284, 20283, 20187, 6),
(20285, 20284, 20187, 7),
(20286, 20285, 20187, 8);

-- Jom Gabbar cooldown
-- https://github.com/elysium-project/server/issues/1185
UPDATE item_template SET spellcategorycooldown_1=20000 WHERE entry=23570;

-- Cauldron and Theramore Deserter
-- https://github.com/elysium-project/server/issues/1135
UPDATE creature SET position_x=-4013.37, position_y=-5005.16, position_z=14.0592, orientation=3.72028 WHERE guid=30742;
delete from gameobject where guid = 7569 and id = 186451;

-- Crystal Charge mechanic
-- https://github.com/elysium-project/server/issues/1137
REPLACE INTO spell_mod (Id, Mechanic, Comment) VALUES (15239, 0, 'Crystal Charge no mechanic');

-- Devilsaur stats
-- https://github.com/elysium-project/server/issues/845
UPDATE creature_template SET mindmg=663, maxdmg=879, baseattacktime=1500, MechanicImmuneMask=545267280 WHERE entry=6584;
UPDATE creature_template SET mindmg=516, maxdmg=698, baseattacktime=1500, resistance2=0, resistance3=0, resistance4=0, resistance5=0, resistance6=0 WHERE entry=6500;
UPDATE creature_template SET mindmg=451, maxdmg=623, baseattacktime=1500, resistance2=0, resistance3=0, resistance4=0, resistance5=0, resistance6=0 WHERE entry=6499;
UPDATE creature_template SET mindmg=376, maxdmg=509, baseattacktime=1500, resistance2=53, resistance3=0, resistance4=0, resistance5=0, resistance6=0 WHERE entry=6498;

-- Screech threat
-- https://github.com/elysium-project/server/issues/1607
REPLACE INTO spell_threat (entry, Threat) VALUES (24423, 25),(24577, 67),(24578, 152),(24579, 188);

-- Engineer Whirleygig damage
-- https://github.com/elysium-project/server/issues/1745
UPDATE creature_template SET mindmg=28, maxdmg=37 WHERE entry=5836;

-- Tabetha Sign
-- https://github.com/elysium-project/server/issues/2086
UPDATE gameobject SET position_x=-3649.91, position_y=-2729.7, position_z=33.789, orientation=-4.7 WHERE guid=7347;

-- Force Reactive Disk passive aura
-- https://github.com/elysium-project/server/issues/1911
REPLACE INTO spell_mod (Id, Attributes, Comment) VALUES (22618, 16777424, 'Force Reactive Disk - Passive');
