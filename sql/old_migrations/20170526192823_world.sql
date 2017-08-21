INSERT INTO `migrations` VALUES ('20170526192823');

-- a gameobject can be in more than one battleground event
ALTER TABLE `gameobject_battleground`
DROP PRIMARY KEY, 
ADD PRIMARY KEY (`guid`, `event1`, `event2`);

-- add "Neutral Banner Aura" id=180102 to horde contested banner event
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES ('90020', '0', '2');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES ('90028', '1', '2');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES ('90036', '2', '2');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES ('90044', '3', '2');
INSERT INTO `gameobject_battleground` (`guid`, `event1`, `event2`) VALUES ('90052', '4', '2');
