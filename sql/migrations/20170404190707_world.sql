INSERT INTO `migrations` VALUES ('20170404190707');

-- Add Player's Gossip Options
INSERT INTO `gossip_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES
(-3100013,  'How did you know? I mean, yes... Yes, I am looking for that shard. Do you have it?',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100014,  'Alright. Where?',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100015,  'By Bronzebeard\'s... um, beard! What are you talking about?',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100016,  'Fish? You gave a piece of what could be the key to saving all life on Kalimdor to a fish?',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100017,  'A minnow? The oceans are filled with minnows! There could be a hundred million million minnows out there!',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100018,  '...',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100019,  'You put the piece on a minnow and placed the minnow somewhere in the waters of the sea between here and the Eastern Kingdoms? And this minnow has special powers?',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100020,  'You\'re insane.',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100021,  'I\'m all ears.',   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100022,  'Come again.',  NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100023,  'Ok, let me get this straight. You put the scepter entrusted to your Flight by Anachronos, on a minnow of your own making, and now you expect me to build an... an arcanite buoy or something... to force your minnow out of hiding? AND potentially incur the wrath of an Elemental Lord? Did I miss anything? Perhaps I am to do this without any clothes on, during a solar eclipse, on a leap year?', NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100024,  'FINE! And how, dare I ask, am I supposed to acquire an arcanite buoy?',    NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL),
(-3100025,  'But...',   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL);

-- Add new Script Text for dialogue end
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-1000006,  'I said GOOD DAY!', NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   NULL,   0,  0,  0,  0,  'Azuregos is done talking to the player');

-- Set Spirit of Azuregos to Azuregos' AI (for dialogue handling)
UPDATE `creature_template` SET `ScriptName` = 'boss_azuregos' WHERE `entry` = 15481;

-- Allow players to accept Azuregos' Magical Ledger at neutral rep
UPDATE `quest_template` SET `RequiredMinRepValue` = 0 WHERE `entry` = 8575;