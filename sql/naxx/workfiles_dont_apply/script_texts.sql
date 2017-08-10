
/*
script_texts found in scriptdev2 which are missing in our database.
*/
DELETE FROM `script_texts` WHERE entry in(
-1533134,
-1533135,
-1533136,
-1533137,
-1533138,
-1533139,
-1533140,
-1533141,
-1533142,
-1533143,
-1533144,
-1533145,
-1533146,
-1533147,
-1533148,
-1533149,
-1533150,
-1533151,
-1533152,
-1533153,
-1533154,
-1533155,
-1533156,
-1533157,
-1533158,
-1533159
);

INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES 
(-1533134,'A Guardian of Icecrown enters the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_GUARDIAN'),
(-1533135,'%s strikes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_PHASE2'),
(-1533136,'%s teleports and begins to channel a spell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_TELEPORT'),
(-1533137,'%s rushes to attack once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_RETURN'),
(-1533138,'%s teleports into the fray!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_TO_FRAY'),
(-1533139,'The central gate opens!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_GATE'),
(-1533140,'Brazenly you have disregarded powers beyond your understanding.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_2'),
(-1533141,'You have fought hard to invade the realm of the harvester.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_3'),
(-1533142,'Now there is only one way out - to walk the lonely path of the damned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_4'),
(-1533143,'An aura of necrotic energy blocks all healing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_BLOCKING'),
(-1533144,'The power of Necrotic Aura begins to wane!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_WANE'),
(-1533145,'The aura fades away, allowing healing once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_FADING'),
(-1533146,'%s spins her web into a cocoon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIN_WEB'),
(-1533147,'Spiderlings appear on the web!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIDERLING'),
(-1533148,'%s sprays strands of web everywhere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPRAY'),
(-1533149,'%s loses its link!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_LOSING_LINK'),
(-1533150,'%s overloads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_TESLA_OVERLOAD'),
(-1533151,'The polarity has shifted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'thaddius EMOTE_POLARITY_SHIFT'),
(-1533152,'%s decimates all nearby flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gluth EMOTE_DECIMATE'),
(-1533153,'A %s joins the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'crypt_guard EMOTE_CRYPT_GUARD'),
(-1533154,'%s begins to unleash an insect swarm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_INSECT_SWARM'),
(-1533155,'Corpse Scarabs appear from a Crypt Guard\'s corpse!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_CORPSE_SCARABS'),
(-1533156,'%s casts Unyielding Pain on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'lady_blaumeux EMOTE_UNYIELDING_PAIN'),
(-1533157,'%s casts Condemation on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'sir_zeliek EMOTE_CONDEMATION'),
(-1533158,'%s injects you with a mutagen!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,0,0,'grobbulus EMOTE_INJECTION'),

(-1533159,'%s lets loose a triumphant shout.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'razuvious EMOTE_SHOUT');


-- KT taunts and cat dead should be zone-yells
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533091';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533092';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533089';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533090';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533093';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533093';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533039';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533038';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533037';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533036';

-- dialogue between LK and KT must be zone-yells
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533084';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533085';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533086';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533087';
UPDATE `script_texts` SET `type`='6' WHERE `entry`='-1533088';

-- fix incorrect sound ids
UPDATE `script_texts` SET `sound`='8822' WHERE `entry`='-1533092';
UPDATE `script_texts` SET `sound`='8823' WHERE `entry`='-1533093';

-- 4hm intro RP must be type zone-yells
UPDATE `script_texts` set type = 6 where entry in (-1533059, -1533045, -1533071, -1533046, -1533060, -1533053, -1533072);

-- DK wing intro RP must be zone-yells
UPDATE `script_texts` set type = 6 where entry in (-1533052, -1533061, -1533073, -1533047);

UPDATE `script_texts` SET `content_default`='Invaders! Cease this foolish venture at once! Turn away while you still can!' WHERE `entry`='-1533059';
UPDATE `script_texts` SET `content_default`='I\'ve heard about enough a\' yer snivelin\'. Shut your flytrap before I shut it for ye\'!' WHERE `entry`='-1533053';

-- https://youtu.be/VrykhhdPfc4?t=7m33s
UPDATE `script_texts` SET `content_default`='Sto-o-op! Make it stop!!' WHERE `entry`='-1533037';

-- all the in-combat script_texts for 4hm encounter are of type say
UPDATE `script_texts` SET `type`='0' WHERE `entry` in (
-1533056, 
-1533055, 
-1533070, 
-1533063, 
-1533048, 
-1533062, 
-1533049, 
-1533064, 
-1533057,
-1533069,
-1533068,
-1533067,
-1533066,
-1533065,
-1533058,
-1533054,
-1533051,
-1533050,
-1533044,
-1533074);

-- misc typo fixes for 4hm
UPDATE `script_texts` SET `content_default`='Forgive me.' WHERE `entry`='-1533063';
UPDATE `script_texts` SET `content_default`='Bow to the might of the Highlord!' WHERE `entry`='-1533070';
UPDATE `script_texts` SET `content_default`='I have no choice but to obey!' WHERE `entry`='-1533062';