INSERT INTO `migrations` VALUES ('20170617085959'); 

-- Quest: Deaths in the Family
-- Should not have a previous quest requirement.
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=354;

-- Quests: Hallowed Scroll, Glyphic Scroll, Encrypted Scroll.
-- Those are the quests that introduce you to your first class trainer in Deathknell.
-- They have the wrong previous quest requirements, they should require The Mindless Ones.
UPDATE `quest_template` SET `PrevQuestId`=364 WHERE `entry` IN (3096, 3097, 3098);

-- Quest: Your Place In The World
-- Should not have a RequestItemsText, currently it has wrong text from another quest.
UPDATE `quest_template` SET `RequestItemsText`='' WHERE `entry`=4641;

-- Quest: Minshina's Skull
-- Fix timing and despawn delay, avoid spawning twice, spawn facing the player, add localized text.
UPDATE `quest_end_scripts` SET `delay`=0, `datalong2`=20000, `data_flags`=2, `dataint2`=2 WHERE `id`=808 && `command`=10;
UPDATE `quest_end_scripts` SET `delay`=2 WHERE `id`=808 && `command`=1;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES (2000000808, 'I thank you, $N. And my brother thanks you.', '$n, 고맙네. 우리 형도 자네에게 고마워하고 있을 거야.', 'Je vous remercie, $N. Et mon frère aussi.', 'Ich danke Euch, $n. Und mein Bruder dankt Euch ebenfalls.', '谢谢你，$n。我的兄弟也很感谢你。', '謝謝你，$n。我的兄弟也很感謝你。', 'Te lo agradezco, $n. Y mi hermano también te da las gracias.', 'Te lo agradezco, $n. Y mi hermano también te da las gracias.', 'Я благодарю тебя, $n. И мой брат тоже благодарит.');

-- Quest: The Prodigal Lich Returns
-- Remove quest giver flag when starting RP event.
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (411, 0, 29, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Prodigal Lich Returns - Remove quest giver flag');
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (411, 26, 29, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'The Prodigal Lich Returns - Add quest giver flag');

-- NPC: Nazgrel
-- Add missing equipment. He should have an axe on his back.
INSERT INTO `creature_equip_template` VALUES (3230, 14870, 0, 0);
UPDATE `creature_template` SET `equipment_id`=3230 WHERE `entry`=3230;
UPDATE `creature_template_addon` SET `b2_0_sheath`=0 WHERE `entry`=3230;

-- NPCs: Kor'kron Elite and Deathguard Elite
-- They are not actually supposed to be elite.
UPDATE `creature_template` SET `rank`=0 WHERE `entry` IN (7980, 14304);

-- Quest: Find the Gems
-- Fix typo in text. (by bdebaere)
UPDATE `quest_template` SET `RequestItemsText`='Talvash\'s image comes into focus from the waters of the scrying bowl.$b$b"Wow, you\'re still alive! Did you manage to find the gems? Are you truly the savior of my reputation I have hoped for? Please tell me you didn\'t waste a charge on the phial just to chat; those things are NOT cheap, and I\'m already in dire financial straits.' WHERE `entry`=2201;
