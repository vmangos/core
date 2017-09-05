INSERT INTO `migrations` VALUES ('20170615091820');

-- Raene Wolfrunner gossip (2 possible, depending on which part of the questline a player is on)

INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (400, 8 , 1029 , 0 );
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (401, -3 , 400 , 0 );

INSERT INTO `gossip_menu` VALUES (50500, 6555 , 400);
INSERT INTO `gossip_menu` VALUES (50500, 6553, 401);

UPDATE creature_template SET gossip_menu_id = 50500  WHERE entry = 3691;
