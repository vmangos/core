INSERT INTO `migrations` VALUES ('20170331134352');

-- Add April Fools event
INSERT INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `hardcoded`, `disabled`) VALUES
(77,    '2017-04-01 00:00:00',  '2022-04-03 00:00:00',  1,  999999999,  0,  'April Fools!', 0,  0);

-- Add condition referencing this event
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(83,    12, 77, 0);

