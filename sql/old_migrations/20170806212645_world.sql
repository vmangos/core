INSERT INTO `migrations` VALUES ('20170806212645'); 

-- Strings for command ".account set locked"
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (1170, 'Locked field of Account %s (id %u) changed to %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (1171, 'Incorrect parameters. Usage:\r\n.account set locked <accountname> <value>\r\nLock types: 0 None, 1 IP, 2 PIN, 4 TOTP, 8 Enforce', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
