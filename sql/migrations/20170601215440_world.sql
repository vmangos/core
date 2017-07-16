INSERT INTO `migrations` VALUES ('20170601215440');

-- dungeons summuning ritual spells trigger events
-- uldaman
INSERT INTO `scripted_event_id` (`id`, `ScriptName`) VALUES ('2228', 'event_awaken_stone_keeper');
INSERT INTO `scripted_event_id` (`id`, `ScriptName`) VALUES ('2268', 'event_awaken_archaedas');
-- ubrs
INSERT INTO `scripted_event_id` (`id`, `ScriptName`) VALUES ('4884', 'event_free_pyroguard_emberseer');

-- trigger spell
-- blackrock altar
UPDATE `gameobject_template` SET `data1`='16533' WHERE `entry`='175706';
-- visual spell
-- ritual of doom
UPDATE `gameobject_template` SET `data2`='18540' WHERE `entry`='177193';
-- ritual of summoning
UPDATE `gameobject_template` SET `data2`='698' WHERE `entry`='36727';

-- av summoning rituals must be persistent, despawn by script
UPDATE `gameobject_template` SET `data3`='1' WHERE `entry`='178465';
UPDATE `gameobject_template` SET `data3`='1' WHERE `entry`='178670';

-- av summoning rituals secondary spell value must be none
UPDATE `gameobject_template` SET `data4`='0' WHERE `entry`='178465';
UPDATE `gameobject_template` SET `data4`='0' WHERE `entry`='178670';

