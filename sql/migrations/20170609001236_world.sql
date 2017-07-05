INSERT INTO `migrations` VALUES ('20170609001236');

-- Increase cooldown to chests that spawn mobs
UPDATE gameobject SET spawntimesecs=180 WHERE id IN (2716,2717,2718,3239);

-- Bride of the Embalmer
UPDATE quest_template SET SpecialFlags = 1 WHERE entry = 254;
UPDATE quest_end_scripts SET data_flags = 4 WHERE id = 254;

-- Delivery to Andron Gant
UPDATE quest_template SET MinLevel = 45 WHERE entry = 3564;

-- Onu is meditating
UPDATE quest_template SET PrevQuestId = -944, SpecialFlags = 1 WHERE entry = 961;

-- A Good Head On Your Shoulders
UPDATE quest_template SET ExclusiveGroup = -2771, NextQuestInChain = 0 WHERE entry = 2771;

-- Spectral type mobs immunity 
update creature_template set MechanicImmuneMask = 8413718 where entry in (2184,3667,12377);

-- Treant Ally adjusted damage
UPDATE creature_template SET mindmg = 32, maxdmg = 41 WHERE entry = 5806;

-- Target dummies HP
UPDATE creature_template SET minlevel=20, maxlevel=20, minhealth=772, maxhealth=772 WHERE entry=2673;
UPDATE creature_template SET minlevel=40, maxlevel=40, minhealth=2672, maxhealth=2672 WHERE entry=2674;
UPDATE creature_template SET minlevel=60, maxlevel=60, minhealth=5228, maxhealth=5228 WHERE entry=12426;

-- A Donation of Runecloth
UPDATE quest_template SET NextQuestId = 7824 WHERE entry = 7835;
UPDATE quest_template SET PrevQuestId = 7835 WHERE entry = 7824;

-- Fool's Stout
UPDATE quest_template SET RequiredRaces=0 WHERE entry IN(621,1127);
UPDATE quest_template SET SpecialFlags=1, PrevQuestId=-1119 WHERE entry=1127;

-- Collecting Kelp and The Escape end scripts
DELETE FROM db_script_string WHERE entry IN (2000000090,2000000091,2000000092);
INSERT INTO db_script_string (entry, content_default) VALUES (2000000090, 'Here goes nothing...');
INSERT INTO db_script_string (entry, content_default) VALUES (2000000091, 'This shouldn\'t take long...');
INSERT INTO db_script_string (entry, content_default) VALUES (2000000092, 'The invisibility liquor is ready for you, $N.');

DELETE FROM quest_end_scripts WHERE id = 114 AND command IN (0,1,3,35);
INSERT INTO quest_end_scripts (id, delay, command, datalong,comments) VALUES (114, 0, 1, 4,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong, o,comments) VALUES (114, 3, 35, 1, 5.42979,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong,comments) VALUES (114, 4, 1, 2,'');
INSERT INTO quest_end_scripts (id, delay, dataint,comments) VALUES (114, 4, 2000000090,'');
UPDATE quest_end_scripts SET delay=6 WHERE id=114 AND command=15;
INSERT INTO quest_end_scripts (id, delay, command, datalong, o,comments) VALUES (114, 8, 35, 1, 0.76794,'');

DELETE FROM quest_end_scripts WHERE id = 112 AND command IN (0,1,3,29,35);
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2,comments) VALUES (112, 0, 29, 2, 2,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong, o,comments) VALUES (112, 0, 35, 1, 1.52637,'');
INSERT INTO quest_end_scripts (id, delay, dataint,comments) VALUES (112, 1, 2000000091,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong,comments) VALUES (112, 1, 1, 133,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong,comments) VALUES (112, 6, 1, 30,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2,comments) VALUES (112, 6, 29, 2, 1,'');
INSERT INTO quest_end_scripts (id, delay, command, datalong, o,comments) VALUES (112, 6, 35, 1, 2.98451,'');
INSERT INTO quest_end_scripts (id, delay, dataint,comments) VALUES (112, 6, 2000000092,'');
UPDATE quest_template SET CompleteScript=112 WHERE entry=112;

-- The Stone Circle
DELETE FROM npc_text WHERE ID = 13582;
DELETE FROM gossip_menu WHERE entry = 8496;
DELETE FROM conditions WHERE condition_entry = 1098;
INSERT INTO npc_text (ID, text0_0, text0_1) VALUES (13582, 'A large chest arrived for Marvon, but it was so heavy Liv left it by the doorstep.', 'A large chest arrived for Marvon, but it was so heavy Liv left it by the doorstep.');
INSERT INTO conditions (condition_entry, type, value1) VALUES (1098, 9, 3444);
INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES (8496, 6556, 0);
INSERT INTO gossip_menu (entry, text_id, condition_id) VALUES (8496, 13582, 1098);
UPDATE creature_template SET gossip_menu_id=8496 WHERE entry=8496;

-- The Green Hills of Stranglethorn
UPDATE quest_template SET Objectives='Bring pages 18, 20, 21 and 24 of Nesingwary\'s The Green Hills of Stranglethorn to Barnil Stonepot in order to complete Chapter III.' WHERE entry = 341;
