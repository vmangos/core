INSERT INTO `migrations` VALUES ('20170817062154'); 

-- Fix relations for Vargus quests.
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8548);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8572);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8573);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8574);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8783);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8800);
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (15176, 8809);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (15176, 8548);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (15176, 8572);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (15176, 8573);
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (15176, 8574);
