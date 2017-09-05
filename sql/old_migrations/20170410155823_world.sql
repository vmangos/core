INSERT INTO `migrations` VALUES ('20170410155823');

-- Fix Mottled Screecher emote
update creature_ai_texts set content_default = '%s lets out a high pitched screech, calling for help!' where entry = -100; 
