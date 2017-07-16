INSERT INTO `migrations` VALUES ('20170621131230');

-- Fix npcflag for NPC "Otho Moji'ko"
UPDATE `creature_template` SET `npcflag` = 4 WHERE `entry` = 14738;

-- Fix npcflag for NPC "Huntsman Markhor"
UPDATE `creature_template` SET `npcflag` = 8195 WHERE `entry` = 14741;
