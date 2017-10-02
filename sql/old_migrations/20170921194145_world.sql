INSERT INTO `migrations` VALUES ('20170921194145');

DELETE FROM `game_event` WHERE `entry`=83;
INSERT INTO `game_event` (`entry`, `occurence`, `description`) VALUES
(83, 1, 'AQ Gate');

DELETE FROM `game_event_gameobject` WHERE `event`=83;
INSERT INTO `game_event_gameobject` (`guid`, `event`) VALUES
(3997168, 83), -- GO_AQ_GHOST_GATE        = 180322,
(66334, 83), -- GO_AQ_BARRIER           = 176146,
(66335, 83), -- GO_AQ_GATE_ROOTS        = 176147,
(66336, 83); -- GO_AQ_GATE_RUNES        = 176148,
