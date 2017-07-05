INSERT INTO `migrations` VALUES ('20170609115510');

-- Fix quest "Vorsha the Lasher" typo
UPDATE `script_texts` SET `content_default` = "This will be a tough fight, $n. Follow me closely." WHERE `entry` = -1000502;
