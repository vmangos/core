INSERT INTO `migrations` VALUES ('20170830192438');

INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES (1030, "Active object: %d. Visibility Modifier: %0.2f");

ALTER TABLE `creature` ADD COLUMN `visibilitymod` float DEFAULT 0;
ALTER TABLE `gameobject` ADD COLUMN `visibilitymod` float DEFAULT 0;
