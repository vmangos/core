INSERT INTO `migrations` VALUES ('20170811162753'); 

-- Edit texts for ticket system.
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2052, '|cff00ff00New ticket from|r|cffff00ff %s.|r |cff00ff00Category:|r|cffff00ff %s.|r |cff00ff00Ticket entry:|r|cffff00ff %d.|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2053, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00edited their ticket. Ticket entry:|r|cffff00ff %d.|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2002, '|cff00ff00Character|r|cffff00ff %s |r|cff00ff00abandoned their ticket. Ticket entry:|r|cffff00ff %d.|r', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
