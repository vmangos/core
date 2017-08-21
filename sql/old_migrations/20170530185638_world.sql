INSERT INTO `migrations` VALUES ('20170530185638'); 

-- Hourly Bells
UPDATE `gameobject_template` SET `ScriptName`='go_bells' WHERE `entry` IN (175885, 176573);
DELETE FROM `game_event` WHERE `entry`=78;
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES
(78, '2010-01-01 01:00:00', '2025-01-01 01:00:00', 60, 1, 0, 'Hourly Bells', 0, 0);

DELETE FROM `game_event_gameobject` WHERE `event`=78;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(49811, 78),
(48107, 78),
(42924, 78),
(42906, 78),
(42905, 78),
(42666, 78),
(26743, 78),
(26469, 78),
(26435, 78),
(26426, 78),
(26414, 78),
(26283, 78),
(18906, 78),
(18901, 78),
(14562, 78),
(9104, 78),
(9114, 78),
(20801, 78),
(6867, 78),
(4841, 78),
(1140, 78),
(870, 78),
(619, 78),
(94, 78),
(45022, 78),
(12435, 78),
(12436, 78),
(12437, 78),
(12438, 78),
(12439, 78),
(15508, 78),
(18097, 78),
(18098, 78),
(18099, 78),
(18100, 78),
(18101, 78),
(18102, 78),
(18103, 78),
(20802, 78);
