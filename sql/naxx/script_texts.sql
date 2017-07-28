
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
-1533158
);

INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533134,'A Guardian of Icecrown enters the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_GUARDIAN');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533135,'%s strikes!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'kelthuzad EMOTE_PHASE2');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533136,'%s teleports and begins to channel a spell!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_TELEPORT');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533137,'%s rushes to attack once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'heigan EMOTE_RETURN');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533138,'%s teleports into the fray!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_TO_FRAY');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533139,'The central gate opens!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gothik EMOTE_GATE');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533140,'Brazenly you have disregarded powers beyond your understanding.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_2');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533141,'You have fought hard to invade the realm of the harvester.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_3');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533142,'Now there is only one way out - to walk the lonely path of the damned.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'gothik SAY_SPEECH_4');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533143,'An aura of necrotic energy blocks all healing!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_BLOCKING');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533144,'The power of Necrotic Aura begins to wane!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_WANE');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533145,'The aura fades away, allowing healing once more!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'Loatheb EMOTE_AURA_FADING');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533146,'%s spins her web into a cocoon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIN_WEB');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533147,'Spiderlings appear on the web!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPIDERLING');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533148,'%s sprays strands of web everywhere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'maexxna EMOTE_SPRAY');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533149,'%s loses its link!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_LOSING_LINK');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533150,'%s overloads!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'tesla_coil EMOTE_TESLA_OVERLOAD');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533151,'The polarity has shifted!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'thaddius EMOTE_POLARITY_SHIFT');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533152,'%s decimates all nearby flesh!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'gluth EMOTE_DECIMATE');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533153,'A %s joins the fight!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'crypt_guard EMOTE_CRYPT_GUARD');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533154,'%s begins to unleash an insect swarm!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_INSECT_SWARM');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533155,'Corpse Scarabs appear from a Crypt Guard\'s corpse!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'anubrekhan EMOTE_CORPSE_SCARABS');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533156,'%s casts Unyielding Pain on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'lady_blaumeux EMOTE_UNYIELDING_PAIN');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533157,'%s casts Condemation on everyone!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'sir_zeliek EMOTE_CONDEMATION');
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES (-1533158,'%s injects you with a mutagen!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,5,0,0,'grobbulus EMOTE_INJECTION');


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
UPDATE `script_texts` SET `content_default`='Invaders! Cease this foolish venture at once! Turn away while you still can!' WHERE `entry`='-1533059';
UPDATE `script_texts` SET `content_default`='I\'ve heard about enough a\' yer snivelin\'. Shut your flytrap before I shut it for ye\'!' WHERE `entry`='-1533053';

