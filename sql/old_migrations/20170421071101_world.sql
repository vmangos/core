INSERT INTO `migrations` VALUES ('20170421071101'); 

-- Fix 'Long Forgotten Memories' quest flag
UPDATE quest_template Set SpecialFlags = 0 WHERE entry = 8305;

-- Fix 'A Pawn on the Eternal Board' typos
UPDATE `script_texts` SET `content_default`='Let them feel the wrath of the Blue Flight! May Malygos protect me!' WHERE `entry`='-1000762';
UPDATE `script_texts` SET `content_default`='I want nothing to do with Silithus, the Qiraji and least of all, any damned dragons!' WHERE `entry`='-1000777';
UPDATE `script_texts` SET `content_default`='Before I leave this place, I make one final offering for you, Lord Staghelm. Should a time arise in which you must gain entry to this accursed fortress, use the Scepter of the Shifting Sands on the sacred gong. The magic holding the barrier together will dissipate an the horrors of the Ahn\'Qiraj will be unleashed upon the world once more.' WHERE `entry`='-1000774';