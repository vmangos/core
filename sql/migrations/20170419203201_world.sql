INSERT INTO `migrations` VALUES ('20170419203201');

-- Make "Bang a Gong!" obtainable at neutral rep
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` = 8743;

-- Make "Treasure of the Timeless One" obtainable at neutral rep
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` = 8745;

-- Add Scarab Gong script
UPDATE `gameobject_template` SET `ScriptName` = "go_scarab_gong" WHERE `entry` = 180718;

INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1000007,  '%s, Champion of the Bronze Dragonflight, has rung the Scarab Gong. The ancient gates of Ahn\'Qiraj open, revealing the horrors of a forgotten war...', NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  2,  0,  0,  NULL),
(-1000008,  'Massive Qiraji resonating crystals break through the earthen crust of Kalimdor. Colossal creatures made of obsidian stone breach the freshly broken land.',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  0,  0,  0,  NULL),
(-1000009,  'Colossus of Ashi breaks free of its cocoon beneath Hive\'Ashi.',   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  0,  0,  0,  NULL),
(-1000017,  'Colossus of Zora casts its massive shadow upon the whole of Silithus.',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  3,  0,  0,  NULL),
(-1000016,  'Colossus of Regal hears the call to battle and rises to serve its master.',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  3,  0,  0,  NULL);

-- Add DB variable holding awarded Black Qiraji Resonating Crystals
INSERT INTO `variables` (`index`, `value`) VALUES (1, 0);

-- Tie Anachronos to Patch 1.9 event
INSERT INTO `game_event_creature` VALUES (23098, 166);


